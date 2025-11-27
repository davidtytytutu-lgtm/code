<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>David Officiel</title>
<link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&amp;display=swap" rel="stylesheet">
<link rel="icon" type="image/png" href="https://i.pinimg.com/1200x/bd/60/b4/bd60b490ebe4afa38c4cab8e8148561a.jpg" />
<style>
:root{
  --accent:#FFD700;
  --bg:#000;
  --btn-bg: rgba(0,0,0,0.65);
  --tiktok-turq: #25F4EE;
  --tiktok-pink: #FE2C55;
}

/* Reset & layout */
*{box-sizing:border-box}
html,body{height:100%;margin:0;background:var(--bg);color:#fff;font-family:'Press Start 2P', cursive;-webkit-font-smoothing:antialiased;}
.app {position:relative;height:100vh;overflow:hidden}

/* Sections stacked (fade transition) */
.screen {
  position:absolute;inset:0;
  display:flex;flex-direction:column;align-items:center;justify-content:center;
  padding:28px;
  background-position:center;
  background-repeat:no-repeat;
  background-size:cover;
  transition:opacity .45s ease,transform .45s ease;
  opacity:0; pointer-events:none; transform:scale(.995);
}
.screen.active {opacity:1; pointer-events:auto; transform:scale(1); z-index:5}

/* top-left title area (only on accueil) */
.header-title { font-size: clamp(24px,5vw,56px); text-align:center; margin-bottom:18px; text-shadow:0 0 14px #000; }

/* Buttons row */
.controls { display:flex; gap:12px; flex-wrap:wrap; justify-content:center; align-items:flex-start; margin-bottom:10px; }
.btn {
  display:inline-block; text-decoration:none; color:#fff; background:var(--btn-bg);
  border:2px solid #fff; padding:10px 18px; border-radius:10px; cursor:pointer;
  transition: transform .18s ease, box-shadow .18s ease, background .18s;
  font-size:13px; letter-spacing:0.02em;
}
.btn:hover{ transform:translateY(-4px); box-shadow:0 10px 24px rgba(0,0,0,0.6); background:#fff; color:#000; }

/* TikTok special */
.btn.tiktok { color:var(--tiktok-turq); border-color:rgba(255,255,255,0.85); background:rgba(0,0,0,0.55); }
.btn.tiktok:hover { color:var(--tiktok-pink); box-shadow:0 0 10px var(--tiktok-turq),0 0 18px var(--tiktok-pink); background:#000; }

/* Back button */
#backBtn {
  position:fixed; top:16px; right:16px; z-index:50; display:none;
  padding:8px 14px; border-radius:10px; text-decoration:none; color:#fff; background:var(--btn-bg); border:2px solid #fff;
}
#backBtn.show { display:inline-block; }

/* Banner cubes (full width line at bottom of accueil) */
#bannerCubes { position:absolute; left:8px; right:8px; bottom:12px; display:flex; gap:8px; justify-content:space-between; align-items:center; z-index:20; pointer-events:none; }
.bannerCube { width:56px; height:56px; border-radius:8px; background-size:cover; image-rendering:pixelated; animation: float 2.2s ease-in-out infinite alternate; box-shadow:0 4px 10px rgba(0,0,0,0.6); }
@keyframes float { 0%{transform:translateY(0)} 50%{transform:translateY(-10px)} 100%{transform:translateY(0)} }

/* Game container: pixel-ish border and inner glass */
.game-wrap {
  width: min(1200px, 94%);
  height: min(80vh, 820px);
  border-radius:14px;
  padding:10px;
  background: linear-gradient(180deg, rgba(255,255,255,0.03), rgba(0,0,0,0.06));
  box-shadow: 0 12px 40px rgba(0,0,0,0.7);
  border: 10px solid var(--accent);
  display:flex; align-items:center; justify-content:center;
  position:relative;
  backdrop-filter: blur(2px);
}

/* iframe style */
.game-iframe {
  width:100%; height:100%; border-radius:8px; border:6px solid #111; box-shadow: inset 0 0 0 3px rgba(255,255,255,0.02);
  background:#000;
}

/* Loader overlay for eaglercraft */
.loader {
  position:absolute; inset:0; display:flex; align-items:center; justify-content:center; z-index:30;
  background: linear-gradient(0deg, rgba(0,0,0,0.55), rgba(0,0,0,0.15));
  font-size:14px; color:#fff; text-align:center;
  pointer-events:none;
}

/* Game title style */
.gameTitle {
  margin-bottom:14px; font-size:clamp(18px,3.6vw,34px); color:var(--accent);
  text-shadow:0 0 12px #000; animation:pulseTitle 1.6s infinite alternate;
}
@keyframes pulseTitle {
  0%{ text-shadow:0 0 8px #FFD700 } 50%{ text-shadow:0 0 20px #FFEA00 } 100%{ text-shadow:0 0 8px #FFD700 }
}

/* responsive tweaks */
@media (max-width:880px){
  .game-wrap{ height:70vh; padding:8px; border-width:8px; }
  .bannerCube { width:44px; height:44px; }
  .btn{ padding:8px 12px; font-size:12px }
}

/* small neat visual for section headings on dark screens */
.section-hint { position:absolute; left:16px; top:16px; opacity:0.9; font-size:12px; color:#ddd }
</style>
</head>
<body>
<div class="app">

  <!-- BACK / ACCUEIL -->
  <a id="backBtn" href="#" title="Retour Accueil">Accueil</a>

  <!-- ACCUEIL -->
  <section id="sectionAccueil" class="screen active" style="background:url('https://i.pinimg.com/originals/a3/3b/7a/a33b7ae13022907c0f5c25b7ac714f48.gif') center/cover no-repeat;">
    <div class="header-title">DAVID OFFICIEL</div>

    <div class="controls" role="navigation" aria-label="Navigation principale">
      <a class="btn" data-section="Minecraft" href="#">Minecraft Classic</a>

      <!-- Eaglercraft + Wiki en colonne -->
      <div style="display:flex; flex-direction:column; gap:8px; align-items:center; margin-left:10px; margin-right:10px;">
        <a class="btn" data-section="Eaglercraft" href="#">EaglerCraft 1.12</a>
        <a class="btn" data-section="WikiEaglercraft" href="#">Wiki Eaglercraft</a>
      </div>

      <a class="btn tiktok" href="https://www.tiktok.com/@cherif_cat_le_retour" target="_blank" rel="noopener noreferrer">TikTok</a>
    </div>

    <div class="section-hint">Clique sur un bouton pour ouvrir le jeu ou le wiki (même page)</div>

    <div id="bannerCubes" aria-hidden="true"></div>
  </section>

  <!-- MINECRAFT CLASSIC SCREEN -->
  <section id="sectionMinecraft" class="screen" style="background:url('https://i.pinimg.com/originals/55/ff/7e/55ff7e9e0b9478e0f6d31f714b422981.gif') center/cover no-repeat;">
    <div class="gameTitle">MINECRAFT CLASSIC</div>
    <div class="game-wrap" role="region" aria-label="Minecraft Classic">
      <iframe class="game-iframe" src="https://classic.minecraft.net/?join=YOURCODE" allowfullscreen sandbox="allow-scripts allow-same-origin allow-forms"></iframe>
    </div>
  </section>

  <!-- EAGLERCRAFT SCREEN -->
  <section id="sectionEaglercraft" class="screen" style="background:url('https://i.pinimg.com/originals/1f/70/64/1f706480d96b508385ad928171aa533d.gif') center/cover no-repeat;">
    <div class="gameTitle">EAGLERCRAFT 1.12</div>
    <div class="game-wrap" role="region" aria-label="Eaglercraft">
      <div class="loader" id="eaglerLoader">Chargement Eaglercraft…</div>
      <iframe id="eaglerIframe" class="game-iframe" src="https://eaglercraft-unblocked.neocities.org/112/" allowfullscreen sandbox="allow-scripts allow-same-origin allow-forms allow-pointer-lock"></iframe>
    </div>
  </section>

  <!-- WIKI EAGLERCRAFT -->
  <section id="sectionWikiEaglercraft" class="screen" style="background:url('https://i.pinimg.com/originals/19/67/48/196748b21f37205b5a4f762ddfe54962.gif') center/cover no-repeat;">
    <div class="gameTitle">Wiki Eaglercraft 1.12</div>

    <div style="max-width:1000px; padding:20px; background:rgba(0,0,0,0.5); border-radius:12px; overflow-y:auto; height:75vh; color:#fff;">
      <h2 style="color:var(--accent); text-shadow:0 0 8px #000;">Présentation</h2>
      <p>Eaglercraft est une version JavaScript / Web de Minecraft 1.12, permettant de jouer directement depuis le navigateur. Elle supporte le multijoueur et une compatibilité étendue avec les textures classiques.</p>

      <h2 style="color:var(--accent); text-shadow:0 0 8px #000;">Version utilisée</h2>
      <p>Sur ce site, la version 1.12 est utilisée, avec des textures améliorées pour un rendu plus immersif.</p>

      <h2 style="color:var(--accent); text-shadow:0 0 8px #000;">Fonctionnalités principales</h2>
      <ul>
        <li>Jouer en solo ou en multijoueur directement dans le navigateur</li>
        <li>Support des textures personnalisées</li>
        <li>Commandes de base disponibles via chat</li>
        <li>Possibilité de construire, miner et explorer comme dans Minecraft classique</li>
      </ul>

      <h2 style="color:var(--accent); text-shadow:0 0 8px #000;">Astuces</h2>
      <ul>
        <li>Utilisez le chat pour les commandes (ex: /help pour l’aide)</li>
        <li>Les touches standard de Minecraft fonctionnent (ZQSD, espace, clics souris)</li>
        <li>Rechargez la page pour réinitialiser votre monde si nécessaire</li>
      </ul>

      <h2 style="color:var(--accent); text-shadow:0 0 8px #000;">Liens utiles</h2>
      <ul>
        <li><a href="https://eaglercraft-unblocked.neocities.org/112/" target="_blank" style="color:#FFD700;">Jouer à Eaglercraft 1.12</a></li>
        <li><a href="https://www.minecraft.net/fr-fr" target="_blank" style="color:#FFD700;">Site officiel Minecraft</a></li>
      </ul>
    </div>
  </section>

</div>

<audio id="bgAudio" 
       src="https://ia601701.us.archive.org/12/items/c-418-subwoofer-lullaby-minecraft-volume-alpha_202511/C418%20-%20Subwoofer%20Lullaby%20-%20Minecraft%20Volume%20Alpha.mp3" 
       autoplay 
       loop>
</audio>

<script>
/* Navigation & transitions */
const showSection = (name) => {
  const all = document.querySelectorAll('.screen');
  all.forEach(s => s.classList.remove('active'));
  const id = 'section' + name;
  const target = document.getElementById(id);
  if (target) target.classList.add('active');

  const back = document.getElementById('backBtn');
  back.classList.toggle('show', name !== 'Accueil');
};

document.querySelectorAll('[data-section]').forEach(btn=>{
  btn.addEventListener('click', e=>{
    e.preventDefault();
    const sec = btn.dataset.section || 'Accueil';
    showSection(sec);
  });
});

document.getElementById('backBtn').addEventListener('click', e=>{
  e.preventDefault();
  showSection('Accueil');
});

/* Banner cubes generation */
const characters = [
  "https://i.pinimg.com/originals/c4/8b/ad/c48badc01f514f7e6fef237e9391e78c.gif",
  "https://i.pinimg.com/originals/ca/59/c7/ca59c7300ea299fc9f429da8e7924e5c.gif",
  "https://i.pinimg.com/originals/b2/d8/80/b2d880ccf382f298a6939c7eb0ab36bd.gif",
  "https://i.pinimg.com/originals/95/1c/ec/951cecd820ed831a1b905e3c5229f624.gif",
  "https://i.pinimg.com/originals/8b/7d/41/8b7d41e6d94ae3db3add4d3a64ed5440.gif",
  "https://i.pinimg.com/originals/49/b1/51/49b151d821c406e8f73debe376c4c1ce.gif",
  "https://i.pinimg.com/originals/dc/7f/90/dc7f90b52f8c95e29939b431b93ee0b6.gif"
];

function generateBannerCubes() {
  const container = document.getElementById('bannerCubes');
  container.innerHTML = '';
  const count = Math.max(6, Math.min(18, Math.floor(window.innerWidth / 100)));
  const used = new Set();
  for (let i=0;i<count;i++){
    let idx;
    do { idx = Math.floor(Math.random()*characters.length); } while(used.has(idx) && used.size < characters.length);
    used.add(idx);
    const div = document.createElement('div');
    div.className = 'bannerCube';
    div.style.backgroundImage = `url(${characters[idx]})`;
    div.style.animationDuration = (1.6 + Math.random()*1.6) + 's';
    container.appendChild(div);
  }
}
generateBannerCubes();
window.addEventListener('resize', generateBannerCubes);

/* Eaglercraft loader */
const eaglerIframe = document.getElementById('eaglerIframe');
const eaglerLoader = document.getElementById('eaglerLoader');
eaglerIframe.addEventListener('load', ()=>{ eaglerLoader.style.display='none'; });
setTimeout(()=>{ eaglerLoader.style.display='none'; },12000);

/* Audio autoplay fallback */
const audio = document.getElementById('bgAudio');
document.addEventListener('click', () => { audio.play().catch(()=>console.log("Autoplay bloqué")); }, {once:true});

/* Initialize */
showSection('Accueil');
</script>
</body>
</html>
