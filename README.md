<div align="center">

# 🧠 Clausion - AI 기반 학습 운영 플랫폼

> 학생의 학습 데이터를 수집하고, AI 디지털 트윈으로 상태를 분석해  
> 복습, 회고, 추천, 스터디그룹, 상담까지 연결하는 교육 운영 플랫폼입니다.  
> 학생, 강사, 운영자가 하나의 데이터 흐름 안에서 학습 리스크를 발견하고 개입할 수 있도록 설계했습니다.

![Java](https://img.shields.io/badge/Java-17-007396?style=flat-square&logo=openjdk&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-3.3-6DB33F?style=flat-square&logo=springboot&logoColor=white)
![React](https://img.shields.io/badge/React-19-61DAFB?style=flat-square&logo=react&logoColor=black)
![TypeScript](https://img.shields.io/badge/TypeScript-6-3178C6?style=flat-square&logo=typescript&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16-4169E1?style=flat-square&logo=postgresql&logoColor=white)
![Redis](https://img.shields.io/badge/Redis-7-DC382D?style=flat-square&logo=redis&logoColor=white)
![RabbitMQ](https://img.shields.io/badge/RabbitMQ-3-FF6600?style=flat-square&logo=rabbitmq&logoColor=white)

<br>

<img src="docs/images/clausion-hero.png" alt="Clausion AI learning platform hero" width="950">

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

## 🚨 트러블 슈팅 포인트

### 1. AI 작업이 API 응답을 지연시키는 문제

- 커리큘럼 분석, 추천, 트윈 추론은 시간이 오래 걸릴 수 있어 비동기 Job 구조로 분리했습니다.
- `AiJobService`, RabbitMQ, Async 설정을 통해 사용자 요청과 백그라운드 처리를 분리했습니다.

### 2. 역할별 접근 제어

- 학생, 강사, 운영자의 진입 경로가 다르기 때문에 JWT와 Role 기반 Protected Route를 함께 적용했습니다.
- 프론트엔드 라우터에서도 허용 역할을 검사해 잘못된 화면 접근을 차단했습니다.

### 3. 실시간 기능 분리

- 일반 알림은 SSE, 그룹 채팅은 WebSocket/STOMP, 화상 상담은 LiveKit으로 분리했습니다.
- 기능별 통신 방식을 분리해 장애 범위와 구현 복잡도를 줄였습니다.

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
