-- 내장함수 - 문자

--CONCAT(CHAR1, CHAR2 ) -> 문자열 연결하기
SELECT empno, CONCAT(ename, '님') as ename FROM emp;

--INITCAP(CHAR) -> 각 단어의 첫번째 문자를 대문자로 바꿔준다
--                 공백이 각각의 기준이 된다.
SELECT INITCAP('oracel test') FROM dual;

--UPPER(CHAR)   -> 모든 영문자를 대문자로
SELECT UPPER('oracle function test') FROM emp;

--LOWER(CHAR)   -> 모든 영문자를 소문자로
SELECT ename, job, LOWER(ename), LOWER(job) FROM emp;

--LPAD([char],  n,   [CHAR2])   -> 왼쪽에 남는 자리를 특정 문자로 채워줌
--      데이터   자릿수   채워질 문자
SELECT LPAD(ename, 8, '*') FROM emp;

--RPAD(CHAR1, n, [CHAR2])   -> 오른쪽에 남는 자리를 특정 문자로 채워줌
SELECT RPAD(ename, 8, '*') FROM emp;

SELECT LPAD(ename, 8, '*'), RPAD(ename, 8, '%') FROM emp;

-- SUBSTR(char, n    ,     m)-> 문자열에서 일부 문자 얻어오기
--              n=시작위치  m=갯수

SELECT SUBSTR('hong gildong', 3, 5) FROM dual;
--                           3부터 5개

SELECT SUBSTR('hong gildong', -5, 3) FROM dual;
--                           문자열 뒤에서 5번째 글자부터 3개 선택.

-- LENGTH(char) -> 문자 수 구하기
SELECT ename, LENGTH(ename) FROM emp;

-- 이름의 글자길이의 50%만큼 출력하고 나머지 문자는 '*'로 출력하라.
SELECT  RPAD(SUBSTR(ename,1,CEIL(LENGTH(ename)/2)),LENGTH(ename),'*') AS name1, 
        RPAD(SUBSTR(ename,1,FLOOR(LENGTH(ename)/2)),LENGTH(ename),'*') AS name2 FROM emp;


-- REPLACE (char, str1, str2)   ->  특정 문자를 다른 문자로 변경하기
--                                  char의 값 중에 str1을 str2로 변경한다.

SELECT ename, REPLACE(ename, 'A', '에이') AS Changes FROM emp;

-- INSTR(data, char, str[n,m])    ->   특정 문자열의 위치를 반환한다. 
-- str[n(시작점),m(번째)]은 생략가능       발견하지 못한다면 0이 반환된다.

SELECT ename, INSTR(ename, 'A') FROM emp;
SELECT ename, INSTR(ename, 'A', 2) FROM emp;
SELECT ename, INSTR(ename, 'T', 1, 2) FROM emp;


--이메일을 이용하여 아이디와 도메인을 분리하여라.
--SELECT INSTR('abcdef@google.com','@') FROM dual; <아이디, 도메인 나누는 분기점
SELECT SUBSTR('ABCABC@GOOGLE.COM',1, INSTR('abcdef@google.com','@')-1) AS ID,
       SUBSTR('ABCABC@GOOGLE.COM',INSTR('abcdef@google.com','@')+1,LENGTH('ABCABC@GOOGLE.COM')) AS DOMAIN
FROM dual;

SELECT SUBSTR ('asdf@naver.com',1,INSTR('asdf@naver.com','@')-1) AS 아이디,
SUBSTR ('asdf@naver.com', INSTR('asdf@naver.com','@')+1, LENGTH('asdf@naver.com')-INSTR('asdf@naver.com','@')) AS 도메인
FROM dual;

-- TRIM() ->    양쪽 사이드의 특정문자, 숫자 제거
-- RTRIM() ->   왼쪽 사이드의 특정문자, 숫자 제거
-- LTRIM() ->   오른쪽 사이드의 특정문자, 숫자 제거

SELECT sal, TRIM(0 FROM sal) FROM emp;
SELECT ename, LTRIM(ename, 'S') FROM emp;
SELECT ename, RTRIM(ename, 'S') FROM emp;


--General function
--DECODE()  -> 데이터를 다른 값으로 바꾸어준다.

--DECODE (VALUE, F1, THEN1 IF2, THEN2, ...)

-- 10: 기획부, 20: 총괄부, 30: 인사부

SELECT ename, deptno, DECODE(deptno, 10, '기획부', 20, '총괄부', 30, '인사부') AS 부서명 
FROM emp;


SELECT * FROM emp;
SELECT * FROM dept;











