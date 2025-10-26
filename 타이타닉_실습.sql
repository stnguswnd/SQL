USE temp; 

SELECT COUNT(*) FROM titanic;

SELECT * FROM titanic;

-- 1-1 타이타닉 테이블에서 모든 컬럼의 상위 5개 행을 조회하세요.
SELECT * FROM train LIMIT 5;

-- 1-2 타이타닉 테이블의 전체 승객 수를 조회하세요. (결과 컬럼명: row_count)
SELECT COUNT(*) AS row_count FROM train; 

-- 1-3 cabin 컬럼의 결측치(빈 문자열) 개수를 조회하세요.
SELECT COUNT(*) 
FROM train
WHERE Cabin = '' OR Cabin IS NULL;

-- 요금(Fare)의 최솟값, 최댓값, 평균값을 조회하세요.
SELECT 
	MIN(Fare),
    MAX(Fare),
    AVG(Fare)
FROM titanic;

-- 문제 2-1: 1등석(pclass = 1) 승객의 이름(name), 티켓(ticket), 요금(fare)을 조회하세요.
SELECT 
	name,
    ticket,
    fare,
    pclass
FROM titanic WHERE pclass = 1; 

-- 문제 2-2 : 셰르부르 항구(embarked = 'C')에서 탑승한 승객의 모든 정보를 조회하세요. 
SELECT 
	*
FROM titanic WHERE Embarked = 'C';

-- 문제 2-3 : 30세 미만이면서 생존한 승객의 이름(name), 나이(age), 성별(sex)을 조회하세요. 
SELECT 
	Name, Age, Sex
FROM titanic WHERE AGE < 30; 

-- 모든 승객을 요금이 비싼 순서로 정렬하여 조회하세요.
-- 이름(name), 등급(pclass), 요금(fare) 표시

SELECT Name, Pclass, Fare
FROM titanic ORDER BY Fare DESC;

-- 문제 2-5 1등석 여성 승객의 이름(name), 나이(age), 요금(fare)을 조회하세요.
-- 나이가 어린 순서로 정렬

SELECT Name, Age, Fare FROM titanic ORDER BY Age;

-- 3-1 
SELECT AVG(Survived) * 100
FROM titanic; 

SELECT 
    ROUND(
        (SUM(CASE WHEN Survived = 1 THEN 1 ELSE 0 END) / COUNT(*)) * 100,
        2
    ) AS survival_rate
FROM train;


-- 3-2 아래는 0을 붙이게 되면, 0도 NULL이 아님에 포함되어서, COUNT 수와 똑같이 나옵니다. 
SELECT 
	COUNT(*),
    COUNT(CASE WHEN
				Survived = 1 THEN 1 ELSE 0 END ) AS 생존자수,
    AVG(Survived) * 100 AS 생존률
FROM titanic ORDER BY 생존률 DESC;

-- 3-2 
SELECT 
	COUNT(*),
    COUNT(CASE WHEN Survived = 1 THEN 1 END) AS 생존자수,
    AVG(Survived) * 100 AS 생존률
FROM titanic GROUP BY sex ORDER BY 생존률 DESC;

-- 3-3 티켓 등급별 생존율 및 평균 요금 
-- 등급별 생존율
SELECT 
	Pclass,
	AVG(Survived) * 100 AS 생존률
FROM titanic
	GROUP BY Pclass;
    
-- 등급별 평균요금, 최소 요금, 최대 요금 
SELECT Pclass, AVG(Fare), Min(Fare), MAX(Fare)
FROM titanic GROUP BY pclass;

SELECT * FROM titanic;

-- 문제 3-4: 항구별, 등급별 승객 수
-- 탑승 항구와 등급별로 승객 수를 조회하세요.
-- embarked가 NULL인 데이터는 제외
-- 항구, 등급 순서로 정렬
SELECT 
    Embarked AS 항구,
    Pclass AS 등급,
    COUNT(*) AS 승객수
FROM titanic WHERE Embarked != "" AND Embarked IS NOT NULL  -- WHERE을 중복으로 쓸 때는 AND를 쓰면 된다. 
GROUP BY Pclass, Embarked;

-- 실제 항구가 NULL 이면서, 등급이 1인 함수가 존재한다. 

-- 문제 3-5: 성별 및 등급별 생존율
-- 등급과 성별로 다음 정보를 조회하세요:
-- 총 승객 수, 생존자 수, 생존율 (백분율)
-- 등급, 성별 순서로 정렬

SELECT 
	Pclass, 
    Sex,
	COUNT(*) AS 총승객수 ,
    COUNT(CASE WHEN Survived=  1 THEN 1 END) AS 생존자수,
    AVG(Survived) * 100 AS 생존율_백분율 -- 별칭에는 괄호를 쓸 수 없어서 언더 스코어로 대체!  
FROM titanic GROUP BY Pclass, Sex;

-- 문제 3-6: 가족 동반 유무에 따른 생존율
-- 다음 두 가지 정보를 각각 조회하세요:

-- 1. '혼자' vs '가족동반' 생존율 비교  - SibSp Parch = 0 
-- 가족 규모 = sibsp + parch
-- 0명이면 '혼자', 1명 이상이면 '가족동반'
SELECT 
	AVG(Survived) * 100 AS 전체생존률,
    CASE 
		WHEN SibSp + Parch = 0 THEN "가족동반"
        ELSE "혼자" -- ELSE 뒤에는 무조건 값 하나만 와야함.  
        END AS 가족동반유무  -- 쌍따옴표를 써야 하나? SQL은 따옴표가 없는걸 컬럼으로써 인식하기 때문에 따옴표를 써줘야함. 
FROM titanic GROUP BY 가족동반유무 ;

-- 2. 가족이 1명이라도 있는 승객의 평균 생존율 
-- 아래 많이 하는 실수 SQL절은 SELECT보다 먼저 실행된다. 그래서 WHERE은 SELECT에서 만든 별칭을 모르므로, WHERE안에 CASE를 쓰꺼나, 서브쿼리로 감싸자. 
SELECT 
	AVG(Survived) * 100 AS 생존률,
	CASE 
		WHEN SibSp + Parch = 0 THEN "가족동반"
        ELSE "혼자" -- ELSE 뒤에는 무조건 값 하나만 와야함.  
        END AS 가족동반유무
FROM titanic WHERE 가족동반유무 = "가족동반"; 

-- 서브 쿼리 쓴 정답
SELECT 
    *,
    (SELECT ROUND(AVG(Survived) * 100, 2) FROM titanic WHERE SibSp + Parch > 0) AS 가족동반_평균생존률,
    CASE 
        WHEN SibSp + Parch > 0 THEN '가족동반'
        ELSE '혼자'
    END AS 가족동반유무
FROM titanic
WHERE SibSp + Parch > 0;

-- 그룹바이 쓰면서 가족이 1명 이상만 조회하는법 
SELECT 
    CASE 
        WHEN SibSp + Parch > 0 THEN '가족동반'
        ELSE '혼자'
    END AS 가족동반유무,
    COUNT(*) AS 승객수,
    ROUND(AVG(Survived) * 100, 2) AS 평균생존률
FROM titanic
WHERE (SibSp + Parch) > 0        -- ✅ 가족이 1명 이상인 승객만 선택
GROUP BY 가족동반유무;

-- 문제 3-7: 가족 규모별 생존율
-- 가족 규모(본인 포함 = 1 + sibsp + parch)별로 승객 수와 생존율을 조회하세요.
-- 가족 규모 순서로 정렬
SELECT 
	(1 + SibSp + Parch) AS 가족규모, 
    COUNT(*) AS 승객수, 
    (AVG(Survived) * 100) AS 생존률
FROM titanic GROUP BY (1 + SibSp + Parch) ORDER BY 가족규모;










