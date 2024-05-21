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
INSERT INTO subject_record VALUES (1, 1, 1, '중간', 85);
INSERT INTO subject_record VALUES (2, 1, 1, '기말', 90);
INSERT INTO subject_record VALUES (3, 2, 1, '중간', 92);
INSERT INTO subject_record VALUES (4, 2, 1, '기말', 88);
INSERT INTO subject_record VALUES (5, 3, 1, '중간', 78);
INSERT INTO subject_record VALUES (6, 3, 1, '기말', 82);
INSERT INTO subject_record VALUES (7, 1, 2, '중간', 88);
INSERT INTO subject_record VALUES (8, 1, 2, '기말', 92);
INSERT INTO subject_record VALUES (9, 2, 2, '중간', 90);
INSERT INTO subject_record VALUES (10, 2, 2, '기말', 95);
INSERT INTO subject_record VALUES (11, 3, 2, '중간', 82);
INSERT INTO subject_record VALUES (12, 3, 2, '기말', 85);
INSERT INTO subject_record VALUES (13, 1, 3, '중간', 92);
INSERT INTO subject_record VALUES (14, 1, 3, '기말', 95);
INSERT INTO subject_record VALUES (15, 2, 3, '중간', 87);
INSERT INTO subject_record VALUES (16, 2, 3, '기말', 92);
INSERT INTO subject_record VALUES (17, 3, 3, '중간', 90);
INSERT INTO subject_record VALUES (18, 3, 3, '기말', 88);
INSERT INTO subject_record VALUES (19, 1, 4, '중간', 85);
INSERT INTO subject_record VALUES (20, 1, 4, '기말', 90);
INSERT INTO subject_record VALUES (21, 2, 4, '중간', 92);
INSERT INTO subject_record VALUES (22, 2, 4, '기말', 95);
INSERT INTO subject_record VALUES (23, 3, 4, '중간', 78);
INSERT INTO subject_record VALUES (24, 3, 4, '기말', 82);
INSERT INTO subject_record VALUES (25, 1, 5, '중간', 88);
INSERT INTO subject_record VALUES (26, 1, 5, '기말', 92);
INSERT INTO subject_record VALUES (27, 2, 5, '중간', 90);
INSERT INTO subject_record VALUES (28, 2, 5, '기말', 88);
INSERT INTO subject_record VALUES (29, 3, 5, '중간', 82);
INSERT INTO subject_record VALUES (30, 3, 5, '기말', 85);
INSERT INTO subject_record VALUES (31, 1, 6, '중간', 92);
INSERT INTO subject_record VALUES (32, 1, 6, '기말', 95);
INSERT INTO subject_record VALUES (33, 2, 6, '중간', 87);
INSERT INTO subject_record VALUES (34, 2, 6, '기말', 92);
INSERT INTO subject_record VALUES (35, 3, 6, '중간', 90);
INSERT INTO subject_record VALUES (36, 3, 6, '기말', 88);
INSERT INTO subject_record VALUES (37, 1, 7, '중간', 88);
INSERT INTO subject_record VALUES (38, 1, 7, '기말', 92);
INSERT INTO subject_record VALUES (39, 2, 7, '중간', 85);
INSERT INTO subject_record VALUES (40, 2, 7, '기말', 90);
INSERT INTO subject_record VALUES (41, 3, 7, '중간', 92);
INSERT INTO subject_record VALUES (42, 3, 7, '기말', 95);
INSERT INTO subject_record VALUES (43, 1, 8, '중간', 90);
INSERT INTO subject_record VALUES (44, 1, 8, '기말', 88);
INSERT INTO subject_record VALUES (45, 2, 8, '중간', 92);
INSERT INTO subject_record VALUES (46, 2, 8, '기말', 95);
INSERT INTO subject_record VALUES (47, 3, 8, '중간', 87);
INSERT INTO subject_record VALUES (48, 3, 8, '기말', 92);
INSERT INTO subject_record VALUES (49, 1, 9, '중간', 85);
INSERT INTO subject_record VALUES (50, 1, 9, '기말', 90);
INSERT INTO subject_record VALUES (51, 2, 9, '중간', 88);
INSERT INTO subject_record VALUES (52, 2, 9, '기말', 92);
INSERT INTO subject_record VALUES (53, 3, 9, '중간', 90);
INSERT INTO subject_record VALUES (54, 3, 9, '기말', 88);
INSERT INTO subject_record VALUES (55, 1, 10, '중간', 92);
INSERT INTO subject_record VALUES (56, 1, 10, '기말', 95);
INSERT INTO subject_record VALUES (57, 2, 10, '중간', 85);
INSERT INTO subject_record VALUES (58, 2, 10, '기말', 90);
INSERT INTO subject_record VALUES (59, 3, 10, '중간', 88);
INSERT INTO subject_record VALUES (60, 3, 10, '기말', 92);
INSERT INTO subject_record VALUES (61, 1, 11, '중간', 90);
INSERT INTO subject_record VALUES (62, 1, 11, '기말', 88);
INSERT INTO subject_record VALUES (63, 2, 11, '중간', 92);
INSERT INTO subject_record VALUES (64, 2, 11, '기말', 95);
INSERT INTO subject_record VALUES (65, 3, 11, '중간', 85);
INSERT INTO subject_record VALUES (66, 3, 11, '기말', 90);
INSERT INTO subject_record VALUES (67, 1, 12, '중간', 88);
INSERT INTO subject_record VALUES (68, 1, 12, '기말', 92);
INSERT INTO subject_record VALUES (69, 2, 12, '중간', 90);
INSERT INTO subject_record VALUES (70, 2, 12, '기말', 88);
INSERT INTO subject_record VALUES (71, 3, 12, '중간', 92);
INSERT INTO subject_record VALUES (72, 3, 12, '기말', 95);
INSERT INTO subject_record VALUES (73, 1, 13, '중간', 85);
INSERT INTO subject_record VALUES (74, 1, 13, '기말', 90);
INSERT INTO subject_record VALUES (75, 2, 13, '중간', 88);
INSERT INTO subject_record VALUES (76, 2, 13, '기말', 92);
INSERT INTO subject_record VALUES (77, 3, 13, '중간', 90);
INSERT INTO subject_record VALUES (78, 3, 13, '기말', 88);
INSERT INTO subject_record VALUES (79, 1, 14, '중간', 92);
INSERT INTO subject_record VALUES (80, 1, 14, '기말', 95);
INSERT INTO subject_record VALUES (81, 2, 14, '중간', 85);
INSERT INTO subject_record VALUES (82, 2, 14, '기말', 90);
INSERT INTO subject_record VALUES (83, 3, 14, '중간', 88);
INSERT INTO subject_record VALUES (84, 3, 14, '기말', 92);
INSERT INTO subject_record VALUES (85, 1, 15, '중간', 90);
INSERT INTO subject_record VALUES (86, 1, 15, '기말', 88);
INSERT INTO subject_record VALUES (87, 2, 15, '중간', 92);
INSERT INTO subject_record VALUES (88, 2, 15, '기말', 95);
INSERT INTO subject_record VALUES (89, 3, 15, '중간', 85);
INSERT INTO subject_record VALUES (90, 3, 15, '기말', 90);
INSERT INTO subject_record VALUES (91, 1, 16, '중간', 88);
INSERT INTO subject_record VALUES (92, 1, 16, '기말', 92);
INSERT INTO subject_record VALUES (93, 2, 16, '중간', 90);
INSERT INTO subject_record VALUES (94, 2, 16, '기말', 88);
INSERT INTO subject_record VALUES (95, 3, 16, '중간', 92);
INSERT INTO subject_record VALUES (96, 3, 16, '기말', 95);
INSERT INTO subject_record VALUES (97, 1, 17, '중간', 85);
INSERT INTO subject_record VALUES (98, 1, 17, '기말', 90);
INSERT INTO subject_record VALUES (99, 2, 17, '중간', 88);
INSERT INTO subject_record VALUES (100, 2, 17, '기말', 92);
INSERT INTO subject_record VALUES (101, 3, 17, '중간', 90);
INSERT INTO subject_record VALUES (102, 3, 17, '기말', 88);
INSERT INTO subject_record VALUES (103, 1, 18, '중간', 92);
INSERT INTO subject_record VALUES (104, 1, 18, '기말', 95);
INSERT INTO subject_record VALUES (105, 2, 18, '중간', 85);
INSERT INTO subject_record VALUES (106, 2, 18, '기말', 90);
INSERT INTO subject_record VALUES (107, 3, 18, '중간', 88);
INSERT INTO subject_record VALUES (108, 3, 18, '기말', 92);

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
