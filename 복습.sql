SELECT empno, ename FROM emp WHERE  empno IN(7900,7934);
SELECT empno, ename FROM emp WHERE empno NOT IN (7900,7934);

SELECT empno, ename FROM emp WHERE sal BETWEEN 3000 AND 5000;

SELECT empno, ename FROM emp WHERE UPPER(ename) LIKE '%K%';

SELECT empno, ename FROM emp WHERE UPPER(ename) LIKE '_I%';

SELECT empno, ename FROM emp WHERE deptno =30 ORDER BY ename;
SELECT empno, ename FROM emp WHERE deptno =30 ORDER BY ename DESC;

--��������
SELECT empno, ename, sal FROM emp;
SELECT empno, ename, sal, job FROM EMP ORDER BY ename;
SELECT * FROM emp WHERE hiredate LIKE '%/05/%';
SELECT * FROM emp WHERE ename LIKE '%A%' OR sal >=3000;
SELECT * FROM emp WHERE job IN ('SALESMAN','MANAGER');  
SELECT * FROM emp WHERE sal >= 3000 AND nvl(comm, 0)= 0;
SELECT * FROM emp WHERE sal BETWEEN 2000 AND 4000 OR comm >0;
SELECT * FROM tab;
SELECT empno, ename, job, hiredate, sal, deptno FROM emp WHERE deptno IN (10,20) ORDER BY job, sal DESC;

SELECT ename ||': 1YEAR SALARY = '|| sal*12 AS sal FROM emp;

SELECT job FROM emp;
SELECT DISTINCT job FROM emp;
SELECT DISTINCT DEPTNO, JOB FROM emp ORDER BY deptno;

SELECT ABS (-10) AS Absolute FROM dual;

SELECT CEIL(10.1) AS �ݿø� FROM dual;
SELECT CEIL(-10.1) AS �ݿø� FROM dual;

SELECT FLOOR(10.1) AS ���� FROM dual;
SELECT FLOOR(10.6) AS ���� FROM dual;
SELECT FLOOR(-10.1) AS ���� FROM dual;

SELECT MOD(9,4) AS ������ FROM dual;
SELECT POWER(4,2) AS ���� FROM dual;

SELECT ROUND(191.123,0) AS �ݿø� FROM dual;
SELECT ROUND(191.123,1) AS �ݿø� FROM dual;
SELECT ROUND(191.123,2) AS �ݿø� FROM dual;
SELECT SQRT(10) AS ��Ʈ FROM dual;
SELECT TRUNC(7.5597, 2) AS ���� FROM dual;
SELECT TRUNC(157.5597, -2) AS ���� FROM dual;

SELECT ename, sal, MOD(sal,30) AS MOD30, deptno FROM emp WHERE deptno=10;

SELECT CONCAT('Oracle', 'Korea') AS ��ġ�� FROM dual;
SELECT INITCAP('kang shin hun') AS ù���ڴ빮�� FROM dual;
SELECT LOWER('KANG SHIN HUN') AS ��ü�ҹ��ڷ� FROM DUAL;
SELECT INITCAP(LOWER('KANG SHIN HUN')) AS name FROM DUAL;
SELECT UPPER('kang shin hun') AS ��ü�빮�ڷ� FROM dual;

SELECT LPAD('EUN-SICK',10,'*') AS ���ʳ����ֱ� FROM DUAL;
SELECT RPAD('EUN-SICK',10,'*') AS �����ʳ����ֱ� FROM DUAL;

SELECT SUBSTR('JUNG-SICK',3,3) AS m�ڸ�n����ȯ FROM dual;
SELECT SUBSTR('JUNG-SICK',-3,3) AS m�ڸ�n����ȯ FROM dual;

SELECT LENGTH('JUNG-SICK') AS ���ڿ����� FROM dual;

SELECT RPAD(SUBSTR('JUNG-SICK',0,LENGTH('JUNG-SICK')/2),LENGTH('JUNG-SICK'),'*') FROM dual;

SELECT REPLACE ('JACK and JUE', 'J','BL') AS ���ڿ����� FROM dual;
SELECT REPLACE ('JACK and JUE','JA','BL') AS ���ڿ����� FROM dual;
SELECT REPLACE('JACK and JUE','j','BL') AS ���ڿ����� FROM dual;
--��ҹ��� ������

SELECT INSTR('CORPORATE FLOOR', 'OK') AS "���ڿ� ��ġ ã��" FROM dual;
SELECT INSTR('CORPORATE FLOOR', 'OR') AS "���ڿ� ��ġ ã��" FROM dual;
SELECT INSTR('CORPORATE FLOOR', 'OR', 3) AS "���ڿ� ��ġ ã��" FROM dual;
SELECT INSTR('CORPORATE FLOOR', 'OR', 3, 2) AS "���ڿ� ��ġ ã��" FROM dual;

SELECT INSTR('ABC@GMAIL.COM','@') FROM dual;
SELECT SUBSTR('ABC@GMAIL.COM',0,INSTR('ABC@GMAIL.COM','@')-1) AS ID,
SUBSTR('ABC@GMAIL.COM',INSTR('ABC@GMAIL.COM','@')+1,LENGTH('ABC@GMAIL.COM')) AS DOMAIN
FROM dual;

SELECT TRIM(0 FROM 0009872348900) AS "���� ��������" FROM dual;
SELECT TRIM(    0009872348900   ) AS "default�� ���� ����" FROM dual;
SELECT LTRIM('xyxXxyLast WORDxyxy','xy') AS "LTRIM" FROM dual;
SELECT RTRIM('xyxXxyLast WORDxyxy','xy') AS "RTRIM" FROM dual;

SELECT empno, NVL(comm, 0) FROM emp WHERE deptno = 30;

SELECT empno, ename, job, hiredate, sal, nvl(comm,0) AS comm, sal+nvl(comm,0) AS ���޾� FROM emp;

SELECT ename, job, sal, comm FROM emp WHERE sal BETWEEN 2500 AND 4000 OR job IN 'SALESMAN' ORDER BY sal DESC;

SELECT deptno, DECODE(deptno, 10, 'ACCOUNTING', 20, 'RESEARCH', 30, 'SALES', 40, 'OPERATIONS') AS "ǥ��Ǵ� value �� ����" FROM emp;

SELECT sysdate today, LAST_DAY(SYSDATE) LASTDAY FROM dual;
SELECT sysdate today, LAST_DAY(TO_DATE('22/12/03','YY-MM-DD')) LASTDAY FROM dual;

SELECT ADD_MONTHS('20/09/11',2) FROM dual;
SELECT ADD_MONTHS('20/11/11',2) FROM dual;
SELECT ADD_MONTHS('20/01/31',1) FROM dual;
SELECT ADD_MONTHS(SYSDATE,-1) FROM dual;
SELECT hiredate, ADD_MONTHS(hiredate, -10) FROM emp;

SELECT TO_CHAR(ADD_MONTHS(SYSDATE, 3),'YYYY-MM-DD') "date" FROM dual;

SELECT MONTHS_BETWEEN(TO_DATE('2022/09/23'),TO_DATE('2020/06/05')) "DATE" FROM dual;

SELECT ROUND(TO_DATE('1992/09/11'),'YEAR') FROM dual;
SELECT ROUND(TO_DATE('1998/04/11'),'MONTH') FROM dual;
SELECT ROUND(TO_DATE('1998/04/11'),'DAY') FROM dual;

SELECT ROUND(TO_DATE('1998/04/11'),'DD') FROM dual;
SELECT ROUND(sysdate, 'DD') FROM dual;
-- �ð����� ��¥ �ݿø�


SELECT ROUND(TO_DATE('1998/04/11'),'MM') FROM dual;
SELECT ROUND(sysdate, 'MM') FROM dual;
-- �ϼ��� ���� �ݿø�

SELECT ROUND(TO_DATE('1998/04/11'),'YY') FROM dual;
SELECT ROUND(sysdate, 'YY') FROM dual;
-- �޷� �⵵ �ݿø�

SELECT TO_DATE('2020/07/01')-10 FROM dual;
SELECT TO_DATE('2020/07/01')+10 FROM dual;
SELECT TO_DATE('2023/02/17')-TO_DATE(SYSDATE) FROM dual;
--��¥ ���

SELECT TO_CHAR(SYSDATE,'MONTH') CHARTEST FROM dual;

SELECT COUNT(deptno) FROM dept;

SELECT MAX(sal) FROM emp;

SELECT MIN(sal) FROM emp;

SELECT ROUND(avg(sal),1) AS salary FROM emp WHERE deptno=30;

SELECT SUM(sal) AS salary FROM emp WHERE deptno=30;

SELECT ROUND(STDDEV(sal),3) AS salary FROM emp WHERE deptno=30;

CREATE TABLE emp3 AS SELECT * FROM emp;

INSERT INTO emp3 VALUES(7302,'SMITH','CHERK',7939,TO_DATE('80/12/17'),80, NULL, 20);

SELECT * FROM emp3;

INSERT INTO dept(deptno, dname) VALUES(10,'ACCOUNTING');

SELECT * FROM dept;

INSERT INTO dept SELECT * FROM scott.dept;

UPDATE emp3 SET deptno =30 WHERE empno = 7902;

UPDATE emp3 SET sal = ROUND(sal *1.1,0) WHERE deptno = 20;

UPDATE emp3 SET hiredate = sysdate;

DELETE FROM emp3 WHERE empno = 7902;

DELETE FROM emp3 WHERE sal<(SELECT AVG(sal) FROM emp3);

DELETE FROM emp3;

SELECT * FROM emp3;

INSERT INTO emp3 SELECT * FROM emp;

ALTER TABLE emp3 ADD(addr VARCHAR2(50));

ALTER TABLE emp3 MODIFY (ename VARCHAR2(50));
ALTER TABLE emp3 MODIFY (ename VARCHAR2(50) NOT NULL);

ALTER TABLE emp3 DROP COLUMN addr;

CREATE TABLE emp4 AS SELECT * FROM emp;

SELECT * FROM emp4;

DROP TABLE emp4;

CREATE TABLE emp4(
EMPNO NUMBER PRIMARY KEY,
ENAME VARCHAR(20),
JOB VARCHAR2(40),
MGR NUMBER,
HIREDATE DATE,
SAL NUMBER(7,2),
COMM NUMBER,
DEOTBI NUMBER);

ALTER TABLE emp4 DROP COLUMN DEOTBI;
ALTER TABLE emp4 ADD (DEPTNO NUMBER);



SELECT * FROM emp4;
