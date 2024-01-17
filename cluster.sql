CREATE DB Slinkina_7lab;

USE vvsu_7lab;

CREATE TABLE IF NOT EXISTS `priorities` ( 
	`id` TINYINT AUTO_INCREMENT PRIMARY KEY, 
	`name` VARCHAR(15) NOT NULL 
); 

CREATE TABLE IF NOT EXISTS `employees` (
	`id` SMALLINT AUTO_INCREMENT PRIMARY KEY,
	`username` VARCHAR(60) NOT NULL,
	`quote` INT NOT NULL,
	`priority_id` TINYINT NOT NULL,
	CONSTRAINT fk_priority_empl 
   FOREIGN KEY (priority_id)  
      REFERENCES priorities(id) 
);

CREATE TABLE IF NOT EXISTS `requests` ( 
	`id` INT AUTO_INCREMENT PRIMARY KEY,
	`quote` INT NOT NULL, 
	`description` VARCHAR(255), 
	`desired_time` DATETIME NOT NULL, 
	`time_created` DATETIME DEFAULT CURRENT_TIMESTAMP(), 
	`priority_id` TINYINT, 
	CONSTRAINT fk_priority_req 
   FOREIGN KEY (priority_id)  
      	REFERENCES priorities(id) 
);

CREATE TABLE IF NOT EXISTS `employees_requests` (
	`employee` SMALLINT NOT NULL,
	`request` INT NOT NULL,
	PRIMARY KEY (`employee`, `request`),
	CONSTRAINT `fk_reqtoemp_employee`
		FOREIGN KEY `employee_fk` (employee)
		REFERENCES employees(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `fk_reqtoemp_request`
		FOREIGN KEY `request_fk` (request)
		REFERENCES requests(id) ON DELETE CASCADE ON UPDATE CASCADE		
);

INSERT INTO priorities (`name`) VALUES ('Высокий');
INSERT INTO priorities (`name`) VALUES ('Средний');
INSERT INTO priorities (`name`) VALUES ('Низкий');
INSERT INTO employees (`username`, `quote`, `priority_id`) VALUES ('юля', '50', '1');
INSERT INTO employees (`username`, `quote`, `priority_id`) VALUES ('алина', '28', '2');


