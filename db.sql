-- MySQL Script generated by MySQL Workbench
-- Fri Oct 10 16:02:30 2014
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`topic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`topic` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `date` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NULL DEFAULT NULL,
  `lastName` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(345) NULL DEFAULT NULL,
  `user` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `image` VARCHAR(45) NULL DEFAULT NULL,
  `gender` VARCHAR(45) NULL DEFAULT NULL,
  `topic_id` INT NULL DEFAULT NULL,
  `topic_id1` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_topic1_idx` (`topic_id` ASC),
  INDEX `fk_user_topic2_idx` (`topic_id1` ASC),
  CONSTRAINT `fk_user_topic1`
    FOREIGN KEY (`topic_id`)
    REFERENCES `mydb`.`topic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_topic2`
    FOREIGN KEY (`topic_id1`)
    REFERENCES `mydb`.`topic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`question` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(45) NULL DEFAULT NULL,
  `date` DATETIME NULL DEFAULT NULL,
  `vote` INT NULL DEFAULT NULL,
  `user_id` INT NOT NULL,
  `user_id1` INT NULL DEFAULT NULL,
  `topic_id` INT NULL DEFAULT NULL,
  `topic_id1` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_question_user_idx` (`user_id` ASC),
  INDEX `fk_question_user1_idx` (`user_id1` ASC),
  INDEX `fk_question_topic1_idx` (`topic_id` ASC),
  INDEX `fk_question_topic2_idx` (`topic_id1` ASC),
  CONSTRAINT `fk_question_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_user1`
    FOREIGN KEY (`user_id1`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_topic1`
    FOREIGN KEY (`topic_id`)
    REFERENCES `mydb`.`topic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_topic2`
    FOREIGN KEY (`topic_id1`)
    REFERENCES `mydb`.`topic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`answer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`answer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(45) NULL DEFAULT NULL,
  `vote` INT NULL DEFAULT NULL,
  `date` DATETIME NULL DEFAULT NULL,
  `user_id` INT NOT NULL,
  `question_id` INT NOT NULL,
  PRIMARY KEY (`id`, `question_id`),
  INDEX `fk_answer_user1_idx` (`user_id` ASC),
  INDEX `fk_answer_question1_idx` (`question_id` ASC),
  CONSTRAINT `fk_answer_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_answer_question1`
    FOREIGN KEY (`question_id`)
    REFERENCES `mydb`.`question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
