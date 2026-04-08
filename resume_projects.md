# 이력서 추가 — 개인 프로젝트 (사이드 프로젝트)

> 아래 내용을 기존 이력서의 "주요 프로젝트 및 성과" 하단 또는 별도 "개인 프로젝트" 섹션으로 추가하시면 됩니다.

---

## 개인 프로젝트 (Side Projects)

> 기획 → 설계 → 개발 → 배포까지 1인 풀스택으로 완성한 서비스들입니다.

---

🔎 **KLS Connect — 동문 네트워크 커뮤니티 플랫폼** (2025.09 ~ 현재, 지속 운영)

배경: 1,000명+ 동문(35개+ 기수)이 카카오톡 단체방에 의존하고 있었습니다. 중요 공지가 대화에 묻히고, 개인정보(연락처·주소)가 암호화 없이 공유되며, 동문 명부가 산재되어 관리가 불가능한 상황이었습니다. "카카오에 의존하지 않는 자체 커뮤니티"를 기획하게 된 계기입니다.

챌린지: ① 비기술 사용자(40~60대 동문)의 앱 설치 허들 — Flutter WebView 초기 프로토타입의 50MB 번들이 이탈의 원인 ② 1,000명 규모 피드에서 "볼 게 없다" 문제 — 단순 시간순으로는 참여 유도가 어려움 ③ 개인정보 보안 — 동문 명부(연락처·주소)가 평문 저장 시 감사 리스크

솔루션: Flutter WebView → Expo React Native 마이그레이션으로 번들 50MB → 15MB 축소(70% 감소). 4-factor 추천 피드 엔진(Relevance 40% / Engagement 30% / Recency 20% / Diversity 10%)으로 개인화 피드를 구현하고, 11종 미니게임+리더보드로 일일 재방문을 유도했습니다. AES-256 개인정보 암호화 + IntersectionObserver 행동 추적(Firestore write 90% 절감)으로 보안과 비용을 동시 해결했습니다.

성과: 웹 18개 라우트, API 33개 엔드포인트, Firestore 15+ 컬렉션, iOS + Android 정식 출시. 카카오톡 의존 탈피 → 정보 영구 보존·명부 보안·참여율 향상을 실현했습니다.

기술: Next.js 14 (App Router), Expo SDK 55, React Native, TypeScript, Tailwind CSS 4, shadcn/ui, Firebase (Firestore + Auth + Storage), Leaflet, Recharts, Zod, Vercel, EAS Build

🔗 https://v0-klsconnect3.vercel.app

---

🔎 **Chiwi: Divine Line Defense — 2D 픽셀 라인 디펜스 RPG** (2026.01 ~ 현재, 지속 업데이트)

배경: "외부 게임 엔진 없이, 웹 기술만으로 상용 수준의 게임을 만들 수 있을까?"라는 기술적 도전에서 출발했습니다. Unity/Unreal 같은 엔진 없이 Vanilla Canvas 2D + TypeScript만으로 5종 직업 × 18종 무기 × 10개 필드의 RPG를 구현하는 것이 목표였습니다.

챌린지: ① 게임 밸런스 — 90가지 직업×무기 조합의 DPS가 수동 튜닝으로는 불가능 ② 사운드 에셋 — 예산 0원에서 BGM·효과음을 어떻게 확보할 것인가 ③ 크로스플랫폼 — 동일 코드베이스로 웹·iOS·Android를 어떻게 동시 배포할 것인가

솔루션: 341개 밸런스 테스트 자동 검증 시스템을 구축하여 DPS 밸런싱을 시스템화했습니다. Web Audio API로 외부 오디오 파일 0개의 프로시저럴 사운드 시스템(1,607줄)을 구현하여 에셋 비용 문제를 해결했습니다. Flutter WebView + Bridge 패턴으로 웹 코드 변경 없이 네이티브 앱 배포를 달성했고, PixelLab API로 AI 스프라이트 자동 생성 파이프라인을 구축하여 에셋 작업 시간을 90% 단축했습니다.

성과: 25,600 LOC(55개 파일)의 풀 게임 엔진 자체 개발. App Store / Play Store 심사 완료(ATT, 계정 삭제, 구매 복원, ProGuard 등). 40+ 유닛 동시 전투에서 60fps 유지.

기술: TypeScript, Canvas 2D API, Web Audio API, Vite, Firebase (Auth + Firestore), Flutter (InAppWebView), AdMob, in_app_purchase, Vercel

🔗 https://chiwi-pixel-rpg.vercel.app

---

🔎 **온전 Onliex — 3D 가상 전시회 플랫폼** (2026.01, 약 2주 진행)

배경: 코로나 이후 온라인 전시 수요가 폭발했지만, 기존 솔루션은 2D 슬라이드쇼이거나 VR 앱 설치가 필요했습니다. "브라우저만 열면 즉시 3D 갤러리를 체험하고, 다른 방문자와 함께 감상할 수 있는" 플랫폼을 기획했습니다. 또한 비기술자(작가·갤러리스트)가 5분 안에 전시를 열 수 있는 노코드 UX가 핵심이었습니다.

챌린지: ① 동시 접속 비용 — 100명 실시간 위치 동기화 × 초당 1회 = 시간당 360,000 Firestore 읽기 → 비용 폭발 ② WebGL 불안정 — 모바일 Safari 탭 전환 시 컨텍스트 손실 → 검은 화면 ③ 비동기 초기화 — Firebase·WebGL·멀티플레이어 동시 초기화 시 Race Condition

솔루션: Firebase Dual DB 전략(Firestore: 영속 데이터 / Realtime DB: 위치 동기화)으로 비용 구조를 **읽기 횟수 → bandwidth 과금**으로 전환하여 비용을 대폭 절감했습니다. WebGL Context Loss 4단계 방어(저전력 GPU → 디바운스 핸들링 → 자동 재시도 → Canvas Key 교체)로 안정성을 확보했습니다. Phase-based 워터풀 초기화 패턴(200ms → 600ms → 1,400ms 순차 로딩)으로 Race Condition을 근본 해결했습니다.

성과: 서버 없이 100명+ 동시 접속 지원. 210가지 공간 디자인 커스터마이징. Freemium 비즈니스 모델(광고 슬롯, 작품 Analytics) 설계 완료. Vercel CDN 글로벌 배포 운영 중.

기술: React 19, Three.js (R3F/Drei), TypeScript, Zustand, Firebase (Firestore + Realtime DB + Auth), Vite 7, Vercel

🔗 https://3-dgallery.vercel.app

---

🔎 **WhaleFriend — 향유고래 소통 시뮬레이션 웹앱** (2026.02, 약 2주 진행)

배경: Nature Communications(2024)에서 향유고래 코다(Coda)에 알파벳 같은 조합 체계가 있다는 연구가 발표되었습니다. "논문에서만 존재하던 고래 소통 연구를 일반인이 직접 체험할 수 있는 형태로 만들 수 있을까?"라는 질문에서 출발했습니다. 과학적 정확성을 유지하면서 대중이 즐길 수 있는 인터랙티브 체험이 기획 핵심이었습니다.

챌린지: ① 과학적 정확성 — 논문 4축 코다 구조를 게이미피케이션하면서도 왜곡하면 안 됨 ② 음향 합성 — 고래 클릭 사운드 5종을 실제 주파수 특성대로 합성해야 함 ③ AI 의존성 — Gemini 무료 쿼터 소진 시 서비스 중단 위험

솔루션: Nature Communications 등 8편 논문의 4축 코다 구조(Rhythm·Tempo·Rubato·Ornamentation)를 정밀 모델링하여 과학적 정직성을 확보했습니다. Web Audio API로 개체별 체장 비례 공명 주파수 차이를 구현한 5종 발성 합성 엔진을 개발했습니다. Gemini + Groq + SambaNova + OpenRouter + Mistral의 **5-provider 10-step 자동 failover 체인**을 설계하여 단일 API 의존을 제거했습니다.

성과: 6개 해역 × 18마리 고래 × 9개 대화 의도의 과학적 소통 시뮬레이터 완성. Google 로그인 + Firestore로 크로스디바이스 이어하기 제공.

기술: Expo + React Native Web, Three.js (@react-three/fiber), Web Audio API, TypeScript, Gemini API, Groq API, Firebase (Auth + Firestore), Web Push API, Web Speech API, Vercel

🔗 https://whalefriend.vercel.app

---

🔎 **AI 농장 시뮬레이션 — 과학적 작물 성장 모델 기반 가상 농업 시뮬레이터** (2026.04, 약 1주 진행)

배경: 스마트팜·AI 농업이 국가 핵심 산업으로 부상하고 있지만, 실제 농업 과학 모델을 체험할 수 있는 시뮬레이터는 전무했습니다. 학술용 DSSAT/APSIM은 전문가만 사용 가능하고, 기존 농업 게임은 과학적 근거가 없었습니다. "브라우저에서 실제 농학 논문 기반으로 농사를 지어보는 경험"을 기획했습니다.

챌린지: ① 과학 모델 구현 — DSSAT의 GDD 적산온도·바이오매스 분배·다중 스트레스 상호작용을 정확하게 코드화해야 함 ② 확률적 기상 — 완전 랜덤은 게임 밸런스를 파괴하지만 결정론적이면 시뮬레이션 가치가 없음 ③ 프레임워크 없는 복잡도 — React 등 프레임워크 없이 7,100줄 규모의 시뮬레이션+3D+UI를 구조적으로 관리해야 함

솔루션: DSSAT CERES 코어 알고리즘(GDD·RUE×PAR×LAI·4축 스트레스 가중합)을 721줄의 작물 엔진으로 정밀 구현했습니다. 기상청 실측 데이터 기반 가우시안 확률 분포 + 쿨다운 가드레일로 현실성과 밸런스를 동시 확보했습니다. EventBus + Registry 패턴으로 프레임워크 없이 엔진 간 느슨한 결합을 달성하여, 코드 변경 없이 새 작물/토양 추가가 가능한 데이터 드리븐 확장 구조를 구현했습니다.

성과: 6개 기후권역 × 7종 토양 × 8종 작물 × 6종 시설 × 6종 AI 장비의 조합 시뮬레이션. 통계청·농진청·FAO-56 기반 실제 데이터 적용. Three.js 3D 농장 시각화 + 종합 리포트 시스템.

기술: JavaScript (ES2024), Three.js r183, Vite 8, EventBus 패턴, Registry 패턴, DSSAT/APSIM 기반 GDD 모델

🔗 https://choosukkum.vercel.app

---

🔎 **Card RPG Arena — 카드 배틀 RPG** (2026.01, 약 3일 진행)

배경: "최소한의 시간으로 핵심 게임 루프(수집→편성→전투)를 완결하는 프로토타이핑 능력"을 실험한 프로젝트입니다. 부스터 시스템·덱 빌더·전투 엔진의 3대 코어를 3일 안에 구현하는 것이 목표였습니다.

챌린지: ① 3일 내 완결 — 기획·디자인·개발·배포를 극한의 타임박스 안에서 완성해야 함 ② 저장소 유연성 — Firebase 설정 없이도 로컬 환경에서 즉시 플레이 가능해야 함

솔루션: 공격/수비 포지션·스펠·트랩·직접 공격·가드 우선 타깃팅의 전투 엔진을 핵심부터 설계하고, 성장 시스템(레벨·XP·랭크·스테이지 해금)은 데이터 테이블 기반으로 빠르게 확장했습니다. Firebase 환경변수 유무에 따라 Firestore/localStorage를 자동 전환하는 저장 추상화 레이어를 설계하여, 제로 설정 플레이와 클라우드 세이브를 양립시켰습니다.

성과: 3일 만에 완결된 웹 게임 — 부스터 수집·8장 덱 편성·턴제 전투까지 Vercel 정적 배포로 즉시 플레이 가능.

기술: Expo, React Native, TypeScript, Firebase (Firestore), Vercel

🔗 https://cardrpg.vercel.app

---

## 보유 기술 (추가 반영 사항)

아래 항목을 기존 "보유 기술"에 추가·보완할 수 있습니다:

| 영역 | 추가 기술 |
|------|----------|
| **Frontend** | React 19, Next.js 14, Expo (React Native), Three.js (R3F), Tailwind CSS 4, shadcn/ui, Zustand, Canvas 2D API, Web Audio API |
| **Backend & Cloud** | Firebase (Firestore, Realtime DB, Auth, Storage, Cloud Functions), Vercel (Serverless, Edge Runtime, Cron) |
| **모바일** | Expo SDK 55, EAS Build, Flutter (WebView Bridge), AdMob, in_app_purchase, App Store / Play Store 출시 |
| **AI/ML** | Gemini API, Groq API, PixelLab API (AI 에셋 생성), Multi-Provider Failover 아키텍처 |
| **시뮬레이션** | DSSAT/APSIM 작물 모델, GDD 적산온도, FAO-56 증발산, 확률적 기상 엔진, 바이오매스 분배 모델 |
| **기타** | Web Push API, Web Speech API, PWA, Leaflet, SEO (JSON-LD, OG Tags), 밸런스 자동 검증 시스템 |
