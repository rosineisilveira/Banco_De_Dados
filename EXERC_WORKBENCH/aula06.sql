-- MySQL Workbench Synchronization
-- Generated: 2022-04-10 18:02
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: rosin

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `aula06_ap1` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `aula06_ap1`.`itens` (
  `iditens` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `valor` DOUBLE NOT NULL,
  `saldo` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`iditens`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `aula06_ap1`.`orcamentos` (
  `idorcamentos` INT(11) NOT NULL,
  `data` DATE NOT NULL,
  `status` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idorcamentos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `aula06_ap1`.`orcamentos_itens` (
  `orcamentos_idorcamentos` INT(11) NOT NULL,
  `itens_iditens` INT(11) NOT NULL,
  `valor_unit` DOUBLE NULL DEFAULT NULL,
  `quantidade` INT(11) NULL DEFAULT NULL,
  `valor_unit_item` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`orcamentos_idorcamentos`, `itens_iditens`),
  INDEX `fk_orcamentos_has_itens_itens1_idx` (`itens_iditens` ASC) VISIBLE,
  INDEX `fk_orcamentos_has_itens_orcamentos_idx` (`orcamentos_idorcamentos` ASC) VISIBLE,
  CONSTRAINT `fk_orcamentos_has_itens_orcamentos`
    FOREIGN KEY (`orcamentos_idorcamentos`)
    REFERENCES `aula06_ap1`.`orcamentos` (`idorcamentos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orcamentos_has_itens_itens1`
    FOREIGN KEY (`itens_iditens`)
    REFERENCES `aula06_ap1`.`itens` (`iditens`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
