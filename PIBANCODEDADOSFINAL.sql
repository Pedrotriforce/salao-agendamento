-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pi
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `agendamento`
--

DROP TABLE IF EXISTS `agendamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agendamento` (
  `id_agendamento` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `id_servico` int DEFAULT NULL,
  `hora_agendamento` datetime DEFAULT NULL,
  `data_marcacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('agendado','cancelado','concluido') DEFAULT 'agendado',
  `observacoes` text,
  PRIMARY KEY (`id_agendamento`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_servico` (`id_servico`),
  CONSTRAINT `agendamento_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE CASCADE,
  CONSTRAINT `agendamento_ibfk_2` FOREIGN KEY (`id_servico`) REFERENCES `servico` (`id_servico`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendamento`
--

LOCK TABLES `agendamento` WRITE;
/*!40000 ALTER TABLE `agendamento` DISABLE KEYS */;
INSERT INTO `agendamento` VALUES (1,1,20,'2024-03-15 14:00:00','2025-04-01 14:42:51','agendado','Cliente prefere manhãs'),(2,3,2,'2024-03-16 09:30:00','2025-04-01 14:42:51','agendado','Primeira visita'),(3,6,5,'2024-03-17 11:00:00','2025-04-01 14:42:51','agendado','Retorno de tratamento'),(4,9,10,'2024-03-18 15:30:00','2025-04-01 14:42:51','agendado','Alérgico a amônia'),(5,12,23,'2024-03-19 10:00:00','2025-04-01 14:42:51','agendado','Manutenção de mechas'),(6,15,25,'2024-03-20 13:00:00','2025-04-01 14:42:51','agendado','Consulta inicial'),(7,2,7,'2024-03-21 14:30:00','2025-04-01 14:42:51','agendado','Manutenção de cor'),(8,11,2,'2024-03-22 16:00:00','2025-04-01 14:42:51','agendado','Corte tradicional'),(9,4,11,'2024-03-10 10:00:00','2025-04-01 14:42:51','concluido','Cliente satisfeita'),(10,5,2,'2024-03-11 11:30:00','2025-04-01 14:42:51','concluido','Sem observações'),(11,8,8,'2024-03-12 15:00:00','2025-04-01 14:42:51','cancelado','Cliente adiou para o próximo mês'),(12,13,2,'2024-03-13 17:00:00','2025-04-01 14:42:51','cancelado','Não compareceu'),(13,13,4,'2024-03-17 15:30:00','2025-04-01 14:42:51','agendado','sem observações');
/*!40000 ALTER TABLE `agendamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `telefone` varchar(30) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Ana Carolina Silva','(11) 98765-4321','2023-01-15 03:00:00'),(2,'Beatriz Oliveira Santos','(21) 99876-5432','2023-02-20 03:00:00'),(3,'Carlos Eduardo Pereira','(31) 98765-1234','2023-03-10 03:00:00'),(4,'Daniela Almeida Costa','(41) 99654-3210','2023-01-05 03:00:00'),(5,'Eduardo Martins Rocha','(51) 98543-2109','2023-04-18 03:00:00'),(6,'Fernanda Souza Lima','(11) 97654-3289','2023-05-22 03:00:00'),(7,'Gabriel Ferreira Rodrigues','(21) 96543-2178','2023-06-30 03:00:00'),(8,'Isabela Castro Gomes','(31) 95432-1876','2023-02-14 03:00:00'),(9,'João Victor Barbosa','(41) 94321-0765','2023-07-05 03:00:00'),(10,'Larissa Mendes Nunes','(51) 93210-7654','2023-08-12 03:00:00'),(11,'Marcos Antônio Dias','(11) 92107-6543','2023-03-25 03:00:00'),(12,'Natália Ribeiro Teixeira','(21) 91076-5432','2023-09-08 03:00:00'),(13,'Otávio Campos Cardoso','(31) 90765-4321','2023-10-15 03:00:00'),(14,'Patrícia Duarte Machado','(41) 98760-1234','2023-04-03 03:00:00'),(15,'Rafaela Santana Moraes','(51) 97650-4321','2023-11-19 03:00:00');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servico` (
  `id_servico` int NOT NULL AUTO_INCREMENT,
  `nome_servico` varchar(30) NOT NULL,
  `preço` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id_servico`),
  UNIQUE KEY `nome_servico` (`nome_servico`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico`
--

LOCK TABLES `servico` WRITE;
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
INSERT INTO `servico` VALUES (1,'Corte Feminino',60.00),(2,'Corte Masculino',40.00),(3,'Corte Infantil',35.00),(4,'Hidratação',80.00),(5,'Botox Capilar',120.00),(6,'Reconstrução',100.00),(7,'Coloração',90.00),(8,'Mechas',150.00),(9,'Reflexo',110.00),(10,'Progressiva',130.00),(11,'Escova',50.00),(12,'Secagem',30.00),(13,'Penteado',70.00),(14,'Tratamento para Queda',95.00),(15,'Relaxamento',85.00),(16,'Selagem',75.00),(17,'Matização',65.00),(18,'Descoloração',120.00),(19,'Corte + Escova',90.00),(20,'Corte + Hidratação',120.00),(21,'Pérolizado',140.00),(22,'Cauterização',110.00),(23,'Luzes',160.00),(24,'Baby Liss',180.00),(25,'Terapia Capilar',200.00);
/*!40000 ALTER TABLE `servico` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-05  8:05:46
