-- 테이블관리

-- 필드명 데이터타입 null(or not null)          null은 생략 가능 not null은 불가능
--                null : 데이터가 없어도 생성가능
--                not null : 반드시 데이터가 있어야한다.


-- emp 테이블에 문자 15자리까지 저장할 수 있는 tel 필드를 만들어라.
ALTER TABLE emp ADD (tel VARCHAR2(15));

-- 필드 수정하기
ALTER TABLE emp MODIFY (ename VARCHAR(20));
INSERT INTO emp(empno, ename) VALUES(1234, '세종대왕');

-- 기존 데이터가 새로 설정한 자리수 보다 클 때는 수정이 안된다.
-- 즉, 데이터에 영향을 주지 않는 한도 내에서 수정이 가능하다.
ALTER TABLE emp MODIFY (job VARCHAR2(5));

ALTER TABLE emp MODIFY (job VARCHAR2(15));

-- 필드 삭제하기 
-- 열 데이터도 삭제 됨

ALTER TABLE emp DROP COLUMN mgr;

-- commit은 insert, delete, update 등에서만 사용가능
-- primary key: 같은 값이 있으면 안된다.


-- 테이블 생성
-- 회원정보 테이블 생성 : member
CREATE TABLE MEMBER(
    NO          number(5)                   primary key,
    USERNAME    varchar2(20)    not null,
    PHONE       varchar2(15)    not null,
    EMAIL       varchar2(50)    null    ,-- null은 생략가능
    ADDR        varchar2(300)           ,-- null 생략됨
    WRITEDATE   date default sysdate -- writedate에 값을 설정하지 않으면 자동으로 현재 날짜 시간정보가 생성된다.
);

-- 시퀀스(SEQUENCE)  ->    규칙적인 데이터를 자동으로 생성해주는 객체이다.
--                        한 번 생성된 정보는 다시 생성하지 않는다. (UNIQUE)

CREATE SEQUENCE mem_sq
START WITH 1
INCREMENT BY 1;


-- 5부터 3씩 증가하는 SEQUENCE 만들기
CREATE SEQUENCE f_t
START WITH 5
INCREMENT BY 3;


-- 시퀀스 목록 확인하기
SELECT * FROM user_sequences;


-- 시퀀스 객체에서 번호를 얻어오기
-- 5, 8, 11, 14, 17, 20, ETC...
-- NEXTVAL : 새로운 수
-- CURRVAL : 사용한 값 중에 제일 마지막에 사용한 값
SELECT F_T.NEXTVAL FROM DUAL;
SELECT F_T.CURRVAL FROM DUAL;
SELECT F_T.NEXTVAL, F_T.CURRVAL FROM DUAL;
SELECT F_T.CURRVAL, F_T.NEXTVAL FROM DUAL;
-- 같이 사용한다면 순서가 어떻든 결과가 같음


-- member 테이블에 레코드 추가하기
INSERT INTO member(no, username, phone) VALUES(mem_sq.nextval,'KIM', '010-1234-5678');
INSERT INTO member(no, username, phone) VALUES(mem_sq.nextval,'PARK', '010-9012-3456');

ALTER TABLE member DROP column addr;

-- sequence 삭제
DROP SEQUENCE F_T;
-- sequence 확인
SELECT * FROM user_sequences;

-- 테이블 지우기
DROP TABLE member;
DROP TABLE emp5;
DROP TABLE emp4;
DROP TABLE emp3;
DROP TABLE emp2;
DROP TABLE emp;


-- 삭제시 쓰레기 남지 않도록 지우기
DROP TABLE DEPT PURGE;

-- 이미 존재하는 쓰레기 지우기
PURGE recyclebin;








SELECT*FROM tab;
DESC member;
SELECT * FROM member;








SELECT*FROM tab;
SELECT*FROM emp;
SELECT empno, ename, tel, job FROM emp;
DESC emp;

@ d:\downloads\demo.sql;


--우리집 책 정보 DB 구축






