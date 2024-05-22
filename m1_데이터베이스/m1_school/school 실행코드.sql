select * from student_records;

select S.name 학생명, S.grade 학년, round(avg(R.score),1) 평균, K.student_rank 등수
from subject_record R, students S, student_records K
where S.id = R.student_id and S.id = K.student_id
group by S.name, S.grade, K.student_rank;

select S.name 학생명, H.personal 질병
from students S, student_health H
where S.id = h.student_id and h.personal != 'Null';

select t.grade 학년, t.class 반, t.name 선생님, count(s.id) 학생수
from teachers t, students s
where t.grade = s.grade and t.class = s.class
group by t.name, t.class, t.grade
order by t.grade, t.class;


--학생의 중간/기말 시험 평균(subject_records)을 grade_cutoffs에 대조하여 
--student_records의 student_rank를 등급으로 표기

with avg_scores as (
select student_id, ROUND(avg(score), 1) avg_score
from subject_records
group by student_id
),
student_grades as (
select sc.student_id, sc.avg_score, min(gc.grade) as grade
from avg_scores sc
join grade_cutoffs gc on sc.avg_score between gc.min_score and gc.max_score
group by sc.student_id, sc.avg_score
)
select sr.student_id, sg.avg_score, sg.grade
from student_records sr
join student_grades sg on sr.student_id = sg.student_id
group by sr.student_id, sg.avg_score, sg.grade
order by sr.student_id;


--출석률이 저조한 학생들의 데이터를 찾아내어 그들의 비상연락망과 함께 출력
with student_attendence as (
select sr.student_id, sr.attendance_rate as rate
from student_records sr
where sr.attendance_rate < 78
)
select sa.student_id, sa.rate, sh.emergency_contact_name, sh.emergency_contact_phone
from student_health sh
join student_attendence sa on sa.student_id = sh.student_id
group by sa.student_id, sa.rate, sh.emergency_contact_name, sh.emergency_contact_phone;

--특이사항(질병 등)이 있는 학생들의 데이터를 뽑아낸다.
select s.id, s.name, h.chronic
from students s
join student_health h on s.id = h.student_id
where h.chronic is not null
group by s.id, s.name, h.chronic;
