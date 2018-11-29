CREATE TABLE `sample` (
	`id_sample` INT NOT NULL AUTO_INCREMENT,
	`kind` TEXT NOT NULL,
	`coord_n` DECIMAL(9) NOT NULL,
	`coord_e` DECIMAL(9) NOT NULL,
	`id_individual` INT NOT NULL,
	PRIMARY KEY (`id_sample`)
);

CREATE TABLE `population` (
	`id_population` INT NOT NULL AUTO_INCREMENT,
	`name` TEXT NOT NULL,
	`coord_n` DECIMAL(9) NOT NULL,
	`coord_e` DECIMAL(9) NOT NULL,
	`id_individual` INT NOT NULL,
	PRIMARY KEY (`id_population`)
);

CREATE TABLE `individual` (
	`id_individual` INT NOT NULL AUTO_INCREMENT,
	`name` TEXT NOT NULL,
	`sex` TEXT(1) NOT NULL,
	`birthyear` DECIMAL(4) NOT NULL,
	`age` DECIMAL NOT NULL,
	`id_population` INT NOT NULL,
	`id_sample` INT NOT NULL,
	PRIMARY KEY (`id_individual`)
);

