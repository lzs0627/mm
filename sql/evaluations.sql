
CREATE TABLE evaluations(
    id integer AUTO_INCREMENT,
    employe_id integer comment "员工ID",
    kdate    timestamp(6) comment "考评月份",
    klevel  varchar(50) comment "考评级别",
    kleader varchar(50) comment "考评人",
    fenshu integer comment "考评分数",
    beizhu  text comment "备注",
    modified timestamp(6),
    created timestamp(6),
    PRIMARY KEY (id)
);