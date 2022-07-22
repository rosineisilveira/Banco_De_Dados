-- MySQL Workbench Synchronization
-- Generated: 2022-03-29 22:11
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: rosin

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `Aula03` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `Aula03`.`editoras` (
  `ideditoras` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ideditoras`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Aula03`.`assuntos` (
  `idassuntos` INT(11) NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idassuntos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Aula03`.`autores` (
  `matricula` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `nacionalidade` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`matricula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Aula03`.`livros` (
  `idlivros` INT(11) NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `id_editoras` INT(11) NOT NULL,
  `id_assuntos` INT(11) NOT NULL,
  `preco` VARCHAR(45) NOT NULL,
  `lancamento` DATE NOT NULL,
  PRIMARY KEY (`idlivros`),
  INDEX `fk_livros_editoras_idx` (`id_editoras` ASC) VISIBLE,
  INDEX `fk_livros_assuntos1_idx` (`id_assuntos` ASC) VISIBLE,
  CONSTRAINT `fk_livros_editoras`
    FOREIGN KEY (`id_editoras`)
    REFERENCES `Aula03`.`editoras` (`ideditoras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_livros_assuntos1`
    FOREIGN KEY (`id_assuntos`)
    REFERENCES `Aula03`.`assuntos` (`idassuntos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Aula03`.`autores_livros` (
  `id_livros` INT(11) NOT NULL,
  `id_matricula` INT(11) NOT NULL,
  PRIMARY KEY (`id_livros`, `id_matricula`),
  INDEX `fk_livros_has_autores_autores1_idx` (`id_matricula` ASC) VISIBLE,
  INDEX `fk_livros_has_autores_livros1_idx` (`id_livros` ASC) VISIBLE,
  CONSTRAINT `fk_livros_has_autores_livros1`
    FOREIGN KEY (`id_livros`)
    REFERENCES `Aula03`.`livros` (`idlivros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_livros_has_autores_autores1`
    FOREIGN KEY (`id_matricula`)
    REFERENCES `Aula03`.`autores` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
