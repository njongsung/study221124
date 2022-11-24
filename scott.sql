-- Ŀ���� �ִ� ���� �������� �����
-- ���̺� ����� Ȯ��   
select * from tab;
--tab --> ���̺� ��� Ȯ�� ��ɾ�

--���̺� ���� Ȯ��
DESC emp;
-- DESC ���� Ȯ�� ��ɾ�
-- emp�� ���� ����

--number(4) ���� 4�ڸ�
--varchar2(10) ���� 10�ڸ�
--Date ��¥
--number(7,2) �Ǽ� 7�ڸ�(�Ҽ����� �ڸ� ���� ��) �Ҽ��ڸ� 2


select * from emp;
--�ʵ�� : ����, �ѱ� �� ��


--emp�� ename, sal �ʵ�? ���̺�? ����
select ename �����, sal from emp;
-- ������� ename�� alias(����)

select ename �����, sal, sal*0.1 from emp;

SELECT ename �����, sal, sal*0.1 bouns FROM emp;
--alias ==> �������� ������ ǥ����� �ٲ���
--���������� ������ ������ Ű����� �빮�ڸ� �����Ѵ�.



-- WHERE�� : ���ǿ� �´� ���ڵ� �����ϱ� (JAVA�� IF���� ���)
--        : FROM�� ������ WHERE ���� �־���Ѵ�.

SELECT * FROM emp WHERE deptno=10;
SELECT * FROM emp WHERE job='manager';
-- '' ����ó��

SELECT * FROM emp WHERE job='MANAGER';
-- �����ʹ� ��ҹ��� ������.

-- SELECT ename �����, sal �޿�, deptno �μ� �ڵ� FROM emp WHERE job='MANAGER';
-- �μ� �ڵ尡 �������־� ������ ��

SELECT ename �����, sal �޿�, deptno "�μ� �ڵ�" FROM emp WHERE job='MANAGER';
-- ""�� �����ش�

--emp ���̺��� ��� �� �޿��� 2000 �̻��̰�, �μ��ڵ尡 30�� ����� �����϶�.

SELECT empno, ename, sal, deptno
FROM emp
WHERE sal>=2000 AND deptno=30;

-- emp ���̺��� ����� ��� ������ manager�̰ų� salesman�� ��� �� �޿��� 2000~4000�� ����� �����϶�

SELECT empno, ename, job, sal
FROM emp
WHERE JOB='MANAGER' OR JOB='SALESMAN' AND 4000>=sal AND sal>=2000;


SELECT * FROM emp
WHERE (job='MANAGER' OR job='SALESMAN') AND sal>=2000 AND sal<=4000;
--AND OR�� ���� ������ ��ȣ �� �������.

-- BETWEEN ������
-- ������ : �ʵ�� between a and b
--              �ʵ���� ���� a�� b �����̸�
-- �޿��� 2000~4000 ������ ����� ����
SELECT ename, job, sal FROM emp
WHERE sal BETWEEN 2000 AND 4000;

-- �޿��� 2000~4000 ���̰� �ƴ� ���
SELECT ename, job, sal FROM emp
WHERE sal NOT BETWEEN 2000 AND 4000;

SELECT empno, ename FROM emp
WHERE sal BETWEEN 3000 AND 5000;

-- IN ������ : or
-- �޿��� 1250 or 1500 or 1300�� ����� �����϶�.

SELECT empno, ename, sal FROM emp
WHERE sal=1250 or sal=1500 or sal=1300;

SELECT empno, ename, sal FROM emp
WHERE sal IN (1250, 1500, 1300);


SELECT empno, ename, sal, deptno FROM emp
WHERE sal NOT IN(1250,1500,1300);


-- LIKE ������
--          ���ڿ����� �Ϻ� ���ڰ� �ִ� ���ڵ� ������ ��
--          % : �������� ����
--          _ : 1���� ����


-- ������� A�� �����ϴ� ��� ���ϱ�
SELECT empno, ename, sal, comm FROM emp
WHERE ename LIKE 'A%';

-- ������� S�� ������ ��� ���ϱ�
SELECT empno, ename, sal, comm FROM emp
WHERE ename LIKE '%S';

-- ����� A�� ���ԵǾ� �ִ� ��� ���ϱ�
SELECT empno, ename, sal, comm FROM emp
WHERE ename LIKE '%A%';

-- ����� A�� D�� ���ԵǾ��ְ� D�� A���� �ڿ� �ִ� ��� ���ϱ�
SELECT empno, ename, sal, comm FROM emp
WHERE ename LIKE '%A%D%';
-- A ������ D
-- %D%A% = D ���� A�� ã�� ������ �ٸ� ��� ���� 

-- _ : ���� �ϳ��� ������ �־���Ѵ�.
-- �̸� �� �ι� ° ���ڰ� L�� ��� ���ϱ�
SELECT empno, ename, sal, comm FROM emp
WHERE ename LIKE '_L%';

--WHERE ename LIKE '__L%';
-- L������ ���� 2���� �־���Ѵ�.

SELECT empno, ename FROM emp
WHERE ename NOT LIKE '_L%';


-- IS NULL, IS NOT NULL 
SELECT ename, sal, comm, comm+sal FROM emp;
SELECT ename, sal, comm FROM emp WHERE comm=null;
SELECT ename, sal, comm FROM emp WHERE comm IS NULL;
SELECT ename, sal, comm FROM emp WHERE comm IS NOT NULL;

-- Oracle���� null�� �ִٸ� ���� NULL �����ڸ� ����ؾ��Ѵ�.

-- �����ȣ, �����, �޿�, ���ʽ�, ���޾��� �����Ͻÿ�.
-- NVL(field, ��ȯ�� data) : Null Value
--         ���� null�� ��� ���ϴ� �����ͷ� ��ȯ�Ͽ� ó���Ѵ�.
SELECT ename, empno, sal, nvl(comm,0) comm, sal+nvl(comm,0) payment FROM emp;
-- nvl(comm, 0) = comm�� null�� 0���� �����϶�
-- sal+nvl(comm,0) comm�� null�� 0���� ���� �� ����

-- ���ʽ��� �޴� ������ �����, �޿�, ���ʽ��� �����϶�
SELECT ename, sal, comm FROM emp
WHERE comm NOT IN 0 AND comm IS NOT NULL;

SELECT ename, sal, comm FROM emp WHERE comm>0;

SELECT ename, sal, comm FROM emp WHERE nvl(comm,0)>0;

--ORDER BY :
--          ASC�� DESC�� �����ϸ� ASC(��������)���� ���ĵȴ�.

-- �޿��� ���� ������ �����϶�.
SELECT ename, sal FROM emp ORDER BY sal DESC;
SELECT ename, sal FROM emp ORDER BY sal ASC;
SELECT ename, sal FROM emp ORDER BY sal;

-- ���� �� �޿������� �����϶�
select ename, sal, job FROM emp ORDER BY job, sal;

-- 81�⿡ �Ի��� ����� �μ����� �޿��� ���� �������� �����϶�
SELECT ename, sal, hiredate, deptno FROM emp 
WHERE hiredate LIKE '81%'
ORDER BY deptno, sal DESC;


-- ��������
-- ������� ������������ �����ϴ� �������� �ۼ��϶�
SELECT * FROM emp order by ename;


-- ORDER BY 1 = SELECT�� ù��°�� �������� �����϶�
-- ORDER BY 2 DESC= SELECT�� �ι�°�� �������� �����϶�
SELECT empno, ename, sal FROM emp
ORDER BY 1;







--1�� ����
SELECT empno, ename,sal FROM emp;

--2�� ����
SELECT empno, ename, sal, job FROM emp
ORDER BY ename ASC;

SELECT empno, ename, sal, job FROM emp
ORDER BY ename;

SELECT empno, ename, sal, job FROM emp
ORDER BY 2;

SELECT empno, ename, sal, job FROM emp
ORDER BY 2 ASC;

--3�� ����
SELECT * FROM emp
WHERE hiredate LIKE '___05/%';

--4�� ����
SELECT * FROM emp
WHERE ename LIKE '%A%' OR sal >= 3000;

--5�� ����
SELECT ename, job, sal, comm FROM emp
WHERE job='MANAGER' OR job='SALESMAN';

SELECT * FROM emp WHERE job IN ('SALESMAN','MANAGER');

--6�� ����
SELECT * FROM emp WHERE sal >= 3000 AND nvl(comm, 0) =0;

--7�� ����
SELECT * FROM emp WHERE sal BETWEEN 2000 AND 4000 OR nvl(comm,0) >0 ORDER BY sal DESC;

--8�� ����
SELECT * FROM tab;

--9�� ����
SELECT empno, ename, job, hiredate, sal, deptno FROM emp WHERE deptno IN (10,20)
ORDER BY job, sal desc;

-- ������ ���۾� (DML) (3)

-- LITERAL ���ڿ� 
-- "A" || "B"

SELECT '�� �̸��� ' ||ename || '�Դϴ�.' name FROM emp;

-- emp ���̺��� �̸��� ������ "KIMG: 1 YEAR SALARY = 6000" �������� ����϶�.
SELECT  ename|| ': 1 YEAR SALARY = ' || sal*12 AS sal FROM emp;

-- DISTINCT : �ߺ����� ����
            : Ư�� �ʵ��� �� �߿� ���� ���� �����ϰ� 1������ �����Ѵ�.

SELECT job FROM emp;

SELECT DISTINCT job FROM emp;

SELECT DISTINCT deptno, job FROM emp ORDER BY deptno;








SELECT * FROM emp;
















