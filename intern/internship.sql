-- MySQL Script generated by MySQL Workbench
-- Tue Jul  9 12:46:18 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema internship
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema internship
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `internship` DEFAULT CHARACTER SET utf8 ;
USE `internship` ;

-- -----------------------------------------------------
-- Table `internship`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `internship`.`role` (
  `role_id` INT NOT NULL AUTO_INCREMENT,
  `rolename` VARCHAR(45) NULL,
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `internship`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `internship`.`user` (
  `iduser` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `telephone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `date_of_birth` DATE NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`iduser`, `role_id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `iduser_UNIQUE` (`iduser` ASC) VISIBLE,
  INDEX `fk_user_role1_idx` (`role_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `internship`.`role` (`role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `internship`.`institution`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `internship`.`institution` (
  `institution_id` INT NOT NULL AUTO_INCREMENT,
  `institution_name` VARCHAR(45) NULL,
  `location` VARCHAR(45) NULL,
  PRIMARY KEY (`institution_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `internship`.`supervisor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `internship`.`supervisor` (
  `supervisor_id` INT NOT NULL AUTO_INCREMENT,
  `supervisor_name` VARCHAR(45) NULL,
  `telephone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `institution_institution_id` INT NOT NULL,
  PRIMARY KEY (`supervisor_id`, `institution_institution_id`),
  INDEX `fk_supervisor_institution1_idx` (`institution_institution_id` ASC) VISIBLE,
  CONSTRAINT `fk_supervisor_institution1`
    FOREIGN KEY (`institution_institution_id`)
    REFERENCES `internship`.`institution` (`institution_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `internship`.`researcher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `internship`.`researcher` (
  `researcher_id` INT NOT NULL AUTO_INCREMENT,
  `researcher_name` VARCHAR(45) NULL,
  `telephone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `supervisor_id` INT NOT NULL,
  PRIMARY KEY (`researcher_id`),
  INDEX `fk_researcher_supervisor1_idx` (`supervisor_id` ASC) VISIBLE,
  CONSTRAINT `fk_researcher_supervisor1`
    FOREIGN KEY (`supervisor_id`)
    REFERENCES `internship`.`supervisor` (`supervisor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `internship`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `internship`.`category` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(45) NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `internship`.`project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `internship`.`project` (
  `project_id` INT NOT NULL AUTO_INCREMENT,
  `project_title` VARCHAR(45) NULL,
  `case-study` VARCHAR(45) NULL,
  `category_category_id` INT NOT NULL,
  `supervisor_supervisor_id` INT NOT NULL,
  PRIMARY KEY (`project_id`, `category_category_id`, `supervisor_supervisor_id`),
  INDEX `fk_project_category1_idx` (`category_category_id` ASC) VISIBLE,
  INDEX `fk_project_supervisor1_idx` (`supervisor_supervisor_id` ASC) VISIBLE,
  CONSTRAINT `fk_project_category1`
    FOREIGN KEY (`category_category_id`)
    REFERENCES `internship`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_project_supervisor1`
    FOREIGN KEY (`supervisor_supervisor_id`)
    REFERENCES `internship`.`supervisor` (`supervisor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `internship`.`researcher_has_project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `internship`.`researcher_has_project` (
  `researcher_id` INT NOT NULL,
  `project_id` INT NOT NULL,
  PRIMARY KEY (`researcher_id`, `project_id`),
  INDEX `fk_researcher_has_project_project1_idx` (`project_id` ASC) VISIBLE,
  INDEX `fk_researcher_has_project_researcher1_idx` (`researcher_id` ASC) VISIBLE,
  CONSTRAINT `fk_researcher_has_project_researcher1`
    FOREIGN KEY (`researcher_id`)
    REFERENCES `internship`.`researcher` (`researcher_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_researcher_has_project_project1`
    FOREIGN KEY (`project_id`)
    REFERENCES `internship`.`project` (`project_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
