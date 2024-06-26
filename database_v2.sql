-- drop database db_9solutions;
create database db_9solutions;
USE `db_9solutions`;
-- -----------------------------------------------------
-- Table `db_9solutions`.`faixa_etaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`faixa_etaria` (
  `id_faixa_etaria` INT NOT NULL AUTO_INCREMENT,
  `faixa_nome` VARCHAR(45) NULL,
  `limite_inferior` INT NOT NULL,
  `limite_superior` INT NOT NULL,
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
  `senha` VARCHAR(30) NULL,
  PRIMARY KEY (`id_doador`));


-- -----------------------------------------------------
-- Table `db_9solutions`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`pedido` (
  `idpedido` INT NOT NULL,
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
  `qtd` INT NOT NULL,
  `fk_faixa_etaria` INT NOT NULL,
  `fk_pedido` INT NOT NULL,
  PRIMARY KEY (`id_caixa`, `fk_faixa_etaria`, `fk_pedido`),
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
  `ativo` TINYINT NOT NULL,
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
  `fk_caixa` INT NOT NULL,
  `fk_produto` INT NOT NULL,
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
  `limite_usos` INT NOT NULL,
  `usos_atuais` INT NOT NULL,
  `ativo` TINYINT NOT NULL,
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