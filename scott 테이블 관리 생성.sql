-- ���̺����

-- �ʵ�� ������Ÿ�� null(or not null)          null�� ���� ���� not null�� �Ұ���
--                null : �����Ͱ� ��� ��������
--                not null : �ݵ�� �����Ͱ� �־���Ѵ�.


-- emp ���̺� ���� 15�ڸ����� ������ �� �ִ� tel �ʵ带 ������.
ALTER TABLE emp ADD (tel VARCHAR2(15));

-- �ʵ� �����ϱ�
ALTER TABLE emp MODIFY (ename VARCHAR(20));
INSERT INTO emp(empno, ename) VALUES(1234, '�������');

-- ���� �����Ͱ� ���� ������ �ڸ��� ���� Ŭ ���� ������ �ȵȴ�.
-- ��, �����Ϳ� ������ ���� �ʴ� �ѵ� ������ ������ �����ϴ�.
ALTER TABLE emp MODIFY (job VARCHAR2(5));

ALTER TABLE emp MODIFY (job VARCHAR2(15));

-- �ʵ� �����ϱ� 
-- �� �����͵� ���� ��

ALTER TABLE emp DROP COLUMN mgr;

-- commit�� insert, delete, update ����� ��밡��
-- primary key: ���� ���� ������ �ȵȴ�.


-- ���̺� ����
-- ȸ������ ���̺� ���� : member
CREATE TABLE MEMBER(
    NO          number(5)                   primary key,
    USERNAME    varchar2(20)    not null,
    PHONE       varchar2(15)    not null,
    EMAIL       varchar2(50)    null    ,-- null�� ��������
    ADDR        varchar2(300)           ,-- null ������
    WRITEDATE   date default sysdate -- writedate�� ���� �������� ������ �ڵ����� ���� ��¥ �ð������� �����ȴ�.
);

-- ������(SEQUENCE)  ->    ��Ģ���� �����͸� �ڵ����� �������ִ� ��ü�̴�.
--                        �� �� ������ ������ �ٽ� �������� �ʴ´�. (UNIQUE)

CREATE SEQUENCE mem_sq
START WITH 1
INCREMENT BY 1;


-- 5���� 3�� �����ϴ� SEQUENCE �����
CREATE SEQUENCE f_t
START WITH 5
INCREMENT BY 3;


-- ������ ��� Ȯ���ϱ�
SELECT * FROM user_sequences;


-- ������ ��ü���� ��ȣ�� ������
-- 5, 8, 11, 14, 17, 20, ETC...
-- NEXTVAL : ���ο� ��
-- CURRVAL : ����� �� �߿� ���� �������� ����� ��
SELECT F_T.NEXTVAL FROM DUAL;
SELECT F_T.CURRVAL FROM DUAL;
SELECT F_T.NEXTVAL, F_T.CURRVAL FROM DUAL;
SELECT F_T.CURRVAL, F_T.NEXTVAL FROM DUAL;
-- ���� ����Ѵٸ� ������ ��� ����� ����


-- member ���̺� ���ڵ� �߰��ϱ�
INSERT INTO member(no, username, phone) VALUES(mem_sq.nextval,'KIM', '010-1234-5678');
INSERT INTO member(no, username, phone) VALUES(mem_sq.nextval,'PARK', '010-9012-3456');

ALTER TABLE member DROP column addr;

-- sequence ����
DROP SEQUENCE F_T;
-- sequence Ȯ��
SELECT * FROM user_sequences;

-- ���̺� �����
DROP TABLE member;
DROP TABLE emp5;
DROP TABLE emp4;
DROP TABLE emp3;
DROP TABLE emp2;
DROP TABLE emp;


-- ������ ������ ���� �ʵ��� �����
DROP TABLE DEPT PURGE;

-- �̹� �����ϴ� ������ �����
PURGE recyclebin;








SELECT*FROM tab;
DESC member;
SELECT * FROM member;








SELECT*FROM tab;
SELECT*FROM emp;
SELECT empno, ename, tel, job FROM emp;
DESC emp;

@ d:\downloads\demo.sql;


--�츮�� å ���� DB ����






