create table if not exists exams
(
    id       int auto_increment,
    subject  varchar(100) not null,
    date     date         null,
    location varchar(255) null,
    constraint id_UNIQUE
        unique (id),
    constraint subject_UNIQUE
        unique (subject)
);

alter table exams
    add primary key (id);

create table if not exists hibernate_sequence
(
    next_val bigint null
);

create table if not exists majors
(
    id         int auto_increment,
    title      varchar(255)  not null,
    capacity   int default 0 null,
    applicants int           not null,
    constraint id_UNIQUE
        unique (id),
    constraint title_UNIQUE
        unique (title)
);

alter table majors
    add primary key (id);

create table if not exists major_exams
(
    major_id int not null,
    exam_id  int not null,
    primary key (major_id, exam_id),
    constraint exam_id
        foreign key (exam_id) references exams (id),
    constraint major_id
        foreign key (major_id) references majors (id)
);

create index exam_id_idx
    on major_exams (exam_id);

create index major_id_idx
    on major_exams (major_id);

create table if not exists users
(
    id         int auto_increment,
    email      varchar(100)                  not null,
    password   varchar(100)                  not null,
    first_name varchar(100)                  null,
    last_name  varchar(100)                  null,
    role       varchar(20) default 'STUDENT' not null,
    constraint email_UNIQUE
        unique (email),
    constraint id_UNIQUE
        unique (id)
);

alter table users
    add primary key (id);

create table if not exists student_exams
(
    student_id int           not null,
    exam_id    int           not null,
    mark       int default 0 null,
    primary key (student_id, exam_id),
    constraint `exam-id`
        foreign key (exam_id) references exams (id),
    constraint `student-id`
        foreign key (student_id) references users (id)
);

create index exam_id_idx
    on student_exams (exam_id);

create table if not exists student_majors
(
    student_id int              not null,
    major_id   int              not null,
    you_passed bit default b'0' not null,
    primary key (student_id, major_id),
    constraint student_id
        foreign key (student_id) references users (id),
    constraint student_majors
        foreign key (major_id) references majors (id)
);

create index student_id_idx
    on student_majors (student_id);

create index student_majors_idx
    on student_majors (major_id);

create view information_schema.ADMINISTRABLE_ROLE_AUTHORIZATIONS as -- missing source code
;

create view information_schema.APPLICABLE_ROLES as -- missing source code
;

create view information_schema.CHARACTER_SETS as -- missing source code
;

create view information_schema.CHECK_CONSTRAINTS as -- missing source code
;

create view information_schema.COLLATIONS as -- missing source code
;

create view information_schema.COLLATION_CHARACTER_SET_APPLICABILITY as -- missing source code
;

create view information_schema.COLUMNS as -- missing source code
;

create view information_schema.COLUMN_PRIVILEGES as -- missing source code
;

create view information_schema.COLUMN_STATISTICS as -- missing source code
;

create view information_schema.ENABLED_ROLES as -- missing source code
;

create view information_schema.ENGINES as -- missing source code
;

create view information_schema.EVENTS as -- missing source code
;

create view information_schema.FILES as -- missing source code
;

create view information_schema.INNODB_BUFFER_PAGE as -- missing source code
;

create view information_schema.INNODB_BUFFER_PAGE_LRU as -- missing source code
;

create view information_schema.INNODB_BUFFER_POOL_STATS as -- missing source code
;

create view information_schema.INNODB_CACHED_INDEXES as -- missing source code
;

create view information_schema.INNODB_CMP as -- missing source code
;

create view information_schema.INNODB_CMPMEM as -- missing source code
;

create view information_schema.INNODB_CMPMEM_RESET as -- missing source code
;

create view information_schema.INNODB_CMP_PER_INDEX as -- missing source code
;

create view information_schema.INNODB_CMP_PER_INDEX_RESET as -- missing source code
;

create view information_schema.INNODB_CMP_RESET as -- missing source code
;

create view information_schema.INNODB_COLUMNS as -- missing source code
;

create view information_schema.INNODB_DATAFILES as -- missing source code
;

create view information_schema.INNODB_FIELDS as -- missing source code
;

create view information_schema.INNODB_FOREIGN as -- missing source code
;

create view information_schema.INNODB_FOREIGN_COLS as -- missing source code
;

create view information_schema.INNODB_FT_BEING_DELETED as -- missing source code
;

create view information_schema.INNODB_FT_CONFIG as -- missing source code
;

create view information_schema.INNODB_FT_DEFAULT_STOPWORD as -- missing source code
;

create view information_schema.INNODB_FT_DELETED as -- missing source code
;

create view information_schema.INNODB_FT_INDEX_CACHE as -- missing source code
;

create view information_schema.INNODB_FT_INDEX_TABLE as -- missing source code
;

create view information_schema.INNODB_INDEXES as -- missing source code
;

create view information_schema.INNODB_METRICS as -- missing source code
;

create view information_schema.INNODB_SESSION_TEMP_TABLESPACES as -- missing source code
;

create view information_schema.INNODB_TABLES as -- missing source code
;

create view information_schema.INNODB_TABLESPACES as -- missing source code
;

create view information_schema.INNODB_TABLESPACES_BRIEF as -- missing source code
;

create view information_schema.INNODB_TABLESTATS as -- missing source code
;

create view information_schema.INNODB_TEMP_TABLE_INFO as -- missing source code
;

create view information_schema.INNODB_TRX as -- missing source code
;

create view information_schema.INNODB_VIRTUAL as -- missing source code
;

create view information_schema.KEYWORDS as -- missing source code
;

create view information_schema.KEY_COLUMN_USAGE as -- missing source code
;

create view information_schema.OPTIMIZER_TRACE as -- missing source code
;

create view information_schema.PARAMETERS as -- missing source code
;

create view information_schema.PARTITIONS as -- missing source code
;

create view information_schema.PLUGINS as -- missing source code
;

create view information_schema.PROCESSLIST as -- missing source code
;

create view information_schema.PROFILING as -- missing source code
;

create view information_schema.REFERENTIAL_CONSTRAINTS as -- missing source code
;

create view information_schema.RESOURCE_GROUPS as -- missing source code
;

create view information_schema.ROLE_COLUMN_GRANTS as -- missing source code
;

create view information_schema.ROLE_ROUTINE_GRANTS as -- missing source code
;

create view information_schema.ROLE_TABLE_GRANTS as -- missing source code
;

create view information_schema.ROUTINES as -- missing source code
;

create view information_schema.SCHEMATA as -- missing source code
;

create view information_schema.SCHEMA_PRIVILEGES as -- missing source code
;

create view information_schema.STATISTICS as -- missing source code
;

create view information_schema.ST_GEOMETRY_COLUMNS as -- missing source code
;

create view information_schema.ST_SPATIAL_REFERENCE_SYSTEMS as -- missing source code
;

create view information_schema.ST_UNITS_OF_MEASURE as -- missing source code
;

create view information_schema.TABLES as -- missing source code
;

create view information_schema.TABLESPACES as -- missing source code
;

create view information_schema.TABLE_CONSTRAINTS as -- missing source code
;

create view information_schema.TABLE_PRIVILEGES as -- missing source code
;

create view information_schema.TRIGGERS as -- missing source code
;

create view information_schema.USER_PRIVILEGES as -- missing source code
;

create view information_schema.VIEWS as -- missing source code
;

create view information_schema.VIEW_ROUTINE_USAGE as -- missing source code
;

create view information_schema.VIEW_TABLE_USAGE as -- missing source code
;


