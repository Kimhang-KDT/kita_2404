���� ����
students ���̺��� student_health ���̺�� 1:N ���踦 �����ϴ�.

�� �л�(students)�� ���� �ǰ� ���(student_health)�� ���� �� �ֽ��ϴ�.
students ���̺��� student_records ���̺�� 1:N ���踦 �����ϴ�.

�� �л�(students)�� ���� ���� ���(student_records)�� ���� �� �ֽ��ϴ�.
students ���̺��� subject_records ���̺�� 1:N ���踦 �����ϴ�.

�� �л�(students)�� ���� ���� ���(subject_records)�� ���� �� �ֽ��ϴ�.
student_health ���̺��� students ���̺�� N:1 ���踦 �����ϴ�.

���� �ǰ� ���(student_health)�� �� �л�(students)�� ���մϴ�.
student_records ���̺��� students ���̺�� N:1 ���踦 �����ϴ�.

���� ���� ���(student_records)�� �� �л�(students)�� ���մϴ�.
subjects ���̺��� subject_records ���̺�� N:1 ���踦 �����ϴ�.

���� ���� ���(subject_records)�� �� ����(subjects)�� ���մϴ�.
subjects ���̺��� teachers ���̺�� N:1 ���踦 �����ϴ�.

���� ����(teachers)�� �� ����(subjects)�� ����� �� �ֽ��ϴ�.
subjects ���̺��� grade_cutoffs ���̺�� N:1 ���踦 �����ϴ�.

���� ��� ��(grade_cutoffs)�� �� ����(subjects)�� ���մϴ�.
subject_records ���̺��� students ���̺�� N:1 ���踦 �����ϴ�.

���� ���� ���(subject_records)�� �� �л�(students)�� ���մϴ�.
subject_records ���̺��� subjects ���̺�� N:1 ���踦 �����ϴ�.

���� ���� ���(subject_records)�� �� ����(subjects)�� ���մϴ�.
grade_cutoffs ���̺��� subjects ���̺�� N:1 ���踦 �����ϴ�.

���� ��� ��(grade_cutoffs)�� �� ����(subjects)�� ���մϴ�.