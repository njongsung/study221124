/* ������� */
CREATE TABLE employee (
	empno NUMBER(7) NOT NULL, /* �����ȣ */
	username VARCHAR2(30) NOT NULL, /* ����� */
	password VARCHAR2(20) NOT NULL, /* �ÿ���й�ȣ */
	tel VARCHAR2(20), /* ����ó */
	gender VARCHAR2(1), /* ���� */
	hiredate DATE, /* �Ի��� */
	resigndate DATE, /* ����� */
	dept_code NUMBER(4), /* �μ��ڵ� */
	posi_code NUMBER(4), /* �����ڵ� */
	writedate DATE DEFAULT sysdate NOT NULL /* �������� */
);

ALTER TABLE employee
	ADD
		CONSTRAINT PK_employee
		PRIMARY KEY (
			empno
		);

/* �μ����� */
CREATE TABLE department (
	dept_code NUMBER(4) NOT NULL, /* �μ��ڵ� */
	dept_name VARCHAR2(60) NOT NULL, /* �μ��� */
	dept_local VARCHAR2(50), /* �μ���ġ */
	dept_desc VARCHAR2(300), /* �μ����� */
	writedate DATE DEFAULT sysdate
 NOT NULL /* ����� */
);

ALTER TABLE department
	ADD
		CONSTRAINT PK_department
		PRIMARY KEY (
			dept_code
		);

/* �������� */
CREATE TABLE position (
	posi_code NUMBER(4) NOT NULL, /* �����ڵ� */
	posi_name VARCHAR2(30) NOT NULL, /* �����̸� */
	posi_desc VARCHAR2(100), /* ���޼��� */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

ALTER TABLE position
	ADD
		CONSTRAINT PK_position
		PRIMARY KEY (
			posi_code
		);

ALTER TABLE employee
	ADD
		CONSTRAINT FK_department_TO_employee
		FOREIGN KEY (
			dept_code
		)
		REFERENCES department (
			dept_code
		);

ALTER TABLE employee
	ADD
		CONSTRAINT FK_position_TO_employee
		FOREIGN KEY (
			posi_code
		)
		REFERENCES position (
			posi_code
		);