-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mycompany
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mycompany` ;

-- -----------------------------------------------------
-- Schema mycompany
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mycompany` DEFAULT CHARACTER SET utf8 ;
USE `mycompany` ;

-- -----------------------------------------------------
-- Table `mycompany`.`department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mycompany`.`department` ;

CREATE TABLE IF NOT EXISTS `mycompany`.`department` (
  `dept_id` INT(11) NOT NULL,
  `dept_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`dept_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mycompany`.`employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mycompany`.`employee` ;

CREATE TABLE IF NOT EXISTS `mycompany`.`employee` (
  `emp_id` INT(11) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `gender` CHAR(1) NOT NULL,
  `birth_date` DATE NOT NULL,
  `hire_date` DATE NOT NULL,
  `dept_id` INT(11) NOT NULL,
  PRIMARY KEY (`emp_id`),
  INDEX `fk_employee_department_idx` (`dept_id` ASC) VISIBLE,
  CONSTRAINT `fk_employee_department`
    FOREIGN KEY (`dept_id`)
    REFERENCES `mycompany`.`department` (`dept_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mycompany`.`salary`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mycompany`.`salary` ;

CREATE TABLE IF NOT EXISTS `mycompany`.`salary` (
  `salary_id` INT(11) NOT NULL AUTO_INCREMENT,
  `salary` DOUBLE NOT NULL,
  `from_date` DATE NOT NULL,
  `to_date` DATE NOT NULL,
  `emp_id` INT(11) NOT NULL,
  PRIMARY KEY (`salary_id`),
  CONSTRAINT `fk_salary_employee1`
    FOREIGN KEY (`emp_id`)
    REFERENCES `mycompany`.`employee` (`emp_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mycompany`.`department`
-- -----------------------------------------------------
START TRANSACTION;
USE `mycompany`;
INSERT INTO `mycompany`.`department` (`dept_id`, `dept_name`) VALUES (1, 'Production');
INSERT INTO `mycompany`.`department` (`dept_id`, `dept_name`) VALUES (2, 'Human Resource');
INSERT INTO `mycompany`.`department` (`dept_id`, `dept_name`) VALUES (3, 'Accounting and Finance');
INSERT INTO `mycompany`.`department` (`dept_id`, `dept_name`) VALUES (4, 'Marketing');
INSERT INTO `mycompany`.`department` (`dept_id`, `dept_name`) VALUES (5, 'Sales');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mycompany`.`employee`
-- -----------------------------------------------------
START TRANSACTION;
USE `mycompany`;
INSERT INTO `mycompany`.`employee` (`emp_id`, `first_name`, `last_name`, `gender`, `birth_date`, `hire_date`, `dept_id`) VALUES (1, 'Christos', 'Patsouras', 'M', '1993-09-03', '2017-02-20', 1);
INSERT INTO `mycompany`.`employee` (`emp_id`, `first_name`, `last_name`, `gender`, `birth_date`, `hire_date`, `dept_id`) VALUES (2, 'Despoina', 'Patsoura', 'F', '1996-02-21', '2018-03-06', 2);
INSERT INTO `mycompany`.`employee` (`emp_id`, `first_name`, `last_name`, `gender`, `birth_date`, `hire_date`, `dept_id`) VALUES (3, 'Vassiliki', 'Partheniou', 'F', '1962-09-01', '2001-07-15', 3);
INSERT INTO `mycompany`.`employee` (`emp_id`, `first_name`, `last_name`, `gender`, `birth_date`, `hire_date`, `dept_id`) VALUES (4, 'Dimitrios', 'Patsouras', 'M', '1948-08-25', '1998-05-13', 4);
INSERT INTO `mycompany`.`employee` (`emp_id`, `first_name`, `last_name`, `gender`, `birth_date`, `hire_date`, `dept_id`) VALUES (5, 'Nikolaos', 'Partheniou', 'M', '1964-10-13', '1999-04-08', 5);
INSERT INTO `mycompany`.`employee` (`emp_id`, `first_name`, `last_name`, `gender`, `birth_date`, `hire_date`, `dept_id`) VALUES (6, 'Marios-Markos', 'Komninakis', 'M', '1993-11-09', '2015-04-22', 1);
INSERT INTO `mycompany`.`employee` (`emp_id`, `first_name`, `last_name`, `gender`, `birth_date`, `hire_date`, `dept_id`) VALUES (7, 'Dimitrios', 'Papageorgiou', 'M', '1993-10-12', '2016-11-24', 2);
INSERT INTO `mycompany`.`employee` (`emp_id`, `first_name`, `last_name`, `gender`, `birth_date`, `hire_date`, `dept_id`) VALUES (8, 'Athanasios', 'Chalvatzaras', 'M', '1993-07-09', '2015-08-03', 3);
INSERT INTO `mycompany`.`employee` (`emp_id`, `first_name`, `last_name`, `gender`, `birth_date`, `hire_date`, `dept_id`) VALUES (9, 'Athanasios-Nikolaos', 'Kalampakas-Burger', 'M', '1993-01-03', '2017-03-01', 4);
INSERT INTO `mycompany`.`employee` (`emp_id`, `first_name`, `last_name`, `gender`, `birth_date`, `hire_date`, `dept_id`) VALUES (10, 'Evangelia', 'Giannikou', 'F', '1993-07-13', '2018-09-01', 5);
INSERT INTO `mycompany`.`employee` (`emp_id`, `first_name`, `last_name`, `gender`, `birth_date`, `hire_date`, `dept_id`) VALUES (11, 'Polyxeni-Parthena', 'Ioannidou', 'F', '1993-04-03', '2016-02-11', 1);
INSERT INTO `mycompany`.`employee` (`emp_id`, `first_name`, `last_name`, `gender`, `birth_date`, `hire_date`, `dept_id`) VALUES (12, 'Anna Maria', 'Galani', 'F', '1994-05-20', '2015-12-06', 2);
INSERT INTO `mycompany`.`employee` (`emp_id`, `first_name`, `last_name`, `gender`, `birth_date`, `hire_date`, `dept_id`) VALUES (13, 'Dimitrios', 'Skordos', 'M', '1992-10-13', '2014-06-16', 3);
INSERT INTO `mycompany`.`employee` (`emp_id`, `first_name`, `last_name`, `gender`, `birth_date`, `hire_date`, `dept_id`) VALUES (14, 'Eleni', 'Skordou', 'F', '1991-06-20', '2012-12-01', 4);
INSERT INTO `mycompany`.`employee` (`emp_id`, `first_name`, `last_name`, `gender`, `birth_date`, `hire_date`, `dept_id`) VALUES (15, 'Vassiliki', 'Patsoura', 'F', '1991-01-10', '2012-10-10', 5);
INSERT INTO `mycompany`.`employee` (`emp_id`, `first_name`, `last_name`, `gender`, `birth_date`, `hire_date`, `dept_id`) VALUES (16, 'Andreas', 'Tsoumpris', 'M', '1993-10-26', '2013-07-03', 1);
INSERT INTO `mycompany`.`employee` (`emp_id`, `first_name`, `last_name`, `gender`, `birth_date`, `hire_date`, `dept_id`) VALUES (17, 'Ilias', 'Venieris', 'M', '1993-03-13', '2018-02-02', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mycompany`.`salary`
-- -----------------------------------------------------
START TRANSACTION;
USE `mycompany`;
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (1, 95083.44, '2017-02-20', '2017-12-31', 1);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (2, 99856.32, '2018-01-01', '9999-01-01', 1);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (3, 45967.45, '2018-03-06', '9999-01-01', 2);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (4, 56785.49, '2001-07-15', '2003-09-30', 3);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (5, 62443.08, '2003-10-01', '2012-08-31', 3);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (6, 50032.45, '2012-09-01', '2015-04-30', 3);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (7, 53121.88, '2015-05-01', '9999-01-01', 3);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (8, 77056.46, '1998-05-13', '2002-03-31', 4);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (9, 79456.45, '2002-04-01', '2010-06-30', 4);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (10, 72520.08, '2010-07-01', '2013-12-31', 4);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (11, 71325.00, '2014-01-01', '9999-01-01', 4);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (12, 60547.23, '1999-04-08', '2002-11-30', 5);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (13, 65456.45, '2002-12-01', '2008-05-31', 5);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (14, 66458.26, '2008-06-01', '9999-01-01', 5);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (15, 126575.07, '2015-04-22', '9999-01-01', 6);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (16, 85485.36, '2016-11-24', '9999-01-01', 7);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (17, 96485.65, '2015-08-03', '9999-01-01', 8);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (18, 43582.56, '2017-03-01', '9999-01-01', 9);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (19, 58468.96, '2018-09-01', '9999-01-01', 10);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (20, 65875.08, '2016-02-11', '9999-01-01', 11);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (21, 72356.22, '2015-12-06', '2017-03-31', 12);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (22, 75689.65, '2017-04-01', '9999-01-01', 12);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (23, 45333.58, '2014-06-16', '9999-01-01', 13);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (24, 86452.00, '2012-12-01', '2013-08-31', 14);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (25, 83067.00, '2013-09-01', '2015-12-31', 14);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (26, 89443.00, '2016-01-01', '2017-02-28', 14);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (27, 88256.00, '2017-03-01', '9999-01-01', 14);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (28, 33568.45, '2012-10-10', '2013-12-31', 15);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (29, 38564.88, '2014-01-01', '2015-09-30', 15);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (30, 37524.09, '2015-10-01', '9999-01-01', 15);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (31, 58975.05, '2013-07-13', '2014-12-31', 16);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (32, 62556.17, '2015-01-01', '2016-05-31', 16);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (33, 60856.52, '2016-06-01', '2017-09-30', 16);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (34, 66585.44, '2017-10-31', '9999-01-01', 16);
INSERT INTO `mycompany`.`salary` (`salary_id`, `salary`, `from_date`, `to_date`, `emp_id`) VALUES (35, 75984.25, '2018-02-02', '9999-01-01', 17);

COMMIT;

