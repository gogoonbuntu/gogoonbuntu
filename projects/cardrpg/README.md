# Card RPG Arena

Expo + Vercel + Firebase(Firestore) 기준으로 바로 웹 배포할 수 있게 만든 심플 카드 배틀 RPG입니다.

## 포함된 기능

- 카드 수집: 부스터 3장 오픈, 중복 포함 수집형 콜렉션
- 성장: 플레이어 레벨, XP, 랭크, 스테이지 해금
- 덱 편성: 8장 덱에서 카드 복수 장수 편성 가능
- 전투: 공격 포지션 / 수비 포지션 / 스펠 / 트랩 / 직접 공격 / 가드 우선 타깃팅
- 저장: Firebase 환경변수가 있으면 Firestore 저장, 없으면 브라우저 로컬 저장
- 배포: `expo export --platform web` 기준 Vercel 정적 배포 설정 포함

## 실행

```bash
npm install
npm run web
```

웹 프로덕션 빌드는 아래 명령으로 생성됩니다.

```bash
npm run build:web
```

## Firebase 설정

`.env.example`를 참고해서 아래 값을 `.env.local` 또는 Vercel 환경변수로 넣어 주세요.

- `EXPO_PUBLIC_FIREBASE_API_KEY`
- `EXPO_PUBLIC_FIREBASE_AUTH_DOMAIN`
- `EXPO_PUBLIC_FIREBASE_PROJECT_ID`
- `EXPO_PUBLIC_FIREBASE_STORAGE_BUCKET`
- `EXPO_PUBLIC_FIREBASE_MESSAGING_SENDER_ID`
- `EXPO_PUBLIC_FIREBASE_APP_ID`

`EXPO_PUBLIC_FIREBASE_MEASUREMENT_ID`는 선택값입니다.

현재 저장 경로는 Firestore의 `saves/{profileId}` 문서입니다.

## Vercel 배포

[`vercel.json`](/Users/user/dev/cardrpg/cardrpg/vercel.json)에 빌드 명령 `npm run build:web`, 출력 디렉터리 `dist`가 설정되어 있습니다.

## 주요 구조

- [`App.tsx`](/Users/user/dev/cardrpg/cardrpg/App.tsx): 전체 UI와 탭 전환
- [`src/types/game.ts`](/Users/user/dev/cardrpg/cardrpg/src/types/game.ts): 카드/전장/성장/저장 타입
- [`src/data/cards.ts`](/Users/user/dev/cardrpg/cardrpg/src/data/cards.ts): 카드 풀, 스타터 덱, 적 덱
- [`src/game/battle.ts`](/Users/user/dev/cardrpg/cardrpg/src/game/battle.ts): 공격/수비/스펠/트랩 전투 엔진
- [`src/game/progression.ts`](/Users/user/dev/cardrpg/cardrpg/src/game/progression.ts): 성장, 덱 빌더, 부스터, 보상 처리
- [`src/lib/useCardRpg.ts`](/Users/user/dev/cardrpg/cardrpg/src/lib/useCardRpg.ts): 앱 상태 훅
- [`src/lib/storage.ts`](/Users/user/dev/cardrpg/cardrpg/src/lib/storage.ts): 로컬/Firebase 저장 추상화
