-- DML : SELECT(선택), INSERT(삽입), UPDATE(수정), DELETE(삭제)
-- 사원추가

-- 모든 필드의 값이 존재할 때 - 레코드를 선택했을 때 표시되는 필드 순서와 일치해야한다.
INSERT INTO emp VALUES(2222, '홍킬동', '기획', '7499', sysdate, 1000, 500, 40);

-- 일부의 데이터만 존재할 때 레코드 추가
-- 사원번호 (3333)  NOT NULL이기 때문에 반드시 존재해야함
-- 사원명 (이순신), 급여(20000)
INSERT INTO emp (ename, sal, empno)
VALUES('이순신', 20000, '1545');

-- [문제] dept 테이블에 부서코드(deptno) : 50
--                   부서명(dname): 기획부
--                   위치(loc) : 서울 강남구
--                                          추가하기

INSERT INTO dept(deptno,dname,loc) VALUES (50, '기획부', '강남구');
INSERT INTO dept VALUES (50, '기획부', '강남구');

--------------------------------------------------------------------------------
-- 테이블 복사
-- 기존 테이블의 구조만 복사 가능
-- 기존 테이블의 모든 레코드 또난 일부 레코드 복사 가능
--------------------------------------------------------------------------------

-- emp테이블의 모든 필드와 모든 레코드 복사하기
CREATE TABLE emp2
as
SELECT*FROM EMP;

-- emp 테이블의 일부 필드(사원번호, 사원명, 업무, 급여)와 레코드를 복사하기
CREATE TABLE emp3
AS
SELECT empno, ename, job, sal FROM emp;

-- emp 테이블의 일부 레코드(job=MANAGER OR ANALYST)를 복사하기
CREATE TABLE emp4
AS
SELECT * FROM emp WHERE job IN ('MANAGER', 'ANALYST');

-- emp 테이블의 테이블 구조만 복사하기
CREATE TABLE emp5
AS
SELECT empno, ename, job,sal FROM emp WHERE 1=2;


--emp 모든 필드 * 레코드 (select)
--emp5 레코드는 없고 field는 empno, ename, job, sal이 존재한다. (insert)
INSERT INTO emp5(empno, ename, job, sal)
SELECT empno, ename, job, sal FROM emp;  -- 순서 맞춰야함


--** [Syntax] ***************************************
--* UPDATE table_name
--* SET column1 = 값{(고칠내용), column2 = 값, ....} [* WHERE 조건]
--***************************************************
--WHERE 생략 가능


-- UPDATE -> 테이블 내의 데이터를 1개 이상 수정할 때 사용한다.
-- 이순신의 업무를 인사부로 수정하라.
UPDATE emp 
SET job='인사부' WHERE empno=1545;

-- MANAGER 업무의 사원은 급여를 10% 인상하여라.
UPDATE emp
SET sal=sal*1.1 WHERE job='MANAGER';


-- [문제] 보너스를 받지 않는 사원의 보너스를 급여의 10%로 수정
UPDATE emp
SET comm=sal*0.1 WHERE nvl(comm,0) = 0;




--** [Syntax] ********************************
--* DELETE FROM table_name [WHERE 조건] ; 
--********************************************
-- where 생략 가능

--DELETE -> 레코드를 전체 또는 일부를 삭제한다.
-- comm이 200 미만인 레코드를 삭제하라.

DELETE FROM emp WHERE comm<200;

commit;
--commit 전까지는 임시로 저장이 되어있는 것

SELECT empno, ename, sal, comm FROM emp;


SELECT*FROM dept;
SELECT*FROM emp;
SELECT*FROM emp2;
SELECT*FROM emp3;
SELECT*FROM emp4;
SELECT*FROM emp5;
desc emp5;
SELECT*FROM tab;    -- 테이블 명 확인

DESC EMP;