-- 계정 생성

CREATE USER goguma IDENTIFIED BY 1234;

SELECT * FROM dba_users;

-- 1. 계정 생성
-- admin1, admin2, admin3   비밀번호 자율로
CREATE USER admin1 IDENTIFIED BY 1234;
CREATE USER admin2 IDENTIFIED BY 1234;

-- 2. 권한 설정 
-- admin1 : connect, resource 권한
GRANT connect, resource to admin1;
-- admin2 : 관리자계정권한(dba) 설정
GRANT dba, connect, resource to admin2;
-- admin3 : admin2 계정으로 생성하기
conn admin2/1234;
CREATE USER admin3 IDENTIFIED BY 1234;

-- 3. admin3 계정은 잠그기
ALTER USER admin3 ACCOUNT LOCK;
-- 4. admin1 계정 지우기
DROP USER admin1;
DROP USER goguma;
DROP USER admin2;
DROP USER admin3;
DROP USER samid;










