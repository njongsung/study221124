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

-- ���ǻ� �ܷ�Ű �߰�(���ǻ� �ڵ带 �ܷ�Ű�� �����ϱ�) 
ALTER TABLE book_tbl ADD CONSTRAINT booktbl_fk_pubcode
FOREIGN KEY (pub_code) REFERENCES pub_tbl(pub_code);

-- �۰� �ܷ�Ű �߰�(�۰� �ڵ带 �ܷ�Ű�� �����ϱ�)
ALTER TABLE book_tbl ADD CONSTRAINT booktbl_fk_authorcode
FOREIGN KEY (author_code) REFERENCES author_tbl(author_code);

-- �ܷ�Ű�� ������ ���̺�(book_tbl) �����ϱ�
DROP TABLE book_tbl;
-- ���ǻ� ���̺�, �۰� ���̺��� ����
DROP TABLE pub_tbl;
DROP TABLE author_tbl;

SELECT * FROM tab;
SELECT * FROM user_constraints;

-- ���ǻ����� ���̺����

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

-- ���ǻ� �ڵ� ������
CREATE SEQUENCE pub_sq
START WITH 1
INCREMENT BY 1;

-- �۰� �ڵ� ������
CREATE SEQUENCE auth_sq
START WITH 10
INCREMENT BY 10;

-- ���� ������ ��ü Ȯ��: table�� -> user_sequences
SELECT*FROM user_sequences;

-- ��������
SELECT * FROM TAB;

-- ���� ������ ������ �������� Ȯ���ϱ�
SELECT * FROM user_constraints;

SELECT * FROM user_constraints WHERE table_name='emp';

SELECT * FROM emp;
SELECT * FROM emp2;

DESC emp;

-- ename�� NOT NULL�� �������� �����ϱ�
--ALTER TABLE emp CONSTRAINT emp_nn_ename NOT NULL;
--                           �������� ������

ALTER TABLE emp MODIFY (ename varchar2(20) NOT NULL);
DESC emp;

SELECT * FROM emp;

-- unique: ������ ������ ����
ALTER TABLE emp
ADD CONTSTRAINT emp_uk_deptno --���̺�� _��������_�ʵ�� 
UNIQUE(deptno);
-- emp���̺��� deptno�� �̹� �ߺ������Ͱ� �����ϱ� ������ unique ���������� ������ �� ����.
-- �ݵ�� ���������� �����ؾ� �� ��� ���ڵ带 ����� �����ؾ��Ѵ�.

SELECT * FROM dept;
-- dept ���̺��� deptno �ʵ带 unique �����ϱ�

--------------------------------------------------------------------------------
ALTER TABLE dept 
ADD constraint DEPT_UK_DEPTNO
UNIQUE(deptno);

SELECT * FROM user_constraints;


INSERT INTO dept(deptno, dname, loc) VALUES (40, '��ȹ��','������'); -- unique ������ �Ǿ��� �� ���� �ȵ� 
-- 40�� �μ��� �̹� �����ϱ� ������ ������ ������ ������ unique ���� ���ǿ� ����ȴ�
INSERT INTO dept(deptno, dname, loc) VALUES (50, '��ȹ��','������'); 

--unique ���� �غ���
--------------------------------------------------------------------------------

-- dept ���̺��� eptno�� ������ �������� �����ϱ�
SELECT * FROM user_constraints;
ALTER TABLE dept
DROP CONSTRAINT dept_uk_deptno;

INSERT INTO dept(deptno, dname, loc) VALUES(40, '�λ��', '���ı�');
SELECT * FROM dept;

DELETE FROM dept WHERE dname='�λ��';

-- DEPT ���̺��� deptno�� primary key �����ϱ�
ALTER TABLE dept
ADD CONSTRAINT dept_pk_deptno
PRIMARY KEY(deptno);

SELECT DISTINCT deptno
FROM dept
WHERE DEPTNO IN(10,20,30,40);

SELECT * FROM user_constraints;

-- book_tbl�� ���� ��ȣ, pub_tbl�� ���ǻ� �ڵ�, auth_tbl�� �۰� �ڵ带
-- primary key �Ǵ� unique�� �����϶�.

-- å ������ȣ
ALTER TABLE book_tbl
ADD CONSTRAINT book_tbl_uk_deptno UNIQUE(isbn);

-- ���ǻ� �ڵ�
ALTER TABLE pub_tbl ADD CONSTRAINT pubtbl_pk_pubcode PRIMARY KEY(pub_code);

-- �۰� �ڵ�
ALTER TABLE author_tbl ADD CONTRAINT authortbl_uk_author_code UNIQUE(author_code);
SELECT * FROM author_tbl;

SELECT * FROM emp;
DESC emp;
-- sal(NUMBER (7,2)): 9999.99 / 800~6000���� limit �����
-- emp ���̺� comm�� 800~6000 ������ ���� �����ǵ��� ���� ������ �����.
ALTER TABLE emp
ADD CONSTRAINT emp_ck_comm
CHECK (comm >=800 AND comm <= 6000); --������ �����Ͱ� CHECK ������ �����Ͽ� ���������� ������ �� ���� ������ ����.

ALTER TABLE emp
ADD CONSTRAINT emp_ck_sal
CHECK (sal>=800 AND sal<=6000);

SELECT * FROM emp;
DESC emp;
SELECT * FROM user_constraints;

INSERT INTO emp(empno, ename, sal) VALUES (1111,'ABCD', 7000);
-- CHECK ���� ����(800<=sal<=6000)�� ����Ǳ� ������ �߰��� �� ����.
INSERT INTO emp(empno, ename, sal) VALUES (1111,'ABCD', 6000);

SELECT * FROM emp;

-- comm�� ������ ���� ��� �����ϵ��� �������� ����� 
--          0, 300, 500, 1400, 1800, 2200

UPDATE emp SET comm = 0 WHERE comm IS NULL;
commit;

ALTER TABLE emp 
ADD CONSTRAINT emp_ck_comm
CHECK (comm in (0,300,500,1400,1800,2200));

SELECT * FROM user_constraints;

UPDATE emp SET comm=1000;
-- CHECK ���ǿ� ����Ǳ� ������ UPDATE �Ұ���.

-- ������ �� �Ի����� �������� ������ �ڵ����� ���� ��¥�� �����ǵ��� �ϱ�
SELECT * FROM emp;
DELETE FROM emp WHERE empno=1111;
commit;

-- ALTER TABLE emp ADD CONSTRAINT emp_df_hiredate
-- DEFAULT (hiredate SYSDATE); -- ������ �̹� �����Ǿ� �־� ����

ALTER TABLE emp
MODIFY (hiredate date default sysdate);

INSERT INTO emp(empno, ename, sal, comm) VALUES (7777,'DDD',3200,2200);
SELECT * FROM emp;

INSERT INTO emp(empno, ename, sal, comm, hiredate) VALUES (888,'EEE',4200,1400,to_date('2022-08-09','YYYY-MM-DD'));
SELECT * FROM emp;

-- �ܷ�Ű: foreign key
SELECT * FROM user_constraints;

SELECT * FROM dept;

-- emp ���̺��� deptno�� dept���̺��� deptno�� �����ϴ� �ܷ�Ű�� �����Ѵ�.
ALTER TABLE emp
ADD CONSTRAINT emp_fk_deptno
FOREIGN KEY (deptno) REFERENCES dept1(deptno);

-- �������� ����
ALTER TABLE emp
DROP CONSTRAINT emp_fk_deptno;


ALTER TABLE emp
ADD CONSTRAINT emp_fk_deptno
FOREIGN KEY (deptno) REFERENCES dept1(deptno) ON DELETE CASCADE;

-- NO ACTION
-- �����Ǵ� �����͸� ������ �������ϰ� �ִ� ������ ������ ������ �� ����.

-- CASCADE 
-- �����Ǵ� �����Ͱ� �����Ǹ� �����ϰ� �ִ� ������ �����ȴ�.

DELETE FROM dept1 WHERE deptno=30;
ROLLBACK;
SELECT * FROM EMP;
SELECT * FROM DEPT;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- dept�� ����� dept1 ����
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


