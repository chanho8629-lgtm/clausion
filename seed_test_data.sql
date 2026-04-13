-- =========================================================
-- 테스트 데이터 시드: 강사 정찬호(7) + 학생 이준수(3)
-- 과목: Python 프로그래밍 기초 (course_id=1, skills 1~10)
-- =========================================================

BEGIN;

-- ─── 0. 프로필 (없으면 생성) ───
INSERT INTO student_profiles (user_id, track_name, goal, current_level)
VALUES (3, '백엔드 개발', '파이썬 기반 웹 개발자가 되고 싶습니다', '초급')
ON CONFLICT (user_id) DO NOTHING;

INSERT INTO instructor_profiles (user_id, department, bio)
VALUES (7, '컴퓨터공학과', 'Python/AI 전공 교수, 10년차 프로그래밍 교육 경력')
ON CONFLICT (user_id) DO NOTHING;

-- ─── 1. 학생 트윈 (student_twin) ───
INSERT INTO student_twin (student_id, course_id, mastery_score, execution_score, retention_risk_score, motivation_score, consultation_need_score, overall_risk_score, ai_insight, trend_direction, trend_explanation, inference_source, updated_at)
VALUES (3, 1, 62.50, 71.00, 38.20, 68.40, 32.10, 35.50,
  '이준수 학생은 반복문과 함수 기초에 대한 이해도가 양호하지만, 재귀 함수와 정렬 알고리즘에서 어려움을 겪고 있습니다. 최근 코드 제출 빈도가 높아지고 있어 수행력은 개선 추세입니다. 다만 리스트 컴프리헨션 복습이 필요하며, 1주일 내 해당 스킬 복습을 권장합니다.',
  'IMPROVING', '최근 7일간 코드 제출 빈도 증가, 복습 완료율 65%로 이전 주 대비 12% 상승',
  'HYBRID_V2', NOW() - INTERVAL '2 hours')
ON CONFLICT (student_id, course_id) DO UPDATE SET
  mastery_score = EXCLUDED.mastery_score,
  execution_score = EXCLUDED.execution_score,
  retention_risk_score = EXCLUDED.retention_risk_score,
  motivation_score = EXCLUDED.motivation_score,
  consultation_need_score = EXCLUDED.consultation_need_score,
  overall_risk_score = EXCLUDED.overall_risk_score,
  ai_insight = EXCLUDED.ai_insight,
  trend_direction = EXCLUDED.trend_direction,
  trend_explanation = EXCLUDED.trend_explanation,
  inference_source = EXCLUDED.inference_source,
  updated_at = EXCLUDED.updated_at;

-- ─── 2. 트윈 점수 히스토리 (7일간) ───
INSERT INTO twin_score_history (student_id, course_id, mastery_score, execution_score, retention_risk_score, motivation_score, consultation_need_score, overall_risk_score, inference_source, captured_at) VALUES
(3, 1, 48.00, 52.00, 55.00, 50.00, 48.00, 52.00, 'HYBRID_V2', NOW() - INTERVAL '7 days'),
(3, 1, 50.20, 55.50, 52.00, 53.00, 45.00, 49.00, 'HYBRID_V2', NOW() - INTERVAL '6 days'),
(3, 1, 53.00, 58.00, 48.50, 56.00, 42.00, 45.50, 'HYBRID_V2', NOW() - INTERVAL '5 days'),
(3, 1, 55.80, 61.00, 45.00, 60.00, 40.00, 42.00, 'HYBRID_V2', NOW() - INTERVAL '4 days'),
(3, 1, 58.00, 64.50, 42.00, 63.00, 37.00, 39.50, 'HYBRID_V2', NOW() - INTERVAL '3 days'),
(3, 1, 60.00, 67.00, 40.00, 65.50, 35.00, 37.50, 'HYBRID_V2', NOW() - INTERVAL '2 days'),
(3, 1, 62.50, 71.00, 38.20, 68.40, 32.10, 35.50, 'HYBRID_V2', NOW() - INTERVAL '2 hours');

-- ─── 3. 스킬별 마스터리 스냅샷 (skills 1~10) ───
INSERT INTO skill_mastery_snapshot (student_id, course_id, skill_id, understanding_score, practice_score, confidence_score, forgetting_risk_score, source_type, captured_at) VALUES
(3, 1, 1, 85.00, 90.00, 4.50, 10.00, 'CODE_ANALYSIS', NOW() - INTERVAL '1 day'),
(3, 1, 2, 80.00, 85.00, 4.00, 15.00, 'CODE_ANALYSIS', NOW() - INTERVAL '1 day'),
(3, 1, 3, 78.00, 82.00, 4.00, 18.00, 'CODE_ANALYSIS', NOW() - INTERVAL '1 day'),
(3, 1, 4, 70.00, 72.00, 3.50, 25.00, 'REFLECTION_ANALYSIS', NOW() - INTERVAL '1 day'),
(3, 1, 5, 55.00, 50.00, 3.00, 40.00, 'CODE_ANALYSIS', NOW() - INTERVAL '1 day'),
(3, 1, 6, 60.00, 58.00, 3.00, 35.00, 'CODE_ANALYSIS', NOW() - INTERVAL '1 day'),
(3, 1, 7, 35.00, 30.00, 2.00, 65.00, 'REFLECTION_ANALYSIS', NOW() - INTERVAL '1 day'),
(3, 1, 8, 40.00, 35.00, 2.50, 58.00, 'CODE_ANALYSIS', NOW() - INTERVAL '1 day'),
(3, 1, 9, 42.00, 38.00, 2.50, 55.00, 'CODE_ANALYSIS', NOW() - INTERVAL '1 day'),
(3, 1, 10, 30.00, 25.00, 2.00, 70.00, 'REFLECTION_ANALYSIS', NOW() - INTERVAL '1 day');

-- ─── 4. 성찰일지 (reflections) - 7개 ───
INSERT INTO reflections (student_id, course_id, content, stuck_point, self_confidence_score, emotion_summary, created_at) VALUES
(3, 1, '오늘 변수와 자료형 복습을 했다. 문자열 포매팅에서 f-string이 가장 편하다는 걸 다시 확인했다. 정수와 실수 변환도 자연스럽게 된다.', NULL, 5, '{"primary": "만족", "secondary": "자신감"}', NOW() - INTERVAL '7 days'),
(3, 1, '조건문 중첩에서 elif를 써야 할 때와 if를 새로 써야 할 때가 헷갈렸다. 예제를 여러 개 풀어보니 감이 왔다.', '중첩 조건문에서 elif vs 새로운 if 구분', 4, '{"primary": "집중", "secondary": "약간 혼란"}', NOW() - INTERVAL '6 days'),
(3, 1, 'for 루프와 while 루프를 비교하면서 공부했다. while은 무한 루프 위험이 있어서 break 조건을 꼭 넣어야 한다는 것을 배웠다.', NULL, 4, '{"primary": "이해", "secondary": "성취감"}', NOW() - INTERVAL '5 days'),
(3, 1, '함수에서 매개변수 기본값 설정하는 법을 배웠다. *args와 **kwargs가 아직 좀 어렵다. 특히 언제 사용해야 하는지 감이 안 온다.', '*args와 **kwargs 사용 시점 이해 어려움', 3, '{"primary": "혼란", "secondary": "노력"}', NOW() - INTERVAL '4 days'),
(3, 1, '리스트 컴프리헨션을 처음 배웠는데 문법이 낯설다. [x for x in range(10) if x % 2 == 0] 이런 식인데, 조건이 복잡해지면 가독성이 떨어질 것 같다.', '리스트 컴프리헨션에서 다중 조건 사용 시 가독성', 3, '{"primary": "어려움", "secondary": "호기심"}', NOW() - INTERVAL '3 days'),
(3, 1, '재귀 함수 개념을 공부했는데 피보나치는 이해했지만, 하노이 탑은 아직 머릿속으로 추적이 안 된다. 스택 프레임으로 그려봐야 할 것 같다.', '재귀 호출의 실행 흐름 추적 어려움, 특히 하노이 탑', 2, '{"primary": "좌절", "secondary": "도전"}', NOW() - INTERVAL '2 days'),
(3, 1, '정렬 알고리즘 중 버블 정렬과 선택 정렬을 구현해봤다. 버블 정렬은 이해했지만 퀵 정렬의 파티셔닝 과정이 어렵다. 내일 다시 도전하려고 한다.', '퀵 정렬 파티셔닝 로직 이해 어려움', 3, '{"primary": "집중", "secondary": "약간 불안"}', NOW() - INTERVAL '1 day');

-- ─── 5. 복습 태스크 (review_tasks) - 12개 ───
INSERT INTO review_tasks (student_id, course_id, skill_id, title, reason_summary, scheduled_for, status, completed_at, created_at) VALUES
(3, 1, 1, '변수와 자료형 복습', '기초 강화를 위한 정기 복습', NOW()::DATE - 6, 'COMPLETED', NOW() - INTERVAL '6 days', NOW() - INTERVAL '7 days'),
(3, 1, 2, '조건문 중첩 패턴 복습', 'elif 사용 패턴 재학습', NOW()::DATE - 5, 'COMPLETED', NOW() - INTERVAL '5 days', NOW() - INTERVAL '6 days'),
(3, 1, 3, '반복문 break/continue 복습', '무한 루프 방지 패턴', NOW()::DATE - 4, 'COMPLETED', NOW() - INTERVAL '4 days', NOW() - INTERVAL '5 days'),
(3, 1, 4, '함수 매개변수 심화 복습', '*args, **kwargs 패턴', NOW()::DATE - 3, 'COMPLETED', NOW() - INTERVAL '3 days', NOW() - INTERVAL '4 days'),
(3, 1, 5, '리스트 컴프리헨션 연습', '다중 조건 컴프리헨션', NOW()::DATE - 2, 'COMPLETED', NOW() - INTERVAL '2 days', NOW() - INTERVAL '3 days'),
(3, 1, 6, '딕셔너리 활용 복습', '중첩 딕셔너리 접근', NOW()::DATE - 1, 'COMPLETED', NOW() - INTERVAL '1 day', NOW() - INTERVAL '2 days'),
(3, 1, 7, '재귀 함수 기초 복습', '피보나치/팩토리얼 추적', NOW()::DATE, 'IN_PROGRESS', NULL, NOW() - INTERVAL '1 day'),
(3, 1, 8, '정렬 알고리즘 비교 복습', '버블/선택/삽입 정렬', NOW()::DATE, 'PENDING', NULL, NOW() - INTERVAL '1 day'),
(3, 1, 9, '이진 탐색 구현 연습', '반복/재귀 이진 탐색', NOW()::DATE + 1, 'PENDING', NULL, NOW()),
(3, 1, 10, '클로저 개념 복습', '클로저와 스코프 규칙', NOW()::DATE + 2, 'PENDING', NULL, NOW()),
(3, 1, 5, '리스트 컴프리헨션 심화', '중첩 컴프리헨션 패턴', NOW()::DATE + 3, 'PENDING', NULL, NOW()),
(3, 1, 7, '재귀 함수 심화 - 하노이 탑', '재귀 호출 스택 추적', NOW()::DATE + 4, 'PENDING', NULL, NOW());

-- ─── 6. 코드 제출 (code_submissions) + 피드백 ───
-- 제출 1: 변수와 자료형
INSERT INTO code_submissions (id, student_id, course_id, skill_id, code_content, language, status, created_at)
VALUES (100, 3, 1, 1, E'# 변수와 자료형 연습\nname = "이준수"\nage = 22\nheight = 175.5\nis_student = True\n\nprint(f"이름: {name}, 나이: {age}")\nprint(f"키: {height}cm")\nprint(f"학생 여부: {is_student}")\n\n# 형 변환\nage_str = str(age)\nheight_int = int(height)\nprint(type(age_str), type(height_int))', 'python', 'REVIEWED', NOW() - INTERVAL '6 days');

INSERT INTO code_feedbacks (submission_id, line_number, end_line_number, severity, message, suggestion, twin_linked, twin_skill_id, created_at) VALUES
(100, 2, 2, 'GOOD', '변수 이름이 명확하고 가독성이 좋습니다.', NULL, FALSE, NULL, NOW() - INTERVAL '6 days'),
(100, 7, 7, 'GOOD', 'f-string 포매팅을 올바르게 사용하고 있습니다.', NULL, FALSE, NULL, NOW() - INTERVAL '6 days'),
(100, 12, 12, 'INFO', 'int() 변환 시 소수점 이하가 버려집니다. math.floor()나 round()도 고려해보세요.', 'height_rounded = round(height)', FALSE, NULL, NOW() - INTERVAL '6 days');

-- 제출 2: 조건문
INSERT INTO code_submissions (id, student_id, course_id, skill_id, code_content, language, status, created_at)
VALUES (101, 3, 1, 2, E'# 학점 계산기\nscore = 85\n\nif score >= 90:\n    grade = "A"\nelif score >= 80:\n    grade = "B"\nelif score >= 70:\n    grade = "C"\nelse:\n    grade = "F"\n\nprint(f"점수: {score}, 학점: {grade}")\n\n# 홀짝 판별\nfor i in range(1, 11):\n    if i % 2 == 0:\n        print(f"{i}는 짝수")\n    else:\n        print(f"{i}는 홀수")', 'python', 'REVIEWED', NOW() - INTERVAL '5 days');

INSERT INTO code_feedbacks (submission_id, line_number, end_line_number, severity, message, suggestion, twin_linked, twin_skill_id, created_at) VALUES
(101, 3, 10, 'GOOD', 'if-elif-else 체인이 깔끔하게 구성되어 있습니다.', NULL, TRUE, 2, NOW() - INTERVAL '5 days'),
(101, 15, 19, 'GOOD', '반복문과 조건문을 적절히 조합했습니다.', NULL, FALSE, NULL, NOW() - INTERVAL '5 days');

-- 제출 3: 함수
INSERT INTO code_submissions (id, student_id, course_id, skill_id, code_content, language, status, created_at)
VALUES (102, 3, 1, 4, E'# 함수 연습\ndef greet(name, greeting="안녕하세요"):\n    return f"{greeting}, {name}님!"\n\ndef calculate_average(*scores):\n    if not scores:\n        return 0\n    return sum(scores) / len(scores)\n\nprint(greet("이준수"))\nprint(greet("김교수", "반갑습니다"))\nprint(calculate_average(85, 92, 78, 95))', 'python', 'REVIEWED', NOW() - INTERVAL '4 days');

INSERT INTO code_feedbacks (submission_id, line_number, end_line_number, severity, message, suggestion, twin_linked, twin_skill_id, created_at) VALUES
(102, 2, 3, 'GOOD', '기본 매개변수를 올바르게 사용하고 있습니다.', NULL, TRUE, 4, NOW() - INTERVAL '4 days'),
(102, 5, 8, 'GOOD', '*args를 활용한 가변 인자 함수가 잘 구현되었습니다.', NULL, TRUE, 4, NOW() - INTERVAL '4 days'),
(102, 6, 7, 'INFO', '빈 시퀀스 체크가 좋은 방어 코딩입니다.', NULL, FALSE, NULL, NOW() - INTERVAL '4 days');

-- 제출 4: 리스트 컴프리헨션 (약점)
INSERT INTO code_submissions (id, student_id, course_id, skill_id, code_content, language, status, created_at)
VALUES (103, 3, 1, 5, E'# 리스트 컴프리헨션\nevens = [x for x in range(20) if x % 2 == 0]\nprint(evens)\n\n# 중첩 컴프리헨션 시도\nmatrix = [[1,2,3],[4,5,6],[7,8,9]]\nflat = []\nfor row in matrix:\n    for val in row:\n        flat.append(val)\nprint(flat)\n\n# TODO: 위를 컴프리헨션으로 바꾸기\n# flat_comp = ???', 'python', 'REVIEWED', NOW() - INTERVAL '3 days');

INSERT INTO code_feedbacks (submission_id, line_number, end_line_number, severity, message, suggestion, twin_linked, twin_skill_id, created_at) VALUES
(103, 2, 2, 'GOOD', '기본 리스트 컴프리헨션을 올바르게 사용하고 있습니다.', NULL, TRUE, 5, NOW() - INTERVAL '3 days'),
(103, 7, 10, 'WARNING', '중첩 반복문을 리스트 컴프리헨션으로 변환할 수 있습니다. 컴프리헨션 연습이 필요합니다.', 'flat_comp = [val for row in matrix for val in row]', TRUE, 5, NOW() - INTERVAL '3 days'),
(103, 13, 13, 'INFO', 'TODO 주석이 있습니다. 중첩 컴프리헨션을 직접 구현해보세요.', NULL, TRUE, 5, NOW() - INTERVAL '3 days');

-- 제출 5: 재귀 함수 (약점)
INSERT INTO code_submissions (id, student_id, course_id, skill_id, code_content, language, status, created_at)
VALUES (104, 3, 1, 7, E'# 재귀 함수 연습\ndef factorial(n):\n    if n == 0:\n        return 1\n    return n * factorial(n-1)\n\ndef fibonacci(n):\n    if n <= 1:\n        return n\n    return fibonacci(n-1) + fibonacci(n-2)\n\nprint(factorial(5))  # 120\nprint(fibonacci(10))  # 55\n\n# 하노이 탑 - 아직 이해 못함\ndef hanoi(n, source, target, auxiliary):\n    if n == 1:\n        print(f"원판 1: {source} -> {target}")\n        return\n    hanoi(n-1, source, auxiliary, target)\n    print(f"원판 {n}: {source} -> {target}")\n    hanoi(n-1, auxiliary, target, source)', 'python', 'REVIEWED', NOW() - INTERVAL '2 days');

INSERT INTO code_feedbacks (submission_id, line_number, end_line_number, severity, message, suggestion, twin_linked, twin_skill_id, created_at) VALUES
(104, 2, 5, 'GOOD', '팩토리얼 재귀가 올바르게 구현되었습니다. 기저 조건이 명확합니다.', NULL, TRUE, 7, NOW() - INTERVAL '2 days'),
(104, 7, 10, 'WARNING', '피보나치 재귀의 시간 복잡도가 O(2^n)입니다. 메모이제이션을 적용해보세요.', 'from functools import lru_cache를 사용하거나 딕셔너리로 캐싱', TRUE, 7, NOW() - INTERVAL '2 days'),
(104, 16, 22, 'INFO', '하노이 탑 구현이 올바릅니다! 주석에 이해 못했다고 적었지만 코드는 정확합니다. 실행 흐름을 종이에 그려보면 도움이 됩니다.', NULL, TRUE, 7, NOW() - INTERVAL '2 days');

-- 제출 6: 정렬 알고리즘
INSERT INTO code_submissions (id, student_id, course_id, skill_id, code_content, language, status, created_at)
VALUES (105, 3, 1, 8, E'# 버블 정렬\ndef bubble_sort(arr):\n    n = len(arr)\n    for i in range(n):\n        for j in range(0, n-i-1):\n            if arr[j] > arr[j+1]:\n                arr[j], arr[j+1] = arr[j+1], arr[j]\n    return arr\n\n# 선택 정렬\ndef selection_sort(arr):\n    n = len(arr)\n    for i in range(n):\n        min_idx = i\n        for j in range(i+1, n):\n            if arr[j] < arr[min_idx]:\n                min_idx = j\n        arr[i], arr[min_idx] = arr[min_idx], arr[i]\n    return arr\n\ndata = [64, 34, 25, 12, 22, 11, 90]\nprint(bubble_sort(data.copy()))\nprint(selection_sort(data.copy()))', 'python', 'REVIEWED', NOW() - INTERVAL '1 day');

INSERT INTO code_feedbacks (submission_id, line_number, end_line_number, severity, message, suggestion, twin_linked, twin_skill_id, created_at) VALUES
(105, 2, 8, 'GOOD', '버블 정렬이 올바르게 구현되었습니다.', NULL, TRUE, 8, NOW() - INTERVAL '1 day'),
(105, 11, 20, 'GOOD', '선택 정렬도 올바르게 구현되었습니다.', NULL, TRUE, 8, NOW() - INTERVAL '1 day'),
(105, 22, 23, 'GOOD', '.copy()를 사용하여 원본 배열을 보존하는 좋은 습관입니다.', NULL, FALSE, NULL, NOW() - INTERVAL '1 day'),
(105, 1, 23, 'INFO', '다음 단계로 퀵 정렬이나 병합 정렬도 구현해보세요. 시간 복잡도 비교가 학습에 도움됩니다.', NULL, TRUE, 8, NOW() - INTERVAL '1 day');

-- ─── 7. 상담 (consultations) + 액션 플랜 ───
-- 완료된 상담 1
INSERT INTO consultations (id, student_id, instructor_id, course_id, scheduled_at, status, notes, summary_text, cause_analysis, action_plan_json, briefing_json, created_at, completed_at)
VALUES (100, 3, 7, 1, NOW() - INTERVAL '5 days', 'COMPLETED',
  '학생이 함수 매개변수와 리스트 컴프리헨션에서 어려움을 호소함. 특히 *args 사용 시점에 대한 질문이 많았음.',
  '이준수 학생과 함수/리스트 컴프리헨션 관련 상담 진행. 가변 인자 활용 패턴과 컴프리헨션 문법을 예제 중심으로 설명. 학생은 기본 문법은 이해하고 있으나 실전 적용에 어려움을 느끼고 있음.',
  '함수 매개변수의 다양한 형태(*args, **kwargs, 기본값)를 한꺼번에 배우면서 혼란이 발생. 리스트 컴프리헨션은 for 루프에서의 변환 과정이 익숙하지 않음.',
  '[{"title":"가변인자 연습문제 5개 풀기","dueDate":"2026-04-11","priority":"HIGH","status":"COMPLETED"},{"title":"리스트 컴프리헨션 변환 연습","dueDate":"2026-04-13","priority":"MEDIUM","status":"IN_PROGRESS"}]'::jsonb,
  '{"studentName":"이준수","weakSkills":["함수 기초","리스트 컴프리헨션"],"recentConfidence":3.2,"suggestedFocus":"매개변수 패턴과 컴프리헨션 문법 집중 연습"}'::jsonb,
  NOW() - INTERVAL '6 days', NOW() - INTERVAL '5 days');

INSERT INTO action_plans (consultation_id, student_id, course_id, title, description, due_date, linked_skill_id, priority, status, created_at, completed_at) VALUES
(100, 3, 1, '가변인자 연습문제 5개 풀기', '*args와 **kwargs를 활용한 함수 5개 작성', NOW()::DATE - 2, 4, 'HIGH', 'COMPLETED', NOW() - INTERVAL '5 days', NOW() - INTERVAL '3 days'),
(100, 3, 1, '리스트 컴프리헨션 변환 연습', '기존 for 루프를 컴프리헨션으로 변환하는 연습 10문제', NOW()::DATE, 5, 'MEDIUM', 'IN_PROGRESS', NOW() - INTERVAL '5 days', NULL);

-- 완료된 상담 2
INSERT INTO consultations (id, student_id, instructor_id, course_id, scheduled_at, status, notes, summary_text, cause_analysis, briefing_json, created_at, completed_at)
VALUES (101, 3, 7, 1, NOW() - INTERVAL '2 days', 'COMPLETED',
  '재귀 함수에 대한 심화 상담. 하노이 탑 문제의 실행 흐름을 시각적으로 설명.',
  '재귀 함수의 실행 흐름을 콜 스택 다이어그램으로 함께 그려보며 설명. 학생은 코드 자체는 작성할 수 있지만 실행 순서를 머릿속으로 추적하는 것에 어려움을 느낌. 시각화 도구 활용을 권장.',
  '재귀의 개념적 이해와 실행 흐름 추적 능력 간 격차. 코드 작성은 가능하나 디버깅 시 어려움 예상.',
  '{"studentName":"이준수","weakSkills":["재귀 함수","정렬 알고리즘"],"recentConfidence":2.5,"suggestedFocus":"재귀 호출 스택 시각화와 단계별 추적"}'::jsonb,
  NOW() - INTERVAL '3 days', NOW() - INTERVAL '2 days');

INSERT INTO action_plans (consultation_id, student_id, course_id, title, description, due_date, linked_skill_id, priority, status, created_at) VALUES
(101, 3, 1, 'Python Tutor로 재귀 시각화', 'pythontutor.com에서 재귀 함수 3개를 시각화하며 실행 흐름 추적', NOW()::DATE + 2, 7, 'HIGH', 'PENDING', NOW() - INTERVAL '2 days'),
(101, 3, 1, '정렬 알고리즘 시간복잡도 비교표 작성', '버블/선택/퀵/병합 정렬의 시간복잡도를 표로 정리', NOW()::DATE + 3, 8, 'MEDIUM', 'PENDING', NOW() - INTERVAL '2 days');

-- 예정된 상담
INSERT INTO consultations (id, student_id, instructor_id, course_id, scheduled_at, status, briefing_json, created_at)
VALUES (102, 3, 7, 1, NOW() + INTERVAL '2 days', 'SCHEDULED',
  '{"studentName":"이준수","weakSkills":["이진 탐색","클로저"],"recentConfidence":3.0,"suggestedFocus":"이진 탐색 구현과 클로저 스코프 규칙"}'::jsonb,
  NOW());

-- ─── 8. 챗봇 대화 (conversations + chat_messages) ───
INSERT INTO conversations (id, student_id, course_id, title, status, created_at, updated_at)
VALUES (100, 3, 1, '리스트 컴프리헨션 질문', 'ACTIVE', NOW() - INTERVAL '3 days', NOW() - INTERVAL '3 days');

INSERT INTO chat_messages (conversation_id, role, content, created_at) VALUES
(100, 'USER', '리스트 컴프리헨션에서 중첩 for문은 어떤 순서로 쓰는 건가요?', NOW() - INTERVAL '3 days'),
(100, 'ASSISTANT', '좋은 질문이에요! 리스트 컴프리헨션에서 중첩 for문의 순서는 일반 for문을 작성할 때와 같은 순서입니다.

일반 for문:
```python
for row in matrix:
    for val in row:
        result.append(val)
```

컴프리헨션:
```python
[val for row in matrix for val in row]
```

바깥 루프가 먼저 오고, 안쪽 루프가 뒤에 온다고 생각하면 됩니다. 직접 간단한 예제로 연습해볼까요? 2차원 리스트에서 짝수만 골라내는 컴프리헨션을 작성해보세요!', NOW() - INTERVAL '3 days'),
(100, 'USER', '[val for row in matrix for val in row if val % 2 == 0] 이렇게요?', NOW() - INTERVAL '3 days'),
(100, 'ASSISTANT', '정확합니다! 아주 잘 이해하고 있네요. 조건절(if)은 가장 마지막에 위치합니다.

이 패턴을 기억하세요:
`[표현식 for 바깥변수 in 바깥순회 for 안쪽변수 in 안쪽순회 if 조건]`

추가 도전: 만약 각 행의 합이 10 이상인 행에서만 짝수를 골라내려면 어떻게 할까요? 이건 컴프리헨션보다 일반 for문이 가독성이 더 좋을 수도 있어요. 복잡한 조건일 때는 가독성을 위해 for문을 선택하는 것도 좋은 판단입니다.', NOW() - INTERVAL '3 days');

INSERT INTO conversations (id, student_id, course_id, title, status, created_at, updated_at)
VALUES (101, 3, 1, '재귀 함수 도움', 'ACTIVE', NOW() - INTERVAL '1 day', NOW() - INTERVAL '1 day');

INSERT INTO chat_messages (conversation_id, role, content, created_at) VALUES
(101, 'USER', '재귀 함수에서 기저 조건을 빠뜨리면 어떻게 되나요?', NOW() - INTERVAL '1 day'),
(101, 'ASSISTANT', '기저 조건(base case)이 없으면 함수가 자기 자신을 무한히 호출하게 됩니다. Python에서는 RecursionError가 발생해요.

Python은 기본적으로 재귀 깊이를 1000으로 제한하고 있어서, 기저 조건 없이 1000번 이상 호출되면:
```
RecursionError: maximum recursion depth exceeded
```

이런 에러가 발생합니다.

한번 실험해볼까요? 기저 조건이 있는 것과 없는 팩토리얼 함수를 비교해보면 왜 기저 조건이 중요한지 체감할 수 있을 거예요. 직접 해보시겠어요?', NOW() - INTERVAL '1 day'),
(101, 'USER', '아 그러면 항상 기저 조건을 먼저 쓰는 게 좋겠네요', NOW() - INTERVAL '1 day'),
(101, 'ASSISTANT', '맞아요! 재귀 함수를 작성할 때 좋은 습관은:

1. **기저 조건을 가장 먼저 작성** - "언제 멈출 것인가?"를 먼저 정의
2. **재귀 호출에서 문제 크기가 줄어드는지 확인** - n → n-1 처럼
3. **기저 조건에 도달 가능한지 검증** - 무한 루프 방지

이 3단계를 체크리스트처럼 활용하면 재귀 함수 작성이 훨씬 수월해질 거예요. 지금 트윈 분석을 보면 재귀 함수 이해도가 점점 올라가고 있어요. 계속 이 방향으로 연습하면 좋겠습니다!', NOW() - INTERVAL '1 day');

-- ─── 9. 게이미피케이션 ───
INSERT INTO student_gamification (student_id, course_id, level, current_xp, next_level_xp, level_title, streak_days, last_activity_date, total_xp_earned, created_at, updated_at)
VALUES (3, 1, 4, 380, 500, '중급 개발자', 7, CURRENT_DATE, 1380, NOW() - INTERVAL '14 days', NOW())
ON CONFLICT (student_id, course_id) DO UPDATE SET
  level = EXCLUDED.level, current_xp = EXCLUDED.current_xp, next_level_xp = EXCLUDED.next_level_xp,
  level_title = EXCLUDED.level_title, streak_days = EXCLUDED.streak_days, last_activity_date = EXCLUDED.last_activity_date,
  total_xp_earned = EXCLUDED.total_xp_earned, updated_at = EXCLUDED.updated_at;

-- XP 이벤트
INSERT INTO xp_events (student_id, course_id, event_type, xp_amount, created_at) VALUES
(3, 1, 'DAILY_LOGIN', 10, NOW() - INTERVAL '7 days'),
(3, 1, 'REFLECTION_SUBMIT', 20, NOW() - INTERVAL '7 days'),
(3, 1, 'REVIEW_COMPLETE', 30, NOW() - INTERVAL '6 days'),
(3, 1, 'CODE_SUBMIT', 50, NOW() - INTERVAL '6 days'),
(3, 1, 'REFLECTION_SUBMIT', 20, NOW() - INTERVAL '6 days'),
(3, 1, 'DAILY_LOGIN', 10, NOW() - INTERVAL '5 days'),
(3, 1, 'REVIEW_COMPLETE', 30, NOW() - INTERVAL '5 days'),
(3, 1, 'CODE_SUBMIT', 50, NOW() - INTERVAL '5 days'),
(3, 1, 'REFLECTION_SUBMIT', 20, NOW() - INTERVAL '5 days'),
(3, 1, 'DAILY_LOGIN', 10, NOW() - INTERVAL '4 days'),
(3, 1, 'REVIEW_COMPLETE', 30, NOW() - INTERVAL '4 days'),
(3, 1, 'CODE_SUBMIT', 50, NOW() - INTERVAL '4 days'),
(3, 1, 'REFLECTION_SUBMIT', 20, NOW() - INTERVAL '4 days'),
(3, 1, 'CONSULTATION_ATTEND', 100, NOW() - INTERVAL '5 days'),
(3, 1, 'DAILY_LOGIN', 10, NOW() - INTERVAL '3 days'),
(3, 1, 'REVIEW_COMPLETE', 30, NOW() - INTERVAL '3 days'),
(3, 1, 'CODE_SUBMIT', 50, NOW() - INTERVAL '3 days'),
(3, 1, 'REFLECTION_SUBMIT', 20, NOW() - INTERVAL '3 days'),
(3, 1, 'DAILY_LOGIN', 10, NOW() - INTERVAL '2 days'),
(3, 1, 'CODE_SUBMIT', 50, NOW() - INTERVAL '2 days'),
(3, 1, 'REFLECTION_SUBMIT', 20, NOW() - INTERVAL '2 days'),
(3, 1, 'CONSULTATION_ATTEND', 100, NOW() - INTERVAL '2 days'),
(3, 1, 'DAILY_LOGIN', 10, NOW() - INTERVAL '1 day'),
(3, 1, 'CODE_SUBMIT', 50, NOW() - INTERVAL '1 day'),
(3, 1, 'REFLECTION_SUBMIT', 20, NOW() - INTERVAL '1 day'),
(3, 1, 'REVIEW_COMPLETE', 30, NOW() - INTERVAL '1 day'),
(3, 1, 'STREAK_BONUS', 50, NOW() - INTERVAL '1 day'),
(3, 1, 'DAILY_LOGIN', 10, NOW());

-- 뱃지 부여
INSERT INTO student_badges (student_id, badge_id, earned_at)
SELECT 3, id, NOW() - INTERVAL '3 days' FROM badges WHERE name = '빠른 복습러'
ON CONFLICT (student_id, badge_id) DO NOTHING;
INSERT INTO student_badges (student_id, badge_id, earned_at)
SELECT 3, id, NOW() - INTERVAL '2 days' FROM badges WHERE name = '코드 전사'
ON CONFLICT (student_id, badge_id) DO NOTHING;
INSERT INTO student_badges (student_id, badge_id, earned_at)
SELECT 3, id, NOW() - INTERVAL '1 day' FROM badges WHERE name = '불꽃 스트릭'
ON CONFLICT (student_id, badge_id) DO NOTHING;
INSERT INTO student_badges (student_id, badge_id, earned_at)
SELECT 3, id, NOW() - INTERVAL '5 days' FROM badges WHERE name = '상담 참여자'
ON CONFLICT (student_id, badge_id) DO NOTHING;

-- ─── 10. 추천 (recommendations) ───
INSERT INTO recommendations (student_id, course_id, recommendation_type, title, reason_summary, trigger_event, expected_outcome, created_at) VALUES
(3, 1, 'REVIEW', '리스트 컴프리헨션 중첩 패턴 복습', '최근 코드 제출에서 중첩 컴프리헨션을 for문으로 대체하는 패턴이 발견됨. 컴프리헨션 숙달이 필요합니다.', 'TWIN_SCORE_DROP', '리스트 컴프리헨션 이해도 55→70 예상', NOW() - INTERVAL '2 days'),
(3, 1, 'REVIEW', '재귀 함수 실행 흐름 추적 연습', '재귀 함수 자신감 점수가 2.0으로 낮음. 시각화 도구를 활용한 단계별 추적 추천.', 'TWIN_SCORE_DROP', '재귀 함수 이해도 35→50 예상', NOW() - INTERVAL '1 day'),
(3, 1, 'RESOURCE', '정렬 알고리즘 시각화 자료', '정렬 알고리즘 practice_score가 35로 낮음. 시각적 학습 자료로 개념 보강 추천.', 'TWIN_SCORE_DROP', '정렬 알고리즘 수행력 향상', NOW() - INTERVAL '1 day'),
(3, 1, 'REVIEW', '클로저와 스코프 기초 학습', '클로저 관련 스킬 점수가 전체 최하위(이해 30, 실습 25). 기초부터 단계적 학습 필요.', 'TWIN_SCORE_DROP', '클로저 이해도 30→45 예상', NOW());

-- ─── 11. 스터디 그룹 ───
INSERT INTO study_groups (id, course_id, name, description, max_members, status, created_by, created_at)
VALUES (100, 1, '파이썬 알고리즘 스터디', '재귀/정렬/탐색 알고리즘을 함께 공부하는 그룹', 4, 'ACTIVE', 3, NOW() - INTERVAL '5 days')
ON CONFLICT DO NOTHING;

INSERT INTO study_group_members (study_group_id, student_id, role, strength_summary, complement_note, match_score, joined_at)
VALUES (100, 3, 'LEADER', '조건문/반복문 기초 강점', '재귀/정렬 약점을 서로 보완', 0.85, NOW() - INTERVAL '5 days')
ON CONFLICT (study_group_id, student_id) DO NOTHING;

-- 다른 학생도 그룹에 추가 (id=12 이준수)
INSERT INTO study_group_members (study_group_id, student_id, role, strength_summary, complement_note, match_score, joined_at)
VALUES (100, 12, 'MEMBER', '자료구조 강점', '함수/컴프리헨션 약점 보완', 0.78, NOW() - INTERVAL '4 days')
ON CONFLICT (study_group_id, student_id) DO NOTHING;

-- 스터디 그룹 메시지
INSERT INTO study_group_messages (study_group_id, sender_id, content, message_type, created_at) VALUES
(100, 3, '안녕하세요! 이번 주에 재귀 함수 같이 공부할 분 계신가요?', 'TEXT', NOW() - INTERVAL '4 days'),
(100, 12, '저도 재귀 어려워서 같이 하고 싶어요! 하노이 탑이 특히 헷갈려요.', 'TEXT', NOW() - INTERVAL '4 days'),
(100, 3, '저도요ㅋㅋ 그럼 내일 저녁에 온라인으로 모여서 같이 풀어볼까요?', 'TEXT', NOW() - INTERVAL '3 days'),
(100, 12, '좋아요! 저는 Python Tutor 사이트에서 시각화하면서 하면 이해가 잘 되더라고요.', 'TEXT', NOW() - INTERVAL '3 days'),
(100, 3, '오 그거 좋은 방법이네요. 교수님도 상담 때 시각화 추천하셨어요.', 'TEXT', NOW() - INTERVAL '3 days');

COMMIT;
