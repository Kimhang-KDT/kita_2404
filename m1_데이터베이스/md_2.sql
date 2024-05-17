select * from Book;
select * from customer;
select * from orders;
select * from imported_book;

--DISTINCT : 중복없이 출력
select distinct publisher from book;

--Q. 가격이 10,000원 이상인 도서 검색
select * from book where price >= 10000;
select * from book where price >= 10000 and price <= 20000;
select * from book where price between 10000 and 20000;

--Task1_0517. 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색하시오(3가지방법)
select * from book where publisher = '굿스포츠' or publisher = '대한미디어'; --(publisher='')로 묶어도 된다.
select * from book where publisher in ('굿스포츠','대한미디어');

--Task2_0517. 출판사가 '굿스포츠' 혹은 '대한미디어'가 아닌 도서를 검색하시오
select * from book where publisher not in ('굿스포츠','대한미디어');

--LIKE : 정확히 '축구의 역사'와 일치하는 행만 선택
select bookname, publisher from book where bookname like '축구의 역사';

--LIKE %축구% : 축구라는 단어를 포함하고있는 bookname을 선택
select * from book where bookname Like '%축구%';

--LIKE _ : 도서이름의 왼쪽 두번째 위치에 '구'라는 문자열을 갖는 도서 : _로 위치를 표시해준다.
select * from book where bookname Like '_구%';

--Task3_0517. 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 검색하시오.
select * from book where bookname like '%축구%' and price >= 20000;

--ORDER BY : 기본 오름차순 정렬 
select * from book order by bookname;
select * from book order by bookid;
select * from book order by price;

--DESC : 내림차순 정렬
select * from book order by price desc;

--Q. 도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 검색하시오
select * from book order by price, bookname;

--SUM() AS : 함수 사용 및 이름 설정
select SUM(saleprice) AS "총 판매액" from orders where custid = 2;

--GROUP BY : 데이터를 특정 기준에 따라 그룹화하는데 사용. 이를통해 집계 함수(SUM, AVG, MAX, MIN, COUNT)를 이용
select SUM(saleprice) as total,
avg(saleprice) as average,
min(saleprice) as mininum,
max(saleprice) as maximum
from orders;

--총 판매액 custid 기준으로 그룹화
select custid, count(*) as 도서수량, SUM(saleprice) as "총 판매액"
from orders
where bookid > 5
group by custid;

--HAVING : where 중복 적용
-- 도서수량이 2보다 큰 조건
select custid, count(*) as 도서수량, SUM(saleprice) as "총 판매액" from orders
where bookid > 5
group by custid having count(*) > 2;

--Task4_0517. 2번 김연아 고객이 주문한 도서의 총 판매액을 구하시오.
--Oracle Join
select SUM(orders.saleprice) as "총 판매액" from orders, customer where customer.name = '김연아' and orders.custid = customer.custid;
--select SUM(orders.saleprice) as "총 판매액" from orders inner join customer on orders.custid = customer.custid where customer.name = '김연아';

--Task5_0517. 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하시오. 
--단, 두 권 이상 구매한 고객만 구하시오.
select custid, count(*) as 도서수량 from orders where saleprice >= 8000 group by custid having count(*) >= 2;

--Task6_0517. 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오.
--book/customer/orders 조인
select customer.name, book.price from orders, book, customer where orders.custid = customer.custid and orders.bookid = book.bookid;
--customer/orders 조인
select customer.name, orders.saleprice from orders, customer where orders.custid = customer.custid; --Oracle Join
select customer.name, orders.saleprice from orders inner join customer on orders.custid = customer.custid;

--Task7_0517. 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하시오.
select customer.name, SUM(orders.saleprice) as "총 판매액" from orders, customer where orders.custid = customer.custid
group by customer.name order by customer.name;