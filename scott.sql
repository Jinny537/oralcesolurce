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
WHERE DEPTNO >= 30;

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
WHERE SAL BETWEEN 2000 and 3000;

-- not between a and b
-- 2000 이상 3000이하가 아닌 사원 조회
SELECT *
FROM EMP e
WHERE SAL NOT BETWEEN 2000 AND 3000;

-- like 연산자와 와일드 카드(_,%)
-- _ : 문자 하나 
-- % : 문자 갯수는 무한대


-- 사원 이름이 s로 시작하는 사원 조회
SELECT *
FROM EMP e
WHERE ENAME LIKE 'S%';

SELECT *
FROM EMP e
WHERE ENAME

-- 사원 이름의 두번째 글자가 L인 사원 조회 
SELECT *
FROM EMP e
WHERE ENAME LIKE '_L%';

-- 사원 이름에 AM 문자가 포함된 사원 조회
SELECT *
FROM EMP e
WHERE ENAME LIKE '%AM%';

-- 사원 이름에 AM 문자가 포함되지 않은 사원 조회
SELECT *
FROM EMP e
WHERE ENAME NOT LIKE '%AM%';

--
SELECT * FROM EMP e;

-- NULL : 값이 없는 상태
-- '' : 빈 값 
-- ' ' : 흐페이스 바도 문자임

-- comm 이 NULL 인 사원 조회
-- NULL 비교 : is  
SELECT * FROM EMP e WHERE COMM = NULL;
SELECT * FROM EMP e WHERE COMM IS NULL;

-- mgr이 null인 사원 조회 
SELECT * FROM EMP e WHERE MGR IS NULL;

-- mgr이 null이 아닌 사원 조회
SELECT * FROM EMP e WHERE MGR IS NOT NULL;

-- 집합연산자 
-- 합집합(union, union null), 교집합(intersect), 차집합(minus)

-- 부서번호가 10 혹은 20 인 사원 조회 
-- OR 사용해서 추출
-- 합집합

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP e
WHERE DEPTNO = 10
UNION 
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP e
WHERE DEPTNO = 20;

-- 질의 블록은 부정확한 결과 열을 가지고 있습니다
-- 


SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP e
WHERE DEPTNO = 10
UNION 
SELECT SAL, JOB, DEPTNO, SAL
FROM EMP e
WHERE DEPTNO = 20


SELECT *
FROM EMP e
WHERE 

-- 결과값의 중복 제거
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP e
WHERE DEPTNO = 10
UNION 
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP e
WHERE DEPTNO = 10;

-- UNION ALL : 중복된 결과 값 제거 안함
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP e
WHERE DEPTNO = 10
UNION ALL 
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP e
WHERE DEPTNO = 10;

-- minus
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP e
MINUS 
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP e
WHERE DEPTNO = 10;


-- intersecr
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP e
INTERSECT 
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP e
WHERE DEPTNO = 10;


-- 오라클 함수 (내장 함수)
-- 함수는 사용하는 DBMS 에 따라 다르게 제공
-- 1. 문자함수
-- 대소문자 변경 
SELECT *
FROM EMP e
WHERE ENAME = 'cleak';

SELECT *
FROM EMP e
WHERE ENAME = UPPER('clark');

SELECT *
FROM EMP e
WHERE LOWER(ENAME) = 'clark';

-- upper(문자열) : 괄호 안 문자를 모두 대문자로 변환하여 반환
-- lower(문자열) : 괄호 안 문자를 모두 소문자로 변환하여 반환
-- initcap(문자열) : 괄호 안 문자 데이터중 첫번째 문자만 대문자로 나머지는 소문자로 변환하여 반환
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME) 
FROM EMP e

SELECT *
FROM EMP e
WHERE ENAME = UPPER('clark');


-- 문자열 길이: length
-- lengthb: 문자열에 사용된 바이트수 변화 
SELECT ENAME, LENGTH(ENAME)
FROM EMP e;

-- 함수 결과 를 보고 싶은데 테이블이 없으면 임시 테이블로 여미 샤용
-- 한글은 문자 하나당 3byte 할당, 영어 1byte
SELECT LENGTH('한글'), LENGTHB('한글')  FROM DUAL;


-- 직책의 이름이 6글자 이상인 사원 조회
SELECT *
FROM EMP e
WHERE LENGTH(JOB) >= 6;

-- 3) 문자열 일부를 추출 : substr(문자여데이터, 사작위치, 추출길이)
--                         substr(문자여데이터, 사작위치) : 시작위치-마지막까지
--                         시작위치가 음수라면 오른쪽 끝부터 시작
SELECT job, SUBSTR(JOB,1,2), SUBSTR(job,3,2), SUBSTR(job,5)
FROM EMP e;

SELECT job, SUBSTR(JOB,-1,2), SUBSTR(job,-3,2), SUBSTR(job,-5)
FROM EMP e;

-- 4) INSTR(문자열 데이터,위치를 찾으려는 문자,시작위치,시작위치에서 몇번째 위치)
--    문자열 데이터 안에서 특정 문자 위치 찾기
-- 못찾으면 0
SELECT INSTR('HELLO, ORACLE!','L') AS INSTR_1,
       INSTR('HELLO, ORACLE!','L', 5) AS INSTR_2,
       INSTR('HELLO, ORACLE!','L', 2, 2) AS INSTR_3
FROM DUAL;

-- 사원 이름에 s가 들어있는 사원 조회 
-- LIKE 
SELECT *
FROM EMP e
WHERE INSTR(ENAME, 'S') > 0;


-- 5) replace : 특정 문자를 다를 문자로 변경
--              replace(문자열데이터,찾는문자,변경할문자)

SELECT '0101-1234-5678/' AS REPLACE_BEFORE,
       REPLACE('010-1234-5678','_','') AS REPLACE_1,
       REPLACE('010-1234-5678','_') AS REPLACE_2,
       REPLACE('010-1234-5678','_',' ') AS REPLACE_3
FROM DUAL;

--6) concat : 두 문자열 데이터를 합하는 함수
--            CONCAT(문자열데이터1, 문자열데이터2)
SELECT CONCAT(ENPNO,ENAME), CONCAT(ENPNO,ENAME,JOB)
FROM EMP e
WHERE ENAME='SCOTT';


-- 7369 : SMITH
SELECT CONCAT(ENPNO,ENAME), CONCAT(ENPNO, CONCAT(' : ',ENAME))
FROM EMP e
WHERE ENAME='SMITH';

-- 7) TRIM : 공백제거
--    TRIM(삭제옵션(선택), 삭제할문자)
-- 'SMITH' = 'SMITH ' ' SMITH' ' SMITH '
-- 일반적으로 TRIM 많이 사용

SELECT '[' || ' __Oracle__ ' || ']' AS trim_befor,
       '[' || TRIM(' __Oracle__ ') || ']' AS trim,
       '[' || LTRIM(' __Oracle__ ') || ']' AS Ltrim,
       '[' || RTRIM(' __Oracle__ ') || ']' AS Rtrim
FROM DUAL;


SELECT '[' || ' __Oracle__ ' || ']' AS trim_befor,
       '[' || TRIM(LEADING '_' FROM '__Oracle__') || ']' AS TRIM_LEADING,
       '[' || TRIM(TRAILING '_' FROM '__Oracle__') || ']' AS TRIM_TRAILING,
       '[' || TRIM(BOTH '_' FROM '__Oracle__') || ']' AS TRIM_BOTH
FROM DUAL;


-- 2. 숫자함수 : 숫자 데이터에 적용
--    번올림, 올림, 버림, 나머지값 구하기
--    ROUND, CEIL, FLOOR, TRUNC, MOD
-- ROUND(숫자, 반올림 위치)

SELECT ROUND(1234.5678) AS ROUND,
       ROUND(1234.5678,0) AS ROUND1,
       ROUND(1234.5678,1) AS ROUND2,
       ROUND(1234.5678,2) AS ROUND3,
       ROUND(1234.5678,-1) AS ROUND_MINUS1,
       ROUND(1234.5678,-2) AS ROUND_MINUS2
FROM DUAL;

--TRUNC(숫자, 버릴 위치) : 버림
SELECT TRUNC(1234.5678) AS TRUNC,
       TRUNC(1234.5678, 0) AS TRUNC0,
       TRUNC(1234.5678, 1) AS TRUNC1,
       TRUNC(1234.5678, 2) AS TRUNC2,
       TRUNC(1234.5678,-1) AS TRUNC_MINUS1,
       TRUNC(1234.5678,-2) AS TRUNC_MINUS2
FROM DUAL;
       
-- CEIL, FLOOR : 지정한 숫자와 가까운 정수 찾기
-- CEIL : 지정한 숫자보다 큰 정수중 가장 작은 정수 반환
-- FLOOR : 지정한 숫자보다 작은 정수중 가장 큰 정수 반환   

SELECT CEIL(3.14), FLOOR(3.14), CEIL(-3.14), FLOOR(-3.14)
FROM DUAL;


-- MOD : 나머지
SELECT 11/5, MOD(11,5)
FROM DUAL;

       
-- 3. 날짜함수
-- 2023-01-24 or 2023/01/24

-- 오늘날짜
SELECT  SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP
FROM DUAL;
       

-- 날짜데이터 + 숫자 : 날짜 데이터 보다 숫자만큼 이후의 날짜
SELECT  SYSDATE, SYSDATE + 1, SYSDATE -1
FROM DUAL;


-- add_months() : 몇 개월 이후의 날짜 구하기
SELECT  SYSDATE, ADD_MONTHS(SYSDATE,3)
FROM DUAL;



-- 입사 30주년이 되는 날짜 구하기
SELECT empno, ename, hiredate, ADD_MONTHS(HIREDATE,360)
FROM EMP e;


-- MONTH_BETWEEN(날짜1,날짜2) : 두 개의 날자 데이터를 입력하고 두 날자간의 개월 수 차이 구하기
-- 고용일과 오늘날짜 차이
SELECT
	EMPNO, ENAME, HIREDATE, SYSDATE, 
	ENAME,
	HIREDATE,
	SYSDATE, 
	MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTHS1,
	MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS2,
	TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS3
FROM 
    EMP e;
   
-- NEXT_DAY, LAST_DAY
--NEXT_DAY(날짜, 요일) : 
--LAST_DAY(날짜) ; 
SELECT SYSDATE , NEXT_DAY(SYSDATE, '월요일')
FROM EMP e;

-- 데이터 타입
-- NUMBER(tntwk), VARCHAR@(문자), DATE(날짜/시간)
-- 자료형 변환(날짜 -> 문자, 문자 -> 숫자)


-- NUMBER + 문자 : 자동 형 변환으로 계산 처리
SELECT EMPNO, ENAME, EMPNO + '500'
FROM EMP e 
WHERE ENAME='FORD';

-- 수치가 부적합 합니다
--SELECT EMPNO, ENAME, EMPNO + 'ABCD'
--FROM EMP e 
--WHERE ENAME='FORD';


-- 명시전 형변환
-- TO_CHAR(날짜(숫자)데이터, '출력되기를 원하는 문자형태') : 숫자, 날짜데이터를 문자로 변환
-- TO_NUMBER() : 문자데이터를 숫자로 변환
-- TO_DATE() : 문자데이터를 날짜로 변환

-- TO_CHAR(날짜(숫자), 형식) : 날짜 데이터를 출력할 문자형태를 지정
-- TO_NUMBER(문자열, 숫자형식) : 문자열 데이터를 지정한 형태의 숫자로

-- Y : 연도, M : 월, D : 일, HH: 시, MI: 분, SS: 초, HH24 : 시를 24시간으로, AM(PM) : 오전, 오후
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD'), SYSDATE, TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MI:SS AM')
FROM DUAL;


SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD'), SYSDATE 
FROM DUAL;


SELECT 1300 - 1500, 1300 + 1500
FROM DUAL;


-- 수치가 부족합니다 
--SELECT '1,300' + '1,500'
--FROM DUAL;

-- 9 : 숫자의 한 자리를 의미함
-- 0 : 빈 자리를 0으로 채움
SELECT TO_NUMBER('1,300','999,999') + TO_NUMBER('1,500','999,999')
FROM DUAL;


SELECT TO_CHAR(sal, '999,999.00') AS sal1,
       TO_CHAR(sal, '000,999,999.00') AS sal2
FROM EMP e;

-- TO_DATE(문자, '인식될 날짜 형태') : 문자 데이터를 날짜 데이터로 변형
SELECT
	TO_DATE('2024-01-24') AS todate1,
	TO_DATE('20240124') AS todate2
FROM
	dual;

-- 수치가 부적합합니다
--SELECT '2024-01-24' - '2023-12-31'
--FROM dual;

SELECT TO_DATE('2024-01-24') - TO_DATE('2023-12-31')
FROM dual;

-- 널 처리 횟수
-- 널 * 숫자 => NULL, 널 + 숫자 => NULL
-- 널을 다른 값으로 변경

SELECT EMPNO, ENAME, SAL, COMM, SAL + COMM
FROM EMP e; 

--  NVL(널인지 검사할 열이르(or 데이터), 대체할)
SELECT EMPNO, ENAME, SAL, COMM, SAL + NVL(COMM,0)
FROM EMP e; 

-- NVL2(널인지 검사할 열이름(or 데이터), null 이 아닌경우 반환 데이터(계산식),null 인 경우 반환 데이터(계산식))

SELECT EMPNO, ENAME, SAL, COMM, NVL2(COMM, '0', 'X')
FROM EMP e;

-- NVL@
-- COMM 이 널이면 연봉=SAL * 12, 널이 아니면 연봉=sal * 12 +COMM
SELECT EMPNO, ENAME, SAL, COMM, NVL2(COMM, SAL * 12 + COMM, SAL * 12)
FROM EMP e;


-- job 이 manager 라면 SAL * 1.1
-- job 이 SALESMAN 라면 SAL * 1.05
-- job 이 ANALYST 라면 SAL
--        나머지 직무 SAL * 1.03

-- DECODE 함수와 CASE 문
-- DECODE(검사대상, 조건1, 조건 1이 참일 때 반환할 결과, 조건 2, 조건 2가 참일때 반환할 결과,......, 조건 1-조건n 일치하지 않는 경우 반환할 결과)

SELECT
	EMPNO,
	ENAME,
	JOB,
	SAL,
	DECODE(JOB, 'MANAGER', SAL * 1.1, 'SALESMAN', SAL * 1.05, 'ANALYST', SAL, SAL * 1.03) AS UPSAL
FROM
	EMP e;



SELECT
	EMPNO,
	ENAME,
	JOB,
	SAL,
	CASE
		job
		WHEN 'MANAGER' THEN SAL * 1.1
		WHEN 'SALESMAN' THEN SAL * 1.05
		WHEN 'ANALYST' THEN SAL
		ELSE SAL * 1.03
	END AS UPSAL2,
	DECODE(JOB, 'MANAGER', SAL * 1.1, 'SALESMAN', SAL * 1.05, 'ANALYST', SAL, SAL * 1.03) AS UPSAL
FROM
	EMP e; 


-- COMM 널일떄 해당사항 없음
--      0 일때 수당 없음 
--      > 0    수당 : COMM

SELECT
	EMPNO,
	ENAME,
	COMM,
	CASE
		WHEN COMM IS NULL THEN '해당사항 없음'
		WHEN COMM = 0 THEN '수당 없음'
		WHEN COMM > 0 THEN '수당 : ' || COMM
	END AS COMM_TEXT
FROM
	EMP e;


--

SELECT
	EMPNO,
	ENAME,
	SAL,
	TRUNC(SAL / 21.5, 2) AS DAY_PAY,
	ROUND(SAL / 21.5, 8, 1) AS TIME_PAY
FROM EMP e;


-- 칼럼 데이터 출력방식 고정

SELECT
	EMPNO,
	ENAME,
	HIREDATE,
	NEXT_DAY(ADD_MONTHS(HIREDATE,3),'월요일') AS R_JOB
	NVL(TO_CHAR(COMM),'N/A') AS COMM
FROM
	EMP e;
	


 






