--  JOIN
SELECT * FROM emp;
SELECT * FROM dept1;

DELETE FROM emp WHERE empno IN (7777,888);
COMMIT;

-- emp테이블의 사원명, 급여, dept 테이블의 부서명을 선택하라.
-- equiejoin, 내부조인(Innerjoin): 필드의 값이 같은 데이터를 조인해준다.
--                                조인 대상이 없으면 레코드를 제외한다.
SELECT ename, sal, dname FROM emp, dept1 WHERE emp.deptno=dept1.deptno;
SELECT emp.ename, emp.sal, dept1.dname FROM emp, dept1 WHERE emp.deptno=dept1.deptno;
SELECT e.ename, e.sal, d.dname FROM emp e, dept1 d WHERE e.deptno=d.deptno; -- 별명으로 join

-- JOIN절을 이용하여 조인하기: JOIN 기준은 ON절에 표기한다.
SELECT ename, sal, dname FROM emp JOIN dept1 ON emp.deptno = dept1.deptno;

-- JOIN절과 별명을 이용하여 조인하기
-- 사번, 사원명, 부서코드(emp), 부서코드(dept1), 부서명, 위치를 선택하라

SELECT empno, ename, e.deptno, d.deptno, dname, loc 
FROM emp e JOIN dept1 d ON e.deptno=d.deptno ORDER BY d.deptno;

-- 사번, 사원명, 부서코드(emp), 부서코드(dept1), 부서명, 위치를 선택하라. 단, 20번 부서의 사원은 제외하라.

SELECT empno, ename, e.deptno, d.deptno, dname, loc
FROM emp e JOIN dept1 d ON e.deptno=d.deptno WHERE e.deptno!=20;

-- 사원명, 담당업무, 급여, 부서코드(emp), 부서코드(dept1), 부서명을 선택하라. 
-- 단, 20번 부서의 사원은 제외하고 이름 순으로 정렬하라.
SELECT ename, job,  sal, e.deptno, dname
FROM emp e JOIN dept1 d ON e.deptno=d.deptno WHERE e.deptno!=20 ORDER BY ename;

-- AND 연산자 사용하기
SELECT ename, job, sal, emp.deptno, dname
FROM emp JOIN dept1 ON emp.deptno=dept1.deptno AND emp.deptno!=20
ORDER BY ename;

-- 사원 정보에서 사용할 시퀀스
-- 스퀀스 목록 확인하기 user_sequences

SELECT * FROM user_sequences;
CREATE SEQUENCE emp_sq
START WITH 1000
INCREMENT BY 1000;

CREATE SEQUENCE dept1_sq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE posi_sq
START WITH 1
INCREMENT BY 1;

-- 부서정보 추가
INSERT INTO department(dept_code,dept_name,dept_local) 
VALUES(dept1_sq.NEXTVAL,'인사부','2층 203호');

INSERT INTO department(dept_code,dept_name)
VALUES (dept1_sq.NEXTVAL, '기획부');
SELECT * FROM department;

-- 직급정보 추가
INSERT INTO position(posi_code, posi_name)
VALUES(posi_sq.NEXTVAL,'대표');

INSERT INTO position(posi_code, posi_name,posi_desc)
VALUES(posi_sq.NEXTVAL,'사원','경력 1년 이하 신입');

SELECT * FROM position;

-- 사원 등록

INSERT INTO employee(empno, username, password, dept_code, posi_code)
VALUES (emp_sq.NEXTVAL, '홍킬동','1234', 1, 1);--대표

INSERT INTO employee(empno, username, password, tel, gender, hiredate, dept_code, posi_code)
VALUES (emp_sq.NEXTVAL, '이순신','1234','010-1234-5678','M',sysdate,2,2);



SELECT * FROM employee;

COMMIT;

-- 테이블 3개 조인하기
-- employee        position      department
-- 사원번호, 사원명, 직급, 직급설명, 부서명, 부서위치를 선택하라.

SELECT 
    e.empno AS 사원번호, e.username AS 사원명, 
    p.posi_name AS 직급, p.posi_desc AS 직급설명, 
    d.dept_name AS 부서명, d.dept_local AS 부서위치
FROM employee e 
    JOIN department d ON e.dept_code=d.dept_code
    JOIN position p ON e.posi_code=p.posi_code; -- JOIN 연결 ',' 안씀

-- employee 테이블의 사원명, 연락처, 입사일
-- department 테이블의 부서코드, 부서명, 부서위치
-- position 테이블의 직급코드, 직급명
-- 사원명, 연락처, 부서명, 부서위치, 직급명, 입사일, 부서코드, 직급코드 순서로 선택하고 사원명으로 오름차순 정렬하라.

SELECT e.username AS 이름, e.tel AS 연락처, d.dept_name AS 부서명, d.dept_local AS 부서위치, 
p.posi_name AS 직급, e.hiredate AS 입사일, e.dept_code AS 부서코드, e.posi_code AS 직급코드 
FROM employee e
    JOIN department d ON e.dept_code=d.dept_code
    JOIN position p ON e.posi_code=p.posi_code
ORDER BY username;


--SALESMAN의 사번, 이름, 급여, 부서명, 근무지를 출력하라
SELECT e.empno, e.ename, e.sal, d.dname, d.loc
FROM emp e
    JOIN dept1 d 
        ON e.deptno=d.deptno AND e.JOB='SALESMAN';

SELECT e.empno, e.ename, e.sal, d.dname, d.loc
FROM emp e
    JOIN dept1 d 
        ON e.deptno=d.deptno 
            WHERE e.JOB='SALESMAN';

-- 서브쿼리를 이용한 조인
SELECT e.empno, e.ename, e.sal, d.dname, d.loc
    FROM (SELECT empno, ename, sal, deptno FROM emp WHERE job='SALESMAN') e
        JOIN dept1 d
            ON e.deptno=d.deptno;
            
SELECT * FROM dept1;

SELECT * FROM tab;

SELECT * FROM salgrade;

-- 사원명, 급여, 호봉을 선택하라.

SELECT ename, sal, s.grade
    FROM emp e
        JOIN salgrade s
            ON e.sal BETWEEN s.losal AND s.hisal;
            
-- 10번과 20번 부서의 사원 중 사원명, 담당업무, 급여, 부서명, 부서위치, 호봉을 선택하라
-- emp의 deptno, emp의 sal, losal,hisal


SELECT count(empno) FROM emp WHERE deptno=30;


SELECT e.ename AS 사원명, e.job AS 담당업무, e.sal AS 급여, d.dname AS 부서명, d.loc AS 부서위치, s.grade AS 호봉
    FROM emp e
        JOIN dept1 d
            ON e.deptno=d.deptno
--               WHERE e.deptno IN (10,20)
        JOIN salgrade s
            ON e.sal
                BETWEEN s.losal AND s.hisal;

SELECT e.ename AS 사원명, e.job AS 담당업무, e.sal AS 급여, d.dname AS 부서명, d.loc AS 부서위치, s.grade AS 호봉
    FROM (SELECT ename, job, sal, deptno FROM emp WHERE deptno IN (10,20)) e
        JOIN dept1 d 
            ON e.deptno=d.deptno
        JOIN salgrade s
            ON sal BETWEEN s.losal AND s.hisal;

--------------------------------------------------------------------------------

-- [과제]
-- 작가정보테이블에 작가 최소 3명등록
-- 출판사정보테이블에 출판사 최소 3곳 등록
-- 책정보테이블에 책을 최소 6권 등록

-- 1. 테이블 2개로 조인문제 만들어 풀기
-- 2. 테이블 3개로 조인문제 만들어 풀기

--------------------------------------------------------------------------------


-- self 조인

SELECT e1.empno AS 사번, e1.ename AS 사원명, e1.job AS 담당업무, e1.mgr AS 관리자사번, 
e2.empno AS 관리자사번, e2.ename AS 관리자명, e2.job AS 관리자담당업무
    FROM emp e1 
        JOIN emp e2
            ON e1.mgr = e2.empno;

-- [문제]
--              e1.ename     e2.ename
-- emp테이블에서 ' '의 관리자는 ' '이다는 내용을 출력하라.
SELECT e1.empno AS 사번, e1.ename AS 사원명, e1.mgr AS 관리자사번, e2.ename AS 관리자명
    FROM emp e1
        JOIN emp e2
            ON e1.mgr=e2.empno;

SELECT e1.ename || '의 관리자는 ' || e2.ename ||'이다' 설명 
    FROM emp e1 
            JOIN emp e2
                ON e1.mgr=e2.empno;

-- [문제] 사원명, 급여, 부서명, 관리자명, 입사일, 호봉을 선택하라.

SELECT e1.ename AS 사원명, e1.sal AS 급여, d.dname AS 부서명, e2.ename AS 관리자명, e1.hiredate AS 입사일, s.grade AS 호봉
    FROM (SELECT ename, sal, hiredate, deptno, mgr FROM emp) e1
        JOIN dept1 d
            ON e1.deptno=d.deptno
        JOIN emp e2
            ON e1.mgr=e2.empno
        JOIN salgrade s
            ON e1.sal BETWEEN s.losal AND s.hisal;

SELECT e.ename AS 사원명, e.sal AS 급여, d.dname AS 부서명, e2.ename AS 관리자명, e.hiredate AS 입사일, s.grade AS 호봉
    FROM emp e 
        JOIN dept1 d 
            ON e.deptno=d.deptno
        JOIN emp e2
            ON e.mgr=e2.empno
        JOIN salgrade s
            ON e.sal BETWEEN s.losal AND s.hisal;

SELECT * FROM emp;
SELECT * FROM dept1;


-- outer join : 두 테이블이 조인된 경우 한 쪽 테이블에 레코드가 남을 때
-- left outer join : 두 테이블 중 오른쪽에 null 데이터가 발생할 때
-- right outer join : 두 테이블 중 왼쪽에 null 데이터가 발생할 때
SELECT ename, e.deptno AS 사원부서코드, d.deptno AS 부서코드, dname AS 부서명
    FROM emp e 
        JOIN dept1 d 
            ON e.deptno=d.deptno;       -- 동등 조인

SELECT ename, e.deptno AS 사원부서코드, d.deptno AS 부서코드, dname AS 부서명
    FROM emp e 
        RIGHT OUTER JOIN dept1 d 
            ON e.deptno=d.deptno;       -- RIGHT OUTER JOIN
                                        -- ROJ 기준 왼쪽(FROM)에 NULL 데이터
                                        -- ROJ 기준 오른쪽에 실질 데이터

SELECT ename, e.deptno AS 사원부서코드, d.deptno AS 부서코드, dname AS 부서명
    FROM dept1 d 
        RIGHT OUTER JOIN emp e
            ON e.deptno=d.deptno;

SELECT e.ename AS 사원명, e.sal AS 급여, e.deptno AS 부서코드, dname AS 부서명
    FROM emp e, dept1 d
        WHERE e.deptno=d.deptno;    -- 동등 조인
        
SELECT e.ename AS 사원명, e.sal AS 급여, e.deptno AS 부서코드, dname AS 부서명
    FROM emp e, dept1 d
        WHERE e.deptno(+)=d.deptno; -- '(+)'를 NULL 데이터가 발생하는 테이블에 넣어준다.
        
-- full outer join : null 데이터가 있는 레코드 left, right에 상관없이 무조건 선택해준다.
SELECT DISTINCT (e.deptno), d.deptno
    FROM emp e 
        JOIN dept1 d
            ON e.deptno=d.deptno
                ORDER BY e.deptno;

SELECT DISTINCT (e.deptno), d.deptno
    FROM emp e 
        FULL OUTER JOIN dept1 d
            ON e.deptno=d.deptno
                ORDER BY e.deptno;

SELECT DISTINCT (e.deptno), d.deptno
    FROM dept1 d
        FULL OUTER JOIN emp e
            ON e.deptno=d.deptno
                ORDER BY e.deptno;

--------------------------------------------------------------------------------
-- [문제1] emp테이블에서 모든 사원에 대한 이름, 부서번호, 부서명을 출력하는 문장을 작성하세요.
--                                          (부서번호순으로 오름차순 정렬하라.)

SELECT e.ename, e.deptno, d.dname
    FROM emp e
        JOIN dept1 d
            ON e.deptno=d.deptno
                ORDER BY deptno;
                

-- [문제2] emp테이블에서 NEW YORK에서 근무하고 있는 사원에 대하여 이름, 업무, 급여, 부서명을 출력하는 SELECT문을 작성하세요.

SELECT e.ename, e.job, e.sal, d.dname
    FROM emp e
        JOIN (SELECT dname, loc, deptno FROM dept1 WHERE loc='NEWYORK') d 
            ON e.deptno=d.deptno;


-- [문제3] EMP테이블에서 보너스를 받는 사원에 대하여 이름, 부서명, 위치를 출력하는 SELECT문을 작성하세요.

SELECT e.ename, d.dname, d.loc, e.comm
    FROM (SELECT deptno, sal, ename, comm FROM emp WHERE nvl(comm,0) > 0) e
        JOIN dept1 d
            ON e.deptno=d.deptno;


-- [문제4] EMP테이블에서 이름 중 L자가 있는 사원에 대해 이름, 업무, 부서명, 위치를 출력하는 문장을 작성하세요.

SELECT e.ename, e.job, d.dname, d.loc
    FROM (SELECT ename, job, deptno FROM emp WHERE ename LIKE '%L%') e
        JOIN dept1 d
            ON e.deptno=d.deptno;
            

-- [문제5] 아래의 결과를 출력하는 문장을 작성하세요
-- (관리자가 없는 King을 포함하여 모든 사원을 출력)
------------------------------------------------------------------------- 
-- Emplyee  Emp#    Manager Mgr#
-------------------------------------------------------------------------
-- KING     7839
-- BLAKE    7698    KING    7839
-- CKARK    7782    KING    7839
-- ..... 
--------------------------------------------- 14ROWS SELECTED.

SELECT e1.ename AS Employee, e1.empno AS Emp#, e2.ename AS Manager, e2.empno AS Mgr#
    FROM emp e1
        LEFT OUTER JOIN emp e2
            ON e1.mgr=e2.empno;
            



                

select * from dept1;

