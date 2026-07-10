<!DOCTYPE html>
<html lang="ms">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Laporan Analisis BE2026 – Unit Harga-Harga</title>
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&family=DM+Mono:wght@400;500&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
<style>
:root{--navy:#0a1628;--navy2:#0f2044;--blue:#1a4fad;--blue2:#2563eb;--accent:#38bdf8;--teal:#0ea5e9;--gold:#f59e0b;--green:#10b981;--red:#ef4444;--purple:#8b5cf6;--cyan:#06b6d4;--bg:#e8eef7;--card:#fff;--border:#d7e0ee;--text:#1e2d4a;--muted:#64748b;--font:'Plus Jakarta Sans',sans-serif;--mono:'DM Mono',monospace}
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0}
body{font-family:var(--font);background:linear-gradient(180deg,#eef3fa 0%,#dde6f3 100%);color:var(--text);padding:16px 0;-webkit-print-color-adjust:exact;print-color-adjust:exact}

/* CONTROL BAR */
.bar{position:sticky;top:0;z-index:60;background:linear-gradient(135deg,#0a1628,#15264a);color:#fff;padding:10px 18px;display:flex;gap:9px;align-items:center;flex-wrap:wrap;margin:-16px 0 18px;box-shadow:0 3px 18px rgba(10,22,40,.25)}
.bar .t{font-weight:800;letter-spacing:.03em;font-size:.92rem;margin-right:6px}
.bar label{font-size:.66rem;font-weight:700;color:#9fb2d4;text-transform:uppercase;letter-spacing:.05em;margin-left:6px}
.bar select{border:1px solid #2a3c63;border-radius:7px;padding:5px 9px;font-size:.76rem;font-family:var(--font);background:#16264a;color:#fff;cursor:pointer}
.bar input{border:1px solid #2a3c63;border-radius:7px;padding:5px 10px;font-size:.72rem;font-family:var(--mono);background:#16264a;color:#fff;width:180px;max-width:46vw}
.bar .sp{flex:1}
.btn{background:var(--blue2);color:#fff;border:none;border-radius:7px;padding:6px 13px;font-size:.77rem;font-weight:700;cursor:pointer;text-decoration:none;display:inline-block}
.btn:hover{background:#1a4fad}.btn.alt{background:linear-gradient(135deg,#38bdf8,#0ea5e9)}.btn.gh{background:transparent;border:1px solid #2a3c63;color:#cdd8ec}

/* PAGE (landscape A4) */
.page{width:min(297mm,100%);min-height:200mm;background:var(--card);margin:0 auto 20px;padding:14mm 14mm 12mm;box-shadow:0 8px 36px rgba(10,22,40,.16);position:relative;display:flex;flex-direction:column;border-radius:4px;overflow:hidden}
.page::before{content:'';position:absolute;top:0;left:0;right:0;height:6px;background:linear-gradient(90deg,#2563eb,#38bdf8,#06b6d4)}
.rpt-head{display:flex;justify-content:space-between;align-items:center;border-bottom:2px solid #e6ebf4;padding-bottom:12px;margin-bottom:16px;margin-top:4px}
.rpt-head .badge{width:44px;height:44px;background:linear-gradient(135deg,#2563eb,#38bdf8);border-radius:11px;display:flex;align-items:center;justify-content:center;font-size:20px;margin-right:13px;flex-shrink:0}
.rpt-head .l{display:flex;align-items:center}
.rpt-head .l h1{font-size:1.12rem;font-weight:800;color:var(--navy2);line-height:1.18}
.rpt-head .l p{font-size:.72rem;color:var(--muted);margin-top:3px;letter-spacing:.02em}
.rpt-head .r{text-align:right;font-size:.7rem;color:var(--muted)}
.rpt-head .r .tag{display:inline-block;background:var(--navy2);color:#fff;border-radius:14px;padding:3px 12px;font-size:.68rem;font-weight:700;letter-spacing:.04em;margin-bottom:5px}
.rpt-head .r .scope{font-family:var(--mono);color:var(--blue2);font-weight:600}
.sec-h{font-size:.92rem;font-weight:800;color:var(--navy2);text-transform:uppercase;letter-spacing:.04em;margin:8px 0 12px;padding:7px 0 7px 12px;border-left:5px solid var(--blue2);background:linear-gradient(90deg,#f2f6fd,transparent)}
.sec-h small{font-weight:500;color:var(--muted);text-transform:none;letter-spacing:0;font-size:.72rem}
.note{font-size:.7rem;color:var(--muted);margin:12px 0 0;line-height:1.6;background:#f7f9fd;border-left:3px solid #cbd5e1;padding:8px 12px;border-radius:0 6px 6px 0}
.grow{flex:1}
.foot{margin-top:14px;border-top:1px solid #e6ebf4;padding-top:7px;display:flex;justify-content:space-between;font-size:.66rem;color:var(--muted)}

/* STAT TILES */
.sgrid{display:grid;grid-template-columns:repeat(4,1fr);gap:13px}
.sc{background:#fff;border:1px solid var(--border);border-radius:12px;padding:14px 15px;position:relative;overflow:hidden;box-shadow:0 1px 8px rgba(10,22,40,.05)}
.sc::after{content:'';position:absolute;top:0;left:0;bottom:0;width:4px;background:var(--blue2)}
.sc.g::after{background:var(--green)}.sc.gd::after{background:var(--gold)}.sc.r::after{background:var(--red)}.sc.p::after{background:var(--purple)}.sc.c::after{background:var(--cyan)}.sc.a::after{background:var(--accent)}.sc.n::after{background:var(--navy2)}
.sc .ic{position:absolute;right:12px;top:11px;font-size:1.3rem;opacity:.14}
.sc .lab{font-size:.64rem;font-weight:700;color:var(--muted);text-transform:uppercase;letter-spacing:.04em;margin-bottom:6px;padding-left:6px}
.sc .val{font-family:var(--mono);font-size:1.5rem;font-weight:500;color:var(--navy);padding-left:6px}
.sc .s{font-size:.64rem;color:var(--muted);margin-top:4px;padding-left:6px}
.sc .s b{color:var(--text)}

/* TABLE */
.tw{overflow-x:auto;border-radius:9px;border:1px solid #e6ebf4;box-shadow:0 1px 8px rgba(10,22,40,.05)}
table.rt{width:100%;border-collapse:collapse;font-size:.72rem}
table.rt th{background:linear-gradient(135deg,#0f2044,#1d3460);color:#fff;font-weight:700;padding:8px 8px;text-align:center;font-size:.63rem;letter-spacing:.02em;text-transform:uppercase;line-height:1.25}
table.rt th.l,table.rt td.l{text-align:left}
table.rt td{padding:6px 8px;border-bottom:1px solid #eef2f8;text-align:right;font-family:var(--mono);white-space:nowrap}
table.rt td.l{font-family:var(--font);white-space:normal}
table.rt tbody tr:nth-child(even) td{background:#f7f9fd}
table.rt tbody tr:hover td{background:#eef4ff}
table.rt tr.tot td{background:#dde8fb;font-weight:800;color:var(--navy2);border-top:2px solid var(--navy2)}
table.rt .hl{background:#2563eb!important;color:#fff;font-weight:700}
.rkno{display:inline-flex;align-items:center;justify-content:center;width:22px;height:22px;border-radius:50%;background:#e2e8f0;color:#334155;font-weight:800;font-size:.66rem;font-family:var(--font)}
.pg{background:#dcfce7!important;color:#166534;font-weight:700}.pa{background:#fef9c3!important;color:#854d0e;font-weight:700}.pr{background:#fee2e2!important;color:#991b1b;font-weight:700}

/* PODIUM */
.podium{display:flex;align-items:flex-end;justify-content:center;gap:14px;margin:6px 0 18px}
.pod{flex:1;max-width:230px;border-radius:13px;padding:16px 14px;text-align:center;color:#fff;position:relative;box-shadow:0 6px 20px rgba(10,22,40,.15)}
.pod .crown{font-size:1.5rem}
.pod .nm{font-weight:800;font-size:.92rem;margin:6px 0 2px;letter-spacing:.01em}
.pod .pen{font-size:.66rem;opacity:.85;margin-bottom:9px}
.pod .num{font-family:var(--mono);font-size:1.7rem;font-weight:600;line-height:1}
.pod .cap{font-size:.66rem;opacity:.9;margin-top:3px}
.pod.p1{background:linear-gradient(135deg,#f59e0b,#fbbf24);padding-top:24px;padding-bottom:26px}
.pod.p2{background:linear-gradient(135deg,#64748b,#94a3b8)}
.pod.p3{background:linear-gradient(135deg,#b45309,#d97706)}

.charts2{display:grid;grid-template-columns:1.4fr 1fr;gap:18px;align-items:start}
.chart-box{height:230px}
.cw{background:#fff;border:1px solid #e6ebf4;border-radius:11px;padding:14px 16px;box-shadow:0 1px 8px rgba(10,22,40,.05)}
.cw h4{font-size:.74rem;font-weight:700;color:var(--navy2);text-transform:uppercase;letter-spacing:.04em;margin-bottom:10px}

#load{position:fixed;inset:0;background:rgba(10,22,40,.74);display:flex;align-items:center;justify-content:center;z-index:9999;color:#fff;font-size:.9rem;flex-direction:column;gap:14px}
.spn{width:42px;height:42px;border:4px solid rgba(255,255,255,.2);border-top-color:var(--accent);border-radius:50%;animation:spin .8s linear infinite}
@keyframes spin{to{transform:rotate(360deg)}}
#err{display:none;max-width:760px;margin:30px auto;background:#fff5f5;border:1px solid #fed7d7;color:#9b2c2c;border-radius:12px;padding:18px 22px;font-size:.85rem}

@media print{
  body{background:#fff;padding:0}.bar{display:none}
  .page{box-shadow:none;margin:0;width:auto;min-height:auto;padding:10mm;break-after:page;border-radius:0}
  .page:last-child{break-after:auto}
  .sc,.cw,.tw,.pod{box-shadow:none}
}
@page{size:A4 landscape;margin:7mm}
@media(max-width:820px){.sgrid{grid-template-columns:repeat(2,1fr)}.page{padding:14px}.charts2{grid-template-columns:1fr}.podium{flex-direction:column;align-items:stretch}.pod{max-width:none}}
</style>
</head>
<body>

<div id="load"><div class="spn"></div><div>Memuatkan data BE2026...</div></div>

<div class="bar">
  <span class="t">📊 LAPORAN ANALISIS BE2026</span>
  <label>Fasa</label><select id="f-fasa" onchange="render()"><option value="">Semua</option><option value="2">Fasa 2</option><option value="3">Fasa 3</option></select>
  <label>Survei</label><select id="f-survei" onchange="render()"><option value="">Semua</option><option value="Hartanah">Hartanah</option><option value="Runcit">Runcit</option></select>
  <label>Daerah</label><select id="f-daerah" onchange="render()"><option value="">Semua</option></select>
  <label>Penyelia</label><select id="f-pen" onchange="render()"><option value="">Semua</option></select>
  <label>Sasaran MKO%</label><input type="number" id="f-target" value="45" min="0" max="100" step="1" onchange="render()" style="width:62px;font-family:var(--font);text-align:center">
  <span class="sp"></span>
  <button class="btn alt" onclick="window.print()">🖨️ Simpan PDF</button>
  <a href="index.html" class="btn gh">← Dashboard</a>
  <a href="fe_tracker_details.html" class="btn gh">🔎 FE Tracker</a>
  <a href="borang_f2_tracker.html" class="btn gh">📍 Borang &amp; F2 Tracker</a>
  <input type="text" id="url" placeholder="URL CSV ..."><button class="btn" onclick="loadData()">⟳ Muat</button><button class="btn gh" onclick="loadDemo()">Demo</button>
</div>

<div id="report"></div>
<div id="err">⚠️ Tiada data. Pastikan URL CSV sah &amp; helaian "Publish to web", atau klik <b>Demo</b>.</div>

<script>
const COL={FASA:0,NO_SIRI:1,PENYELIA:2,FE:3,L_KAWALAN:11,M_BATCHING:12,N_NO_BATCH:13,O_PROSESAN:14,P_RESP:15,Q_REKOD:16,DAERAH:29,PMKS:39,AP_SURVEI:41};
const DEFAULT_URL='https://docs.google.com/spreadsheets/d/e/2PACX-1vSUeV4tfzv1ErhjT3e3o7P1lRO42zXMBb76TBHmUDe7lFHqS313TRIxol6nboeQIqYBsxo4FQrBdP8u/pub?gid=998975185&single=true&output=csv';
const NPAGE=6;
let rawRows=[],curRows=[],charts={};

const fmt=n=>(n==null||isNaN(n))?'0':Number(n).toLocaleString('ms-MY');
const rm=n=>'RM '+fmt(Math.round(n));
const pct=(a,b)=>b?Math.round(a/b*100):0;
const pct1=(a,b)=>b?(Math.round(a/b*1000)/10):0;
function feName(r){return String(r[COL.FE]||'').trim()||'Tidak Dikenali';}
function penName(r){return String(r[COL.PENYELIA]||'').trim()||'(Tiada)';}
function fasaOf(r){const v=String(r[COL.FASA]||'');if(/fasa\s*2/i.test(v))return '2';if(/fasa\s*3/i.test(v))return '3';return v.trim()||'(lain)';}
function surveiOf(r){const m=String(r[COL.AP_SURVEI]||'').match(/(\d{3})/);const c=m?m[1]:'';return c==='308'?'Hartanah':c==='337'?'Runcit':'(Lain)';}
function daerahOf(r){return String(r[COL.DAERAH]||'').trim()||'(Tiada)';}
function pmksOf(r){return String(r[COL.PMKS]||'').trim()||'(Tiada)';}
function rcode(r){const m=String(r[COL.P_RESP]||'').match(/^\s*(\d+)/);return m?parseInt(m[1],10):null;}
function rgroup(r){const c=rcode(r);if(c===null)return 'belum';if(c===11)return 'k11';if(c===50)return 'k50';if(c>=12&&c<=60)return 'lk';return 'kodb';}
function rekodOf(r){return String(r[COL.Q_REKOD]||'').trim();}
const MONTHS={jan:0,feb:1,mar:2,apr:3,may:4,jun:5,jul:6,aug:7,sep:8,oct:9,nov:10,dec:11,mac:2,mei:4,ogo:7,ogos:7,dis:11};
function pd(s){if(!s)return null;s=String(s).trim();if(!s)return null;let m=s.match(/^(\d{1,2})[-\/ ]([A-Za-z]{3,})[-\/ ](\d{2,4})$/);if(m){const d=+m[1],mo=MONTHS[m[2].slice(0,3).toLowerCase()];let y=+m[3];if(y<100)y+=2000;if(mo!=null)return new Date(y,mo,d);}m=s.match(/^(\d{1,2})[\/-](\d{1,2})[\/-](\d{2,4})$/);if(m){let y=+m[3];if(y<100)y+=2000;return new Date(y,+m[2]-1,+m[1]);}const d=new Date(s);return isNaN(d)?null:d;}
function hasD(r,c){return pd(r[c])!==null;}
function num(v){if(v==null)return null;const s=String(v).replace(/[^0-9.\-]/g,'');if(s===''||s==='-'||s==='.')return null;const n=parseFloat(s);return isNaN(n)?null:n;}
function siapOf(o){return o.k11+o.k50+o.lk+o.kodb;}

function parseCSV(text){const rows=[];let row=[],cur='',q=false;for(let i=0;i<text.length;i++){const c=text[i];if(q){if(c==='"'){if(text[i+1]==='"'){cur+='"';i++;}else q=false;}else cur+=c;}else{if(c==='"')q=true;else if(c===',')row.push(cur),cur='';else if(c==='\n')row.push(cur),rows.push(row),row=[],cur='';else if(c==='\r'){}else cur+=c;}}if(cur!==''||row.length){row.push(cur);rows.push(row);}return rows.slice(1).filter(r=>r.length>5&&r.some(x=>x&&x.trim()));}

async function loadData(){const url=document.getElementById('url').value.trim();if(!url){alert('Masukkan URL CSV.');return;}showLoad(true);try{const res=await fetch(url);if(!res.ok)throw 0;const rows=parseCSV(await res.text());if(!rows.length)throw 0;initData(rows);}catch(e){showLoad(false);document.getElementById('err').style.display='block';document.getElementById('report').innerHTML='';}}
function loadDemo(){showLoad(true);setTimeout(()=>initData(genDemo()),350);}
function showLoad(v){document.getElementById('load').style.display=v?'flex':'none';}
function fillSel(id,vals){document.getElementById(id).innerHTML='<option value="">Semua</option>'+vals.map(p=>`<option>${p}</option>`).join('');}
function initData(rows){rawRows=rows;fillSel('f-pen',[...new Set(rows.map(penName))].sort());fillSel('f-daerah',[...new Set(rows.map(daerahOf))].sort());document.getElementById('err').style.display='none';render();showLoad(false);}

function scopeText(){const a=document.getElementById('f-fasa').value,b=document.getElementById('f-survei').value,d=document.getElementById('f-daerah').value,c=document.getElementById('f-pen').value;return [a?'Fasa '+a:null,b||null,d||null,c||null].filter(Boolean).join(' · ')||'Keseluruhan';}
function applyScope(){const a=document.getElementById('f-fasa').value,b=document.getElementById('f-survei').value,d=document.getElementById('f-daerah').value,c=document.getElementById('f-pen').value;curRows=rawRows.filter(r=>(!a||fasaOf(r)===a)&&(!b||surveiOf(r)===b)&&(!d||daerahOf(r)===d)&&(!c||penName(r)===c));}

/* per-FE aggregate (shared) */
function feAgg(rows){
  const m={};
  rows.forEach(x=>{const fe=feName(x);const o=(m[fe]=m[fe]||{fe,pen:penName(x),agi:0,k11:0,k50:0,lk:0,kodb:0,kawB:0,kawF2:0,kaw:0,bat:0,batB:0,ter:0,terB:0});
    o.agi++;const g=rgroup(x);if(g==='k11')o.k11++;else if(g==='k50')o.k50++;else if(g==='lk')o.lk++;else if(g==='kodb')o.kodb++;
    const isB=(g==='k11'||g==='k50');
    if(hasD(x,COL.L_KAWALAN)){o.kaw++;if(isB)o.kawB++;else o.kawF2++;}
    if(hasD(x,COL.M_BATCHING)||String(x[COL.N_NO_BATCH]||'').trim()){o.bat++;if(isB)o.batB++;}
    if(hasD(x,COL.O_PROSESAN)){o.ter++;if(isB)o.terB++;}});
  return Object.values(m).map(o=>{o.siap=siapOf(o);o.cap=pct(o.siap,o.agi);o.baki=o.agi-o.siap;return o;});
}

/* ═══ RENDER ═══ */
function render(){
  if(!rawRows.length)return;
  applyScope();
  const today=new Date().toLocaleString('ms-MY'),scope=scopeText();
  window.__head=(sub,ic)=>`<div class="rpt-head"><div class="l"><div class="badge">${ic||'📄'}</div><div><h1>LAPORAN ANALISIS BE2026</h1><p>${sub}</p></div></div><div class="r"><div class="tag">DOSM SELANGOR · UHH</div><div>Skop: <span class="scope">${scope}</span></div><div>Kemaskini: ${today}</div></div></div>`;
  window.__foot=n=>`<div class="foot"><span>Laporan Analisis BE2026 · Unit Harga-Harga</span><span>Halaman ${n} / ${NPAGE}</span></div>`;
  document.getElementById('report').innerHTML =
    pageFE()+pageHantarBorang()+pagePenyelia()+pageDaerah()+pagePMKS()+pageK5();
  drawCharts();
}
function P(inner){return `<div class="page">${inner}</div>`;}

/* ── HELPERS RANKING ── */
function target(){const v=parseInt(document.getElementById('f-target').value,10);return isNaN(v)?45:Math.max(0,Math.min(100,v));}
function medal(i){return i===0?'🥇':i===1?'🥈':i===2?'🥉':`<span class="rkno">${i+1}</span>`;}
function pctCls(p,tg){return p>=tg?'pg':p>=tg-15?'pa':'pr';}
function bakiSasaran(agi,siap,tg){return Math.max(0,Math.ceil(agi*tg/100)-siap);}
function podiumHTML(arr,key,capFn){
  const t=arr.slice(0,3);
  const pod=(o,cls,crown)=>o?`<div class="pod ${cls}"><div class="crown">${crown}</div><div class="nm">${o.fe}</div><div class="pen">${o.pen}</div><div class="num">${fmt(o[key])}</div><div class="cap">${capFn(o)}</div></div>`:'';
  return `<div class="podium">${pod(t[1],'p2','🥈')}${pod(t[0],'p1','🥇')}${pod(t[2],'p3','🥉')}</div>`;
}
function penAgg(rows){
  const m={};
  rows.forEach(x=>{const p=penName(x);const o=(m[p]=m[p]||{pen:p,agi:0,k11:0,k50:0,lk:0,kodb:0,belum:0,kawB:0,batB:0,terB:0});
    o.agi++;const g=rgroup(x);if(g==='k11')o.k11++;else if(g==='k50')o.k50++;else if(g==='lk')o.lk++;else if(g==='kodb')o.kodb++;else o.belum++;
    const isB=(g==='k11'||g==='k50');
    if(isB&&hasD(x,COL.L_KAWALAN))o.kawB++;
    if(isB&&(hasD(x,COL.M_BATCHING)||String(x[COL.N_NO_BATCH]||'').trim()))o.batB++;
    if(isB&&hasD(x,COL.O_PROSESAN))o.terB++;});
  return Object.values(m).map(o=>{o.siap=o.k11+o.k50+o.lk+o.kodb;o.cap=pct(o.siap,o.agi);return o;});
}

/* ── BY PENYELIA (MKO + Hantar) ── */
function pagePenyelia(){
  const tg=target();
  const arr=penAgg(curRows).slice().sort((a,b)=>b.siap-a.siap||a.pen.localeCompare(b.pen));
  const TM={agi:0,k11:0,k50:0,lk:0,kodb:0,belum:0,siap:0};arr.forEach(o=>['agi','k11','k50','lk','kodb','belum','siap'].forEach(k=>TM[k]+=o[k]));TM.cap=pct(TM.siap,TM.agi);
  const bsM=bakiSasaran(TM.agi,TM.siap,tg);
  const rowM=(o)=>{const bs=bakiSasaran(o.agi,o.siap,tg);return `<tr><td class="l">${o.pen}</td><td>${fmt(o.agi)}</td><td>${fmt(o.k11)}</td><td>${fmt(o.k50)}</td><td>${fmt(o.lk)}</td><td>${fmt(o.kodb)}</td><td>${fmt(o.belum)}</td><td class="hl">${fmt(o.siap)}</td><td class="${pctCls(o.cap,tg)}">${o.cap}%</td><td class="${bs>0?'pa':'pg'}">${fmt(bs)}</td></tr>`;};
  const totM=`<tr class="tot"><td class="l">JUMLAH</td><td>${fmt(TM.agi)}</td><td>${fmt(TM.k11)}</td><td>${fmt(TM.k50)}</td><td>${fmt(TM.lk)}</td><td>${fmt(TM.kodb)}</td><td>${fmt(TM.belum)}</td><td class="hl">${fmt(TM.siap)}</td><td class="${pctCls(TM.cap,tg)}">${TM.cap}%</td><td class="${bsM>0?'pa':'pg'}">${fmt(bsM)}</td></tr>`;
  const TH={k11:0,k50:0,kawB:0,batB:0,terB:0};arr.forEach(o=>['k11','k50','kawB','batB','terB'].forEach(k=>TH[k]+=o[k]));const THj=TH.k11+TH.k50,phT=pct(TH.kawB,THj);
  const rowH=(o)=>{const jum=o.k11+o.k50,ph=pct(o.kawB,jum);return `<tr><td class="l">${o.pen}</td><td>${fmt(o.k11)}</td><td>${fmt(o.k50)}</td><td>${fmt(jum)}</td><td class="hl">${fmt(o.kawB)}</td><td>${fmt(o.batB)}</td><td>${fmt(o.terB)}</td><td class="${pctCls(ph,tg)}">${ph}%</td><td>${fmt(jum-o.kawB)}</td></tr>`;};
  const totH=`<tr class="tot"><td class="l">JUMLAH</td><td>${fmt(TH.k11)}</td><td>${fmt(TH.k50)}</td><td>${fmt(THj)}</td><td class="hl">${fmt(TH.kawB)}</td><td>${fmt(TH.batB)}</td><td>${fmt(TH.terB)}</td><td class="${pctCls(phT,tg)}">${phT}%</td><td>${fmt(THj-TH.kawB)}</td></tr>`;
  return P(__head('Laporan Mengikut Penyelia · MKO & Hantar Borang','🧑‍💼')+
   `<div class="sec-h">📊 Laporan MKO Mengikut Penyelia</div>
    <div class="tw"><table class="rt"><thead><tr><th class="l">Penyelia</th><th>Agihan</th><th>Kod 11</th><th>Kod 50</th><th>LK</th><th>Kod B</th><th>Belum</th><th>Siap MKO</th><th>% Capai</th><th>Baki ke Sasaran</th></tr></thead><tbody>${arr.map(rowM).join('')}${totM}</tbody></table></div>
    <div class="sec-h" style="margin-top:16px">📤 Laporan Hantar Borang Mengikut Penyelia <small>(Kod 11 &amp; 50)</small></div>
    <div class="tw"><table class="rt"><thead><tr><th class="l">Penyelia</th><th>Kod 11</th><th>Kod 50</th><th>Jumlah Borang</th><th>Hantar Kawalan</th><th>Hantar Batching</th><th>Prosesan Terima</th><th>% Hantar</th><th>Baki Hantar</th></tr></thead><tbody>${arr.map(rowH).join('')}${totH}</tbody></table></div>
    <div class="grow"></div>
    <div class="note">Dua ringkasan mengikut penyelia — <b>MKO</b> (pencapaian respon) &amp; <b>Hantar Borang</b> (Kod 11 &amp; 50 ke kawalan). % diwarna ikut Sasaran ${tg}%. Baki ke Sasaran = kes perlu siap lagi untuk capai ${tg}%.</div>
    ${__foot(3)}`);
}

/* ── MKO BY FE (ranking) ── */
function pageFE(){
  const tg=target();
  const arr=feAgg(curRows).slice().sort((a,b)=>b.siap-a.siap||b.cap-a.cap||a.fe.localeCompare(b.fe));
  const T={agi:0,k11:0,k50:0,lk:0,kodb:0,siap:0,baki:0};arr.forEach(o=>['agi','k11','k50','lk','kodb','siap','baki'].forEach(k=>T[k]+=o[k]));T.cap=pct(T.siap,T.agi);
  const needTot=Math.ceil(T.agi*tg/100),bsTot=Math.max(0,needTot-T.siap);
  const row=(o,i)=>{const bs=bakiSasaran(o.agi,o.siap,tg);return `<tr><td style="text-align:center">${medal(i)}</td><td class="l">${o.fe}</td><td class="l">${o.pen}</td><td>${fmt(o.agi)}</td><td>${fmt(o.k11)}</td><td>${fmt(o.k50)}</td><td>${fmt(o.lk)}</td><td>${pct(o.lk,o.agi)}%</td><td>${fmt(o.kodb)}</td><td class="hl">${fmt(o.siap)}</td><td class="${pctCls(o.cap,tg)}">${o.cap}%</td><td>${fmt(o.baki)}</td><td class="${bs>0?'pa':'pg'}">${fmt(bs)}</td></tr>`;};
  const totRow=`<tr class="tot"><td></td><td class="l">JUMLAH</td><td class="l"></td><td>${fmt(T.agi)}</td><td>${fmt(T.k11)}</td><td>${fmt(T.k50)}</td><td>${fmt(T.lk)}</td><td>${pct(T.lk,T.agi)}%</td><td>${fmt(T.kodb)}</td><td class="hl">${fmt(T.siap)}</td><td class="${pctCls(T.cap,tg)}">${T.cap}%</td><td>${fmt(T.baki)}</td><td class="${bsTot>0?'pa':'pg'}">${fmt(bsTot)}</td></tr>`;
  const C=(l,v,c,sub,ic)=>`<div class="sc ${c||''}">${ic?`<div class="ic">${ic}</div>`:''}<div class="lab">${l}</div><div class="val">${v}</div>${sub?`<div class="s">${sub}</div>`:''}</div>`;
  return P(__head('Laporan MKO By FE · Ranking Pencapaian MKO','🏆')+
   `<div class="sec-h">🏆 Kedudukan Teratas · Siap MKO</div>
    ${podiumHTML(arr,'siap',o=>`Siap MKO · ${o.cap}%`)}
    <div class="sgrid" style="grid-template-columns:repeat(4,1fr);margin-bottom:14px">
      ${C('Sasaran Siap MKO',tg+'%','n','sasaran akan datang','🎯')}
      ${C('Capaian Semasa',T.cap+'%',T.cap>=tg?'g':'r',fmt(T.siap)+' / '+fmt(T.agi)+' kes','✅')}
      ${C('Baki ke Sasaran',fmt(bsTot),bsTot>0?'gd':'g','kes perlu siap lagi','📈')}
      ${C('Jumlah FE',fmt(arr.length),'c','&nbsp;','🧑‍🔧')}
    </div>
    <div class="sec-h">Ranking Penuh — MKO Pegawai Lapangan (FE) <small>(semua FE · ikut Siap MKO terbanyak)</small></div>
    <div class="tw"><table class="rt"><thead><tr><th style="width:42px">#</th><th class="l">Nama FE</th><th class="l">Penyelia</th><th>Agihan</th><th>Kod 11</th><th>Kod 50</th><th>LK</th><th>% LK</th><th>Kod B</th><th>Siap MKO</th><th>% Capai</th><th>Baki Kes</th><th>Baki ke Sasaran</th></tr></thead><tbody>${arr.map((o,i)=>row(o,i)).join('')}${totRow}</tbody></table></div>
    <div class="grow"></div>
    <div class="note">Siap MKO = Kod 11+50+LK+Kod B. % LK = LK ÷ Agihan. % Capai = Siap MKO ÷ Agihan (warna ikut Sasaran ${tg}%). Baki Kes = Agihan − Siap MKO. Baki ke Sasaran = kes perlu siap lagi untuk capai ${tg}% (ubah di bar atas).</div>
    ${__foot(1)}`);
}

/* ── HANTAR BORANG BY FE ── */
function pageHantarBorang(){
  const tg=target();
  const arr=feAgg(curRows).slice().sort((a,b)=>b.kawB-a.kawB||(b.k11+b.k50)-(a.k11+a.k50)||a.fe.localeCompare(b.fe));
  const T={k11:0,k50:0,kawB:0,batB:0,terB:0};arr.forEach(o=>['k11','k50','kawB','batB','terB'].forEach(k=>T[k]+=o[k]));
  const Tj=T.k11+T.k50,phT=pct(T.kawB,Tj);
  const row=(o,i)=>{const jum=o.k11+o.k50,baki=jum-o.kawB,ph=pct(o.kawB,jum);return `<tr><td style="text-align:center">${medal(i)}</td><td class="l">${o.fe}</td><td class="l">${o.pen}</td><td>${fmt(o.k11)}</td><td>${fmt(o.k50)}</td><td>${fmt(jum)}</td><td class="hl">${fmt(o.kawB)}</td><td>${fmt(o.batB)}</td><td>${fmt(o.terB)}</td><td class="${pctCls(ph,tg)}">${ph}%</td><td>${fmt(baki)}</td></tr>`;};
  const totRow=`<tr class="tot"><td></td><td class="l">JUMLAH</td><td class="l"></td><td>${fmt(T.k11)}</td><td>${fmt(T.k50)}</td><td>${fmt(Tj)}</td><td class="hl">${fmt(T.kawB)}</td><td>${fmt(T.batB)}</td><td>${fmt(T.terB)}</td><td class="${pctCls(phT,tg)}">${phT}%</td><td>${fmt(Tj-T.kawB)}</td></tr>`;
  const C=(l,v,c,sub,ic)=>`<div class="sc ${c||''}">${ic?`<div class="ic">${ic}</div>`:''}<div class="lab">${l}</div><div class="val">${v}</div>${sub?`<div class="s">${sub}</div>`:''}</div>`;
  return P(__head('Laporan Hantar Borang By FE · Kod 11 & 50 Sahaja','📤')+
   `<div class="sec-h">🏆 Kedudukan Teratas · Hantar Borang</div>
    ${podiumHTML(arr,'kawB',o=>`${fmt(o.kawB)} borang · ${pct(o.kawB,o.k11+o.k50)}%`)}
    <div class="sgrid" style="grid-template-columns:repeat(3,1fr);margin-bottom:14px">
      ${C('Jumlah Borang (11+50)',fmt(Tj),'n','&nbsp;','📋')}
      ${C('Hantar Kawalan',fmt(T.kawB),'g',phT+'% drp borang','📤')}
      ${C('Baki Hantar',fmt(Tj-T.kawB),'gd','belum hantar','⏳')}
    </div>
    <div class="sec-h">Ranking Penuh — Hantar Borang (Kod 11 &amp; 50) <small>(semua FE · paling banyak hantar)</small></div>
    <div class="tw"><table class="rt"><thead><tr><th style="width:42px">#</th><th class="l">Nama FE</th><th class="l">Penyelia</th><th>Kod 11</th><th>Kod 50</th><th>Jumlah Borang</th><th>Hantar Kawalan</th><th>Hantar Batching</th><th>Prosesan Terima</th><th>% Hantar</th><th>Baki Hantar</th></tr></thead><tbody>${arr.map((o,i)=>row(o,i)).join('')}${totRow}</tbody></table></div>
    <div class="grow"></div>
    <div class="note">Hanya kes <b>Kod 11 &amp; 50</b>. Hantar Kawalan = borang dimasukkan ke kawalan (lajur L). % Hantar = Hantar Kawalan ÷ Jumlah Borang. Baki Hantar = Jumlah Borang − Hantar Kawalan.</div>
    ${__foot(2)}`);
}

/* ── 5/6 kategori ── */
function catAgg(rows,keyFn){
  const m={};
  rows.forEach(x=>{const k=keyFn(x);const o=(m[k]=m[k]||{kes:0,k11:0,k50:0,lk:0,kodb:0,belum:0});o.kes++;const g=rgroup(x);if(g==='k11')o.k11++;else if(g==='k50')o.k50++;else if(g==='lk')o.lk++;else if(g==='kodb')o.kodb++;else o.belum++;});
  return m;
}
function catTable(m,head1){
  const ent=Object.entries(m).sort((a,b)=>b[1].kes-a[1].kes);
  const T={kes:0,k11:0,k50:0,lk:0,kodb:0,belum:0};ent.forEach(([,o])=>['kes','k11','k50','lk','kodb','belum'].forEach(k=>T[k]+=o[k]));
  const row=(n,o,tot)=>{const siap=o.k11+o.k50+o.lk+o.kodb;return `<tr class="${tot?'tot':''}"><td class="l">${n}</td><td>${fmt(o.kes)}</td><td>${fmt(o.k11)}</td><td>${fmt(o.k50)}</td><td>${fmt(o.lk)}</td><td>${fmt(o.kodb)}</td><td>${fmt(o.belum)}</td><td class="hl">${fmt(siap)}</td><td>${pct(siap,o.kes)}%</td></tr>`;};
  return `<div class="tw"><table class="rt"><thead><tr><th class="l">${head1}</th><th>Jumlah Kes</th><th>Kod 11</th><th>Kod 50</th><th>LK</th><th>Kod B</th><th>Belum</th><th>Siap MKO</th><th>% Capai</th></tr></thead><tbody>${ent.map(([n,o])=>row(n,o,false)).join('')}${row('JUMLAH',T,true)}</tbody></table></div>`;
}
function pageDaerah(){
  const m=catAgg(curRows,daerahOf);
  return P(__head('Analisis Mengikut Daerah (DISTRICT_CODE)','📍')+
   `<div class="sec-h">📍 Analisis Daerah</div>
    <div class="charts2">
      <div>${catTable(m,'Daerah')}</div>
      <div class="cw"><h4>Agihan Mengikut Daerah</h4><div class="chart-box"><canvas id="cDaerah"></canvas></div></div>
    </div>
    <div class="grow"></div>
    <div class="note">Pecahan kes &amp; pencapaian (Siap MKO) mengikut daerah. Siap MKO = Kod 11+50+LK+Kod B.</div>
    ${__foot(4)}`);
}
function pagePMKS(){
  const m=catAgg(curRows,pmksOf);
  let pmks=0,besar=0,t=0;Object.entries(m).forEach(([k,o])=>{t+=o.kes;if(/besar/i.test(k))besar+=o.kes;else pmks+=o.kes;});
  return P(__head('Analisis Status Syarikat PMKS (YR_KATEGORI_EKS_PKS)','🏭')+
   `<div class="sec-h">🏭 Analisis Status PMKS <small>(Mikro · Kecil · Sederhana · Besar)</small></div>
    <div class="sgrid" style="grid-template-columns:repeat(3,1fr);margin-bottom:14px">
      <div class="sc g"><div class="lab">PMKS (Mikro+Kecil+Sederhana)</div><div class="val">${fmt(pmks)}</div><div class="s">${pct(pmks,t)}% drp jumlah</div></div>
      <div class="sc n"><div class="lab">Syarikat Besar</div><div class="val">${fmt(besar)}</div><div class="s">${pct(besar,t)}% drp jumlah</div></div>
      <div class="sc c"><div class="lab">Jumlah Syarikat</div><div class="val">${fmt(t)}</div></div>
    </div>
    <div class="charts2">
      <div>${catTable(m,'Status PMKS')}</div>
      <div class="cw"><h4>Komposisi Status PMKS</h4><div class="chart-box"><canvas id="cPmks"></canvas></div></div>
    </div>
    <div class="grow"></div>
    <div class="note">PMKS = Perusahaan Mikro, Kecil &amp; Sederhana. "Besar" ialah syarikat di luar kategori PMKS. Siap MKO = Kod 11+50+LK+Kod B.</div>
    ${__foot(5)}`);
}

/* ── 7 K5 ── */
function pageK5(){
  const cols=[[17,'Hasil / Pendapatan','RM'],[18,'Perbelanjaan','RM'],[19,'Gaji','RM'],[20,'Pekerja','org'],[21,'Aset','RM'],[22,'Stok','RM']];
  const stat=cols.map(([i,nm,u])=>{let bil=0,sum=0,mn=Infinity,mx=-Infinity;curRows.forEach(x=>{const v=num(x[i]);if(v!==null){bil++;sum+=v;if(v<mn)mn=v;if(v>mx)mx=v;}});return {nm,u,bil,sum,avg:bil?sum/bil:0,mn:bil?mn:0,mx:bil?mx:0};});
  const fv=(v,u)=>u==='RM'?rm(v):fmt(Math.round(v));
  const rows=stat.map(s=>`<tr><td class="l">${s.nm}</td><td style="text-align:center">${s.u}</td><td>${fmt(s.bil)}</td><td>${fv(s.sum,s.u)}</td><td>${fv(s.avg,s.u)}</td><td>${fv(s.mn,s.u)}</td><td>${fv(s.mx,s.u)}</td></tr>`).join('');
  return P(__head('Analisis 6 Data K5 · Pendapatan, Perbelanjaan, Gaji, Pekerja, Aset, Stok','💰')+
   `<div class="sec-h">💰 Analisis 6 Data K5</div>
    <div class="charts2">
      <div class="tw"><table class="rt"><thead><tr><th class="l">Data K5</th><th>Unit</th><th>Bil Ada Data</th><th>Jumlah</th><th>Purata</th><th>Minimum</th><th>Maksimum</th></tr></thead><tbody>${rows}</tbody></table></div>
      <div class="cw"><h4>Jumlah Nilai (RM) Mengikut Data</h4><div class="chart-box"><canvas id="cK5"></canvas></div></div>
    </div>
    <div class="grow"></div>
    <div class="note">Data K5 hanya wujud bagi borang yang telah direkod nilainya (kebanyakannya kes lengkap / Kod 11). "Pekerja" ialah bilangan orang — dipaparkan dalam jadual sahaja, bukan carta RM.</div>
    ${__foot(6)}`);
}

/* ── CHARTS ── */
function destroy(id){if(charts[id]){charts[id].destroy();delete charts[id];}}
function drawCharts(){
  const dm=catAgg(curRows,daerahOf);const dEnt=Object.entries(dm).sort((a,b)=>b[1].kes-a[1].kes);
  mkBar('cDaerah',dEnt.map(e=>e[0]),dEnt.map(e=>e[1].kes),['#2563eb','#38bdf8','#06b6d4','#0ea5e9','#8b5cf6']);
  const pm=catAgg(curRows,pmksOf);const order=['Mikro','Kecil','Sederhana','Besar'];const pEnt=order.filter(k=>pm[k]).map(k=>[k,pm[k]]);Object.entries(pm).forEach(([k,o])=>{if(!order.includes(k))pEnt.push([k,o]);});
  mkDonut('cPmks',pEnt.map(e=>e[0]),pEnt.map(e=>e[1].kes),['#10b981','#2563eb','#f59e0b','#64748b','#8b5cf6']);
  const k5cols=[[17,'Hasil'],[18,'Belanja'],[19,'Gaji'],[21,'Aset'],[22,'Stok']];
  mkBar('cK5',k5cols.map(c=>c[1]),k5cols.map(([i])=>{let s=0;curRows.forEach(x=>{const v=num(x[i]);if(v!==null)s+=v;});return s;}),['#2563eb','#ef4444','#f59e0b','#8b5cf6','#06b6d4'],true);
}
function mkBar(id,labels,data,colors,isRM){const el=document.getElementById(id);if(!el)return;destroy(id);charts[id]=new Chart(el,{type:'bar',data:{labels,datasets:[{data,backgroundColor:colors,borderRadius:5}]},options:{responsive:true,maintainAspectRatio:false,animation:false,plugins:{legend:{display:false},tooltip:{callbacks:{label:c=>(isRM?'RM ':'')+Number(c.raw).toLocaleString('ms-MY')}}},scales:{x:{grid:{display:false},ticks:{font:{size:10}}},y:{beginAtZero:true,ticks:{font:{size:9},callback:v=>isRM?(v>=1e6?(v/1e6)+'jt':v>=1e3?(v/1e3)+'k':v):fmt(v)}}}}});}
function mkDonut(id,labels,data,colors){const el=document.getElementById(id);if(!el)return;destroy(id);charts[id]=new Chart(el,{type:'doughnut',data:{labels,datasets:[{data,backgroundColor:colors,borderWidth:2,borderColor:'#fff'}]},options:{responsive:true,maintainAspectRatio:false,animation:false,plugins:{legend:{position:'bottom',labels:{font:{family:"'Plus Jakarta Sans'",size:11}}}}}});}

/* ═══ DEMO ═══ */
function genDemo(){
  const fes=['QISTINA','HANA','NUAIM','ZAWANI','MAISARAH','IKHWAN','NAJWA','ALFIAN','AIMAN','AINUDDIN','SYIMAH','UYAINAH'];
  const pens=['nursyuzalawaty','suhaina.wahab','ahmadmaliki'];const fasas=['Fasa 2 - Selain NPI','Fasa 3'];const sv=['337 - Runcit','308 - Hartanah'];
  const dist=['05 Petaling','02 Klang','04 Kuala Selangor','06 Sabak Bernam'];const pmks=['Mikro','Kecil','Sederhana','Besar'];
  const codes=['11-Borang Lengkap','50-Salah','21-Alamat','22-Tiada','23-Berpindah','31-Tidak operasi','40-Tutup','71-Janji','76-Proses'];
  const rek=['Dalam Proses','Semakan SMD','Selesai'];const mo=['May','Jun'];const rows=[];
  for(let i=0;i<700;i++){const r=new Array(43).fill('');
    r[COL.FASA]=fasas[Math.random()>.85?1:0];r[COL.NO_SIRI]='S'+(1e5+i);r[COL.PENYELIA]=pens[i%3];r[COL.FE]=fes[i%fes.length];
    r[COL.DAERAH]=dist[Math.random()>.4?0:(Math.random()>.4?1:(Math.random()>.5?2:3))];r[COL.PMKS]=pmks[Math.random()>.3?0:(Math.random()>.4?1:(Math.random()>.5?3:2))];
    r[COL.AP_SURVEI]=sv[Math.random()>.25?0:1];
    if(Math.random()>.5){const c=Math.random()>.78?codes[0]:codes[(Math.random()*codes.length)|0];r[COL.P_RESP]=c;r[COL.Q_REKOD]=rek[(Math.random()*rek.length)|0];
      if(c[0]==='1'&&Math.random()>.6){r[17]=String(Math.random()*1e6|0);r[18]=String(Math.random()*5e5|0);r[19]=String(Math.random()*8e4|0);r[20]=String(1+(Math.random()*20|0));r[21]=String(Math.random()*3e5|0);r[22]=String(Math.random()*1e5|0);}
      if(Math.random()>.5)r[COL.L_KAWALAN]=(1+(Math.random()*27|0))+'-'+mo[(Math.random()*2)|0]+'-26';}
    rows.push(r);}
  return rows;
}

setInterval(()=>{const u=document.getElementById('url').value.trim();if(u&&rawRows.length)loadData();},10*60*1000);
(function(){const i=document.getElementById('url');if(DEFAULT_URL){i.value=DEFAULT_URL;loadData();}else{showLoad(false);document.getElementById('err').style.display='block';}})();
</script>
</body>
</html>
