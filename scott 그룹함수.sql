--그룹 함수
--COUNT() -> 갯수

SELECT COUNT(ename) 사원수 from emp;
SELECT COUNT(empno) 사원수 from emp;
SELECT COUNT(nvl(comm,0)) 사원수 from emp;
SELECT COUNT(ename) from emp;

SELECT COUNT(ename) FROM emp WHERE job='MANAGER';


-- MAX(), MIN() : 해당 colum 중의 최대값과 최소값을 구한다.
SELECT MAX(sal), MIN(sal) FROM emp;

SELECT MAX(sal), MIN(sal) FROM emp WHERE job IN ('MANAGER','SALESMAN');


-- SUM(), AVG()
SELECT SUM(sal), ROUND(AVG(sal),0) FROM emp;


-- STDDEV() ->  표준편차
SELECT STDDEV(sal) FROM emp;


-- GROUP BY
-- 부서별 급여의 합계와 평균을 구하여라
SELECT deptno, SUM(sal) 합계, ROUND(AVG(sal),0) 평균 FROM emp 
GROUP BY DEPTNO ORDER BY deptno;


--       WHERE                  GROUP BY
-- 급여가 1500불 이상인 사원 중 업무별 사원 수, 급여의 합계, 급여의 최대값을 구하라.

SELECT job 업무 , COUNT(job) 사원수, SUM(sal) 합계, MAX(sal) 최대값 FROM emp
WHERE sal >=1500
GROUP BY job ORDER BY job; 

-- 업무 별 사원 수가 3명 이상인 업무를 구하라
SELECT job, COUNT(ename) FROM emp GROUP BY job HAVING COUNT(ename)>=3;


-- 업무 그룹 전체 월급이 5000을 초과하는 각 업무와 월급여를 출력하여라.
-- 단, 판매원을 제외하고 월 급여 합계로 내림차순 정렬 하여라

SELECT SUM(sal) 급여합계, job FROM emp
WHERE job NOT IN('SALESMAN') GROUP BY(job) HAVING SUM(sal) >5000
ORDER BY SUM(sal) DESC;

-- 그룹 전체 월금 - SUM(sal) > 5000
-- 판매원 제외 - NOT IN ('SALESMAN')
-- 내림차순 - ORDER BY (sum(sal)) DESC

SELECT job, SUM(sal) FROM emp
WHERE job NOT IN ('SALESMAN')
GROUP BY job HAVING SUM(sal)>5000 
ORDER BY SUM(sal)DESC;


-- ROLLUP   -> 그룹함수 처리 결과 전체에 대한 통계를 구한다.

SELECT job, SUM(sal), ROUND(AVG(sal),0) FROM emp
GROUP BY ROLLUP(job);


-- 부서를 1차 분류하고 부서 내에서 담당업무를 2차 분류하여 사원수 그리고 급여의 합계와 평균을 구하여라.
SELECT deptno, job, COUNT(ename), SUM(sal), AVG(sal) FROM emp
GROUP BY (deptno, job) ORDER BY deptno, job;

-- ROLLUP
SELECT deptno, job, COUNT(ename), SUM(sal), ROUND(AVG(sal),0) FROM emp
GROUP BY ROLLUP(deptno, job) ORDER BY deptno, job;

-- [문제1] 사원번호, 사원명, 담당업무, 입사일, 급여, 보너스, 지급액을 출력하라. 
--                                             단) 지급액은 급여+보너스이다.
--                          yyyy-mm-dd 로 나오게 하기
SELECT empno AS 사원번호, ename AS 사원명, job, TO_CHAR(hiredate,'YYYY-MM-DD') AS 입사일, 
sal AS 급여, NVL(comm,0) AS 보너스, sal+NVL(comm,0) AS 지급액 FROM emp ORDER BY hiredate;


-- [문제2] 사원명, 담당업무, 급여, 보너스를 선택하되 급여가 2500에서 4000불 사이 이거나 담당업무가 
--        SALESMAN인 사원을 급여의 내림차순으로 정렬하여 레코드를 선택하라.

--                                                  단) 보너스가 NULL인 경우 0으로 선택하라.

SELECT  ename, job, sal, NVL(comm,0) FROM emp 
WHERE sal BETWEEN 2500 AND 4000 OR job='SALESMAN'
ORDER BY sal DESC;


-- CUBE() -> 1차 분류 또는 2차 분류에 대하여 통계를 구해준다.
-- 부서별 업무에 대한 사원수, 급여의 합계를 구하라.

SELECT deptno, job AS 업무, count(empno) AS 사원수 , SUM(sal) AS 급여 FROM emp
GROUP BY deptno, job ORDER BY deptno;

SELECT deptno, job AS 업무, count(empno) AS 사원수 , SUM(sal) AS 급여 FROM emp
GROUP BY ROLLUP(deptno, job) ORDER BY deptno;

SELECT deptno, job AS 업무, count(empno) AS 사원수 , SUM(sal) AS 급여 FROM emp
GROUP BY CUBE(deptno, job) ORDER BY deptno;


-- GROUPING() 
-- GROUP BY로 통계가 계산된 경우는 0을 반환한다.
-- ROLLUP() 혹은 CUBE()로 계산된 경우는 1을 반환한다.

-- 부서별 각 업무에 대한 사원수, 급여합계, 최고급여를 선택하라.

SELECT deptno, job, COUNT(empno) AS 사원수, SUM(sal) AS 급여합계, MAX(sal) AS 최고급여, 
GROUPING(deptno) AS DEPT, GROUPING(job) AS 업무
FROM emp
GROUP BY CUBE(deptno, job) ORDER BY deptno;



select * from emp;














