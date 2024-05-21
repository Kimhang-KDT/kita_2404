--Task1_0520.10���� �Ӽ����� �����Ǵ� ���̺� 2���� �ۼ�, foreign key����, �� ���̺� 5���� ������ �Է�
--������ ��������
create table owner(
id number primary key,
name varchar2(30) not null,
phone number,
sex NVARCHAR2(1) --M / F
);
insert into owner values(1, 'ȫ�浿', 01012345678, 'M');
insert into owner values(2, 'ȫ�̽�', 01043218765, 'F');
insert into owner values(3, '������', 01076432456, 'M');
insert into owner values(4, '��ȭ��', 01028716582, 'M');
insert into owner values(5, 'ȫ���', 01093827384, 'F');

select * from owner;

create table factory(
id number primary key,
name varchar2(30) not null unique,
address varchar2(100) not null,
phone number not null
);
insert into factory values(1, '�Ե�����', '����Ư���� ��� ��� �������', 028153388);
insert into factory values(2, '�������', '����Ư���� ��� ��� �������', 029378282);
insert into factory values(3, '����������', '����Ư���� ��� ��� �������', 021238574);
insert into factory values(4, 'Ǯ����', '����Ư���� ��� ��� �������', 029870462);
insert into factory values(5, '�︳', '����Ư���� ��� ��� �������', 027841100);

select * from factory;

create table manager(
id number primary key,
name varchar2(30) not null,
phone number not null,
rank varchar2(30) not null, --���� 1:���� 2:��� 3:���� 4:�븮 5:����
factory_id number not null,
foreign key(factory_id) references factory(id) on delete cascade
);

insert into manager values(1, '��ö��', 01082372124, 3, 5);
insert into manager values(2, '���̽�', 01002827835, 2, 1);
insert into manager values(3, '�ڻ��', 01017273492, 4, 4);
insert into manager values(4, '���ϴ�', 01099211824, 1, 3);
insert into manager values(5, '������', 01084372469, 2, 2);

select * from manager;

create table mart(
id number primary key,
name varchar2(50) not null, --�����
address varchar2(100) not null,
brn number(13) not null, --����ڵ�Ϲ�ȣ
phone number, --��Ʈ��ȭ��ȣ
manager_id number not null, --���ι�����
visited date not null, --������ �湮��
store_score number not null, --������ �湮���� �������� �� ���� ���� ����
owner_id number not null,
margin number, --���� ������(%)
foreign key(owner_id) references owner(id) on delete cascade,
foreign key(manager_id) references manager(id)
);

insert into mart values(1, '��ڳ���', '�ּ�1', '8151101028', 028156453, 1, 
to_date('2024-05-20', 'YYYY-MM-DD'), 80, 3, 32);
insert into mart values(2, '�밡���θ�Ʈ', '�ּ�2', '9281932834', 0310381234, 2, 
to_date('2024-05-19', 'YYYY-MM-DD'), 100, 4, 23);
insert into mart values(3, '�߾����θ�Ʈ', '�ּ�3', '8142345783', 028134654, 3, 
to_date('2024-05-18', 'YYYY-MM-DD'), 78, 2, 20);
insert into mart values(4, 'G��Ʈ', '�ּ�4', '8123456723', 029284566, 4, 
to_date('2024-05-17', 'YYYY-MM-DD'), 54, 1, 24);
insert into mart values(5, '�ٷ���Ʈ', '�ּ�5', '8928374216', 029872123, 5, 
to_date('2024-05-16', 'YYYY-MM-DD'), 89, 5, 38);

select * from mart;

create table products(
id number primary key,
name varchar2(50) not null,
price number not null,
receipt_date date, --�԰�����
expiration_date date, --�������
inventory number not null, --�����Ȳ
factory_id number not null, --������
mart_id number not null, --��ƮID
foreign key(mart_id) references mart(id) on delete cascade,
foreign key(factory_id) references factory(id)
);

insert into products values(1, '�κ�', 1500, to_date('2024-05-20', 'YYYY-MM-DD'), to_date('2024-05-25', 'YYYY-MM-DD'), 3, 2, 5);
insert into products values(2, '����', 3400, to_date('2024-05-19', 'YYYY-MM-DD'), to_date('2024-07-25', 'YYYY-MM-DD'), 5, 1, 4);
insert into products values(3, '�����', 1800, to_date('2024-05-14', 'YYYY-MM-DD'), to_date('2024-08-21', 'YYYY-MM-DD'), 10, 5, 3);
insert into products values(4, '�Ŷ��', 1200, to_date('2024-05-20', 'YYYY-MM-DD'), to_date('2024-09-23', 'YYYY-MM-DD'), 62, 4, 1);
insert into products values(5, '����', 3800, to_date('2024-05-20', 'YYYY-MM-DD'), to_date('2024-05-27', 'YYYY-MM-DD'), 42, 3, 2);

select * from products;
delete from mart where id = 3;
select * from products;
select * from mart;

--Task2_0520. Customer ���̺��� �ڼ��� ���� �ּҸ� �迬�� ���� �ּҷ� �����Ͻÿ�.
select * from customer; --���ѹα� ����
update customer set address = (select address from customer where name = '�迬��')
where name = '�ڼ���';
select * from customer; --���ѹα� ����
rollback;
--Task3_0520. ���� ���� ���߱����� ���Ե� ������ ���󱸡��� ������ �� ���� ���, ������ ���̽ÿ�.
select bookid, replace(bookname, '�߱�', '��') as bookname, publisher, price from book;
update book set bookname = replace(bookname, '�߱�', '��') where bookname like '%�߱�%';

select bookname from book where bookname like '%�߱�%';
select bookname from book where bookname like '%��%';

--Task4_0520. ���缭���� �� �߿��� ���� ��(��)�� ���� ����� �� ���̳� �Ǵ��� ���� �ο����� ���Ͻÿ�
--GROUP BY �������� ��Ī�� �ƴ� substr() ǥ���� ��ü�� ����ؾ��Ѵ�.
select substr(name, 1, 1) ��, count(name) �ο��� from customer 
group by substr(name, 1,1);

--Task5_0520. ���缭���� �ֹ��Ϸκ��� 10�� �� ������ Ȯ���Ѵ�. �� �ֹ��� Ȯ�����ڸ� ���Ͻÿ�.
select orderdate �ֹ���, orderdate+10 Ȯ������ from orders;

--2���� �ķ� �ֹ��� Ȯ���Ѵٸ�? ADD_MONTHS()
select orderdate �ֹ���, add_months(orderdate, 2) Ȯ������ from orders;

--Task6_0520.���缭���� 2020�� 7�� 7�Ͽ� �ֹ����� ������ �ֹ���ȣ, �ֹ���, ����ȣ, ������ȣ�� ��� ���̽ÿ�. 
--�� �ֹ����� ��yyyy-mm-dd ���ϡ� ���·� ǥ���Ѵ�.
select orderid �ֹ���ȣ, custid ����ȣ, bookid ������ȣ, saleprice �ֹ��ݾ�, 
TO_CHAR(orderdate, 'YYYY-MM-DD DAY') �ֹ���¥ --�ѱ� ���ڵ� �ȵ� ��� : 'NLS_DATE_LANGUAGE=KOREAN'
from orders where orderdate = '20-07-07';

--Task7_0520. ��� �ֹ��ݾ� ������ �ֹ��� ���ؼ� �ֹ���ȣ�� �ݾ��� ���̽ÿ�.
select orderid �ֹ���ȣ, saleprice �ݾ� from orders
where saleprice < (select avg(saleprice) from orders); 

--Task8_0520. ���ѹα����� �����ϴ� ������ �Ǹ��� ������ �� �Ǹž��� ���Ͻÿ�.
select C.name ����, sum(O.saleprice) "�� �Ǹž�" from orders O, customer C
where c.address like '%���ѹα�%'
group by C.name;
