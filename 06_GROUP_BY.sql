USE world;

SELECT * FROM country; 

-- 컨티넌트를 중심으로 모든 대륙을 묶었다.  그냥 *을 쓰면 조회가 안되지만 카운트는 대륙 별로 갯수를 집계해서 조회가 가능하다. 
SELECT Continent, COUNT(*) FROM country GROUP BY Continent;

SELECT Continent, COUNT(*) FROM country 
GROUP BY Continent ORDER BY COUNT(*) DESC; 

SELECT 
	Continent,
	COUNT(*),
	ROUND(AVG(Population)/ 1000000, 0) AS 인구수,
	AVG(LifeExpectancy)
FROM country 
GROUP BY Continent 
ORDER BY AVG(LifeExpectancy) DESC;

SELECT 
	Continent,
    Region,
    COUNT(*)
FROM country 
GROUP BY Continent, Region
ORDER BY Continent, COUNT(*); -- 큰 대륙 별로 가장 작은 것부터 큰 것까지 오름차순된다. 

-- 그룹핑 하기 전의 데이터는 200몇개이는 데이터인데, 그룹바이를 하면, 확 줄었따가 또 하면 조금씩 늘어난다. 
-- 그룹 바이를 한 결과를 필터링 해보는 것! 지금까지는 WHERE절로 전체로 했는데, 그룹바이를 필터링 해보자 

SELECT Continent, COUNT(*) 
FROM country 
WHERE Population >= 100000000 -- 1억명인 나라를 먼저 거른다음에 그룹핑 한거다. 
GROUP BY Continent
;

-- 일단 그룹핑으로 묶은 다음에, 조건을 사용한거다. HAVING은 현재 가지고 싶은 데이터만 가지는 것을 뜻한다.  
SELECT Continent, COUNT(*) 
FROM country 
GROUP BY Continent
HAVING COUNT(*) > 10;

SELECT Continent, AVG(Population) 
FROM country 
GROUP BY Continent
HAVING AVG(Population)  > 20000000 ;




-- 등급(rating)별로 다음 정보를 조회하세요:
-- - 등급, 영화 개수
-- - 영화 개수가 많은 순서로 정렬
USE Sakila;
SELECT rating, COUNT(*) FROM film GROUP BY rating ORDER BY COUNT(*) DESC;

-- 등급(rating)별로 다음 정보를 조회하세요:
-- - 등급
-- - 영화 개수
-- - 평균 대여료 (소수점 둘째 자리)
-- - 최고 대여료
-- - 최저 대여료
-- - 평균 대여료 내림차순 정렬

SELECT rating, count(*), ROUND(AVG(rental_rate),2) AS 평균대여료, MAX(rental_rate) , MIN(rental_rate)  FROM film GROUP BY rating 
	ORDER BY 평균대여료 DESC; 

-- 등급별 통계에서 영화가 100개 이상인 등급만 조회하세요:
-- - 등급
-- - 영화 개수
-- - 평균 대여료
SELECT rating, COUNT(*), AVG(rental_rate)
FROM film GROUP BY rating HAVING COUNT(*) > 10; 

-- 대여료가 2.99 이상인 영화만 집계하여, 등급별 통계를 조회하세요.
-- 단, 해당 등급의 영화가 50개 이상인 경우만 표시:
-- - 등급
-- - 영화 개수
-- - 평균 대여료

SELECT 
rating, COUNT(*), AVG(rental_rate)
FROM film WHERE rental_rate > 2.99 GROUP BY rating HAVING COUNT(*) > 50; 

-- 배우(actor) 테이블에서 성(last_name)별 배우 수를 조회하세요:
-- - 성
-- - 배우 수
-- - 배우가 2명 이상인 성만 표시
-- - 배우 수 내림차순 정렬

SELECT last_name, COUNT(*) FROM ACTOR GROUP BY last_name HAVING COUNT(*) >= 2 ORDER BY COUNT(*) DESC;

















