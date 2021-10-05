CREATE DATABASE  IF NOT EXISTS `dbphonemanager` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbphonemanager`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbphonemanager
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `phone_number` char(10) NOT NULL,
  `month` int NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`phone_number`,`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES ('693240865',1,0),('693240865',2,0),('699569900',1,1),('699569900',2,0),('699569900',3,0);
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls`
--

DROP TABLE IF EXISTS `calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calls` (
  `call_id` int NOT NULL,
  `month` int NOT NULL,
  `duration` int NOT NULL,
  `phone_number` char(10) DEFAULT NULL,
  PRIMARY KEY (`call_id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `calls_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phonenumbers` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls`
--

LOCK TABLES `calls` WRITE;
/*!40000 ALTER TABLE `calls` DISABLE KEYS */;
INSERT INTO `calls` VALUES (1,2,3,'699569900'),(2,2,4,'699569900'),(3,3,5,'699569900');
/*!40000 ALTER TABLE `calls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `username` char(50) NOT NULL,
  `afm` decimal(10,0) NOT NULL,
  `phone_number` char(10) NOT NULL,
  `program_id` int NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `afm` (`afm`),
  UNIQUE KEY `phone_number` (`phone_number`),
  KEY `program_id` (`program_id`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`),
  CONSTRAINT `clients_ibfk_2` FOREIGN KEY (`program_id`) REFERENCES `programs` (`program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES ('calls',123456,'699569900',1),('client1',392943040,'691700467',1),('nikos2',183927392,'697375227',1),('stelios1',104729376,'699010050',2),('takis1',273829152,'691273849',3),('xxxx',12121,'693401040',3);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phonenumbers`
--

DROP TABLE IF EXISTS `phonenumbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phonenumbers` (
  `phone_number` char(10) NOT NULL,
  `area` text NOT NULL,
  `type` text NOT NULL,
  PRIMARY KEY (`phone_number`),
  CONSTRAINT `phonenumbers_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `clients` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phonenumbers`
--

LOCK TABLES `phonenumbers` WRITE;
/*!40000 ALTER TABLE `phonenumbers` DISABLE KEYS */;
INSERT INTO `phonenumbers` VALUES ('691273849','Thessaloniki','Cellphone'),('691700467','Athens','Cellphone'),('693401040','Thessaloniki','Cellphone'),('697375227','Thessaloniki','Cellphone'),('699010050','Piraeus','Cellphone'),('699569900','Athens','Cellphone');
/*!40000 ALTER TABLE `phonenumbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programs`
--

DROP TABLE IF EXISTS `programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programs` (
  `program_id` int NOT NULL AUTO_INCREMENT,
  `sms` text NOT NULL,
  `data` text NOT NULL,
  `speech_time` text NOT NULL,
  `price` text NOT NULL,
  PRIMARY KEY (`program_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs`
--

LOCK TABLES `programs` WRITE;
/*!40000 ALTER TABLE `programs` DISABLE KEYS */;
INSERT INTO `programs` VALUES (1,'100','500MB','200\'','10'),(2,'200','1000MB','500\'','20'),(3,'300','2000MB','1000\'','500'),(4,'100','500MB','200\'','10'),(5,'200','1000MB','500\'','20'),(6,'50','50MB','50\'','5');
/*!40000 ALTER TABLE `programs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` char(50) NOT NULL,
  `name` text NOT NULL,
  `surname` text NOT NULL,
  `password` text NOT NULL,
  `property` char(20) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('astreader4','Ardella','Streader','18498185DE16CC3487D8FB142FAC17CB','Seller'),('bmcvane3','Budd','McVane','A093E5FDF46C9370AE67EB5C29050313','Admin'),('calls','Stefanos','Gregory','534F7114C239C9A5892ECE7642ECF8DB','Client'),('client1','Aris','Hariklis','C45ED53297CA9933AEC729D4B0BB09B6','Client'),('nikos2','Nikos','Nikolakopoulos','FF34CA7EDF9262C6841CCAE38CE12ED7','Client'),('seller1','Akis','Petretzikis','E492BD1C7E46720D956C458F44711A58','Seller'),('stelios1','Stelios','Astaras','39D8A5B91C1B96349C86A712E3775462','Client'),('takis1','Takis','Takakis','9D44D005FA2C02A98467947E4174B647','Client'),('test','Test','Testing','2B435504A9D8E809EB0D0E567128BF88','Admin'),('xxxx','Aikaterini','Gal','5FCD137CC44D46170F8795C1EAFDAD37','Client');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-08 23:11:28
