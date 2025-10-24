USE world; 

-- WHHERE 절! 
SELECT * FROM country WHERE Code = 'AFG';

SELECT * FROM country WHERE Name = 'South Korea';
SELECT * FROM country WHERE continent = 'Asia' ; 

SELECT * FROM country WHERE LifeExpectancy >= 80; 

SELECT * FROM country WHERE GNP < 10000; 

SELECT * FROm country WHERE Continent = 'Asia' AND Population >= 100000000;
SELECT * FROM country WHERE Continent = 'Europe' OR Continent = 'North America'; 

-- Not(부정) 논리연산자, 아래 두개가 같음. 
SELECT * FROM country WHERE Continent != 'Asia'; 
SELECT * FROM country WHERE not Continent = 'Asia';

-- 사이의 값을 불러올 때 
SELECT * FROM country WHERE LifeExpectancy >= 70 AND LifeExpectancy <= 80; 
SELECT * FROM country WHERE LifeExpectancy BETWEEN 70 AND 80; 

-- IN 뒤에 있는 괄호 안에 포함되어 있으면 조회가능
SELECT * FROM country WHERE Continent IN ('Asia', 'Europe');

-- 퍼센트를 쓰면 특정한 글자가 포함 된 것을 조회 할 수 있다.  
-- 하지만 Like는 데이터가 많아질수록 모두 일일이 비교하기 때문에 비효율적이고, 성능이 좋지 못하는 방식이다. 
SELECT * FROM country WHERE Name Like 'South%';
SELECT * FROM country WHERE Name LIKE '%States%'; 
-- 언더바를 쓰면 언더바 갯수만큼 조회하게 된다. 
SELECT * FROM country WHERE Name Like '___land';

-- NULL을 조회할 때는 = 기호를 사용할 수 없다!  
SELECT * FROM country Where GNPOld = NULL;

-- 그래서 is를 사용해서 가져와야함!
SELECT * FROM country WHERE GNPOld Is NULL; 
-- 이렇게 하면 비어있지 않은 애들만 가져올 수 있어짐

SELECT * FROM country WHERE IndepYear IS NOT NULL;

-- 예상문제 

USE sakila; 
SELECT * FROM film;

-- 대여료(`rental_rate`)가 4달러 이상인 영화의 제목과 대여료 조회
SELECT title, rental_rate FROM film WHERE rental_rate >= 4;
SELECT * FROM film WHERE rental_rate >= 4;

-- 상영시간(`length`)이 120분 미만인 영화 조회
SELECT * FROM film WHERE length < 120;

-- 등급(`rating`)이 'PG-13'인 영화 조회
SELECT * FROM film WHERE rating = 'PG-13';
SELECT * FROM film WHERE rating = 'PG-13';

SELECT * FROM film;

-- 등급이 'PG'이고 대여료가 3달러 이상인 영화
SELECT * FROM film WHERE rating LIKE 'PG%' AND rental_rate >= 3;
SELECT * FROM film WHERE rating = 'PG';

-- 등급이 'G' 또는 'PG'인 영화
SELECT * FROM film WHERE rating LikE 'G%' OR rating Like 'PG%';

-- 상영시간이 60분 미만이거나 180분 이상인 영화 (이떄는 BETWEEN을 걸기는 힘들다!) 
SELECT * FROM film WHERE length < 60 OR length >= 180;

-- 제목에 'LOVE'가 포함된 영화 조회
SELECT * FROM film WHERE title Like '%LOVE%';

-- 제목이 'THE'로 시작하는 영화 조회
SELECT * FROM film WHERE title Like 'THE%';

-- 배우 성(`last_name`)이 'SON'으로 끝나는 배우 조회
USE sakila;
SELECT * FROM actor WHERE last_name LIke '%SON';


-- 등급이 'PG-13'인 영화 중에서 대여료가 2.99달러 이상 4.99달러 이하이고, 상영시간이 90분 이상인 영화
SELECT * FROM film 
	WHERE rating = 'PG-13' 
	AND rental_rate BETWEEN 2.99 AND 4.99  -- BETWWEN 사용 가능함! 
    AND length >= 90;






















