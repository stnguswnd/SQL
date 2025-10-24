-- 데이터 베이스 생성 
CREATE DATABASE temp
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

USE temp;

DROP TABLE customer; 

-- 테이블 생성 
CREATE TABLE customer (
id INT PRIMARY KEY AUTO_INCREMENT, 
name VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL
);

-- C(R)UD 
INSERT INTO customer (name, email) VALUES ('kim','asdf@naver.com'); 
SELECT * FROM customer;
UPDATE customer SET email = '1234@naver.com' WHERE id = 1; 
DELETE FROM customer WHERE id = 1;

INSERT INTO customer (name, email) VALUES
('kim', 'asdef@naver,com'),
('lee', 'asdef@naver,com'),
('hong', 'asdef@naver,com');

-- SELECT 
SELECT name, email AS 이메일, id FROM customer;

USE world; 
SELECT * FROM country; 
-- 중복 제거를 할 때 DISTINT를 쓴다! 
SELECT DISTINCT Continent FROM country; 










CREATE TABLE orders (
id 			INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT NOT NULL,
FOREIGN KEY (customer_id) REFERENCES customer(id)
);

DESCRIBE customer;
DESCRIBE orders;

ALTER TABLE customer
ADD COLUMN phone VARCHAR(50);

ALTER TABLE customer
MODIFY COLUMN phone VARCHAR(50) NOT NULL; 

ALTER TABLE customer
CHANGE COLUMN phone phone_num VARCHAR(50) NOT NULL;

ALTER TABLE customer
DROP COLUMN phone_num; 

TRUNCATE TABLE customer;
DROP TABLE orders;  
-- n을 먼저 지우고 1을 지우는건 가능하다. 그래서 orders를 먼저 지우고, 그 이후에 customer을 지우자! 









-- 테이블 삭제 
DROP TABLE customer; 