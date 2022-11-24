-- pl/Sql�� �̿��� ���ν��� �����
-- ������ ���ڵ尡 1���� ��
-- ���, �̸�, �޿��� �����ϴ� ���ν��� �����

CREATE OR REPLACE PROCEDURE emp_info(p_empno in emp.empno%type) -- �޼ҵ� ����
IS  --���� ����
    s_empno emp.empno%type;
    s_ename emp.ename%type;
    s_sal emp.sal%type;

BEGIN   -- ���๮
    SELECT empno, ename, sal into s_empno, s_ename, s_sal FROM emp WHERE empno=p_empno;
        --����ϱ�
    dbms_output.put_line('�����ȣ -> ' ||s_empno);
    dbms_output.put_line('����� ->' ||s_ename);
    dbms_output.put_line('�޿� ->' ||s_sal);

END;

-- ���ν��� Ȯ���ϱ�
SELECT * FROM user_source;

-- �������� ���� ����� ����ϱ� ���ؼ� set ���ش�.
set serveroutput on;

--���ν��� �����ϱ�
EXECUTE emp_info(7788);

--------------------------------------------------------------------------------
-- �����ȣ�� �Է¹޾� �����ȣ, �����, ������, �Ի���, �޿��� �����Ͽ� ����ϴ� ���ν��� �����

CREATE OR REPLACE PROCEDURE emp_list(i_empno IN emp.empno%type)
IS  -- ���� ����: %rowtype ���̺� �ȿ� ��� �ʵ��� ������ ���������� �� ���� �����Ѵ�.
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

-- �������ϴ� ���ν��� �����
-- �����ȣ, �̸�, �μ���ȣ�� �޾� �������ϱ�.

CREATE OR REPLACE PROCEDURE emp_insert(i_empno IN emp.empno%type, i_ename IN emp.ename%type, i_deptno IN emp.deptno%type)
IS

BEGIN
    INSERT INTO emp(empno, ename, deptno) VALUES(i_empno, i_ename, i_deptno);
    dbms_output.put_line('����� ��ϵǾ����ϴ�.');
END;

EXECUTE emp_insert(5656,'ZZZZ',40);
EXECUTE emp_insert(8888,'tttt',40);
commit;

SELECT * FROM emp;


--out parameter : ���ν������� ó����� ���ν����ܺη� ��������.
-- ��� ��ȣ�� �Է� �޾� ������ �޿��� �������� ���ν����� �ۼ��϶�
CREATE OR REPLACE PROCEDURE emp_find(i_empno in emp.empno%type,
                                     o_ename out emp.ename%type,
                                     o_sal out emp.sal%type)
IS

BEGIN
    SELECT ename, sal into o_ename, o_sal FROM emp WHERE empno=i_empno;
END;

-- ���� �����ϱ�
-- ������� ���� ����
VARIABLE f_ename varchar2(10);

--�޿��� ���� ����
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
