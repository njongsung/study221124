SELECT * FROM tab;
SELECT * FROM emp;
-- 서브쿼리는 ()내에 기술한다.
-- subquery가 먼저 실행되고 메인 쿼리가 실행된다.
-- 단일행 서브쿼리

-- SCOTT과 같은 부서의 사원은 ?
SELECT deptno FROM emp WHERE ename='SCOTT';
SELECT * FROM emp WHERE deptno=20;
SELECT empno, ename, sal, deptno FROM emp WHERE deptno=(SELECT deptno FROM emp WHERE ename='SCOTT');

-- 평균 급여 이상을 받는 사원은 ?
SELECT ROUND(AVG(sal),0) FROM emp;
SELECT * FROM emp WHERE sal>=2073;
SELECT empno, ename, job, sal FROM emp WHERE sal>=(SELECT ROUND(AVG(sal),0)FROM emp) ORDER BY sal;

--7369 사원과 같은 업무를 하는 사원은 ?
SELECT ename, job FROM emp WHERE job = (SELECT job FROM emp WHERE empno = 7369);

-- SCOOT의 급여보다 급여가 높은 사원의 사번, 이름 ,업무, 급여를 출력하라
SELECT sal FROM emp WHERE ename='SCOTT';
SELECT empno, ename, job, sal FROM emp WHERE sal > 3000;

SELECT empno, ename, job, sal FROM emp
WHERE sal>(SELECT sal FROM emp WHERE ename='SCOTT');


-- 사원테이블에서 사원명, 입사일, 담당업무, 부서코드를 선택하되 'ADAMS'와 같은 업무를 하는 사원이거나
-- 'SCOTT'과 같은 부서인 사원을 선택하라.
SELECT job FROM emp WHERE ename='ADAMS';
SELECT deptno FROM emp WHERE ename='SCOTT';

SELECT ename, hiredate, job, deptno FROM emp 
WHERE job=(SELECT job FROM emp WHERE ename='ADAMS') 
OR deptno=(SELECT deptno FROM emp WHERE ename='SCOTT');


-- 사원테이블에서 사원번호가 7521인 사원가 업무가 같고 급여가 7934인 사원보다 많은
-- 사원의 사번, 이름, 업무, 입사일, 급여를 출력하라
SELECT job FROM emp WHERE empno='7521';
SELECT sal FROM emp WHERE empno='7934';

SELECT empno, ename, job, hiredate, sal FROM emp 
WHERE job=(SELECT job FROM emp WHERE empno='7521') 
AND sal>(SELECT sal FROM emp WHERE empno='7934');


-- subquery에서 그룹함수 사용하기
-- [문제] 담당업무가 "SALESMAN"인 사원의 평균급여보다 적게 받는 사원을 구하여라
SELECT avg(sal) FROM emp WHERE job='SALESMAN';

SELECT ename, hiredate, sal FROM emp WHERE sal<(SELECT avg(sal) FROM emp WHERE job='SALESMAN') ORDER BY sal;


-- having절에 subquery 사용하기
-- having = group by의 결과를 조건절로 사용할 때 쓰는 키워드

-- 사원테이블에서 사원의 급여가 20번 부서의 최소급여보다 많이 받는 부서를 출력하세요.
SELECT deptno, min(sal) FROM emp GROUP BY deptno;

-- 각 부서의 최저급여가 20번 부서의 최저급여보다 높은 부서의 최저급여를 선택하라
SELECT deptno, min(sal) FROM emp GROUP BY deptno
HAVING min(sal)>(SELECT min(sal) FROM emp WHERE deptno=20);


-- [문제] 사원테이블의 사원의 급여가 10번 부서의 평균급여보다 많이 받는 업무와 그 업무의 평균급여를 선택하라.
SELECT job, AVG(sal) FROM emp GROUP BY job
HAVING AVG(sal)>(SELECT AVG(sal) FROM emp WHERE deptno=10);


-- 다중 행 서브쿼리

SELECT empno, ename, sal FROM emp
WHERE sal>(SELECT sal FROM emp WHERE deptno=10);

-- 급여가 3000, 1250, 1300인 사원을 선택하라
SELECT * FROM emp WHERE sal=3000 or sal=1250 or sal=1300;
SELECT * FROM emp WHERE sal IN (3000,1250,1300);


SELECT job, MAX(sal) FROM emp GROUP BY job;

-- 부서 별 최고 급여를 받는 사원을 선택하라.
-- IN 연산자 : 서브쿼리결과가 다중행일 때 or 처리를 한다.
SELECT empno, ename, job, sal, deptno FROM emp
WHERE sal IN (SELECT MAX(sal) FROM emp GROUP BY deptno)
ORDER BY deptno;

--[문제] 업무별로 최대 급여를 받는 사원의 사원번호와 이름, 업무, 급여을 출력하세요.
SELECT empno, ename, job, sal FROM emp
WHERE sal IN (SELECT MAX(sal) FROM emp GROUP BY job)
ORDER BY deptno;

SELECT empno, ename, job, sal FROM emp
WHERE sal IN (SELECT MAX(sal) FROM emp GROUP BY job);



-- ANY 연산자 : 하나의 조건만 만족해도 선택한다.
SELECT sal FROM emp WHERE job='SALESMAN'; -- 1600,1250,1250, 1500

-- 업무가 'SALESMAN'인 사원의 최소급여보다 많으면서 부서번호가 20이 아닌 사원의 이름, 급여, 부서코드를 출력하라.
SELECT ename, sal, job, deptno FROM emp WHERE deptno !=20 AND 
sal >(SELECT MIN(sal) FROM emp WHERE job='SALESMAN');

SELECT ename, sal, job, deptno FROM emp WHERE deptno !=20 AND 
sal > ANY(SELECT sal FROM emp WHERE job='SALESMAN');



--[문제] 사원테이블의 사원 중 KING이 속한 부서의 사원보다 늦게 입사한 사원의 사원명, 업무, 급여, 입사일을 선택하라.
SELECT ename, job, sal, hiredate, deptno FROM emp
WHERE hiredate> ANY(SELECT hiredate FROM emp 
WHERE deptno=(SELECT deptno FROM emp WHERE ename='KING'));


-- ALL 연산자 : 서브쿼리의 결과값이 모두 만족하여야 결과를 선택한다.
SELECT sal FROM emp WHERE job='SALESMAN';
-- 1600, 1250, 1250, 1500

-- 담당업무가 SALESMAN인 사원의 최대급여보다 많은 사원중 20 부서의 사원은 제외하고 
--  사번, 사원명, 담당업무, 급여를 선택하라.

SELECT empno, ename, job, sal FROM emp WHERE deptno != 20 
AND
sal > ALL(SELECT sal FROM emp WHERE job='SALESMAN');

-- EXISTS 연산자 : 서브쿼리의 결과값과 같은 값이 존재하면 선택한다.

SELECT empno, ename, sal, mgr FROM emp e 
WHERE EXISTS(SELECT empno FROM emp WHERE e.empno = mgr);

SELECT empno, ename, sal, mgr FROM emp e 
WHERE EXISTS(SELECT e.empno FROM emp WHERE mgr = e.empno);


-- 다중 열 서브쿼리 : 서브쿼리에서 선택한 레코드가 컬럼이 2개 이상일 때
-- 쌍비교
SELECT sal, deptno FROM emp WHERE deptno=30 AND comm IS NOT NULL;
-- (1600, 30), (1250, 30), (1250, 30), (1500, 30)

SELECT empno, ename, sal, deptno FROM emp 
WHERE (sal, deptno) IN
(SELECT sal, deptno FROM emp WHERE deptno=30 AND comm IS NOT NULL);



-- 업무별 최소 급여를 받는 사원의 사번, 이름, 업무, 부서번호를 출력하라.
--  추가로, 업무별로 정렬하라.
SELECT job, min(sal) from emp group by job;

SELECT empno, ename, job, deptno FROM emp 
WHERE (job, sal) IN (SELECT job, min(sal) FROM emp GROUP BY job)
ORDER BY job;

-- 비쌍비교
SELECT empno, sal, deptno FROM emp
WHERE sal IN (SELECT sal FROM emp WHERE deptno = 30 AND comm IS NOT NULL) 
--1250, 1250, 1500, 1600
AND deptno IN (SELECT deptno FROM emp WHERE deptno = 30 AND comm IS NOT NULL); 
-- 30, 30, 30, 30


-- FROM 절에 사용하는 SUBQUERY - FROM 절에서는 별멍은 "", AS 다 안된다.
SELECT e.ename, e.sal
FROM(SELECT empno, ename, job, sal FROM emp WHERE deptno IN(10, 20)) e;


-- UNION : 합집합 - 중복데이터를 제외한 합집합
SELECT deptno FROM emp
union
SELECT deptno FROM dept;

-- UNION ALL : 합집합 - 중복데이터를 포함한 합집합
SELECT deptno FROM emp
UNION ALL
SELECT deptno FROM dept;

-- INRERSECT : 교집합 : 공통으로 있는 데이터 선택
SELECT deptno FROM emp
INTERSECT
SELECT deptno FROM dept;

-- MINUS : 차집합 : 공통으로 있는 데이터를 제외한 데이터 
SELECT deptno FROM dept
MINUS
SELECT deptno FROM emp;



-- Merge : 레코드가 존재하면 update를 실행하고
--         레코드가 없으면 insert를 실행한다.

-- 테이블 복사

CREATE TABLE emp2 
AS 
SELECT * FROM emp WHERE deptno=10;




MERGE INTO emp2 a -- 생성 또는 업데이트 될 테이블 명
USING emp b 
ON (a.empno=b.empno) -- () 반드시 필요
WHEN MATCHED THEN 
    UPDATE SET sal = sal+2000
WHEN NOT MATCHED THEN
    INSERT VALUES (b.empno, b.ename, b.job, b.mgr, b.hiredate, b.sal, b.comm, b.deptno);


-- CASE문 : IF문
SELECT empno, ename, deptno, 
    CASE deptno
        WHEN 10 THEN '기획부'  -- , 없음
        WHEN 20 THEN '인사부'
        WHEN 30 THEN '총괄부'
        ELSE '총부무'
    END AS "부서명"
FROM emp;
        
SELECT ename,
    CASE 
        WHEN ename LIKE 'AD%' THEN '10%'
        WHEN ename LIKE 'S%' THEN '15%'
        WHEN ename LIKE '%B%' THEN '18%'
        ELSE '20%'
    END
FROM emp;


-- NULLIF(a, b) : a와 b가 같으면 null을 반환한다.
--              : 다르다면 a를 반환한다.
-- a에는 null이 올 수 없다.
SELECT NULLIF(123,123) FROM dual;
SELECT NULLIF(123,456) FROM dual;

SELECT NULLIF(ename, 'SCOTT') FROM emp;

SELECT  CASE WHEN ename='ADAMS'
             THEN NULL
             ELSE ename
        END
FROM emp;


-- COALESCE : NULL 데이터 처리
SELECT comm, COALESCE(comm, 1) FROM emp;

SELECT comm, CASE 
                WHEN comm IS NOT NULL
                THEN 100
                ELSE COALESCE(comm, 50)
             END
FROM emp;













select * from emp;
select * from emp2;
SELECT * from dept;









