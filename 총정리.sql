-- ������

--ABS(n) -> ���밪 ���

SELECT ABS(-10) Absolute FROM dual;
-- 10


--CEIL(n) -> �ø�
SELECT CEIL(10.1) ceil FROM dual;
-- 11


--FLOOR(n) -> ����
SELECT FLOOR(10.1) FROM dual;
-- 10

--MOD(m,n)-> m�� n���� ������ ���� ���� ��ȯ java�� % ����
SELECT MOD(9,4) FROM dual;
--1


--POWER(m,n) m�� n���� ���
SELECT POWER(4,2) FROM dual;
--16


-- ROUND(n,[m]) ->  �ݿø�
--                  n -> �����Ͱ�
--                  m -> ����� ��� 1�̸� �Ҽ� ù��° �ڸ��� �ι�° �ڸ��� �ݿø�
--                       ������ ��� -1�̸� ���� 1�� �ڸ��� �ݿø� -2�̸� ���� 10�� �ڸ��� �ݿø�
--                                  �Ҽ����� ������ ��?
SELECT ROUND(191.123,1) FROM dual;
SELECT ROUND(191.123,0) FROM dual;


--TURNC(n,[m]) -> ����
SELECT TRUNC(7.5597,2) FROM dual;
--7.55
SELECT TRUNC(7.4444,1) FROM dual;
--7.4


--CONCAT(char1, char2) -> || ������ ����
SELECT CONCAT('Oracle', 'Korea') FROM dual;
--Oracle Korea

--LOWER(char) -> ���ڿ��� �ҹ��ڷ�
SELECT LOWER('ABCDEF') FROM dual;


--UPPER() -> ���ڿ��� �빮�ڷ�
SELECT UPPER('abcdef') FROM dual;


--LPAD([char],  n,   [CHAR2])   -> ���ʿ� ���� �ڸ��� Ư�� ���ڷ� ä����
--      ������   �ڸ���   ä���� ����
SELECT LPAD(ename, 8, '*') FROM emp;

--RPAD(CHAR1, n, [CHAR2])   -> �����ʿ� ���� �ڸ��� Ư�� ���ڷ� ä����
SELECT RPAD(ename, 8, '*') FROM emp;


--SUBSTR(char, m, n) -> m��° �ڸ����� ���̰� n���� ���ڿ� ��ȯ n�� ������ ��� �ڿ��� m��° ���ں��� �ݴ� �������� n�� ��ȯ 
--                                         n ���� ����
SELECT SUBSTR('ABCDEFGHIJK',3) FROM dual;
--CDEFGHIJK

SELECT SUBSTR('ABCDEFGHIJK',3,3) FROM dual;
--CDE

SELECT SUBSTR('ABCDEFGHIJK',-3) FROM dual;
--IJK

SELECT SUBSTR('ABCDEFGHIJK',-3,5) FROM dual;
--IJK


--LENGTH -> ���ڿ��� ���� ����
SELECT LENGTH('ABCDEFGHIJK') FROM dual;


--REPLACE(char1, str1, str2) -> ���ڿ��� Ư�� ���ڸ� �ٸ� ���ڷ� ��ȯ, ��ҹ��� ���� ��
SELECT REPLACE('ABCDEF','C','H') FROM dual;
--ABHDEF

SELECT REPLACE('ABCDEF AND CCCCCC','C','H') FROM dual;
--ABHDEF AND HHHHHH


--INSTR(data, char1, n, m) -> ���ڿ��� ���ԵǾ��ִٸ� �ش� ���ڿ��� ��ġ ��ȯ
--                              �߰����� ������ ���� 0�� ��ȯ�ȴ�.
SELECT INSTR('ABCDEF', 'CD')FROM dual;
--3

-- 7�� ��ġ���� Ž�� ����
SELECT INSTR('ABCDEFABCDEFABCDEF', 'CD',7)FROM dual;
-- 9

-- 7�� ��ġ���� Ž�� ���� �� �ι�° CD ã��
SELECT INSTR('ABCDEFABCDEFABCDEF', 'CD',7,2)FROM dual;
--15






SELECT  FROM dual;


















