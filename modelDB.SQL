-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema modelDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema modelDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `modelDB` DEFAULT CHARACTER SET utf8 ;
USE `modelDB` ;

-- -----------------------------------------------------
-- Table `modelDB`.`userTBL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelDB`.`userTBL` (
  `userName` CHAR(3) NOT NULL,
  `birthYear` INT NOT NULL,
  `addr` CHAR(2) NOT NULL,
  `mobile` CHAR(12) NULL,
  PRIMARY KEY (`userName`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelDB`.`buyTBL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelDB`.`buyTBL` (
  `userName` CHAR(3) NOT NULL,
  `prodName` CHAR(3) NOT NULL,
  `price` INT NOT NULL,
  `amount` INT NOT NULL,
  INDEX `fk_buyTBL_userTBL_idx` (`userName` ASC),
  CONSTRAINT `fk_buyTBL_userTBL`
    FOREIGN KEY (`userName`)
    REFERENCES `modelDB`.`userTBL` (`userName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
