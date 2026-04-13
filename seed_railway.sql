-- =========================================================
-- Railway DB seed: instructor 리춘수(2) + student 이준수(1)
-- course: 풀스택 웹개발 부트캠프 (id=2, skills 1~6)
-- =========================================================

BEGIN;

-- 0. Profiles
INSERT INTO student_profiles (user_id, track_name, goal, current_level)
VALUES (1, '풀스택 개발', '풀스택 웹 개발자가 되고 싶습니다', '초급')
ON CONFLICT (user_id) DO NOTHING;

INSERT INTO instructor_profiles (user_id, department, bio)
VALUES (2, '소프트웨어학과', '풀스택 개발 5년차, React/Spring 전문')
ON CONFLICT (user_id) DO NOTHING;

-- 0.5 Enroll student 1 in course 2 (if not already)
INSERT INTO course_enrollments (course_id, student_id, status)
VALUES (2, 1, 'ACTIVE')
ON CONFLICT (course_id, student_id) DO NOTHING;

-- Also add skills to course 1 "풀스택" so student's existing enrollment works
INSERT INTO curriculum_skills (course_id, name, description, difficulty) VALUES
(1, 'HTML/CSS 기초', 'HTML 구조와 CSS 스타일링 기본', 'EASY'),
(1, 'JavaScript 기초', 'JS 변수, 함수, DOM 조작', 'EASY'),
(1, 'React 기초', 'React 컴포넌트와 상태 관리', 'MEDIUM'),
(1, 'Node.js/Express', '서버 사이드 개발 기초', 'MEDIUM'),
(1, 'REST API 설계', 'RESTful API 설계 원칙', 'MEDIUM'),
(1, 'DB 연동', 'PostgreSQL 연동과 ORM', 'HARD')
ON CONFLICT DO NOTHING;

-- 1. Student Twin for course 2
INSERT INTO student_twin (student_id, course_id, mastery_score, execution_score, retention_risk_score, motivation_score, consultation_need_score, overall_risk_score, ai_insight, trend_direction, trend_explanation, inference_source, updated_at)
VALUES (1, 2, 62.50, 71.00, 38.20, 68.40, 32.10, 35.50,
  '이준수 학생은 HTML/CSS와 JavaScript 기초에 대한 이해도가 양호하지만, 재귀 함수와 Spring Security에서 어려움을 겪고 있습니다. 최근 코드 제출 빈도가 높아지고 있어 수행력은 개선 추세입니다. React 컴포넌트 복습이 필요하며, 1주일 내 해당 스킬 복습을 권장합니다.',
  'IMPROVING', '최근 7일간 코드 제출 빈도 증가, 복습 완료율 65%로 이전 주 대비 12% 상승',
  'HYBRID_V2', NOW() - INTERVAL '2 hours')
ON CONFLICT (student_id, course_id) DO UPDATE SET
  mastery_score = EXCLUDED.mastery_score, execution_score = EXCLUDED.execution_score,
  retention_risk_score = EXCLUDED.retention_risk_score, motivation_score = EXCLUDED.motivation_score,
  consultation_need_score = EXCLUDED.consultation_need_score, overall_risk_score = EXCLUDED.overall_risk_score,
  ai_insight = EXCLUDED.ai_insight, trend_direction = EXCLUDED.trend_direction,
  trend_explanation = EXCLUDED.trend_explanation, inference_source = EXCLUDED.inference_source, updated_at = EXCLUDED.updated_at;

-- 2. Twin score history (7 days)
INSERT INTO twin_score_history (student_id, course_id, mastery_score, execution_score, retention_risk_score, motivation_score, consultation_need_score, overall_risk_score, inference_source, captured_at) VALUES
(1, 2, 48.00, 52.00, 55.00, 50.00, 48.00, 52.00, 'HYBRID_V2', NOW() - INTERVAL '7 days'),
(1, 2, 50.20, 55.50, 52.00, 53.00, 45.00, 49.00, 'HYBRID_V2', NOW() - INTERVAL '6 days'),
(1, 2, 53.00, 58.00, 48.50, 56.00, 42.00, 45.50, 'HYBRID_V2', NOW() - INTERVAL '5 days'),
(1, 2, 55.80, 61.00, 45.00, 60.00, 40.00, 42.00, 'HYBRID_V2', NOW() - INTERVAL '4 days'),
(1, 2, 58.00, 64.50, 42.00, 63.00, 37.00, 39.50, 'HYBRID_V2', NOW() - INTERVAL '3 days'),
(1, 2, 60.00, 67.00, 40.00, 65.50, 35.00, 37.50, 'HYBRID_V2', NOW() - INTERVAL '2 days'),
(1, 2, 62.50, 71.00, 38.20, 68.40, 32.10, 35.50, 'HYBRID_V2', NOW() - INTERVAL '2 hours');

-- 3. Skill mastery snapshots (skills 1~6 of course 2)
INSERT INTO skill_mastery_snapshot (student_id, course_id, skill_id, understanding_score, practice_score, confidence_score, forgetting_risk_score, source_type, captured_at) VALUES
(1, 2, 1, 85.00, 90.00, 4.50, 10.00, 'CODE_ANALYSIS', NOW() - INTERVAL '1 day'),
(1, 2, 2, 78.00, 82.00, 4.00, 18.00, 'CODE_ANALYSIS', NOW() - INTERVAL '1 day'),
(1, 2, 3, 60.00, 55.00, 3.00, 35.00, 'CODE_ANALYSIS', NOW() - INTERVAL '1 day'),
(1, 2, 4, 35.00, 30.00, 2.00, 65.00, 'REFLECTION_ANALYSIS', NOW() - INTERVAL '1 day'),
(1, 2, 5, 55.00, 50.00, 3.00, 40.00, 'CODE_ANALYSIS', NOW() - INTERVAL '1 day'),
(1, 2, 6, 30.00, 25.00, 2.00, 70.00, 'REFLECTION_ANALYSIS', NOW() - INTERVAL '1 day');

-- 4. Reflections (7 entries)
INSERT INTO reflections (student_id, course_id, content, stuck_point, self_confidence_score, emotion_summary, created_at) VALUES
(1, 2, 'HTML 시맨틱 태그와 CSS Flexbox를 복습했다. Flexbox의 justify-content와 align-items 차이가 이제 명확해졌다.', NULL, 5, '{"primary":"satisfied","secondary":"confident"}'::jsonb, NOW() - INTERVAL '7 days'),
(1, 2, 'JavaScript에서 클로저와 스코프 체인을 공부했다. let과 var의 호이스팅 차이가 이해됐다.', 'this 키워드의 동적 바인딩이 아직 헷갈림', 4, '{"primary":"focused","secondary":"slight confusion"}'::jsonb, NOW() - INTERVAL '6 days'),
(1, 2, 'React useState와 useEffect를 연습했다. 의존성 배열을 빠뜨리면 무한 렌더링이 발생한다는 걸 직접 겪어봤다.', '의존성 배열에 함수를 넣으면 매번 새로운 참조라서 무한루프 발생', 3, '{"primary":"confusion","secondary":"learning"}'::jsonb, NOW() - INTERVAL '5 days'),
(1, 2, '재귀 함수로 피보나치와 팩토리얼을 구현했다. 기저 조건의 중요성을 깨달았지만 하노이 탑은 아직 머릿속으로 추적이 안 된다.', '재귀 호출의 실행 흐름 추적 어려움, 특히 하노이 탑', 2, '{"primary":"frustrated","secondary":"challenge"}'::jsonb, NOW() - INTERVAL '4 days'),
(1, 2, 'REST API 설계 원칙을 배웠다. GET/POST/PUT/DELETE의 의미론적 차이와 상태 코드 사용법을 정리했다.', NULL, 4, '{"primary":"understanding","secondary":"organized"}'::jsonb, NOW() - INTERVAL '3 days'),
(1, 2, 'Spring Security의 필터 체인 개념을 처음 접했는데 너무 복잡하다. JWT 인증 흐름은 대략 이해했지만 커스텀 필터 작성이 어렵다.', 'Spring Security 필터 체인 구조와 커스텀 필터 작성법', 2, '{"primary":"overwhelmed","secondary":"effort"}'::jsonb, NOW() - INTERVAL '2 days'),
(1, 2, '오늘은 React 컴포넌트를 재사용 가능하게 리팩토링하는 연습을 했다. props 설계가 중요하다는 걸 느꼈다.', NULL, 4, '{"primary":"productive","secondary":"growth"}'::jsonb, NOW() - INTERVAL '1 day');

-- 5. Review tasks (12 entries)
INSERT INTO review_tasks (student_id, course_id, skill_id, title, reason_summary, scheduled_for, status, completed_at, created_at) VALUES
(1, 2, 1, 'HTML 시맨틱 태그 복습', '기초 강화를 위한 정기 복습', NOW()::DATE - 6, 'COMPLETED', NOW() - INTERVAL '6 days', NOW() - INTERVAL '7 days'),
(1, 2, 2, 'JavaScript 스코프/클로저 복습', '호이스팅과 스코프 체인 재학습', NOW()::DATE - 5, 'COMPLETED', NOW() - INTERVAL '5 days', NOW() - INTERVAL '6 days'),
(1, 2, 3, 'React useState 패턴 복습', '의존성 배열 문제 방지', NOW()::DATE - 4, 'COMPLETED', NOW() - INTERVAL '4 days', NOW() - INTERVAL '5 days'),
(1, 2, 5, 'REST API 설계 원칙 복습', '상태 코드와 메서드 매핑', NOW()::DATE - 3, 'COMPLETED', NOW() - INTERVAL '3 days', NOW() - INTERVAL '4 days'),
(1, 2, 1, 'CSS Grid 레이아웃 심화', 'Flexbox와 Grid 비교', NOW()::DATE - 2, 'COMPLETED', NOW() - INTERVAL '2 days', NOW() - INTERVAL '3 days'),
(1, 2, 2, 'JS 비동기 처리 복습', 'Promise, async/await 패턴', NOW()::DATE - 1, 'COMPLETED', NOW() - INTERVAL '1 day', NOW() - INTERVAL '2 days'),
(1, 2, 4, '재귀 함수 기초 복습', '피보나치/팩토리얼 추적', NOW()::DATE, 'IN_PROGRESS', NULL, NOW() - INTERVAL '1 day'),
(1, 2, 6, 'Spring Security JWT 복습', 'JWT 인증 흐름 정리', NOW()::DATE, 'PENDING', NULL, NOW() - INTERVAL '1 day'),
(1, 2, 3, 'React useEffect 심화', '클린업 함수와 의존성', NOW()::DATE + 1, 'PENDING', NULL, NOW()),
(1, 2, 4, '재귀 함수 심화 - 하노이 탑', '재귀 호출 스택 추적', NOW()::DATE + 2, 'PENDING', NULL, NOW()),
(1, 2, 6, 'Spring Security 필터 체인', '커스텀 필터 작성 연습', NOW()::DATE + 3, 'PENDING', NULL, NOW()),
(1, 2, 5, 'REST API 에러 핸들링', '글로벌 예외 처리 패턴', NOW()::DATE + 4, 'PENDING', NULL, NOW());

-- 6. Code submissions + feedbacks
INSERT INTO code_submissions (student_id, course_id, skill_id, code_content, language, status, created_at) VALUES
(1, 2, 1, E'<!-- Semantic HTML -->\n<header>\n  <nav>\n    <ul>\n      <li><a href="/">Home</a></li>\n      <li><a href="/about">About</a></li>\n    </ul>\n  </nav>\n</header>\n<main>\n  <article>\n    <h1>Hello World</h1>\n    <p>This is semantic HTML.</p>\n  </article>\n</main>\n<footer>Copyright 2026</footer>', 'javascript', 'REVIEWED', NOW() - INTERVAL '6 days'),
(1, 2, 2, E'// Closure example\nfunction counter() {\n  let count = 0;\n  return {\n    increment: () => ++count,\n    decrement: () => --count,\n    getCount: () => count\n  };\n}\n\nconst c = counter();\nconsole.log(c.increment()); // 1\nconsole.log(c.increment()); // 2\nconsole.log(c.decrement()); // 1', 'javascript', 'REVIEWED', NOW() - INTERVAL '5 days'),
(1, 2, 3, E'// React component\nimport { useState, useEffect } from "react";\n\nfunction UserList() {\n  const [users, setUsers] = useState([]);\n  const [loading, setLoading] = useState(true);\n\n  useEffect(() => {\n    fetch("/api/users")\n      .then(res => res.json())\n      .then(data => {\n        setUsers(data);\n        setLoading(false);\n      });\n  }, []);\n\n  if (loading) return <p>Loading...</p>;\n  return (\n    <ul>\n      {users.map(u => <li key={u.id}>{u.name}</li>)}\n    </ul>\n  );\n}', 'javascript', 'REVIEWED', NOW() - INTERVAL '4 days'),
(1, 2, 4, E'// Recursive functions\nfunction factorial(n) {\n  if (n <= 1) return 1;\n  return n * factorial(n - 1);\n}\n\nfunction fibonacci(n) {\n  if (n <= 1) return n;\n  return fibonacci(n-1) + fibonacci(n-2);\n}\n\nconsole.log(factorial(5));  // 120\nconsole.log(fibonacci(10)); // 55\n\n// TODO: Implement Tower of Hanoi\n// Still struggling with the concept', 'javascript', 'REVIEWED', NOW() - INTERVAL '3 days'),
(1, 2, 5, E'// REST API controller (Express)\nconst express = require("express");\nconst router = express.Router();\n\nrouter.get("/users", async (req, res) => {\n  const users = await User.findAll();\n  res.json(users);\n});\n\nrouter.post("/users", async (req, res) => {\n  const user = await User.create(req.body);\n  res.status(201).json(user);\n});\n\nrouter.put("/users/:id", async (req, res) => {\n  const user = await User.findByPk(req.params.id);\n  if (!user) return res.status(404).json({ error: "Not found" });\n  await user.update(req.body);\n  res.json(user);\n});', 'javascript', 'REVIEWED', NOW() - INTERVAL '2 days'),
(1, 2, 6, E'// Spring Security JWT Filter (Java)\n@Component\npublic class JwtFilter extends OncePerRequestFilter {\n  @Override\n  protected void doFilterInternal(HttpServletRequest req,\n      HttpServletResponse res, FilterChain chain) {\n    String header = req.getHeader("Authorization");\n    if (header != null && header.startsWith("Bearer ")) {\n      String token = header.substring(7);\n      // TODO: validate token and set SecurityContext\n      // Still confused about UserDetailsService integration\n    }\n    chain.doFilter(req, res);\n  }\n}', 'java', 'REVIEWED', NOW() - INTERVAL '1 day');

-- Get submission IDs for feedbacks
DO $$
DECLARE
  sub1_id BIGINT; sub2_id BIGINT; sub3_id BIGINT;
  sub4_id BIGINT; sub5_id BIGINT; sub6_id BIGINT;
BEGIN
  SELECT id INTO sub1_id FROM code_submissions WHERE student_id=1 AND course_id=2 AND skill_id=1 ORDER BY created_at DESC LIMIT 1;
  SELECT id INTO sub2_id FROM code_submissions WHERE student_id=1 AND course_id=2 AND skill_id=2 ORDER BY created_at DESC LIMIT 1;
  SELECT id INTO sub3_id FROM code_submissions WHERE student_id=1 AND course_id=2 AND skill_id=3 ORDER BY created_at DESC LIMIT 1;
  SELECT id INTO sub4_id FROM code_submissions WHERE student_id=1 AND course_id=2 AND skill_id=4 ORDER BY created_at DESC LIMIT 1;
  SELECT id INTO sub5_id FROM code_submissions WHERE student_id=1 AND course_id=2 AND skill_id=5 ORDER BY created_at DESC LIMIT 1;
  SELECT id INTO sub6_id FROM code_submissions WHERE student_id=1 AND course_id=2 AND skill_id=6 ORDER BY created_at DESC LIMIT 1;

  INSERT INTO code_feedbacks (submission_id, line_number, end_line_number, severity, message, suggestion, twin_linked, twin_skill_id, created_at) VALUES
  (sub1_id, 2, 7, 'GOOD', 'Semantic HTML tags are used correctly. Good structure with nav, header, main, article, footer.', NULL, TRUE, 1, NOW() - INTERVAL '6 days'),
  (sub1_id, 10, 14, 'GOOD', 'Article element properly wraps content with heading.', NULL, FALSE, NULL, NOW() - INTERVAL '6 days'),
  (sub2_id, 2, 8, 'GOOD', 'Closure pattern is well-implemented. Clean encapsulation of private state.', NULL, TRUE, 2, NOW() - INTERVAL '5 days'),
  (sub2_id, 4, 6, 'INFO', 'Consider adding a reset method for completeness.', 'reset: () => { count = 0; }', FALSE, NULL, NOW() - INTERVAL '5 days'),
  (sub3_id, 8, 14, 'GOOD', 'useEffect with empty dependency array correctly fetches data on mount.', NULL, TRUE, 3, NOW() - INTERVAL '4 days'),
  (sub3_id, 5, 5, 'WARNING', 'Consider adding error handling for the fetch call.', 'Add .catch(err => setError(err.message)) and error state', TRUE, 3, NOW() - INTERVAL '4 days'),
  (sub3_id, 19, 19, 'GOOD', 'Key prop is correctly used in the map function.', NULL, FALSE, NULL, NOW() - INTERVAL '4 days'),
  (sub4_id, 2, 4, 'GOOD', 'Factorial recursive function is correct with proper base case.', NULL, TRUE, 4, NOW() - INTERVAL '3 days'),
  (sub4_id, 7, 9, 'WARNING', 'Fibonacci has O(2^n) time complexity. Use memoization for better performance.', 'const memo = {}; function fib(n) { if (memo[n]) return memo[n]; ... }', TRUE, 4, NOW() - INTERVAL '3 days'),
  (sub4_id, 14, 15, 'INFO', 'TODO comment noted. Tower of Hanoi requires understanding the recursive decomposition pattern. Try drawing the call stack.', NULL, TRUE, 4, NOW() - INTERVAL '3 days'),
  (sub5_id, 5, 8, 'GOOD', 'GET endpoint follows REST conventions correctly.', NULL, TRUE, 5, NOW() - INTERVAL '2 days'),
  (sub5_id, 10, 13, 'GOOD', 'POST with 201 status code is correct REST practice.', NULL, TRUE, 5, NOW() - INTERVAL '2 days'),
  (sub5_id, 16, 16, 'WARNING', 'Missing input validation on req.body. Add validation before creating/updating.', 'Use express-validator or Joi for request body validation', FALSE, NULL, NOW() - INTERVAL '2 days'),
  (sub6_id, 7, 7, 'GOOD', 'Bearer token extraction pattern is correct.', NULL, TRUE, 6, NOW() - INTERVAL '1 day'),
  (sub6_id, 9, 10, 'WARNING', 'Token validation and SecurityContext setup is missing. This is the critical part.', 'Use JwtProvider.validateToken() then UsernamePasswordAuthenticationToken', TRUE, 6, NOW() - INTERVAL '1 day'),
  (sub6_id, 12, 12, 'ERROR', 'chain.doFilter must be called even when no token is present. Current code will block unauthenticated endpoints.', 'Move chain.doFilter() outside the if block (it already is, but ensure exception handling)', TRUE, 6, NOW() - INTERVAL '1 day');
END $$;

-- 7. Consultations + action plans
INSERT INTO consultations (student_id, instructor_id, course_id, scheduled_at, status, notes, summary_text, cause_analysis, action_plan_json, briefing_json, created_at, completed_at) VALUES
(1, 2, 2, NOW() - INTERVAL '5 days', 'COMPLETED',
  'React useEffect dependency array, closure scope',
  'React hooks dependency array, JS closure, scope',
  'useEffect dependency array, JS closure',
  '[{"title":"useEffect practice","dueDate":"2026-04-11","priority":"HIGH","status":"COMPLETED"}]'::jsonb,
  '{"studentName":"이준수","weakSkills":["React 컴포넌트","JavaScript 기초"],"recentConfidence":3.2,"suggestedFocus":"hooks 의존성 배열과 클로저 패턴"}'::jsonb,
  NOW() - INTERVAL '6 days', NOW() - INTERVAL '5 days');

INSERT INTO consultations (student_id, instructor_id, course_id, scheduled_at, status, notes, summary_text, cause_analysis, briefing_json, created_at, completed_at) VALUES
(1, 2, 2, NOW() - INTERVAL '2 days', 'COMPLETED',
  'Recursive functions, Tower of Hanoi visualization',
  'Recursive call stack tracing, memoization patterns',
  'Conceptual understanding vs execution flow tracking gap',
  '{"studentName":"이준수","weakSkills":["재귀 함수","Spring Security"],"recentConfidence":2.5,"suggestedFocus":"재귀 호출 스택 시각화"}'::jsonb,
  NOW() - INTERVAL '3 days', NOW() - INTERVAL '2 days');

INSERT INTO consultations (student_id, instructor_id, course_id, scheduled_at, status, briefing_json, created_at) VALUES
(1, 2, 2, NOW() + INTERVAL '2 days', 'SCHEDULED',
  '{"studentName":"이준수","weakSkills":["Spring Security","재귀 함수"],"recentConfidence":3.0,"suggestedFocus":"Spring Security 필터 체인과 JWT"}'::jsonb,
  NOW());

-- Action plans from consultations
DO $$
DECLARE c1_id BIGINT; c2_id BIGINT;
BEGIN
  SELECT id INTO c1_id FROM consultations WHERE student_id=1 AND course_id=2 AND status='COMPLETED' ORDER BY completed_at ASC LIMIT 1;
  SELECT id INTO c2_id FROM consultations WHERE student_id=1 AND course_id=2 AND status='COMPLETED' ORDER BY completed_at DESC LIMIT 1;

  INSERT INTO action_plans (consultation_id, student_id, course_id, title, description, due_date, linked_skill_id, priority, status, created_at, completed_at) VALUES
  (c1_id, 1, 2, 'useEffect 의존성 배열 연습 5문제', 'cleanup 함수와 의존성 배열 패턴 연습', NOW()::DATE - 2, 3, 'HIGH', 'COMPLETED', NOW() - INTERVAL '5 days', NOW() - INTERVAL '3 days'),
  (c1_id, 1, 2, 'JS 클로저 활용 예제 작성', '카운터, 캐시, 데코레이터 패턴 구현', NOW()::DATE, 2, 'MEDIUM', 'IN_PROGRESS', NOW() - INTERVAL '5 days', NULL),
  (c2_id, 1, 2, '재귀 함수 시각화 연습', 'pythontutor.com에서 재귀 3개 시각화', NOW()::DATE + 2, 4, 'HIGH', 'PENDING', NOW() - INTERVAL '2 days', NULL),
  (c2_id, 1, 2, 'Spring Security 필터 체인 정리', 'JWT 인증 흐름을 다이어그램으로 정리', NOW()::DATE + 3, 6, 'MEDIUM', 'PENDING', NOW() - INTERVAL '2 days', NULL);
END $$;

-- 8. Chatbot conversations + messages
INSERT INTO conversations (student_id, course_id, title, status, created_at, updated_at) VALUES
(1, 2, 'React hooks 질문', 'ACTIVE', NOW() - INTERVAL '3 days', NOW() - INTERVAL '3 days');

DO $$
DECLARE conv1_id BIGINT;
BEGIN
  SELECT id INTO conv1_id FROM conversations WHERE student_id=1 AND course_id=2 AND title='React hooks 질문' LIMIT 1;

  INSERT INTO chat_messages (conversation_id, role, content, created_at) VALUES
  (conv1_id, 'USER', 'useEffect에서 의존성 배열을 빈 배열로 넣으면 정확히 언제 실행되나요?', NOW() - INTERVAL '3 days'),
  (conv1_id, 'ASSISTANT', E'좋은 질문이에요! useEffect의 의존성 배열에 따라 실행 시점이 달라집니다:\n\n1. **빈 배열 []**: 컴포넌트가 처음 마운트될 때 **딱 한 번만** 실행됩니다.\n2. **배열 없음**: 매 렌더링마다 실행됩니다.\n3. **[변수]**: 해당 변수가 변경될 때마다 실행됩니다.\n\n빈 배열은 주로 API 호출이나 이벤트 리스너 등록처럼 초기화 작업에 사용해요. 직접 console.log를 넣어서 실행 횟수를 확인해보시겠어요?', NOW() - INTERVAL '3 days'),
  (conv1_id, 'USER', '그러면 cleanup 함수는 언제 호출되나요?', NOW() - INTERVAL '3 days'),
  (conv1_id, 'ASSISTANT', E'cleanup 함수(return 안의 함수)는 두 가지 상황에서 호출됩니다:\n\n1. **컴포넌트가 언마운트될 때** - 예: 페이지 이동\n2. **다음 effect가 실행되기 직전** - 의존성이 변경되어 재실행될 때\n\n```jsx\nuseEffect(() => {\n  const timer = setInterval(() => console.log("tick"), 1000);\n  return () => clearInterval(timer); // cleanup!\n}, []);\n```\n\n이벤트 리스너나 타이머를 등록했을 때 cleanup에서 해제하지 않으면 메모리 누수가 발생할 수 있어요. 지금 트윈 분석을 보면 React 컴포넌트 이해도가 올라가고 있어요!', NOW() - INTERVAL '3 days');
END $$;

INSERT INTO conversations (student_id, course_id, title, status, created_at, updated_at) VALUES
(1, 2, '재귀 함수 도움', 'ACTIVE', NOW() - INTERVAL '1 day', NOW() - INTERVAL '1 day');

DO $$
DECLARE conv2_id BIGINT;
BEGIN
  SELECT id INTO conv2_id FROM conversations WHERE student_id=1 AND course_id=2 AND title='재귀 함수 도움' LIMIT 1;

  INSERT INTO chat_messages (conversation_id, role, content, created_at) VALUES
  (conv2_id, 'USER', '재귀 함수에서 기저 조건을 빠뜨리면 어떻게 되나요?', NOW() - INTERVAL '1 day'),
  (conv2_id, 'ASSISTANT', E'기저 조건(base case)이 없으면 함수가 자기 자신을 무한히 호출하게 됩니다.\n\nJavaScript에서는 "Maximum call stack size exceeded" 에러가 발생해요.\n\n재귀 함수 작성 체크리스트:\n1. **기저 조건을 가장 먼저 작성**\n2. **재귀 호출에서 문제 크기가 줄어드는지 확인**\n3. **기저 조건에 도달 가능한지 검증**\n\n이 3단계를 항상 확인하면 무한 재귀를 방지할 수 있어요!', NOW() - INTERVAL '1 day'),
  (conv2_id, 'USER', '아 그러면 항상 기저 조건을 먼저 쓰는 게 좋겠네요', NOW() - INTERVAL '1 day'),
  (conv2_id, 'ASSISTANT', '맞아요! 재귀 함수를 작성할 때 가장 좋은 습관입니다. 먼저 "언제 멈출 것인가?"를 정의하고, 그 다음 재귀 호출을 작성하세요. 지금 연습하고 있는 방향이 아주 좋아요. 계속 이렇게 하면 금방 익숙해질 거예요!', NOW() - INTERVAL '1 day');
END $$;

-- 9. Gamification
INSERT INTO student_gamification (student_id, course_id, level, current_xp, next_level_xp, level_title, streak_days, last_activity_date, total_xp_earned, created_at, updated_at)
VALUES (1, 2, 4, 380, 500, '중급 개발자', 7, CURRENT_DATE, 1380, NOW() - INTERVAL '14 days', NOW())
ON CONFLICT (student_id, course_id) DO UPDATE SET
  level = EXCLUDED.level, current_xp = EXCLUDED.current_xp, next_level_xp = EXCLUDED.next_level_xp,
  level_title = EXCLUDED.level_title, streak_days = EXCLUDED.streak_days,
  last_activity_date = EXCLUDED.last_activity_date, total_xp_earned = EXCLUDED.total_xp_earned, updated_at = EXCLUDED.updated_at;

-- XP events
INSERT INTO xp_events (student_id, course_id, event_type, xp_amount, created_at) VALUES
(1, 2, 'DAILY_LOGIN', 10, NOW() - INTERVAL '7 days'),
(1, 2, 'REFLECTION_SUBMIT', 20, NOW() - INTERVAL '7 days'),
(1, 2, 'REVIEW_COMPLETE', 30, NOW() - INTERVAL '6 days'),
(1, 2, 'CODE_SUBMIT', 50, NOW() - INTERVAL '6 days'),
(1, 2, 'REFLECTION_SUBMIT', 20, NOW() - INTERVAL '6 days'),
(1, 2, 'DAILY_LOGIN', 10, NOW() - INTERVAL '5 days'),
(1, 2, 'REVIEW_COMPLETE', 30, NOW() - INTERVAL '5 days'),
(1, 2, 'CODE_SUBMIT', 50, NOW() - INTERVAL '5 days'),
(1, 2, 'REFLECTION_SUBMIT', 20, NOW() - INTERVAL '5 days'),
(1, 2, 'DAILY_LOGIN', 10, NOW() - INTERVAL '4 days'),
(1, 2, 'REVIEW_COMPLETE', 30, NOW() - INTERVAL '4 days'),
(1, 2, 'CODE_SUBMIT', 50, NOW() - INTERVAL '4 days'),
(1, 2, 'REFLECTION_SUBMIT', 20, NOW() - INTERVAL '4 days'),
(1, 2, 'CONSULTATION_ATTEND', 100, NOW() - INTERVAL '5 days'),
(1, 2, 'DAILY_LOGIN', 10, NOW() - INTERVAL '3 days'),
(1, 2, 'REVIEW_COMPLETE', 30, NOW() - INTERVAL '3 days'),
(1, 2, 'CODE_SUBMIT', 50, NOW() - INTERVAL '3 days'),
(1, 2, 'REFLECTION_SUBMIT', 20, NOW() - INTERVAL '3 days'),
(1, 2, 'DAILY_LOGIN', 10, NOW() - INTERVAL '2 days'),
(1, 2, 'CODE_SUBMIT', 50, NOW() - INTERVAL '2 days'),
(1, 2, 'REFLECTION_SUBMIT', 20, NOW() - INTERVAL '2 days'),
(1, 2, 'CONSULTATION_ATTEND', 100, NOW() - INTERVAL '2 days'),
(1, 2, 'DAILY_LOGIN', 10, NOW() - INTERVAL '1 day'),
(1, 2, 'CODE_SUBMIT', 50, NOW() - INTERVAL '1 day'),
(1, 2, 'REFLECTION_SUBMIT', 20, NOW() - INTERVAL '1 day'),
(1, 2, 'REVIEW_COMPLETE', 30, NOW() - INTERVAL '1 day'),
(1, 2, 'STREAK_BONUS', 50, NOW() - INTERVAL '1 day'),
(1, 2, 'DAILY_LOGIN', 10, NOW());

-- Badges (insert if table has badges, otherwise skip)
DO $$
BEGIN
  IF EXISTS (SELECT 1 FROM badges LIMIT 1) THEN
    INSERT INTO student_badges (student_id, badge_id, earned_at)
    SELECT 1, id, NOW() - INTERVAL '3 days' FROM badges LIMIT 1
    ON CONFLICT (student_id, badge_id) DO NOTHING;
  END IF;
END $$;

-- 10. Recommendations
INSERT INTO recommendations (student_id, course_id, recommendation_type, title, reason_summary, trigger_event, expected_outcome, created_at) VALUES
(1, 2, 'REVIEW', 'React useEffect 심화 복습', 'useEffect 의존성 배열에서 실수 발견. cleanup 함수 패턴 숙달 필요.', 'TWIN_SCORE_DROP', 'React 컴포넌트 이해도 60->75 예상', NOW() - INTERVAL '3 days'),
(1, 2, 'REVIEW', '재귀 함수 실행 흐름 추적 연습', '재귀 함수 자신감 점수가 2.0으로 낮음. 시각화 도구 활용 추천.', 'TWIN_SCORE_DROP', '재귀 함수 이해도 35->50 예상', NOW() - INTERVAL '1 day'),
(1, 2, 'RESOURCE', 'Spring Security 공식 문서 학습', 'Spring Security 이해도가 전체 최하위(30). 기초부터 단계적 학습 필요.', 'TWIN_SCORE_DROP', 'Spring Security 이해도 30->45 예상', NOW() - INTERVAL '1 day'),
(1, 2, 'STUDY_GROUP', '알고리즘 스터디 그룹 참여 추천', '재귀/정렬 약점을 동료 학습으로 보완할 수 있음.', 'TWIN_SCORE_DROP', '동기 부여 및 실습량 증가', NOW());

-- 11. Study group
INSERT INTO study_groups (course_id, name, description, max_members, status, created_by, created_at)
VALUES (2, '풀스택 알고리즘 스터디', '재귀/정렬/탐색 알고리즘을 함께 공부하는 그룹', 4, 'ACTIVE', 1, NOW() - INTERVAL '5 days');

DO $$
DECLARE sg_id BIGINT;
BEGIN
  SELECT id INTO sg_id FROM study_groups WHERE course_id=2 AND created_by=1 LIMIT 1;

  INSERT INTO study_group_members (study_group_id, student_id, role, strength_summary, complement_note, match_score, joined_at) VALUES
  (sg_id, 1, 'LEADER', 'HTML/CSS, JS 기초 강점', '재귀/Security 약점을 서로 보완', 0.85, NOW() - INTERVAL '5 days'),
  (sg_id, 3, 'MEMBER', '풀스택 경험 있음', '알고리즘 약점 보완', 0.78, NOW() - INTERVAL '4 days')
  ON CONFLICT (study_group_id, student_id) DO NOTHING;

  INSERT INTO study_group_messages (study_group_id, sender_id, content, message_type, created_at) VALUES
  (sg_id, 1, '안녕하세요! 이번 주에 재귀 함수 같이 공부할 분 계신가요?', 'TEXT', NOW() - INTERVAL '4 days'),
  (sg_id, 3, '저도 재귀 어려워서 같이 하고 싶어요! 하노이 탑이 특히 헷갈려요.', 'TEXT', NOW() - INTERVAL '4 days'),
  (sg_id, 1, '그럼 내일 저녁에 온라인으로 모여서 같이 풀어볼까요?', 'TEXT', NOW() - INTERVAL '3 days'),
  (sg_id, 3, '좋아요! 시각화하면서 하면 이해가 잘 되더라고요.', 'TEXT', NOW() - INTERVAL '3 days'),
  (sg_id, 1, '교수님도 상담 때 시각화 추천하셨어요. 내일 봐요!', 'TEXT', NOW() - INTERVAL '3 days');
END $$;

COMMIT;
