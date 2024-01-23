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
-- 2017-01-01~201712-31 사이에 고용된 사원들의 ast_name, EMPLOYEE_ID hire_date 조회
SELECT last_name, EMPLOYEE_ID, hire_date
FROM EMPLOYEES e
WHERE hire_date BETWEEN '2017-01-01' AND '2017-12-31' ORDER BY hire_date DESC;



