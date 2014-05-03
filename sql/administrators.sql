CREATE TABLE administrators(
    id integer AUTO_INCREMENT,
    ucode varchar(100) comment "用户编号",
    upw varchar(100) comment "ログインパスワード",
    pcode varchar(100) comment "职务",
    uname varchar(100) comment "姓名",
    enable integer DEFAULT 0 comment "是否使用",
    modified timestamp(6),
    created timestamp(6),
    PRIMARY KEY (id)
);
