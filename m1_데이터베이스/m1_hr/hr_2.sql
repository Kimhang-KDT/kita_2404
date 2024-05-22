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
1. 신입직원 유지율 및 직원 이직률 분석
- 부서별 퇴사율 계산
- 근무일 1년 이내 신입 직원의 유지율 분석

2. 직원 프로젝트 및 교육 참여율 분석
- 각 프로젝트의 참여율 및 역할 데이터 분석
- 교육 프로그램 이수율 분석

3. 직원 다향성 지표 분석
- 다양성 지표 (Diversity Metrics)
- 인구 통계 측정(다양성 및 포용성 평가)
- 성별, 인종, 연령대 별 직원 비율 분석

4. 근태 관리 및 결근률 분석
- 출퇴근 시간 기록
- 휴가 및 결근 기록

5. 사내 복리후생 관리
- 사내 복리후생 목록 
- 복지 혜택 사용 내역 기록 및 분석
- 사용 빈도가 높은 혜택과 낮은 혜택 비교

--인사관리 개선을 위한 kpi(키 퍼포먼스 인덱스) 2개를 설정하고 
--이것들을 테이블들의 데이터에 반영한 후 다시 분석해서 반영 여부를 검증 (옵션)
--새 테이블 만들기