-- �����Լ� - ��¥ ó��, ��ȯ �Լ�


-- ��¥�Լ�

-- ���� ��¥ ���ϱ�
SELECT SYSDATE FROM dual;

-- TO_CHAR() : ��¥�� ���ڷ� ��ȯ
SELECT SYSDATE, TO_CHAR(SYSDATE,'MONTH') FROM dual;

SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') FROM dual;
SELECT TO_CHAR(SYSDATE, 'HH24:MI') FROM dual;
SELECT hiredate, TO_CHAR(HIREDATE, 'YYYY-MM-DD HH24:MM') FROM emp;

-- LAST_DAY() : ������ ���� ���Ѵ�.
SELECT SYSDATE, LAST_DAY(SYSDATE) FROM dual;
SELECT ename, hiredate, LAST_DAY(hiredate) FROM emp;

-- ADD_MONTH() : �� ���ϱ�
SELECT ADD_MONTHS(SYSDATE, 30) FROM dual;

-- ������� �Ի� 15���� �Ĵ� �����ΰ�
SELECT ename, hiredate, ADD_MONTHS(hiredate, 15) FROM emp;

SELECT ADD_MONTHS('2020/10/10', 13) FROM dual;
SELECT TO_CHAR(ADD_MONTHS('1920/10/10', 13),'YYYY-MM-DD') FROM dual;
SELECT TO_CHAR(ADD_MONTHS(TO_DATE('2020/10','YYYY/MM'), 13),'YYYY-MM-DD') FROM dual;
SELECT TO_CHAR(ADD_MONTHS('2020/10/10', 13),'YYYY-MM-DD') FROM dual;
SELECT TO_DATE('05122020','MMDDYYYY') FROM DUAL;    -- ����� yymmdd ������ ������ �������� ��


SELECT TO_DATE('20-10-12','YY-MM-DD') FROM dual;
SELECT TO_DATE('2020-10-12','YYYY-DD-MM') FROM dual;
SELECT TO_DATE('2020-10-12 08:24:12','YYYY-MM-DD HH24:MI:SS') FROM dual;
SELECT TO_DATE('20160901151212','YYYYMMDDHH24MISS') AS ONE,
                TO_DATE('20160901091212','YYYYMMDDHHMISS') AS TWO,
                TO_DATE('2016090115','YYYYMMDDHH24') AS THREE,
                TO_DATE('2016','YYYY') AS FOUR
                FROM dual;
                
        
-- MONTHS_BETWEEN(D1, D2)   -> D1�� D2������ ���� ���� �����ش�.

SELECT MONTHS_BETWEEN(TO_DATE('2021-05-10','YYYY-MM-DD'),SYSDATE) FROM dual;


SELECT ABS((ROUND(MONTHS_BETWEEN(TO_DATE('2021-05-10','YYYY-MM-DD'),SYSDATE),0))) 
AS ���� FROM dual;

-- emp ���̺� ��������� �ټ� ���� ���� ���Ͽ���

-- ���밪(�ݿø�(������ - �Ի���))

SELECT hiredate, floor(MONTHS_BETWEEN(SYSDATE, hiredate)) from emp;

-- ��¥ �ݿø�

-- YEAR: ���� �ݿø� , MONTH: ���� �ݿø�, DAY: ������ �ݿø� �Ͽ����� ���� ����
SELECT sysdate, ROUND(SYSDATE, 'YEAR') FROM dual;

SELECT SYSDATE, ROUND(SYSDATE, 'MONTH') FROM dual;

select sysdate, round(sysdate, 'day') from dual;


-- ��¥�� ��� ����
-- ��¥(-,+)��¥, ��¥(-,+)����

-- ������ �������� 100�� �ĸ� ���Ͽ���.
SELECT SYSDATE+100, SYSDATE-100 FROM dual;

-- �Ի����� ��ĥ�� �������� ���Ͽ���.
SELECT floor(SYSDATE-hiredate) from emp;


 












        
        
        
