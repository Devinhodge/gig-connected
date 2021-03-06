-- MySQL Script generated by MySQL Workbench
-- Sat Oct 10 13:25:04 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema admin
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema admin
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `admin` DEFAULT CHARACTER SET utf8 ;
USE `admin` ;

-- -----------------------------------------------------
-- Table `admin`.`instruments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `admin`.`instruments` (
  `instrumentId` VARCHAR(30) NOT NULL,
  `instrument_name` BINARY(1) NOT NULL,
  PRIMARY KEY (`instrumentId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `admin`.`userInstruments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `admin`.`userInstruments` (
  `userInstrumentsId` VARCHAR(20) NOT NULL,
  `userId` INT NULL,
  `instrumentId` VARCHAR(45) NULL,
  `instruments_instrumentId` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`userInstrumentsId`),
  CONSTRAINT `fk_userInstruments_instruments1`
    FOREIGN KEY (`instruments_instrumentId`)
    REFERENCES `admin`.`instruments` (`instrumentId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `admin`.`message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `admin`.`message` (
  `userId` INT NOT NULL,
  `text` VARCHAR(500) NULL,
  PRIMARY KEY (`userId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `admin`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `admin`.`users` (
  `userId` INT NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `address2` VARCHAR(45) NULL,
  `city` VARCHAR(45) NOT NULL,
  `zipcode` VARCHAR(15) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `birthday` VARCHAR(45) NOT NULL,
  `password` VARCHAR(15) NOT NULL,
  `last_active` TIMESTAMP(6) NULL,
  `instagram` VARCHAR(45) NULL,
  `facebook` VARCHAR(45) NULL,
  `twitter` VARCHAR(45) NULL,
  `user_bio` VARCHAR(45) NULL,
  `userInstruments_userInstrumentsId` VARCHAR(20) NOT NULL,
  `message_userId` INT NOT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_users_userInstruments`
    FOREIGN KEY (`userInstruments_userInstrumentsId`)
    REFERENCES `admin`.`userInstruments` (`userInstrumentsId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_message1`
    FOREIGN KEY (`message_userId`)
    REFERENCES `admin`.`message` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
