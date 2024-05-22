select * from employees;

--Q. 사번이 120번인 사람의 사번, 이름, 업무(job_id), 업무명(job_title)을 출력.
select E.employee_id 사번, E.first_name 이름, E.last_name 성, E.job_id 업무, J.job_title 업무명
from employees E
inner join jobs J on E.job_id = J.job_id
where E.employee_id = 120;

--first_name || ' ' || last_name as 이름 : first_name과 last_name을 공백으로 연결하여
--하나의 문자열로 합치고, 이 결과의 별칭을 '이름'으로 지정
select E.employee_id 사번, E.first_name || ' ' || E.last_name 이름, E.job_id 업무, J.job_title 업무명
from employees E
inner join jobs J on E.job_id = J.job_id
where E.employee_id = 120;

--2005년 상반기에 입사한 사람들의 이름(Full name)만 입사일만 출력
select * from employees;
--date 포맷은 생각보다 지원범위가 넓다
select first_name || ' ' || last_name 이름, hire_date 입사일 from employees
where to_char(hire_date, 'YY/mm') between '05/01' and '05/06';
--to_char를 사용하지 않는 경우
select first_name || ' ' || last_name 이름, hire_date 입사일 from employees
where hire_date between '05/01/01' and '05/06/30';

--_을 와일드카드가 아닌 문자로 취급하고 싶을 때 escape 옵션을 사용
select * from employees where job_id like '%\_A%'; --escape라는걸 표시해줘야함
select * from employees where job_id like '%\_A%' escape '\';
select * from employees where job_id like '%#_A%' escape '#'; --\대신 #을 escape문자로 사용하겠다는 의미

--IN : OR 대신 사용
select * from employees where manager_id = 101 or manager_id = 102 or manager_id = 103;
select * from employees where manager_id in (101, 102, 103);

--Q. 업무 SA_MAN, IT_PROG, ST_MAN 인 사람만 출력
select * from employees where job_id in ('SA_MAN', 'IT_PROG', 'ST_MAN');

--is NULL / is not NULL
--null 값을 확인하는 경우 = 비교 연산자를 사용하지 않고 is null을 사용한다.
select * from employees where commission_pct is null;
select * from employees where commission_pct is not null;

--order by
--order by 컬럼명 [ASC | DESC]
select * from employees order by salary asc;
select * from employees order by salary desc;
select * from employees order by salary asc, last_name desc;
select * from employees order by salary, last_name asc;

--dual 테이블
--mod : 나머지
select * from employees where mod( employee_id, 2 ) = 1;
select mod(10, 3) from dual;

--round()
select round(355.95555) from dual;
select round(355.95555, 2) from dual;
select round(355.95555, -2) from dual;

--trunc() : 버림 함수. 지정한 자리 수 이하를 버린 결과 제공
select trunc(45.5555, 1) from dual;

--ceil() : 올림 함수. 무조건 소수점을 올림하여 반환
select ceil(45.111) from dual;

--Q. HR EMPLOYEES 테이블에서 이름, 급여, 10% 인상된 급여를 출력하세요.
select first_name || ' ' || last_name 이름, salary 급여, salary * 1.1 "인상된 급여" from employees;

--manager_id가 101에서 103인 사람만 출력
--between and : A and B 사이
select * from employees where manager_id between 101 and 103;

--Q. employee_id가 홀수인 직원의 employee_id와 last_name을 출력하세요.
select employee_id 사번, last_name 성 from employees where mod(employee_id, 2) = 1;
select employee_id 사번, last_name 성
from employees where employee_id 
in (select employee_id from employees where mod(employee_id, 2) = 1);

--Q. employees 테이블에서 commission_pct의 null값 갯수를 출력하세요.
select count(*) from employees where commission_pct is null;

--Q.employees 테이블에서 deparment_id가 없는 직원을 추출하여 pisition을 '신입'으로 출력하세요.(position추가)
--alter table employees add position varchar(30);
--update employees set position = '신입' where deparment_id is null;
select employee_id, first_name || ' ' || last_name 이름, '신입' posion
from employees where department_id is null; --출력시에만 컬럼을 추가하여 보일 수 있다.

--현재 시스템 시간
select sysdate from dual;
select sysdate + 1 from dual;
select sysdate - 1 from dual;

--근무한 날짜 계산
--round가 아닌 trunc를 쓰는 이유는 round는 반올림 trunc는 올림이기 때문
select last_name, sysdate, hire_date, trunc(sysdate-hire_date) 근무기간 from employees;

--add_months() 특정 개월 수를 더한 날짜를 구한다.
select last_name, hire_date, add_months(hire_date, 6) "6개월뒤" from employees;

--last_day() : 해당 월의 마지막 날짜를 반환하는 함수
select last_name, hire_date, last_day(hire_date) from employees;
select last_name, hire_date, last_day(add_months(hire_date,1)) from employees;

--next_day() : 해당 날짜를 기준으로 다음에 오는 요일에 해당하는 날짜를 반환
--요일은 일~토, 1~7로 표현 가능
select hire_date, next_day(hire_date, '월') from employees;
select hire_date, next_day(hire_date, 2) from employees;

--months_between() : 날짜와 날짜 사이의 개월 수 반환(개월 수를 소수점 첫째 자리까지 반올림)
select hire_date, round(months_between(sysdate, hire_date),1) from employees;

--to_date() : 문자열을 날짜로 형변환 하는 함수
--'2023-01-01'이라는 문자열을 날짜 타입으로 변환
select to_date('2023-01-01', 'YYYY-mm-dd') from dual;

--to_char() : 날짜를 문자로 변환
select to_char(sysdate, 'YYYY') from dual;
select to_char(sysdate, 'YY-MM-DD HH:MI:SS Day') from dual;
select to_char(hire_date, 'YYYY-MM/DD DY') from employees;
--형식
--YYYY       네 자리 연도
--YY      두 자리 연도
--YEAR      연도 영문 표기
--MM      월을 숫자로
--MON      월을 알파벳으로
--DD      일을 숫자로
--DAY      요일 표현
--DY      요일 약어 표현
--D      요일 숫자 표현
--AM 또는 PM   오전 오후
--HH 또는 HH12   12시간
--HH24      24시간
--MI      분
--SS      초

--Q. 현재 날짜를 'YYYY/MM/DD' 형식의 문자열로 변환하세요.
select to_char(sysdate, 'YYYY/MM/DD') from dual;

--Q. '01-01-2023'이라는 문자열을 날짜 타입으로 변환하세요.
select to_date('01-01-2023', 'DD-MM-YYYY') from dual;

--Q. 현재 날짜와 시간(sysdate)을 'YYYY-MM-DD HH24:MI:SS'형식의 문자열로 변환하세요.
select to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') from dual;

--Q. '2023-01-01 15:30:00'이라는 문자열을 날짜 및 시간 타입으로 변환하세요.
select to_date('2023-01-01 15:30:00', 'YYYY-MM-DD HH24:MI:SS') from dual;
--시간 정보가 출력되지 않는 이유는 기본 출력 설정이 날짜만 보이도록 되어있어서.
--다시 to_char()로 변환하면 정상적으로 나온다.

select to_char(1111, '99999MI') from dual; --MI는 오른쪽에만 사용
select salary, to_char(salary, '099999') from employees; --공백 0으로 채움
select salary, to_char(-salary, '999999PR') from employees; --음수값 표현

--1111 -> 1.11E+03
select to_char( 11111, '0.000EEEE' ) from dual;
select to_char(-11111, '9999999MI') from dual;
select to_char(111, '9999999MI') from dual;

--to_char( 숫자 )   숫자를 문자로 변환
--9      한 자리의 숫자 표현      ( 1111, ‘99999’ )      1111   
--0      앞 부분을 0으로 표현      ( 1111, ‘099999’ )      001111
--$      달러 기호를 앞에 표현      ( 1111, ‘$99999’ )      $1111
--.      소수점을 표시         ( 1111, ‘99999.99’ )      1111.00
--,      특정 위치에 , 표시      ( 1111, ‘99,999’ )      1,111
--MI      오른쪽에 - 기호 표시      ( 1111, ‘99999MI’ )      1111-
--PR      음수값을 <>로 표현      ( -1111, ‘99999PR’ )      <1111>
--EEEE      과학적 표현         ( 1111, ‘99.99EEEE’ )      1.11E+03
--V      10을 n승 곱한값으로 표현   ( 1111, ‘999V99’ )      111100
--B      공백을 0으로 표현      ( 1111, ‘B9999.99’ )      1111.00
--L      지역통화         ( 1111, ‘L9999’ )

--width_bucket() : 지정값, 최소값, 최대값, bucket개수

--0부터 100까지를 10개 단위로 구간을 나누면 92는 10번째 구간에 속한다.
select width_bucket( 92, 0, 100, 10 ) from dual;
select width_bucket( 90, 0, 100, 10 ) from dual;
--82는 10개 구간 중 9번째 구간에 속한다.
select width_bucket( 82, 0, 100, 10 ) from dual;
--0은 1번째 구간에 속하나 100은 11번째 구간에 속한다.
select width_bucket( 100, 0, 100, 10 ) from dual;
--이후는 무조건 11구간
select width_bucket( 133, 0, 100, 10 ) from dual;

--Q. employees 테이블의 salary를 5개 등급으로 표시하세요.
select max(salary) max, min(salary) min from employees;
select salary, width_bucket(salary, 2100, 24001, 5) as grade
from employees;

--문자 함수 character function
--upper()
select lower('Hello World') from dual;
--lower()
select upper('Hello World') from dual;

--Q.last name이 Seo인 직원의 last_name과 salary를 구하세요.(Seo, SEO, seo)모두 검출
select last_name, salary from employees where lower(last_name) = 'seo';

--initcap() : 첫글자만 대문자
select job_id, initcap( job_id ) from employees;

--length() : 문자열의 길이
select job_id, length( job_id ) from employees;

--instr() : 문자열, 찾을 문자, 찾을 시작 위치, 찾은 O 중 몇 번째 인덱스인가
--helloworld의 o라는 글자를 찾는데 3번째(ㅣ)글자부터 찾고 찾은 o중 2번째꺼가 몇번째 인덱스인지 반환
--**sql은 인덱스가 1부터 시작. 공백 포함**
--0부터 시작으로 하면 안나옴 주의
--만약 d를 찾는데 2번째 찾은 글자가 없으면 0으로 나옴 주의 (d는 하나뿐)
select instr('Hello World', 'o', 3, 2) from dual;
select instr('Hello World', 'l', 1, 2) from dual;
select instr('Hello World', 'd', 1, 1) from dual;

--substr() : 문자열, 시작위치, 개수
select substr('hello World', 3, 3) from dual; --slice기능 : llo
select substr('hello World', 12, 3) from dual; --없으면 null 반환
select substr('hello World', -5, 3) from dual; -- -는 뒤에서부터


--lpad() : 오른쪽 정렬 후 왼쪽에 문자를 채운다.
select lpad('hello World', 20, '#') from dual;
select lpad('hello World', 20, '') from dual; -- null반환
select lpad('hello World', 20, ' ') from dual; -- 공백으로 채우고 hello world

--rpad() : 왼쪽 정렬 후 오른쪽에 문자를 채운다.
select rpad('hello World', 20, '#') from dual;
select rpad('hello World', 20, ' ') from dual;

--ltrim() : 기본값으로 공백 제거, 조건을 주면 왼쪽에 위치한 조건을 제거
select ltrim('aaaHello Worldaaa', 'a') from dual;
select ltrim('    Hello World    ') from dual;
select ltrim('###Hello Worldaaa', '#') from dual;

--rtrim() : 오른쪽에 위치한 조건 제거
--공백이 있다고 무조건 제거하지는 않는다. 조건이 있다면 그 조건에 해당하는 문자만 제거
select rtrim('aaaHello Worldaaa', 'a') from dual;
select rtrim('   Hello World   ', 'a') from dual;
select rtrim('   Hello World ') from dual;
select rtrim('^^^Hello World^^^', '^') from dual;

--trim() : 양쪽의 특정 문자 제거
select trim('^' from '^^^Hello World^^^') from dual;
select trim('   Hello World   ') from dual;

select last_name 이름, ltrim(last_name, 'A') 변환 from employees;
--앞뒤의 특정 문자 제거 : 대문자 소문자 가려서 써야함.
select last_name, trim('A' from last_name) from employees;

--nvl() : null을 0 또는 다른 값으로 변환하는 함수
select last_name, manager_id, nvl(department_id, 'dgd') from employees;



