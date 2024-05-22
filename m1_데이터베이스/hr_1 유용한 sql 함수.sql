select * from employees;

--Q. ����� 120���� ����� ���, �̸�, ����(job_id), ������(job_title)�� ���.
select E.employee_id ���, E.first_name �̸�, E.last_name ��, E.job_id ����, J.job_title ������
from employees E
inner join jobs J on E.job_id = J.job_id
where E.employee_id = 120;

--first_name || ' ' || last_name as �̸� : first_name�� last_name�� �������� �����Ͽ�
--�ϳ��� ���ڿ��� ��ġ��, �� ����� ��Ī�� '�̸�'���� ����
select E.employee_id ���, E.first_name || ' ' || E.last_name �̸�, E.job_id ����, J.job_title ������
from employees E
inner join jobs J on E.job_id = J.job_id
where E.employee_id = 120;

--2005�� ��ݱ⿡ �Ի��� ������� �̸�(Full name)�� �Ի��ϸ� ���
select * from employees;
--date ������ �������� ���������� �д�
select first_name || ' ' || last_name �̸�, hire_date �Ի��� from employees
where to_char(hire_date, 'YY/mm') between '05/01' and '05/06';
--to_char�� ������� �ʴ� ���
select first_name || ' ' || last_name �̸�, hire_date �Ի��� from employees
where hire_date between '05/01/01' and '05/06/30';

--_�� ���ϵ�ī�尡 �ƴ� ���ڷ� ����ϰ� ���� �� escape �ɼ��� ���
select * from employees where job_id like '%\_A%'; --escape��°� ǥ���������
select * from employees where job_id like '%\_A%' escape '\';
select * from employees where job_id like '%#_A%' escape '#'; --\��� #�� escape���ڷ� ����ϰڴٴ� �ǹ�

--IN : OR ��� ���
select * from employees where manager_id = 101 or manager_id = 102 or manager_id = 103;
select * from employees where manager_id in (101, 102, 103);

--Q. ���� SA_MAN, IT_PROG, ST_MAN �� ����� ���
select * from employees where job_id in ('SA_MAN', 'IT_PROG', 'ST_MAN');

--is NULL / is not NULL
--null ���� Ȯ���ϴ� ��� = �� �����ڸ� ������� �ʰ� is null�� ����Ѵ�.
select * from employees where commission_pct is null;
select * from employees where commission_pct is not null;

--order by
--order by �÷��� [ASC | DESC]
select * from employees order by salary asc;
select * from employees order by salary desc;
select * from employees order by salary asc, last_name desc;
select * from employees order by salary, last_name asc;

--dual ���̺�
--mod : ������
select * from employees where mod( employee_id, 2 ) = 1;
select mod(10, 3) from dual;

--round()
select round(355.95555) from dual;
select round(355.95555, 2) from dual;
select round(355.95555, -2) from dual;

--trunc() : ���� �Լ�. ������ �ڸ� �� ���ϸ� ���� ��� ����
select trunc(45.5555, 1) from dual;

--ceil() : �ø� �Լ�. ������ �Ҽ����� �ø��Ͽ� ��ȯ
select ceil(45.111) from dual;

--Q. HR EMPLOYEES ���̺��� �̸�, �޿�, 10% �λ�� �޿��� ����ϼ���.
select first_name || ' ' || last_name �̸�, salary �޿�, salary * 1.1 "�λ�� �޿�" from employees;

--manager_id�� 101���� 103�� ����� ���
--between and : A and B ����
select * from employees where manager_id between 101 and 103;

--Q. employee_id�� Ȧ���� ������ employee_id�� last_name�� ����ϼ���.
select employee_id ���, last_name �� from employees where mod(employee_id, 2) = 1;
select employee_id ���, last_name ��
from employees where employee_id 
in (select employee_id from employees where mod(employee_id, 2) = 1);

--Q. employees ���̺��� commission_pct�� null�� ������ ����ϼ���.
select count(*) from employees where commission_pct is null;

--Q.employees ���̺��� deparment_id�� ���� ������ �����Ͽ� pisition�� '����'���� ����ϼ���.(position�߰�)
--alter table employees add position varchar(30);
--update employees set position = '����' where deparment_id is null;
select employee_id, first_name || ' ' || last_name �̸�, '����' posion
from employees where department_id is null; --��½ÿ��� �÷��� �߰��Ͽ� ���� �� �ִ�.

--���� �ý��� �ð�
select sysdate from dual;
select sysdate + 1 from dual;
select sysdate - 1 from dual;

--�ٹ��� ��¥ ���
--round�� �ƴ� trunc�� ���� ������ round�� �ݿø� trunc�� �ø��̱� ����
select last_name, sysdate, hire_date, trunc(sysdate-hire_date) �ٹ��Ⱓ from employees;

--add_months() Ư�� ���� ���� ���� ��¥�� ���Ѵ�.
select last_name, hire_date, add_months(hire_date, 6) "6������" from employees;

--last_day() : �ش� ���� ������ ��¥�� ��ȯ�ϴ� �Լ�
select last_name, hire_date, last_day(hire_date) from employees;
select last_name, hire_date, last_day(add_months(hire_date,1)) from employees;

--next_day() : �ش� ��¥�� �������� ������ ���� ���Ͽ� �ش��ϴ� ��¥�� ��ȯ
--������ ��~��, 1~7�� ǥ�� ����
select hire_date, next_day(hire_date, '��') from employees;
select hire_date, next_day(hire_date, 2) from employees;

--months_between() : ��¥�� ��¥ ������ ���� �� ��ȯ(���� ���� �Ҽ��� ù° �ڸ����� �ݿø�)
select hire_date, round(months_between(sysdate, hire_date),1) from employees;

--to_date() : ���ڿ��� ��¥�� ����ȯ �ϴ� �Լ�
--'2023-01-01'�̶�� ���ڿ��� ��¥ Ÿ������ ��ȯ
select to_date('2023-01-01', 'YYYY-mm-dd') from dual;

--to_char() : ��¥�� ���ڷ� ��ȯ
select to_char(sysdate, 'YYYY') from dual;
select to_char(sysdate, 'YY-MM-DD HH:MI:SS Day') from dual;
select to_char(hire_date, 'YYYY-MM/DD DY') from employees;
--����
--YYYY       �� �ڸ� ����
--YY      �� �ڸ� ����
--YEAR      ���� ���� ǥ��
--MM      ���� ���ڷ�
--MON      ���� ���ĺ�����
--DD      ���� ���ڷ�
--DAY      ���� ǥ��
--DY      ���� ��� ǥ��
--D      ���� ���� ǥ��
--AM �Ǵ� PM   ���� ����
--HH �Ǵ� HH12   12�ð�
--HH24      24�ð�
--MI      ��
--SS      ��

--Q. ���� ��¥�� 'YYYY/MM/DD' ������ ���ڿ��� ��ȯ�ϼ���.
select to_char(sysdate, 'YYYY/MM/DD') from dual;

--Q. '01-01-2023'�̶�� ���ڿ��� ��¥ Ÿ������ ��ȯ�ϼ���.
select to_date('01-01-2023', 'DD-MM-YYYY') from dual;

--Q. ���� ��¥�� �ð�(sysdate)�� 'YYYY-MM-DD HH24:MI:SS'������ ���ڿ��� ��ȯ�ϼ���.
select to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') from dual;

--Q. '2023-01-01 15:30:00'�̶�� ���ڿ��� ��¥ �� �ð� Ÿ������ ��ȯ�ϼ���.
select to_date('2023-01-01 15:30:00', 'YYYY-MM-DD HH24:MI:SS') from dual;
--�ð� ������ ��µ��� �ʴ� ������ �⺻ ��� ������ ��¥�� ���̵��� �Ǿ��־.
--�ٽ� to_char()�� ��ȯ�ϸ� ���������� ���´�.

select to_char(1111, '99999MI') from dual; --MI�� �����ʿ��� ���
select salary, to_char(salary, '099999') from employees; --���� 0���� ä��
select salary, to_char(-salary, '999999PR') from employees; --������ ǥ��

--1111 -> 1.11E+03
select to_char( 11111, '0.000EEEE' ) from dual;
select to_char(-11111, '9999999MI') from dual;
select to_char(111, '9999999MI') from dual;

--to_char( ���� )   ���ڸ� ���ڷ� ��ȯ
--9      �� �ڸ��� ���� ǥ��      ( 1111, ��99999�� )      1111   
--0      �� �κ��� 0���� ǥ��      ( 1111, ��099999�� )      001111
--$      �޷� ��ȣ�� �տ� ǥ��      ( 1111, ��$99999�� )      $1111
--.      �Ҽ����� ǥ��         ( 1111, ��99999.99�� )      1111.00
--,      Ư�� ��ġ�� , ǥ��      ( 1111, ��99,999�� )      1,111
--MI      �����ʿ� - ��ȣ ǥ��      ( 1111, ��99999MI�� )      1111-
--PR      �������� <>�� ǥ��      ( -1111, ��99999PR�� )      <1111>
--EEEE      ������ ǥ��         ( 1111, ��99.99EEEE�� )      1.11E+03
--V      10�� n�� ���Ѱ����� ǥ��   ( 1111, ��999V99�� )      111100
--B      ������ 0���� ǥ��      ( 1111, ��B9999.99�� )      1111.00
--L      ������ȭ         ( 1111, ��L9999�� )

--width_bucket() : ������, �ּҰ�, �ִ밪, bucket����

--0���� 100������ 10�� ������ ������ ������ 92�� 10��° ������ ���Ѵ�.
select width_bucket( 92, 0, 100, 10 ) from dual;
select width_bucket( 90, 0, 100, 10 ) from dual;
--82�� 10�� ���� �� 9��° ������ ���Ѵ�.
select width_bucket( 82, 0, 100, 10 ) from dual;
--0�� 1��° ������ ���ϳ� 100�� 11��° ������ ���Ѵ�.
select width_bucket( 100, 0, 100, 10 ) from dual;
--���Ĵ� ������ 11����
select width_bucket( 133, 0, 100, 10 ) from dual;

--Q. employees ���̺��� salary�� 5�� ������� ǥ���ϼ���.
select max(salary) max, min(salary) min from employees;
select salary, width_bucket(salary, 2100, 24001, 5) as grade
from employees;

--���� �Լ� character function
--upper()
select lower('Hello World') from dual;
--lower()
select upper('Hello World') from dual;

--Q.last name�� Seo�� ������ last_name�� salary�� ���ϼ���.(Seo, SEO, seo)��� ����
select last_name, salary from employees where lower(last_name) = 'seo';

--initcap() : ù���ڸ� �빮��
select job_id, initcap( job_id ) from employees;

--length() : ���ڿ��� ����
select job_id, length( job_id ) from employees;

--instr() : ���ڿ�, ã�� ����, ã�� ���� ��ġ, ã�� O �� �� ��° �ε����ΰ�
--helloworld�� o��� ���ڸ� ã�µ� 3��°(��)���ں��� ã�� ã�� o�� 2��°���� ���° �ε������� ��ȯ
--**sql�� �ε����� 1���� ����. ���� ����**
--0���� �������� �ϸ� �ȳ��� ����
--���� d�� ã�µ� 2��° ã�� ���ڰ� ������ 0���� ���� ���� (d�� �ϳ���)
select instr('Hello World', 'o', 3, 2) from dual;
select instr('Hello World', 'l', 1, 2) from dual;
select instr('Hello World', 'd', 1, 1) from dual;

--substr() : ���ڿ�, ������ġ, ����
select substr('hello World', 3, 3) from dual; --slice��� : llo
select substr('hello World', 12, 3) from dual; --������ null ��ȯ
select substr('hello World', -5, 3) from dual; -- -�� �ڿ�������


--lpad() : ������ ���� �� ���ʿ� ���ڸ� ä���.
select lpad('hello World', 20, '#') from dual;
select lpad('hello World', 20, '') from dual; -- null��ȯ
select lpad('hello World', 20, ' ') from dual; -- �������� ä��� hello world

--rpad() : ���� ���� �� �����ʿ� ���ڸ� ä���.
select rpad('hello World', 20, '#') from dual;
select rpad('hello World', 20, ' ') from dual;

--ltrim() : �⺻������ ���� ����, ������ �ָ� ���ʿ� ��ġ�� ������ ����
select ltrim('aaaHello Worldaaa', 'a') from dual;
select ltrim('    Hello World    ') from dual;
select ltrim('###Hello Worldaaa', '#') from dual;

--rtrim() : �����ʿ� ��ġ�� ���� ����
--������ �ִٰ� ������ ���������� �ʴ´�. ������ �ִٸ� �� ���ǿ� �ش��ϴ� ���ڸ� ����
select rtrim('aaaHello Worldaaa', 'a') from dual;
select rtrim('   Hello World   ', 'a') from dual;
select rtrim('   Hello World ') from dual;
select rtrim('^^^Hello World^^^', '^') from dual;

--trim() : ������ Ư�� ���� ����
select trim('^' from '^^^Hello World^^^') from dual;
select trim('   Hello World   ') from dual;

select last_name �̸�, ltrim(last_name, 'A') ��ȯ from employees;
--�յ��� Ư�� ���� ���� : �빮�� �ҹ��� ������ �����.
select last_name, trim('A' from last_name) from employees;

--nvl() : null�� 0 �Ǵ� �ٸ� ������ ��ȯ�ϴ� �Լ�
select last_name, manager_id, nvl(department_id, 'dgd') from employees;



