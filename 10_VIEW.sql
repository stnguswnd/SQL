USE world; 


CREATE VIEW large_country AS 
SELECT *
FROM country 
WHERE Population >= 50000000;

SELECT * FROM large_country; -- 우리가 썼던 테이블을 변수 하나에 쓰고 재사용하는 것이 뷰의 목적이다! 왼쪾에 VIEWS라고 하는 공간이 만들어졌다. 즉 뷰는 보기전용을 의미한다. 

CREATE VIEW country_view AS 
SELECT co.Name AS co_name , ci.Name AS ci_name 
FROM country co 
INNER JOIN city ci
ON co.Code = ci.CountryCode;

SELECT * FROM country_view;

-- 뷰의 목록 조회해보기 
SHOW FULL TABLES;
SHOW FULL TABLES WHERE Table_type = 'VIEW';

DROP VIEW country_biew;











