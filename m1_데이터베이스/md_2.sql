select * from Book;
select * from customer;
select * from orders;
select * from imported_book;

--DISTINCT : �ߺ����� ���
select distinct publisher from book;

--Q. ������ 10,000�� �̻��� ���� �˻�
select * from book where price >= 10000;
select * from book where price >= 10000 and price <= 20000;
select * from book where price between 10000 and 20000;

--Task1_0517. ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��'�� ������ �˻��Ͻÿ�(3�������)
select * from book where publisher = '�½�����' or publisher = '���ѹ̵��'; --(publisher='')�� ��� �ȴ�.
select * from book where publisher in ('�½�����','���ѹ̵��');
-- union : 1���� ��� ���� 2���� ��� ���� �� ���Ͽ� ���
select * from book where publisher = '�½�����'
union select * from book where publisher = '���ѹ̵��';

--Task2_0517. ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��'�� �ƴ� ������ �˻��Ͻÿ�
select * from book where publisher not in ('�½�����','���ѹ̵��');

--LIKE : ��Ȯ�� '�౸�� ����'�� ��ġ�ϴ� �ุ ����
select bookname, publisher from book where bookname like '�౸�� ����';

--% : 0�� �̻��� ������ ����
--_ : 1�� �̻��� ������ ����

--LIKE %�౸% : �౸��� �ܾ �����ϰ��ִ� bookname�� ����
select * from book where bookname Like '%�౸%';

--LIKE _ : �����̸��� ���� �ι�° ��ġ�� '��'��� ���ڿ��� ���� ���� : _�� ��ġ�� ǥ�����ش�.
select * from book where bookname Like '_��%';

--Task3_0517. �౸�� ���� ���� �� ������ 20,000�� �̻��� ������ �˻��Ͻÿ�.
select * from book where bookname like '%�౸%' and price >= 20000;

--ORDER BY : �⺻ �������� ���� 
select * from book order by bookname, price;
select * from book order by bookid;
select * from book order by price;

--DESC : �������� ����
select * from book order by price desc;

--Q. ������ ���ݼ����� �˻��ϰ�, ������ ������ �̸������� �˻��Ͻÿ�
select * from book order by price, bookname;

--AS : ��������

--SUM() AS : �Լ� ��� �� �̸� ����
select SUM(saleprice) AS "�� �Ǹž�" from orders where custid = 2;

--GROUP BY : �����͸� Ư�� ���ؿ� ���� �׷�ȭ�ϴµ� ���. �̸����� ���� �Լ�(SUM, AVG, MAX, MIN, COUNT)�� �̿�
select SUM(saleprice) as total,
avg(saleprice) as average,
min(saleprice) as mininum,
max(saleprice) as maximum
from orders;

--�� �Ǹž� custid �������� �׷�ȭ
select custid, count(*) as ��������, SUM(saleprice) as "�� �Ǹž�"
from orders
where bookid > 5
group by custid;

--HAVING : where �ߺ� ����
-- ���������� 2���� ū ����
select custid, count(*) as ��������, SUM(saleprice) as "�� �Ǹž�" from orders
where bookid > 5
group by custid having count(*) > 2;

select custid, count(*) as ��������, sum(saleprice) as "�� �Ǹž�" from orders where bookid > 5 group by custid;

--Task4_0517. 2�� �迬�� ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�.
--Oracle Join
select customer.name, orders.custid, count(orders.orderid) as ��������, SUM(orders.saleprice) as "�� �Ǹž�" from orders, customer where orders.custid = customer.custid and customer.name = '�迬��' group by customer.name, orders.custid;
select customer.name, orders.custid, count(*) as ��������, SUM(orders.saleprice) as "�� �Ǹž�" from orders inner join customer on orders.custid = customer.custid 
where customer.name = '�迬��' group by customer.name, orders.custid;
select customer.name, orders.custid, sum(orders.saleprice) as "�� �Ǹž�"
from orders, customer
where orders.custid = 2 and orders.custid=customer.custid
group by customer.name, orders.custid;

--Task5_0517. ������ 8,000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �� ������ ���Ͻÿ�. 
--��, �� �� �̻� ������ ���� ���Ͻÿ�.
select orders.custid, customer.name, count(*) as �������� from orders inner join customer on orders.custid = customer.custid
where orders.saleprice >= 8000 group by orders.custid, customer.name having count(*) >= 2;

--Task6_0517. ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�.
--Inner Join
select customer.custid, customer.name, orders.saleprice from orders inner join customer on orders.custid = customer.custid order by customer.name;
--book/customer/orders ����
select customer.name, book.bookid, book.price as "�Һ��ڰ���", orders.saleprice as "�ǸŰ���" from orders, book, customer 
where orders.custid = customer.custid and orders.bookid = book.bookid
order by customer.name, book.price;
--customer/orders ����
select customer.name, orders.saleprice from orders, customer where orders.custid = customer.custid; --Oracle Join
select customer.name, orders.saleprice from orders inner join customer on orders.custid = customer.custid;
select customer.name, SUM(orders.saleprice) as "�� �Ǹž�" from orders inner join customer on orders.custid = customer.custid
group by customer.name order by customer.name;

--Task7_0517. ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, ������ �����Ͻÿ�.
select customer.custid, customer.name, SUM(orders.saleprice) as "�� �Ǹž�" from orders, customer where orders.custid = customer.custid
group by customer.custid, customer.name order by "�� �Ǹž�" desc;

--����ó��
select C.name, sum(saleprice) as "�� �Ǹž�"
from customer C, orders O
where C.custid = o.custid
group by C.name
order by C.name;

--Q. ���� �̸��� ���� �ֹ��� ������ �̸��� ���Ͻÿ�
select C.name, B.bookname as "������" from orders O, customer C, book B
where O.custid = C.custid and O.bookid = B.bookid;

--inner join���� ��������
select customer.name, book.bookname from orders 
inner join customer on customer.custid = orders.custid
inner join book on book.bookid = orders.bookid;

select customer.name, book.bookname, book.price as "�Һ��ڰ���", orders.saleprice as "�ǸŰ���" from orders, book, customer 
where orders.custid = customer.custid and orders.bookid = book.bookid
order by customer.name, book.price;

--Q. ������ 20,000���� ������ �ֹ��� ���� �̸��� ������ �̸��� ���Ͻÿ�.
select C.name, B.bookname as "������" from orders O, customer C, book B
where O.custid = C.custid and O.bookid = B.bookid and B.price = 20000;

--join�� �� �� �̻��� ���̺��� �����Ͽ� ���õ� �����͸� ������ �� ���

--���� ���� : InnerJoin
select customer.name, orders.saleprice
from customer inner join orders on customer.custid = orders.custid;

--���� �ܺ� ���� Left Outer Join : �ι�° ���̺� ��ġ�ϴ� �����Ͱ� ���� ��� NULL ���� ���
select customer.name, orders.saleprice from customer left outer join orders on customer.custid = orders.custid;

--������ �ܺ� ���� Right Outer Join : ù��° ���̺� ��ġ�ϴ� �����Ͱ� ���� ��� NULL���� ���
select customer.name, orders.saleprice from customer right outer join orders on customer.custid = orders.custid;

--Full Outer Join : ��ġ�ϴ� �����Ͱ� ���� ��� �ش� ���̺����� NULL���� ���
select customer.name, orders.saleprice from customer full outer join orders on customer.custid= orders.custid;

--Cross Join : �� ���̺� ���� ��� ������ ������ ����
select customer.name, orders.saleprice
from customer cross join orders;

--Q. ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���Ͻÿ�(2���� ���, where, join)
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

--�μ� ����
--Q. ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�.
select name from customer 
where custid in (select custid from orders);

--Q. '���ѹ̵��'���� ������ ������ ������ ���� �̸��� ���̽ÿ�.
--join
select name from customer C, orders O, book B 
where C.custid = O.custid and O.bookid = B.bookid 
and B.publisher = '���ѹ̵��';

--�μ�����(Sub Query)
select name from customer
where custid in (select custid from orders
where bookid in (select bookid from book
where publisher = '���ѹ̵��'));

--Q. ���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ������ ���Ͻÿ�.
select b1.publisher, b1.bookname, b1.price from book b1
where b1.price > (select avg(b2.price) from book b2
where b2.publisher = b1.publisher);

--Q. ������ �ֹ����� ���� ���� �̸��� ���̽ÿ�.
select name from customer
where custid not in (select custid from orders);

--Q. �ֹ��� �ִ� ���� �̸��� �ּҸ� ���̽ÿ�.
select name ����, address �ּ� from customer
where custid in (select custid from orders);