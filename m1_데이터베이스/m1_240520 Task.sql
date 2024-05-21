--Task1_0520.10개의 속성으로 구성되는 테이블 2개를 작성, foreign key적용, 각 테이블에 5개씩 데이터 입력
--데이터 삭제까지
create table owner(
id number primary key,
name varchar2(30) not null,
phone number,
sex NVARCHAR2(1) --M / F
);
insert into owner values(1, '홍길동', 01012345678, 'M');
insert into owner values(2, '홍이슬', 01043218765, 'F');
insert into owner values(3, '이진석', 01076432456, 'M');
insert into owner values(4, '박화준', 01028716582, 'M');
insert into owner values(5, '홍길순', 01093827384, 'F');

select * from owner;

create table factory(
id number primary key,
name varchar2(30) not null unique,
address varchar2(100) not null,
phone number not null
);
insert into factory values(1, '롯데제과', '서울특별시 어디구 어디동 저기번지', 028153388);
insert into factory values(2, '농심제과', '서울특별시 어디구 어디동 저기번지', 029378282);
insert into factory values(3, '오리온제과', '서울특별시 어디구 어디동 저기번지', 021238574);
insert into factory values(4, '풀무원', '서울특별시 어디구 어디동 저기번지', 029870462);
insert into factory values(5, '삼립', '서울특별시 어디구 어디동 저기번지', 027841100);

select * from factory;

create table manager(
id number primary key,
name varchar2(30) not null,
phone number not null,
rank varchar2(30) not null, --직급 1:인턴 2:사원 3:주임 4:대리 5:과장
factory_id number not null,
foreign key(factory_id) references factory(id) on delete cascade
);

insert into manager values(1, '김철수', 01082372124, 3, 5);
insert into manager values(2, '김이슬', 01002827835, 2, 1);
insert into manager values(3, '박상순', 01017273492, 4, 4);
insert into manager values(4, '최하늘', 01099211824, 1, 3);
insert into manager values(5, '지은숙', 01084372469, 2, 2);

select * from manager;

create table mart(
id number primary key,
name varchar2(50) not null, --매장명
address varchar2(100) not null,
brn number(13) not null, --사업자등록번호
phone number, --마트전화번호
manager_id number not null, --프로바이저
visited date not null, --바이저 방문일
store_score number not null, --마지막 방문일을 기준으로 한 매장 관리 점수
owner_id number not null,
margin number, --가게 마진률(%)
foreign key(owner_id) references owner(id) on delete cascade,
foreign key(manager_id) references manager(id)
);

insert into mart values(1, '대박나소', '주소1', '8151101028', 028156453, 1, 
to_date('2024-05-20', 'YYYY-MM-DD'), 80, 3, 32);
insert into mart values(2, '대가할인마트', '주소2', '9281932834', 0310381234, 2, 
to_date('2024-05-19', 'YYYY-MM-DD'), 100, 4, 23);
insert into mart values(3, '중앙할인마트', '주소3', '8142345783', 028134654, 3, 
to_date('2024-05-18', 'YYYY-MM-DD'), 78, 2, 20);
insert into mart values(4, 'G마트', '주소4', '8123456723', 029284566, 4, 
to_date('2024-05-17', 'YYYY-MM-DD'), 54, 1, 24);
insert into mart values(5, '다래마트', '주소5', '8928374216', 029872123, 5, 
to_date('2024-05-16', 'YYYY-MM-DD'), 89, 5, 38);

select * from mart;

create table products(
id number primary key,
name varchar2(50) not null,
price number not null,
receipt_date date, --입고일자
expiration_date date, --유통기한
inventory number not null, --재고현황
factory_id number not null, --제조사
mart_id number not null, --마트ID
foreign key(mart_id) references mart(id) on delete cascade,
foreign key(factory_id) references factory(id)
);

insert into products values(1, '두부', 1500, to_date('2024-05-20', 'YYYY-MM-DD'), to_date('2024-05-25', 'YYYY-MM-DD'), 3, 2, 5);
insert into products values(2, '무쌈', 3400, to_date('2024-05-19', 'YYYY-MM-DD'), to_date('2024-07-25', 'YYYY-MM-DD'), 5, 1, 4);
insert into products values(3, '새우깡', 1800, to_date('2024-05-14', 'YYYY-MM-DD'), to_date('2024-08-21', 'YYYY-MM-DD'), 10, 5, 3);
insert into products values(4, '신라면', 1200, to_date('2024-05-20', 'YYYY-MM-DD'), to_date('2024-09-23', 'YYYY-MM-DD'), 62, 4, 1);
insert into products values(5, '우유', 3800, to_date('2024-05-20', 'YYYY-MM-DD'), to_date('2024-05-27', 'YYYY-MM-DD'), 42, 3, 2);

select * from products;
delete from mart where id = 3;
select * from products;
select * from mart;

--Task2_0520. Customer 테이블에서 박세리 고객의 주소를 김연아 고객의 주소로 변경하시오.
select * from customer; --대한민국 대전
update customer set address = (select address from customer where name = '김연아')
where name = '박세리';
select * from customer; --대한민국 서울
rollback;
--Task3_0520. 도서 제목에 ‘야구’가 포함된 도서를 ‘농구’로 변경한 후 도서 목록, 가격을 보이시오.
select bookid, replace(bookname, '야구', '농구') as bookname, publisher, price from book;
update book set bookname = replace(bookname, '야구', '농구') where bookname like '%야구%';

select bookname from book where bookname like '%야구%';
select bookname from book where bookname like '%농구%';

--Task4_0520. 마당서점의 고객 중에서 같은 성(姓)을 가진 사람이 몇 명이나 되는지 성별 인원수를 구하시오
--GROUP BY 절에서는 별칭이 아닌 substr() 표현식 자체를 사용해야한다.
select substr(name, 1, 1) 성, count(name) 인원수 from customer 
group by substr(name, 1,1);

--Task5_0520. 마당서점은 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정일자를 구하시오.
select orderdate 주문일, orderdate+10 확정일자 from orders;

--2개월 후로 주문을 확정한다면? ADD_MONTHS()
select orderdate 주문일, add_months(orderdate, 2) 확정일자 from orders;

--Task6_0520.마당서점이 2020년 7월 7일에 주문받은 도서의 주문번호, 주문일, 고객번호, 도서번호를 모두 보이시오. 
--단 주문일은 ‘yyyy-mm-dd 요일’ 형태로 표시한다.
select orderid 주문번호, custid 고객번호, bookid 도서번호, saleprice 주문금액, 
TO_CHAR(orderdate, 'YYYY-MM-DD DAY') 주문날짜 --한글 인코딩 안될 경우 : 'NLS_DATE_LANGUAGE=KOREAN'
from orders where orderdate = '20-07-07';

--Task7_0520. 평균 주문금액 이하의 주문에 대해서 주문번호와 금액을 보이시오.
select orderid 주문번호, saleprice 금액 from orders
where saleprice < (select avg(saleprice) from orders); 

--Task8_0520. 대한민국’에 거주하는 고객에게 판매한 도서의 총 판매액을 구하시오.
select C.name 고객명, sum(O.saleprice) "총 판매액" from orders O, customer C
where c.address like '%대한민국%'
group by C.name;
