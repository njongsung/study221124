-- 내장함수 - 날짜 처리, 변환 함수


-- 날짜함수

-- 현재 날짜 구하기
SELECT SYSDATE FROM dual;

-- TO_CHAR() : 날짜를 문자로 변환
SELECT SYSDATE, TO_CHAR(SYSDATE,'MONTH') FROM dual;

SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') FROM dual;
SELECT TO_CHAR(SYSDATE, 'HH24:MI') FROM dual;
SELECT hiredate, TO_CHAR(HIREDATE, 'YYYY-MM-DD HH24:MM') FROM emp;

-- LAST_DAY() : 마지막 날을 구한다.
SELECT SYSDATE, LAST_DAY(SYSDATE) FROM dual;
SELECT ename, hiredate, LAST_DAY(hiredate) FROM emp;

-- ADD_MONTH() : 월 더하기
SELECT ADD_MONTHS(SYSDATE, 30) FROM dual;

-- 각사원의 입사 15개월 후는 언제인가
SELECT ename, hiredate, ADD_MONTHS(hiredate, 15) FROM emp;

SELECT ADD_MONTHS('2020/10/10', 13) FROM dual;
SELECT TO_CHAR(ADD_MONTHS('1920/10/10', 13),'YYYY-MM-DD') FROM dual;
SELECT TO_CHAR(ADD_MONTHS(TO_DATE('2020/10','YYYY/MM'), 13),'YYYY-MM-DD') FROM dual;
SELECT TO_CHAR(ADD_MONTHS('2020/10/10', 13),'YYYY-MM-DD') FROM dual;
SELECT TO_DATE('05122020','MMDDYYYY') FROM DUAL;    -- 출력은 yymmdd 저장은 지정한 포맷으로 됨


SELECT TO_DATE('20-10-12','YY-MM-DD') FROM dual;
SELECT TO_DATE('2020-10-12','YYYY-DD-MM') FROM dual;
SELECT TO_DATE('2020-10-12 08:24:12','YYYY-MM-DD HH24:MI:SS') FROM dual;
SELECT TO_DATE('20160901151212','YYYYMMDDHH24MISS') AS ONE,
                TO_DATE('20160901091212','YYYYMMDDHHMISS') AS TWO,
                TO_DATE('2016090115','YYYYMMDDHH24') AS THREE,
                TO_DATE('2016','YYYY') AS FOUR
                FROM dual;
                
        
-- MONTHS_BETWEEN(D1, D2)   -> D1과 D2사이의 개월 수를 구해준다.

SELECT MONTHS_BETWEEN(TO_DATE('2021-05-10','YYYY-MM-DD'),SYSDATE) FROM dual;


SELECT ABS((ROUND(MONTHS_BETWEEN(TO_DATE('2021-05-10','YYYY-MM-DD'),SYSDATE),0))) 
AS 차이 FROM dual;

-- emp 테이블 현재까지의 근속 개월 수를 구하여라

-- 절대값(반올림(현재일 - 입사일))

SELECT hiredate, floor(MONTHS_BETWEEN(SYSDATE, hiredate)) from emp;

-- 날짜 반올림

-- YEAR: 월을 반올림 , MONTH: 일을 반올림, DAY: 요일을 반올림 일요일이 시작 기준
SELECT sysdate, ROUND(SYSDATE, 'YEAR') FROM dual;

SELECT SYSDATE, ROUND(SYSDATE, 'MONTH') FROM dual;

select sysdate, round(sysdate, 'day') from dual;


-- 날짜의 산술 연산
-- 날짜(-,+)날짜, 날짜(-,+)숫자

-- 오늘을 기준으로 100일 후를 구하여라.
SELECT SYSDATE+100, SYSDATE-100 FROM dual;

-- 입사한지 며칠이 지났는지 구하여라.
SELECT floor(SYSDATE-hiredate) from emp;


 












        
        
        
