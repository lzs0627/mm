alter table attendances add foreign key (employe_id) references employe(id);
alter table rewards add foreign key (employe_id) references employe(id);
alter table histories add foreign key (employe_id) references employe(id);
alter table evaluations add foreign key (employe_id) references employe(id);
alter table wages add foreign key (employe_id) references employe(id);
alter table department_employe add foreign key (employe_id) references employe(id);
alter table department_employe add foreign key (department_id) references departments(id);