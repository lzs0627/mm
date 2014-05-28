
CREATE TABLE rewards(
    id integer AUTO_INCREMENT,
    employe_id integer comment "员工ID",
    rtype     varchar(100) comment "奖罚类型",
    enterat    timestamp(6) comment "奖罚时间",
    yuanyin     text comment "奖罚原因",
    beizhu     text comment "备注",
    modified timestamp(6),
    created timestamp(6),
    PRIMARY KEY (id)
);