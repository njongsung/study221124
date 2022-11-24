-- DML : SELECT(����), INSERT(����), UPDATE(����), DELETE(����)
-- ����߰�

-- ��� �ʵ��� ���� ������ �� - ���ڵ带 �������� �� ǥ�õǴ� �ʵ� ������ ��ġ�ؾ��Ѵ�.
INSERT INTO emp VALUES(2222, 'ȫų��', '��ȹ', '7499', sysdate, 1000, 500, 40);

-- �Ϻ��� �����͸� ������ �� ���ڵ� �߰�
-- �����ȣ (3333)  NOT NULL�̱� ������ �ݵ�� �����ؾ���
-- ����� (�̼���), �޿�(20000)
INSERT INTO emp (ename, sal, empno)
VALUES('�̼���', 20000, '1545');

-- [����] dept ���̺� �μ��ڵ�(deptno) : 50
--                   �μ���(dname): ��ȹ��
--                   ��ġ(loc) : ���� ������
--                                          �߰��ϱ�

INSERT INTO dept(deptno,dname,loc) VALUES (50, '��ȹ��', '������');
INSERT INTO dept VALUES (50, '��ȹ��', '������');

--------------------------------------------------------------------------------
-- ���̺� ����
-- ���� ���̺��� ������ ���� ����
-- ���� ���̺��� ��� ���ڵ� �ǳ� �Ϻ� ���ڵ� ���� ����
--------------------------------------------------------------------------------

-- emp���̺��� ��� �ʵ�� ��� ���ڵ� �����ϱ�
CREATE TABLE emp2
as
SELECT*FROM EMP;

-- emp ���̺��� �Ϻ� �ʵ�(�����ȣ, �����, ����, �޿�)�� ���ڵ带 �����ϱ�
CREATE TABLE emp3
AS
SELECT empno, ename, job, sal FROM emp;

-- emp ���̺��� �Ϻ� ���ڵ�(job=MANAGER OR ANALYST)�� �����ϱ�
CREATE TABLE emp4
AS
SELECT * FROM emp WHERE job IN ('MANAGER', 'ANALYST');

-- emp ���̺��� ���̺� ������ �����ϱ�
CREATE TABLE emp5
AS
SELECT empno, ename, job,sal FROM emp WHERE 1=2;


--emp ��� �ʵ� * ���ڵ� (select)
--emp5 ���ڵ�� ���� field�� empno, ename, job, sal�� �����Ѵ�. (insert)
INSERT INTO emp5(empno, ename, job, sal)
SELECT empno, ename, job, sal FROM emp;  -- ���� �������


--** [Syntax] ***************************************
--* UPDATE table_name
--* SET column1 = ��{(��ĥ����), column2 = ��, ....} [* WHERE ����]
--***************************************************
--WHERE ���� ����


-- UPDATE -> ���̺� ���� �����͸� 1�� �̻� ������ �� ����Ѵ�.
-- �̼����� ������ �λ�η� �����϶�.
UPDATE emp 
SET job='�λ��' WHERE empno=1545;

-- MANAGER ������ ����� �޿��� 10% �λ��Ͽ���.
UPDATE emp
SET sal=sal*1.1 WHERE job='MANAGER';


-- [����] ���ʽ��� ���� �ʴ� ����� ���ʽ��� �޿��� 10%�� ����
UPDATE emp
SET comm=sal*0.1 WHERE nvl(comm,0) = 0;




--** [Syntax] ********************************
--* DELETE FROM table_name [WHERE ����] ; 
--********************************************
-- where ���� ����

--DELETE -> ���ڵ带 ��ü �Ǵ� �Ϻθ� �����Ѵ�.
-- comm�� 200 �̸��� ���ڵ带 �����϶�.

DELETE FROM emp WHERE comm<200;

commit;
--commit �������� �ӽ÷� ������ �Ǿ��ִ� ��

SELECT empno, ename, sal, comm FROM emp;


SELECT*FROM dept;
SELECT*FROM emp;
SELECT*FROM emp2;
SELECT*FROM emp3;
SELECT*FROM emp4;
SELECT*FROM emp5;
desc emp5;
SELECT*FROM tab;    -- ���̺� �� Ȯ��

DESC EMP;