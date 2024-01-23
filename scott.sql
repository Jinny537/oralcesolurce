-- scott

-- SELECT(데이터 조회)
--e: 별칭(임의 지정 가능) / 없어도 됨
--*: 전체 필드(칼럼)를 의미함
SELECT * FROM EMP e;

-- 특정 해당하는 내용 보기
SELECT EMPNO, ENAME, JOB FROM EMP;

--emp 테이블
--empno(사원번호), ename(사원명), job(직책), mgr매니저번호), hiredate(고용일), sal(급여), comm(보너스)
deptno(부서번호)

--emp 테이블에서
SELECT
	EMPNO,
	MGR,
	DEPTNO
FROM
	EMP e;
	
SELECT deptno
FROM EMP e;

--부서번호 조회 중복데이터 제거
SELECT DISTINCT deptno
FROM EMP e;

--데이터 출력시 필드명 별칭 부여
--쌍따음표는 별칭에 공백이 있는 경우 무조건 사용
--AS 생략 가능
SELECT
	EMPNO AS 사원번호,
	MGR 매니저번호,
	DEPTNO "부서 번호"
FROM
	EMP;

--연봉 계산
--월급 * 12 + 수당 
--sal * 12 + comm
SELECT empno, SAL, sal * 12 + comm AS "연봉"
FROM EMP e;

--정렬
--ORDER BY 정렬기준컬럼명 DESC or ASC 
--DESC(내림차순),(오름차순)
SELECT
	*
FROM
	EMP
ORDER BY SAL DESC;

--emp 테이블에서 empno, ename, sal 조회(,empno 내림차순)

SELECT
	empno,ename,sal
FROM
	EMP
ORDER BY sal;

--전체조회, 부서번호 오름차순, sal 내림차순
SELECT * 
FROM EMP e
ORDER BY DEPTNO, SAL DESC;

--조건
--부서번호가 30번 이상인 사원 조회
--sal > 1000 이상인 서원 조회 
--= (같다), 산술연산자
SELECT *
FROM EMP e
WHERE DEPTNO = 30;

SELECT *
FROM EMP e
WHERE SAL >= 1000;

SELECT *
FROM EMP e
WHERE SAL >= 1000
ORDER BY SAL DESC;p

--empno가 7782인 사원 조회 
SELECT *
FROM EMP e
WHERE empno=7782;

--deptno가 30이괴, job이 SALESMAN 사원 조회
--데이터는 대소문자 구별함
SELECT *
FROM EMP e
WHERE DEPTNO = 30 AND JOB = 'SALESMAN'

--사원번호가 7499이고 부서번호가 30인 사원 조회 
SELECT *
FROM EMP e
WHERE empno = 7499 AND deptno =30;

--이거나(혹은) :or
--부서번호가 30이거나 job salesman 서원 조회
SELECT *
FROM EMP e
WHERE DEPTNO = 30 or JOB='SALESMAN';



-- 연봉이 36000인 사원 조회 
-- 연봉 sal * 12 + comm
SELECT *
FROM EMP e
WHERE sal * 12 + comm = 36000;


--문자 비교가 된다 - 산술연산 기호 가능
SELECT *
FROM EMP e
WHERE ENAME >= 'F';

--sal이 3000이 아닌 사원 조회

SELECT *
FROM EMP e
WHERE SAL != 3000;

SELECT *
FROM EMP e
WHERE SAL <> 3000;

SELECT *
FROM EMP e
WHERE SAL ^= 3000;

-- job 이 manager or salesman or clerk

SELECT *
FROM EMP e
WHERE JOB = 'MANAGER' OR JOB = 'SALESMAN' OR JOB = 'CLERK';

-- in
SELECT *
FROM EMP e
WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK');

SELECT *
FROM EMP e
WHERE JOB NOT IN ('MANAGER', 'SALESMAN', 'CLERK');


-- hiredate가 1981 10 31 이루에 고용된 사원 조회
-- 날짜 데이터 성술 연산 가능, 날짜데이터 ''로 처리 
SELECT *
FROM EMP e
WHERE hiredate > '1981-10-31';

-- between a and b
-- sal 2000이상 3000이하인 사원 조회
SELECT *
FROM EMP e
WHERE SAL BETWEEN 2000and 3000;

-- not between a and b
-- 2000 이상 3000이하가 아닌 사원 조회
SELECT *
FROM EMP e
WHERE SAL NOT BETWEEN 2000 AND 3000;











