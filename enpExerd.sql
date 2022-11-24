/* ������� ���̺� */
CREATE TABLE emp_tbl (
	empno NUMBER(6) NOT NULL, /* ��� */
	name VARCHAR2(20) NOT NULL, /* �̸� */
	department VARCHAR2(20) NOT NULL, /* �μ��� */
	position VARCHAR2(15) NOT NULL, /* ���� */
	sex VARCHAR2(6), /* ���� */
	hiredate DATE NOT NULL, /* ����� */
	resignation DATE /* ����� */
);

ALTER TABLE emp_tbl
	ADD
		CONSTRAINT PK_emp_tbl
		PRIMARY KEY (
			empno
		);

/* ���� ���̺� */
CREATE TABLE position_tbl (
	position VARCHAR2(15) NOT NULL /* ���� */
);

ALTER TABLE position_tbl
	ADD
		CONSTRAINT PK_position_tbl
		PRIMARY KEY (
			position
		);

/* �̸� ���̺� */
CREATE TABLE name_tbl (
	name VARCHAR2(20) NOT NULL, /* �̸� */
	tel VARCHAR2(20) NOT NULL /* ��ȭ��ȣ */
);

ALTER TABLE name_tbl
	ADD
		CONSTRAINT PK_name_tbl
		PRIMARY KEY (
			name
		);

/* �μ��� ���̺� */
CREATE TABLE department_tbl (
	department VARCHAR2(20) NOT NULL, /* �μ��� */
	department_no NUMBER(3) NOT NULL, /* �μ��ڵ� */
	department_tel VARCHAR2(20) /* �μ�����ó */
);

ALTER TABLE department_tbl
	ADD
		CONSTRAINT PK_department_tbl
		PRIMARY KEY (
			department
		);

ALTER TABLE emp_tbl
	ADD
		CONSTRAINT FK_position_tbl_TO_emp_tbl
		FOREIGN KEY (
			position
		)
		REFERENCES position_tbl (
			position
		);

ALTER TABLE emp_tbl
	ADD
		CONSTRAINT FK_name_tbl_TO_emp_tbl
		FOREIGN KEY (
			name
		)
		REFERENCES name_tbl (
			name
		);

ALTER TABLE emp_tbl
	ADD
		CONSTRAINT FK_department_tbl_TO_emp_tbl
		FOREIGN KEY (
			department
		)
		REFERENCES department_tbl (
			department
		);