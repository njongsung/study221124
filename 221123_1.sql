-- view ���̺� : �������̺�
SELECT empno, ename, sal FROM emp;

-- view ����
-- create or replace : �䰡 �������� ������ ���� �����ϰ� �����ϸ� ���� �����.

CREATE OR REPLACE VIEW emp_view     --emp_view --> ���� ���̺� �̸�
    AS SELECT empno, ename, job, sal 
        FROM emp;
        
        
SELECT * FROM tab;
SELECT * FROM emp_view;

-- view�� �̿��� ���ڵ� �߰� 

INSERT INTO emp_view(empno, ename, job, sal)
VALUES (5555,'AAAA', '����', 3500);

SELECT * FROM emp;

--> �������̺��� �̿��Ͽ� ���ο� ����� ����� �� �ִ�.

UPDATE emp_view SET job='ȸ��' WHERE empno=7369;

SELECT * FROM emp;

--> �������̺��� �̿��Ͽ� ������ �� �� �ִ�.

DELETE FROM emp_view WHERE job='MANAGER';

SELECT * FROM emp;

--> �������̺��� �̿��Ͽ� ������ �� �� �ִ�.

ROLLBACK;

--> ���󺹱�

-- VIEW���� ���ø� �����ϵ��� �� �����ϱ�
-- emp ���̺��� ���, �����, ������, �Ի���, �޿��� �̿��Ͽ� �б� ���� VIEW�� ����

CREATE VIEW emp_view_reader
    AS SELECT empno, ename, job, hiredate, sal
        FROM emp
            WITH READ ONLY;

SELECT * FROM emp_view_reader;

-- emp_view_reader view�� �б����� view�̹Ƿ� select���� �����ϳ� insert, update, delete���� ����Ͽ� ���ڵ带 ������ �� ����.
INSERT INTO emp_view_reader(empno,ename, job, hiredate, sal)
VALUES (3333,'BBBB','��ȹ', sysdate,4000);

-- ������ �޿��� �հ踦 view�� �̿��Ͽ� ���϶�.

SELECT job, SUM(sal) FROM emp_view GROUP BY job;
SELECT job, SUM(sal) FROM emp GROUP BY job;

-- ���, �����, ������, �μ��ڵ�, �μ����� �̿��Ͽ� view �����ϱ�
-- subquery�� �����Ͽ� view�� ������ �� �ִ�.

CREATE VIEW emp_dept
    AS SELECT e.empno, e.ename, e.job, e.deptno, d.dname
        FROM emp e
            JOIN dept1 d
                ON e.deptno=d.deptno;
                

                
SELECT * FROM tab;
SELECT * FROM emp_dept;

-- with check option: ���ǿ� �ش��ϴ� ���ڵ常 �߰�/����

CREATE VIEW emp_check
    AS SELECT empno, ename, sal, deptno
        FROM emp
            WHERE deptno=20
                WITH CHECK OPTION;
                
SELECT * FROM emp_check;

INSERT INTO emp_check (empno, ename, sal, deptno)
    VALUES(2222,'CCCC',4200,20);

-- deptno=20 WITH CHECK OPTION�� ���� ������ �߰��� �� ����.
INSERT INTO emp_check (empno, ename, sal, deptno)
    VALUES(6666,'DDDD',3800,10);

-- VIEW Ȯ��
SELECT * FROM user_views;

-- VIEW ����
DROP VIEW emp_check;
DROP VIEW emp_view;
DROP VIEW emp_view_reader;
DROP VIEW emp_dept;

SELECT * FROM emp_view;
SELECT * FROM emp;

DELETE FROM emp WHERE empno=2222;

SELECT * FROM TAB;

COMMIT;

CONN system/master1234;






