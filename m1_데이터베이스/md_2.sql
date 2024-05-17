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

--Task2_0517. ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��'�� �ƴ� ������ �˻��Ͻÿ�
select * from book where publisher not in ('�½�����','���ѹ̵��');

--LIKE : ��Ȯ�� '�౸�� ����'�� ��ġ�ϴ� �ุ ����
select bookname, publisher from book where bookname like '�౸�� ����';

--LIKE %�౸% : �౸��� �ܾ �����ϰ��ִ� bookname�� ����
select * from book where bookname Like '%�౸%';

--LIKE _ : �����̸��� ���� �ι�° ��ġ�� '��'��� ���ڿ��� ���� ���� : _�� ��ġ�� ǥ�����ش�.
select * from book where bookname Like '_��%';

--Task3_0517. �౸�� ���� ���� �� ������ 20,000�� �̻��� ������ �˻��Ͻÿ�.
select * from book where bookname like '%�౸%' and price >= 20000;

--ORDER BY : �⺻ �������� ���� 
select * from book order by bookname;
select * from book order by bookid;
select * from book order by price;

--DESC : �������� ����
select * from book order by price desc;

--Q. ������ ���ݼ����� �˻��ϰ�, ������ ������ �̸������� �˻��Ͻÿ�
select * from book order by price, bookname;

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

--Task4_0517. 2�� �迬�� ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�.
--Oracle Join
select SUM(orders.saleprice) as "�� �Ǹž�" from orders, customer where customer.name = '�迬��' and orders.custid = customer.custid;
--select SUM(orders.saleprice) as "�� �Ǹž�" from orders inner join customer on orders.custid = customer.custid where customer.name = '�迬��';

--Task5_0517. ������ 8,000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �� ������ ���Ͻÿ�. 
--��, �� �� �̻� ������ ���� ���Ͻÿ�.
select custid, count(*) as �������� from orders where saleprice >= 8000 group by custid having count(*) >= 2;

--Task6_0517. ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�.
--book/customer/orders ����
select customer.name, book.price from orders, book, customer where orders.custid = customer.custid and orders.bookid = book.bookid;
--customer/orders ����
select customer.name, orders.saleprice from orders, customer where orders.custid = customer.custid; --Oracle Join
select customer.name, orders.saleprice from orders inner join customer on orders.custid = customer.custid;

--Task7_0517. ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, ������ �����Ͻÿ�.
select customer.name, SUM(orders.saleprice) as "�� �Ǹž�" from orders, customer where orders.custid = customer.custid
group by customer.name order by customer.name;