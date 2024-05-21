erDiagram
    STUDENTS {
        number id PK
        varchar2 name
        number age
        number phone
        number grade
        number class
        varchar2 address
        date birth
        number eeif
    }

    STUDENT_HEALTH {
        number id PK
        number student_id FK
        number height
        number weight
        char sex
        varchar2 blood_type
        number vision_left
        number vision_right
        varchar2 chronic
        varchar2 emergency_contact_name
        varchar2 emergency_contact_relationship
        number emergency_contact_phone
    }

    STUDENT_RECORDS {
        number id PK
        number student_id FK
        number student_grade
        number student_rank
        CLOB student_eval
        number attendance_rate
    }

    SUBJECTS {
        number id PK
        varchar subject
    }

    SUBJECT_RECORDS {
        number id PK
        number subject_id FK
        number student_id FK
        varchar2 exam
        number score
    }

    TEACHERS {
        number id PK
        varchar2 name
        number grade
        number class
        number subject FK
    }

    GRADE_CUTOFFS {
        number id PK
        number subject_id FK
        number grade
        number min_score
        number max_score
    }

    STUDENTS ||--o{ STUDENT_HEALTH : has
    STUDENTS ||--o{ STUDENT_RECORDS : has
    STUDENTS ||--o{ SUBJECT_RECORDS : has
    SUBJECTS ||--o{ SUBJECT_RECORDS : has
    SUBJECTS ||--|{ TEACHERS : taught_by
    SUBJECTS ||--o{ GRADE_CUTOFFS : has