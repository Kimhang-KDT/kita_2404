--등급컷
insert into grade_cutoffs values (1, 1, 1, 91, 100);
insert into grade_cutoffs values (2, 1, 2, 85, 90);
insert into grade_cutoffs values (3, 1, 3, 77, 84);
insert into grade_cutoffs values (4, 1, 4, 67, 76);
insert into grade_cutoffs values (5, 1, 5, 55, 66);
insert into grade_cutoffs values (6, 1, 6, 44, 54);
insert into grade_cutoffs values (7, 1, 7, 34, 43);
insert into grade_cutoffs values (8, 1, 8, 24, 33);
insert into grade_cutoffs values (9, 1, 9, 0, 23);

insert into grade_cutoffs values (10, 2, 1, 90, 100);
insert into grade_cutoffs values (11, 2, 2, 80, 89);
insert into grade_cutoffs values (12, 2, 3, 70, 79);
insert into grade_cutoffs values (13, 2, 4, 60, 69);
insert into grade_cutoffs values (14, 2, 5, 50, 59);
insert into grade_cutoffs values (15, 2, 6, 40, 49);
insert into grade_cutoffs values (16, 2, 7, 30, 39);
insert into grade_cutoffs values (17, 2, 8, 20, 29);
insert into grade_cutoffs values (18, 2, 9, 0, 19);


insert into grade_cutoffs values (19, 3, 1, 88, 100);
insert into grade_cutoffs values (20, 3, 2, 77, 87);
insert into grade_cutoffs values (21, 3, 3, 63, 76);
insert into grade_cutoffs values (22, 3, 4, 50, 62);
insert into grade_cutoffs values (23, 3, 5, 37, 49);
insert into grade_cutoffs values (24, 3, 6, 29, 36);
insert into grade_cutoffs values (25, 3, 7, 19, 28);
insert into grade_cutoffs values (26, 3, 8, 13, 18);
insert into grade_cutoffs values (27, 3, 9, 0, 12);

--teachers
INSERT INTO teachers VALUES (1, '김철수', 1, 1, 1);
INSERT INTO teachers VALUES (2, '이영희', 1, 2, 2);
INSERT INTO teachers VALUES (3, '박민수', 1, 3, 3);
INSERT INTO teachers VALUES (4, '최지연', 2, 1, 2);
INSERT INTO teachers VALUES (5, '강영호', 2, 2, 3);
INSERT INTO teachers VALUES (6, '송미나', 2, 3, 1);
INSERT INTO teachers VALUES (7, '임재혁', 3, 1, 3);
INSERT INTO teachers VALUES (8, '한선영', 3, 2, 1);
INSERT INTO teachers VALUES (9, '오현준', 3, 3, 2);

--students
INSERT INTO students VALUES (1, '김민수', 13, '01012345678', 1, 1, '서울특별시 동작구 보라매로 1길 1', '2010-03-15', '01098765432');
INSERT INTO students VALUES (2, '이영희', 13, '01023456789', 1, 1, '서울특별시 동작구 보라매로 2길 2', '2010-07-28', '01087654321');
INSERT INTO students VALUES (3, '박철수', 13, '01034567890', 1, 2, '서울특별시 동작구 보라매로 3길 3', '2010-11-10', '01076543210');
INSERT INTO students VALUES (4, '최지연', 13, '01045678901', 1, 2, '서울특별시 동작구 보라매로 4길 4', '2010-01-23', '01065432109');
INSERT INTO students VALUES (5, '강민호', 13, '01056789012', 1, 3, '서울특별시 동작구 보라매로 5길 5', '2010-05-06', '01054321098');
INSERT INTO students VALUES (6, '송예진', 13, '01067890123', 1, 3, '서울특별시 동작구 보라매로 6길 6', '2010-09-19', '01043210987');
INSERT INTO students VALUES (7, '임동현', 14, '01078901234', 2, 1, '서울특별시 동작구 보라매로 7길 7', '2009-02-11', '01032109876');
INSERT INTO students VALUES (8, '한서윤', 14, '01089012345', 2, 1, '서울특별시 동작구 보라매로 8길 8', '2009-06-24', '01021098765');
INSERT INTO students VALUES (9, '오민준', 14, '01090123456', 2, 2, '서울특별시 동작구 보라매로 9길 9', '2009-10-07', '01010987654');
INSERT INTO students VALUES (10, '신하은', 14, '01001234567', 2, 2, '서울특별시 동작구 보라매로 10길 10', '2009-03-20', '01009876543');
INSERT INTO students VALUES (11, '정재욱', 14, '01012345678', 2, 3, '서울특별시 동작구 보라매로 11길 11', '2009-08-12', '01098765432');
INSERT INTO students VALUES (12, '홍지우', 14, '01023456789', 2, 3, '서울특별시 동작구 보라매로 12길 12', '2009-12-25', '01087654321');
INSERT INTO students VALUES (13, '박성민', 15, '01034567890', 3, 1, '서울특별시 동작구 보라매로 13길 13', '2008-04-17', '01076543210');
INSERT INTO students VALUES (14, '김예은', 15, '01045678901', 3, 1, '서울특별시 동작구 보라매로 14길 14', '2008-09-09', '01065432109');
INSERT INTO students VALUES (15, '이준호', 15, '01056789012', 3, 2, '서울특별시 동작구 보라매로 15길 15', '2008-01-22', '01054321098');
INSERT INTO students VALUES (16, '최서연', 15, '01067890123', 3, 2, '서울특별시 동작구 보라매로 16길 16', '2008-06-04', '01043210987');
INSERT INTO students VALUES (17, '강민재', 15, '01078901234', 3, 3, '서울특별시 동작구 보라매로 17길 17', '2008-10-17', '01032109876');
INSERT INTO students VALUES (18, '주현우', 15, '01089012345', 3, 3, '서울특별시 동작구 보라매로 18길 18', '2008-03-02', '01021098765');

--subjects
INSERT INTO subjects (id, subject) VALUES (1, '국어');
INSERT INTO subjects (id, subject) VALUES (2, '영어');
INSERT INTO subjects (id, subject) VALUES (3, '수학');

delete subjects;
delete subject_records;
delete student_records;
delete teachers;
delete students;

commit;

--subject records
INSERT INTO subject_records VALUES (1, 1, 1, '중간', 85);
INSERT INTO subject_records VALUES (2, 1, 1, '기말', 90);
INSERT INTO subject_records VALUES (3, 2, 1, '중간', 92);
INSERT INTO subject_records VALUES (4, 2, 1, '기말', 88);
INSERT INTO subject_records VALUES (5, 3, 1, '중간', 78);
INSERT INTO subject_records VALUES (6, 3, 1, '기말', 82);
INSERT INTO subject_records VALUES (7, 1, 2, '중간', 88);
INSERT INTO subject_records VALUES (8, 1, 2, '기말', 92);
INSERT INTO subject_records VALUES (9, 2, 2, '중간', 90);
INSERT INTO subject_records VALUES (10, 2, 2, '기말', 95);
INSERT INTO subject_records VALUES (11, 3, 2, '중간', 82);
INSERT INTO subject_records VALUES (12, 3, 2, '기말', 85);
INSERT INTO subject_records VALUES (13, 1, 3, '중간', 92);
INSERT INTO subject_records VALUES (14, 1, 3, '기말', 95);
INSERT INTO subject_records VALUES (15, 2, 3, '중간', 87);
INSERT INTO subject_records VALUES (16, 2, 3, '기말', 92);
INSERT INTO subject_records VALUES (17, 3, 3, '중간', 90);
INSERT INTO subject_records VALUES (18, 3, 3, '기말', 88);
INSERT INTO subject_records VALUES (19, 1, 4, '중간', 85);
INSERT INTO subject_records VALUES (20, 1, 4, '기말', 90);
INSERT INTO subject_records VALUES (21, 2, 4, '중간', 92);
INSERT INTO subject_records VALUES (22, 2, 4, '기말', 95);
INSERT INTO subject_records VALUES (23, 3, 4, '중간', 78);
INSERT INTO subject_records VALUES (24, 3, 4, '기말', 82);
INSERT INTO subject_records VALUES (25, 1, 5, '중간', 88);
INSERT INTO subject_records VALUES (26, 1, 5, '기말', 92);
INSERT INTO subject_records VALUES (27, 2, 5, '중간', 90);
INSERT INTO subject_records VALUES (28, 2, 5, '기말', 88);
INSERT INTO subject_records VALUES (29, 3, 5, '중간', 82);
INSERT INTO subject_records VALUES (30, 3, 5, '기말', 85);
INSERT INTO subject_records VALUES (31, 1, 6, '중간', 92);
INSERT INTO subject_records VALUES (32, 1, 6, '기말', 95);
INSERT INTO subject_records VALUES (33, 2, 6, '중간', 87);
INSERT INTO subject_records VALUES (34, 2, 6, '기말', 92);
INSERT INTO subject_records VALUES (35, 3, 6, '중간', 90);
INSERT INTO subject_records VALUES (36, 3, 6, '기말', 88);
INSERT INTO subject_records VALUES (37, 1, 7, '중간', 88);
INSERT INTO subject_records VALUES (38, 1, 7, '기말', 92);
INSERT INTO subject_records VALUES (39, 2, 7, '중간', 85);
INSERT INTO subject_records VALUES (40, 2, 7, '기말', 90);
INSERT INTO subject_records VALUES (41, 3, 7, '중간', 92);
INSERT INTO subject_records VALUES (42, 3, 7, '기말', 95);
INSERT INTO subject_records VALUES (43, 1, 8, '중간', 90);
INSERT INTO subject_records VALUES (44, 1, 8, '기말', 88);
INSERT INTO subject_records VALUES (45, 2, 8, '중간', 92);
INSERT INTO subject_records VALUES (46, 2, 8, '기말', 95);
INSERT INTO subject_records VALUES (47, 3, 8, '중간', 87);
INSERT INTO subject_records VALUES (48, 3, 8, '기말', 92);
INSERT INTO subject_records VALUES (49, 1, 9, '중간', 85);
INSERT INTO subject_records VALUES (50, 1, 9, '기말', 90);
INSERT INTO subject_records VALUES (51, 2, 9, '중간', 88);
INSERT INTO subject_records VALUES (52, 2, 9, '기말', 92);
INSERT INTO subject_records VALUES (53, 3, 9, '중간', 90);
INSERT INTO subject_records VALUES (54, 3, 9, '기말', 88);
INSERT INTO subject_records VALUES (55, 1, 10, '중간', 92);
INSERT INTO subject_records VALUES (56, 1, 10, '기말', 95);
INSERT INTO subject_records VALUES (57, 2, 10, '중간', 85);
INSERT INTO subject_records VALUES (58, 2, 10, '기말', 90);
INSERT INTO subject_records VALUES (59, 3, 10, '중간', 88);
INSERT INTO subject_records VALUES (60, 3, 10, '기말', 92);
INSERT INTO subject_records VALUES (61, 1, 11, '중간', 90);
INSERT INTO subject_records VALUES (62, 1, 11, '기말', 88);
INSERT INTO subject_records VALUES (63, 2, 11, '중간', 92);
INSERT INTO subject_records VALUES (64, 2, 11, '기말', 95);
INSERT INTO subject_records VALUES (65, 3, 11, '중간', 85);
INSERT INTO subject_records VALUES (66, 3, 11, '기말', 90);
INSERT INTO subject_records VALUES (67, 1, 12, '중간', 88);
INSERT INTO subject_records VALUES (68, 1, 12, '기말', 92);
INSERT INTO subject_records VALUES (69, 2, 12, '중간', 90);
INSERT INTO subject_records VALUES (70, 2, 12, '기말', 88);
INSERT INTO subject_records VALUES (71, 3, 12, '중간', 92);
INSERT INTO subject_records VALUES (72, 3, 12, '기말', 95);
INSERT INTO subject_records VALUES (73, 1, 13, '중간', 85);
INSERT INTO subject_records VALUES (74, 1, 13, '기말', 90);
INSERT INTO subject_records VALUES (75, 2, 13, '중간', 88);
INSERT INTO subject_records VALUES (76, 2, 13, '기말', 92);
INSERT INTO subject_records VALUES (77, 3, 13, '중간', 90);
INSERT INTO subject_records VALUES (78, 3, 13, '기말', 88);
INSERT INTO subject_records VALUES (79, 1, 14, '중간', 92);
INSERT INTO subject_records VALUES (80, 1, 14, '기말', 95);
INSERT INTO subject_records VALUES (81, 2, 14, '중간', 85);
INSERT INTO subject_records VALUES (82, 2, 14, '기말', 90);
INSERT INTO subject_records VALUES (83, 3, 14, '중간', 88);
INSERT INTO subject_records VALUES (84, 3, 14, '기말', 92);
INSERT INTO subject_records VALUES (85, 1, 15, '중간', 90);
INSERT INTO subject_records VALUES (86, 1, 15, '기말', 88);
INSERT INTO subject_records VALUES (87, 2, 15, '중간', 92);
INSERT INTO subject_records VALUES (88, 2, 15, '기말', 95);
INSERT INTO subject_records VALUES (89, 3, 15, '중간', 85);
INSERT INTO subject_records VALUES (90, 3, 15, '기말', 90);
INSERT INTO subject_records VALUES (91, 1, 16, '중간', 88);
INSERT INTO subject_records VALUES (92, 1, 16, '기말', 92);
INSERT INTO subject_records VALUES (93, 2, 16, '중간', 90);
INSERT INTO subject_records VALUES (94, 2, 16, '기말', 88);
INSERT INTO subject_records VALUES (95, 3, 16, '중간', 92);
INSERT INTO subject_records VALUES (96, 3, 16, '기말', 95);
INSERT INTO subject_records VALUES (97, 1, 17, '중간', 85);
INSERT INTO subject_records VALUES (98, 1, 17, '기말', 90);
INSERT INTO subject_records VALUES (99, 2, 17, '중간', 88);
INSERT INTO subject_records VALUES (100, 2, 17, '기말', 92);
INSERT INTO subject_records VALUES (101, 3, 17, '중간', 90);
INSERT INTO subject_records VALUES (102, 3, 17, '기말', 88);
INSERT INTO subject_records VALUES (103, 1, 18, '중간', 92);
INSERT INTO subject_records VALUES (104, 1, 18, '기말', 95);
INSERT INTO subject_records VALUES (105, 2, 18, '중간', 85);
INSERT INTO subject_records VALUES (106, 2, 18, '기말', 90);
INSERT INTO subject_records VALUES (107, 3, 18, '중간', 88);
INSERT INTO subject_records VALUES (108, 3, 18, '기말', 92);

--student records
INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (1, 1, 1, 2, '학업에 대한 열정이 높고, 성실하게 수업에 임하는 학생입니다. 모범적인 태도로 다른 학생들에게 긍정적인 영향을 줍니다.', 95.24);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (2, 2, 1, 1, '창의적이고 탐구심이 강한 학생입니다. 교내 활동에도 적극 참여하며, 리더십이 뛰어납니다.', 98.12);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (3, 3, 1, 3, '성적 향상을 위해 꾸준히 노력하는 학생입니다. 기본기가 탄탄하며, 학습 태도가 바른 편입니다.', 92.87);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (4, 4, 1, 4, '수업 시간에 적극적으로 참여하고, 모르는 내용은 즉시 질문하는 자세가 보기 좋습니다. 계속해서 학업에 정진하길 바랍니다.', 90.45);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (5, 5, 1, 5, '학업 성적은 다소 부진하지만, 체육 활동에서 두각을 나타내고 있습니다. 자신의 장점을 살려 꾸준히 노력해주길 바랍니다.', 88.76);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (6, 6, 1, 6, '과제 제출과 수업 태도가 모범적입니다. 다만 자신감이 조금 부족해 보이니, 스스로를 더 믿고 도전하는 자세를 가져주길 바랍니다.', 96.32);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (7, 7, 2, 1, '학업 성적이 우수하고, 리더십과 협동심을 겸비한 학생입니다. 앞으로도 이러한 자세를 유지하길 바랍니다.', 97.58);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (8, 8, 2, 3, '성적은 중위권이지만, 예체능 과목에서 뛰어난 재능을 보이고 있습니다. 자신의 소질을 계발하는데 더 노력해주길 바랍니다.', 93.21);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (9, 9, 2, 4, '성실하고 책임감 있는 학습 태도를 보이고 있습니다. 다만 자신감이 조금 부족해 보이니, 스스로를 좀 더 믿어주길 바랍니다.', 91.67);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (10, 10, 2, 5, '수업 태도는 좋으나, 학업 성적이 다소 부진합니다. 기본기를 다지는데 좀 더 시간을 투자하길 바랍니다.', 89.54);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (11, 11, 2, 2, '학업 성적이 우수하고, 수업 시간에 적극적으로 참여합니다. 모범적인 학습 태도를 보이는 학생입니다.', 96.83);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (12, 12, 2, 6, '성적은 다소 부진하지만, 체육 활동에서 뛰어난 실력을 보이고 있습니다. 자신의 장점을 살려 꾸준히 노력해주길 바랍니다.', 87.92);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (13, 13, 3, 3, '학업에 대한 열정과 노력이 돋보이는 학생입니다. 현재의 자세를 유지하며 계속 정진하길 바랍니다.', 94.36);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (14, 14, 3, 2, '리더십과 협동심을 겸비한 학생입니다. 학급 활동에서 모범을 보이며, 다른 학생들에게 긍정적인 영향을 줍니다.', 95.79);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (15, 15, 3, 4, '성실하게 학업에 임하는 자세가 보기 좋습니다. 다만 시험 기간에는 조금 더 집중하고 대비할 필요가 있어 보입니다.', 92.53);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (16, 16, 3, 6, '예체능 과목에서 두각을 나타내고 있습니다. 특기를 살려 자신의 소질을 계발하는데 더 노력해주길 바랍니다.', 88.91);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (17, 17, 3, 5, '성적 향상을 위해 꾸준히 노력하는 모습이 보기 좋습니다. 앞으로도 포기하지 말고 도전하길 바랍니다.', 90.68);

INSERT INTO student_records (id, student_id, student_grade, student_rank, student_eval, attendance_rate)
VALUES (18, 18, 3, 1, '학업 성적이 우수하고, 모범적인 학습 태도를 보이는 학생입니다. 앞으로도 이러한 자세를 유지하길 바랍니다.', 98.47);


--student_health
INSERT INTO student_health (id, student_id, height, weight, sex, blood_type, vision_left, vision_right, chronic, emergency_contact_name, emergency_contact_relationship, emergency_contact_phone)
VALUES (1, 1, 142, 52, 'F', 'A', 1.20, 0.80, '천식', 'Contact_1', '부', '01012345678');
INSERT INTO student_health (id, student_id, height, weight, sex, blood_type, vision_left, vision_right, chronic, emergency_contact_name, emergency_contact_relationship, emergency_contact_phone)
VALUES (2, 2, 158, 64, 'F', 'B', 0.90, 1.00, '아토피', 'Contact_2', '모', '01023456789');
INSERT INTO student_health (id, student_id, height, weight, sex, blood_type, vision_left, vision_right, chronic, emergency_contact_name, emergency_contact_relationship, emergency_contact_phone)
VALUES (3, 3, 150, 57, 'F', 'O', 1.00, 0.90, NULL, 'Contact_3', '조부', '01034567890');
INSERT INTO student_health (id, student_id, height, weight, sex, blood_type, vision_left, vision_right, chronic, emergency_contact_name, emergency_contact_relationship, emergency_contact_phone)
VALUES (4, 4, 147, 49, 'F', 'AB', 0.70, 1.10, NULL, 'Contact_4', '조모', '01045678901');
INSERT INTO student_health (id, student_id, height, weight, sex, blood_type, vision_left, vision_right, chronic, emergency_contact_name, emergency_contact_relationship, emergency_contact_phone)
VALUES (5, 5, 155, 55, 'F', 'A', 1.10, 1.00, NULL, 'Contact_5', '부', '01056789012');
INSERT INTO student_health (id, student_id, height, weight, sex, blood_type, vision_left, vision_right, chronic, emergency_contact_name, emergency_contact_relationship, emergency_contact_phone)
VALUES (6, 6, 149, 53, 'F', 'B', 0.80, 0.70, NULL, 'Contact_6', '모', '01067890123');
INSERT INTO student_health (id, student_id, height, weight, sex, blood_type, vision_left, vision_right, chronic, emergency_contact_name, emergency_contact_relationship, emergency_contact_phone)
VALUES (7, 7, 143, 50, 'F', 'O', 1.30, 1.20, NULL, 'Contact_7', '조부', '01078901234');
INSERT INTO student_health (id, student_id, height, weight, sex, blood_type, vision_left, vision_right, chronic, emergency_contact_name, emergency_contact_relationship, emergency_contact_phone)
VALUES (8, 8, 160, 60, 'F', 'AB', 0.60, 0.90, NULL, 'Contact_8', '조모', '01089012345');
INSERT INTO student_health (id, student_id, height, weight, sex, blood_type, vision_left, vision_right, chronic, emergency_contact_name, emergency_contact_relationship, emergency_contact_phone)
VALUES (9, 9, 145, 51, 'F', 'A', 1.00, 1.10, NULL, 'Contact_9', '부', '01090123456');
INSERT INTO student_health (id, student_id, height, weight, sex, blood_type, vision_left, vision_right, chronic, emergency_contact_name, emergency_contact_relationship, emergency_contact_phone)
VALUES (10, 10, 170, 70, 'M', 'B', 1.10, 1.00, NULL, 'Contact_10', '모', '01001234567');
INSERT INTO student_health (id, student_id, height, weight, sex, blood_type, vision_left, vision_right, chronic, emergency_contact_name, emergency_contact_relationship, emergency_contact_phone)
VALUES (11, 11, 165, 68, 'M', 'O', 0.90, 1.20, NULL, 'Contact_11', '조부', '01012345098');
INSERT INTO student_health (id, student_id, height, weight, sex, blood_type, vision_left, vision_right, chronic, emergency_contact_name, emergency_contact_relationship, emergency_contact_phone)
VALUES (12, 12, 160, 62, 'M', 'AB', 0.80, 1.10, NULL, 'Contact_12', '조모', '01023456089');
INSERT INTO student_health (id, student_id, height, weight, sex, blood_type, vision_left, vision_right, chronic, emergency_contact_name, emergency_contact_relationship, emergency_contact_phone)
VALUES (13, 13, 155, 58, 'M', 'A', 1.00, 0.90, NULL, 'Contact_13', '부', '01034567098');
INSERT INTO student_health (id, student_id, height, weight, sex, blood_type, vision_left, vision_right, chronic, emergency_contact_name, emergency_contact_relationship, emergency_contact_phone)
VALUES (14, 14, 150, 54, 'M', 'B', 0.90, 1.30, NULL, 'Contact_14', '모', '01045678098');
INSERT INTO student_health (id, student_id, height, weight, sex, blood_type, vision_left, vision_right, chronic, emergency_contact_name, emergency_contact_relationship, emergency_contact_phone)
VALUES (15, 15, 172, 72, 'M', 'O', 1.20, 1.10, NULL, 'Contact_15', '조부', '01056789098');
INSERT INTO student_health (id, student_id, height, weight, sex, blood_type, vision_left, vision_right, chronic, emergency_contact_name, emergency_contact_relationship, emergency_contact_phone)
VALUES (16, 16, 175, 75, 'M', 'AB', 1.00, 0.90, '알레르기', 'Contact_16', '조모', '01067890198');
INSERT INTO student_health (id, student_id, height, weight, sex, blood_type, vision_left, vision_right, chronic, emergency_contact_name, emergency_contact_relationship, emergency_contact_phone)
VALUES (17, 17, 162, 65, 'M', 'A', 0.80, 1.20, NULL, 'Contact_17', '부', '01078901298');
INSERT INTO student_health (id, student_id, height, weight, sex, blood_type, vision_left, vision_right, chronic, emergency_contact_name, emergency_contact_relationship, emergency_contact_phone)
VALUES (18, 18, 168, 70, 'M', 'B', 0.90, 1.00, NULL, 'Contact_18', '모', '01089012398');
