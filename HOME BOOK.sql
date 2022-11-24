-- �� å���� DB ����

CREATE TABLE BOOK(
NO              varchar2(10)                PRIMARY KEY,
BOOKNAME        varchar2(50),
AUTHOR          varchar2(30)    not null,
PUBLICATION     date,
PAGE            number(10),
PRICE           varchar2(8)
);


INSERT INTO BOOK(NO, BOOKNAME, AUTHOR, PUBLICATION, PAGE, PRICE)
VALUES(NUM.NEXTVAL, '���̾� ��ȭ���� ����', '�����ó� ���̰�', TO_DATE('2012-12-19','YYYY-MM-DD'), '456', '14000');

INSERT INTO BOOK(NO, BOOKNAME, AUTHOR, PUBLICATION, PAGE, PRICE)
VALUES(NUM.NEXTVAL, '������� ���λ��', '�����ó� ���̰�', TO_DATE('2014-09-26','YYYY-MM-DD'), '336', '14800');

INSERT INTO BOOK(NO, BOOKNAME, AUTHOR, PUBLICATION, PAGE, PRICE)
VALUES(NUM.NEXTVAL, '���ö��� ����', '�����ó� ���̰�', TO_DATE('2016-01-11','YYYY-MM-DD'), '524', '14800');

INSERT INTO BOOK(NO, BOOKNAME, AUTHOR, PUBLICATION, PAGE, PRICE)
VALUES(NUM.NEXTVAL, '�����1', '�����ó� ���̰�', TO_DATE('2016-04-06','YYYY-MM-DD'), '592', '16800');

INSERT INTO BOOK(NO, BOOKNAME, AUTHOR, PUBLICATION, PAGE, PRICE)
VALUES(NUM.NEXTVAL, '�����2', '�����ó� ���̰�', TO_DATE('2016-04-06','YYYY-MM-DD'), '536', '16800');

INSERT INTO BOOK(NO, BOOKNAME, AUTHOR, PUBLICATION, PAGE, PRICE)
VALUES(NUM.NEXTVAL, '�� ����', '����ũ ���Ʈ', TO_DATE('2021-01-22','YYYY-MM-DD'), '4304', '140000');

INSERT INTO BOOK(NO, BOOKNAME, AUTHOR, PUBLICATION, PAGE, PRICE)
VALUES(NUM.NEXTVAL, 'Java�� ����', '���ü�', TO_DATE('2016-02-01','YYYY-MM-DD'), '1022', '30000');


CREATE SEQUENCE NUM
START WITH 1
INCREMENT BY 1;

ALTER TABLE BOOK DROP COLUMN NO;

--���̺� �����
DROP TABLE BOOK;

SELECT * FROM BOOK;





CREATE TABLE book_tbl(
    isbn number(13) primary key,
    book_name varchar2(38) not null,
    price number(7) not null,
    jenre varchar2(20) null,
    first_pub date,
    pages number(4),
    author_code number(38) not null,
    pub_code number(10) not null,
    writedate date default sysdate
);

CREATE TABLE pub_tbl(
    pub_code number(10) not null,
    pub_tel varchar2(15),
    pub_email varchar2(100),
    pub_owner varchar2(50),
    publish varchar2(50),
    date date
);

CREATE TABLE author_tbl(
    author_code number(10) not null,
    author varchar2(30),
    auth_email varchar2(100),
    debue_year date,
    debue varchar2(100),
    date date
);




    
    


