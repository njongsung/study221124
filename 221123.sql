-- [종합문제] 1. emp 테이블에서 모든 사원에 대한 이름, 부서번호, 부서명을 출력하는 문장을 작성하세요.
-- (부서번호 순으로 오름차순 정렬하라.)

SELECT ename, emp.deptno, dname 
    FROM emp
        JOIN dept1
            ON emp.deptno=dept1.deptno
                ORDER BY emp.deptno;
                
-- [문제2] emp 테이블에서 NEWYORK에서 근무하고 있는 사원에 대하여 이름, 업무, 급여, 부서명을 출력하는
--        SELECT문을 작성하세요.

SELECT e.ename, e.job, e.sal, d.dname
    FROM emp e
        JOIN dept1 d 
            ON e.deptno=d.deptno AND d.loc='NEWYORK';
                
                
-- [문제3] emp테이블에서 보너스를 받는 사원에 대하여 이름, 부서명, 위치를 출력하는 SELECT문을 작성하세요.

SELECT e.ename, d.dname, d.loc 
    FROM emp e 
        JOIN dept1 d 
            ON e.deptno=d.deptno WHERE comm>0;
            
            
-- [문제4] emp테이블에서 이름 중 L이 있는 사원에 대해 이름, 업무, 부서명, 위치를 출력하는 문장을 작성하라

SELECT e.ename, e.job, d.dname, d.loc
    FROM emp e 
        JOIN dept1 d
            ON e.deptno=d.deptno AND e.ename LIKE '%L%';
            

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


-- 작가

INSERT INTO author_tbl(author_code, author)
VALUES (auth_sq.nextval, '히가시노 게이고'); 
INSERT INTO author_tbl(author_code, author)
VALUES (auth_sq.nextval, '프랭크 허버트'); 
INSERT INTO author_tbl(author_code, author)
VALUES (auth_sq.nextval, '남궁성');


-- 출판사

INSERT INTO pub_tbl(pub_code, publisher, pub_tel, pub_owner)
VALUES (pub_sq.nextval, '현대문학', '02-2017-0280', '김영정');
INSERT INTO pub_tbl(pub_code, publisher, pub_tel)
VALUES (pub_sq.nextval, '재인', '02-571-6858');
INSERT INTO pub_tbl(pub_code, publisher, pub_tel,pub_email, pub_owner)
VALUES (pub_sq.nextval, '황금가지', '02-515-2000', 'webmaster@minumsa.com', '박상준');
INSERT INTO pub_tbl(pub_code, publisher, pub_tel)
VALUES (pub_sq.nextval, '도우출판', '02-123-4567');

-- 책

INSERT INTO book_tbl(isbn, book_name, price, jenre, first_pub, pages, author_code, pub_code)
VALUES (9788972756194, '나미야 잡화점의 기적', 30000, '소설', TO_DATE('2012-12-19','YYYY-MM-DD'), 456, 10, 1); 
INSERT INTO book_tbl(isbn, book_name, price, jenre, first_pub, pages, author_code, pub_code)
VALUES (9788990982575, '가면산장 살인사건', 14800, '소설', TO_DATE('2014-09-26','YYYY-MM-DD'), 336, 10, 2); 
INSERT INTO book_tbl(isbn, book_name, price, jenre, first_pub, pages, author_code, pub_code)
VALUES (9788972757573, '라플라스의 마녀', 14800, '소설', TO_DATE('2016-01-11','YYYY-MM-DD'), 524, 10, 1);
INSERT INTO book_tbl(isbn, book_name, price, jenre, first_pub, pages, author_code, pub_code)
VALUES (9788990982612, '백야행1', 16800, '소설', TO_DATE('2016-04-06','YYYY-MM-DD'), 592, 10, 2); 
INSERT INTO book_tbl(isbn, book_name, price, jenre, first_pub, pages, author_code, pub_code)
VALUES (9788990982629, '백야행2', 16800, '소설', TO_DATE('2016-04-06','YYYY-MM-DD'), 536, 10, 2); 
INSERT INTO book_tbl(isbn, book_name, price, jenre, first_pub, pages, author_code, pub_code)
VALUES (9791158887605, '듄 전집', 140000, '소설', TO_DATE('2021-01-22','YYYY-MM-DD'), 4304, 20, 3); 
INSERT INTO book_tbl(isbn, book_name, price, jenre, first_pub, pages, author_code, pub_code)
VALUES (9788994492032, 'Java의 정석', 30000, 'IT', TO_DATE('2016-02-01','YYYY-MM-DD'), 1022, 30, 4); 
