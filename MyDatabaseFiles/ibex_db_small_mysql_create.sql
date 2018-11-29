CREATE TABLE `sample` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_individual` INT NOT NULL,
	`name` TEXT NOT NULL,
	`kind` TEXT NOT NULL,
	`coord_n` DECIMAL(9) NOT NULL,
	`coord_e` DECIMAL(9) NOT NULL,
	`deleted` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `population` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_individual` INT NOT NULL,
	`name` TEXT NOT NULL,
	`coord_n` DECIMAL(9) NOT NULL,
	`coord_e` DECIMAL(9) NOT NULL,
	`deleted` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `individual` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_population` INT NOT NULL,
	`id_sample` INT NOT NULL,
	`name` TEXT NOT NULL,
	`sex` TEXT(1) NOT NULL,
	`birthyear` DECIMAL(4) NOT NULL,
	`age` DECIMAL NOT NULL,
	`deleted` INT NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `sample` ADD CONSTRAINT `sample_fk0` FOREIGN KEY (`id_individual`) REFERENCES `individual`(`id`);

ALTER TABLE `population` ADD CONSTRAINT `population_fk0` FOREIGN KEY (`id_individual`) REFERENCES `individual`(`id`);

ALTER TABLE `individual` ADD CONSTRAINT `individual_fk0` FOREIGN KEY (`id_population`) REFERENCES `population`(`id`);

ALTER TABLE `individual` ADD CONSTRAINT `individual_fk1` FOREIGN KEY (`id_sample`) REFERENCES `sample`(`id`);

