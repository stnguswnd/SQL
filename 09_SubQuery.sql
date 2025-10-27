USE world;

SELECT Population FROM city WHERE Name = 'SEOUL';  

-- 서울 인구보다 많은 도시 
SELECT 
	*
FROM city 
WHERE Population > (SELECT Population FROM city WHERE Name = 'SEOUL'); 


SELECT 
	Name, Population
FROM country 
WHERE Population > (SELECT AVG(Population) FROM country) 
ORDER BY Population DESC;


-- 아시아의 국가 코드  여러개의 데이터가 나올때는 IN을 쓸 수 있다. IN 안에 포함되어있다면 출력될 것이다! 
SELECT Code FROM country WHERE Continent = 'Asia'; 


-- 아시아 국가의 모든 도시들에 대한 종류
SELECT 
	Name, CountryCode, Population 
FROM city 
WHERE CountryCode IN (SELECT Code FROM country WHERE Continent = 'Asia');

-- 도시가 하나도 없는 나라들 
SELECT DISTINCT CountryCode From city;

-- 나라는 존재하지만, 도시가 없는 경우
SELECT 
	*
FROM country 
WHERE Code NOT IN (SELECT DISTINCT CountryCode From city);

-- FROM 절의 서브쿼리 (인라인 뷰) , FROM안에서 서브쿼리로 만들어진건 AS로 이름을 지정해줘야한다. 
SELECT *
FROM (
	SELECT Continent, COUNT(*) AS co_count
    FROM country 
    GROUP BY Continent 
) AS continent_table
WHERE co_count > 40;


SELECT Continent, COUNT(*)
FROM country 
GROUP BY Continent ;


-- 실습 문제 

-- 평균 대여료(`rental_rate`)보다 비싼 영화를 조회하세요.
-- - 영화 제목, 대여료. 대여료 내림차순 정렬
-- - 상위 10개

USE sakila;

SELECT 
	title, rental_rate
FROM film 
WHERE rental_rate > (SELECT AVG(rental_rate) FROM film) ORDER BY rental_rate DESC LIMIT 10 ;


-- 'Action' 카테고리에 속한 영화를 조회하세요.
-- - 영화 제목
SELECT 
	film_id
FROM film_category WHERE category_id = 1;

SELECT category_id FROM category WHERE name = 'Action';

SELECT 
	*
FROM film
WHERE film_id IN (SELECT 
	film_id
FROM film_category WHERE category_id = 1);


-- 대여 기록이 있는 고객만 조회하세요.
-- - 고객 이름 (first_name, last_name), 이메일

-- 대여 기록이 있는 고객 
SELECT 
	customer_id
FROM rental; 

SELECT *
FROM customer 
WHERE customer_id IN (SELECT 
	customer_id
FROM rental);

-- 고객별 대여 횟수를 구한 뒤, 대여 횟수가 30회 이상인 고객만 조회하세요.
-- - 고객 이름, 대여 횟수, 대여 횟수 내림차순
SELECT 
* 
FROM customer; 

SELECT
	c.customer_id,
	c.first_name,
    c.last_name,
	COUNT(*) AS 대여횟수
FROM customer c INNER JOIN rental r 
ON c.customer_id = r.customer_id
GROUP BY c.customer_id 
HAVING COUNT(*) >= 30
ORDER BY 대여횟수 DESC;

-- 강사님  코드 

SELECT 
	c_name, c_id, c_count
FROM 
(SELECT
	c.customer_id c_id,
	c.first_name c_name,
    c.last_name,
	COUNT(*) AS c_count
FROM customer c INNER JOIN rental r 
ON c.customer_id = r.customer_id
GROUP BY c.customer_id) AS customer_rental
WHERE c_count >= 30;


SELECT 
	customer_id
FROM rental
GROUP BY customer_id
HAVING COUNT(*) > 30
;


SELECT *
FROM customer 
WHERE customer_id IN (SELECT 
	customer_id
FROM rental
GROUP BY customer_id
HAVING COUNT(*) > 30);






