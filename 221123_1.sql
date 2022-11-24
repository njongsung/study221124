-- view 테이블 : 가상테이블
SELECT empno, ename, sal FROM emp;

-- view 생성
-- create or replace : 뷰가 존재하지 않으면 새로 생성하고 존재하면 새로 만든다.

CREATE OR REPLACE VIEW emp_view     --emp_view --> 가상 테이블 이름
    AS SELECT empno, ename, job, sal 
        FROM emp;
        
        
SELECT * FROM tab;
SELECT * FROM emp_view;

-- view를 이용한 레코드 추가 

INSERT INTO emp_view(empno, ename, job, sal)
VALUES (5555,'AAAA', '행정', 3500);

SELECT * FROM emp;

--> 가상테이블을 이용하여 새로운 사원을 등록할 수 있다.

UPDATE emp_view SET job='회계' WHERE empno=7369;

SELECT * FROM emp;

--> 가상테이블을 이용하여 수정을 할 수 있다.

DELETE FROM emp_view WHERE job='MANAGER';

SELECT * FROM emp;

--> 가상테이블을 이용하여 삭제를 할 수 있다.

ROLLBACK;

--> 원상복구

-- VIEW에서 선택만 가능하도록 뷰 생성하기
-- emp 테이블에서 사번, 사원명, 담당업무, 입사일, 급여를 이용하여 읽기 전용 VIEW를 생성

CREATE VIEW emp_view_reader
    AS SELECT empno, ename, job, hiredate, sal
        FROM emp
            WITH READ ONLY;

SELECT * FROM emp_view_reader;

-- emp_view_reader view는 읽기전용 view이므로 select문은 가능하나 insert, update, delete문을 사용하여 레코드를 변경할 수 없다.
INSERT INTO emp_view_reader(empno,ename, job, hiredate, sal)
VALUES (3333,'BBBB','기획', sysdate,4000);

-- 업무별 급여의 합계를 view를 이용하여 구하라.

SELECT job, SUM(sal) FROM emp_view GROUP BY job;
SELECT job, SUM(sal) FROM emp GROUP BY job;

-- 사번, 사원명, 담당업무, 부서코드, 부서명을 이용하여 view 생성하기
-- subquery를 조인하여 view를 생성할 수 있다.

CREATE VIEW emp_dept
    AS SELECT e.empno, e.ename, e.job, e.deptno, d.dname
        FROM emp e
            JOIN dept1 d
                ON e.deptno=d.deptno;
                

                
SELECT * FROM tab;
SELECT * FROM emp_dept;

-- with check option: 조건에 해당하는 레코드만 추가/수정

CREATE VIEW emp_check
    AS SELECT empno, ename, sal, deptno
        FROM emp
            WHERE deptno=20
                WITH CHECK OPTION;
                
SELECT * FROM emp_check;

INSERT INTO emp_check (empno, ename, sal, deptno)
    VALUES(2222,'CCCC',4200,20);

-- deptno=20 WITH CHECK OPTION의 조건 때문에 추가할 수 없음.
INSERT INTO emp_check (empno, ename, sal, deptno)
    VALUES(6666,'DDDD',3800,10);

-- VIEW 확인
SELECT * FROM user_views;

-- VIEW 삭제
DROP VIEW emp_check;
DROP VIEW emp_view;
DROP VIEW emp_view_reader;
DROP VIEW emp_dept;

SELECT * FROM emp_view;
SELECT * FROM emp;

DELETE FROM emp WHERE empno=2222;

SELECT * FROM TAB;

COMMIT;

CONN system/master1234;






