-- MySQL Script generated by MySQL Workbench
-- Tue Apr 28 21:21:14 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Coronavirus
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Coronavirus` ;

-- -----------------------------------------------------
-- Schema Coronavirus
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Coronavirus` DEFAULT CHARACTER SET utf8 ;
USE `Coronavirus` ;

-- -----------------------------------------------------
-- Table `Coronavirus`.`Ubigeo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Coronavirus`.`Ubigeo` ;

CREATE TABLE IF NOT EXISTS `Coronavirus`.`Ubigeo` (
  `idUbigeo` INT NOT NULL AUTO_INCREMENT,
  `Distrito` VARCHAR(45) NULL,
  `Provincia` VARCHAR(45) NULL,
  `Departamento` VARCHAR(45) NULL,
  PRIMARY KEY (`idUbigeo`),
  UNIQUE INDEX `Departamento_UNIQUE` (`Departamento` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Coronavirus`.`Pais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Coronavirus`.`Pais` ;

CREATE TABLE IF NOT EXISTS `Coronavirus`.`Pais` (
  `idPais` INT NOT NULL AUTO_INCREMENT,
  `desPais` VARCHAR(60) NULL,
  PRIMARY KEY (`idPais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Coronavirus`.`TipoDocumento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Coronavirus`.`TipoDocumento` ;

CREATE TABLE IF NOT EXISTS `Coronavirus`.`TipoDocumento` (
  `idTipoDocumento` INT NOT NULL,
  `desTipoDocumento` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipoDocumento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Coronavirus`.`Ciudadano`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Coronavirus`.`Ciudadano` ;

CREATE TABLE IF NOT EXISTS `Coronavirus`.`Ciudadano` (
  `Dni` INT UNSIGNED NOT NULL,
  `NombreCompleto` VARCHAR(150) NULL,
  `Fecha_Nac` DATE NULL,
  `Direccion` VARCHAR(60) NULL,
  `idUbigeo` INT NOT NULL,
  `Sexo` VARCHAR(10) NULL,
  `Celular` VARCHAR(9) NULL,
  `Nacionalidad` INT NOT NULL,
  `TipoDocumento` INT NOT NULL,
  `NroDocumento` VARCHAR(15) NULL,
  `Email` VARCHAR(100) NULL,
  `Ahorros` VARCHAR(45) NULL,
  `Avance` VARCHAR(2) NULL,
  `Paciente` VARCHAR(45) NULL,
  `Longitud` VARCHAR(45) NULL,
  `Latitud` VARCHAR(45) NULL,
  PRIMARY KEY (`Dni`),
  INDEX `fk_idUbigeo_idx` (`idUbigeo` ASC),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC),
  INDEX `fk_Ciudadano_Pais1_idx` (`Nacionalidad` ASC),
  INDEX `fk_Ciudadano_TipoDocumento1_idx` (`TipoDocumento` ASC),
  CONSTRAINT `fk_idUbigeo`
    FOREIGN KEY (`idUbigeo`)
    REFERENCES `Coronavirus`.`Ubigeo` (`idUbigeo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ciudadano_Pais1`
    FOREIGN KEY (`Nacionalidad`)
    REFERENCES `Coronavirus`.`Pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ciudadano_TipoDocumento1`
    FOREIGN KEY (`TipoDocumento`)
    REFERENCES `Coronavirus`.`TipoDocumento` (`idTipoDocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Coronavirus`.`Triaje`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Coronavirus`.`Triaje` ;

CREATE TABLE IF NOT EXISTS `Coronavirus`.`Triaje` (
  `idTriaje` INT NOT NULL,
  `Dni` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idTriaje`),
  INDEX `fk_Triaje_Ciudadano1_idx` (`Dni` ASC),
  CONSTRAINT `fk_Triaje_Ciudadano1`
    FOREIGN KEY (`Dni`)
    REFERENCES `Coronavirus`.`Ciudadano` (`Dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Coronavirus`.`Preguntas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Coronavirus`.`Preguntas` ;

CREATE TABLE IF NOT EXISTS `Coronavirus`.`Preguntas` (
  `idPreguntas` INT NOT NULL AUTO_INCREMENT,
  `idTriaje` INT NULL,
  `tipoPregunta` VARCHAR(45) NULL,
  `DescPreguntas` VARCHAR(45) NULL,
  PRIMARY KEY (`idPreguntas`),
  INDEX `idTriaje_idx` (`idTriaje` ASC),
  CONSTRAINT `idTriaje`
    FOREIGN KEY (`idTriaje`)
    REFERENCES `Coronavirus`.`Triaje` (`idTriaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Coronavirus`.`Respuestas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Coronavirus`.`Respuestas` ;

CREATE TABLE IF NOT EXISTS `Coronavirus`.`Respuestas` (
  `idRespuestas` INT NOT NULL AUTO_INCREMENT,
  `idPreguntas` INT NULL,
  `DescRespuesta` VARCHAR(45) NULL,
  PRIMARY KEY (`idRespuestas`),
  INDEX `fk_idPreguntas_idx` (`idPreguntas` ASC),
  CONSTRAINT `fk_idPreguntas`
    FOREIGN KEY (`idPreguntas`)
    REFERENCES `Coronavirus`.`Preguntas` (`idPreguntas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Coronavirus`.`TipoUsuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Coronavirus`.`TipoUsuario` ;

CREATE TABLE IF NOT EXISTS `Coronavirus`.`TipoUsuario` (
  `idTipoUsuario` INT NOT NULL AUTO_INCREMENT,
  `desTipoUsuario` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipoUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Coronavirus`.`Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Coronavirus`.`Usuario` ;

CREATE TABLE IF NOT EXISTS `Coronavirus`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `Celular` VARCHAR(9) NULL,
  `idPais` INT NOT NULL,
  `idTipoDocumento` INT NOT NULL,
  `idTipoUsuario` INT NOT NULL,
  `NroDocumento` VARCHAR(15) NULL,
  PRIMARY KEY (`idUsuario`),
  INDEX `fk_Usuario_Pais1_idx` (`idPais` ASC),
  INDEX `fk_Usuario_TipoDocumento1_idx` (`idTipoDocumento` ASC),
  INDEX `fk_Usuario_TipoUsuario1_idx` (`idTipoUsuario` ASC),
  UNIQUE INDEX `NroDocumento_UNIQUE` (`NroDocumento` ASC),
  CONSTRAINT `fk_Usuario_Pais1`
    FOREIGN KEY (`idPais`)
    REFERENCES `Coronavirus`.`Pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_TipoDocumento1`
    FOREIGN KEY (`idTipoDocumento`)
    REFERENCES `Coronavirus`.`TipoDocumento` (`idTipoDocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_TipoUsuario1`
    FOREIGN KEY (`idTipoUsuario`)
    REFERENCES `Coronavirus`.`TipoUsuario` (`idTipoUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
