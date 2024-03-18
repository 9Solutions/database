-- Active: 1706994600820@@127.0.0.1@3306
DROP DATABASE IF EXISTS 9Solutions_db;

CREATE DATABASE IF NOT EXISTS 9Solutions_db;

USE 9Solutions_db;

-- Donation Layer

CREATE TABLE IF NOT EXISTS tbCaixa(
    idCaixa INT PRIMARY KEY AUTO_INCREMENT
    ,genero CHAR(1) CHECK (genero IN ('M', 'F')) NOT NULL
    ,rangeIdade CHAR(3) NOT NULL #EX 0-0
    ,carta TEXT
    ,foto VARCHAR(255) #URL
);

CREATE TABLE IF NOT EXISTS tbItem(
    idItem INT PRIMARY KEY AUTO_INCREMENT
    ,itemNome VARCHAR(100)
    ,valor DECIMAL(5, 2)
);

CREATE TABLE IF NOT EXISTS tbItemCaixa(
    idItemCaixa INT PRIMARY KEY AUTO_INCREMENT
    ,fkCaixa INT
    ,fkItem INT
    ,CONSTRAINT fk_tbItemCaixa_tbCaixa Foreign Key (fkCaixa) REFERENCES tbCaixa(idCaixa)
    ,CONSTRAINT fk_tbItemCaixa_tbItem Foreign Key (fkItem) REFERENCES tbItem(idItem)
);

-- User Layer

CREATE TABLE IF NOT EXISTS tbConhecimentoProjeto(
    idConhecimentoProjeto INT PRIMARY KEY AUTO_INCREMENT
    ,origem VARCHAR(100) NOT NULL
    ,descricao VARCHAR(255)
    ,CONSTRAINT chck_origem CHECK(
        origem IN (
        'Amigos', 'TV/Rádio', 'Mecanismos de Pesquisa', 'Aplicativos de Comunicações', 'Redes Sociais', 'Outros'
        )
    )
);


CREATE TABLE IF NOT EXISTS tbDoador(
    idDoador INT PRIMARY KEY AUTO_INCREMENT
    ,nomeCompleto VARCHAR(60) NOT NULL
    ,isPF BOOLEAN NOT NULL
    ,cpf CHAR(14) #EX: xxx.xxx.xxx-xx
    ,telefone CHAR(15) #EX: (00) 00000-0000
    ,email VARCHAR(100)
    ,dtCadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ,fkConhecimentoProjeto INT
    ,fkCaixa INT
    ,CONSTRAINT fk_tbDoador_tbConhecimentoProjeto Foreign Key (fkConhecimentoProjeto) REFERENCES tbConhecimentoProjeto(idConhecimentoProjeto)
    ,CONSTRAINT fk_tbDoador_tbCaixa Foreign Key (fkCaixa) REFERENCES tbCaixa(idCaixa)
);

-- Metrics Layer

CREATE VIEW `vw_origemProjeto` AS
	SELECT COUNT(origem) AS 'freqOrigem', origem FROM tbConhecimentoProjeto GROUP BY origem;

CREATE VIEW `vw_topItens` AS
	SELECT COUNT(fkItem) AS 'quantItem', itemNome FROM tbItemCaixa
    INNER JOIN tbItem
		ON tbItemCaixa.fkItem = tbItem.idItem
	GROUP BY fkItem
    ORDER BY QuantItem DESC;

CREATE VIEW `vw_topRange` AS
	SELECT COUNT(rangeIdade) AS 'freqRange', rangeIdade FROM tbCaixa
    GROUP BY rangeIdade
    ORDER BY freqRange;