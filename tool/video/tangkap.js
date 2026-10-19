// Tangkap skrin versi web app (Pixel 7) untuk video promosi.
// Guna: node tool/video/tangkap.js http://localhost:8080 out/
const { chromium, devices } = require('playwright');
const fs = require('fs');

const base = process.argv[2] || 'http://localhost:8080';
const out = process.argv[3] || 'shots';
fs.mkdirSync(out, { recursive: true });

// [nama fail, ?s=, tindakan tambahan]
const shots = [
  ['s01-home', 'home'],
  ['s02-home-islam', 'home', async (p) => { await p.mouse.move(206, 500); for (let i = 0; i < 6; i++) { await p.mouse.wheel(0, 260); await p.waitForTimeout(250); } }],
  ['s03-hijaiyah', 'hijaiyah'],
  ['s04-surah', 'surah'],
  ['s05-asmaul', 'asmaul'],
  ['s06-abc', 'abc'],
  ['s07-animals', 'animals'],
  ['s08-games', 'games'],
  ['s09-memory', 'memory'],
  ['s10-bubbles', 'bubbles'],
  ['s11-lullaby', 'lullaby'],
  ['s12-review', 'review'],
  ['s13-review-jawab', 'review', async (p) => { await p.mouse.click(206, 400); await p.waitForTimeout(1500); }],
  ['s14-insights', 'insights'],
];

(async () => {
  const browser = await chromium.launch();
  const ctx = await browser.newContext({
    ...devices['Pixel 7'],
    viewport: { width: 412, height: 839 },
    locale: 'ms-MY',
    serviceWorkers: 'block',
  });
  // Muat sekali dahulu supaya data contoh disimpan (localStorage).
  const warm = await ctx.newPage();
  await warm.goto(`${base}/?s=insights`, { waitUntil: 'networkidle' });
  await warm.waitForTimeout(8000);
  await warm.close();

  for (const [name, s, act] of shots) {
    const page = await ctx.newPage();
    await page.goto(`${base}/?s=${s}`, { waitUntil: 'networkidle' });
    await page.waitForTimeout(6000); // fon emoji/Arab & animasi
    if (act) { await act(page); await page.waitForTimeout(2500); }
    await page.screenshot({ path: `${out}/${name}.png` });
    console.log('ok', name);
    await page.close();
  }
  await browser.close();
})();
