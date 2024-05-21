students 
-----------
id (PK)
name
age
phone
grade
class
address
birth
eeif

student_health
---------------
id (PK)
student_id (FK)
height
weight
personal

student_records
----------------
id (PK)
student_id (FK)
student_grade
student_rank
student_eval
attendance_rate

subjects
----------
id (PK)
subject

subject_record
---------------
id (PK)
subject_id (FK)
student_id (FK)
exam
score

student_parents
-----------------
id (PK)
student_id (FK)
name
phone
living_together

teachers
----------
id (PK)
name
grade
class
subject (FK)


이 ERD를 이미지로 표현하면 다음과 같은 구조를 가집니다:

students 테이블이 중심 테이블입니다.
student_health 테이블이 students 테이블과 1:N 관계를 가집니다.
student_records 테이블이 students 테이블과 1:N 관계를 가집니다.
subjects 테이블이 subject_record 및 teachers 테이블과 N:1 관계를 가집니다.
subject_record 테이블이 students 및 subjects 테이블과 각각 N:1 관계를 가집니다.
student_parents 테이블이 students 테이블과 1:N 관계를 가집니다.
teachers 테이블이 subjects 테이블과 N:1 관계를 가집니다.


+------------------+       +------------------+        +------------------+
|     students     |       |  student_health  |        | student_records  |
|------------------|       |------------------|        |------------------|
| id (PK)          |<------| id (PK)          |        | id (PK)          |
| name             |       | student_id (FK)  |        | student_id (FK)  |
| age              |       | height           |        | student_grade    |
| phone            |       | weight           |        | student_rank     |
| grade            |       | personal         |        | student_eval     |
| class            |       +------------------+        | attendance_rate  |
| address          |                                      +------------------+
| birth            |
| eeif             |
+------------------+

+------------------+       +------------------+        +------------------+
|     subjects     |       |  subject_record  |        |  student_parents |
|------------------|       |------------------|        |------------------|
| id (PK)          |<------| id (PK)          |        | id (PK)          |
| subject          |       | subject_id (FK)  |        | student_id (FK)  |
+------------------+       | student_id (FK)  |        | name             |
                           | exam             |        | phone            |
                           | score            |        | living_together  |
                           +------------------+        +------------------+

+------------------+
|     teachers     |
|------------------|
| id (PK)          |
| name             |
| grade            |
| class            |
| subject (FK)     |
+------------------+
