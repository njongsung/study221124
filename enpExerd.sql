/* 사원관리 테이블 */
CREATE TABLE emp_tbl (
	empno NUMBER(6) NOT NULL, /* 사번 */
	name VARCHAR2(20) NOT NULL, /* 이름 */
	department VARCHAR2(20) NOT NULL, /* 부서명 */
	position VARCHAR2(15) NOT NULL, /* 직급 */
	sex VARCHAR2(6), /* 성별 */
	hiredate DATE NOT NULL, /* 고용일 */
	resignation DATE /* 퇴사일 */
);

ALTER TABLE emp_tbl
	ADD
		CONSTRAINT PK_emp_tbl
		PRIMARY KEY (
			empno
		);

/* 직급 테이블 */
CREATE TABLE position_tbl (
	position VARCHAR2(15) NOT NULL /* 직급 */
);

ALTER TABLE position_tbl
	ADD
		CONSTRAINT PK_position_tbl
		PRIMARY KEY (
			position
		);

/* 이름 테이블 */
CREATE TABLE name_tbl (
	name VARCHAR2(20) NOT NULL, /* 이름 */
	tel VARCHAR2(20) NOT NULL /* 전화번호 */
);

ALTER TABLE name_tbl
	ADD
		CONSTRAINT PK_name_tbl
		PRIMARY KEY (
			name
		);

/* 부서명 테이블 */
CREATE TABLE department_tbl (
	department VARCHAR2(20) NOT NULL, /* 부서명 */
	department_no NUMBER(3) NOT NULL, /* 부서코드 */
	department_tel VARCHAR2(20) /* 부서연락처 */
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