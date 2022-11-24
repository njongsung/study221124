-- 내장함수 숫자

-- abs() -> 절대값
SELECT ABS(-90) FROM dual;
-- dual -> 가상 테이블 
-- SELECT 쿼리문에서 테이블이 필수적으로 들어가야하기 때문에 가상 테이블을 넣어준다.

-- CEIL() -> 올림
SELECT CEIL(10.1), ceil(-12.1) FROM dual;
--          11          -12

-- floor() -> 내림
SELECT FLOOR(10.1), FLOOR(12.9), FLOOR(-12.9) FROM dual;

-- MOD() -> 나머지 구하기
SELECT MOD(12, 4), MOD(12,5) FROM dual;

-- ROUND(n,[m]) ->  반올림
--                  n -> 상수
--                  m -> 양수일 경우 1이면 소수 첫번째 자리를 두번째 자리를 반올림
--                       음수일 경우 -1이면 정수 1의 자리를 반올림 -2이면 정수 10의 자리를 반올림
--                                  소숫점이 기준인 듯?
SELECT ROUND(26.3658,1), ROUND(26.3658,2), ROUND(26.3658,-1), ROUND(26.3658,-2)FROM dual;

-- TRUNC(n,m) -> 지정한 자리수까지 내 ????
SELECT TRUNC(7.559,2), TRUNC(5254.26,-2) FROM dual;


SELECT sal, MOD(sal,30) FROM emp WHERE deptno=10;

