--�׷� �Լ�
--COUNT() -> ����

SELECT COUNT(ename) ����� from emp;
SELECT COUNT(empno) ����� from emp;
SELECT COUNT(nvl(comm,0)) ����� from emp;
SELECT COUNT(ename) from emp;

SELECT COUNT(ename) FROM emp WHERE job='MANAGER';


-- MAX(), MIN() : �ش� colum ���� �ִ밪�� �ּҰ��� ���Ѵ�.
SELECT MAX(sal), MIN(sal) FROM emp;

SELECT MAX(sal), MIN(sal) FROM emp WHERE job IN ('MANAGER','SALESMAN');


-- SUM(), AVG()
SELECT SUM(sal), ROUND(AVG(sal),0) FROM emp;


-- STDDEV() ->  ǥ������
SELECT STDDEV(sal) FROM emp;


-- GROUP BY
-- �μ��� �޿��� �հ�� ����� ���Ͽ���
SELECT deptno, SUM(sal) �հ�, ROUND(AVG(sal),0) ��� FROM emp 
GROUP BY DEPTNO ORDER BY deptno;


--       WHERE                  GROUP BY
-- �޿��� 1500�� �̻��� ��� �� ������ ��� ��, �޿��� �հ�, �޿��� �ִ밪�� ���϶�.

SELECT job ���� , COUNT(job) �����, SUM(sal) �հ�, MAX(sal) �ִ밪 FROM emp
WHERE sal >=1500
GROUP BY job ORDER BY job; 

-- ���� �� ��� ���� 3�� �̻��� ������ ���϶�
SELECT job, COUNT(ename) FROM emp GROUP BY job HAVING COUNT(ename)>=3;


-- ���� �׷� ��ü ������ 5000�� �ʰ��ϴ� �� ������ ���޿��� ����Ͽ���.
-- ��, �Ǹſ��� �����ϰ� �� �޿� �հ�� �������� ���� �Ͽ���

SELECT SUM(sal) �޿��հ�, job FROM emp
WHERE job NOT IN('SALESMAN') GROUP BY(job) HAVING SUM(sal) >5000
ORDER BY SUM(sal) DESC;

-- �׷� ��ü ���� - SUM(sal) > 5000
-- �Ǹſ� ���� - NOT IN ('SALESMAN')
-- �������� - ORDER BY (sum(sal)) DESC

SELECT job, SUM(sal) FROM emp
WHERE job NOT IN ('SALESMAN')
GROUP BY job HAVING SUM(sal)>5000 
ORDER BY SUM(sal)DESC;


-- ROLLUP   -> �׷��Լ� ó�� ��� ��ü�� ���� ��踦 ���Ѵ�.

SELECT job, SUM(sal), ROUND(AVG(sal),0) FROM emp
GROUP BY ROLLUP(job);


-- �μ��� 1�� �з��ϰ� �μ� ������ �������� 2�� �з��Ͽ� ����� �׸��� �޿��� �հ�� ����� ���Ͽ���.
SELECT deptno, job, COUNT(ename), SUM(sal), AVG(sal) FROM emp
GROUP BY (deptno, job) ORDER BY deptno, job;

-- ROLLUP
SELECT deptno, job, COUNT(ename), SUM(sal), ROUND(AVG(sal),0) FROM emp
GROUP BY ROLLUP(deptno, job) ORDER BY deptno, job;

-- [����1] �����ȣ, �����, ������, �Ի���, �޿�, ���ʽ�, ���޾��� ����϶�. 
--                                             ��) ���޾��� �޿�+���ʽ��̴�.
--                          yyyy-mm-dd �� ������ �ϱ�
SELECT empno AS �����ȣ, ename AS �����, job, TO_CHAR(hiredate,'YYYY-MM-DD') AS �Ի���, 
sal AS �޿�, NVL(comm,0) AS ���ʽ�, sal+NVL(comm,0) AS ���޾� FROM emp ORDER BY hiredate;


-- [����2] �����, ������, �޿�, ���ʽ��� �����ϵ� �޿��� 2500���� 4000�� ���� �̰ų� �������� 
--        SALESMAN�� ����� �޿��� ������������ �����Ͽ� ���ڵ带 �����϶�.

--                                                  ��) ���ʽ��� NULL�� ��� 0���� �����϶�.

SELECT  ename, job, sal, NVL(comm,0) FROM emp 
WHERE sal BETWEEN 2500 AND 4000 OR job='SALESMAN'
ORDER BY sal DESC;


-- CUBE() -> 1�� �з� �Ǵ� 2�� �з��� ���Ͽ� ��踦 �����ش�.
-- �μ��� ������ ���� �����, �޿��� �հ踦 ���϶�.

SELECT deptno, job AS ����, count(empno) AS ����� , SUM(sal) AS �޿� FROM emp
GROUP BY deptno, job ORDER BY deptno;

SELECT deptno, job AS ����, count(empno) AS ����� , SUM(sal) AS �޿� FROM emp
GROUP BY ROLLUP(deptno, job) ORDER BY deptno;

SELECT deptno, job AS ����, count(empno) AS ����� , SUM(sal) AS �޿� FROM emp
GROUP BY CUBE(deptno, job) ORDER BY deptno;


-- GROUPING() 
-- GROUP BY�� ��谡 ���� ���� 0�� ��ȯ�Ѵ�.
-- ROLLUP() Ȥ�� CUBE()�� ���� ���� 1�� ��ȯ�Ѵ�.

-- �μ��� �� ������ ���� �����, �޿��հ�, �ְ�޿��� �����϶�.

SELECT deptno, job, COUNT(empno) AS �����, SUM(sal) AS �޿��հ�, MAX(sal) AS �ְ�޿�, 
GROUPING(deptno) AS DEPT, GROUPING(job) AS ����
FROM emp
GROUP BY CUBE(deptno, job) ORDER BY deptno;



select * from emp;














