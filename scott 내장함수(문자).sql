-- �����Լ� - ����

--CONCAT(CHAR1, CHAR2 ) -> ���ڿ� �����ϱ�
SELECT empno, CONCAT(ename, '��') as ename FROM emp;

--INITCAP(CHAR) -> �� �ܾ��� ù��° ���ڸ� �빮�ڷ� �ٲ��ش�
--                 ������ ������ ������ �ȴ�.
SELECT INITCAP('oracel test') FROM dual;

--UPPER(CHAR)   -> ��� �����ڸ� �빮�ڷ�
SELECT UPPER('oracle function test') FROM emp;

--LOWER(CHAR)   -> ��� �����ڸ� �ҹ��ڷ�
SELECT ename, job, LOWER(ename), LOWER(job) FROM emp;

--LPAD([char],  n,   [CHAR2])   -> ���ʿ� ���� �ڸ��� Ư�� ���ڷ� ä����
--      ������   �ڸ���   ä���� ����
SELECT LPAD(ename, 8, '*') FROM emp;

--RPAD(CHAR1, n, [CHAR2])   -> �����ʿ� ���� �ڸ��� Ư�� ���ڷ� ä����
SELECT RPAD(ename, 8, '*') FROM emp;

SELECT LPAD(ename, 8, '*'), RPAD(ename, 8, '%') FROM emp;

-- SUBSTR(char, n    ,     m)-> ���ڿ����� �Ϻ� ���� ������
--              n=������ġ  m=����

SELECT SUBSTR('hong gildong', 3, 5) FROM dual;
--                           3���� 5��

SELECT SUBSTR('hong gildong', -5, 3) FROM dual;
--                           ���ڿ� �ڿ��� 5��° ���ں��� 3�� ����.

-- LENGTH(char) -> ���� �� ���ϱ�
SELECT ename, LENGTH(ename) FROM emp;

-- �̸��� ���ڱ����� 50%��ŭ ����ϰ� ������ ���ڴ� '*'�� ����϶�.
SELECT  RPAD(SUBSTR(ename,1,CEIL(LENGTH(ename)/2)),LENGTH(ename),'*') AS name1, 
        RPAD(SUBSTR(ename,1,FLOOR(LENGTH(ename)/2)),LENGTH(ename),'*') AS name2 FROM emp;


-- REPLACE (char, str1, str2)   ->  Ư�� ���ڸ� �ٸ� ���ڷ� �����ϱ�
--                                  char�� �� �߿� str1�� str2�� �����Ѵ�.

SELECT ename, REPLACE(ename, 'A', '����') AS Changes FROM emp;

-- INSTR(data, char, str[n,m])    ->   Ư�� ���ڿ��� ��ġ�� ��ȯ�Ѵ�. 
-- str[n(������),m(��°)]�� ��������       �߰����� ���Ѵٸ� 0�� ��ȯ�ȴ�.

SELECT ename, INSTR(ename, 'A') FROM emp;
SELECT ename, INSTR(ename, 'A', 2) FROM emp;
SELECT ename, INSTR(ename, 'T', 1, 2) FROM emp;


--�̸����� �̿��Ͽ� ���̵�� �������� �и��Ͽ���.
--SELECT INSTR('abcdef@google.com','@') FROM dual; <���̵�, ������ ������ �б���
SELECT SUBSTR('ABCABC@GOOGLE.COM',1, INSTR('abcdef@google.com','@')-1) AS ID,
       SUBSTR('ABCABC@GOOGLE.COM',INSTR('abcdef@google.com','@')+1,LENGTH('ABCABC@GOOGLE.COM')) AS DOMAIN
FROM dual;

SELECT SUBSTR ('asdf@naver.com',1,INSTR('asdf@naver.com','@')-1) AS ���̵�,
SUBSTR ('asdf@naver.com', INSTR('asdf@naver.com','@')+1, LENGTH('asdf@naver.com')-INSTR('asdf@naver.com','@')) AS ������
FROM dual;

-- TRIM() ->    ���� ���̵��� Ư������, ���� ����
-- RTRIM() ->   ���� ���̵��� Ư������, ���� ����
-- LTRIM() ->   ������ ���̵��� Ư������, ���� ����

SELECT sal, TRIM(0 FROM sal) FROM emp;
SELECT ename, LTRIM(ename, 'S') FROM emp;
SELECT ename, RTRIM(ename, 'S') FROM emp;


--General function
--DECODE()  -> �����͸� �ٸ� ������ �ٲپ��ش�.

--DECODE (VALUE, F1, THEN1 IF2, THEN2, ...)

-- 10: ��ȹ��, 20: �Ѱ���, 30: �λ��

SELECT ename, deptno, DECODE(deptno, 10, '��ȹ��', 20, '�Ѱ���', 30, '�λ��') AS �μ��� 
FROM emp;


SELECT * FROM emp;
SELECT * FROM dept;











