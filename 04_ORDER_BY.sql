USE world;

-- 인구수가 많은 순서대로 내림차순
SELECT * FROM country 
ORDER BY Population DESC; 

-- 뒤쪽 이름 순으로 내림차순
SELECT * FROM country 
ORDER BY Name DESC; 

SELECT * FROM country
ORDER BY Continent DESC, Population DESC; 

SELECT * FROM country
WHERE Continent = 'Asia'
ORDER BY GNP;

SELECT * FROM country 
ORDER By Population DESC
LIMIT 5; 

SELECT * FROM country 
ORDER BY Population DESC 
LIMIT 10 OFFSET 10; 
-- 앞에 10개는 스킵(OFFSET)하고, 그 다음 10개부터 보여주세요! 


SELECT * FROM country 
ORDER BY Populaton DESC 
LIMIT 5, 5;



