USE instachat;

SELECT * FROM chat_participants;

SELECT * FROM chatrooms;

SELECT * FROM comments;

SELECT * FROM follows;

SELECT * FROM likes;

SELECT * FROM media;

SELECT * FROM messages;

SELECT * FROM posts;

SELECT * FROM users;


SELECT
    user_id,
    name,
    email,
    profile_image,
    created_at,
    updated_at
FROM users
WHERE user_id = 1;

