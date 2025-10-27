USE WORLD; 

SELECT * FROM city WHERE CountryCode = 'KOR';
SELECT * FROM country WHERE Code = 'KOR';

SELECT 
	ci.Name AS 도시명, 
    co.Name AS 나라명,
    co.Continent AS 대륙,
    ci.Population AS 도시인구,
    co.Population AS 국가인구,
    ci.Population / co.Population AS 도시인구비율
FROM city ci INNER JOIN country co
ON ci.CountryCode = co.Code;


-- 위에서 만든 컬럼에서 아시아 국가들만 빼보자! 
SELECT 
	ci.Name AS 도시명, 
    co.Name AS 나라명,
    co.Continent AS 대륙,
    ci.Population AS 도시인구,
    co.Population AS 국가인구,
    ci.Population / co.Population AS 도시인구비율
FROM city ci INNER JOIN country co
ON ci.CountryCode = co.Code
WHERE co.Continent = 'Asia';


-- 우리 나라에 있는 모든 도시, 
SELECT 
	ci.Name AS 도시명, 
    co.Name AS 나라명,
    co.Continent AS 대륙,
    ci.Population AS 도시인구,
    co.Population AS 국가인구,
    ci.Population / co.Population AS 도시인구비율
FROM city ci INNER JOIN country co
ON ci.CountryCode = co.Code
WHERE co.Name = 'South Korea';

-- 나라 별로 도시의 갯수! 
SELECT 
	CO.Name,
	COUNT(*)
FROM city ci INNER JOIN country co
ON ci.CountryCode = co.Code 
GROUP BY co.Name
ORDER BY COUNT(*) DESC;
;

-- 대륙 별로 도시의 갯수! 
SELECT 
	co.Continent,
    COUNT(*),
    AVG(ci.Population)
FROM city ci INNER JOIN country co 
ON ci.CountryCode = co.Code
GROUP BY co.Continent
;

-- 교집합만 뽑기 떄문에 어떤 특정한나라는 도시가 없기 때문에 포함이 안된 경우가 있다! 
SELECT 
	COUNT(DISTINCT co.Code) AS '전체국가수_join',
    (SELECT COUNT(*) FROM country) AS '전체국가수_county'
FROM city ci INNER JOIN country co 
ON ci.CountryCode = co.Code;


-- 보통 사람들이 왼쪽부터 읽기 때문에, 레프트 조인이 좀 더 추천이 된다. 
SELECT 
	*
FROM country co LEFT JOIN city ci 
ON co.Code = ci.CountryCode
ORDER BY co.Population;


SELECT 
	*
FROM country co RIGHT JOIN city ci 
ON co.Code = ci.CountryCode
ORDER BY co.Population;


-- FULL OUTER JOIn 일단 생략 
SELECT * FROM city;

-- 셀프 조인?
SELECT 
	c1.Name, c2.Name
FROM city c1 INNER JOIN city c2
ON c1.ID = c2.ID 
WHERE c1.CountryCode = 'KOR'
;


SELECT 
    *
FROM country co
INNER JOIN city ci 
    ON co.Code = ci.CountryCode
INNER JOIN countrylanguage cl 
    ON co.Code = cl.CountryCode;
    

USE sakila;
-- 영화(`film`)와 언어(`language`) 테이블을 조인하여 다음을 조회하세요:
-- - 영화 제목 (`film.title`), 언어 이름 (`language.name`)

SELECT *
FROM film;

SELECT *
FROM language;

SELECT *
FROM category;

SELECT 
	f.title,
    l.name
FROM film f 
INNER JOIN language l 
	ON f.language_id = l.language_id;

-- 영화와 카테고리를 조인하여 다음을 조회하세요:
-- - 영화 제목, 카테고리 이름, 대여료  -- 연결 테이블을 넣어줘야 함. 
SELECT 
	f.title,
	c.name,
    f.rental_rate
FROM film f 
INNER JOIN film_category fc
	ON f.film_id = fc.film_id 
INNER JOIN category c
	ON fc.category_id = c.category_id;
    
    
## 강사님이 한건, film_category라는걸 가져옴. 
SELECT 
	*
FROM film f 
INNER JOIN film_category fc
	ON f.film_id = fc.film_id 
INNER JOIN category
	ON fc.category_id = c.category_id;


-- 모든 고객(`customer`)과 그들의 대여 내역(`rental`)을 조회하세요.
-- - 고객 이름 (first_name, last_name), 대여 ID (rental_id), 대여 날짜 (rental_date)
SELECT * 
FROM customer; -- customer_id 

SELECT * 
FROM rental; -- customer_id 

SELECT 
	c.first_name, 
    c.last_name,
    r.rental_id,
    r.rental_date
FROM customer c
INNER JOIN rental r 
	ON c.customer_id = r.customer_id ;
    
-- 강사님 코드 
SELECT 
	*
FROM customer c LEFT JOIN rental r
ON c.customer_id = r.customer_id;

-- 고객별 대여 횟수를 조회하세요. (대여 횟수 0인 고객도 포함)
-- - 고객 이름, 대여 횟수, 대여 횟수가 많은 순서

SELECT 
	c.customer_id,
	CONCAT(c.first_name, ' ', c.last_name) AS 고객이름,
	COUNT(*) AS 대여횟수
FROM customer c
INNER JOIN rental r 
	ON c.customer_id = r.customer_id 
GROUP BY c.customer_id
ORDER BY 대여횟수 DESC; -- 대여횟수를 3으로 하면, 알아서 숫자를 셀 수 있다. 

-- 강사님 코드 
SELECT 
	c.customer_id,
    COUNT(*)
FROM customer c LEFT JOIN rental r
ON c.customer_id = r.customer_id 
GROUP BY c.customer_id
ORDER BY COUNT(*) DESC;

-- 같은 상영 시간(`length`)을 가진 영화 쌍을 찾으세요.
-- - 영화1 제목, 영화2 제목, 상영 시간, 상위 10개

SELECT 
	f1.title, f2.title, f1.length
FROM film f1 INNER JOIN film f2
ON f1.length = f2.length
ORDER BY f1.length DESC
LIMIT 10;








 
