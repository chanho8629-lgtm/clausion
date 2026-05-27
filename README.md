<div align="center">

# 🧠 Clausion - AI 기반 학습 운영 플랫폼

> 학생의 학습 데이터를 수집하고, AI 디지털 트윈으로 상태를 분석해  
> 복습, 회고, 추천, 스터디그룹, 상담까지 연결하는 교육 운영 플랫폼입니다.  
> 학생, 강사, 운영자가 하나의 데이터 흐름 안에서 학습 리스크를 발견하고 개입할 수 있도록 설계했습니다.


![Spring Boot](https://img.shields.io/badge/Spring_Boot-3.3-6DB33F?style=flat-square&logo=springboot&logoColor=white)
![React](https://img.shields.io/badge/React-19-61DAFB?style=flat-square&logo=react&logoColor=black)
![TypeScript](https://img.shields.io/badge/TypeScript-6-3178C6?style=flat-square&logo=typescript&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16-4169E1?style=flat-square&logo=postgresql&logoColor=white)
![Redis](https://img.shields.io/badge/Redis-7-DC382D?style=flat-square&logo=redis&logoColor=white)
![RabbitMQ](https://img.shields.io/badge/RabbitMQ-3-FF6600?style=flat-square&logo=rabbitmq&logoColor=white)

<br>



</div>

---

## 🎯 기획 의도

Clausion은 학습자의 상태를 단순 점수로만 판단하지 않고, **출석, 복습, 회고, 코드 제출, 상담, 스터디그룹 활동** 같은 학습 과정 데이터를 종합해 더 빠르게 리스크를 발견하기 위해 기획했습니다.

1. **학습 리스크 조기 발견**
   - 강사가 모든 학생의 상태를 수동으로 추적하기 어렵기 때문에, AI 디지털 트윈이 약점과 위험 신호를 계산하도록 구성했습니다.

2. **개인화된 학습 루프**
   - 학생에게 복습 과제, 다음 액션, 추천 학습 경로를 제공해 학습 → 피드백 → 재학습 흐름을 만들었습니다.

3. **상담과 개입의 자동화**
   - 상담 전 브리핑, 상담 후 액션 플랜, 운영자 개입 센터를 통해 교육자가 더 빠르게 대응할 수 있도록 설계했습니다.

4. **실시간 협업 학습**
   - 스터디그룹 채팅, 알림, LiveKit 기반 화상 상담으로 온라인 학습 환경에서도 학생 간 연결과 강사 개입이 가능하도록 했습니다.

---

## 🚀 서비스 개요

Clausion은 역할별로 다른 화면과 기능을 제공합니다.

| 역할 | 핵심 기능 |
|------|-----------|
| **Student** | 대시보드, 복습, 회고, 다음 학습 추천, 스터디그룹, 그룹 채팅, 상담, 출석, 실습 |
| **Instructor** | 강사 대시보드, 커리큘럼 업로드, 문제은행, 학생 상세 분석, 상담 관리, 출석 관리, 공지 |
| **Operator** | 과정 관리, 학생/강사 관리, 리스크 개입 센터, 운영 리포트, 시뮬레이션, 감사 로그 |

---

## 📸 화면 캡처 / 근거 자료

> 아래 이미지는 프론트엔드를 로컬에서 실행한 뒤 Playwright로 캡처한 실제 화면입니다.  
> 백엔드 서버 없이 화면 구성을 검증하기 위해 API 응답은 캡처용 Mock 데이터로 대체했습니다.

### Public

<img src="docs/images/screenshots/landing.png" alt="Clausion landing page" width="950">

<img src="docs/images/screenshots/login.png" alt="Clausion login page" width="950">

<img src="docs/images/screenshots/register.png" alt="Clausion register page" width="950">

### Student

<img src="docs/images/screenshots/student-dashboard.png" alt="Student dashboard" width="950">

<img src="docs/images/screenshots/student-review.png" alt="Student review workspace" width="950">

<img src="docs/images/screenshots/student-study-groups.png" alt="Student study groups" width="950">

<img src="docs/images/screenshots/student-group-chat.png" alt="Student group chat" width="950">

### Instructor

<img src="docs/images/screenshots/instructor-dashboard.png" alt="Instructor dashboard" width="950">

<img src="docs/images/screenshots/instructor-curriculum.png" alt="Instructor curriculum upload" width="950">

<img src="docs/images/screenshots/instructor-students.png" alt="Instructor student monitoring" width="950">

<img src="docs/images/screenshots/instructor-student-detail.png" alt="Instructor student detail" width="950">

### Operator

<img src="docs/images/screenshots/operator-dashboard.png" alt="Operator dashboard" width="950">

<img src="docs/images/screenshots/operator-courses.png" alt="Operator course management" width="950">

<img src="docs/images/screenshots/operator-invite-codes.png" alt="Operator invite code management" width="950">

<img src="docs/images/screenshots/operator-audit.png" alt="Operator audit log" width="950">

---

## 🛠 기술 스택

| 구분 | 기술/도구 |
|------|-----------|
| **Frontend** | React 19, TypeScript, Vite, Tailwind CSS, React Router, React Query, Zustand |
| **Backend** | Java 17, Spring Boot 3.3, Spring Security, JPA, WebFlux, WebSocket |
| **AI** | OpenAI API, AI Job Queue, Digital Twin Inference, Code Review AI, Recommendation AI |
| **Database** | PostgreSQL 16, Flyway Migration |
| **Cache/Queue** | Redis, RabbitMQ |
| **Realtime** | STOMP WebSocket, SSE, LiveKit |
| **Infra** | Docker Compose, AWS S3 |
| **Test** | JUnit5, Spring Security Test, H2 |

---

## 📁 프로젝트 구조

```text
clausion
├── backend
│   ├── src/main/java/com/classpulse
│   │   ├── api            # REST API Controller
│   │   ├── ai             # AI 분석/추천/상담/디지털 트윈 서비스
│   │   ├── config         # Security, JWT, Redis, RabbitMQ, S3, WebSocket
│   │   ├── domain         # JPA Entity, Repository, Domain Service
│   │   ├── notification   # 알림, SSE, RabbitMQ Consumer/Publisher
│   │   └── seed           # 개발용 Mock Data
│   └── src/main/resources
│       └── db/migration   # Flyway SQL
├── frontend
│   └── src
│       ├── api            # API Client
│       ├── components     # 공통/역할별 UI 컴포넌트
│       ├── hooks          # 화면별 커스텀 훅
│       ├── pages          # Student / Instructor / Operator 페이지
│       ├── store          # Zustand 상태 관리
│       └── types          # TypeScript 타입
└── docker-compose.yml
```

---

## ▶ 실행 방법

### Docker Compose 실행

```bash
cp .env.example .env
docker compose up -d
```

### 로컬 포트

| 서비스 | 주소 |
|--------|------|
| Frontend | `http://localhost:3000` |
| Backend | `http://localhost:8080` |
| PostgreSQL | `localhost:5432` |
| Redis | `localhost:6379` |
| RabbitMQ Management | `http://localhost:15672` |
| LiveKit | `ws://localhost:7880` |

### 개발 실행

```bash
# backend
cd backend
./gradlew bootRun

# frontend
cd frontend
npm install
npm run dev
```

Windows에서는 `./gradlew` 대신 `.\gradlew.bat`을 사용합니다.

---

## ✅ 주요 기능

### 👨‍🎓 1. 학생 학습 경험

- 학습 상태 대시보드
- 복습 과제 및 회고 기록
- 다음 학습 액션 추천
- 스터디그룹 매칭 및 그룹 채팅
- 출석, 실습, 공지 확인
- 상담 예약 및 LiveKit 화상 상담

### 👩‍🏫 2. 강사 운영 도구

- 강사 대시보드
- 커리큘럼 업로드 및 AI 분석
- 문제은행 관리
- 학생 목록 및 학생 상세 리스크 분석
- 상담 일정/상담 내용 관리
- 출석 관리 및 공지 작성

### 🧑‍💼 3. 운영자 관리

- 과정 관리 및 과정 상세
- 학생/강사 계정 관리
- 리스크 개입 센터
- 운영 리포트
- What-if 시뮬레이션
- 초대 코드 관리
- 감사 로그 확인

### 🤖 4. AI 기능

- 디지털 트윈 기반 학습 상태 추론
- 약점 스킬 및 리스크 점수 계산
- 복습/추천/다음 액션 생성
- 코드 리뷰 AI 피드백
- 상담 Copilot 브리핑
- 스터디그룹 매칭
- 커리큘럼 분석 및 문제 생성

### 🔔 5. 실시간 기능

- SSE 기반 알림
- RabbitMQ 기반 메시지 처리
- STOMP WebSocket 그룹 채팅
- LiveKit 기반 상담 화상 연결

---

## 🗄 데이터/마이그레이션

Flyway 기반으로 스키마를 관리합니다.

| Migration | 내용 |
|-----------|------|
| `V1__init_schema.sql` | 기본 스키마 |
| `V2__v2_features.sql` | 주요 기능 확장 |
| `V3__seed_badges.sql` | 배지 데이터 |
| `V4__action_plans.sql` | 상담 액션 플랜 |
| `V5__seed_course_data.sql` | 과정 Seed |
| `V6__twin_enhanced_inference.sql` | 디지털 트윈 추론 개선 |
| `V9__group_chat_messages.sql` | 그룹 채팅 메시지 |
| `V10__course_schedule.sql` | 과정 일정 |
| `V11__group_chat_file_support.sql` | 그룹 채팅 파일 지원 |

---

## 🔀 핵심 흐름

```text
학생 활동 데이터 수집
        ↓
Digital Twin Inference
        ↓
약점/리스크/학습 상태 계산
        ↓
복습 과제 · 추천 · 상담 브리핑 · 스터디그룹 매칭
        ↓
강사/운영자 대시보드에서 개입 및 추적
```

---

## 🚨 오류 상황들

### **1. 무거운 AI 작업을 분리하자**

#### **문제 상황**

- 커리큘럼 분석, 문제 생성, 디지털 트윈 추론, 코드 리뷰처럼 OpenAI API를 사용하는 기능은 응답 시간이 길어질 수 있었습니다.
- 사용자가 버튼을 누른 뒤 API 요청이 끝날 때까지 화면이 멈춘 것처럼 보이고, 네트워크 상태나 AI 응답 지연에 따라 타임아웃 위험이 있었습니다.

#### **문제 원인**

- AI 기능을 일반 CRUD API처럼 동기 방식으로 처리하면, 사용자 요청과 AI 분석 작업이 같은 흐름에 묶입니다.
- 특히 커리큘럼 분석과 문제 생성은 입력 텍스트가 길고 결과 생성량도 많아, 즉시 응답이 필요한 화면 흐름과 맞지 않았습니다.

#### **해결 방안**

- `AsyncJob` 테이블을 기준으로 작업 상태를 먼저 생성하고, 실제 AI 처리는 `@Async("aiTaskExecutor")`로 백그라운드에서 실행되도록 분리했습니다.
- 프론트엔드는 `jobId`를 받은 뒤 `/api/jobs/{jobId}/status`를 polling하여 `PROCESSING`, `COMPLETED`, `FAILED` 상태를 확인하도록 구성했습니다.
- 실패 시에도 `failJob()`으로 에러 메시지를 저장해, 사용자가 무한 로딩에 갇히지 않고 실패 상태를 확인할 수 있게 했습니다.

```text
요청 → AsyncJob 생성(PROCESSING) → 즉시 jobId 반환
        ↓
백그라운드 AI 처리
        ↓
COMPLETED / FAILED 상태 저장
        ↓
프론트에서 상태 조회 후 결과 반영
```

---

### **2. EventSource에는 Authorization Header를 넣을 수 없다**

#### **문제 상황**

- 실시간 알림을 SSE로 연결할 때 일반 API처럼 `Authorization: Bearer ...` 헤더를 붙일 수 없었습니다.
- JWT 인증이 필요한 알림 스트림에서 토큰이 전달되지 않으면 서버가 사용자를 식별하지 못해 실시간 알림 연결이 실패할 수 있었습니다.

#### **문제 원인**

- 브라우저의 기본 `EventSource` API는 커스텀 헤더를 지원하지 않습니다.
- 일반 `fetch` 요청에서는 Authorization 헤더를 붙일 수 있지만, SSE 연결은 별도 방식으로 인증 정보를 전달해야 했습니다.

#### **해결 방안**

- 프론트에서 localStorage의 JWT를 읽어 `/api/notifications/stream?token=...` 형태로 쿼리 파라미터에 전달했습니다.
- 최초 알림 목록은 `/api/notifications`로 한 번 조회하고, 이후 실시간 이벤트는 SSE로 병합했습니다.
- 연결 실패 시 무한 재시도를 막기 위해 최대 5회, 5초부터 시작하는 지수 백오프 재연결 로직을 적용했습니다.

```text
초기 알림 조회: GET /api/notifications
실시간 연결:    GET /api/notifications/stream?token={JWT}
재연결 정책:    5s → 10s → 20s → 40s → 80s
```

---

### **3. 역할별 화면 접근을 한 번 더 막자**

#### **문제 상황**

- 학생, 강사, 운영자가 각각 다른 URL과 화면을 사용하기 때문에, 로그인 후 잘못된 경로로 접근하면 권한에 맞지 않는 화면이 열릴 수 있었습니다.
- 예를 들어 학생 계정으로 `/operator` 화면에 접근하거나, 운영자 계정으로 `/student` 화면에 접근하는 경우를 막아야 했습니다.

#### **문제 원인**

- 백엔드에서 Role 기반 권한 검사를 하더라도, 프론트 라우팅 단계에서 잘못된 화면이 잠깐 렌더링되면 사용자 경험이 어색해집니다.
- 또한 브라우저 뒤로가기, 새로고침, 다른 탭 로그인 상태 변경처럼 세션 상태가 바뀌는 상황도 함께 고려해야 했습니다.

#### **해결 방안**

- `ProtectedRoute`에서 JWT와 사용자 정보를 확인하고, `allowedRoles`에 포함되지 않으면 해당 역할의 기본 경로로 이동하도록 처리했습니다.
- `AuthSessionSync`에서 `pageshow`, `focus`, `popstate`, `storage`, `visibilitychange` 이벤트를 감지해 localStorage의 최신 로그인 상태를 다시 동기화했습니다.
- 토큰이나 사용자 정보가 사라진 경우 React Query 캐시를 비우고 로그인 페이지로 이동시켜 이전 계정의 데이터가 화면에 남지 않도록 했습니다.

```text
STUDENT    → /student
INSTRUCTOR → /instructor
OPERATOR   → /operator
```

---

### **4. 화상 상담 종료 요청이 중복 호출되는 문제**

#### **문제 상황**

- LiveKit 화상 상담 화면에서 사용자가 직접 통화를 종료하는 경우와 컴포넌트 unmount cleanup이 겹치면, 상담 종료 API가 두 번 호출될 수 있었습니다.
- 같은 상담에 대해 `/end-video` 요청이 중복되면 서버 상태 변경이나 로그가 중복 기록될 위험이 있었습니다.

#### **문제 원인**

- 화상 상담은 브라우저 권한, 네트워크 연결, 화면 이탈, 수동 종료처럼 종료 경로가 여러 개입니다.
- `handleEndCall`과 React cleanup이 모두 `disconnect()`를 호출할 수 있어, 종료 처리가 멱등적으로 설계되지 않으면 중복 요청이 발생할 수 있었습니다.

#### **해결 방안**

- `isDisconnectingRef`를 두어 이미 종료 처리 중이면 두 번째 `disconnect()` 호출은 바로 반환하도록 막았습니다.
- LiveKit 연결 종료, 오디오 엘리먼트 제거, 화면 공유 상태 초기화를 한 흐름으로 묶어 브라우저 리소스가 남지 않도록 정리했습니다.
- 카메라/마이크 권한 거부 시에는 원본 에러를 그대로 노출하지 않고 “카메라/마이크 접근 권한이 필요합니다.”라는 사용자 메시지로 변환했습니다.

---

## ✅ QA 체크리스트

- 회원가입/로그인/JWT 인증
- 학생 대시보드, 복습, 회고, 다음 액션
- 강사 커리큘럼 업로드, 문제은행, 학생 상세
- 운영자 과정/학생/강사 관리
- 디지털 트윈 리스크 계산
- AI 추천/코드 리뷰/상담 브리핑
- 스터디그룹 매칭 및 그룹 채팅
- LiveKit 상담 연결
- 알림/SSE 수신
- Docker Compose 전체 실행

---

## 📝 총평

### 기획

- Clausion은 단순 LMS가 아니라 학습 데이터 기반으로 학생 상태를 추론하고 개입까지 연결하는 구조가 핵심이었습니다.  
- 학생, 강사, 운영자 역할을 분리하면서도 같은 학습 데이터를 바라보도록 설계하는 것이 중요했습니다.

### 구현

- Spring Boot, JPA, React, RabbitMQ, Redis, LiveKit, AI API를 함께 사용해 실제 운영형 교육 플랫폼에 가까운 구조를 경험했습니다.  
- 특히 디지털 트윈, AI 추천, 실시간 채팅, 화상 상담처럼 비동기/실시간 기능이 많은 서비스 구조를 다뤘습니다.

### 개선점

- AI 기능이 많아질수록 Job 상태 관리, 실패 재시도, 프롬프트 버전 관리가 중요하다는 점을 느꼈습니다.  
- 다음 단계에서는 AI 응답 품질 평가 지표와 운영자 모니터링 대시보드를 더 강화할 수 있습니다.

---

**작성자:** 정찬호 &nbsp;&nbsp;&nbsp;&nbsp; **TEAM:** Clausion  
**기간:** 2026.04 ~ 2026.05  
**이미지 생성:** Built-in `image_gen`
