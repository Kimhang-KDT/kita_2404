--�ǽ� : �б� ������ ���Ͽ� ���̺� 2�� �̻����� db�� �����ϰ� 3�� �̻� Ȱ���� �� �ִ� case�� ���弼��.

create table students(
    id number primary key,
    name varchar2(30) not null,
    age number,
    phone number(11),
    grade number(1) not null,
    class number(2) not null,
    address varchar2(150) not null,
    birth date,
    eeif number(11) --��󿬶���
);

create table student_health(
    id number primary key,
    student_id number not null,
    height number,
    weight number,
    personal varchar(100),
    foreign key(student_id) references students(id) on delete cascade
);

create table student_records( --�г⺰ ������
    id number primary key,
    student_id number not null,
    student_grade number not null, --�г�
    student_rank number, --�л� ����
    student_eval CLOB, --���� ��
    attendance_rate number(5,2), --�⼮��
    foreign key(student_id) references students(id) on delete cascade
);

create table subjects(
    id number primary key,
    subject varchar(20) not null
);

create table subject_record(
    id number primary key,
    subject_id number not null,
    student_id number not null,
    exam varchar2(20) not null, --�߰� Ȥ�� �⸻
    score number default 0 not null, --���� �⺻�� 0
    foreign key(student_id) references students(id) on delete cascade,
    foreign key(subject_id) references subjects(id) on delete cascade
);

create table student_parents(
    id number primary key,
    student_id number not null,
    name varchar2(30),
    phone number(11),
    living_together char, --���ſ���
    foreign key(student_id) references students(id) on delete cascade
);

create table teachers(
    id number primary key,
    name varchar2(30) not null,
    grade number, --��� �г�
    class number, --��� ��
    subject number, --������
    foreign key(subject) references subjects(id)
);