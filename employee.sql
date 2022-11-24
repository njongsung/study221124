/* 사원관리 */
CREATE TABLE employee (
	empno NUMBER(7) NOT NULL, /* 사원번호 */
	username VARCHAR2(30) NOT NULL, /* 사원명 */
	password VARCHAR2(20) NOT NULL, /* 시원비밀번호 */
	tel VARCHAR2(20), /* 연락처 */
	gender VARCHAR2(1), /* 성별 */
	hiredate DATE, /* 입사일 */
	resigndate DATE, /* 퇴사일 */
	dept_code NUMBER(4), /* 부서코드 */
	posi_code NUMBER(4), /* 직급코드 */
	writedate DATE DEFAULT sysdate NOT NULL /* 사원등록일 */
);

ALTER TABLE employee
	ADD
		CONSTRAINT PK_employee
		PRIMARY KEY (
			empno
		);

/* 부서정보 */
CREATE TABLE department (
	dept_code NUMBER(4) NOT NULL, /* 부서코드 */
	dept_name VARCHAR2(60) NOT NULL, /* 부서명 */
	dept_local VARCHAR2(50), /* 부서위치 */
	dept_desc VARCHAR2(300), /* 부서설명 */
	writedate DATE DEFAULT sysdate
 NOT NULL /* 등록일 */
);

ALTER TABLE department
	ADD
		CONSTRAINT PK_department
		PRIMARY KEY (
			dept_code
		);

/* 직급정보 */
CREATE TABLE position (
	posi_code NUMBER(4) NOT NULL, /* 직급코드 */
	posi_name VARCHAR2(30) NOT NULL, /* 직급이름 */
	posi_desc VARCHAR2(100), /* 직급설명 */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
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