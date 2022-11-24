/* 작가테이블 */
CREATE TABLE author_tbl (
	author_code NUMBER(5) NOT NULL, /* 작가코드 */
	author VARCHAR2(30) NOT NULL, /* 작가명 */
	auth_email VARCHAR2(100), /* 작가이메일 */
	debue VARCHAR2(100), /* 데뷔작 */
	debue_year DATE, /* 데뷔년도 */
	writedate DATE DEFAULT sysdate /* 등록일 */
);

ALTER TABLE author_tbl
	ADD
		CONSTRAINT PK_author_tbl
		PRIMARY KEY (
			author_code
		);

/* 출판사테이블 */
CREATE TABLE pub_tbl (
	pub_code NUMBER(5) NOT NULL, /* 출판사코드 */
	publisher VARCHAR2(50) NOT NULL, /* 출판사명 */
	pub_tel VARCHAR2(15) NOT NULL, /* 출판사전화번호 */
	pub_email VARCHAR2(100), /* 출판사이메일 */
	pub_owner VARCHAR2(30), /* 출판사대표 */
	writedate DATE DEFAULT sysdate
 /* 등록일 */
);

ALTER TABLE pub_tbl
	ADD
		CONSTRAINT PK_pub_tbl
		PRIMARY KEY (
			pub_code
		);

/* 책테이블 */
CREATE TABLE book_tbl (
	isbn NUMBER(13) NOT NULL, /* 고유번호 */
	book_name VARCHAR2(100) NOT NULL, /* 책이름 */
	price NUMBER(7) NOT NULL, /* 가격 */
	jenre VARCHAR2(50) NOT NULL, /* 장르 */
	first_pub DATE, /* 출판일 */
	pages NUMBER(5), /* 총페이지수 */
	author_code NUMBER(5) NOT NULL, /* 작가코드 */
	pub_code NUMBER(5) NOT NULL, /* 출판사코드 */
	writedate DATE DEFAULT sysdate /* 등록일 */
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