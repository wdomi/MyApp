ALTER TABLE `sample` DROP FOREIGN KEY `sample_fk0`;

ALTER TABLE `population` DROP FOREIGN KEY `population_fk0`;

ALTER TABLE `individual` DROP FOREIGN KEY `individual_fk0`;

ALTER TABLE `individual` DROP FOREIGN KEY `individual_fk1`;

DROP TABLE IF EXISTS `sample`;

DROP TABLE IF EXISTS `population`;

DROP TABLE IF EXISTS `individual`;

