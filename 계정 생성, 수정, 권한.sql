-- ���� ����

CREATE USER goguma IDENTIFIED BY 1234;

SELECT * FROM dba_users;

-- 1. ���� ����
-- admin1, admin2, admin3   ��й�ȣ ������
CREATE USER admin1 IDENTIFIED BY 1234;
CREATE USER admin2 IDENTIFIED BY 1234;

-- 2. ���� ���� 
-- admin1 : connect, resource ����
GRANT connect, resource to admin1;
-- admin2 : �����ڰ�������(dba) ����
GRANT dba, connect, resource to admin2;
-- admin3 : admin2 �������� �����ϱ�
conn admin2/1234;
CREATE USER admin3 IDENTIFIED BY 1234;

-- 3. admin3 ������ ��ױ�
ALTER USER admin3 ACCOUNT LOCK;
-- 4. admin1 ���� �����
DROP USER admin1;
DROP USER goguma;
DROP USER admin2;
DROP USER admin3;
DROP USER samid;










