CREATE TABLE attendances(
    id integer AUTO_INCREMENT,
    employe_id integer comment "员工ID",
    kdate    timestamp(6) comment "考勤日期",
    yingdao_t    timestamp(6) comment "应到时间",
    shidao_t   timestamp(6) comment "实到时间",
    work_h      varchar(100) comment "工作时间",
    status     varchar(100) comment "出勤状况",
    qufen     varchar(100) comment "出勤区分",
    modified timestamp(6),
    created timestamp(6),
    PRIMARY KEY (id)
);