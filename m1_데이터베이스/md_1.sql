DROP TABLE Book;
CREATE TABLE Book(
bookid NUMBER(2) PRIMARY KEY,
bookname VARCHAR(40),
publisher VARCHAR(40),
price NUMBER(8)
);

INSERT INTO Book VALUES(1, '�౸�� ����', '�½�����', 7000);
INSERT INTO Book VALUES(2, '�౸ �ƴ� ����', '������', 13000);
INSERT INTO Book VALUES(3, '�߱��� �ŷ�', '���ѹ̵��', 11000);

SELECT * FROM Book;
DELETE FROM Book;

commit;