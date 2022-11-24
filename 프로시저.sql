-- pl/Sql을 이용한 프로시저 만들기
-- 선택한 레코드가 1개일 때
-- 사번, 이름, 급여를 선택하는 프로시저 만들기

CREATE OR REPLACE PROCEDURE emp_info(p_empno in emp.empno%type) -- 메소드 개념
IS  --변수 선언
    s_empno emp.empno%type;
    s_ename emp.ename%type;
    s_sal emp.sal%type;

BEGIN   -- 실행문
    SELECT empno, ename, sal into s_empno, s_ename, s_sal FROM emp WHERE empno=p_empno;
        --출력하기
    dbms_output.put_line('사원번호 -> ' ||s_empno);
    dbms_output.put_line('사원명 ->' ||s_ename);
    dbms_output.put_line('급여 ->' ||s_sal);

END;

-- 프로시저 확인하기
SELECT * FROM user_source;

-- 실행결과를 질의 결과에 출력하기 위해서 set 해준다.
set serveroutput on;

--프로시저 실행하기
EXECUTE emp_info(7788);

--------------------------------------------------------------------------------
-- 사원번호를 입력받아 사원번호, 사원명, 담당업무, 입사일, 급여를 선택하여 출력하는 프로시저 만들기

CREATE OR REPLACE PROCEDURE emp_list(i_empno IN emp.empno%type)
IS  -- 변수 선언: %rowtype 테이블 안에 모든 필드의 변수와 데이터형을 한 번에 선언한다.
    r_emp emp%rowtype;

BEGIN
    SELECT empno, ename, job, hiredate, sal 
        into r_emp.empno, r_emp.ename, r_emp.job, r_emp.hiredate, r_emp.sal
            FROM emp
                WHERE empno=i_empno;
                
    dbms_output.put_line(r_emp.empno||', '||r_emp.ename ||', '|| r_emp.job||', '||r_emp.hiredate||', '||r_emp.sal);
END;

EXECUTE emp_list(7839);

SELECT * FROM user_source;

-- 사원등록하는 프로시저 만들기
-- 사원번호, 이름, 부서번호를 받아 사원등록하기.

CREATE OR REPLACE PROCEDURE emp_insert(i_empno IN emp.empno%type, i_ename IN emp.ename%type, i_deptno IN emp.deptno%type)
IS

BEGIN
    INSERT INTO emp(empno, ename, deptno) VALUES(i_empno, i_ename, i_deptno);
    dbms_output.put_line('사원이 등록되었습니다.');
END;

EXECUTE emp_insert(5656,'ZZZZ',40);
EXECUTE emp_insert(8888,'tttt',40);
commit;

SELECT * FROM emp;


--out parameter : 프로시저에서 처리결과 프로시저외부로 내보낸다.
-- 사원 번호를 입력 받아 사원명과 급여를 내보내는 프로시저를 작성하라
CREATE OR REPLACE PROCEDURE emp_find(i_empno in emp.empno%type,
                                     o_ename out emp.ename%type,
                                     o_sal out emp.sal%type)
IS

BEGIN
    SELECT ename, sal into o_ename, o_sal FROM emp WHERE empno=i_empno;
END;

-- 변수 선언하기
-- 사원명을 받을 변수
VARIABLE f_ename varchar2(10);

--급여를 받을 변수
VARIABLE f_sal number;

EXECUTE emp_find(7788, :f_ename, :f_sal);
PRINT f_ename;
PRINT f_sal;

SELECT * FROM emp;
SELECT * FROM tab;
SELECT * FROM employee;
DESC employee;

SELECT * FROM department;
SELECT * FROM position;
