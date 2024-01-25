SELECT * 
FROM EMPLOYEES e;

--first name, last name, job_id 조회

SELECT first_name, last_name, job_id
FROM EMPLOYEES e;

--사원번호가 176인 사람의 last name과 departmen id 조회
SELECT last_name, DEPARTMENT_ID
FROM EMPLOYEES e
WHERE EMPLOYEE_ID = 176;
--연봉이 12000이상 되는 직원들의 last name과 salary 조회
SELECT last_name, salary
FROM EMPLOYEES e
WHERE salary >= 12000;

--연봉이 5000에서 12000의 범위 이외인 사람들의 last name과 salary 조회
SELECT last_name, salary
FROM EMPLOYEES 
WHERE 


-- 부서번호가 20, 50부서에서 근무하는 사원들의 last_name, DEPARTMENT_ID 조회
SELECT last_name, DEPARTMENT_ID
FROM EMPLOYEES e
WHERE EMPLOYEE_ID = 20 OR EMPLOYEE_ID = 50;

-- 커미션을 버응 모든 사원들의 last_name, salary, COMMISSION_PCT 조회;

-- salary가 2500, 3500, 7000이 아니며 JOB이 SA_REP나 ST_CLERK 사원 조회
SELECT
	*
FROM
	EMPLOYEES e
WHERE
	salary NOT IN (2500, 3500, 7000)
	AND JOB_ID IN ('SA_REP', 'ST_CLER')

	-- 2017-01-01 ~ 2017-12-31 사이에 고용된 사원들의 last_name, DEPARTMENT_ID, hire_date 조회
	-- hire_date 내림차순 정렬
	SELECT last_name, DEPARTMENT_ID
FROM EMPLOYEES e
WHERE EMPLOYEE_ID = 20 OR EMPLOYEE_ID = 50;


-- BETWEEN a AND b 

-- 부서번호가 20, 50 부서에서  근무하고 연봉이 5000~12000 사이인 사람들의 last_name, salary 조회
SELECT last_name, DEPARTMENT_ID
FROM EMPLOYEES e
WHERE EMPLOYEE_ID = 20 OR EMPLOYEE_ID = 50;
-- 2017-01-01~201712-31 사이에 고용된 사원들의 last_name, EMPLOYEE_ID hire_date 조회
SELECT last_name, EMPLOYEE_ID, hire_date
FROM EMPLOYEES e
WHERE hire_date BETWEEN '2017-01-01' AND '2017-12-31' 
ORDER BY hire_date DESC;


-- last_name에 u 가 포함되는 사원들의 사번, last_name 조회 
SELECT last_name, EMPLOYEE_ID
FROM EMPLOYEES e
WHERE last_name LIKE '%u%';

-- last_name 의 4번째 문자가 a인 사원들의 사번, last_name 조회
SELECT last_name, EMPLOYEE_ID
FROM EMPLOYEES e
WHERE last_name LIKE '___a%';

-- last_name 에 a 혹은 e 글자가 들어있는 사원들의 사번, last_name 조회후 last_name 오름차순 조회
SELECT last_name, EMPLOYEE_ID
FROM EMPLOYEES e
WHERE last_name LIKE '%a%' OR last_name LIKE '%e%'
ORDER BY last_name ASC;

-- last_name 에 a 와 e 글자가 들어있는 사원들의 사번, last_name 조회후 last_name 오름차순 조회
-- 
SELECT last_name, EMPLOYEE_ID
FROM EMPLOYEES e
WHERE last_name LIKE '%a%e%' OR last_name LIKE '%e%a%'
ORDER BY last_name ASC;

SELECT *
FROM EMPLOYEES e

-- 매니저가 없는 사람들의 last_name, JOB_ID 조회
SELECT last_name, JOB_ID 
FROM EMPLOYEES e
WHERE MANAGER_ID IS NULL

-- ST_CLERK 인 JOB_ID를 가진 사원이 없는 부서 ID 조회 (단, 부서번호가 NULL 인 사원 제외)
SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES e
WHERE JOB_ID !=  'ST_CLERK' AND DEPARTMENT_ID IS NOT NULL

SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES e
WHERE JOB_ID NOT IN ('ST_CLERK') AND DEPARTMENT_ID IS NOT NULL


-- commission_pct 가 NULL 이 아닌 사원들 중에서 commission = salary = commission_pct 를 구하여 EMPLOYEE_ID, first_name, job_id, commission를 조회 


-- NULL * 숫자 = NULL


-- first_name 이 'curtis 인 사원의 firat_name last_name, email, phon_number, job_id를 조회 한다. 단 job_id 경과는 소문자로 출력한다.
SELECT FIRST_NAME, LAST_NAME, EMAIL, FHON_NUMBER, JOB_ID
FROM EMPLOYEES e
WHERE 

-- 부서번호가 690,70,80,90 인 사원들의 EMPLOYEES_ID, firat_name, hire_date,job_id 조회. 단, job _id가 IT_PROG 인 경우 프로그래머로 변경하여 출력한다.
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, REPLACE(JOB_ID,'IT_PROG','프로그래머')
FROM EMPLOYEES e
WHERE DEPARTMENT_ID IN (60,70,80,90);

-- job_id가 AD_PRES, PU_CLERK인 사원들의 EMPLOYEES_ID, firat_name, job_id조회. 단, 사원명은 firat_name과 last_name을 공백 포함하여 열결
-- 'ABC' 'DEF' => ABC DEF'

SELECT EMPLOYEE_ID, FIRST_NAME || ' '|| LAST_NAME AS NAME , JOB_ID
FROM EMPLOYEES e
WHERE JOB_ID IN ('AD_PRES', 'PU_CLERK");');


SELECT
	LAST_NAME,
	SALARY,
	CASE TRUNC(salary/2000,0)
		WHEN 0 THEN '0%'
		WHEN 1 THEN '9%'
		WHEN 2 THEN '20%'
		WHEN 3 THEN '30%'
		WHEN 4 THEN '40%'
		WHEN 5 THEN '42%'
		WHEN 6 THEN '44%'
		ELSE '45%' 
	END AS TAX_RATE
FROM
	EMPLOYEES e
	WHERE DEPARTMENT_ID = 80;

-- 최대연봉 - 최소연봉 차이 조회
SELECT MAX(SALARY) - MIN(SALARY) AS gap
FROM EMPLOYEES e;

-- 매니저로 근무하는 사원들의 총 수 조회(매니저 번호 중복 제거)
SELECT COUNT(DISTINCT MANAGER_ID)
FROM EMPLOYEES e;

-- 부서별 직원수 구하기(부서번호의 오름차순 출력)

SELECT DEPARTMENT_ID, COUNT(EMPLOYEE_ID) 
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
ORDER BY DEPARTMENT_ID; 

-- 부서별 평균 급여(부서번호의 오름차순 출력)

SELECT DEPARTMENT_ID, ROUND(AVG(SALARY)) 
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
ORDER BY DEPARTMENT_ID; 

-- 동일한 직무(job_id)가진 사원들의 총 수 조회

SELECT JOB_ID, EMPLOYEE_ID 
FROM EMPLOYEES e 
GROUP BY JOB_ID 
ORDER BY JOB_ID 


-- 매니저가 관리하는 사원들 중에서 최소급여 조회
-- 매니저가 관리하는 사원들 중에서 최소급여가 6000 미만인 최소깁여는 제외
-- 매니저가 없는 사원 제외

-- 102 9000
-- 103 8300
-- 101 5800 (X)

SELECT MANAGER_ID, MIN(SALARY)  
FROM EMPLOYEES e 
WHERE MANAGER_ID IS NOT NULL 
GROUP BY MANAGER_ID HAVING MIN(SALARY) >= 6000
ORDER BY MANAGER_ID;



-- 자신의 담당 매니저의 고용일보다 빠른 입사자 찾기


-- 도시 이름이 T 
	
-- (도시명은 LOCATION 테이블에)
SELECT
	e.EMPLOYEE_ID,
	e.LAST_NAME,
	d.DEPARTMENT_ID,
	l.CITY
FROM
	EMPLOYEES e
JOIN DEPARTMENTS d ON
	e.DEPARTMENT_ID = d.DEPARTMENT_ID
JOIN LOCATIONS l ON
	d.LOCATION_ID = l.LOCATION_ID
WHERE
	l.CITY LIKE 'T%';

-- 위치 아이디가 1700인 사원들의 last_name, 부서번호, 연봉 조회
SELECT
	e.LAST_NAME,
	d.DEPARTMENT_ID,
	e.SALARY
FROM
	EMPLOYEES e
JOIN DEPARTMENTS d ON
	e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE d.LOCATION_ID = 1700;


-- 부서명, 위치ID, 각 부서별 사원 수, 각 부서별 평균 연봉 조회
-- 평균 연봉은 소수점 두자리 까지만 표현
SELECT
	d.DEPARTMENT_NAME,
	d.LOCATION_ID,
	COUNT(e.EMPLOYEE_ID) ,
	ROUND(AVG(e.SALARY), 2)
FROM
	EMPLOYEES e
JOIN DEPARTMENTS d ON
	e.DEPARTMENT_ID = d.DEPARTMENT_ID
GROUP BY
	d.DEPARTMENT_NAME,
	d.LOCATION_ID
ORDER BY
	d.LOCATION_ID; 


-- Excutive 부서에 근무하는 사원들의 부서번호, last_name, job_id 조회
SELECT d.DEPARTMENT_ID, e.LAST_NAME, e.JOB_ID  
FROM
	EMPLOYEES e
JOIN DEPARTMENTS d ON
	e.DEPARTMENT_ID = d.DEPARTMENT_ID AND d.DEPARTMENT_NAME = 'Executive';



-- 각 사원별 소속 부서에서 자신보다 늦게 고용되었으나 많은 연봉을 받는 사원이 존재하는 사원들의 이름 조회
-- (이름은 first_name과 last_name을 결합하여 하나로 나오게 하기)
-- 부서번호, 결합된 이름, salary, hire_date 출력

SELECT
	e.DEPARTMENT_ID AS 부서번호,
	e.FIRST_NAME || ' ' || e.LAST_NAME AS "내이름",
	e.SALARY AS 내급여,
	e.HIRE_DATE AS 내입사일
FROM
	EMPLOYEES e
JOIN EMPLOYEES e2 ON
	e.DEPARTMENT_ID = e2.DEPARTMENT_ID
	AND e.SALARY < e2.SALARY
	AND e.HIRE_DATE < e2.HIRE_DATE;














































