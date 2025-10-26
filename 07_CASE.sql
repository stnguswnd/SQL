USE world;

SELECT Name, Continent, 
CASE Continent
	WHEN 'Asia' THEN '아시아'
    WHEN 'Europe' THEN '유럽' 
    ELSE 'etc' 
    END
 FROM country; 


SELECT 
	Name,
    Population,
    CASE 
		WHEN Population >= 100000000 THEN '큰국가'
        WHEN Population >= 50000000 THEN '중간 국가'
        ELSE '작은국가'
        END
FROM country; 

SELECT 
	Name, Population, GNP,  
    CASE
		WHEN (GNP / Population) >= 0.02 THEN '선진국'
        ELSE '선진국아님'
    END 
FROM country; 

-- WHERE 절 안에도 CASE문이 활용 가능하다. 
SELECT 
	Name, Continent, Population 
FROM Country 
WHERE Population >= 
	CASE Continent 
		WHEN 'Asia' THEN 50000000
        WHEN 'Europe' THEN 3000000
        ELSE 100000
END; 

-- ORDER BY도 케이스 사용이 가능하다. 
SELECT 
	Name, Continent, Population 
FROM country 
ORDER BY 
	CASE Continent
		WHEN 'Asia' THEN Population 
        WHEN 'Europe' THEN GNP
        ELSE Population
    END; 

-- 조건부 집계
SELECT 
	Continent, COUNT(*),
    SUM(CASE     WHEN 조건 THEN 트루 ELSE 펄스  END )
FROM country
GROUP BY Continent; 

SELECT 
	Continent, COUNT(*),
    SUM(CASE     WHEN Population > 50000000 THEN 1 ELSE 0  END )  -- 1인 갯수(즉 true값을 가지는)가 단 두개! 
FROM country
GROUP BY Continent; 












