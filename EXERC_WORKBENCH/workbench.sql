-- MySQL Workbench Synchronization
-- Generated: 2022-03-22 23:32
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: rosin

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `exercio_workbench`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

ALTER TABLE `exercio_workbench`.`filiais` 
DROP FOREIGN KEY `fk_filiais_cidades1`;

ALTER TABLE `exercio_workbench`.`empregados` 
DROP FOREIGN KEY `fk_empregados_filiais1`;

ALTER TABLE `exercio_workbench`.`vendas` 
DROP FOREIGN KEY `fk_produtos_has_filiais_filiais1`;

ALTER TABLE `exercio_workbench`.`cidades` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `exercio_workbench`.`filiais` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `exercio_workbench`.`empregados` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `exercio_workbench`.`produtos` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `exercio_workbench`.`vendas` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `exercio_workbench`.`filiais` 
ADD CONSTRAINT `fk_filiais_cidades1`
  FOREIGN KEY (`cidades_idcidades`)
  REFERENCES `exercio_workbench`.`cidades` (`idcidades`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;

ALTER TABLE `exercio_workbench`.`empregados` 
ADD CONSTRAINT `fk_empregados_filiais1`
  FOREIGN KEY (`filiais_idfiliais`)
  REFERENCES `exercio_workbench`.`filiais` (`idfiliais`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;

ALTER TABLE `exercio_workbench`.`vendas` 
DROP FOREIGN KEY `fk_produtos_has_filiais_produtos1`;

ALTER TABLE `exercio_workbench`.`vendas` ADD CONSTRAINT `fk_produtos_has_filiais_produtos1`
  FOREIGN KEY (`produtos_idprodutos`)
  REFERENCES `exercio_workbench`.`produtos` (`idprodutos`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_produtos_has_filiais_filiais1`
  FOREIGN KEY (`filiais_idfiliais`)
  REFERENCES `exercio_workbench`.`filiais` (`idfiliais`)
  ON DELETE NO RESTRICT
  ON UPDATE CASCADE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
