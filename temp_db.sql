USE world;

SELECT * FROM city; 

USE temp_db;

-- DDL
CREATE TABLE student (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

DROP TABLE student; 

-- DML 
-- 데이터 추가, 생성, create 
INSERT INTO student(name) VALUES('kim');

-- 데이터 읽기, 조회, read 
SELECT * FROM student; 

-- 데이터 수정, update
UPDATE student SET name = 'hong' WHERE id =  1;

-- 데이터 삭제, delete
DELETE FROM student WHERE id = 1; 






