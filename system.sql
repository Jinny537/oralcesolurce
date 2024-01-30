ALTER SESSION SET "_oracle_script"=TRUE;

GRANT CREATE VIEW TO scott;


-- DBA궝한을 가진 사용자만 사용자를 생성하고 궝한 부여
-- SYSDATE, sys sa sysdba

-- CREATE USER 아이디 IDENTIFIED BY 비밀번호 

-- test 생성
-- 공통 사용자 또는 롤 이름이 부적합합니다.
-- 21c XE 요구사항
CREATE USER c##test IDENTIFIED BY test;

-- CREATE SESSION 권한을 가지고있지 않음; 로그온이 거절
-- 권한 부여
-- SESSION, CREATE(USER, TABLE, SEQUENCE< VIEW)
--권한 그룹=>를
-- CONNECT, RESOURCE
-- CONNECT(SESSION< CREATE TABLE, CREATE VIEW...)
-- RESOURCE(SEQUENCE, 프로시저, 테이블....)

-- GRANT 권한 이름,.......TO 아이디
-- GRANT 롤이름,.........TO 아이디
GRANT CONNECT, RESOURCE TO c##test;

CREATE USER c##test2 IDENTIFIED BY test
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE TEMP
QUOTA 10M ON USERS;

GRANT CONNECT, RESOURCE TO c##test2;


REVOKE 취소할 권한이름,......FROM 이이디
ALTER USER c##test2 IDENTIFIED test;







