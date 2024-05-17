DROP TABLE Book;
CREATE TABLE Book(
bookid NUMBER(2) PRIMARY KEY,
bookname VARCHAR(40),
publisher VARCHAR(40),
price NUMBER(8)
);

INSERT INTO Book VALUES(1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO Book VALUES(2, '축구 아는 여자', '나무수', 13000);
INSERT INTO Book VALUES(3, '야구의 매력', '대한미디어', 11000);

SELECT * FROM Book;
DELETE FROM Book;

commit;