SELECT * FROM tab;
SELECT * FROM emp;
-- ���������� ()���� ����Ѵ�.
-- subquery�� ���� ����ǰ� ���� ������ ����ȴ�.
-- ������ ��������

-- SCOTT�� ���� �μ��� ����� ?
SELECT deptno FROM emp WHERE ename='SCOTT';
SELECT * FROM emp WHERE deptno=20;
SELECT empno, ename, sal, deptno FROM emp WHERE deptno=(SELECT deptno FROM emp WHERE ename='SCOTT');

-- ��� �޿� �̻��� �޴� ����� ?
SELECT ROUND(AVG(sal),0) FROM emp;
SELECT * FROM emp WHERE sal>=2073;
SELECT empno, ename, job, sal FROM emp WHERE sal>=(SELECT ROUND(AVG(sal),0)FROM emp) ORDER BY sal;

--7369 ����� ���� ������ �ϴ� ����� ?
SELECT ename, job FROM emp WHERE job = (SELECT job FROM emp WHERE empno = 7369);

-- SCOOT�� �޿����� �޿��� ���� ����� ���, �̸� ,����, �޿��� ����϶�
SELECT sal FROM emp WHERE ename='SCOTT';
SELECT empno, ename, job, sal FROM emp WHERE sal > 3000;

SELECT empno, ename, job, sal FROM emp
WHERE sal>(SELECT sal FROM emp WHERE ename='SCOTT');


-- ������̺��� �����, �Ի���, ������, �μ��ڵ带 �����ϵ� 'ADAMS'�� ���� ������ �ϴ� ����̰ų�
-- 'SCOTT'�� ���� �μ��� ����� �����϶�.
SELECT job FROM emp WHERE ename='ADAMS';
SELECT deptno FROM emp WHERE ename='SCOTT';

SELECT ename, hiredate, job, deptno FROM emp 
WHERE job=(SELECT job FROM emp WHERE ename='ADAMS') 
OR deptno=(SELECT deptno FROM emp WHERE ename='SCOTT');


-- ������̺��� �����ȣ�� 7521�� ����� ������ ���� �޿��� 7934�� ������� ����
-- ����� ���, �̸�, ����, �Ի���, �޿��� ����϶�
SELECT job FROM emp WHERE empno='7521';
SELECT sal FROM emp WHERE empno='7934';

SELECT empno, ename, job, hiredate, sal FROM emp 
WHERE job=(SELECT job FROM emp WHERE empno='7521') 
AND sal>(SELECT sal FROM emp WHERE empno='7934');


-- subquery���� �׷��Լ� ����ϱ�
-- [����] �������� "SALESMAN"�� ����� ��ձ޿����� ���� �޴� ����� ���Ͽ���
SELECT avg(sal) FROM emp WHERE job='SALESMAN';

SELECT ename, hiredate, sal FROM emp WHERE sal<(SELECT avg(sal) FROM emp WHERE job='SALESMAN') ORDER BY sal;


-- having���� subquery ����ϱ�
-- having = group by�� ����� �������� ����� �� ���� Ű����

-- ������̺��� ����� �޿��� 20�� �μ��� �ּұ޿����� ���� �޴� �μ��� ����ϼ���.
SELECT deptno, min(sal) FROM emp GROUP BY deptno;

-- �� �μ��� �����޿��� 20�� �μ��� �����޿����� ���� �μ��� �����޿��� �����϶�
SELECT deptno, min(sal) FROM emp GROUP BY deptno
HAVING min(sal)>(SELECT min(sal) FROM emp WHERE deptno=20);


-- [����] ������̺��� ����� �޿��� 10�� �μ��� ��ձ޿����� ���� �޴� ������ �� ������ ��ձ޿��� �����϶�.
SELECT job, AVG(sal) FROM emp GROUP BY job
HAVING AVG(sal)>(SELECT AVG(sal) FROM emp WHERE deptno=10);


-- ���� �� ��������

SELECT empno, ename, sal FROM emp
WHERE sal>(SELECT sal FROM emp WHERE deptno=10);

-- �޿��� 3000, 1250, 1300�� ����� �����϶�
SELECT * FROM emp WHERE sal=3000 or sal=1250 or sal=1300;
SELECT * FROM emp WHERE sal IN (3000,1250,1300);


SELECT job, MAX(sal) FROM emp GROUP BY job;

-- �μ� �� �ְ� �޿��� �޴� ����� �����϶�.
-- IN ������ : ������������� �������� �� or ó���� �Ѵ�.
SELECT empno, ename, job, sal, deptno FROM emp
WHERE sal IN (SELECT MAX(sal) FROM emp GROUP BY deptno)
ORDER BY deptno;

--[����] �������� �ִ� �޿��� �޴� ����� �����ȣ�� �̸�, ����, �޿��� ����ϼ���.
SELECT empno, ename, job, sal FROM emp
WHERE sal IN (SELECT MAX(sal) FROM emp GROUP BY job)
ORDER BY deptno;

SELECT empno, ename, job, sal FROM emp
WHERE sal IN (SELECT MAX(sal) FROM emp GROUP BY job);



-- ANY ������ : �ϳ��� ���Ǹ� �����ص� �����Ѵ�.
SELECT sal FROM emp WHERE job='SALESMAN'; -- 1600,1250,1250, 1500

-- ������ 'SALESMAN'�� ����� �ּұ޿����� �����鼭 �μ���ȣ�� 20�� �ƴ� ����� �̸�, �޿�, �μ��ڵ带 ����϶�.
SELECT ename, sal, job, deptno FROM emp WHERE deptno !=20 AND 
sal >(SELECT MIN(sal) FROM emp WHERE job='SALESMAN');

SELECT ename, sal, job, deptno FROM emp WHERE deptno !=20 AND 
sal > ANY(SELECT sal FROM emp WHERE job='SALESMAN');



--[����] ������̺��� ��� �� KING�� ���� �μ��� ������� �ʰ� �Ի��� ����� �����, ����, �޿�, �Ի����� �����϶�.
SELECT ename, job, sal, hiredate, deptno FROM emp
WHERE hiredate> ANY(SELECT hiredate FROM emp 
WHERE deptno=(SELECT deptno FROM emp WHERE ename='KING'));


-- ALL ������ : ���������� ������� ��� �����Ͽ��� ����� �����Ѵ�.
SELECT sal FROM emp WHERE job='SALESMAN';
-- 1600, 1250, 1250, 1500

-- �������� SALESMAN�� ����� �ִ�޿����� ���� ����� 20 �μ��� ����� �����ϰ� 
--  ���, �����, ������, �޿��� �����϶�.

SELECT empno, ename, job, sal FROM emp WHERE deptno != 20 
AND
sal > ALL(SELECT sal FROM emp WHERE job='SALESMAN');

-- EXISTS ������ : ���������� ������� ���� ���� �����ϸ� �����Ѵ�.

SELECT empno, ename, sal, mgr FROM emp e 
WHERE EXISTS(SELECT empno FROM emp WHERE e.empno = mgr);

SELECT empno, ename, sal, mgr FROM emp e 
WHERE EXISTS(SELECT e.empno FROM emp WHERE mgr = e.empno);


-- ���� �� �������� : ������������ ������ ���ڵ尡 �÷��� 2�� �̻��� ��
-- �ֺ�
SELECT sal, deptno FROM emp WHERE deptno=30 AND comm IS NOT NULL;
-- (1600, 30), (1250, 30), (1250, 30), (1500, 30)

SELECT empno, ename, sal, deptno FROM emp 
WHERE (sal, deptno) IN
(SELECT sal, deptno FROM emp WHERE deptno=30 AND comm IS NOT NULL);



-- ������ �ּ� �޿��� �޴� ����� ���, �̸�, ����, �μ���ȣ�� ����϶�.
--  �߰���, �������� �����϶�.
SELECT job, min(sal) from emp group by job;

SELECT empno, ename, job, deptno FROM emp 
WHERE (job, sal) IN (SELECT job, min(sal) FROM emp GROUP BY job)
ORDER BY job;

-- ��ֺ�
SELECT empno, sal, deptno FROM emp
WHERE sal IN (SELECT sal FROM emp WHERE deptno = 30 AND comm IS NOT NULL) 
--1250, 1250, 1500, 1600
AND deptno IN (SELECT deptno FROM emp WHERE deptno = 30 AND comm IS NOT NULL); 
-- 30, 30, 30, 30


-- FROM ���� ����ϴ� SUBQUERY - FROM �������� ������ "", AS �� �ȵȴ�.
SELECT e.ename, e.sal
FROM(SELECT empno, ename, job, sal FROM emp WHERE deptno IN(10, 20)) e;


-- UNION : ������ - �ߺ������͸� ������ ������
SELECT deptno FROM emp
union
SELECT deptno FROM dept;

-- UNION ALL : ������ - �ߺ������͸� ������ ������
SELECT deptno FROM emp
UNION ALL
SELECT deptno FROM dept;

-- INRERSECT : ������ : �������� �ִ� ������ ����
SELECT deptno FROM emp
INTERSECT
SELECT deptno FROM dept;

-- MINUS : ������ : �������� �ִ� �����͸� ������ ������ 
SELECT deptno FROM dept
MINUS
SELECT deptno FROM emp;



-- Merge : ���ڵ尡 �����ϸ� update�� �����ϰ�
--         ���ڵ尡 ������ insert�� �����Ѵ�.

-- ���̺� ����

CREATE TABLE emp2 
AS 
SELECT * FROM emp WHERE deptno=10;




MERGE INTO emp2 a -- ���� �Ǵ� ������Ʈ �� ���̺� ��
USING emp b 
ON (a.empno=b.empno) -- () �ݵ�� �ʿ�
WHEN MATCHED THEN 
    UPDATE SET sal = sal+2000
WHEN NOT MATCHED THEN
    INSERT VALUES (b.empno, b.ename, b.job, b.mgr, b.hiredate, b.sal, b.comm, b.deptno);


-- CASE�� : IF��
SELECT empno, ename, deptno, 
    CASE deptno
        WHEN 10 THEN '��ȹ��'  -- , ����
        WHEN 20 THEN '�λ��'
        WHEN 30 THEN '�Ѱ���'
        ELSE '�Ѻι�'
    END AS "�μ���"
FROM emp;
        
SELECT ename,
    CASE 
        WHEN ename LIKE 'AD%' THEN '10%'
        WHEN ename LIKE 'S%' THEN '15%'
        WHEN ename LIKE '%B%' THEN '18%'
        ELSE '20%'
    END
FROM emp;


-- NULLIF(a, b) : a�� b�� ������ null�� ��ȯ�Ѵ�.
--              : �ٸ��ٸ� a�� ��ȯ�Ѵ�.
-- a���� null�� �� �� ����.
SELECT NULLIF(123,123) FROM dual;
SELECT NULLIF(123,456) FROM dual;

SELECT NULLIF(ename, 'SCOTT') FROM emp;

SELECT  CASE WHEN ename='ADAMS'
             THEN NULL
             ELSE ename
        END
FROM emp;


-- COALESCE : NULL ������ ó��
SELECT comm, COALESCE(comm, 1) FROM emp;

SELECT comm, CASE 
                WHEN comm IS NOT NULL
                THEN 100
                ELSE COALESCE(comm, 50)
             END
FROM emp;













select * from emp;
select * from emp2;
SELECT * from dept;









