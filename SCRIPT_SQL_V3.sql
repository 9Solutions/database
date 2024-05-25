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
  `qtd` INT NULL,
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

USE `db_9solutions` ;

-- VIEWS -------------------------------------------------

-- View para KPI de qtd de caixas para serem montadas
CREATE VIEW vw_caixas_em_montagem AS
SELECT 
    COUNT(c.id_caixa) AS quantidade_caixas_em_montagem
FROM 
    caixa c
    INNER JOIN pedido p ON c.fk_pedido = p.idpedido
    INNER JOIN status_pedido sp ON p.fk_status_pedido = sp.id_status_pedido
WHERE 
    sp.status = 'Em montagem';
    
SELECT * FROM vw_caixas_em_montagem;
    
-- View para KPI de qtd de caixas para serem entregues
CREATE VIEW vw_caixas_para_entregar AS
SELECT 
    COUNT(c.id_caixa) AS quantidade_caixas_em_montagem
FROM 
    caixa c
    INNER JOIN pedido p ON c.fk_pedido = p.idpedido
    INNER JOIN status_pedido sp ON p.fk_status_pedido = sp.id_status_pedido
WHERE 
    sp.status = 'Pronto para Entrega';
    
SELECT * FROM vw_caixas_para_entregar;
    
    
-- vw para KPI de quantidade de caixas ATRASADAS
CREATE VIEW vw_caixas_atrasadas AS
SELECT 
    COUNT(c.id_caixa) AS quantidade_caixas_atrasadas
FROM 
    caixa c
    INNER JOIN pedido p ON c.fk_pedido = p.idpedido
    INNER JOIN status_pedido sp ON p.fk_status_pedido = sp.id_status_pedido
WHERE 
    p.data_pedido < NOW() - INTERVAL 2 WEEK
    AND sp.status != 'Entregue';
    
select * from vw_caixas_atrasadas;
    

-- view para qtd de pedidos por faixa etaria por meses do ano
CREATE VIEW vw_quantidade_pedidos_por_faixa_etaria AS
SELECT 
    YEAR(p.data_pedido) AS ano,
    MONTH(p.data_pedido) AS mes,
    fe.faixa_nome,
    COUNT(DISTINCT p.idpedido) AS quantidade_pedidos
FROM 
    pedido p
    INNER JOIN caixa c ON p.idpedido = c.fk_pedido
    INNER JOIN faixa_etaria fe ON c.fk_faixa_etaria = fe.id_faixa_etaria
GROUP BY 
    YEAR(p.data_pedido),
    MONTH(p.data_pedido),
    fe.faixa_nome
ORDER BY 
    ano, mes, fe.faixa_nome;
    
select * from vw_quantidade_pedidos_por_faixa_etaria;
    
    
-- view para buscar a qtd de pedidos por meses do ano
CREATE VIEW vw_quantidade_doacoes_por_mes AS
SELECT 
    YEAR(data_pedido) AS ano,
    MONTH(data_pedido) AS mes,
    COUNT(*) AS quantidade_doacoes
FROM 
    pedido
GROUP BY 
    YEAR(data_pedido),
    MONTH(data_pedido)
ORDER BY 
    ano, mes;
    
select * from vw_quantidade_doacoes_por_mes;


-- INSERTS PARA TESTE -------------------------------------
INSERT INTO faixa_etaria (faixa_nome, limite_inferior, limite_superior) VALUES 
('Criança', 0, 12),
('Adolescente', 13, 18);

-- Inserir dados na tabela status_pedido
INSERT INTO status_pedido (id_status_pedido, status) VALUES 
(1, 'Novo'),
(2, 'Em montagem'),
(3, 'Enviado'),
(4, 'Entregue');

-- Inserir dados na tabela doador
INSERT INTO doador (nome_completo, identificador, email, telefone, senha) VALUES 
('João Silva', '12345678901234', 'joao.silva@example.com', '11123456789', 'senha123'),
('Maria Oliveira', '23456789012345', 'maria.oliveira@example.com', '22123456789', 'senha456');

-- Inserir dados na tabela pedido
INSERT INTO pedido (idpedido, data_pedido, valor_total, fk_status_pedido, fk_doador) VALUES 
(5, '2023-01-01 10:00:00', 100.00, 4, 1),
(6, '2023-02-01 11:00:00', 200.00, 4, 2),
(7, '2023-03-01 12:00:00', 150.00, 4, 1),
(8, '2023-04-01 13:00:00', 250.00, 4, 2);

-- Inserir dados na tabela caixa
INSERT INTO caixa (genero, carta, url, dt_criacao, dt_entrega, qtd, fk_faixa_etaria, fk_pedido) VALUES 
('M', 'Carta 1', 'http://example.com/1', '2023-01-02 10:00:00', NULL, 5, 1, 5),
('F', 'Carta 2', 'http://example.com/2', '2023-02-02 11:00:00', NULL, 10, 2, 6),
('M', 'Carta 3', 'http://example.com/3', '2023-03-02 12:00:00', NULL, 7, 1, 7),
('F', 'Carta 4', 'http://example.com/4', '2023-04-02 13:00:00', NULL, 12, 2, 8);