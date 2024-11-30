-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: db_9solutions
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `caixa`
--

DROP TABLE IF EXISTS `caixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caixa` (
  `id_caixa` int NOT NULL AUTO_INCREMENT,
  `genero` char(1) NOT NULL,
  `carta` text,
  `url` varchar(255) DEFAULT NULL,
  `dt_criacao` date DEFAULT NULL,
  `dt_entrega` date DEFAULT NULL,
  `qtd` int DEFAULT NULL,
  `fk_faixa_etaria` int NOT NULL,
  `fk_pedido` int NOT NULL,
  `qr_code_token` char(64) DEFAULT NULL,
  PRIMARY KEY (`id_caixa`),
  KEY `fk_caixa_faixa_etaria1_idx` (`fk_faixa_etaria`),
  KEY `fk_caixa_pedido1_idx` (`fk_pedido`),
  CONSTRAINT `fk_caixa_faixa_etaria1` FOREIGN KEY (`fk_faixa_etaria`) REFERENCES `faixa_etaria` (`id_faixa_etaria`),
  CONSTRAINT `fk_caixa_pedido1` FOREIGN KEY (`fk_pedido`) REFERENCES `pedido` (`idpedido`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixa`
--

LOCK TABLES `caixa` WRITE;
/*!40000 ALTER TABLE `caixa` DISABLE KEYS */;
INSERT INTO `caixa` VALUES (1,'F','Escrevendo uma linda carta para uma criança! s2','foto_legal.jpeg','2024-09-09',NULL,1,1,6,'c4eddcd1413b989f4207104beb3c1335662df304a3c6525ea88a53e63fe6cd07'),(2,'F','Escrevendo uma linda carta para uma criança! s2','foto_legal.jpeg','2024-09-15',NULL,1,1,5,'b254bfd41c8bdba6988f1d28360c6e5412b61b7df8457122e703220242bf125f'),(3,'F','Escrevendo uma linda carta para uma criança! s2','foto_legal.jpeg','2024-09-15',NULL,1,1,7,'83829f370fe4cd28c8028da182a882f41650812d90eb0fc22c63260abaf4a078'),(4,'F','Escrevendo uma linda carta para uma criança! s2','foto_legal.jpeg','2024-09-15',NULL,1,1,5,'b3cee4462c8d47b6f405c2aa3c553178a52144cd192c46602bed39c130cbe624'),(5,'M','aaaaaaaaaaaa','aaaaaaaaaaaaaaaa','2024-10-25',NULL,1,3,18,'a18ae12ae35a1ee9c0859173f273565a59df726c228e7c41c6651ce1454522af'),(6,'M','teste teste teste teste','aaaaaaaaaaaaaaaa','2024-10-25',NULL,1,2,19,'3ed08008df726917e0dc318a5e34e27e6332dd232c95a124eaa3cb7d4af5a48b'),(7,'M','cartinha legal feita no campo','aaaaaaaaaaaaaaaa','2024-10-25',NULL,1,2,20,'c1bf4bf06567be409019db43845314c36ab7142d72a396cb67a1b0d37531d276'),(8,'M','cartinha legal feita no campo','aaaaaaaaaaaaaaaa','2024-10-25',NULL,1,2,20,'c1bf4bf06567be409019db43845314c36ab7142d72a396cb67a1b0d37531d276'),(9,'M','cartinha legal feita no campo','aaaaaaaaaaaaaaaa','2024-10-25',NULL,1,2,20,'c1bf4bf06567be409019db43845314c36ab7142d72a396cb67a1b0d37531d276'),(10,'M','dasjkldasijnoasjdçã','https://bucket-caixadesapato.s3.amazonaws.com/image-1729956988414-20241026.jpg','2024-10-26',NULL,1,2,25,'e2f8be1dd9d7f19198b86b99af4925b2aec3157a8d5abd52db9158421177c6ca'),(11,'M','dasjkldasijnoasjdçã','https://bucket-caixadesapato.s3.amazonaws.com/image-1729956988414-20241026.jpg','2024-10-26',NULL,1,2,25,'d99ac2298cb199b20706ab7fc2577cb7edf3c5849e7bee3d6259447b566a61aa');
/*!40000 ALTER TABLE `caixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_produto`
--

DROP TABLE IF EXISTS `categoria_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_produto` (
  `id_categoria_produto` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  `condicao` tinyint NOT NULL,
  `qtde_produtos` int NOT NULL,
  `estagio` tinyint NOT NULL,
  PRIMARY KEY (`id_categoria_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_produto`
--

LOCK TABLES `categoria_produto` WRITE;
/*!40000 ALTER TABLE `categoria_produto` DISABLE KEYS */;
INSERT INTO `categoria_produto` VALUES (1,'Brinquedo',1,1,1),(2,'Material Escolar',1,1,1),(3,'Higiene Pessoal',1,1,2),(4,'Uso Pessoal',1,1,2),(5,'Itens Diversos',1,3,3),(6,'Doces',1,3,3);
/*!40000 ALTER TABLE `categoria_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupom`
--

DROP TABLE IF EXISTS `cupom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupom` (
  `id_cupom` int NOT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `desconto_percentual` decimal(5,2) DEFAULT NULL,
  `desconto_fixo` decimal(10,2) DEFAULT NULL,
  `validade_inicio` date DEFAULT NULL,
  `validade_fim` date DEFAULT NULL,
  `limite_usos` int DEFAULT NULL,
  `usos_atuais` int DEFAULT NULL,
  `ativo` tinyint DEFAULT NULL,
  `fk_empresa` int NOT NULL,
  PRIMARY KEY (`id_cupom`),
  KEY `fk_empresa` (`fk_empresa`),
  CONSTRAINT `cupom_ibfk_1` FOREIGN KEY (`fk_empresa`) REFERENCES `empresa` (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupom`
--

LOCK TABLES `cupom` WRITE;
/*!40000 ALTER TABLE `cupom` DISABLE KEYS */;
/*!40000 ALTER TABLE `cupom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupom_pedido`
--

DROP TABLE IF EXISTS `cupom_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupom_pedido` (
  `id_cupom_pedido` int NOT NULL,
  `cupom_id_cupom` int NOT NULL,
  `pedido_idpedido` int NOT NULL,
  PRIMARY KEY (`id_cupom_pedido`,`cupom_id_cupom`,`pedido_idpedido`),
  KEY `fk_cupom_pedido_cupom1_idx` (`cupom_id_cupom`),
  KEY `fk_cupom_pedido_pedido1_idx` (`pedido_idpedido`),
  CONSTRAINT `fk_cupom_pedido_cupom1` FOREIGN KEY (`cupom_id_cupom`) REFERENCES `cupom` (`id_cupom`),
  CONSTRAINT `fk_cupom_pedido_pedido1` FOREIGN KEY (`pedido_idpedido`) REFERENCES `pedido` (`idpedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupom_pedido`
--

LOCK TABLES `cupom_pedido` WRITE;
/*!40000 ALTER TABLE `cupom_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `cupom_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doador`
--

DROP TABLE IF EXISTS `doador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doador` (
  `id_doador` int NOT NULL AUTO_INCREMENT,
  `nome_completo` varchar(255) NOT NULL,
  `identificador` char(14) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `dt_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `permissao` varchar(20) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_doador`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doador`
--

LOCK TABLES `doador` WRITE;
/*!40000 ALTER TABLE `doador` DISABLE KEYS */;
INSERT INTO `doador` VALUES (1,'João Silva','12345678901234','dusousa1412@gmail.com','2024-09-01 18:53:34','admin','11123456789','$2a$10$ZcNJnrXsBmUuzX8pheDg8OGhiVQc2D2qqTdBEv6X13We7GpfRZOmm'),(2,'Maria Oliveira','23456789012345','maria.oliveira@example.com','2024-09-01 18:53:34','user','22123456789','senha456'),(4,'Eduardo','77979872037','eduardo@gmail','2024-09-09 03:00:00','admin','11948738844','$2a$10$40lc667BFd2CAEuuCueSe.fgt7.fP2w9.KBQ/rS18509N0wLQvcAO'),(6,'Eduardo','77979872037','eduardo2@gmail','2024-09-09 03:00:00','admin','11948738844','$2a$10$rPzc/Jya0UtuuuhpMndN/OOuNbaXkAJOe.4xo13j51pGw.8AP/RNm');
/*!40000 ALTER TABLE `doador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `id_empresa` int NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `email_contato` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etapa_caixa`
--

DROP TABLE IF EXISTS `etapa_caixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etapa_caixa` (
  `id_etapa_caixa` int NOT NULL AUTO_INCREMENT,
  `fk_status` int NOT NULL,
  `fk_id_caixa` int NOT NULL,
  `update_at` date DEFAULT NULL,
  PRIMARY KEY (`id_etapa_caixa`),
  KEY `fk_status_caixa_has_caixa_caixa1_idx` (`fk_id_caixa`),
  KEY `fk_status_caixa_has_caixa_status_caixa1_idx` (`fk_status`),
  CONSTRAINT `fk_status_caixa_has_caixa_caixa1` FOREIGN KEY (`fk_id_caixa`) REFERENCES `caixa` (`id_caixa`),
  CONSTRAINT `fk_status_caixa_has_caixa_status_caixa1` FOREIGN KEY (`fk_status`) REFERENCES `status_caixa` (`id_status_caixa`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etapa_caixa`
--

LOCK TABLES `etapa_caixa` WRITE;
/*!40000 ALTER TABLE `etapa_caixa` DISABLE KEYS */;
INSERT INTO `etapa_caixa` VALUES (1,1,1,'2024-09-09'),(28,1,2,'2024-09-15'),(29,1,3,'2024-09-15'),(30,1,4,'2024-09-15'),(31,2,1,'2024-09-15');
/*!40000 ALTER TABLE `etapa_caixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faixa_etaria`
--

DROP TABLE IF EXISTS `faixa_etaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faixa_etaria` (
  `id_faixa_etaria` int NOT NULL AUTO_INCREMENT,
  `faixa_nome` varchar(45) DEFAULT NULL,
  `limite_inferior` int DEFAULT NULL,
  `limite_superior` int DEFAULT NULL,
  `condicao` tinyint NOT NULL,
  PRIMARY KEY (`id_faixa_etaria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faixa_etaria`
--

LOCK TABLES `faixa_etaria` WRITE;
/*!40000 ALTER TABLE `faixa_etaria` DISABLE KEYS */;
INSERT INTO `faixa_etaria` VALUES (1,'Criança',2,4,1),(2,'Pré-Adolescente',5,9,1),(3,'Adolescente',10,14,1);
/*!40000 ALTER TABLE `faixa_etaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_caixa`
--

DROP TABLE IF EXISTS `item_caixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_caixa` (
  `id_produto_caixa` int NOT NULL AUTO_INCREMENT,
  `fk_caixa` int DEFAULT NULL,
  `fk_produto` int DEFAULT NULL,
  PRIMARY KEY (`id_produto_caixa`),
  KEY `fk_tbItemCaixa_tbCaixa` (`fk_caixa`),
  KEY `fk_tbItemCaixa_tbItem` (`fk_produto`),
  CONSTRAINT `fk_tbItemCaixa_tbCaixa` FOREIGN KEY (`fk_caixa`) REFERENCES `caixa` (`id_caixa`),
  CONSTRAINT `fk_tbItemCaixa_tbItem` FOREIGN KEY (`fk_produto`) REFERENCES `produto` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_caixa`
--

LOCK TABLES `item_caixa` WRITE;
/*!40000 ALTER TABLE `item_caixa` DISABLE KEYS */;
INSERT INTO `item_caixa` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,1),(5,2,2),(6,2,3),(7,3,1),(8,3,2),(9,3,3),(10,4,1),(11,4,2),(12,4,3),(13,5,45),(14,5,47),(15,5,50),(16,5,52),(17,5,59),(18,5,57),(19,5,60),(20,5,64),(21,5,63),(22,5,62),(23,6,24),(24,6,26),(25,6,28),(26,6,31),(27,6,33),(28,6,34),(29,6,35),(30,6,40),(31,6,39),(32,6,41),(33,7,23),(34,7,25),(35,7,28),(36,7,30),(37,7,34),(38,7,35),(39,7,33),(40,7,39),(41,7,40),(42,7,41),(43,8,23),(44,8,25),(45,8,28),(46,8,30),(47,8,34),(48,8,35),(49,8,33),(50,8,39),(51,8,40),(52,8,41),(53,9,23),(54,9,25),(55,9,28),(56,9,30),(57,9,34),(58,9,35),(59,9,33),(60,9,39),(61,9,40),(62,9,41),(63,10,23),(64,10,25),(65,10,28),(66,10,30),(67,10,34),(68,10,33),(69,10,37),(70,10,40),(71,10,41),(72,10,42),(73,11,23),(74,11,25),(75,11,28),(76,11,30),(77,11,34),(78,11,33),(79,11,37),(80,11,40),(81,11,41),(82,11,42);
/*!40000 ALTER TABLE `item_caixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodo_pagamento`
--

DROP TABLE IF EXISTS `metodo_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodo_pagamento` (
  `id_metodo_pagamento` int NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_metodo_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_pagamento`
--

LOCK TABLES `metodo_pagamento` WRITE;
/*!40000 ALTER TABLE `metodo_pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `metodo_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodo_pagamento_pedido`
--

DROP TABLE IF EXISTS `metodo_pagamento_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodo_pagamento_pedido` (
  `fk_metodo_pagamento` int NOT NULL,
  `fk_pedido` int NOT NULL,
  `provedor` varchar(45) DEFAULT NULL,
  `numero_conta` varchar(45) DEFAULT NULL,
  `data_expiracao` date DEFAULT NULL,
  PRIMARY KEY (`fk_metodo_pagamento`,`fk_pedido`),
  KEY `fk_doador_has_tipo_pagamento_tipo_pagamento1_idx` (`fk_metodo_pagamento`),
  KEY `fk_metodo_pagamento_doador_pedido1_idx` (`fk_pedido`),
  CONSTRAINT `fk_doador_has_tipo_pagamento_tipo_pagamento1` FOREIGN KEY (`fk_metodo_pagamento`) REFERENCES `metodo_pagamento` (`id_metodo_pagamento`),
  CONSTRAINT `fk_metodo_pagamento_doador_pedido1` FOREIGN KEY (`fk_pedido`) REFERENCES `pedido` (`idpedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_pagamento_pedido`
--

LOCK TABLES `metodo_pagamento_pedido` WRITE;
/*!40000 ALTER TABLE `metodo_pagamento_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `metodo_pagamento_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idpedido` int NOT NULL AUTO_INCREMENT,
  `data_pedido` date DEFAULT NULL,
  `valor_total` double DEFAULT NULL,
  `fk_status_pedido` int NOT NULL,
  `fk_doador` int NOT NULL,
  PRIMARY KEY (`idpedido`,`fk_status_pedido`,`fk_doador`),
  KEY `fk_pedido_status_pedido1_idx` (`fk_status_pedido`),
  KEY `fk_pedido_doador1_idx` (`fk_doador`),
  CONSTRAINT `fk_pedido_doador1` FOREIGN KEY (`fk_doador`) REFERENCES `doador` (`id_doador`),
  CONSTRAINT `fk_pedido_status_pedido1` FOREIGN KEY (`fk_status_pedido`) REFERENCES `status_pedido` (`id_status_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (5,'2024-09-05',50,1,1),(6,'2024-09-05',50,1,1),(7,'2024-09-09',50,1,1),(8,'2024-10-25',50,1,4),(9,'2024-10-25',78.99,1,4),(10,'2024-10-25',78.99,1,4),(11,'2024-10-25',78.99,1,4),(12,'2024-10-25',78.99,1,4),(13,'2024-10-25',78.99,1,4),(14,'2024-10-25',78.99,1,4),(15,'2024-10-25',78.99,1,4),(16,'2024-10-25',78.99,1,4),(17,'2024-10-25',78.99,1,4),(18,'2024-10-25',78.99,1,4),(19,'2024-10-25',78.99,1,4),(20,'2024-10-25',236.97,1,4),(21,'2024-10-26',78.99,1,4),(22,'2024-10-26',157.98,1,4),(23,'2024-10-26',157.98,1,4),(24,'2024-10-26',78.99,1,4),(25,'2024-10-26',157.98,1,4);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) DEFAULT NULL,
  `valor` decimal(5,2) DEFAULT NULL,
  `genero` char(1) DEFAULT NULL,
  `condicao` tinyint NOT NULL,
  `url_imagem` varchar(256) NOT NULL,
  `fk_categoria_produto` int NOT NULL,
  `fk_faixa_etaria` int NOT NULL,
  PRIMARY KEY (`id_produto`,`fk_categoria_produto`,`fk_faixa_etaria`),
  KEY `fk_produto_categoria_produto1_idx` (`fk_categoria_produto`),
  KEY `fk_produto_faixa_etaria1_idx` (`fk_faixa_etaria`),
  CONSTRAINT `fk_produto_categoria_produto1` FOREIGN KEY (`fk_categoria_produto`) REFERENCES `categoria_produto` (`id_categoria_produto`),
  CONSTRAINT `fk_produto_faixa_etaria1` FOREIGN KEY (`fk_faixa_etaria`) REFERENCES `faixa_etaria` (`id_faixa_etaria`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Carrinho',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/Quadriciclo-1.jpg',1,1),(2,'Jogo de Montar',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/jogo-montar.png',1,1),(3,'Educação Infantil',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/material-infantil.jpg',2,1),(4,'Ensino Fundamental 1',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/material-fundamental.png',2,1),(5,'Kit Dental Infantil',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/dental-infantil.jpg',3,1),(6,'Sabão Infantil',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/sabonete infantil.jpg',3,1),(7,'Toalinha',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/toalinha.jpg',3,1),(8,'Blusa',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/blusa.jpg',4,1),(9,'Chinelinho',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/chinelo.png',4,1),(10,'Shorts',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/short.jpeg',4,1),(11,'Ioio',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/ioio.jpeg',5,1),(12,'Estojo',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/estojo.jpg',5,1),(13,'Garrafinha',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/garrafa.jpg',5,1),(14,'Caderninho',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/cardeno.jpeg',5,1),(15,'Canetinhas',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/canetinha.jpg',5,1),(16,'Short',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/short.jpeg',5,1),(17,'Balas',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/balas.jpg',6,1),(18,'Pirulitos',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/bala-goma.jpg',6,1),(19,'Chocolate',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/chocolate.png',6,1),(20,'Biscoitos',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/passatemmpo.jpeg',6,1),(21,'Bala de Goma',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/bala-goma.jpg',6,1),(22,'Bombom',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/bombom.jpg',6,1),(23,'Carrinho',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/Quadriciclo-1.jpg',1,2),(24,'Jogo de Montar',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/jogo-montar.png',1,2),(25,'Educação Infantil',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/material-infantil.jpg',2,2),(26,'Ensino Fundamental 1',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/material-fundamental.png',2,2),(27,'Kit Dental Infantil',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/dental-infantil.jpg',3,2),(28,'Sabão Infantil',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/sabonete infantil.jpg',3,2),(29,'Toalinha',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/toalinha.jpg',3,2),(30,'Blusa',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/blusa.jpg',4,2),(31,'Chinelinho',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/chinelo.png',4,2),(32,'Shorts',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/short.jpeg',4,2),(33,'Ioio',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/ioio.jpeg',5,2),(34,'Estojo',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/estojo.jpg',5,2),(35,'Garrafinha',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/garrafa.jpg',5,2),(36,'Caderninho',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/cardeno.jpeg',5,2),(37,'Canetinhas',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/canetinha.jpg',5,2),(38,'Short',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/short.jpeg',5,2),(39,'Balas',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/balas.jpg',6,2),(40,'Pirulitos',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/bala-goma.jpg',6,2),(41,'Chocolate',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/chocolate.png',6,2),(42,'Biscoitos',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/passatemmpo.jpeg',6,2),(43,'Bala de Goma',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/bala-goma.jpg',6,2),(44,'Bombom',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/bombom.jpg',6,2),(45,'Kit Ping Pong',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.amazonaws.com/image-1729985049424-20241026.jpg',1,3),(46,'Jogos',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/brinqueso.jpg',1,3),(47,'Ensino Fundamental 1',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/material-fundamental.png',2,3),(48,'Ensino Fundamental 2',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/material-fundamental.png',2,3),(49,'Kit Dental Pré Teen',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/dental-infantil.jpg',3,3),(50,'Sabonete',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/sabonete infantil.jpg',3,3),(51,'Pente',29.99,'M',1,'foto_do_produto.jpg',3,3),(52,'Blusa',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/blusa.jpg',4,3),(53,'Chinelinho',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/chinelo.png',4,3),(54,'Shorts',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/short.jpeg',4,3),(55,'Ioio',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/ioio.jpeg',5,3),(56,'Estojo',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/estojo.jpg',5,3),(57,'Garrafinha',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/garrafa.jpg',5,3),(58,'Caderninho',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/cardeno.jpeg',5,3),(59,'Canetinhas',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/canetinha.jpg',5,3),(60,'Short',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/short.jpeg',5,3),(61,'Balas',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/balas.jpg',6,3),(62,'Pirulitos',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/bala-goma.jpg',6,3),(63,'Chocolate',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/chocolate.png',6,3),(64,'Biscoitos',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/passatemmpo.jpeg',6,3),(65,'Bala de Goma',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/bala-goma.jpg',6,3),(66,'Bombom',29.99,'M',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/bombom.jpg',6,3),(67,'Bonequinha',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/boneca.jpeg',1,1),(68,'Jogo de Montar',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/jogo-montar.png',1,1),(69,'Educação Infantil',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/material-infantil.jpg',2,1),(70,'Ensino Fundamental 1',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/material-fundamental.png',2,1),(71,'Kit Dental Infantil',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/dental-infantil.jpg',3,1),(72,'Sabão Infantil',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/sabonete infantil.jpg',3,1),(73,'Toalinha',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/toalinha.jpg',3,1),(74,'Blusa',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/blusa.jpg',4,1),(75,'Chinelinho',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/chinelo rosa.png',4,1),(76,'Shorts',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/short.jpeg',4,1),(77,'Itens para Cabelo',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/cabelo.jpg',5,1),(78,'Estojo',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/estojo.jpg',5,1),(79,'Garrafinha',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/garrafa.jpg',5,1),(80,'Caderninho',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/cardeno.jpeg',5,1),(81,'Canetinhas',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/canetinha.jpg',5,1),(82,'Short',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/short.jpeg',5,1),(83,'Balas',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/balas.jpg',6,1),(84,'Pirulitos',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/bala-goma.jpg',6,1),(85,'Chocolate',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/chocolate.png',6,1),(86,'Biscoitos',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/passatemmpo.jpeg',6,1),(87,'Bala de Goma',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/bala-goma.jpg',6,1),(88,'Bombom',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/bombom.jpg',6,1),(89,'Boneca',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/boneca.jpeg',1,2),(90,'Jogos',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/brinqueso.jpg',1,2),(91,'Educação Infantil',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/material-infantil.jpg',2,2),(92,'Ensino Fundamental 1',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/material-fundamental.png',2,2),(93,'Kit Dental',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/dental-infantil.jpg',3,2),(94,'Sabão Infantil',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/sabonete infantil.jpg',3,2),(95,'Toalinha',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/toalinha.jpg',3,2),(96,'Blusa',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/blusa.jpg',4,2),(97,'Chinelinho',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/chinelo rosa.png',4,2),(98,'Shorts',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/short.jpeg',4,2),(99,'Itens para Cabelo',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/cabelo.jpg',5,2),(100,'Estojo',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/estojo.jpg',5,2),(101,'Garrafinha',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/garrafa.jpg',5,2),(102,'Caderninho',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/cardeno.jpeg',5,2),(103,'Canetinhas',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/canetinha.jpg',5,2),(104,'Short',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/short.jpeg',5,2),(105,'Balas',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/balas.jpg',6,2),(106,'Pirulitos',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/bala-goma.jpg',6,2),(107,'Chocolate',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/chocolate.png',6,2),(108,'Biscoitos',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/passatemmpo.jpeg',6,2),(109,'Bala de Goma',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/bala-goma.jpg',6,2),(110,'Bombom',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/bombom.jpg',6,2),(111,'Kit de Maquiagem',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.amazonaws.com/image-1729985022632-20241026.jpg',1,3),(112,'Jogos',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/brinqueso.jpg',1,3),(113,'Ensino Fundamental 1',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/material-fundamental.png',2,3),(114,'Ensino Fundamental 2',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/material-fundamental.png',2,3),(115,'Kit Dental Pré Teen',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/dental-infantil.jpg',3,3),(116,'Escova de Cabelo',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.amazonaws.com/image-1729985123082-20241026.jpg',3,3),(117,'Absorvente',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.amazonaws.com/image-1729985130772-20241026.jpg',3,3),(118,'Blusa',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/blusa.jpg',4,3),(119,'Chinelinho',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/chinelo rosa.png',4,3),(120,'Shorts',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/short.jpeg',4,3),(121,'Itens para Cabelo',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/cabelo.jpg',5,3),(122,'Estojo',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/estojo.jpg',5,3),(123,'Garrafinha',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/garrafa.jpg',5,3),(124,'Caderninho',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/cardeno.jpeg',5,3),(125,'Canetinhas',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/canetinha.jpg',5,3),(126,'Short',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/short.jpeg',5,3),(127,'Balas',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/balas.jpg',6,3),(128,'Pirulitos',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/bala-goma.jpg',6,3),(129,'Chocolate',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/chocolate.png',6,3),(130,'Biscoitos',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/passatemmpo.jpeg',6,3),(131,'Bala de Goma',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/bala-goma.jpg',6,3),(132,'Bombom',29.99,'F',1,'https://bucket-caixadesapato-prd.s3.us-east-1.amazonaws.com/bombom.jpg',6,3),(133,'novo produto',1.90,'M',0,'print-terraform (1).png',2,1);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_caixa`
--

DROP TABLE IF EXISTS `status_caixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_caixa` (
  `id_status_caixa` int NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_status_caixa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_caixa`
--

LOCK TABLES `status_caixa` WRITE;
/*!40000 ALTER TABLE `status_caixa` DISABLE KEYS */;
INSERT INTO `status_caixa` VALUES (1,'Pronta para montagem'),(2,'Pronta para entrega'),(3,'Entregue');
/*!40000 ALTER TABLE `status_caixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_pedido`
--

DROP TABLE IF EXISTS `status_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_pedido` (
  `id_status_pedido` int NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_status_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_pedido`
--

LOCK TABLES `status_pedido` WRITE;
/*!40000 ALTER TABLE `status_pedido` DISABLE KEYS */;
INSERT INTO `status_pedido` VALUES (1,'Pendente'),(2,'Enviado'),(3,'Entregue');
/*!40000 ALTER TABLE `status_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_caixas_atrasadas`
--

DROP TABLE IF EXISTS `vw_caixas_atrasadas`;
/*!50001 DROP VIEW IF EXISTS `vw_caixas_atrasadas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_caixas_atrasadas` AS SELECT 
 1 AS `quantidade_caixas_atrasadas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_caixas_em_montagem`
--

DROP TABLE IF EXISTS `vw_caixas_em_montagem`;
/*!50001 DROP VIEW IF EXISTS `vw_caixas_em_montagem`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_caixas_em_montagem` AS SELECT 
 1 AS `quantidade_caixas_em_montagem`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_caixas_para_entregar`
--

DROP TABLE IF EXISTS `vw_caixas_para_entregar`;
/*!50001 DROP VIEW IF EXISTS `vw_caixas_para_entregar`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_caixas_para_entregar` AS SELECT 
 1 AS `quantidade_caixas_para_entregar`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_filtros_pedidos`
--

DROP TABLE IF EXISTS `vw_filtros_pedidos`;
/*!50001 DROP VIEW IF EXISTS `vw_filtros_pedidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_filtros_pedidos` AS SELECT 
 1 AS `idpedido`,
 1 AS `data_pedido`,
 1 AS `valor_total`,
 1 AS `fk_status_pedido`,
 1 AS `fk_doador`,
 1 AS `id_etapa_caixa`,
 1 AS `fk_status`,
 1 AS `idCaixa`,
 1 AS `fk_pedido`,
 1 AS `qtd_caixas_with_null`,
 1 AS `qtd_caixas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_pedidos_por_mes`
--

DROP TABLE IF EXISTS `vw_pedidos_por_mes`;
/*!50001 DROP VIEW IF EXISTS `vw_pedidos_por_mes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_pedidos_por_mes` AS SELECT 
 1 AS `idpedido`,
 1 AS `data_pedido`,
 1 AS `valor_total`,
 1 AS `fk_status_pedido`,
 1 AS `fk_doador`,
 1 AS `dia`,
 1 AS `mes`,
 1 AS `ano`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_qtd_pedidos_por_faixa_etaria`
--

DROP TABLE IF EXISTS `vw_qtd_pedidos_por_faixa_etaria`;
/*!50001 DROP VIEW IF EXISTS `vw_qtd_pedidos_por_faixa_etaria`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_qtd_pedidos_por_faixa_etaria` AS SELECT 
 1 AS `ano`,
 1 AS `mes`,
 1 AS `faixa_nome`,
 1 AS `quantidade_pedidos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_qtd_produtos_por_categoria`
--

DROP TABLE IF EXISTS `vw_qtd_produtos_por_categoria`;
/*!50001 DROP VIEW IF EXISTS `vw_qtd_produtos_por_categoria`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_qtd_produtos_por_categoria` AS SELECT 
 1 AS `ano`,
 1 AS `produto`,
 1 AS `categoria`,
 1 AS `quantidade_produtos_doacao`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_caixas_atrasadas`
--

/*!50001 DROP VIEW IF EXISTS `vw_caixas_atrasadas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_caixas_atrasadas` AS select count(`c`.`id_caixa`) AS `quantidade_caixas_atrasadas` from ((`caixa` `c` join `pedido` `p` on((`c`.`fk_pedido` = `p`.`idpedido`))) join `status_pedido` `sp` on((`p`.`fk_status_pedido` = `sp`.`id_status_pedido`))) where ((`p`.`data_pedido` < (now() - interval 2 week)) and (`sp`.`status` <> 'Entregue')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_caixas_em_montagem`
--

/*!50001 DROP VIEW IF EXISTS `vw_caixas_em_montagem`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_caixas_em_montagem` AS select count(`etapas_max_caixas`.`id_etapa_caixa`) AS `quantidade_caixas_em_montagem` from ((select max(`etapa_caixa`.`id_etapa_caixa`) AS `id_etapa_caixa`,max(`etapa_caixa`.`fk_status`) AS `fk_status` from `etapa_caixa` group by `etapa_caixa`.`fk_id_caixa`) `etapas_max_caixas` join `status_caixa` on((`status_caixa`.`id_status_caixa` = `etapas_max_caixas`.`fk_status`))) where (`status_caixa`.`status` = 'Pronta para montagem') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_caixas_para_entregar`
--

/*!50001 DROP VIEW IF EXISTS `vw_caixas_para_entregar`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_caixas_para_entregar` AS select count(`etapas_max_caixas`.`id_etapa_caixa`) AS `quantidade_caixas_para_entregar` from ((select max(`etapa_caixa`.`id_etapa_caixa`) AS `id_etapa_caixa`,max(`etapa_caixa`.`fk_status`) AS `fk_status` from `etapa_caixa` group by `etapa_caixa`.`fk_id_caixa`) `etapas_max_caixas` join `status_caixa` on((`status_caixa`.`id_status_caixa` = `etapas_max_caixas`.`fk_status`))) where (`status_caixa`.`status` = 'Pronta para entrega') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_filtros_pedidos`
--

/*!50001 DROP VIEW IF EXISTS `vw_filtros_pedidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_filtros_pedidos` AS select `pedido`.`idpedido` AS `idpedido`,`pedido`.`data_pedido` AS `data_pedido`,`pedido`.`valor_total` AS `valor_total`,`pedido`.`fk_status_pedido` AS `fk_status_pedido`,`pedido`.`fk_doador` AS `fk_doador`,`max_status_caixa`.`id_etapa_caixa` AS `id_etapa_caixa`,`max_status_caixa`.`fk_status` AS `fk_status`,`max_status_caixa`.`idCaixa` AS `idCaixa`,`max_status_caixa`.`fk_pedido` AS `fk_pedido`,`max_status_caixa`.`qtd_caixas_with_null` AS `qtd_caixas_with_null`,ifnull(`max_status_caixa`.`qtd_caixas_with_null`,0) AS `qtd_caixas` from ((`pedido` join (select max(`etapa_caixa`.`id_etapa_caixa`) AS `id_etapa_caixa`,max(`etapa_caixa`.`fk_status`) AS `fk_status`,max(`etapa_caixa`.`fk_id_caixa`) AS `idCaixa`,max(`caixa`.`fk_pedido`) AS `fk_pedido`,count(distinct `caixa`.`id_caixa`) AS `qtd_caixas_with_null` from (`etapa_caixa` join `caixa` on((`caixa`.`id_caixa` = `etapa_caixa`.`fk_id_caixa`))) group by `etapa_caixa`.`fk_id_caixa`) `max_status_caixa` on((`max_status_caixa`.`fk_pedido` = `pedido`.`idpedido`))) join `doador` on((`pedido`.`fk_doador` = `doador`.`id_doador`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_pedidos_por_mes`
--

/*!50001 DROP VIEW IF EXISTS `vw_pedidos_por_mes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_pedidos_por_mes` AS select `p`.`idpedido` AS `idpedido`,`p`.`data_pedido` AS `data_pedido`,`p`.`valor_total` AS `valor_total`,`p`.`fk_status_pedido` AS `fk_status_pedido`,`p`.`fk_doador` AS `fk_doador`,dayofmonth(`p`.`data_pedido`) AS `dia`,month(`p`.`data_pedido`) AS `mes`,year(`p`.`data_pedido`) AS `ano` from `pedido` `p` order by year(`p`.`data_pedido`),month(`p`.`data_pedido`),dayofmonth(`p`.`data_pedido`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_qtd_pedidos_por_faixa_etaria`
--

/*!50001 DROP VIEW IF EXISTS `vw_qtd_pedidos_por_faixa_etaria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_qtd_pedidos_por_faixa_etaria` AS select year(`p`.`data_pedido`) AS `ano`,month(`p`.`data_pedido`) AS `mes`,`fe`.`faixa_nome` AS `faixa_nome`,count(distinct `p`.`idpedido`) AS `quantidade_pedidos` from ((`pedido` `p` join `caixa` `c` on((`p`.`idpedido` = `c`.`fk_pedido`))) join `faixa_etaria` `fe` on((`c`.`fk_faixa_etaria` = `fe`.`id_faixa_etaria`))) group by year(`p`.`data_pedido`),month(`p`.`data_pedido`),`fe`.`faixa_nome` order by `ano`,`mes`,`fe`.`faixa_nome` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_qtd_produtos_por_categoria`
--

/*!50001 DROP VIEW IF EXISTS `vw_qtd_produtos_por_categoria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_qtd_produtos_por_categoria` AS select year(`p`.`data_pedido`) AS `ano`,`pr`.`nome` AS `produto`,`cp`.`nome` AS `categoria`,count(`ic`.`id_produto_caixa`) AS `quantidade_produtos_doacao` from ((((`pedido` `p` join `caixa` `c` on((`p`.`idpedido` = `c`.`fk_pedido`))) join `item_caixa` `ic` on((`c`.`id_caixa` = `ic`.`fk_caixa`))) join `produto` `pr` on((`ic`.`fk_produto` = `pr`.`id_produto`))) join `categoria_produto` `cp` on((`pr`.`fk_categoria_produto` = `cp`.`id_categoria_produto`))) where (`cp`.`nome` = 'DOCES') group by year(`p`.`data_pedido`),`pr`.`nome`,`cp`.`nome` order by `ano`,`produto` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

DELIMITER ;;
CREATE TRIGGER atualiza_status_pedido AFTER INSERT ON etapa_caixa FOR EACH ROW BEGIN
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
END;;
DELIMITER ;


DELIMITER ;;
 CREATE TRIGGER set_default_qrcode_token BEFORE INSERT ON caixa FOR EACH ROW BEGIN

    IF NEW.qr_code_token IS NULL THEN

        SET NEW.qr_code_token = SHA2(CONCAT(UUID, UNIX_TIMESTAMP()), 256);
    END IF;
END;;
DELIMITER ;

-- Dump completed on 2024-11-22 16:46:55
