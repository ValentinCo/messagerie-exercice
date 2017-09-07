-- DROP DATABASE IF EXISTS --
DROP DATABASE IF EXISTS messagerie;

-- CREATE DATABASE -- 
CREATE DATABASE messagerie;

-- USE DATABASE -- 
USE messagerie;

-- CREATE TABLES -- 

-- CREATE TABLE USERS --
CREATE TABLE `messagerie`.`users` (
  `users_id` INT NOT NULL AUTO_INCREMENT,
  `users_first_name` VARCHAR(25) NULL,
  `users_last_name` VARCHAR(25) NULL,
  PRIMARY KEY (`users_id`));

-- CREATE TABLE MESSAGES --
CREATE TABLE `messagerie`.`messages` (
  `mes_id` INT NOT NULL,
  `mes_title` VARCHAR(45) NOT NULL,
  `mes_content` VARCHAR(255) NULL,
  `mes_date` DATE NOT NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`mes_id`),
  CONSTRAINT `fk_users_id`
    FOREIGN KEY (`users_id`)
    REFERENCES `messagerie`.`users` (`users_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- CREATE TABLE NUM_NN_USE_MES --
CREATE TABLE `messagerie`.`num_nn_use_mes` (
  `users_id` INT NOT NULL,
  `mes_id` INT NOT NULL,
  INDEX `fk_num_users_id_idx` (`users_id` ASC),
  INDEX `fk_num_mes_id_idx` (`mes_id` ASC),
  CONSTRAINT `fk_num_users_id`
    FOREIGN KEY (`users_id`)
    REFERENCES `messagerie`.`users` (`users_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_num_mes_id`
    FOREIGN KEY (`mes_id`)
    REFERENCES `messagerie`.`messages` (`mes_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);