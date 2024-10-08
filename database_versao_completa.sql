CREATE SCHEMA IF NOT EXISTS `db_9solutions` DEFAULT CHARACTER SET utf8 ;
USE `db_9solutions`;

CREATE TABLE IF NOT EXISTS `db_9solutions`.`faixa_etaria` (
  `id_faixa_etaria` INT NOT NULL AUTO_INCREMENT,
  `faixa_nome` VARCHAR(45) NULL,
  `limite_inferior` INT NULL,
  `limite_superior` INT NULL,
  `condicao` TINYINT NOT NULL,
  PRIMARY KEY (`id_faixa_etaria`));


CREATE TABLE IF NOT EXISTS `db_9solutions`.`status_pedido` (
  `id_status_pedido` INT NOT NULL,
  `status` VARCHAR(45) NULL,
  PRIMARY KEY (`id_status_pedido`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `db_9solutions`.`doador` (
  `id_doador` INT NOT NULL AUTO_INCREMENT,
  `nome_completo` VARCHAR(255) NOT NULL,
  `identificador` CHAR(14) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `dt_cadastro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `permissao` VARCHAR(20) NOT NULL,
  `telefone` VARCHAR(20) NULL,
  `senha` VARCHAR(255) NULL,
  PRIMARY KEY (`id_doador`));


CREATE TABLE IF NOT EXISTS `db_9solutions`.`pedido` (
  `idpedido` INT NOT NULL auto_increment,
  `data_pedido` DATE NULL,
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


CREATE TABLE IF NOT EXISTS `db_9solutions`.`caixa` (
  `id_caixa` INT NOT NULL AUTO_INCREMENT,
  `genero` CHAR(1) NOT NULL,
  `carta` TEXT NULL DEFAULT NULL,
  `url` VARCHAR(255) NULL DEFAULT NULL,
  `dt_criacao` DATE NULL,
  `dt_entrega` DATE NULL,
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
    

CREATE TABLE IF NOT EXISTS `db_9solutions`.`categoria_produto` (
  `id_categoria_produto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(40) NOT NULL,
  `condicao` TINYINT NOT NULL,
  `qtde_produtos` INT NOT NULL,
  `estagio` tinyint NOT NULL ,
  PRIMARY KEY (`id_categoria_produto`));
  
  
  CREATE TABLE IF NOT EXISTS `db_9solutions`.`produto` (
  `id_produto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(40) NULL DEFAULT NULL,
  `valor` DECIMAL(5,2) NULL DEFAULT NULL,
  `genero` CHAR NULL,
  `condicao` TINYINT NOT NULL,
  `url_imagem` VARCHAR(256) NOT NULL, 
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
  
  
CREATE TABLE IF NOT EXISTS `db_9solutions`.`metodo_pagamento` (
  `id_metodo_pagamento` INT NOT NULL,
  `tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`id_metodo_pagamento`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `db_9solutions`.`metodo_pagamento_pedido` (
  `fk_metodo_pagamento` INT NOT NULL,
  `fk_pedido` INT NOT NULL,
  `provedor` VARCHAR(45) NULL,
  `numero_conta` VARCHAR(45) NULL,
  `data_expiracao` DATE NULL,
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
    
CREATE TABLE IF NOT EXISTS `db_9solutions`.`empresa` (
  `id_empresa` INT NOT NULL,
  `nome` VARCHAR(100) NULL,
  `email_contato` VARCHAR(200) NULL,
  PRIMARY KEY (`id_empresa`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `db_9solutions`.`cupom` (
  `id_cupom` INT NOT NULL,
  `codigo` VARCHAR(45) NULL,
  `desconto_percentual` DECIMAL(5,2) NULL,
  `desconto_fixo` DECIMAL(10,2) NULL,
  `validade_inicio` DATE NULL,
  `validade_fim` DATE NULL,
  `limite_usos` INT NULL,
  `usos_atuais` INT NULL,
  `ativo` TINYINT NULL,
	`fk_empresa` INT NOT NULL,
  PRIMARY KEY (`id_cupom`),
    FOREIGN KEY (`fk_empresa`)
    REFERENCES `db_9solutions`.`empresa` (`id_empresa`))
ENGINE = InnoDB;


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


CREATE TABLE IF NOT EXISTS `db_9solutions`.`status_caixa` (
  `id_status_caixa` INT NOT NULL,
  `status` VARCHAR(45) NULL,
  PRIMARY KEY (`id_status_caixa`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `db_9solutions`.`etapa_caixa` (
  `id_etapa_caixa` int not null auto_increment,
  `fk_status` INT NOT NULL,
  `fk_id_caixa` INT NOT NULL,
  `update_at` DATE NULL,
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


-- -----------------------------------------------------
-- CRIAÇÃO DAS VIEWS
-- -----------------------------------------------------
USE `db_9solutions` ;

CREATE OR REPLACE VIEW vw_caixas_em_montagem AS
SELECT
    COUNT(id_etapa_caixa) AS quantidade_caixas_em_montagem
FROM (
        SELECT MAX(etapa_caixa.id_etapa_caixa) AS id_etapa_caixa, MAX(etapa_caixa.fk_status) AS fk_status
        FROM etapa_caixa
        GROUP BY etapa_caixa.fk_id_caixa
    ) AS etapas_max_caixas
    INNER JOIN status_caixa ON status_caixa.id_status_caixa = etapas_max_caixas.fk_status
WHERE
    status_caixa.status = 'Pronta para montagem';


CREATE OR REPLACE VIEW vw_caixas_para_entregar AS
SELECT
    COUNT(id_etapa_caixa) AS quantidade_caixas_para_entregar
FROM (
        SELECT MAX(etapa_caixa.id_etapa_caixa) AS id_etapa_caixa, MAX(etapa_caixa.fk_status) AS fk_status
        FROM etapa_caixa
        GROUP BY etapa_caixa.fk_id_caixa
    ) AS etapas_max_caixas
    INNER JOIN status_caixa ON status_caixa.id_status_caixa = etapas_max_caixas.fk_status
WHERE
    status_caixa.status = 'Pronta para entrega';
    
    
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


CREATE VIEW vw_qtd_pedidos_por_faixa_etaria AS
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
    
    
CREATE VIEW vw_pedidos_por_mes AS
SELECT 
    p.idpedido,
    p.data_pedido,
    p.valor_total,
    p.fk_status_pedido,
    p.fk_doador,
    DAY(p.data_pedido) AS dia,
    MONTH(p.data_pedido) AS mes,
    YEAR(p.data_pedido) AS ano
FROM 
    pedido p
ORDER BY 
    ano, mes, dia;
    
    
CREATE VIEW vw_qtd_produtos_por_categoria AS
SELECT 
    YEAR(p.data_pedido) AS ano,
    pr.nome AS produto,
    cp.nome AS categoria,
    COUNT(ic.id_produto_caixa) AS quantidade_produtos_doacao
FROM 
    pedido p
    INNER JOIN caixa c ON p.idpedido = c.fk_pedido
    INNER JOIN item_caixa ic ON c.id_caixa = ic.fk_caixa
    INNER JOIN produto pr ON ic.fk_produto = pr.id_produto
    INNER JOIN categoria_produto cp ON pr.fk_categoria_produto = cp.id_categoria_produto
WHERE 
    cp.nome = 'DOCES'
GROUP BY 
    YEAR(p.data_pedido),
    pr.nome,
    cp.nome
ORDER BY 
    ano, produto;
    

CREATE OR REPLACE VIEW `vw_filtros_pedidos` AS
SELECT pedido.*, max_status_caixa.*, IFNULL(qtd_caixas_with_null, 0) AS qtd_caixas
FROM
    pedido
    JOIN (
        SELECT
            MAX(etapa_caixa.id_etapa_caixa) AS id_etapa_caixa,
            MAX(etapa_caixa.fk_status) AS fk_status,
            MAX(fk_id_caixa) AS idCaixa,
            MAX(fk_pedido) AS fk_pedido,
            COUNT(DISTINCT caixa.id_caixa) AS qtd_caixas_with_null
        FROM etapa_caixa
            INNER JOIN caixa ON caixa.id_caixa = etapa_caixa.fk_id_caixa
        GROUP BY
            etapa_caixa.fk_id_caixa
    ) AS max_status_caixa ON max_status_caixa.fk_pedido = pedido.idpedido
    INNER JOIN doador ON pedido.fk_doador = doador.id_doador;



ALTER TABLE caixa 
ADD COLUMN qr_code_token CHAR(64) NULL;

DELIMITER //

CREATE TRIGGER set_default_qrcode_token
BEFORE INSERT ON caixa
FOR EACH ROW
BEGIN
    IF NEW.qr_code_token IS NULL THEN
        SET NEW.qr_code_token = SHA2(UNIX_TIMESTAMP(), 256);
    END IF;
END//

DELIMITER ;



/* TRIGGER PARA ATUALIZAR A FK DO STATUS DO PEDIDO DEACORDO COM TODAS AS CAIXAS */
DROP TRIGGER IF EXISTS atualiza_status_pedido;

DELIMITER //

CREATE TRIGGER atualiza_status_pedido
AFTER INSERT ON etapa_caixa
FOR EACH ROW
BEGIN
    DECLARE qtd_caixas INT;
    DECLARE qtd_caixas_enviadas INT;
    DECLARE qtd_caixas_entregues INT;
    DECLARE id_caixa INT;
    DECLARE id_pedido INT;
    DECLARE id_status_caixa INT;
    DECLARE id_status_pedido INT;
    
    SET id_caixa = NEW.fk_id_caixa;
    SET id_pedido = (SELECT fk_pedido FROM caixa WHERE id_caixa = id_caixa LIMIT 1);
    SET id_status_caixa = (SELECT fk_status FROM etapa_caixa WHERE fk_id_caixa = id_caixa ORDER BY id_etapa_caixa DESC LIMIT 1);
    SET id_status_pedido = (SELECT fk_status_pedido FROM pedido WHERE idpedido = id_pedido LIMIT 1);
    
    SET qtd_caixas = (SELECT COUNT(id_caixa) FROM caixa WHERE fk_pedido = id_pedido);
    SET qtd_caixas_enviadas = (SELECT COUNT(id_caixa) FROM etapa_caixa WHERE fk_status = 2 AND fk_id_caixa IN (SELECT id_caixa FROM caixa WHERE fk_pedido = id_pedido));
    SET qtd_caixas_entregues = (SELECT COUNT(id_caixa) FROM etapa_caixa WHERE fk_status = 3 AND fk_id_caixa IN (SELECT id_caixa FROM caixa WHERE fk_pedido = id_pedido));

    IF qtd_caixas = qtd_caixas_entregues THEN
        UPDATE pedido SET fk_status_pedido = 3 WHERE idpedido = id_pedido;
    ELSEIF qtd_caixas = qtd_caixas_enviadas THEN
        UPDATE pedido SET fk_status_pedido = 2 WHERE idpedido = id_pedido;
    ELSE
        UPDATE pedido SET fk_status_pedido = 1 WHERE idpedido = id_pedido;
    END IF;
END//

-- -----------------------------------------------------
-- INSERINDO DADOS
-- -----------------------------------------------------
INSERT INTO `db_9solutions`.`faixa_etaria` (`faixa_nome`, `limite_inferior`, `limite_superior`, `condicao`)
VALUES
('Criança', 2, 4, 1),
('Pré-Adolescente', 5, 9, 1),
('Adolescente', 10, 14, 1);

INSERT INTO `db_9solutions`.`status_pedido` (`id_status_pedido`, `status`)
VALUES
(1, 'Pendente'),
(2, 'Enviado'),
(3, 'Entregue');

INSERT INTO `db_9solutions`.`categoria_produto` (`nome`, `qtde_produtos`, `condicao`, `estagio`)
VALUES
('Brinquedo', 1, 1, 1),
('Material Escolar', 1, 1, 1),
('Higiene Pessoal', 1, 1, 2),
('Uso Pessoal', 1, 1, 2),
('Itens Diversos', 3, 1, 3),
('Doces', 3, 1, 3);

INSERT INTO `db_9solutions`.`status_caixa` (`id_status_caixa`, `status`)
VALUES
(1, 'Pronta para montagem'),
(2, 'Pronta para entrega'),
(3, 'Entregue');

INSERT INTO `db_9solutions`.`produto` (`nome`, `valor`, `genero`, `condicao`, `fk_categoria_produto`, `fk_faixa_etaria`, `url_imagem`)
VALUES
-- Menino de 2 a 4 anos
('Carrinho', 29.99, 'M', 1, 1, 1, 'foto_do_produto.jpg'),
('Jogo de Montar', 29.99, 'M', 1, 1, 1, 'foto_do_produto.jpg'),
('Educação Infantil', 29.99, 'M', 1, 2, 1, 'foto_do_produto.jpg'),
('Ensino Fundamental 1', 29.99, 'M', 1, 2, 1, 'foto_do_produto.jpg'),
('Kit Dental Infantil', 29.99, 'M', 1, 3, 1, 'foto_do_produto.jpg'),
('Sabão Infantil', 29.99, 'M', 1, 3, 1, 'foto_do_produto.jpg'),
('Toalinha', 29.99, 'M', 1, 3, 1, 'foto_do_produto.jpg'),
('Blusa', 29.99, 'M', 1, 4, 1, 'foto_do_produto.jpg'),
('Chinelinho', 29.99, 'M', 1, 4, 1, 'foto_do_produto.jpg'),
('Shorts', 29.99, 'M', 1, 4, 1, 'foto_do_produto.jpg'),
('Ioio', 29.99, 'M', 1, 5, 1, 'foto_do_produto.jpg'),
('Estojo', 29.99, 'M', 1, 5, 1, 'foto_do_produto.jpg'),
('Garrafinha', 29.99, 'M', 1, 5, 1, 'foto_do_produto.jpg'),
('Caderninho', 29.99, 'M', 1, 5, 1, 'foto_do_produto.jpg'),
('Canetinhas', 29.99, 'M', 1, 5, 1, 'foto_do_produto.jpg'),
('Short', 29.99, 'M', 1, 5, 1, 'foto_do_produto.jpg'),
('Balas', 29.99, 'M', 1, 6, 1, 'foto_do_produto.jpg'),
('Pirulitos', 29.99, 'M', 1, 6, 1, 'foto_do_produto.jpg'),
('Chocolate', 29.99, 'M', 1, 6, 1, 'foto_do_produto.jpg'),
('Biscoitos', 29.99, 'M', 1, 6, 1, 'foto_do_produto.jpg'),
('Bala de Goma', 29.99, 'M', 1, 6, 1, 'foto_do_produto.jpg'),
('Bombom', 29.99, 'M', 1, 6, 1, 'foto_do_produto.jpg'),

-- Menino de 5 a 9
('Carrinho', 29.99, 'M', 1, 1, 2, 'foto_do_produto.jpg'),
('Jogo de Montar', 29.99, 'M', 1, 1, 2, 'foto_do_produto.jpg'),
('Educação Infantil', 29.99, 'M', 1, 2, 2, 'foto_do_produto.jpg'),
('Ensino Fundamental 1', 29.99, 'M', 1, 2, 2, 'foto_do_produto.jpg'),
('Kit Dental Infantil', 29.99, 'M', 1, 3, 2, 'foto_do_produto.jpg'),
('Sabão Infantil', 29.99, 'M', 1, 3, 2, 'foto_do_produto.jpg'),
('Toalinha', 29.99, 'M', 1, 3, 2, 'foto_do_produto.jpg'),
('Blusa', 29.99, 'M', 1, 4, 2, 'foto_do_produto.jpg'),
('Chinelinho', 29.99, 'M', 1, 4, 2, 'foto_do_produto.jpg'),
('Shorts', 29.99, 'M', 1, 4, 2, 'foto_do_produto.jpg'),
('Ioio', 29.99, 'M', 1, 5, 2, 'foto_do_produto.jpg'),
('Estojo', 29.99, 'M', 1, 5, 2, 'foto_do_produto.jpg'),
('Garrafinha', 29.99, 'M', 1, 5, 2, 'foto_do_produto.jpg'),
('Caderninho', 29.99, 'M', 1, 5, 2, 'foto_do_produto.jpg'),
('Canetinhas', 29.99, 'M', 1, 5, 2, 'foto_do_produto.jpg'),
('Short', 29.99, 'M', 1, 5, 2, 'foto_do_produto.jpg'),
('Balas', 29.99, 'M', 1, 6, 2, 'foto_do_produto.jpg'),
('Pirulitos', 29.99, 'M', 1, 6, 2, 'foto_do_produto.jpg'),
('Chocolate', 29.99, 'M', 1, 6, 2, 'foto_do_produto.jpg'),
('Biscoitos', 29.99, 'M', 1, 6, 2, 'foto_do_produto.jpg'),
('Bala de Goma', 29.99, 'M', 1, 6, 2, 'foto_do_produto.jpg'),
('Bombom', 29.99, 'M', 1, 6, 2, 'foto_do_produto.jpg'),

-- Menino de 10 a 14
('Kit Ping Pong', 29.99, 'M', 1, 1, 3, 'foto_do_produto.jpg'),
('Jogos', 29.99, 'M', 1, 1, 3, 'foto_do_produto.jpg'),
('Ensino Fundamental 1', 29.99, 'M', 1, 2, 3, 'foto_do_produto.jpg'),
('Ensino Fundamental 2', 29.99, 'M', 1, 2, 3, 'foto_do_produto.jpg'),
('Kit Dental Pré Teen', 29.99, 'M', 1, 3, 3, 'foto_do_produto.jpg'),
('Sabonete', 29.99, 'M', 1, 3, 3, 'foto_do_produto.jpg'),
('Pente', 29.99, 'M', 1, 3, 3, 'foto_do_produto.jpg'),
('Blusa', 29.99, 'M', 1, 4, 3, 'foto_do_produto.jpg'),
('Chinelinho', 29.99, 'M', 1, 4, 3, 'foto_do_produto.jpg'),
('Shorts', 29.99, 'M', 1, 4, 3, 'foto_do_produto.jpg'),
('Ioio', 29.99, 'M', 1, 5, 3, 'foto_do_produto.jpg'),
('Estojo', 29.99, 'M', 1, 5, 3, 'foto_do_produto.jpg'),
('Garrafinha', 29.99, 'M', 1, 5, 3, 'foto_do_produto.jpg'),
('Caderninho', 29.99, 'M', 1, 5, 3, 'foto_do_produto.jpg'),
('Canetinhas', 29.99, 'M', 1, 5, 3, 'foto_do_produto.jpg'),
('Short', 29.99, 'M', 1, 5, 3, 'foto_do_produto.jpg'),
('Balas', 29.99, 'M', 1, 6, 3, 'foto_do_produto.jpg'),
('Pirulitos', 29.99, 'M', 1, 6, 3, 'foto_do_produto.jpg'),
('Chocolate', 29.99, 'M', 1, 6, 3, 'foto_do_produto.jpg'),
('Biscoitos', 29.99, 'M', 1, 6, 3, 'foto_do_produto.jpg'),
('Bala de Goma', 29.99, 'M', 1, 6, 3, 'foto_do_produto.jpg'),
('Bombom', 29.99, 'M', 1, 6, 3, 'foto_do_produto.jpg');


-- Dados para menina
INSERT INTO `db_9solutions`.`produto` (`nome`, `valor`, `genero`, `condicao`, `fk_categoria_produto`, `fk_faixa_etaria`, `url_imagem`)
VALUES
-- Menina de 2 a 4 anos
('Bonequinha', 29.99, 'F', 1, 1, 1, 'foto_do_produto.jpg'),
('Jogo de Montar', 29.99, 'F', 1, 1, 1, 'foto_do_produto.jpg'),
('Educação Infantil', 29.99, 'F', 1, 2, 1, 'foto_do_produto.jpg'),
('Ensino Fundamental 1', 29.99, 'F', 1, 2, 1, 'foto_do_produto.jpg'),
('Kit Dental Infantil', 29.99, 'F', 1, 3, 1, 'foto_do_produto.jpg'),
('Sabão Infantil', 29.99, 'F', 1, 3, 1, 'foto_do_produto.jpg'),
('Toalinha', 29.99, 'F', 1, 3, 1, 'foto_do_produto.jpg'),
('Blusa', 29.99, 'F', 1, 4, 1, 'foto_do_produto.jpg'),
('Chinelinho', 29.99, 'F', 1, 4, 1, 'foto_do_produto.jpg'),
('Shorts', 29.99, 'F', 1, 4, 1, 'foto_do_produto.jpg'),
('Itens para Cabelo', 29.99, 'F', 1, 5, 1, 'foto_do_produto.jpg'),
('Estojo', 29.99, 'F', 1, 5, 1, 'foto_do_produto.jpg'),
('Garrafinha', 29.99, 'F', 1, 5, 1, 'foto_do_produto.jpg'),
('Caderninho', 29.99, 'F', 1, 5, 1, 'foto_do_produto.jpg'),
('Canetinhas', 29.99, 'F', 1, 5, 1, 'foto_do_produto.jpg'),
('Short', 29.99, 'F', 1, 5, 1, 'foto_do_produto.jpg'),
('Balas', 29.99, 'F', 1, 6, 1, 'foto_do_produto.jpg'),
('Pirulitos', 29.99, 'F', 1, 6, 1, 'foto_do_produto.jpg'),
('Chocolate', 29.99, 'F', 1, 6, 1, 'foto_do_produto.jpg'),
('Biscoitos', 29.99, 'F', 1, 6, 1, 'foto_do_produto.jpg'),
('Bala de Goma', 29.99, 'F', 1, 6, 1, 'foto_do_produto.jpg'),
('Bombom', 29.99, 'F', 1, 6, 1, 'foto_do_produto.jpg'),

-- Menino de 5 a 9
('Boneca', 29.99, 'F', 1, 1, 2, 'foto_do_produto.jpg'),
('Jogos', 29.99, 'F', 1, 1, 2, 'foto_do_produto.jpg'),
('Educação Infantil', 29.99, 'F', 1, 2, 2, 'foto_do_produto.jpg'),
('Ensino Fundamental 1', 29.99, 'F', 1, 2, 2, 'foto_do_produto.jpg'),
('Kit Dental', 29.99, 'F', 1, 3, 2, 'foto_do_produto.jpg'),
('Sabão Infantil', 29.99, 'F', 1, 3, 2, 'foto_do_produto.jpg'),
('Toalinha', 29.99, 'F', 1, 3, 2, 'foto_do_produto.jpg'),
('Blusa', 29.99, 'F', 1, 4, 2, 'foto_do_produto.jpg'),
('Chinelinho', 29.99, 'F', 1, 4, 2, 'foto_do_produto.jpg'),
('Shorts', 29.99, 'F', 1, 4, 2, 'foto_do_produto.jpg'),
('Itens para Cabelo', 29.99, 'F', 1, 5, 2, 'foto_do_produto.jpg'),
('Estojo', 29.99, 'F', 1, 5, 2, 'foto_do_produto.jpg'),
('Garrafinha', 29.99, 'F', 1, 5, 2, 'foto_do_produto.jpg'),
('Caderninho', 29.99, 'F', 1, 5, 2, 'foto_do_produto.jpg'),
('Canetinhas', 29.99, 'F', 1, 5, 2, 'foto_do_produto.jpg'),
('Short', 29.99, 'F', 1, 5, 2, 'foto_do_produto.jpg'),
('Balas', 29.99, 'F', 1, 6, 2, 'foto_do_produto.jpg'),
('Pirulitos', 29.99, 'F', 1, 6, 2, 'foto_do_produto.jpg'),
('Chocolate', 29.99, 'F', 1, 6, 2, 'foto_do_produto.jpg'),
('Biscoitos', 29.99, 'F', 1, 6, 2, 'foto_do_produto.jpg'),
('Bala de Goma', 29.99, 'F', 1, 6, 2, 'foto_do_produto.jpg'),
('Bombom', 29.99, 'F', 1, 6, 2, 'foto_do_produto.jpg'),

-- Menino de 10 a 14
('Kit de Maquiagem', 29.99, 'F', 1, 1, 3, 'foto_do_produto.jpg'),
('Jogos', 29.99, 'F', 1, 1, 3, 'foto_do_produto.jpg'),

('Ensino Fundamental 1', 29.99, 'F', 1, 2, 3, 'foto_do_produto.jpg'),
('Ensino Fundamental 2', 29.99, 'F', 1, 2, 3, 'foto_do_produto.jpg'),

('Kit Dental Pré Teen', 29.99, 'F', 1, 3, 3, 'foto_do_produto.jpg'),
('Escova de Cabelo', 29.99, 'F', 1, 3, 3, 'foto_do_produto.jpg'),
('Absorvente', 29.99, 'F', 1, 3, 3, 'foto_do_produto.jpg'),

('Blusa', 29.99, 'F', 1, 4, 3, 'foto_do_produto.jpg'),
('Chinelinho', 29.99, 'F', 1, 4, 3, 'foto_do_produto.jpg'),
('Shorts', 29.99, 'F', 1, 4, 3, 'foto_do_produto.jpg'),

('Itens para Cabelo', 29.99, 'F', 1, 5, 3, 'foto_do_produto.jpg'),
('Estojo', 29.99, 'F', 1, 5, 3, 'foto_do_produto.jpg'),
('Garrafinha', 29.99, 'F', 1, 5, 3, 'foto_do_produto.jpg'),
('Caderninho', 29.99, 'F', 1, 5, 3, 'foto_do_produto.jpg'),
('Canetinhas', 29.99, 'F', 1, 5, 3, 'foto_do_produto.jpg'),
('Short', 29.99, 'F', 1, 5, 3, 'foto_do_produto.jpg'),

('Balas', 29.99, 'F', 1, 6, 3, 'foto_do_produto.jpg'),
('Pirulitos', 29.99, 'F', 1, 6, 3, 'foto_do_produto.jpg'),
('Chocolate', 29.99, 'F', 1, 6, 3, 'foto_do_produto.jpg'),
('Biscoitos', 29.99, 'F', 1, 6, 3, 'foto_do_produto.jpg'),
('Bala de Goma', 29.99, 'F', 1, 6, 3, 'foto_do_produto.jpg'),
('Bombom', 29.99, 'F', 1, 6, 3, 'foto_do_produto.jpg');


INSERT INTO doador (nome_completo, identificador, email, telefone, senha, permissao) VALUES 
('João Silva', '12345678901234', 'joao.silva@example.com', '11123456789', 'senha123', 'admin'),
('Maria Oliveira', '23456789012345', 'maria.oliveira@example.com', '22123456789', 'senha456', 'user');

INSERT INTO pedido (data_pedido, valor_total, fk_status_pedido, fk_doador) VALUES 
('2023-01-01', 100.00, 4, 1),
('2023-02-01', 200.00, 4, 2),
('2023-03-01', 150.00, 4, 1),
('2023-04-01', 250.00, 4, 2);

INSERT INTO caixa (genero, carta, url, dt_criacao, dt_entrega, qtd, fk_faixa_etaria, fk_pedido) VALUES 
('M', 'Carta 1', 'http://example.com/1', '2023-01-02', NULL, 5, 1, 1),
('F', 'Carta 2', 'http://example.com/2', '2023-02-02', NULL, 10, 2, 2),
('M', 'Carta 3', 'http://example.com/3', '2023-03-02', NULL, 7, 1, 3),
('F', 'Carta 4', 'http://example.com/4', '2023-04-02', NULL, 12, 3, 4);
