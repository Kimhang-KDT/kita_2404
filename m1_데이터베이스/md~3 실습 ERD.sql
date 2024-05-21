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


�� ERD�� �̹����� ǥ���ϸ� ������ ���� ������ �����ϴ�:

students ���̺��� �߽� ���̺��Դϴ�.
student_health ���̺��� students ���̺�� 1:N ���踦 �����ϴ�.
student_records ���̺��� students ���̺�� 1:N ���踦 �����ϴ�.
subjects ���̺��� subject_record �� teachers ���̺�� N:1 ���踦 �����ϴ�.
subject_record ���̺��� students �� subjects ���̺�� ���� N:1 ���踦 �����ϴ�.
student_parents ���̺��� students ���̺�� 1:N ���踦 �����ϴ�.
teachers ���̺��� subjects ���̺�� N:1 ���踦 �����ϴ�.


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
