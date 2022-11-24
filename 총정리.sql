-- 총정리

--ABS(n) -> 절대값 계산

SELECT ABS(-10) Absolute FROM dual;
-- 10


--CEIL(n) -> 올림
SELECT CEIL(10.1) ceil FROM dual;
-- 11


--FLOOR(n) -> 내림
SELECT FLOOR(10.1) FROM dual;
-- 10

--MOD(m,n)-> m을 n으로 나누고 남은 값을 반환 java의 % 개념
SELECT MOD(9,4) FROM dual;
--1


--POWER(m,n) m의 n제곱 계산
SELECT POWER(4,2) FROM dual;
--16


-- ROUND(n,[m]) ->  반올림
--                  n -> 데이터값
--                  m -> 양수일 경우 1이면 소수 첫번째 자리를 두번째 자리를 반올림
--                       음수일 경우 -1이면 정수 1의 자리를 반올림 -2이면 정수 10의 자리를 반올림
--                                  소숫점이 기준인 듯?
SELECT ROUND(191.123,1) FROM dual;
SELECT ROUND(191.123,0) FROM dual;


--TURNC(n,[m]) -> 내림
SELECT TRUNC(7.5597,2) FROM dual;
--7.55
SELECT TRUNC(7.4444,1) FROM dual;
--7.4


--CONCAT(char1, char2) -> || 연산자 역할
SELECT CONCAT('Oracle', 'Korea') FROM dual;
--Oracle Korea

--LOWER(char) -> 문자열을 소문자로
SELECT LOWER('ABCDEF') FROM dual;


--UPPER() -> 문자열을 대문자로
SELECT UPPER('abcdef') FROM dual;


--LPAD([char],  n,   [CHAR2])   -> 왼쪽에 남는 자리를 특정 문자로 채워줌
--      데이터   자릿수   채워질 문자
SELECT LPAD(ename, 8, '*') FROM emp;

--RPAD(CHAR1, n, [CHAR2])   -> 오른쪽에 남는 자리를 특정 문자로 채워줌
SELECT RPAD(ename, 8, '*') FROM emp;


--SUBSTR(char, m, n) -> m번째 자리부터 길이가 n개인 문자열 반환 n이 음수일 경우 뒤에서 m번째 문자부터 반대 방향으로 n개 반환 
--                                         n 생략 가능
SELECT SUBSTR('ABCDEFGHIJK',3) FROM dual;
--CDEFGHIJK

SELECT SUBSTR('ABCDEFGHIJK',3,3) FROM dual;
--CDE

SELECT SUBSTR('ABCDEFGHIJK',-3) FROM dual;
--IJK

SELECT SUBSTR('ABCDEFGHIJK',-3,5) FROM dual;
--IJK


--LENGTH -> 문자열의 길이 리턴
SELECT LENGTH('ABCDEFGHIJK') FROM dual;


--REPLACE(char1, str1, str2) -> 문자열의 특정 문자를 다른 문자로 변환, 대소문자 구분 함
SELECT REPLACE('ABCDEF','C','H') FROM dual;
--ABHDEF

SELECT REPLACE('ABCDEF AND CCCCCC','C','H') FROM dual;
--ABHDEF AND HHHHHH


--INSTR(data, char1, n, m) -> 문자열이 포함되어있다면 해당 문자열의 위치 반환
--                              발견하지 못했을 때는 0이 반환된다.
SELECT INSTR('ABCDEF', 'CD')FROM dual;
--3

-- 7의 위치부터 탐색 시작
SELECT INSTR('ABCDEFABCDEFABCDEF', 'CD',7)FROM dual;
-- 9

-- 7의 위치부터 탐색 시작 후 두번째 CD 찾기
SELECT INSTR('ABCDEFABCDEFABCDEF', 'CD',7,2)FROM dual;
--15






SELECT  FROM dual;


















