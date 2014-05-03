CREATE TABLE departments(
    id integer AUTO_INCREMENT,
    dcode varchar(100) comment "部门编号",
    dname varchar(100) comment "部门名称",
    description text comment "部门职能描述",
    modified timestamp(6),
    created timestamp(6),
    PRIMARY KEY (id)
);
