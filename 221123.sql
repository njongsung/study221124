-- [���չ���] 1. emp ���̺��� ��� ����� ���� �̸�, �μ���ȣ, �μ����� ����ϴ� ������ �ۼ��ϼ���.
-- (�μ���ȣ ������ �������� �����϶�.)

SELECT ename, emp.deptno, dname 
    FROM emp
        JOIN dept1
            ON emp.deptno=dept1.deptno
                ORDER BY emp.deptno;
                
-- [����2] emp ���̺��� NEWYORK���� �ٹ��ϰ� �ִ� ����� ���Ͽ� �̸�, ����, �޿�, �μ����� ����ϴ�
--        SELECT���� �ۼ��ϼ���.

SELECT e.ename, e.job, e.sal, d.dname
    FROM emp e
        JOIN dept1 d 
            ON e.deptno=d.deptno AND d.loc='NEWYORK';
                
                
-- [����3] emp���̺��� ���ʽ��� �޴� ����� ���Ͽ� �̸�, �μ���, ��ġ�� ����ϴ� SELECT���� �ۼ��ϼ���.

SELECT e.ename, d.dname, d.loc 
    FROM emp e 
        JOIN dept1 d 
            ON e.deptno=d.deptno WHERE comm>0;
            
            
-- [����4] emp���̺��� �̸� �� L�� �ִ� ����� ���� �̸�, ����, �μ���, ��ġ�� ����ϴ� ������ �ۼ��϶�

SELECT e.ename, e.job, d.dname, d.loc
    FROM emp e 
        JOIN dept1 d
            ON e.deptno=d.deptno AND e.ename LIKE '%L%';
            

-- [����5] �Ʒ��� ����� ����ϴ� ������ �ۼ��ϼ���
-- (�����ڰ� ���� King�� �����Ͽ� ��� ����� ���)
------------------------------------------------------------------------- 
-- Emplyee  Emp#    Manager Mgr#
-------------------------------------------------------------------------
-- KING     7839
-- BLAKE    7698    KING    7839
-- CKARK    7782    KING    7839
-- ..... 
--------------------------------------------- 14ROWS SELECTED.

SELECT worker.ename AS Employee, worker.empno AS Emp#, manager.ename AS Manager, manager.empno AS MGR#
    FROM emp worker 
        LEFT OUTER JOIN emp manager
            ON worker.mgr=manager.empno;
            
SELECT worker.ename AS Employee, worker.empno AS Emp#, manager.ename AS Manager, manager.empno AS MGR#
    FROM emp worker 
        FULL OUTER JOIN emp manager
            ON worker.mgr=manager.empno;
                

                
SELECT * FROM all_sequences
    WHERE sequence_name='auth_sq';
SELECT * FROM book_tbl;

SELECT * FROM author_tbl;
SELECT * FROM pub_tbl;


-- �۰�

INSERT INTO author_tbl(author_code, author)
VALUES (auth_sq.nextval, '�����ó� ���̰�'); 
INSERT INTO author_tbl(author_code, author)
VALUES (auth_sq.nextval, '����ũ ���Ʈ'); 
INSERT INTO author_tbl(author_code, author)
VALUES (auth_sq.nextval, '���ü�');


-- ���ǻ�

INSERT INTO pub_tbl(pub_code, publisher, pub_tel, pub_owner)
VALUES (pub_sq.nextval, '���빮��', '02-2017-0280', '�迵��');
INSERT INTO pub_tbl(pub_code, publisher, pub_tel)
VALUES (pub_sq.nextval, '����', '02-571-6858');
INSERT INTO pub_tbl(pub_code, publisher, pub_tel,pub_email, pub_owner)
VALUES (pub_sq.nextval, 'Ȳ�ݰ���', '02-515-2000', 'webmaster@minumsa.com', '�ڻ���');
INSERT INTO pub_tbl(pub_code, publisher, pub_tel)
VALUES (pub_sq.nextval, '��������', '02-123-4567');

-- å

INSERT INTO book_tbl(isbn, book_name, price, jenre, first_pub, pages, author_code, pub_code)
VALUES (9788972756194, '���̾� ��ȭ���� ����', 30000, '�Ҽ�', TO_DATE('2012-12-19','YYYY-MM-DD'), 456, 10, 1); 
INSERT INTO book_tbl(isbn, book_name, price, jenre, first_pub, pages, author_code, pub_code)
VALUES (9788990982575, '������� ���λ��', 14800, '�Ҽ�', TO_DATE('2014-09-26','YYYY-MM-DD'), 336, 10, 2); 
INSERT INTO book_tbl(isbn, book_name, price, jenre, first_pub, pages, author_code, pub_code)
VALUES (9788972757573, '���ö��� ����', 14800, '�Ҽ�', TO_DATE('2016-01-11','YYYY-MM-DD'), 524, 10, 1);
INSERT INTO book_tbl(isbn, book_name, price, jenre, first_pub, pages, author_code, pub_code)
VALUES (9788990982612, '�����1', 16800, '�Ҽ�', TO_DATE('2016-04-06','YYYY-MM-DD'), 592, 10, 2); 
INSERT INTO book_tbl(isbn, book_name, price, jenre, first_pub, pages, author_code, pub_code)
VALUES (9788990982629, '�����2', 16800, '�Ҽ�', TO_DATE('2016-04-06','YYYY-MM-DD'), 536, 10, 2); 
INSERT INTO book_tbl(isbn, book_name, price, jenre, first_pub, pages, author_code, pub_code)
VALUES (9791158887605, '�� ����', 140000, '�Ҽ�', TO_DATE('2021-01-22','YYYY-MM-DD'), 4304, 20, 3); 
INSERT INTO book_tbl(isbn, book_name, price, jenre, first_pub, pages, author_code, pub_code)
VALUES (9788994492032, 'Java�� ����', 30000, 'IT', TO_DATE('2016-02-01','YYYY-MM-DD'), 1022, 30, 4); 
