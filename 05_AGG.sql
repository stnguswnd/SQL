USE world; 

SELECT * FROM country; 

-- 카운트는 전체 행들을 하나로 묶어서 갯수로 카운트라는 함수 내에 행 전체를 넣는다, 이후 하나의 숫자로 만들어준다. 
SELECT COUNT(*) FROM country; 
SELECT COUNT(*) AS 총국가서 FROM country; 

-- 열 값을 조회하되, Null이 있으면 제외하고 계산한다. 보통 우리가 가지고 있는 전체 데이터를 통해서 인사이트를 도출 할 때 사용한다
-- 여기서는 어떤 의미와 패턴이 있네를 데이터에서 파악하고자 한다. 
SELECT COUNT(LifeExpectancy) FROM country; 

-- DISTINCT 는 중복 제거 함수이다. 
SELECT DISTINCT Continent FROM country; 
-- 위의 테이블을 다시한번 카운트로 감싼다 
SELECT COUNT(DISTINCT Continent) FROM country;

SELECT Population FROM country; 

-- 모든 나라의 인구수 총합
SELECT SUM(Population) FROM country; 

-- 아시아 지역의 인구수 총합, 보통 FROM 뒤에부터 읽고 마지막 결과가 SELECT 안에서 포함된다. 
SELECT SUM(Population) FROM country 
WHERE Continent = 'Asia';

SELECT SUM(Population) FROM country 
WHERE Populatiion >= 100000000; 

SELECT SUM(SurfaceArea) FROM country; 

-- 단독으로 나오는 숫자들은 이렇게 기본 사칙연산은 동작한다. 
SELECT SUM(SurfaceArea)/10000 FROM country; 

-- 위를 좀 줄여주기 위해서 소수점 자리를 제거하는 ROUND를 사용 할 수 있다. 
SELECT ROUND(SUM(SurfaceArea)/10000) FROM country; 

-- 세계 인구의 나라 별 평균 2천만 
SELECT AVG(Population) FROM country;

-- 아시아 국가의 나라별 평균 7천만 
SELECT AVG(Population) FROM country WHERE Continent = 'Asia';

-- (SELECT Max(Population) FROM country) = 1277558000;  
SELECT * FROM country WHERE Population = (SELECT Max(Population) FROM country);

-- 먼저 괄호 안에 있는 걸 계산하고 -> 그 결과가 만들어지져서 WHERE이 2번, 그 다음이 SELECT 

-- 많이 조회하는걸 한꺼번에 SELECT 안에 넣어서 조회 할 수 있다! 
SELECT 
	COUNT(*),
	SUM(Population),
	AVG(Population),
	MAX(Population),
	MIN(Population) FROM country;

-- Null 값을 어떻게 분석을 해야하는가? 
SELECT LifeExpectancy FROM country; 

SELECT AVG(LifeExpectanacy) FROM country;  -- 평균이 66 정도 나옴 

-- 콜레스는 행과 행을 합치는 함수이다. 
SELECT COALESCE FROM country; 

-- Null값 채워넣기
-- 행을 합칠 때 앞에 66이 들어있으면 앞에를 선택을 하고, 만약 Null이 들어있으면 뒤를 선택한다. 
SELECT COALESCE(LifeExpectancy, 66) FROM country; 

SELECT AVG(COALESCE(LifeExpectancy, 50)) FROM country; 


USE sakila; 
SELECT * FROM film;
-- 연습 문제 
-- 전체 영화 개수
SELECT Count(*) FROM film;

-- 등급(rating)이 'PG'인 영화 개수
SELECT Count(*) FROM film WHERE rating = 'PG';

-- 서로 다른 등급(rating)의 개수
SELECT Count(DISTINCT rating) As 등급의갯수 FROM film;

SELECT DISTINCT rating FROM film; 

-- 모든 영화의 대여료(rental_rate) 합계
SELECT SUM(rental_rate) FROM film;

-- 모든 영화의 평균 대여료 (소수점 둘째 자리)
SELECT ROUND(AVG(rental_rate), 2) FROM film; 

-- 등급이 'R'인 영화의 평균 대여료
SELECT AVG(rental_rate) FROM film WHERE rating = 'r' ; 

-- 가장 비싼 대여료와 해당 영화 제목
SELECT title, rental_rate FROM film order by rental_rate DESC LIMIT 1;
SELECT title FROM film WHERE rental_rate = (SELECT MAX(rental_rate) FROM film);

-- 가장 긴 상영 시간(length)과 해당 영화 제목
SELECT title, length FROM film ORDER BY length DESC LIMIT 1;
SELECT title FROM film WHERE length = (SELECT MAX(length) FROM film);

-- 가장 짧은 상영 시간과 해당 영화 제목
SELECT title, length FROM film ORDER BY length ASC LIMIT 1;
SELECT title FROM film WHERE length = (SELECT MIN(length) FROM film);

-- film 테이블의 다음 통계를 한 번에 조회하세요 
-- 		전체 영화 수, 총 대여료 합계, 평균 대여료, 최고 대여료, 최저 대여료, 평균 상영 시간

SELECT 
Count(*), 
SUM(rental_rate), 
AVG(rental_rate), 
(SELECT rental_rate FROM film order by rental_rate DESC LIMIT 1), 
(SELECT rental_rate FROM film order by rental_rate ASC LIMIT 1), 
AVG(length)
 from film;
 
SELECT 
Count(*), 
SUM(rental_rate), 
AVG(rental_rate), 
(SELECT rental_rate FROM film order by rental_rate DESC LIMIT 1), 
(SELECT rental_rate FROM film order by rental_rate ASC LIMIT 1), 
AVG(length)
 from film 







