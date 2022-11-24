/* �۰����̺� */
CREATE TABLE author_tbl (
	author_code NUMBER(5) NOT NULL, /* �۰��ڵ� */
	author VARCHAR2(30) NOT NULL, /* �۰��� */
	auth_email VARCHAR2(100), /* �۰��̸��� */
	debue VARCHAR2(100), /* ������ */
	debue_year DATE, /* ���߳⵵ */
	writedate DATE DEFAULT sysdate /* ����� */
);

ALTER TABLE author_tbl
	ADD
		CONSTRAINT PK_author_tbl
		PRIMARY KEY (
			author_code
		);

/* ���ǻ����̺� */
CREATE TABLE pub_tbl (
	pub_code NUMBER(5) NOT NULL, /* ���ǻ��ڵ� */
	publisher VARCHAR2(50) NOT NULL, /* ���ǻ�� */
	pub_tel VARCHAR2(15) NOT NULL, /* ���ǻ���ȭ��ȣ */
	pub_email VARCHAR2(100), /* ���ǻ��̸��� */
	pub_owner VARCHAR2(30), /* ���ǻ��ǥ */
	writedate DATE DEFAULT sysdate
 /* ����� */
);

ALTER TABLE pub_tbl
	ADD
		CONSTRAINT PK_pub_tbl
		PRIMARY KEY (
			pub_code
		);

/* å���̺� */
CREATE TABLE book_tbl (
	isbn NUMBER(13) NOT NULL, /* ������ȣ */
	book_name VARCHAR2(100) NOT NULL, /* å�̸� */
	price NUMBER(7) NOT NULL, /* ���� */
	jenre VARCHAR2(50) NOT NULL, /* �帣 */
	first_pub DATE, /* ������ */
	pages NUMBER(5), /* ���������� */
	author_code NUMBER(5) NOT NULL, /* �۰��ڵ� */
	pub_code NUMBER(5) NOT NULL, /* ���ǻ��ڵ� */
	writedate DATE DEFAULT sysdate /* ����� */
);

ALTER TABLE book_tbl
	ADD
		CONSTRAINT PK_book_tbl
		PRIMARY KEY (
			isbn
		);

ALTER TABLE book_tbl
	ADD
		CONSTRAINT FK_author_tbl_TO_book_tbl
		FOREIGN KEY (
			author_code
		)
		REFERENCES author_tbl (
			author_code
		);

ALTER TABLE book_tbl
	ADD
		CONSTRAINT FK_pub_tbl_TO_book_tbl
		FOREIGN KEY (
			pub_code
		)
		REFERENCES pub_tbl (
			pub_code
		);