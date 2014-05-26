CREATE TABLE histories(
    id integer AUTO_INCREMENT,
    employe_id integer comment "员工ID",
    zhiwu     varchar(100) comment "职务",
    nworkplace    varchar(100) comment "新工作单位",
    oworkplace   varchar(100) comment "旧工作单位",
    changeat    timestamp(6) comment "调动时间",
    diaodongyuanyin     text comment "调动原因",
    modified timestamp(6),
    created timestamp(6),
    PRIMARY KEY (id)
);