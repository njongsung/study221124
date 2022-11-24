--  JOIN
SELECT * FROM emp;
SELECT * FROM dept1;

DELETE FROM emp WHERE empno IN (7777,888);
COMMIT;

-- emp���̺��� �����, �޿�, dept ���̺��� �μ����� �����϶�.
-- equiejoin, ��������(Innerjoin): �ʵ��� ���� ���� �����͸� �������ش�.
--                                ���� ����� ������ ���ڵ带 �����Ѵ�.
SELECT ename, sal, dname FROM emp, dept1 WHERE emp.deptno=dept1.deptno;
SELECT emp.ename, emp.sal, dept1.dname FROM emp, dept1 WHERE emp.deptno=dept1.deptno;
SELECT e.ename, e.sal, d.dname FROM emp e, dept1 d WHERE e.deptno=d.deptno; -- �������� join

-- JOIN���� �̿��Ͽ� �����ϱ�: JOIN ������ ON���� ǥ���Ѵ�.
SELECT ename, sal, dname FROM emp JOIN dept1 ON emp.deptno = dept1.deptno;

-- JOIN���� ������ �̿��Ͽ� �����ϱ�
-- ���, �����, �μ��ڵ�(emp), �μ��ڵ�(dept1), �μ���, ��ġ�� �����϶�

SELECT empno, ename, e.deptno, d.deptno, dname, loc 
FROM emp e JOIN dept1 d ON e.deptno=d.deptno ORDER BY d.deptno;

-- ���, �����, �μ��ڵ�(emp), �μ��ڵ�(dept1), �μ���, ��ġ�� �����϶�. ��, 20�� �μ��� ����� �����϶�.

SELECT empno, ename, e.deptno, d.deptno, dname, loc
FROM emp e JOIN dept1 d ON e.deptno=d.deptno WHERE e.deptno!=20;

-- �����, ������, �޿�, �μ��ڵ�(emp), �μ��ڵ�(dept1), �μ����� �����϶�. 
-- ��, 20�� �μ��� ����� �����ϰ� �̸� ������ �����϶�.
SELECT ename, job,  sal, e.deptno, dname
FROM emp e JOIN dept1 d ON e.deptno=d.deptno WHERE e.deptno!=20 ORDER BY ename;

-- AND ������ ����ϱ�
SELECT ename, job, sal, emp.deptno, dname
FROM emp JOIN dept1 ON emp.deptno=dept1.deptno AND emp.deptno!=20
ORDER BY ename;

-- ��� �������� ����� ������
-- ������ ��� Ȯ���ϱ� user_sequences

SELECT * FROM user_sequences;
CREATE SEQUENCE emp_sq
START WITH 1000
INCREMENT BY 1000;

CREATE SEQUENCE dept1_sq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE posi_sq
START WITH 1
INCREMENT BY 1;

-- �μ����� �߰�
INSERT INTO department(dept_code,dept_name,dept_local) 
VALUES(dept1_sq.NEXTVAL,'�λ��','2�� 203ȣ');

INSERT INTO department(dept_code,dept_name)
VALUES (dept1_sq.NEXTVAL, '��ȹ��');
SELECT * FROM department;

-- �������� �߰�
INSERT INTO position(posi_code, posi_name)
VALUES(posi_sq.NEXTVAL,'��ǥ');

INSERT INTO position(posi_code, posi_name,posi_desc)
VALUES(posi_sq.NEXTVAL,'���','��� 1�� ���� ����');

SELECT * FROM position;

-- ��� ���

INSERT INTO employee(empno, username, password, dept_code, posi_code)
VALUES (emp_sq.NEXTVAL, 'ȫų��','1234', 1, 1);--��ǥ

INSERT INTO employee(empno, username, password, tel, gender, hiredate, dept_code, posi_code)
VALUES (emp_sq.NEXTVAL, '�̼���','1234','010-1234-5678','M',sysdate,2,2);



SELECT * FROM employee;

COMMIT;

-- ���̺� 3�� �����ϱ�
-- employee        position      department
-- �����ȣ, �����, ����, ���޼���, �μ���, �μ���ġ�� �����϶�.

SELECT 
    e.empno AS �����ȣ, e.username AS �����, 
    p.posi_name AS ����, p.posi_desc AS ���޼���, 
    d.dept_name AS �μ���, d.dept_local AS �μ���ġ
FROM employee e 
    JOIN department d ON e.dept_code=d.dept_code
    JOIN position p ON e.posi_code=p.posi_code; -- JOIN ���� ',' �Ⱦ�

-- employee ���̺��� �����, ����ó, �Ի���
-- department ���̺��� �μ��ڵ�, �μ���, �μ���ġ
-- position ���̺��� �����ڵ�, ���޸�
-- �����, ����ó, �μ���, �μ���ġ, ���޸�, �Ի���, �μ��ڵ�, �����ڵ� ������ �����ϰ� ��������� �������� �����϶�.

SELECT e.username AS �̸�, e.tel AS ����ó, d.dept_name AS �μ���, d.dept_local AS �μ���ġ, 
p.posi_name AS ����, e.hiredate AS �Ի���, e.dept_code AS �μ��ڵ�, e.posi_code AS �����ڵ� 
FROM employee e
    JOIN department d ON e.dept_code=d.dept_code
    JOIN position p ON e.posi_code=p.posi_code
ORDER BY username;


--SALESMAN�� ���, �̸�, �޿�, �μ���, �ٹ����� ����϶�
SELECT e.empno, e.ename, e.sal, d.dname, d.loc
FROM emp e
    JOIN dept1 d 
        ON e.deptno=d.deptno AND e.JOB='SALESMAN';

SELECT e.empno, e.ename, e.sal, d.dname, d.loc
FROM emp e
    JOIN dept1 d 
        ON e.deptno=d.deptno 
            WHERE e.JOB='SALESMAN';

-- ���������� �̿��� ����
SELECT e.empno, e.ename, e.sal, d.dname, d.loc
    FROM (SELECT empno, ename, sal, deptno FROM emp WHERE job='SALESMAN') e
        JOIN dept1 d
            ON e.deptno=d.deptno;
            
SELECT * FROM dept1;

SELECT * FROM tab;

SELECT * FROM salgrade;

-- �����, �޿�, ȣ���� �����϶�.

SELECT ename, sal, s.grade
    FROM emp e
        JOIN salgrade s
            ON e.sal BETWEEN s.losal AND s.hisal;
            
-- 10���� 20�� �μ��� ��� �� �����, ������, �޿�, �μ���, �μ���ġ, ȣ���� �����϶�
-- emp�� deptno, emp�� sal, losal,hisal


SELECT count(empno) FROM emp WHERE deptno=30;


SELECT e.ename AS �����, e.job AS ������, e.sal AS �޿�, d.dname AS �μ���, d.loc AS �μ���ġ, s.grade AS ȣ��
    FROM emp e
        JOIN dept1 d
            ON e.deptno=d.deptno
--               WHERE e.deptno IN (10,20)
        JOIN salgrade s
            ON e.sal
                BETWEEN s.losal AND s.hisal;

SELECT e.ename AS �����, e.job AS ������, e.sal AS �޿�, d.dname AS �μ���, d.loc AS �μ���ġ, s.grade AS ȣ��
    FROM (SELECT ename, job, sal, deptno FROM emp WHERE deptno IN (10,20)) e
        JOIN dept1 d 
            ON e.deptno=d.deptno
        JOIN salgrade s
            ON sal BETWEEN s.losal AND s.hisal;

--------------------------------------------------------------------------------

-- [����]
-- �۰��������̺� �۰� �ּ� 3����
-- ���ǻ��������̺� ���ǻ� �ּ� 3�� ���
-- å�������̺� å�� �ּ� 6�� ���

-- 1. ���̺� 2���� ���ι��� ����� Ǯ��
-- 2. ���̺� 3���� ���ι��� ����� Ǯ��

--------------------------------------------------------------------------------


-- self ����

SELECT e1.empno AS ���, e1.ename AS �����, e1.job AS ������, e1.mgr AS �����ڻ��, 
e2.empno AS �����ڻ��, e2.ename AS �����ڸ�, e2.job AS �����ڴ�����
    FROM emp e1 
        JOIN emp e2
            ON e1.mgr = e2.empno;

-- [����]
--              e1.ename     e2.ename
-- emp���̺��� ' '�� �����ڴ� ' '�̴ٴ� ������ ����϶�.
SELECT e1.empno AS ���, e1.ename AS �����, e1.mgr AS �����ڻ��, e2.ename AS �����ڸ�
    FROM emp e1
        JOIN emp e2
            ON e1.mgr=e2.empno;

SELECT e1.ename || '�� �����ڴ� ' || e2.ename ||'�̴�' ���� 
    FROM emp e1 
            JOIN emp e2
                ON e1.mgr=e2.empno;

-- [����] �����, �޿�, �μ���, �����ڸ�, �Ի���, ȣ���� �����϶�.

SELECT e1.ename AS �����, e1.sal AS �޿�, d.dname AS �μ���, e2.ename AS �����ڸ�, e1.hiredate AS �Ի���, s.grade AS ȣ��
    FROM (SELECT ename, sal, hiredate, deptno, mgr FROM emp) e1
        JOIN dept1 d
            ON e1.deptno=d.deptno
        JOIN emp e2
            ON e1.mgr=e2.empno
        JOIN salgrade s
            ON e1.sal BETWEEN s.losal AND s.hisal;

SELECT e.ename AS �����, e.sal AS �޿�, d.dname AS �μ���, e2.ename AS �����ڸ�, e.hiredate AS �Ի���, s.grade AS ȣ��
    FROM emp e 
        JOIN dept1 d 
            ON e.deptno=d.deptno
        JOIN emp e2
            ON e.mgr=e2.empno
        JOIN salgrade s
            ON e.sal BETWEEN s.losal AND s.hisal;

SELECT * FROM emp;
SELECT * FROM dept1;


-- outer join : �� ���̺��� ���ε� ��� �� �� ���̺� ���ڵ尡 ���� ��
-- left outer join : �� ���̺� �� �����ʿ� null �����Ͱ� �߻��� ��
-- right outer join : �� ���̺� �� ���ʿ� null �����Ͱ� �߻��� ��
SELECT ename, e.deptno AS ����μ��ڵ�, d.deptno AS �μ��ڵ�, dname AS �μ���
    FROM emp e 
        JOIN dept1 d 
            ON e.deptno=d.deptno;       -- ���� ����

SELECT ename, e.deptno AS ����μ��ڵ�, d.deptno AS �μ��ڵ�, dname AS �μ���
    FROM emp e 
        RIGHT OUTER JOIN dept1 d 
            ON e.deptno=d.deptno;       -- RIGHT OUTER JOIN
                                        -- ROJ ���� ����(FROM)�� NULL ������
                                        -- ROJ ���� �����ʿ� ���� ������

SELECT ename, e.deptno AS ����μ��ڵ�, d.deptno AS �μ��ڵ�, dname AS �μ���
    FROM dept1 d 
        RIGHT OUTER JOIN emp e
            ON e.deptno=d.deptno;

SELECT e.ename AS �����, e.sal AS �޿�, e.deptno AS �μ��ڵ�, dname AS �μ���
    FROM emp e, dept1 d
        WHERE e.deptno=d.deptno;    -- ���� ����
        
SELECT e.ename AS �����, e.sal AS �޿�, e.deptno AS �μ��ڵ�, dname AS �μ���
    FROM emp e, dept1 d
        WHERE e.deptno(+)=d.deptno; -- '(+)'�� NULL �����Ͱ� �߻��ϴ� ���̺� �־��ش�.
        
-- full outer join : null �����Ͱ� �ִ� ���ڵ� left, right�� ������� ������ �������ش�.
SELECT DISTINCT (e.deptno), d.deptno
    FROM emp e 
        JOIN dept1 d
            ON e.deptno=d.deptno
                ORDER BY e.deptno;

SELECT DISTINCT (e.deptno), d.deptno
    FROM emp e 
        FULL OUTER JOIN dept1 d
            ON e.deptno=d.deptno
                ORDER BY e.deptno;

SELECT DISTINCT (e.deptno), d.deptno
    FROM dept1 d
        FULL OUTER JOIN emp e
            ON e.deptno=d.deptno
                ORDER BY e.deptno;

--------------------------------------------------------------------------------
-- [����1] emp���̺��� ��� ����� ���� �̸�, �μ���ȣ, �μ����� ����ϴ� ������ �ۼ��ϼ���.
--                                          (�μ���ȣ������ �������� �����϶�.)

SELECT e.ename, e.deptno, d.dname
    FROM emp e
        JOIN dept1 d
            ON e.deptno=d.deptno
                ORDER BY deptno;
                

-- [����2] emp���̺��� NEW YORK���� �ٹ��ϰ� �ִ� ����� ���Ͽ� �̸�, ����, �޿�, �μ����� ����ϴ� SELECT���� �ۼ��ϼ���.

SELECT e.ename, e.job, e.sal, d.dname
    FROM emp e
        JOIN (SELECT dname, loc, deptno FROM dept1 WHERE loc='NEWYORK') d 
            ON e.deptno=d.deptno;


-- [����3] EMP���̺��� ���ʽ��� �޴� ����� ���Ͽ� �̸�, �μ���, ��ġ�� ����ϴ� SELECT���� �ۼ��ϼ���.

SELECT e.ename, d.dname, d.loc, e.comm
    FROM (SELECT deptno, sal, ename, comm FROM emp WHERE nvl(comm,0) > 0) e
        JOIN dept1 d
            ON e.deptno=d.deptno;


-- [����4] EMP���̺��� �̸� �� L�ڰ� �ִ� ����� ���� �̸�, ����, �μ���, ��ġ�� ����ϴ� ������ �ۼ��ϼ���.

SELECT e.ename, e.job, d.dname, d.loc
    FROM (SELECT ename, job, deptno FROM emp WHERE ename LIKE '%L%') e
        JOIN dept1 d
            ON e.deptno=d.deptno;
            

-- [����5] �Ʒ��� ����� ����ϴ� ������ �ۼ��ϼ���
-- (�����ڰ� ���� King�� �����Ͽ� ��� ����� ���)
------------------------------------------------------------------------- 
-- Emplyee  Emp#    Manager Mgr#
-------------------------------------------------------------------------
-- KING     7839
-- BLAKE    7698    KING    7839
-- CKARK    7782    KING    7839
-- ..... 
--------------------------------------------- 14ROWS SELECTED.

SELECT e1.ename AS Employee, e1.empno AS Emp#, e2.ename AS Manager, e2.empno AS Mgr#
    FROM emp e1
        LEFT OUTER JOIN emp e2
            ON e1.mgr=e2.empno;
            



                

select * from dept1;

