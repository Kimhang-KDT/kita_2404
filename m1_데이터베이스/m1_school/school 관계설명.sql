관계 설명
students 테이블은 student_health 테이블과 1:N 관계를 가집니다.

한 학생(students)은 여러 건강 기록(student_health)을 가질 수 있습니다.
students 테이블은 student_records 테이블과 1:N 관계를 가집니다.

한 학생(students)은 여러 학적 기록(student_records)을 가질 수 있습니다.
students 테이블은 subject_records 테이블과 1:N 관계를 가집니다.

한 학생(students)은 여러 과목 기록(subject_records)을 가질 수 있습니다.
student_health 테이블은 students 테이블과 N:1 관계를 가집니다.

여러 건강 기록(student_health)은 한 학생(students)에 속합니다.
student_records 테이블은 students 테이블과 N:1 관계를 가집니다.

여러 학적 기록(student_records)은 한 학생(students)에 속합니다.
subjects 테이블은 subject_records 테이블과 N:1 관계를 가집니다.

여러 과목 기록(subject_records)은 한 과목(subjects)에 속합니다.
subjects 테이블은 teachers 테이블과 N:1 관계를 가집니다.

여러 교사(teachers)는 한 과목(subjects)을 담당할 수 있습니다.
subjects 테이블은 grade_cutoffs 테이블과 N:1 관계를 가집니다.

여러 등급 컷(grade_cutoffs)은 한 과목(subjects)에 속합니다.
subject_records 테이블은 students 테이블과 N:1 관계를 가집니다.

여러 과목 기록(subject_records)은 한 학생(students)에 속합니다.
subject_records 테이블은 subjects 테이블과 N:1 관계를 가집니다.

여러 과목 기록(subject_records)은 한 과목(subjects)에 속합니다.
grade_cutoffs 테이블은 subjects 테이블과 N:1 관계를 가집니다.

여러 등급 컷(grade_cutoffs)은 한 과목(subjects)에 속합니다.
