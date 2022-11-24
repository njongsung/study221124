CREATE TABLE book_tbl(
    isbn number(13) primary key,
    book_name varchar2(38) not null,
    price number(7) not null,
    jenre varchar2(20) null,
    first_pub date,
    pages number(4),
    author_code number(38) not null,
    pub_code number(10) not null,
    writedate date default sysdate
);

SELECT * FROM tab;
SELECT * FROM user_constraints;

-- 출판사 외래키 추가(출판사 코드를 외래키로 참조하기) 
ALTER TABLE book_tbl ADD CONSTRAINT booktbl_fk_pubcode
FOREIGN KEY (pub_code) REFERENCES pub_tbl(pub_code);

-- 작가 외래키 추가(작가 코드를 외래키로 참조하기)
ALTER TABLE book_tbl ADD CONSTRAINT booktbl_fk_authorcode
FOREIGN KEY (author_code) REFERENCES author_tbl(author_code);

-- 외래키가 설정된 테이블(book_tbl) 삭제하기
DROP TABLE book_tbl;
-- 출판사 테이블, 작가 테이블을 삭제
DROP TABLE pub_tbl;
DROP TABLE author_tbl;

SELECT * FROM tab;
SELECT * FROM user_constraints;

-- 출판사정보 테이블생성

CREATE TABLE pub_tbl(
    pub_code number(10) PRIMARY KEY,
    pub_tel varchar2(15) NOT NULL,--02-1234-5678
    pub_email varchar2(100),
    pub_owner varchar2(50) NULL,
    publish varchar2(50) NOT NULL,
    writedate date default sysdate
);

desc pub_tbl;



CREATE TABLE author_tbl(
    author_code number(10) PRIMARY KEY,
    author varchar2(30) NOT NULL,
    auth_email varchar2(100),
    debue_year date,
    debue varchar2(100),
    writedate date default sysdate
);

desc author_tbl;

-- 출판사 코드 시퀀스
CREATE SEQUENCE pub_sq
START WITH 1
INCREMENT BY 1;

-- 작가 코드 시퀀스
CREATE SEQUENCE auth_sq
START WITH 10
INCREMENT BY 10;

-- 현재 시퀀스 객체 확인: table명 -> user_sequences
SELECT*FROM user_sequences;

-- 제약조건
SELECT * FROM TAB;

-- 현재 계정에 설정된 제약조건 확인하기
SELECT * FROM user_constraints;

SELECT * FROM user_constraints WHERE table_name='emp';

SELECT * FROM emp;
SELECT * FROM emp2;

DESC emp;

-- ename을 NOT NULL로 제약조건 변경하기
--ALTER TABLE emp CONSTRAINT emp_nn_ename NOT NULL;
--                           제약조건 변수명

ALTER TABLE emp MODIFY (ename varchar2(20) NOT NULL);
DESC emp;

SELECT * FROM emp;

-- unique: 유일한 값으로 설정
ALTER TABLE emp
ADD CONTSTRAINT emp_uk_deptno --테이블명 _제약조건_필드명 
UNIQUE(deptno);
-- emp테이블의 deptno는 이미 중복데이터가 존재하기 때문에 unique 제약조건을 설정할 수 없다.
-- 반드시 제약조건을 설정해야 할 경우 레코드를 지우고 설정해야한다.

SELECT * FROM dept;
-- dept 테이블의 deptno 필드를 unique 설정하기

--------------------------------------------------------------------------------
ALTER TABLE dept 
ADD constraint DEPT_UK_DEPTNO
UNIQUE(deptno);

SELECT * FROM user_constraints;


INSERT INTO dept(deptno, dname, loc) VALUES (40, '기획부','강남구'); -- unique 설정이 되었을 때 실행 안됨 
-- 40번 부서는 이미 존재하기 때문에 유일한 값으로 설정된 unique 제약 조건에 위배된다
INSERT INTO dept(deptno, dname, loc) VALUES (50, '기획부','강남구'); 

--unique 설정 해보기
--------------------------------------------------------------------------------

-- dept 테이블의 eptno에 설정된 제약조건 삭제하기
SELECT * FROM user_constraints;
ALTER TABLE dept
DROP CONSTRAINT dept_uk_deptno;

INSERT INTO dept(deptno, dname, loc) VALUES(40, '인사부', '송파구');
SELECT * FROM dept;

DELETE FROM dept WHERE dname='인사부';

-- DEPT 테이블의 deptno를 primary key 설정하기
ALTER TABLE dept
ADD CONSTRAINT dept_pk_deptno
PRIMARY KEY(deptno);

SELECT DISTINCT deptno
FROM dept
WHERE DEPTNO IN(10,20,30,40);

SELECT * FROM user_constraints;

-- book_tbl의 고유 번호, pub_tbl의 출판사 코드, auth_tbl의 작가 코드를
-- primary key 또는 unique로 설정하라.

-- 책 고유번호
ALTER TABLE book_tbl
ADD CONSTRAINT book_tbl_uk_deptno UNIQUE(isbn);

-- 출판사 코드
ALTER TABLE pub_tbl ADD CONSTRAINT pubtbl_pk_pubcode PRIMARY KEY(pub_code);

-- 작가 코드
ALTER TABLE author_tbl ADD CONTRAINT authortbl_uk_author_code UNIQUE(author_code);
SELECT * FROM author_tbl;

SELECT * FROM emp;
DESC emp;
-- sal(NUMBER (7,2)): 9999.99 / 800~6000까지 limit 만들기
-- emp 테이블에 comm은 800~6000 사이의 값만 생성되도록 제약 조건을 만들기.
ALTER TABLE emp
ADD CONSTRAINT emp_ck_comm
CHECK (comm >=800 AND comm <= 6000); --기존의 데이터가 CHECK 범위를 위배하여 제약조건을 설정할 수 없기 때문에 오류.

ALTER TABLE emp
ADD CONSTRAINT emp_ck_sal
CHECK (sal>=800 AND sal<=6000);

SELECT * FROM emp;
DESC emp;
SELECT * FROM user_constraints;

INSERT INTO emp(empno, ename, sal) VALUES (1111,'ABCD', 7000);
-- CHECK 제약 조건(800<=sal<=6000)에 위배되기 때문에 추가할 수 없음.
INSERT INTO emp(empno, ename, sal) VALUES (1111,'ABCD', 6000);

SELECT * FROM emp;

-- comm은 이하의 수만 등록 가능하도록 제약조건 만들기 
--          0, 300, 500, 1400, 1800, 2200

UPDATE emp SET comm = 0 WHERE comm IS NULL;
commit;

ALTER TABLE emp 
ADD CONSTRAINT emp_ck_comm
CHECK (comm in (0,300,500,1400,1800,2200));

SELECT * FROM user_constraints;

UPDATE emp SET comm=1000;
-- CHECK 조건에 위배되기 때문에 UPDATE 불가능.

-- 사원등록 시 입사일을 설정하지 않으면 자동으로 오늘 날짜가 설정되도록 하기
SELECT * FROM emp;
DELETE FROM emp WHERE empno=1111;
commit;

-- ALTER TABLE emp ADD CONSTRAINT emp_df_hiredate
-- DEFAULT (hiredate SYSDATE); -- 조건이 이미 설정되어 있어 오류

ALTER TABLE emp
MODIFY (hiredate date default sysdate);

INSERT INTO emp(empno, ename, sal, comm) VALUES (7777,'DDD',3200,2200);
SELECT * FROM emp;

INSERT INTO emp(empno, ename, sal, comm, hiredate) VALUES (888,'EEE',4200,1400,to_date('2022-08-09','YYYY-MM-DD'));
SELECT * FROM emp;

-- 외래키: foreign key
SELECT * FROM user_constraints;

SELECT * FROM dept;

-- emp 테이블의 deptno는 dept테이블의 deptno를 참조하는 외래키를 설정한다.
ALTER TABLE emp
ADD CONSTRAINT emp_fk_deptno
FOREIGN KEY (deptno) REFERENCES dept1(deptno);

-- 제약조건 삭제
ALTER TABLE emp
DROP CONSTRAINT emp_fk_deptno;


ALTER TABLE emp
ADD CONSTRAINT emp_fk_deptno
FOREIGN KEY (deptno) REFERENCES dept1(deptno) ON DELETE CASCADE;

-- NO ACTION
-- 참조되는 데이터를 삭제할 때참조하고 있는 정보가 있으면 삭제할 수 없다.

-- CASCADE 
-- 참조되는 데이터가 삭제되면 참조하고 있는 정보도 삭제된다.

DELETE FROM dept1 WHERE deptno=30;
ROLLBACK;
SELECT * FROM EMP;
SELECT * FROM DEPT;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- dept를 대신할 dept1 생성
CREATE TABLE dept1(
deptno NUMBER constraint deptno_pk_deptno primary key,
dname varchar2(50),
loc varchar2(50));

INSERT INTO dept1 VALUES(10, 'ACCOUNTING', 'NEWYORK');
INSERT INTO dept1 VALUES(20, 'RESEARCH', 'DALLAS');
INSERT INTO dept1 VALUES(30, 'SALES', 'CHICAGO');
INSERT INTO dept1 VALUES(40, 'OPERATIONS', 'BOSTON');

SELECT * FROM dept1;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

SELECT * FROM tab;
DESC book_tbl;
DESC author_tbl;
DESC pub_tbl;
SELECT * FROM user_constraints;
SELECT * FROM employee;
SELECT * FROM department;
SELECT * FROM position;
SELECT * FROM user_constraints WHERE table_name IN (UPPER('employee'),UPPER('department'),UPPER('position'));


