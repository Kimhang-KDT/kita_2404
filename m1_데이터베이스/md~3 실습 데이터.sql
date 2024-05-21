--teachers
INSERT INTO teachers VALUES (1, '��ö��', 1, 1, 1);
INSERT INTO teachers VALUES (2, '�̿���', 1, 2, 2);
INSERT INTO teachers VALUES (3, '�ڹμ�', 1, 3, 3);
INSERT INTO teachers VALUES (4, '������', 2, 1, 2);
INSERT INTO teachers VALUES (5, '����ȣ', 2, 2, 3);
INSERT INTO teachers VALUES (6, '�۹̳�', 2, 3, 1);
INSERT INTO teachers VALUES (7, '������', 3, 1, 3);
INSERT INTO teachers VALUES (8, '�Ѽ���', 3, 2, 1);
INSERT INTO teachers VALUES (9, '������', 3, 3, 2);

--students
INSERT INTO students VALUES (1, '��μ�', 13, '01012345678', 1, 1, '����Ư���� ���۱� ����ŷ� 1�� 1', '2010-03-15', '01098765432');
INSERT INTO students VALUES (2, '�̿���', 13, '01023456789', 1, 1, '����Ư���� ���۱� ����ŷ� 2�� 2', '2010-07-28', '01087654321');
INSERT INTO students VALUES (3, '��ö��', 13, '01034567890', 1, 2, '����Ư���� ���۱� ����ŷ� 3�� 3', '2010-11-10', '01076543210');
INSERT INTO students VALUES (4, '������', 13, '01045678901', 1, 2, '����Ư���� ���۱� ����ŷ� 4�� 4', '2010-01-23', '01065432109');
INSERT INTO students VALUES (5, '����ȣ', 13, '01056789012', 1, 3, '����Ư���� ���۱� ����ŷ� 5�� 5', '2010-05-06', '01054321098');
INSERT INTO students VALUES (6, '�ۿ���', 13, '01067890123', 1, 3, '����Ư���� ���۱� ����ŷ� 6�� 6', '2010-09-19', '01043210987');
INSERT INTO students VALUES (7, '�ӵ���', 14, '01078901234', 2, 1, '����Ư���� ���۱� ����ŷ� 7�� 7', '2009-02-11', '01032109876');
INSERT INTO students VALUES (8, '�Ѽ���', 14, '01089012345', 2, 1, '����Ư���� ���۱� ����ŷ� 8�� 8', '2009-06-24', '01021098765');
INSERT INTO students VALUES (9, '������', 14, '01090123456', 2, 2, '����Ư���� ���۱� ����ŷ� 9�� 9', '2009-10-07', '01010987654');
INSERT INTO students VALUES (10, '������', 14, '01001234567', 2, 2, '����Ư���� ���۱� ����ŷ� 10�� 10', '2009-03-20', '01009876543');
INSERT INTO students VALUES (11, '�����', 14, '01012345678', 2, 3, '����Ư���� ���۱� ����ŷ� 11�� 11', '2009-08-12', '01098765432');
INSERT INTO students VALUES (12, 'ȫ����', 14, '01023456789', 2, 3, '����Ư���� ���۱� ����ŷ� 12�� 12', '2009-12-25', '01087654321');
INSERT INTO students VALUES (13, '�ڼ���', 15, '01034567890', 3, 1, '����Ư���� ���۱� ����ŷ� 13�� 13', '2008-04-17', '01076543210');
INSERT INTO students VALUES (14, '�迹��', 15, '01045678901', 3, 1, '����Ư���� ���۱� ����ŷ� 14�� 14', '2008-09-09', '01065432109');
INSERT INTO students VALUES (15, '����ȣ', 15, '01056789012', 3, 2, '����Ư���� ���۱� ����ŷ� 15�� 15', '2008-01-22', '01054321098');
INSERT INTO students VALUES (16, '�ּ���', 15, '01067890123', 3, 2, '����Ư���� ���۱� ����ŷ� 16�� 16', '2008-06-04', '01043210987');
INSERT INTO students VALUES (17, '������', 15, '01078901234', 3, 3, '����Ư���� ���۱� ����ŷ� 17�� 17', '2008-10-17', '01032109876');
INSERT INTO students VALUES (18, '������', 15, '01089012345', 3, 3, '����Ư���� ���۱� ����ŷ� 18�� 18', '2008-03-02', '01021098765');

--subjects
INSERT INTO subjects (id, subject) VALUES (1, '����');
INSERT INTO subjects (id, subject) VALUES (2, '����');
INSERT INTO subjects (id, subject) VALUES (3, '����');

delete subjects;
delete subject_records;
delete student_records;
delete teachers;
delete students;

commit;

--subject records
INSERT INTO subject_record VALUES (1, 1, 1, '�߰�', 85);
INSERT INTO subject_record VALUES (2, 1, 1, '�⸻', 90);
INSERT INTO subject_record VALUES (3, 2, 1, '�߰�', 92);
INSERT INTO subject_record VALUES (4, 2, 1, '�⸻', 88);
INSERT INTO subject_record VALUES (5, 3, 1, '�߰�', 78);
INSERT INTO subject_record VALUES (6, 3, 1, '�⸻', 82);
INSERT INTO subject_record VALUES (7, 1, 2, '�߰�', 88);
INSERT INTO subject_record VALUES (8, 1, 2, '�⸻', 92);
INSERT INTO subject_record VALUES (9, 2, 2, '�߰�', 90);
INSERT INTO subject_record VALUES (10, 2, 2, '�⸻', 95);
INSERT INTO subject_record VALUES (11, 3, 2, '�߰�', 82);
INSERT INTO subject_record VALUES (12, 3, 2, '�⸻', 85);
INSERT INTO subject_record VALUES (13, 1, 3, '�߰�', 92);
INSERT INTO subject_record VALUES (14, 1, 3, '�⸻', 95);
INSERT INTO subject_record VALUES (15, 2, 3, '�߰�', 87);
INSERT INTO subject_record VALUES (16, 2, 3, '�⸻', 92);
INSERT INTO subject_record VALUES (17, 3, 3, '�߰�', 90);
INSERT INTO subject_record VALUES (18, 3, 3, '�⸻', 88);
INSERT INTO subject_record VALUES (19, 1, 4, '�߰�', 85);
INSERT INTO subject_record VALUES (20, 1, 4, '�⸻', 90);
INSERT INTO subject_record VALUES (21, 2, 4, '�߰�', 92);
INSERT INTO subject_record VALUES (22, 2, 4, '�⸻', 95);
INSERT INTO subject_record VALUES (23, 3, 4, '�߰�', 78);
INSERT INTO subject_record VALUES (24, 3, 4, '�⸻', 82);
INSERT INTO subject_record VALUES (25, 1, 5, '�߰�', 88);
INSERT INTO subject_record VALUES (26, 1, 5, '�⸻', 92);
INSERT INTO subject_record VALUES (27, 2, 5, '�߰�', 90);
INSERT INTO subject_record VALUES (28, 2, 5, '�⸻', 88);
INSERT INTO subject_record VALUES (29, 3, 5, '�߰�', 82);
INSERT INTO subject_record VALUES (30, 3, 5, '�⸻', 85);
INSERT INTO subject_record VALUES (31, 1, 6, '�߰�', 92);
INSERT INTO subject_record VALUES (32, 1, 6, '�⸻', 95);
INSERT INTO subject_record VALUES (33, 2, 6, '�߰�', 87);
INSERT INTO subject_record VALUES (34, 2, 6, '�⸻', 92);
INSERT INTO subject_record VALUES (35, 3, 6, '�߰�', 90);
INSERT INTO subject_record VALUES (36, 3, 6, '�⸻', 88);
INSERT INTO subject_record VALUES (37, 1, 7, '�߰�', 88);
INSERT INTO subject_record VALUES (38, 1, 7, '�⸻', 92);
INSERT INTO subject_record VALUES (39, 2, 7, '�߰�', 85);
INSERT INTO subject_record VALUES (40, 2, 7, '�⸻', 90);
INSERT INTO subject_record VALUES (41, 3, 7, '�߰�', 92);
INSERT INTO subject_record VALUES (42, 3, 7, '�⸻', 95);
INSERT INTO subject_record VALUES (43, 1, 8, '�߰�', 90);
INSERT INTO subject_record VALUES (44, 1, 8, '�⸻', 88);
INSERT INTO subject_record VALUES (45, 2, 8, '�߰�', 92);
INSERT INTO subject_record VALUES (46, 2, 8, '�⸻', 95);
INSERT INTO subject_record VALUES (47, 3, 8, '�߰�', 87);
INSERT INTO subject_record VALUES (48, 3, 8, '�⸻', 92);
INSERT INTO subject_record VALUES (49, 1, 9, '�߰�', 85);
INSERT INTO subject_record VALUES (50, 1, 9, '�⸻', 90);
INSERT INTO subject_record VALUES (51, 2, 9, '�߰�', 88);
INSERT INTO subject_record VALUES (52, 2, 9, '�⸻', 92);
INSERT INTO subject_record VALUES (53, 3, 9, '�߰�', 90);
INSERT INTO subject_record VALUES (54, 3, 9, '�⸻', 88);
INSERT INTO subject_record VALUES (55, 1, 10, '�߰�', 92);
INSERT INTO subject_record VALUES (56, 1, 10, '�⸻', 95);
INSERT INTO subject_record VALUES (57, 2, 10, '�߰�', 85);
INSERT INTO subject_record VALUES (58, 2, 10, '�⸻', 90);
INSERT INTO subject_record VALUES (59, 3, 10, '�߰�', 88);
INSERT INTO subject_record VALUES (60, 3, 10, '�⸻', 92);
INSERT INTO subject_record VALUES (61, 1, 11, '�߰�', 90);
INSERT INTO subject_record VALUES (62, 1, 11, '�⸻', 88);
INSERT INTO subject_record VALUES (63, 2, 11, '�߰�', 92);
INSERT INTO subject_record VALUES (64, 2, 11, '�⸻', 95);
INSERT INTO subject_record VALUES (65, 3, 11, '�߰�', 85);
INSERT INTO subject_record VALUES (66, 3, 11, '�⸻', 90);
INSERT INTO subject_record VALUES (67, 1, 12, '�߰�', 88);
INSERT INTO subject_record VALUES (68, 1, 12, '�⸻', 92);
INSERT INTO subject_record VALUES (69, 2, 12, '�߰�', 90);
INSERT INTO subject_record VALUES (70, 2, 12, '�⸻', 88);
INSERT INTO subject_record VALUES (71, 3, 12, '�߰�', 92);
INSERT INTO subject_record VALUES (72, 3, 12, '�⸻', 95);
INSERT INTO subject_record VALUES (73, 1, 13, '�߰�', 85);
INSERT INTO subject_record VALUES (74, 1, 13, '�⸻', 90);
INSERT INTO subject_record VALUES (75, 2, 13, '�߰�', 88);
INSERT INTO subject_record VALUES (76, 2, 13, '�⸻', 92);
INSERT INTO subject_record VALUES (77, 3, 13, '�߰�', 90);
INSERT INTO subject_record VALUES (78, 3, 13, '�⸻', 88);
INSERT INTO subject_record VALUES (79, 1, 14, '�߰�', 92);
INSERT INTO subject_record VALUES (80, 1, 14, '�⸻', 95);
INSERT INTO subject_record VALUES (81, 2, 14, '�߰�', 85);
INSERT INTO subject_record VALUES (82, 2, 14, '�⸻', 90);
INSERT INTO subject_record VALUES (83, 3, 14, '�߰�', 88);
INSERT INTO subject_record VALUES (84, 3, 14, '�⸻', 92);
INSERT INTO subject_record VALUES (85, 1, 15, '�߰�', 90);
INSERT INTO subject_record VALUES (86, 1, 15, '�⸻', 88);
INSERT INTO subject_record VALUES (87, 2, 15, '�߰�', 92);
INSERT INTO subject_record VALUES (88, 2, 15, '�⸻', 95);
INSERT INTO subject_record VALUES (89, 3, 15, '�߰�', 85);
INSERT INTO subject_record VALUES (90, 3, 15, '�⸻', 90);
INSERT INTO subject_record VALUES (91, 1, 16, '�߰�', 88);
INSERT INTO subject_record VALUES (92, 1, 16, '�⸻', 92);
INSERT INTO subject_record VALUES (93, 2, 16, '�߰�', 90);
INSERT INTO subject_record VALUES (94, 2, 16, '�⸻', 88);
INSERT INTO subject_record VALUES (95, 3, 16, '�߰�', 92);
INSERT INTO subject_record VALUES (96, 3, 16, '�⸻', 95);
INSERT INTO subject_record VALUES (97, 1, 17, '�߰�', 85);
INSERT INTO subject_record VALUES (98, 1, 17, '�⸻', 90);
INSERT INTO subject_record VALUES (99, 2, 17, '�߰�', 88);
INSERT INTO subject_record VALUES (100, 2, 17, '�⸻', 92);
INSERT INTO subject_record VALUES (101, 3, 17, '�߰�', 90);
INSERT INTO subject_record VALUES (102, 3, 17, '�⸻', 88);
INSERT INTO subject_record VALUES (103, 1, 18, '�߰�', 92);
INSERT INTO subject_record VALUES (104, 1, 18, '�⸻', 95);
INSERT INTO subject_record VALUES (105, 2, 18, '�߰�', 85);
INSERT INTO subject_record VALUES (106, 2, 18, '�⸻', 90);
INSERT INTO subject_record VALUES (107, 3, 18, '�߰�', 88);
INSERT INTO subject_record VALUES (108, 3, 18, '�⸻', 92);

--student records
INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (1, 1, 1, 2, '�о��� ���� ������ ����, �����ϰ� ������ ���ϴ� �л��Դϴ�. ������� �µ��� �ٸ� �л��鿡�� �������� ������ �ݴϴ�.', 95.24);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (2, 2, 1, 1, 'â�����̰� Ž������ ���� �л��Դϴ�. ���� Ȱ������ ���� �����ϸ�, �������� �پ�ϴ�.', 98.12);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (3, 3, 1, 3, '���� ����� ���� ������ ����ϴ� �л��Դϴ�. �⺻�Ⱑ źź�ϸ�, �н� �µ��� �ٸ� ���Դϴ�.', 92.87);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (4, 4, 1, 4, '���� �ð��� ���������� �����ϰ�, �𸣴� ������ ��� �����ϴ� �ڼ��� ���� �����ϴ�. ����ؼ� �о��� �����ϱ� �ٶ��ϴ�.', 90.45);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (5, 5, 1, 5, '�о� ������ �ټ� ����������, ü�� Ȱ������ �ΰ��� ��Ÿ���� �ֽ��ϴ�. �ڽ��� ������ ��� ������ ������ֱ� �ٶ��ϴ�.', 88.76);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (6, 6, 1, 6, '���� ����� ���� �µ��� ������Դϴ�. �ٸ� �ڽŰ��� ���� ������ ���̴�, �����θ� �� �ϰ� �����ϴ� �ڼ��� �����ֱ� �ٶ��ϴ�.', 96.32);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (7, 7, 2, 1, '�о� ������ ����ϰ�, �����ʰ� �������� ����� �л��Դϴ�. �����ε� �̷��� �ڼ��� �����ϱ� �ٶ��ϴ�.', 97.58);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (8, 8, 2, 3, '������ ������������, ��ü�� ���񿡼� �پ ����� ���̰� �ֽ��ϴ�. �ڽ��� ������ ����ϴµ� �� ������ֱ� �ٶ��ϴ�.', 93.21);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (9, 9, 2, 4, '�����ϰ� å�Ӱ� �ִ� �н� �µ��� ���̰� �ֽ��ϴ�. �ٸ� �ڽŰ��� ���� ������ ���̴�, �����θ� �� �� �Ͼ��ֱ� �ٶ��ϴ�.', 91.67);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (10, 10, 2, 5, '���� �µ��� ������, �о� ������ �ټ� �����մϴ�. �⺻�⸦ �����µ� �� �� �ð��� �����ϱ� �ٶ��ϴ�.', 89.54);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (11, 11, 2, 2, '�о� ������ ����ϰ�, ���� �ð��� ���������� �����մϴ�. ������� �н� �µ��� ���̴� �л��Դϴ�.', 96.83);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (12, 12, 2, 6, '������ �ټ� ����������, ü�� Ȱ������ �پ �Ƿ��� ���̰� �ֽ��ϴ�. �ڽ��� ������ ��� ������ ������ֱ� �ٶ��ϴ�.', 87.92);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (13, 13, 3, 3, '�о��� ���� ������ ����� �����̴� �л��Դϴ�. ������ �ڼ��� �����ϸ� ��� �����ϱ� �ٶ��ϴ�.', 94.36);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (14, 14, 3, 2, '�����ʰ� �������� ����� �л��Դϴ�. �б� Ȱ������ ����� ���̸�, �ٸ� �л��鿡�� �������� ������ �ݴϴ�.', 95.79);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (15, 15, 3, 4, '�����ϰ� �о��� ���ϴ� �ڼ��� ���� �����ϴ�. �ٸ� ���� �Ⱓ���� ���� �� �����ϰ� ����� �ʿ䰡 �־� ���Դϴ�.', 92.53);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (16, 16, 3, 6, '��ü�� ���񿡼� �ΰ��� ��Ÿ���� �ֽ��ϴ�. Ư�⸦ ��� �ڽ��� ������ ����ϴµ� �� ������ֱ� �ٶ��ϴ�.', 88.91);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (17, 17, 3, 5, '���� ����� ���� ������ ����ϴ� ����� ���� �����ϴ�. �����ε� �������� ���� �����ϱ� �ٶ��ϴ�.', 90.68);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (18, 18, 3, 1, '�о� ������ ����ϰ�, ������� �н� �µ��� ���̴� �л��Դϴ�. �����ε� �̷��� �ڼ��� �����ϱ� �ٶ��ϴ�.', 98.47);
