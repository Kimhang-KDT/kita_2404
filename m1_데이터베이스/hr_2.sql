--job id 별 총 몇명이 있는지
select E.job_id, J.job_title, count(E.employee_id)
from employees E
left outer join jobs J on E.job_id = j.job_id
where E.job_id = J.job_id
group by E.job_id, J.job_title;

--job id 별 몇년차는 얼마 받는지 각 연차별로 샐러리 평균
select job_id, 연차, round(avg(salary)) 평균급여
from (select job_id, floor(months_between(sysdate, hire_date)/12) 연차,
salary from employees)
group by job_id, 연차
order by job_id, 연차;

--현재 hr에 있는 7개 테이블들을 분석해서 인사관리에 의미있는 인사이트 5개 이상을 기술
1. 직무별 직원 퇴사율 추출
- 직무별 퇴사율 계산

--2. location 별 부서명과 해당 부서의 관리자(employees의 manager_id X)
select L.city 도시, D.department_name 부서명, E.first_name || ' ' || E.last_name 관리자
from departments D
join locations L on D.location_id = L.location_id
join employees E on D.manager_id = E.employee_id
where D.manager_id is not null;

3. 부서별로 가장 오래 근무한 직원들 조회
with lengths as(
select employee_id, trunc(sysdate - hire_date) 근속년수 from employees
order by 근속년수 desc
fetch first 1 row only
)
select D.department_name 부서명, E.first_name || ' ' || last_name, 
E.hire_date 입사일, L.근속년수
from employees E 
join departments D on D.department_id = E.department_id
join lengths L on E.employee_id = L.employee_id;

---------------------------------

with employeetenure as(
select department_id, max(trunc(sysdate-hire_date)) 최대근속년수
from employees
group by department_id
)
select E.employee_id 사번, D.department_name 부서명, E.hire_date 입사일,
E.first_name || ' ' || E.last_name 사원명, trunc(T.최대근속년수/365) || '년' 근속년수
from employees E
join departments D on E.department_id = D.department_id
join employeetenure T on E.department_id = T.department_id
and T.최대근속년수 = trunc(sysdate - E.hire_date)
order by T.최대근속년수;


4. 평균 급여가 가장 높은 부서가 위치한 지역 조회

5. 각 부서별 최고급여를 받는 직원 조회
create view highest_salary as
select department_id, salary
order by salary desc
fetch first 1 row only

select * from highest_salary;



--인사관리 개선을 위한 kpi(키 퍼포먼스 인덱스) 2개를 설정하고 
--이것들을 테이블들의 데이터에 반영한 후 다시 분석해서 반영 여부를 검증 (옵션)
--1번 직원 퇴사율 5번 사내 복리후생 관리

--employees에서 employee_id와 job_id
--job_history에서도 employee_id와 job_id
--inner join으로 퇴사자의 employee_id와 job_id 집계 가능

with total_by_job as (
    select job_id, count(employee_id) as 총직원
    from employees 
    group by job_id
),
end_by_job as (
    select job_id, count(employee_id) as 퇴사자
    from job_history
    group by job_id
)
select
    T.job_id,
    T.총직원,
    nvl(E.퇴사자,0),
    round(((E.퇴사자 / T.총직원) * 100),1) || '%' AS 퇴사율
from 
    total_by_job T
join 
    end_by_job E on T.job_id = E.job_id;





--employee_benefits와 비교하여 퇴사자 데이터가 존재시 퇴사일을 기점으로 end_date를 수정
--전체 직원 중 benefit을 받는 직원의 비율 계산.
--많이 쓰이는 benefit과 적게 쓰이는 benefit 비교
