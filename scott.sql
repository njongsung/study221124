-- 커서가 있는 줄의 쿼리문이 실행됨
-- 테이블 목록을 확인   
select * from tab;
--tab --> 테이블 목록 확인 명령어

--테이블 구조 확인
DESC emp;
-- DESC 구조 확인 명령어
-- emp에 대한 설명

--number(4) 숫자 4자리
--varchar2(10) 숫자 10자리
--Date 날짜
--number(7,2) 실수 7자리(소숫점도 자리 차지 함) 소수자리 2


select * from emp;
--필드명 : 영어, 한글 다 됨


--emp의 ename, sal 필드? 테이블? 선택
select ename 사원명, sal from emp;
-- 사원명은 ename의 alias(별명)

select ename 사원명, sal, sal*0.1 from emp;

SELECT ename 사원명, sal, sal*0.1 bouns FROM emp;
--alias ==> 존재하지 않지만 표기명을 바꿔줌
--문법적으로 오류는 없지만 키워드는 대문자를 권장한다.



-- WHERE절 : 조건에 맞는 레코드 선택하기 (JAVA의 IF절과 비슷)
--        : FROM절 다음에 WHERE 절이 있어야한다.

SELECT * FROM emp WHERE deptno=10;
SELECT * FROM emp WHERE job='manager';
-- '' 문자처리

SELECT * FROM emp WHERE job='MANAGER';
-- 데이터는 대소문자 구분함.

-- SELECT ename 사원명, sal 급여, deptno 부서 코드 FROM emp WHERE job='MANAGER';
-- 부서 코드가 떨어져있어 오류가 남

SELECT ename 사원명, sal 급여, deptno "부서 코드" FROM emp WHERE job='MANAGER';
-- ""로 묶어준다

--emp 테이블의 사원 중 급여가 2000 이상이고, 부서코드가 30인 사원을 선택하라.

SELECT empno, ename, sal, deptno
FROM emp
WHERE sal>=2000 AND deptno=30;

-- emp 테이블의 사원중 담당 업무가 manager이거나 salesman인 사원 중 급여가 2000~4000인 사원을 선택하라

SELECT empno, ename, job, sal
FROM emp
WHERE JOB='MANAGER' OR JOB='SALESMAN' AND 4000>=sal AND sal>=2000;


SELECT * FROM emp
WHERE (job='MANAGER' OR job='SALESMAN') AND sal>=2000 AND sal<=4000;
--AND OR이 같이 있으면 괄호 꼭 해줘야함.

-- BETWEEN 연산자
-- 조건절 : 필드명 between a and b
--              필드명의 값이 a와 b 사이이면
-- 급여가 2000~4000 사이인 사원을 선택
SELECT ename, job, sal FROM emp
WHERE sal BETWEEN 2000 AND 4000;

-- 급여가 2000~4000 사이가 아닌 사원
SELECT ename, job, sal FROM emp
WHERE sal NOT BETWEEN 2000 AND 4000;

SELECT empno, ename FROM emp
WHERE sal BETWEEN 3000 AND 5000;

-- IN 연산자 : or
-- 급여가 1250 or 1500 or 1300인 사원을 선택하라.

SELECT empno, ename, sal FROM emp
WHERE sal=1250 or sal=1500 or sal=1300;

SELECT empno, ename, sal FROM emp
WHERE sal IN (1250, 1500, 1300);


SELECT empno, ename, sal, deptno FROM emp
WHERE sal NOT IN(1250,1500,1300);


-- LIKE 연산자
--          문자열에서 일부 문자가 있는 레코드 선택할 때
--          % : 여러개의 문자
--          _ : 1개인 문자


-- 사원명이 A로 시작하는 사원 구하기
SELECT empno, ename, sal, comm FROM emp
WHERE ename LIKE 'A%';

-- 사원명이 S로 끝나는 사원 구하기
SELECT empno, ename, sal, comm FROM emp
WHERE ename LIKE '%S';

-- 사원명에 A가 포함되어 있는 사원 구하기
SELECT empno, ename, sal, comm FROM emp
WHERE ename LIKE '%A%';

-- 사원명에 A와 D가 포함되어있고 D가 A보다 뒤에 있는 사원 구하기
SELECT empno, ename, sal, comm FROM emp
WHERE ename LIKE '%A%D%';
-- A 다음에 D
-- %D%A% = D 다음 A를 찾기 때문에 다른 결과 나옴 

-- _ : 문자 하나는 무조건 있어야한다.
-- 이름 중 두번 째 문자가 L인 사원 구하기
SELECT empno, ename, sal, comm FROM emp
WHERE ename LIKE '_L%';

--WHERE ename LIKE '__L%';
-- L이전에 문자 2개가 있어야한다.

SELECT empno, ename FROM emp
WHERE ename NOT LIKE '_L%';


-- IS NULL, IS NOT NULL 
SELECT ename, sal, comm, comm+sal FROM emp;
SELECT ename, sal, comm FROM emp WHERE comm=null;
SELECT ename, sal, comm FROM emp WHERE comm IS NULL;
SELECT ename, sal, comm FROM emp WHERE comm IS NOT NULL;

-- Oracle에서 null이 있다면 따로 NULL 연산자를 사용해야한다.

-- 사원번호, 사원명, 급여, 보너스, 지급액을 선택하시오.
-- NVL(field, 변환할 data) : Null Value
--         값이 null일 경우 원하는 데이터로 변환하여 처리한다.
SELECT ename, empno, sal, nvl(comm,0) comm, sal+nvl(comm,0) payment FROM emp;
-- nvl(comm, 0) = comm의 null을 0으로 변경하라
-- sal+nvl(comm,0) comm의 null을 0으로 변경 후 계산됨

-- 보너스를 받는 직원의 사원명, 급여, 보너스를 선택하라
SELECT ename, sal, comm FROM emp
WHERE comm NOT IN 0 AND comm IS NOT NULL;

SELECT ename, sal, comm FROM emp WHERE comm>0;

SELECT ename, sal, comm FROM emp WHERE nvl(comm,0)>0;

--ORDER BY :
--          ASC나 DESC를 생략하면 ASC(오름차순)으로 정렬된다.

-- 급여가 높은 순으로 정렬하라.
SELECT ename, sal FROM emp ORDER BY sal DESC;
SELECT ename, sal FROM emp ORDER BY sal ASC;
SELECT ename, sal FROM emp ORDER BY sal;

-- 업무 별 급여순으로 정렬하라
select ename, sal, job FROM emp ORDER BY job, sal;

-- 81년에 입사한 사원을 부서별로 급여가 많은 순서으로 정렬하라
SELECT ename, sal, hiredate, deptno FROM emp 
WHERE hiredate LIKE '81%'
ORDER BY deptno, sal DESC;


-- 문자정렬
-- 사원명을 오름차순으로 선택하는 쿼리문을 작성하라
SELECT * FROM emp order by ename;


-- ORDER BY 1 = SELECT의 첫번째를 오름차순 정렬하라
-- ORDER BY 2 DESC= SELECT의 두번째를 내림차순 정렬하라
SELECT empno, ename, sal FROM emp
ORDER BY 1;







--1번 문제
SELECT empno, ename,sal FROM emp;

--2번 문제
SELECT empno, ename, sal, job FROM emp
ORDER BY ename ASC;

SELECT empno, ename, sal, job FROM emp
ORDER BY ename;

SELECT empno, ename, sal, job FROM emp
ORDER BY 2;

SELECT empno, ename, sal, job FROM emp
ORDER BY 2 ASC;

--3번 문제
SELECT * FROM emp
WHERE hiredate LIKE '___05/%';

--4번 문제
SELECT * FROM emp
WHERE ename LIKE '%A%' OR sal >= 3000;

--5번 문제
SELECT ename, job, sal, comm FROM emp
WHERE job='MANAGER' OR job='SALESMAN';

SELECT * FROM emp WHERE job IN ('SALESMAN','MANAGER');

--6번 문제
SELECT * FROM emp WHERE sal >= 3000 AND nvl(comm, 0) =0;

--7번 문제
SELECT * FROM emp WHERE sal BETWEEN 2000 AND 4000 OR nvl(comm,0) >0 ORDER BY sal DESC;

--8번 문제
SELECT * FROM tab;

--9번 문제
SELECT empno, ename, job, hiredate, sal, deptno FROM emp WHERE deptno IN (10,20)
ORDER BY job, sal desc;

-- 데이터 조작어 (DML) (3)

-- LITERAL 문자열 
-- "A" || "B"

SELECT '내 이름은 ' ||ename || '입니다.' name FROM emp;

-- emp 테이블에서 이름과 연봉을 "KIMG: 1 YEAR SALARY = 6000" 형식으로 출력하라.
SELECT  ename|| ': 1 YEAR SALARY = ' || sal*12 AS sal FROM emp;

-- DISTINCT : 중복행의 제거
            : 특정 필드의 값 중에 같은 값을 제거하고 1개씩만 선택한다.

SELECT job FROM emp;

SELECT DISTINCT job FROM emp;

SELECT DISTINCT deptno, job FROM emp ORDER BY deptno;








SELECT * FROM emp;
















