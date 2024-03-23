-- Active: 1706994600820@@127.0.0.1@3306
DROP DATABASE IF EXISTS 9Solutions_db;

CREATE DATABASE IF NOT EXISTS 9Solutions_db;

USE 9Solutions_db;

-- User Layer

CREATE TABLE IF NOT EXISTS conhecimento_projeto(
    id_conhecimento_projeto INT PRIMARY KEY AUTO_INCREMENT
    ,origem VARCHAR(100) NOT NULL
    ,descricao VARCHAR(255)
    ,CONSTRAINT chck_origem CHECK(
        origem IN (
        'Amigos', 'TV/Rádio', 'Mecanismos de Pesquisa', 'Aplicativos de Comunicações', 'Redes Sociais', 'Outros'
        )
    )
);


CREATE TABLE IF NOT EXISTS doador(
    id_doador INT PRIMARY KEY AUTO_INCREMENT
    ,nome_completo VARCHAR(255) NOT NULL
    ,is_pf BOOLEAN NOT NULL
    ,identificador_pessoa CHAR(11) #EX: xxxxxxxxxxx
    ,ddd VARCHAR(3)
    ,telefone VARCHAR(9) #EX: 000000000
    ,email VARCHAR(255)
    ,dt_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ,fk_conhecimento_projeto INT
    ,CONSTRAINT fk_doador_conhecimento_projeto Foreign Key (fk_conhecimento_projeto) REFERENCES conhecimento_projeto(id_conhecimento_projeto)
);


-- Donation Layer

CREATE TABLE IF NOT EXISTS caixa(
    id_caixa INT PRIMARY KEY AUTO_INCREMENT
    ,genero CHAR(1) CHECK (genero IN ('M', 'F')) NOT NULL
    ,range_idade CHAR(3) NOT NULL #EX 0-0
    ,carta TEXT
    ,foto VARCHAR(255) #URL
    ,fk_doador INT
    ,CONSTRAINT fk_caixa_doador Foreign Key (fk_doador) REFERENCES doador(id_doador)
);

CREATE TABLE IF NOT EXISTS item(
    id_item INT PRIMARY KEY AUTO_INCREMENT
    ,item_nome VARCHAR(100)
    ,valor DECIMAL(5, 2)
);

CREATE TABLE IF NOT EXISTS item_caixa(
    id_item_caixa INT PRIMARY KEY AUTO_INCREMENT
    ,fk_caixa INT
    ,fk_item INT
    ,CONSTRAINT fk_item_caixa_caixa Foreign Key (fk_caixa) REFERENCES caixa(id_caixa)
    ,CONSTRAINT fk_item_caixa_item Foreign Key (fk_item) REFERENCES item(id_item)
);

-- Metrics Layer

CREATE VIEW `vw_origem_projeto` AS
	SELECT COUNT(origem) AS 'freq_origem', origem FROM conhecimento_projeto GROUP BY origem;

CREATE VIEW `vw_top_itens` AS
	SELECT COUNT(fk_item) AS 'quant_item', item_nome FROM item_caixa
    INNER JOIN item
		ON item_caixa.fk_item = item.id_item
	GROUP BY fk_item
    ORDER BY quant_item DESC;

CREATE VIEW `vw_top_range` AS
	SELECT COUNT(range_idade) AS 'freq_range', range_idade FROM caixa
    GROUP BY range_idade
    ORDER BY freq_range;