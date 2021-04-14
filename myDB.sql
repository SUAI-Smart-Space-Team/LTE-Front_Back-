-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: mybd
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `Moment` datetime DEFAULT NULL,
  `IdUser` int DEFAULT NULL,
  `Interface` varchar(255) DEFAULT NULL,
  `Message` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES ('2021-04-09 16:11:16',2,'LTE','Hello'),('2021-04-13 12:01:33',2,'LTE','qweqwui'),('2021-04-13 12:01:41',1,'LTE','ewryuwir'),('2021-04-13 12:04:07',2,'LTE','ehruwrhk'),('2021-04-13 12:04:12',1,'LTE','hjkhkjhfs'),('2021-04-13 12:13:14',2,'WiFi','werwe'),('2021-04-13 12:14:07',3,'WiFi','djgdkhgkdjhgkjdhjkf'),('2021-04-13 12:21:38',1,'LTE','asadjhasdj'),('2021-04-13 12:44:32',2,'LTE','sfhsdfhj'),('2021-04-14 16:54:32',2,'LTE','Hello');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lora`
--

DROP TABLE IF EXISTS `lora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lora` (
  `IdUser` int DEFAULT NULL,
  `IpIn` varchar(255) DEFAULT NULL,
  `IpOut` varchar(255) DEFAULT NULL,
  KEY `IdUser` (`IdUser`),
  CONSTRAINT `lora_ibfk_1` FOREIGN KEY (`IdUser`) REFERENCES `users` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lora`
--

LOCK TABLES `lora` WRITE;
/*!40000 ALTER TABLE `lora` DISABLE KEYS */;
INSERT INTO `lora` VALUES (1,'127.0.0.1','127.0.0.1');
/*!40000 ALTER TABLE `lora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lte`
--

DROP TABLE IF EXISTS `lte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lte` (
  `IdUser` int DEFAULT NULL,
  `IpIn` varchar(255) DEFAULT NULL,
  `IpOut` varchar(255) DEFAULT NULL,
  KEY `IdUser` (`IdUser`),
  CONSTRAINT `lte_ibfk_1` FOREIGN KEY (`IdUser`) REFERENCES `users` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lte`
--

LOCK TABLES `lte` WRITE;
/*!40000 ALTER TABLE `lte` DISABLE KEYS */;
INSERT INTO `lte` VALUES (1,'127.0.0.1','127.0.0.1');
/*!40000 ALTER TABLE `lte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `LTE` tinyint(1) DEFAULT '0',
  `LoRa` tinyint(1) DEFAULT '0',
  `WiFi` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,1,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wifi`
--

DROP TABLE IF EXISTS `wifi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wifi` (
  `IdUser` int DEFAULT NULL,
  `IpIn` varchar(255) DEFAULT NULL,
  `IpOut` varchar(255) DEFAULT NULL,
  KEY `IdUser` (`IdUser`),
  CONSTRAINT `wifi_ibfk_1` FOREIGN KEY (`IdUser`) REFERENCES `users` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wifi`
--

LOCK TABLES `wifi` WRITE;
/*!40000 ALTER TABLE `wifi` DISABLE KEYS */;
INSERT INTO `wifi` VALUES (1,'127.0.0.1','127.0.0.1');
/*!40000 ALTER TABLE `wifi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-14 23:15:47
