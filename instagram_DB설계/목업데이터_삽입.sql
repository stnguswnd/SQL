INSERT INTO users (name, email, password, profile_image)
VALUES
('Alice', 'alice@mail.com', 'hash_pw1', '/img/alice.png'),
('Bob', 'bob@mail.com', 'hash_pw2', '/img/bob.png'),
('Charlie', 'charlie@mail.com', 'hash_pw3', '/img/charlie.png'),
('Daisy', 'daisy@mail.com', 'hash_pw4', '/img/daisy.png'),
('Evan', 'evan@mail.com', 'hash_pw5', '/img/evan.png');

INSERT INTO posts (user_id, content)
VALUES
(1, '오늘은 날씨가 정말 좋아요 '),
(2, '새로 산 키보드 너무 마음에 든다!'),
(3, 'AI 프로젝트 거의 완성'),
(4, '커피 한 잔의 여유'),
(5, '새로운 사진 필터 테스트');

INSERT INTO media (post_id, media_url, media_type)
VALUES
(1, '/media/sunshine.jpg', 'image'),
(1, '/media/sky.jpg', 'image'),
(2, '/media/keyboard.png', 'image'),
(3, '/media/ai_demo.mp4', 'video'),
(4, '/media/coffee.jpg', 'image'),
(5, '/media/filter_before.jpg', 'image'),
(5, '/media/filter_after.jpg', 'image');

-- 원댓글
INSERT INTO comments (post_id, user_id, content)
VALUES
(1, 2, '진짜 날씨 좋네요!'),
(1, 3, '부럽다 😎'),
(2, 1, '키보드 색감 너무 예쁘다!'),
(3, 4, 'AI 프로젝트 완성 축하드려요!'),
(4, 5, '커피 사진 예술이에요');

-- 대댓글
INSERT INTO comments (post_id, user_id, parent_comment_id, content)
VALUES
(1, 1, 1, '맞아요, 요즘 완전 봄 느낌 '),
(2, 3, 3, '저도 이 모델 쓰는데 소리 진짜 좋아요!'),
(3, 1, 4, '감사해요! 곧 공개할 예정이에요');

INSERT INTO likes (post_id, user_id)
VALUES
(1, 2), (1, 3), (1, 4),
(2, 1), (2, 5),
(3, 1), (3, 2), (3, 5),
(4, 3), (4, 4), (4, 5),
(5, 1), (5, 2);

INSERT INTO follows (sender_id, receiver_id)
VALUES
(1, 2), (1, 3), (2, 1), (3, 1),
(4, 1), (4, 3), (5, 1), (5, 2);

INSERT INTO chatrooms (creator_id, name, is_group)
VALUES
(NULL, 'Alice-Bob', FALSE),
(1, 'Project Group', TRUE),
(3, 'Coffee Talk', TRUE);

-- 1:1 대화방
INSERT INTO chat_participants (chatroom_id, user_id)
VALUES
(1, 1), (1, 2);

-- 그룹방 (Project Group)
INSERT INTO chat_participants (chatroom_id, user_id)
VALUES
(2, 1), (2, 2), (2, 3), (2, 4);

-- 그룹방 (Coffee Talk)
INSERT INTO chat_participants (chatroom_id, user_id)
VALUES
(3, 3), (3, 4), (3, 5);

-- 1:1 채팅 (Alice <-> Bob)
INSERT INTO messages (chatroom_id, sender_id, content)
VALUES
(1, 1, '안녕 Bob! 오늘 점심 어때?'),
(1, 2, '좋아요 Alice! 카페에서 봐요 ☕️');

-- 그룹 채팅 (Project Group)
INSERT INTO messages (chatroom_id, sender_id, content)
VALUES
(2, 1, '이번 주 AI 발표 준비됐어요?'),
(2, 3, '대부분 완료됐어요!'),
(2, 4, '슬라이드 디자인은 제가 맡을게요.');

-- 그룹 채팅 (Coffee Talk)
INSERT INTO messages (chatroom_id, sender_id, content)
VALUES
(3, 3, '오늘 카페 모임 있는 거 알죠?'),
(3, 4, '네! 오후 4시에 봬요'),
(3, 5, '제가 디저트 가져갈게요');







