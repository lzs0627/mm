
CREATE TABLE wages(
    id integer AUTO_INCREMENT,
    employe_id integer comment "员工ID",
    wdate     timestamp(6) comment "考勤月份",
    wjiben      integer comment "基本工资",
    wticheng    integer comment "提成",
    wjiangli    integer comment "奖励",
    wjiaban     integer comment "加班",
    wother      integer comment "其他",
    beizhu     text comment "备注",
    modified timestamp(6),
    created timestamp(6),
    PRIMARY KEY (id)
);