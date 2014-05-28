CREATE TABLE department_employe(
    id integer AUTO_INCREMENT,
    employe_id integer comment "员工ID",
    department_id integer comment "部门ID",
    beizhu     text comment "备注",
    modified timestamp(6),
    created timestamp(6),
    PRIMARY KEY (id)
);
