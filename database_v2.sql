-- DROP DATABASE `db_9solutions`;
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
-- Table `db_9solutions`.`caixa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`caixa` (
  `id_caixa` INT NOT NULL AUTO_INCREMENT,
  `genero` CHAR(1) NOT NULL,
  `carta` TEXT NULL DEFAULT NULL,
  `url` VARCHAR(255) NULL DEFAULT NULL,
  `dt_criacao` DATETIME NULL,
  `dt_entrega` DATETIME NULL,
  `fk_faixa_etaria` INT NOT NULL,
  PRIMARY KEY (`id_caixa`, `fk_faixa_etaria`),
  INDEX `fk_caixa_faixa_etaria1_idx` (`fk_faixa_etaria` ASC) VISIBLE,
  CONSTRAINT `fk_caixa_faixa_etaria1`
    FOREIGN KEY (`fk_faixa_etaria`)
    REFERENCES `db_9solutions`.`faixa_etaria` (`id_faixa_etaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `db_9solutions`.`categoria_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`categoria_produto` (
  `id_categoria_prdouto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`id_categoria_prdouto`));


-- -----------------------------------------------------
-- Table `db_9solutions`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`produto` (
  `id_produto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(40) NULL DEFAULT NULL,
  `valor` DECIMAL(5,2) NULL DEFAULT NULL,
  `fk_categoria_produto` INT NOT NULL,
  `fk_faixa_etaria` INT NOT NULL,
  `genero` CHAR NULL,
  `ativo` TINYINT NOT NULL DEFAULT FALSE,
  PRIMARY KEY (`id_produto`, `fk_categoria_produto`, `fk_faixa_etaria`),
  INDEX `fk_produto_categoria_produto1_idx` (`fk_categoria_produto` ASC) VISIBLE,
  INDEX `fk_produto_faixa_etaria1_idx` (`fk_faixa_etaria` ASC) VISIBLE,
  CONSTRAINT `fk_produto_categoria_produto1`
    FOREIGN KEY (`fk_categoria_produto`)
    REFERENCES `db_9solutions`.`categoria_produto` (`id_categoria_prdouto`)
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
-- Table `db_9solutions`.`doador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`doador` (
  `id_doador` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `nome_completo` VARCHAR(255) NOT NULL,
  `identificador` CHAR(14) NULL DEFAULT NULL,
  `ddd` VARCHAR(4) NULL,
  `ddi` VARCHAR(4) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `dt_cadastro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `telefone` CHAR(9) NULL,
  `senha` VARCHAR(45) NULL
  );

-- -----------------------------------------------------
-- Table `db_9solutions`.`carrinho`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`carrinho` (
  `id_carrinho` INT NOT NULL,
  `fk_doador` INT NOT NULL,
  PRIMARY KEY (`id_carrinho`, `fk_doador`),
  INDEX `fk_carrinho_doador1_idx` (`fk_doador` ASC) VISIBLE,
  CONSTRAINT `fk_carrinho_doador1`
    FOREIGN KEY (`fk_doador`)
    REFERENCES `db_9solutions`.`doador` (`id_doador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_9solutions`.`caixa_carrinho`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_9solutions`.`caixa_carrinho` (
  `id_caixa_carrinho` INT NOT NULL,
  `fk_caixa` INT NOT NULL,
  `fk_carrinho` INT NOT NULL,
  `qtd` INT NULL,
  PRIMARY KEY (`id_caixa_carrinho`, `fk_caixa`, `fk_carrinho`),
  INDEX `fk_caixa_carrinho_caixa1_idx` (`fk_caixa` ASC) VISIBLE,
  INDEX `fk_caixa_carrinho_carrinho1_idx` (`fk_carrinho` ASC) VISIBLE,
  CONSTRAINT `fk_caixa_carrinho_caixa1`
    FOREIGN KEY (`fk_caixa`)
    REFERENCES `db_9solutions`.`caixa` (`id_caixa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_caixa_carrinho_carrinho1`
    FOREIGN KEY (`fk_carrinho`)
    REFERENCES `db_9solutions`.`carrinho` (`id_carrinho`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `db_9solutions` ;
