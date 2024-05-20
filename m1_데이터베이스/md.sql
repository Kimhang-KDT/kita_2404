--������ Ÿ��
--������ (Numeric Types)
--NUMBER: ���� �������� ���� ������ Ÿ��. ����, �Ǽ�, ���� �Ҽ���, �ε� �Ҽ��� ���� ����
--NUMBER() : default�� - 38,0(�� �ڸ���(precision), �Ҽ��� ���� �ڸ���(scale))
--NUMBER(10) : (10,0), NUMBER(8,2) : �� �ڸ��� 8�� �Ҽ��� ���ϴ� 2
--������ (Character Types)
--VARCHAR2(size): ���� ���� ���ڿ��� ����. size�� �ִ� ���� ���̸� ����Ʈ, Ȥ�� ���ڼ��� ����
--NVARCHAR2(size)�� ����� ������ ���� ����Ʈ ���� ��� �׻� ���� ������ ũ�Ⱑ ����
--CHAR(size): ���� ���� ���ڿ��� ����. ������ ���̺��� ª�� ���ڿ��� �ԷµǸ� �������� �������� ä����
--��¥ �� �ð��� (Date and Time Types)
--DATE: ��¥�� �ð��� ����. ������ Ÿ���� ��, ��, ��, ��, ��, �ʸ� ����
--DATE Ÿ���� ��¥�� �ð��� YYYY-MM-DD HH24:MI:SS �������� �����մϴ�.
--���� ���, 2024�� 5�� 20�� ���� 3�� 45�� 30�ʴ� 2024-05-20 15:45:30���� ����
--TIMESTAMP: ��¥�� �ð��� �� ���� ������ �������� ����
--���� �������� (Binary Data Types)
--BLOB: �뷮�� ���� �����͸� ����. �̹���, ����� ���� ���� �����ϴ� �� ����
--��Ը� ��ü�� (Large Object Types)
--CLOB: �뷮�� ���� �����͸� ����
--NCLOB: �뷮�� ������ ���� ���� �����͸� ����

--���� ���ڵ��� �ǹ�
--��ǻ�ʹ� ���ڷ� �̷���� �����͸� ó��. ���ڵ��� ���� ����(��: 'A', '��', '?')�� 
--����(�ڵ� ����Ʈ)�� ��ȯ�Ͽ� ��ǻ�Ͱ� �����ϰ� ������ �� �ְ� �Ѵ�.
--���� ���, ASCII ���ڵ������� �빮�� 'A'�� 65��, �ҹ��� 'a'�� 97�� ���ڵ�. 
--�����ڵ� ���ڵ������� 'A'�� U+0041, �ѱ� '��'�� U+AC00, �̸�Ƽ�� '?'�� U+1F60A�� ���ڵ�
--�ƽ�Ű�� 7��Ʈ�� ����Ͽ� �� 128���� ���ڸ� ǥ���ϴ� �ݸ� �����ڵ�� �ִ� 1,114,112���� ���ڸ� ǥ��

--ASCII ���ڵ�:
--���� 'A' -> 65 (10����) -> 01000001 (2����)
--���� 'B' -> 66 (10����) -> 01000010 (2����)

--�����ڵ�(UTF-8) ���ڵ�: 
--���� 'A' -> U+0041 -> 41 (16����) -> 01000001 (2����, ASCII�� ����)
--���� '��' -> U+AC00 -> EC 95 80 (16����) -> 11101100 10010101 10000000 (2����)

--CLOB: CLOB�� �Ϲ������� �����ͺ��̽��� �⺻ ���� ����(��: ASCII, LATIN1 ��)�� ����Ͽ� �ؽ�Ʈ �����͸� ����. 
--�� ������ �ַ� ����� ���� ���� ����Ʈ ���ڷ� �̷���� �ؽ�Ʈ�� �����ϴ� �� ���.
--NCLOB: NCLOB�� �����ڵ�(UTF-16)�� ����Ͽ� �ؽ�Ʈ �����͸� ����. ���� �ٱ��� ������ �ʿ��� ��, \
--�� �پ��� ���� ������ �ؽ�Ʈ �����͸� ������ �� ����. �ٱ��� ���ڰ� ���Ե� �����͸� ȿ�������� ó���� �� �ִ�.

--varchar2�� �� ���� ������� ���̸� ���� : ����Ʈ�� ����
-- ���� Ȯ�� ���
select * from v$nls_parameters
where parameter = 'NLS_LENGTH_SEMANTICS';

--�������� : 
--PRIMARY KEY : �� ���� �����ϰ� �ĺ��ϴ� ��(�Ǵ� ������ ����). �ߺ��ǰų� NULL ���� ������� �ʴ´�.
--FOREIGN KEY : �ٸ� ���̺��� �⺻ Ű�� �����ϴ� ��. ���� ���Ἲ�� ����
--UNIQUE : ���� �ߺ��� ���� ����� ���� ����. NULL���� ���
--NOT NULL : ���� NULL ���� ������� �ʴ´�.
--CHECK : �� ���� Ư�� ������ �����ؾ� ���� ���� (��: age > 18)
--DEFAULT : ���� ������� ���� �������� ���� ��� ���� �⺻���� ����

--AUTHOR ���̺� ����
create table authors (
id number primary key,
first_name varchar2(50) not null,
last_name varchar2(50) not null,
nationality varchar2(50)
);
drop table authors;

--Q. newbook�̶�� ���̺��� �����ϼ���.

create table newbook(
bookid number,
isbn number(13),
bookname varchar2(50) not null,
author varchar2(50) not null,
publisher varchar2(30) not null,
price number default 10000 check(price>1000),
published_date date,
primary key(bookid)
);

insert into newbook 
values(1, 9781234567890, 'SQL Guide', 'John Doe', 'TechBooks', 15000, 
TO_DATE('2024-05-20', 'YYYY-MM-DD'
));
select * from newbook;

--���̺� �������� ����, �߰�, �Ӽ� �߰�, ����, ����
alter table newbook modify (isbn varchar2(50));
alter table newbook add author_id number;
alter table newbook drop column author_id;

desc newbook;
delete from newbook;
drop table newbook;

create table newbook(
bookid number primary key,
isbn number(13) not null,
bookname varchar2(50) not null,
author varchar2(50) not null,
publisher varchar2(50) not null,
price number default 10000 check(price > 1000),
published_date date
);

--ON DELETE CASCADE �ɼ��� �����Ǿ� �־�, newcustomer ���̺��� � ���� ���ڵ尡 �����Ǹ�,
--�ش� ���� ��� �ֹ��� neworders ���̺����� �ڵ����� ����
create table newcustomer(
custid number primary key,
name varchar2(40),
address varchar2(40),
phone varchar2(30)
);

create table neworders(
orderid number,
custid number not null,
bookid number not null,
saleprice number,
orderdate date,
primary key(orderid),
foreign key(custid) references newcustomer(custid) on delete cascade);
desc neworders;

--Q. 10���� �Ӽ����� �����Ǵ� ���̺� 2���� �ۼ��ϼ���. �� foreign key�� �����Ͽ� ���� ���̺��� �����͸�
--���� �� �ٸ� ���̺��� ���� �����͵� ��� �����ǵ��� �ϼ���.(��� �������� ���)
--��, �� ���̺� 5���� �����͸� �Է��ϰ� �ι�° ���̺� ù��° �����͸� �����ϴ� �Ӽ��� �����Ͽ� �����ͻ���

