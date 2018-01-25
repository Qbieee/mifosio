CREATE DATABASE  IF NOT EXISTS `seshat` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `seshat`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: seshat
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `khepri_apps`
--

DROP TABLE IF EXISTS `khepri_apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `khepri_apps` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_identifier` varchar(32) NOT NULL,
  `application_identifier` varchar(32) NOT NULL,
  `permittable_identifier` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `khepri_apps_uq` (`tenant_identifier`,`application_identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khepri_apps`
--

LOCK TABLES `khepri_apps` WRITE;
/*!40000 ALTER TABLE `khepri_apps` DISABLE KEYS */;
INSERT INTO `khepri_apps` VALUES (1,'playground','portfolio-v1','portfolio__v1__khepri'),(2,'playground','deposit-v1','deposit__v1__khepri');
/*!40000 ALTER TABLE `khepri_apps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khepri_beats`
--

DROP TABLE IF EXISTS `khepri_beats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `khepri_beats` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_identifier` varchar(32) NOT NULL,
  `application_identifier` varchar(64) NOT NULL,
  `beat_identifier` varchar(32) NOT NULL,
  `alignment_hour` int(11) NOT NULL,
  `next_beat` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `khepri_beats_uq` (`tenant_identifier`,`application_identifier`,`beat_identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khepri_beats`
--

LOCK TABLES `khepri_beats` WRITE;
/*!40000 ALTER TABLE `khepri_beats` DISABLE KEYS */;
INSERT INTO `khepri_beats` VALUES (1,'playground','portfolio-v1','alignment0',0,'2018-01-24 00:00:00.000'),(2,'playground','portfolio-v1','alignment23',23,'2018-01-24 23:00:00.000'),(3,'playground','portfolio-v1','alignment22',22,'2018-01-24 22:00:00.000'),(4,'playground','portfolio-v1','alignment21',21,'2018-01-24 21:00:00.000'),(5,'playground','portfolio-v1','alignment20',20,'2018-01-24 20:00:00.000'),(6,'playground','portfolio-v1','alignment19',19,'2018-01-24 19:00:00.000'),(7,'playground','portfolio-v1','alignment18',18,'2018-01-24 18:00:00.000'),(8,'playground','portfolio-v1','alignment17',17,'2018-01-24 17:00:00.000'),(9,'playground','portfolio-v1','alignment16',16,'2018-01-24 16:00:00.000'),(10,'playground','portfolio-v1','alignment15',15,'2018-01-24 15:00:00.000'),(11,'playground','portfolio-v1','alignment14',14,'2018-01-24 14:00:00.000'),(12,'playground','portfolio-v1','alignment13',13,'2018-01-24 13:00:00.000'),(13,'playground','portfolio-v1','alignment12',12,'2018-01-24 12:00:00.000'),(14,'playground','portfolio-v1','alignment11',11,'2018-01-24 11:00:00.000'),(15,'playground','portfolio-v1','alignment10',10,'2018-01-24 10:00:00.000'),(16,'playground','portfolio-v1','alignment9',9,'2018-01-24 09:00:00.000'),(17,'playground','portfolio-v1','alignment8',8,'2018-01-24 08:00:00.000'),(18,'playground','portfolio-v1','alignment7',7,'2018-01-24 07:00:00.000'),(19,'playground','portfolio-v1','alignment6',6,'2018-01-24 06:00:00.000'),(20,'playground','portfolio-v1','alignment5',5,'2018-01-24 05:00:00.000'),(21,'playground','portfolio-v1','alignment4',4,'2018-01-24 04:00:00.000'),(22,'playground','portfolio-v1','alignment3',3,'2018-01-24 03:00:00.000'),(23,'playground','portfolio-v1','alignment2',2,'2018-01-24 02:00:00.000'),(24,'playground','portfolio-v1','alignment1',1,'2018-01-24 01:00:00.000'),(25,'playground','deposit-v1','deposit-interest-accrual',22,'2018-01-24 22:00:00.000');
/*!40000 ALTER TABLE `khepri_beats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rhythm_schema_version`
--

DROP TABLE IF EXISTS `rhythm_schema_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rhythm_schema_version` (
  `version_rank` int(11) NOT NULL,
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`version`),
  KEY `rhythm_schema_version_vr_idx` (`version_rank`),
  KEY `rhythm_schema_version_ir_idx` (`installed_rank`),
  KEY `rhythm_schema_version_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rhythm_schema_version`
--

LOCK TABLES `rhythm_schema_version` WRITE;
/*!40000 ALTER TABLE `rhythm_schema_version` DISABLE KEYS */;
INSERT INTO `rhythm_schema_version` VALUES (1,1,'0','<< Flyway Baseline >>','BASELINE','<< Flyway Baseline >>',NULL,'root','2018-01-24 14:16:56',0,1),(2,2,'1','initial setup','SQL','V1__initial_setup.sql',522697927,'root','2018-01-24 14:16:56',69,1);
/*!40000 ALTER TABLE `rhythm_schema_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenants`
--

DROP TABLE IF EXISTS `tenants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenants` (
  `identifier` varchar(32) NOT NULL,
  `driver_class` varchar(255) NOT NULL,
  `database_name` varchar(32) NOT NULL,
  `host` varchar(512) NOT NULL,
  `port` varchar(5) NOT NULL,
  `a_user` varchar(32) NOT NULL,
  `pwd` varchar(32) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenants`
--

LOCK TABLES `tenants` WRITE;
/*!40000 ALTER TABLE `tenants` DISABLE KEYS */;
INSERT INTO `tenants` VALUES ('playground','org.mariadb.jdbc.Driver','playground','localhost','3306','root','mysql');
/*!40000 ALTER TABLE `tenants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'seshat'
--

--
-- Dumping routines for database 'seshat'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-24 23:05:46
