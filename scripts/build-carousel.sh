#!/bin/bash
# Build the 3D carousel SVG with full-bleed screenshot cards + overlay text

THUMBS="screenshots/showcase/thumbs"
OUT="screenshots/showcase/carousel-3d.svg"

B64_GALLERY=$(cat "$THUMBS/3dgallery.b64")
B64_CHIWI=$(cat "$THUMBS/chiwi.b64")
B64_KLS=$(cat "$THUMBS/klsconnect.b64")
B64_WHALE=$(cat "$THUMBS/whalefriend.b64")
B64_CARD=$(cat "$THUMBS/cardrpg.b64")

cat > "$OUT" << 'SVGEOF'
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 900 520" width="900" height="520">
  <defs>
    <linearGradient id="bg" x1="0%" y1="0%" x2="100%" y2="100%"><stop offset="0%" stop-color="#06060f"/><stop offset="50%" stop-color="#0d1117"/><stop offset="100%" stop-color="#06060f"/></linearGradient>
    <linearGradient id="fl" x1="0%" y1="0%" x2="0%" y2="100%"><stop offset="0%" stop-color="#1a1a3e" stop-opacity="0.5"/><stop offset="100%" stop-color="#0d1117" stop-opacity="0"/></linearGradient>
    <radialGradient id="sp" cx="50%" cy="50%" r="50%"><stop offset="0%" stop-color="#58a6ff" stop-opacity="0.12"/><stop offset="100%" stop-color="#58a6ff" stop-opacity="0"/></radialGradient>
    <!-- Card border gradients -->
    <linearGradient id="g1" x1="0%" y1="0%" x2="100%" y2="100%"><stop offset="0%" stop-color="#667eea"/><stop offset="100%" stop-color="#764ba2"/></linearGradient>
    <linearGradient id="g2" x1="0%" y1="0%" x2="100%" y2="100%"><stop offset="0%" stop-color="#f5af19"/><stop offset="100%" stop-color="#f12711"/></linearGradient>
    <linearGradient id="g3" x1="0%" y1="0%" x2="100%" y2="100%"><stop offset="0%" stop-color="#11998e"/><stop offset="100%" stop-color="#38ef7d"/></linearGradient>
    <linearGradient id="g4" x1="0%" y1="0%" x2="100%" y2="100%"><stop offset="0%" stop-color="#2193b0"/><stop offset="100%" stop-color="#6dd5ed"/></linearGradient>
    <linearGradient id="g5" x1="0%" y1="0%" x2="100%" y2="100%"><stop offset="0%" stop-color="#c59b6d"/><stop offset="100%" stop-color="#f5af19"/></linearGradient>
    <!-- Bottom fade overlay for text readability -->
    <linearGradient id="fade" x1="0%" y1="0%" x2="0%" y2="100%"><stop offset="0%" stop-color="#000" stop-opacity="0"/><stop offset="40%" stop-color="#000" stop-opacity="0"/><stop offset="100%" stop-color="#000" stop-opacity=".88"/></linearGradient>
    <!-- Top subtle vignette -->
    <linearGradient id="topFade" x1="0%" y1="0%" x2="0%" y2="100%"><stop offset="0%" stop-color="#000" stop-opacity=".5"/><stop offset="30%" stop-color="#000" stop-opacity="0"/><stop offset="100%" stop-color="#000" stop-opacity="0"/></linearGradient>
    <!-- Filters -->
    <filter id="ds"><feDropShadow dx="0" dy="6" stdDeviation="12" flood-color="#000" flood-opacity="0.75"/></filter>
    <filter id="sg"><feGaussianBlur stdDeviation="1.5" result="b"/><feMerge><feMergeNode in="b"/><feMergeNode in="SourceGraphic"/></feMerge></filter>
    <filter id="txtSh"><feDropShadow dx="0" dy="1" stdDeviation="2" flood-color="#000" flood-opacity="0.8"/></filter>
    <!-- Clip for full-bleed rounded card image -->
    <clipPath id="cardClip"><rect width="200" height="250" rx="10"/></clipPath>
  </defs>
  <style>
    /* Ellipse orbit: cx=450, cy=310, rx=280, ry=45 */
    /* Card: 200x250, anchor translate(-100,-135) */
    @keyframes o1{
      0%  {transform:translate(450px,355px) scale(1);opacity:1}
      10% {transform:translate(614px,346px) scale(.93);opacity:.85}
      20% {transform:translate(715px,324px) scale(.78);opacity:.60}
      30% {transform:translate(715px,296px) scale(.60);opacity:.32}
      40% {transform:translate(614px,274px) scale(.48);opacity:.15}
      50% {transform:translate(450px,265px) scale(.43);opacity:.06}
      60% {transform:translate(286px,274px) scale(.48);opacity:.15}
      70% {transform:translate(185px,296px) scale(.60);opacity:.32}
      80% {transform:translate(185px,324px) scale(.78);opacity:.60}
      90% {transform:translate(286px,346px) scale(.93);opacity:.85}
      100%{transform:translate(450px,355px) scale(1);opacity:1}
    }
    @keyframes o2{
      0%  {transform:translate(715px,324px) scale(.78);opacity:.60}
      10% {transform:translate(715px,296px) scale(.60);opacity:.32}
      20% {transform:translate(614px,274px) scale(.48);opacity:.15}
      30% {transform:translate(450px,265px) scale(.43);opacity:.06}
      40% {transform:translate(286px,274px) scale(.48);opacity:.15}
      50% {transform:translate(185px,296px) scale(.60);opacity:.32}
      60% {transform:translate(185px,324px) scale(.78);opacity:.60}
      70% {transform:translate(286px,346px) scale(.93);opacity:.85}
      80% {transform:translate(450px,355px) scale(1);opacity:1}
      90% {transform:translate(614px,346px) scale(.93);opacity:.85}
      100%{transform:translate(715px,324px) scale(.78);opacity:.60}
    }
    @keyframes o3{
      0%  {transform:translate(614px,274px) scale(.48);opacity:.15}
      10% {transform:translate(450px,265px) scale(.43);opacity:.06}
      20% {transform:translate(286px,274px) scale(.48);opacity:.15}
      30% {transform:translate(185px,296px) scale(.60);opacity:.32}
      40% {transform:translate(185px,324px) scale(.78);opacity:.60}
      50% {transform:translate(286px,346px) scale(.93);opacity:.85}
      60% {transform:translate(450px,355px) scale(1);opacity:1}
      70% {transform:translate(614px,346px) scale(.93);opacity:.85}
      80% {transform:translate(715px,324px) scale(.78);opacity:.60}
      90% {transform:translate(715px,296px) scale(.60);opacity:.32}
      100%{transform:translate(614px,274px) scale(.48);opacity:.15}
    }
    @keyframes o4{
      0%  {transform:translate(286px,274px) scale(.48);opacity:.15}
      10% {transform:translate(185px,296px) scale(.60);opacity:.32}
      20% {transform:translate(185px,324px) scale(.78);opacity:.60}
      30% {transform:translate(286px,346px) scale(.93);opacity:.85}
      40% {transform:translate(450px,355px) scale(1);opacity:1}
      50% {transform:translate(614px,346px) scale(.93);opacity:.85}
      60% {transform:translate(715px,324px) scale(.78);opacity:.60}
      70% {transform:translate(715px,296px) scale(.60);opacity:.32}
      80% {transform:translate(614px,274px) scale(.48);opacity:.15}
      90% {transform:translate(450px,265px) scale(.43);opacity:.06}
      100%{transform:translate(286px,274px) scale(.48);opacity:.15}
    }
    @keyframes o5{
      0%  {transform:translate(185px,324px) scale(.78);opacity:.60}
      10% {transform:translate(286px,346px) scale(.93);opacity:.85}
      20% {transform:translate(450px,355px) scale(1);opacity:1}
      30% {transform:translate(614px,346px) scale(.93);opacity:.85}
      40% {transform:translate(715px,324px) scale(.78);opacity:.60}
      50% {transform:translate(715px,296px) scale(.60);opacity:.32}
      60% {transform:translate(614px,274px) scale(.48);opacity:.15}
      70% {transform:translate(450px,265px) scale(.43);opacity:.06}
      80% {transform:translate(286px,274px) scale(.48);opacity:.15}
      90% {transform:translate(185px,296px) scale(.60);opacity:.32}
      100%{transform:translate(185px,324px) scale(.78);opacity:.60}
    }
    @keyframes ft{0%,100%{transform:translateY(0)}50%{transform:translateY(-4px)}}
    @keyframes tw{0%,100%{opacity:.15}50%{opacity:.9}}
    @keyframes bl{0%{stroke-dashoffset:0}100%{stroke-dashoffset:-60}}
    @keyframes pr{0%{stroke-dashoffset:0}100%{stroke-dashoffset:-1200}}
    @keyframes gp{0%,100%{opacity:.15}50%{opacity:.35}}
    @keyframes pulse{0%,100%{opacity:.6}50%{opacity:1}}
    .c1{animation:o1 25s linear infinite}.c2{animation:o2 25s linear infinite}.c3{animation:o3 25s linear infinite}.c4{animation:o4 25s linear infinite}.c5{animation:o5 25s linear infinite}
    .tf{animation:ft 4s ease-in-out infinite}.st{animation:tw 3s ease-in-out infinite}.bt{animation:bl 3s linear infinite}.rg{animation:pr 25s linear infinite}.gp{animation:gp 4s ease-in-out infinite}
    .live{animation:pulse 2s ease-in-out infinite}
    .c1,.c2,.c3,.c4,.c5{cursor:pointer}
  </style>
  <rect width="900" height="520" fill="url(#bg)" rx="12"/>
  <!-- Grid -->
  <g opacity=".04"><line x1="0" y1="410" x2="900" y2="410" stroke="#58a6ff" stroke-width=".5"/><line x1="0" y1="430" x2="900" y2="430" stroke="#58a6ff" stroke-width=".3"/><line x1="450" y1="200" x2="0" y2="520" stroke="#58a6ff" stroke-width=".3"/><line x1="450" y1="200" x2="900" y2="520" stroke="#58a6ff" stroke-width=".3"/></g>
  <!-- Stars -->
  <g filter="url(#sg)"><circle class="st" cx="45" cy="35" r="1.2" fill="#58a6ff" style="animation-delay:0s"/><circle class="st" cx="130" cy="75" r=".8" fill="#fff" style="animation-delay:.5s"/><circle class="st" cx="240" cy="28" r="1" fill="#58a6ff" style="animation-delay:1s"/><circle class="st" cx="370" cy="55" r=".6" fill="#c9d1d9" style="animation-delay:1.5s"/><circle class="st" cx="510" cy="22" r="1.1" fill="#58a6ff" style="animation-delay:.3s"/><circle class="st" cx="640" cy="48" r=".9" fill="#fff" style="animation-delay:.8s"/><circle class="st" cx="740" cy="32" r="1.3" fill="#58a6ff" style="animation-delay:1.2s"/><circle class="st" cx="825" cy="65" r=".7" fill="#c9d1d9" style="animation-delay:2s"/><circle class="st" cx="95" cy="115" r=".5" fill="#fff" style="animation-delay:2.5s"/><circle class="st" cx="790" cy="120" r=".8" fill="#58a6ff" style="animation-delay:1.8s"/><circle class="st" cx="560" cy="105" r=".5" fill="#c9d1d9" style="animation-delay:.9s"/><circle class="st" cx="855" cy="155" r=".6" fill="#fff" style="animation-delay:1.6s"/></g>
  <!-- Title -->
  <g class="tf"><text x="450" y="48" text-anchor="middle" font-family="'Segoe UI',system-ui,sans-serif" font-size="11" fill="#58a6ff" letter-spacing="6" opacity=".6">✦  P O R T F O L I O   E X H I B I T I O N  ✦</text><text x="450" y="82" text-anchor="middle" font-family="'Segoe UI',system-ui,sans-serif" font-size="30" fill="#e6edf3" font-weight="700" letter-spacing="1">Gogoonbuntu's Service Gallery</text><text x="450" y="106" text-anchor="middle" font-family="'Segoe UI',system-ui,sans-serif" font-size="12" fill="#8b949e" letter-spacing="4">5 LIVE SERVICES — BUILT FROM SCRATCH</text></g>
  <!-- Platform -->
  <ellipse cx="450" cy="420" rx="320" ry="50" fill="url(#fl)" opacity=".5"/>
  <ellipse class="gp" cx="450" cy="420" rx="290" ry="42" fill="none" stroke="#58a6ff" stroke-width=".5" opacity=".15"/>
  <ellipse class="bt" cx="450" cy="420" rx="265" ry="36" fill="none" stroke="#58a6ff" stroke-width=".8" stroke-dasharray="6 6" opacity=".2"/>
  <ellipse class="rg" cx="450" cy="420" rx="240" ry="30" fill="none" stroke="#58a6ff" stroke-width="1" stroke-dasharray="4 16" opacity=".15"/>
  <ellipse cx="450" cy="410" rx="100" ry="20" fill="url(#sp)"/>
SVGEOF

# --- CARD TEMPLATE: full-bleed screenshot + gradient overlay + text ---
# Card 3: KLS Connect (back)
cat >> "$OUT" << CARD3
  <!-- Card 3: KLS Connect -->
  <a href="https://github.com/gogoonbuntu/gogoonbuntu/tree/main/projects/kls-connect" target="_blank">
  <g class="c3" filter="url(#ds)"><g transform="translate(-100,-135)">
    <g clip-path="url(#cardClip)">
      <image href="data:image/jpeg;base64,${B64_KLS}" x="0" y="0" width="200" height="250" preserveAspectRatio="xMidYMid slice"/>
      <rect width="200" height="250" fill="url(#fade)"/>
      <rect width="200" height="250" fill="url(#topFade)"/>
    </g>
    <rect width="200" height="250" rx="10" fill="none" stroke="url(#g3)" stroke-width="1.5"/>
    <!-- Live dot -->
    <circle cx="183" cy="14" r="3.5" fill="#3fb950"/><circle class="live" cx="183" cy="14" r="6" fill="none" stroke="#3fb950" stroke-width=".7"/>
    <!-- Overlay text -->
    <g filter="url(#txtSh)">
      <text x="100" y="195" text-anchor="middle" font-family="'Segoe UI',system-ui,sans-serif" font-size="15" fill="#fff" font-weight="700">KLS Connect</text>
      <text x="100" y="213" text-anchor="middle" font-family="'Segoe UI',system-ui,sans-serif" font-size="9" fill="#c9d1d9" opacity=".9">동문 1,000+ 연결 · AI 피드 · 11종 미니게임</text>
      <text x="100" y="237" text-anchor="middle" font-family="'Segoe UI',system-ui,sans-serif" font-size="8.5" fill="#38ef7d" letter-spacing="1" opacity=".8">WEB · iOS · ANDROID</text>
    </g>
  </g></g>
  </a>
CARD3

# Card 4: WhaleFriend (back-left)
cat >> "$OUT" << CARD4
  <!-- Card 4: WhaleFriend -->
  <a href="https://github.com/gogoonbuntu/gogoonbuntu/tree/main/projects/whalefriend" target="_blank">
  <g class="c4" filter="url(#ds)"><g transform="translate(-100,-135)">
    <g clip-path="url(#cardClip)">
      <image href="data:image/jpeg;base64,${B64_WHALE}" x="0" y="0" width="200" height="250" preserveAspectRatio="xMidYMid slice"/>
      <rect width="200" height="250" fill="url(#fade)"/>
      <rect width="200" height="250" fill="url(#topFade)"/>
    </g>
    <rect width="200" height="250" rx="10" fill="none" stroke="url(#g4)" stroke-width="1.5"/>
    <circle cx="183" cy="14" r="3.5" fill="#3fb950"/><circle class="live" cx="183" cy="14" r="6" fill="none" stroke="#3fb950" stroke-width=".7"/>
    <g filter="url(#txtSh)">
      <text x="100" y="195" text-anchor="middle" font-family="'Segoe UI',system-ui,sans-serif" font-size="15" fill="#fff" font-weight="700">WhaleFriend</text>
      <text x="100" y="213" text-anchor="middle" font-family="'Segoe UI',system-ui,sans-serif" font-size="9" fill="#c9d1d9" opacity=".9">6개 해역 × 18마리 고래 · 과학적 코다 시뮬</text>
      <text x="100" y="237" text-anchor="middle" font-family="'Segoe UI',system-ui,sans-serif" font-size="8.5" fill="#6dd5ed" letter-spacing="1" opacity=".8">3D UNDERWATER · GEMINI AI</text>
    </g>
  </g></g>
  </a>
CARD4

# Card 2: Chiwi (right)
cat >> "$OUT" << CARD2
  <!-- Card 2: Chiwi Defense -->
  <a href="https://github.com/gogoonbuntu/gogoonbuntu/tree/main/projects/chiwi-pixel-rpg" target="_blank">
  <g class="c2" filter="url(#ds)"><g transform="translate(-100,-135)">
    <g clip-path="url(#cardClip)">
      <image href="data:image/jpeg;base64,${B64_CHIWI}" x="0" y="0" width="200" height="250" preserveAspectRatio="xMidYMid slice"/>
      <rect width="200" height="250" fill="url(#fade)"/>
      <rect width="200" height="250" fill="url(#topFade)"/>
    </g>
    <rect width="200" height="250" rx="10" fill="none" stroke="url(#g2)" stroke-width="1.5"/>
    <circle cx="183" cy="14" r="3.5" fill="#3fb950"/><circle class="live" cx="183" cy="14" r="6" fill="none" stroke="#3fb950" stroke-width=".7"/>
    <g filter="url(#txtSh)">
      <text x="100" y="195" text-anchor="middle" font-family="'Segoe UI',system-ui,sans-serif" font-size="15" fill="#fff" font-weight="700">Chiwi Defense</text>
      <text x="100" y="213" text-anchor="middle" font-family="'Segoe UI',system-ui,sans-serif" font-size="9" fill="#c9d1d9" opacity=".9">25,000줄 Canvas · 5직업 × 18무기 × 10필드</text>
      <text x="100" y="237" text-anchor="middle" font-family="'Segoe UI',system-ui,sans-serif" font-size="8.5" fill="#f5af19" letter-spacing="1" opacity=".8">341 BALANCE TESTS ✓</text>
    </g>
  </g></g>
  </a>
CARD2

# Card 5: Card RPG (left)
cat >> "$OUT" << CARD5
  <!-- Card 5: Card RPG Arena -->
  <a href="https://github.com/gogoonbuntu/gogoonbuntu/tree/main/projects/cardrpg" target="_blank">
  <g class="c5" filter="url(#ds)"><g transform="translate(-100,-135)">
    <g clip-path="url(#cardClip)">
      <image href="data:image/jpeg;base64,${B64_CARD}" x="0" y="0" width="200" height="250" preserveAspectRatio="xMidYMid slice"/>
      <rect width="200" height="250" fill="url(#fade)"/>
      <rect width="200" height="250" fill="url(#topFade)"/>
    </g>
    <rect width="200" height="250" rx="10" fill="none" stroke="url(#g5)" stroke-width="1.5"/>
    <circle cx="183" cy="14" r="3.5" fill="#3fb950"/><circle class="live" cx="183" cy="14" r="6" fill="none" stroke="#3fb950" stroke-width=".7"/>
    <g filter="url(#txtSh)">
      <text x="100" y="195" text-anchor="middle" font-family="'Segoe UI',system-ui,sans-serif" font-size="15" fill="#fff" font-weight="700">Card RPG Arena</text>
      <text x="100" y="213" text-anchor="middle" font-family="'Segoe UI',system-ui,sans-serif" font-size="9" fill="#c9d1d9" opacity=".9">부스터 팩 · 덱 빌더 · 실시간 전투 엔진</text>
      <text x="100" y="237" text-anchor="middle" font-family="'Segoe UI',system-ui,sans-serif" font-size="8.5" fill="#f5af19" letter-spacing="1" opacity=".8">ATK · DEF · SPELL · TRAP</text>
    </g>
  </g></g>
  </a>
CARD5

# Card 1: 3D Gallery (front center — hero card)
cat >> "$OUT" << CARD1
  <!-- Card 1: 3D Gallery (front) -->
  <a href="https://github.com/gogoonbuntu/gogoonbuntu/tree/main/projects/3dgallery" target="_blank">
  <g class="c1" filter="url(#ds)"><g transform="translate(-100,-135)">
    <g clip-path="url(#cardClip)">
      <image href="data:image/jpeg;base64,${B64_GALLERY}" x="0" y="0" width="200" height="250" preserveAspectRatio="xMidYMid slice"/>
      <rect width="200" height="250" fill="url(#fade)"/>
      <rect width="200" height="250" fill="url(#topFade)"/>
    </g>
    <rect width="200" height="250" rx="10" fill="none" stroke="url(#g1)" stroke-width="2"/>
    <circle cx="183" cy="14" r="3.5" fill="#3fb950"/><circle class="live" cx="183" cy="14" r="6" fill="none" stroke="#3fb950" stroke-width=".7"/>
    <g filter="url(#txtSh)">
      <text x="100" y="195" text-anchor="middle" font-family="'Segoe UI',system-ui,sans-serif" font-size="15" fill="#fff" font-weight="700">온전 Onliex</text>
      <text x="100" y="213" text-anchor="middle" font-family="'Segoe UI',system-ui,sans-serif" font-size="9" fill="#c9d1d9" opacity=".9">코드 없이 3D 갤러리 개설 · 실시간 멀티플레이</text>
      <text x="100" y="237" text-anchor="middle" font-family="'Segoe UI',system-ui,sans-serif" font-size="8.5" fill="#a78bfa" letter-spacing="1" opacity=".8">IMMERSIVE 3D · MULTIPLAYER</text>
    </g>
  </g></g>
  </a>
CARD1

# Status bar and corners
cat >> "$OUT" << 'SVGEND'
  <!-- Status bar -->
  <rect x="230" y="468" width="440" height="32" rx="16" fill="#161b22" stroke="#30363d" stroke-width=".8"/>
  <text x="300" y="488" text-anchor="middle" font-family="'Segoe UI',system-ui,sans-serif" font-size="11" fill="#58a6ff">🍣</text>
  <text x="348" y="488" text-anchor="middle" font-family="'Segoe UI',system-ui,sans-serif" font-size="10" fill="#8b949e">회전 전시중</text>
  <circle cx="400" cy="484" r="3" fill="#3fb950"/>
  <text x="438" y="488" text-anchor="middle" font-family="'Segoe UI',system-ui,sans-serif" font-size="10" fill="#8b949e">All Live</text>
  <text x="492" y="488" text-anchor="middle" font-family="'Segoe UI',system-ui,sans-serif" font-size="11" fill="#58a6ff">✦</text>
  <text x="545" y="488" text-anchor="middle" font-family="'Segoe UI',system-ui,sans-serif" font-size="10" fill="#8b949e">5 Services</text>
  <!-- Corners -->
  <path d="M20,16 L20,6 Q20,2 24,2 L34,2" fill="none" stroke="#58a6ff" stroke-width="1" opacity=".2"/>
  <path d="M880,16 L880,6 Q880,2 876,2 L866,2" fill="none" stroke="#58a6ff" stroke-width="1" opacity=".2"/>
  <path d="M20,504 L20,514 Q20,518 24,518 L34,518" fill="none" stroke="#58a6ff" stroke-width="1" opacity=".2"/>
  <path d="M880,504 L880,514 Q880,518 876,518 L866,518" fill="none" stroke="#58a6ff" stroke-width="1" opacity=".2"/>
</svg>
SVGEND

echo "✅ Built carousel SVG → $OUT ($(wc -c < "$OUT" | tr -d ' ') bytes)"
