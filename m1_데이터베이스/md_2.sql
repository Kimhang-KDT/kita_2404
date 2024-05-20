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
-- union : 1번을 결과 도출 2번의 결과 도출 후 합하여 출력
select * from book where publisher = '굿스포츠'
union select * from book where publisher = '대한미디어';

--Task2_0517. 출판사가 '굿스포츠' 혹은 '대한미디어'가 아닌 도서를 검색하시오
select * from book where publisher not in ('굿스포츠','대한미디어');

--LIKE : 정확히 '축구의 역사'와 일치하는 행만 선택
select bookname, publisher from book where bookname like '축구의 역사';

--% : 0개 이상의 임의의 문자
--_ : 1개 이상의 임의의 문자

--LIKE %축구% : 축구라는 단어를 포함하고있는 bookname을 선택
select * from book where bookname Like '%축구%';

--LIKE _ : 도서이름의 왼쪽 두번째 위치에 '구'라는 문자열을 갖는 도서 : _로 위치를 표시해준다.
select * from book where bookname Like '_구%';

--Task3_0517. 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 검색하시오.
select * from book where bookname like '%축구%' and price >= 20000;

--ORDER BY : 기본 오름차순 정렬 
select * from book order by bookname, price;
select * from book order by bookid;
select * from book order by price;

--DESC : 내림차순 정렬
select * from book order by price desc;

--Q. 도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 검색하시오
select * from book order by price, bookname;

--AS : 생략가능

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

select custid, count(*) as 도서수량, sum(saleprice) as "총 판매액" from orders where bookid > 5 group by custid;

--Task4_0517. 2번 김연아 고객이 주문한 도서의 총 판매액을 구하시오.
--Oracle Join
select customer.name, orders.custid, count(orders.orderid) as 도서수량, SUM(orders.saleprice) as "총 판매액" from orders, customer where orders.custid = customer.custid and customer.name = '김연아' group by customer.name, orders.custid;
select customer.name, orders.custid, count(*) as 도서수량, SUM(orders.saleprice) as "총 판매액" from orders inner join customer on orders.custid = customer.custid 
where customer.name = '김연아' group by customer.name, orders.custid;
select customer.name, orders.custid, sum(orders.saleprice) as "총 판매액"
from orders, customer
where orders.custid = 2 and orders.custid=customer.custid
group by customer.name, orders.custid;

--Task5_0517. 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하시오. 
--단, 두 권 이상 구매한 고객만 구하시오.
select orders.custid, customer.name, count(*) as 도서수량 from orders inner join customer on orders.custid = customer.custid
where orders.saleprice >= 8000 group by orders.custid, customer.name having count(*) >= 2;

--Task6_0517. 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오.
--Inner Join
select customer.custid, customer.name, orders.saleprice from orders inner join customer on orders.custid = customer.custid order by customer.name;
--book/customer/orders 조인
select customer.name, book.bookid, book.price as "소비자가격", orders.saleprice as "판매가격" from orders, book, customer 
where orders.custid = customer.custid and orders.bookid = book.bookid
order by customer.name, book.price;
--customer/orders 조인
select customer.name, orders.saleprice from orders, customer where orders.custid = customer.custid; --Oracle Join
select customer.name, orders.saleprice from orders inner join customer on orders.custid = customer.custid;
select customer.name, SUM(orders.saleprice) as "총 판매액" from orders inner join customer on orders.custid = customer.custid
group by customer.name order by customer.name;

--Task7_0517. 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하시오.
select customer.custid, customer.name, SUM(orders.saleprice) as "총 판매액" from orders, customer where orders.custid = customer.custid
group by customer.custid, customer.name order by "총 판매액" desc;

--약자처리
select C.name, sum(saleprice) as "총 판매액"
from customer C, orders O
where C.custid = o.custid
group by C.name
order by C.name;

--Q. 고객의 이름과 고객이 주문한 도서의 이름을 구하시오
select C.name, B.bookname as "도서명" from orders O, customer C, book B
where O.custid = C.custid and O.bookid = B.bookid;

--inner join으로 다중조인
select customer.name, book.bookname from orders 
inner join customer on customer.custid = orders.custid
inner join book on book.bookid = orders.bookid;

select customer.name, book.bookname, book.price as "소비자가격", orders.saleprice as "판매가격" from orders, book, customer 
where orders.custid = customer.custid and orders.bookid = book.bookid
order by customer.name, book.price;

--Q. 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 구하시오.
select C.name, B.bookname as "도서명" from orders O, customer C, book B
where O.custid = C.custid and O.bookid = B.bookid and B.price = 20000;

--join은 두 개 이상의 테이블을 연결하여 관련된 데이터를 결합할 때 사용

--내부 조인 : InnerJoin
select customer.name, orders.saleprice
from customer inner join orders on customer.custid = orders.custid;

--왼쪽 외부 조인 Left Outer Join : 두번째 테이블에 위치하는 데이터가 없는 경우 NULL 값이 사용
select customer.name, orders.saleprice from customer left outer join orders on customer.custid = orders.custid;

--오른쪽 외부 조인 Right Outer Join : 첫번째 테이블에 일치하는 데이터가 없는 경우 NULL값이 사용
select customer.name, orders.saleprice from customer right outer join orders on customer.custid = orders.custid;

--Full Outer Join : 일치하는 데이터가 없는 경우 해당 테이블에서는 NULL값이 사용
select customer.name, orders.saleprice from customer full outer join orders on customer.custid= orders.custid;

--Cross Join : 두 테이블 간의 모든 가능한 조합을 생성
select customer.name, orders.saleprice
from customer cross join orders;

--Q. 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하시오(2가지 방법, where, join)
select C.name, O.saleprice from orders O
right outer join customer C on O.custid = C.custid
group by C.name, O.saleprice
order by C.name;

select C.name, O.saleprice from customer C
left outer join orders O on O.custid = C.custid
group by C.name, O.saleprice
order by C.name;

select C.name, O.saleprice
from customer C, orders O
where C.custid = O.custid(+);

--부속 질의
--Q. 도서를 구매한 적이 있는 고객의 이름을 검색하시오.
select name from customer 
where custid in (select custid from orders);

--Q. '대한미디어'에서 출판한 도서를 구매한 고객의 이름을 보이시오.
--join
select name from customer C, orders O, book B 
where C.custid = O.custid and O.bookid = B.bookid 
and B.publisher = '대한미디어';

--부속질의(Sub Query)
select name from customer
where custid in (select custid from orders
where bookid in (select bookid from book
where publisher = '대한미디어'));

--Q. 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오.
select b1.publisher, b1.bookname, b1.price from book b1
where b1.price > (select avg(b2.price) from book b2
where b2.publisher = b1.publisher);

--Q. 도서를 주문하지 않은 고객의 이름을 보이시오.
select name from customer
where custid not in (select custid from orders);

--Q. 주문이 있는 고객의 이름과 주소를 보이시오.
select name 고객명, address 주소 from customer
where custid in (select custid from orders);