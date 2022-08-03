ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password by '652396'; 
create database itcast;
use itcast;
CREATE TABLE IF NOT EXISTS task_master(
id INT NOT NULL AUTO_INCREMENT, 
email VARCHAR(20) NOT NULL UNIQUE,
user_name VARCHAR(20) DEFAULT NULL,
pass_word VARCHAR(20) NOT NULL,
PRIMARY KEY(id)
);
ALTER TABLE task_master ADD tag VARCHAR(20);


CREATE TABLE  IF NOT EXISTS connection_list(
id INT NOT NULL AUTO_INCREMENT,
target_id INT NOT NULL,
from_id INT NOT NULL,
flag INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY(target_id) REFERENCES task_master(id),
FOREIGN KEY(from_id) REFERENCES task_master(id)
);

CREATE TABLE  IF NOT EXISTS task(
id INT NOT NULL AUTO_INCREMENT,
title VARCHAR(50) NOT NULL,
description VARCHAR(100) NOT NULL,
tag VARCHAR(20),
task_owner INT NOT NULL,
task_status INT NOT NULL,
created_time DATE NOT NULL,
finished_time DATE,
dead_line DATE,
PRIMARY KEY(id),
FOREIGN KEY(task_owner) REFERENCES task_master(id)
);
