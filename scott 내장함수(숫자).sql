-- �����Լ� ����

-- abs() -> ���밪
SELECT ABS(-90) FROM dual;
-- dual -> ���� ���̺� 
-- SELECT ���������� ���̺��� �ʼ������� �����ϱ� ������ ���� ���̺��� �־��ش�.

-- CEIL() -> �ø�
SELECT CEIL(10.1), ceil(-12.1) FROM dual;
--          11          -12

-- floor() -> ����
SELECT FLOOR(10.1), FLOOR(12.9), FLOOR(-12.9) FROM dual;

-- MOD() -> ������ ���ϱ�
SELECT MOD(12, 4), MOD(12,5) FROM dual;

-- ROUND(n,[m]) ->  �ݿø�
--                  n -> ���
--                  m -> ����� ��� 1�̸� �Ҽ� ù��° �ڸ��� �ι�° �ڸ��� �ݿø�
--                       ������ ��� -1�̸� ���� 1�� �ڸ��� �ݿø� -2�̸� ���� 10�� �ڸ��� �ݿø�
--                                  �Ҽ����� ������ ��?
SELECT ROUND(26.3658,1), ROUND(26.3658,2), ROUND(26.3658,-1), ROUND(26.3658,-2)FROM dual;

-- TRUNC(n,m) -> ������ �ڸ������� �� ????
SELECT TRUNC(7.559,2), TRUNC(5254.26,-2) FROM dual;


SELECT sal, MOD(sal,30) FROM emp WHERE deptno=10;

