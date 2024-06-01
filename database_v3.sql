-- MySQL Workbench Forward Engineering
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_9solutions
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_9solutions
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_9solutions` DEFAULT CHARACTER SET utf8 ;
USE `db_9solutions` ;

-- -----------------------------------------------------
-- Table `db_9solutions`.`faixa_etaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`faixa_etaria` (
  `id_faixa_etaria` INT NOT NULL AUTO_INCREMENT,
  `faixa_nome` VARCHAR(45) NULL,
  `limite_inferior` INT NULL,
  `limite_superior` INT NULL,
  PRIMARY KEY (`id_faixa_etaria`));


-- -----------------------------------------------------
-- Table `db_9solutions`.`status_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`status_pedido` (
  `id_status_pedido` INT NOT NULL,
  `status` VARCHAR(45) NULL,
  PRIMARY KEY (`id_status_pedido`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_9solutions`.`doador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`doador` (
  `id_doador` INT NOT NULL AUTO_INCREMENT,
  `nome_completo` VARCHAR(255) NOT NULL,
  `identificador` CHAR(14) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `dt_cadastro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `telefone` VARCHAR(20) NULL,
  `senha` VARCHAR(255) NULL,
  PRIMARY KEY (`id_doador`));


-- -----------------------------------------------------
-- Table `db_9solutions`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`pedido` (
  `idpedido` INT NOT NULL auto_increment,
  `data_pedido` DATETIME NULL,
  `valor_total` DOUBLE NULL,
  `fk_status_pedido` INT NOT NULL,
  `fk_doador` INT NOT NULL,
  PRIMARY KEY (`idpedido`, `fk_status_pedido`, `fk_doador`),
  INDEX `fk_pedido_status_pedido1_idx` (`fk_status_pedido` ASC) VISIBLE,
  INDEX `fk_pedido_doador1_idx` (`fk_doador` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_status_pedido1`
    FOREIGN KEY (`fk_status_pedido`)
    REFERENCES `db_9solutions`.`status_pedido` (`id_status_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_doador1`
    FOREIGN KEY (`fk_doador`)
    REFERENCES `db_9solutions`.`doador` (`id_doador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_9solutions`.`caixa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`caixa` (
  `id_caixa` INT NOT NULL AUTO_INCREMENT,
  `genero` CHAR(1) NOT NULL,
  `carta` TEXT NULL DEFAULT NULL,
  `url` VARCHAR(255) NULL DEFAULT NULL,
  `dt_criacao` DATETIME NULL,
  `dt_entrega` DATETIME NULL,
  `qtd` INT NULL,
  `fk_faixa_etaria` INT NOT NULL,
  `fk_pedido` INT NOT NULL,
  PRIMARY KEY (`id_caixa`),
  INDEX `fk_caixa_faixa_etaria1_idx` (`fk_faixa_etaria` ASC) VISIBLE,
  INDEX `fk_caixa_pedido1_idx` (`fk_pedido` ASC) VISIBLE,
  CONSTRAINT `fk_caixa_faixa_etaria1`
    FOREIGN KEY (`fk_faixa_etaria`)
    REFERENCES `db_9solutions`.`faixa_etaria` (`id_faixa_etaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_caixa_pedido1`
    FOREIGN KEY (`fk_pedido`)
    REFERENCES `db_9solutions`.`pedido` (`idpedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `db_9solutions`.`categoria_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`categoria_produto` (
  `id_categoria_produto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`id_categoria_produto`));


-- -----------------------------------------------------
-- Table `db_9solutions`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`produto` (
  `id_produto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(40) NULL DEFAULT NULL,
  `valor` DECIMAL(5,2) NULL DEFAULT NULL,
  `genero` CHAR NULL,
  `ativo` TINYINT NULL,
  `fk_categoria_produto` INT NOT NULL,
  `fk_faixa_etaria` INT NOT NULL,
  PRIMARY KEY (`id_produto`, `fk_categoria_produto`, `fk_faixa_etaria`),
  INDEX `fk_produto_categoria_produto1_idx` (`fk_categoria_produto` ASC) VISIBLE,
  INDEX `fk_produto_faixa_etaria1_idx` (`fk_faixa_etaria` ASC) VISIBLE,
  CONSTRAINT `fk_produto_categoria_produto1`
    FOREIGN KEY (`fk_categoria_produto`)
    REFERENCES `db_9solutions`.`categoria_produto` (`id_categoria_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_faixa_etaria1`
    FOREIGN KEY (`fk_faixa_etaria`)
    REFERENCES `db_9solutions`.`faixa_etaria` (`id_faixa_etaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `db_9solutions`.`item_caixa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`item_caixa` (
  `id_produto_caixa` INT NOT NULL AUTO_INCREMENT,
  `fk_caixa` INT NULL DEFAULT NULL,
  `fk_produto` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_produto_caixa`),
  INDEX `fk_tbItemCaixa_tbCaixa` (`fk_caixa` ASC) VISIBLE,
  INDEX `fk_tbItemCaixa_tbItem` (`fk_produto` ASC) VISIBLE,
  CONSTRAINT `fk_tbItemCaixa_tbCaixa`
    FOREIGN KEY (`fk_caixa`)
    REFERENCES `db_9solutions`.`caixa` (`id_caixa`),
  CONSTRAINT `fk_tbItemCaixa_tbItem`
    FOREIGN KEY (`fk_produto`)
    REFERENCES `db_9solutions`.`produto` (`id_produto`));


-- -----------------------------------------------------
-- Table `db_9solutions`.`metodo_pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`metodo_pagamento` (
  `id_metodo_pagamento` INT NOT NULL,
  `tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`id_metodo_pagamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_9solutions`.`metodo_pagamento_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`metodo_pagamento_pedido` (
  `fk_metodo_pagamento` INT NOT NULL,
  `fk_pedido` INT NOT NULL,
  `provedor` VARCHAR(45) NULL,
  `numero_conta` VARCHAR(45) NULL,
  `data_expiracao` DATETIME NULL,
  PRIMARY KEY (`fk_metodo_pagamento`, `fk_pedido`),
  INDEX `fk_doador_has_tipo_pagamento_tipo_pagamento1_idx` (`fk_metodo_pagamento` ASC) VISIBLE,
  INDEX `fk_metodo_pagamento_doador_pedido1_idx` (`fk_pedido` ASC) VISIBLE,
  CONSTRAINT `fk_doador_has_tipo_pagamento_tipo_pagamento1`
    FOREIGN KEY (`fk_metodo_pagamento`)
    REFERENCES `db_9solutions`.`metodo_pagamento` (`id_metodo_pagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_metodo_pagamento_doador_pedido1`
    FOREIGN KEY (`fk_pedido`)
    REFERENCES `db_9solutions`.`pedido` (`idpedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `db_9solutions`.`cupom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`cupom` (
  `id_cupom` INT NOT NULL,
  `codigo` VARCHAR(45) NULL,
  `desconto_percentual` DECIMAL(5,2) NULL,
  `desconto_fixo` DECIMAL(10,2) NULL,
  `validade_inicio` DATETIME NULL,
  `validade_fim` DATETIME NULL,
  `limite_usos` INT NULL,
  `usos_atuais` INT NULL,
  `ativo` TINYINT NULL,
  PRIMARY KEY (`id_cupom`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_9solutions`.`cupom_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`cupom_pedido` (
  `id_cupom_pedido` INT NOT NULL,
  `cupom_id_cupom` INT NOT NULL,
  `pedido_idpedido` INT NOT NULL,
  PRIMARY KEY (`id_cupom_pedido`, `cupom_id_cupom`, `pedido_idpedido`),
  INDEX `fk_cupom_pedido_cupom1_idx` (`cupom_id_cupom` ASC) VISIBLE,
  INDEX `fk_cupom_pedido_pedido1_idx` (`pedido_idpedido` ASC) VISIBLE,
  CONSTRAINT `fk_cupom_pedido_cupom1`
    FOREIGN KEY (`cupom_id_cupom`)
    REFERENCES `db_9solutions`.`cupom` (`id_cupom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cupom_pedido_pedido1`
    FOREIGN KEY (`pedido_idpedido`)
    REFERENCES `db_9solutions`.`pedido` (`idpedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_9solutions`.`cupom_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`cupom_pedido` (
  `id_cupom_pedido` INT NOT NULL,
  `cupom_id_cupom` INT NOT NULL,
  `pedido_idpedido` INT NOT NULL,
  PRIMARY KEY (`id_cupom_pedido`, `cupom_id_cupom`, `pedido_idpedido`),
  INDEX `fk_cupom_pedido_cupom1_idx` (`cupom_id_cupom` ASC) VISIBLE,
  INDEX `fk_cupom_pedido_pedido1_idx` (`pedido_idpedido` ASC) VISIBLE,
  CONSTRAINT `fk_cupom_pedido_cupom1`
    FOREIGN KEY (`cupom_id_cupom`)
    REFERENCES `db_9solutions`.`cupom` (`id_cupom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cupom_pedido_pedido1`
    FOREIGN KEY (`pedido_idpedido`)
    REFERENCES `db_9solutions`.`pedido` (`idpedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_9solutions`.`status_caixa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`status_caixa` (
  `id_status_caixa` INT NOT NULL,
  `status` VARCHAR(45) NULL,
  PRIMARY KEY (`id_status_caixa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_9solutions`.`etapa_caixa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`etapa_caixa` (
`id_etapa_caixa` int not null auto_increment,
  `fk_status` INT NOT NULL,
  `fk_id_caixa` INT NOT NULL,
  `update_at` DATETIME NULL,
  PRIMARY KEY (`id_etapa_caixa`),
  INDEX `fk_status_caixa_has_caixa_caixa1_idx` (`fk_id_caixa` ASC) VISIBLE,
  INDEX `fk_status_caixa_has_caixa_status_caixa1_idx` (`fk_status` ASC) VISIBLE,
  CONSTRAINT `fk_status_caixa_has_caixa_status_caixa1`
    FOREIGN KEY (`fk_status`)
    REFERENCES `db_9solutions`.`status_caixa` (`id_status_caixa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_status_caixa_has_caixa_caixa1`
    FOREIGN KEY (`fk_id_caixa`)
    REFERENCES `db_9solutions`.`caixa` (`id_caixa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `db_9solutions` ;

-- -----------------------------------------------------
-- Placeholder table for view `db_9solutions`.`vw_top_itens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`vw_top_itens` (`'quant_item'` INT, `item_nome` INT);

-- -----------------------------------------------------
-- Placeholder table for view `db_9solutions`.`vw_top_range`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`vw_top_range` (`'freq_range'` INT, `range_idade` INT);

-- -----------------------------------------------------
-- Placeholder table for view `db_9solutions`.`vw_caixas_abandonadas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`vw_caixas_abandonadas` (`'qtd_caixas_abandonadas'` INT);

-- -----------------------------------------------------
-- Placeholder table for view `db_9solutions`.`vw_resumo_pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`vw_resumo_pedidos` (`id` INT);

-- -----------------------------------------------------
-- Placeholder table for view `db_9solutions`.`vw_caixa_ano_faixa_etaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`vw_caixa_ano_faixa_etaria` (`id_caixa` INT, `genero` INT, `carta` INT, `url` INT, `dt_criacao` INT, `dt_entrega` INT, `qtd` INT, `fk_faixa_etaria` INT, `fk_pedido` INT);

-- -----------------------------------------------------
-- Placeholder table for view `db_9solutions`.`vw_caixas_para_entregar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`vw_caixas_para_entregar` (`id_caixa` INT, `genero` INT, `carta` INT, `url` INT, `dt_criacao` INT, `dt_entrega` INT, `qtd` INT, `fk_faixa_etaria` INT, `fk_pedido` INT);

-- -----------------------------------------------------
-- Placeholder table for view `db_9solutions`.`vw_caixas_em_montagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`vw_caixas_em_montagem` (`id_caixa` INT, `genero` INT, `carta` INT, `url` INT, `dt_criacao` INT, `dt_entrega` INT, `qtd` INT, `fk_faixa_etaria` INT, `fk_pedido` INT);

-- -----------------------------------------------------
-- Placeholder table for view `db_9solutions`.`vw_caixas_atrasadas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`vw_caixas_atrasadas` (`id_caixa` INT, `genero` INT, `carta` INT, `url` INT, `dt_criacao` INT, `dt_entrega` INT, `qtd` INT, `fk_faixa_etaria` INT, `fk_pedido` INT);

-- -----------------------------------------------------
-- Placeholder table for view `db_9solutions`.`vw_total_doacoes_mes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`vw_total_doacoes_mes` (`idpedido` INT, `data_pedido` INT, `valor_total` INT, `fk_status_pedido` INT, `fk_doador` INT);

-- -----------------------------------------------------
-- Placeholder table for view `db_9solutions`.`vw_quantidade_produtos_por_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`vw_quantidade_produtos_por_categoria` (`idpedido` INT, `data_pedido` INT, `valor_total` INT, `fk_status_pedido` INT, `fk_doador` INT);

-- -----------------------------------------------------
-- View `db_9solutions`.`vw_top_itens`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_9solutions`.`vw_top_itens`;
USE `db_9solutions`;
CREATE  OR REPLACE VIEW `vw_top_itens` AS
	SELECT COUNT(fk_produto) AS 'quant_item', nome FROM item_caixa
    INNER JOIN produto
		ON item_caixa.fk_produto = produto.id_produto
	GROUP BY fk_produto
    ORDER BY quant_item DESC;

-- -----------------------------------------------------
-- View `db_9solutions`.`vw_top_range`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_9solutions`.`vw_top_range`;
USE `db_9solutions`;
CREATE  OR REPLACE VIEW `vw_top_range` AS
	SELECT COUNT(range_idade) AS 'freq_range', range_idade FROM caixa
    GROUP BY range_idade
    ORDER BY freq_range;

-- -----------------------------------------------------
-- View `db_9solutions`.`vw_caixas_abandonadas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_9solutions`.`vw_caixas_abandonadas`;
USE `db_9solutions`;
CREATE  OR REPLACE VIEW `vw_caixas_abandonadas` AS
	SELECT COUNT(id_caixa) AS 'qtd_caixas_abandonadas' FROM caixa
    WHERE fk_doador IS NULL;

-- -----------------------------------------------------
-- View `db_9solutions`.`vw_resumo_pedidos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_9solutions`.`vw_resumo_pedidos`;
USE `db_9solutions`;
CREATE  OR REPLACE VIEW `vw_resumo_pedidos` AS
select * from pedidos;

-- -----------------------------------------------------
-- View `db_9solutions`.`vw_caixa_ano_faixa_etaria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_9solutions`.`vw_caixa_ano_faixa_etaria`;
USE `db_9solutions`;
CREATE  OR REPLACE VIEW `vw_caixa_ano_faixa_etaria` AS
select * from caixa;

-- -----------------------------------------------------
-- View `db_9solutions`.`vw_caixas_para_entregar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_9solutions`.`vw_caixas_para_entregar`;
USE `db_9solutions`;
CREATE  OR REPLACE VIEW `vw_caixas_para_entregar` AS
select * from caixa;

-- -----------------------------------------------------
-- View `db_9solutions`.`vw_caixas_em_montagem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_9solutions`.`vw_caixas_em_montagem`;
USE `db_9solutions`;
CREATE  OR REPLACE VIEW `vw_caixas_em_montagem` AS
select * from caixa;

-- -----------------------------------------------------
-- View `db_9solutions`.`vw_caixas_atrasadas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_9solutions`.`vw_caixas_atrasadas`;
USE `db_9solutions`;
CREATE  OR REPLACE VIEW `vw_caixas_atrasadas` AS
select * from caixa;

-- -----------------------------------------------------
-- View `db_9solutions`.`vw_total_doacoes_mes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_9solutions`.`vw_total_doacoes_mes`;
USE `db_9solutions`;
CREATE  OR REPLACE VIEW `vw_total_doacoes_mes` AS
select * from pedido;

-- -----------------------------------------------------
-- View `db_9solutions`.`vw_quantidade_produtos_por_categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_9solutions`.`vw_quantidade_produtos_por_categoria`;
USE `db_9solutions`;
CREATE  OR REPLACE VIEW `vw_quantidade_produtos_por_categoria` AS
select * from pedido;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
