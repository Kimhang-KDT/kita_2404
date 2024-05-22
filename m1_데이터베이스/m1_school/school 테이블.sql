--실습 : 학교 관리를 위하여 테이블 2개 이상으로 db를 구축하고 3개 이상 활용할 수 있는 case를 만드세요.

create table students(
    id number primary key,
    name varchar2(30) not null,
    age number,
    phone number(11),
    grade number(1) not null,
    class number(2) not null,
    address varchar2(150) not null,
    birth date,
    eeif number(11) --비상연락망
);

create table student_health(
    id number primary key,
    student_id number not null,
    height number, -- 키(cm)
    weight number, -- 몸무게(kg)
    sex char, --F / M
    blood_type varchar2(2), -- 혈액형
    vision_left number(3,2), -- 왼쪽 시력
    vision_right number(3,2), -- 오른쪽 시력
    chronic varchar2(200), -- 병력
    emergency_contact_name varchar2(30), -- 비상 연락망 이름
    emergency_contact_relationship varchar2(20), -- 비상 연락망 관계
    emergency_contact_phone number(11), -- 비상 연락망 전화번호
    foreign key(student_id) references students(id) on delete cascade
);

create table student_records( --학년별 학적부
    id number primary key,
    student_id number not null,
    student_grade number not null, --학년
    student_rank number, --학생 석차
    student_eval CLOB, --교사 평가
    attendance_rate number(5,2), --출석률
    foreign key(student_id) references students(id) on delete cascade
);

create table subjects(
    id number primary key,
    subject varchar(20) not null
);

create table subject_records(
    id number primary key,
    subject_id number not null,
    student_id number not null,
    exam varchar2(20) not null, --중간 혹은 기말
    score number default 0 not null, --성적 기본값 0
    foreign key(student_id) references students(id) on delete cascade,
    foreign key(subject_id) references subjects(id) on delete cascade
);

create table teachers(
    id number primary key,
    name varchar2(30) not null,
    grade number, --담당 학년
    class number, --담당 반
    subject number, --담당과목
    foreign key(subject) references subjects(id)
);

create table grade_cutoffs(
    id number primary key,
    subject_id number not null,
    grade number not null, -- 등급 (예: 1, 2, 3)
    min_score number not null, -- 최소 점수
    max_score number not null, -- 최대 점수
    foreign key(subject_id) references subjects(id) on delete cascade
);

commit;
