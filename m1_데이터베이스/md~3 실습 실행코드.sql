select * from student_records;

select S.name �л���, S.grade �г�, round(avg(R.score),1) ���, K.student_rank ���
from subject_record R, students S, student_records K
where S.id = R.student_id and S.id = K.student_id
group by S.name, S.grade, K.student_rank;

select S.name �л���, H.personal ����
from students S, student_health H
where S.id = h.student_id and h.personal != 'Null';

select t.grade �г�, t.class ��, t.name ������, count(s.id) �л���
from teachers t, students s
where t.grade = s.grade and t.class = s.class
group by t.name, t.class, t.grade
order by t.grade, t.class;


--�л��� �߰�/�⸻ ���� ���(subject_records)�� grade_cutoffs�� �����Ͽ� 
--student_records�� student_rank�� ������� ǥ��

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


--�⼮���� ������ �л����� �����͸� ã�Ƴ��� �׵��� ��󿬶����� �Բ� ���
with student_attendence as (
select sr.student_id, sr.attendance_rate as rate
from student_records sr
where sr.attendance_rate < 78
)
select sa.student_id, sa.rate, sh.emergency_contact_name, sh.emergency_contact_phone
from student_health sh
join student_attendence sa on sa.student_id = sh.student_id
group by sa.student_id, sa.rate, sh.emergency_contact_name, sh.emergency_contact_phone;

--Ư�̻���(���� ��)�� �ִ� �л����� �����͸� �̾Ƴ���.
select s.id, s.name, h.chronic
from students s
join student_health h on s.id = h.student_id
where h.chronic is not null
group by s.id, s.name, h.chronic;
