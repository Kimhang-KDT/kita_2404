--job id �� �� ����� �ִ���
select E.job_id, J.job_title, count(E.employee_id)
from employees E
left outer join jobs J on E.job_id = j.job_id
where E.job_id = J.job_id
group by E.job_id, J.job_title;

--job id �� ������� �� �޴��� �� �������� ������ ���
select job_id, ����, round(avg(salary)) ��ձ޿�
from (select job_id, floor(months_between(sysdate, hire_date)/12) ����,
salary from employees)
group by job_id, ����
order by job_id, ����;

--���� hr�� �ִ� 7�� ���̺���� �м��ؼ� �λ������ �ǹ��ִ� �λ���Ʈ 5�� �̻��� ���
1. ������ ���� ����� ����
- ������ ����� ���

--2. location �� �μ���� �ش� �μ��� ������(employees�� manager_id X)
select L.city ����, D.department_name �μ���, E.first_name || ' ' || E.last_name ������
from departments D
join locations L on D.location_id = L.location_id
join employees E on D.manager_id = E.employee_id
where D.manager_id is not null;

3. �μ����� ���� ���� �ٹ��� ������ ��ȸ
with lengths as(
select employee_id, trunc(sysdate - hire_date) �ټӳ�� from employees
order by �ټӳ�� desc
fetch first 1 row only
)
select D.department_name �μ���, E.first_name || ' ' || last_name, 
E.hire_date �Ի���, L.�ټӳ��
from employees E 
join departments D on D.department_id = E.department_id
join lengths L on E.employee_id = L.employee_id;

---------------------------------

with employeetenure as(
select department_id, max(trunc(sysdate-hire_date)) �ִ�ټӳ��
from employees
group by department_id
)
select E.employee_id ���, D.department_name �μ���, E.hire_date �Ի���,
E.first_name || ' ' || E.last_name �����, trunc(T.�ִ�ټӳ��/365) || '��' �ټӳ��
from employees E
join departments D on E.department_id = D.department_id
join employeetenure T on E.department_id = T.department_id
and T.�ִ�ټӳ�� = trunc(sysdate - E.hire_date)
order by T.�ִ�ټӳ��;


4. ��� �޿��� ���� ���� �μ��� ��ġ�� ���� ��ȸ

5. �� �μ��� �ְ�޿��� �޴� ���� ��ȸ
create view highest_salary as
select department_id, salary
order by salary desc
fetch first 1 row only

select * from highest_salary;



--�λ���� ������ ���� kpi(Ű �����ս� �ε���) 2���� �����ϰ� 
--�̰͵��� ���̺���� �����Ϳ� �ݿ��� �� �ٽ� �м��ؼ� �ݿ� ���θ� ���� (�ɼ�)
--1�� ���� ����� 5�� �系 �����Ļ� ����

--employees���� employee_id�� job_id
--job_history������ employee_id�� job_id
--inner join���� ������� employee_id�� job_id ���� ����

with total_by_job as (
    select job_id, count(employee_id) as ������
    from employees 
    group by job_id
),
end_by_job as (
    select job_id, count(employee_id) as �����
    from job_history
    group by job_id
)
select
    T.job_id,
    T.������,
    nvl(E.�����,0),
    round(((E.����� / T.������) * 100),1) || '%' AS �����
from 
    total_by_job T
join 
    end_by_job E on T.job_id = E.job_id;





--employee_benefits�� ���Ͽ� ����� �����Ͱ� ����� ������� �������� end_date�� ����
--��ü ���� �� benefit�� �޴� ������ ���� ���.
--���� ���̴� benefit�� ���� ���̴� benefit ��
