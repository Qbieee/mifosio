CREATE DATABASE  IF NOT EXISTS `playground` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `playground`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: playground
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
-- Table structure for table `accounting_schema_version`
--

DROP TABLE IF EXISTS `accounting_schema_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_schema_version` (
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
  KEY `accounting_schema_version_vr_idx` (`version_rank`),
  KEY `accounting_schema_version_ir_idx` (`installed_rank`),
  KEY `accounting_schema_version_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounting_schema_version`
--

LOCK TABLES `accounting_schema_version` WRITE;
/*!40000 ALTER TABLE `accounting_schema_version` DISABLE KEYS */;
INSERT INTO `accounting_schema_version` VALUES (1,1,'0','<< Flyway Baseline >>','BASELINE','<< Flyway Baseline >>',NULL,'root','2018-01-22 17:06:14',0,1),(2,2,'1','initial setup','SQL','V1__initial_setup.sql',-163386530,'root','2018-01-22 17:06:15',217,1),(3,3,'2','add column to ledger','SQL','V2__add_column_to_ledger.sql',-338199133,'root','2018-01-22 17:06:15',102,1),(4,4,'3','create tx type','SQL','V3__create_tx_type.sql',-2019579240,'root','2018-01-22 17:06:15',67,1),(5,5,'4','adjust account identifier length','SQL','V4__adjust_account_identifier_length.sql',288915087,'root','2018-01-22 17:06:15',51,1),(6,6,'5','add ichq to tx types','SQL','V5__add_ichq_to_tx_types.sql',15172565,'root','2018-01-22 17:06:15',7,1),(7,7,'6','add payroll distribution','SQL','V6__add_payroll_distribution.sql',34156780,'root','2018-01-22 17:06:15',88,1),(8,8,'7','drop payroll distributions','SQL','V7__drop_payroll_distributions.sql',1441015792,'root','2018-01-22 17:06:15',49,1),(9,9,'8','alternative account number','SQL','V8__alternative_account_number.sql',385885057,'root','2018-01-22 17:06:15',109,1),(10,10,'9','add total value ledger','SQL','V9__add_total_value_ledger.sql',-1396041475,'root','2018-01-22 17:06:15',84,1);
/*!40000 ALTER TABLE `accounting_schema_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bastet_c_acct_assigns`
--

DROP TABLE IF EXISTS `bastet_c_acct_assigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bastet_c_acct_assigns` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `designator` varchar(32) NOT NULL,
  `identifier` varchar(34) NOT NULL,
  `case_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bastet_c_acct_assign_uq` (`case_id`,`designator`),
  CONSTRAINT `bastet_c_acct_assign_par_fk` FOREIGN KEY (`case_id`) REFERENCES `bastet_cases` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bastet_c_acct_assigns`
--

LOCK TABLES `bastet_c_acct_assigns` WRITE;
/*!40000 ALTER TABLE `bastet_c_acct_assigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `bastet_c_acct_assigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bastet_c_task_insts`
--

DROP TABLE IF EXISTS `bastet_c_task_insts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bastet_c_task_insts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `case_id` bigint(20) NOT NULL,
  `task_def_id` bigint(20) NOT NULL,
  `a_comment` varchar(4096) NOT NULL,
  `executed_on` timestamp(3) NULL DEFAULT NULL,
  `executed_by` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bastet_c_task_inst_uq` (`case_id`,`task_def_id`),
  KEY `bastet_c_task_inst_def_fk` (`task_def_id`),
  CONSTRAINT `bastet_c_task_inst_case_fk` FOREIGN KEY (`case_id`) REFERENCES `bastet_cases` (`id`),
  CONSTRAINT `bastet_c_task_inst_def_fk` FOREIGN KEY (`task_def_id`) REFERENCES `bastet_p_task_defs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bastet_c_task_insts`
--

LOCK TABLES `bastet_c_task_insts` WRITE;
/*!40000 ALTER TABLE `bastet_c_task_insts` DISABLE KEYS */;
/*!40000 ALTER TABLE `bastet_c_task_insts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bastet_case_commands`
--

DROP TABLE IF EXISTS `bastet_case_commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bastet_case_commands` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `case_id` bigint(20) NOT NULL,
  `action_name` varchar(32) NOT NULL,
  `created_on` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `created_by` varchar(32) NOT NULL,
  `thoth_transaction_uq` varchar(26) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bastet_case_commands_uq` (`thoth_transaction_uq`,`action_name`,`case_id`),
  KEY `bastet_case_commands_fk` (`case_id`),
  CONSTRAINT `bastet_case_commands_fk` FOREIGN KEY (`case_id`) REFERENCES `bastet_cases` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bastet_case_commands`
--

LOCK TABLES `bastet_case_commands` WRITE;
/*!40000 ALTER TABLE `bastet_case_commands` DISABLE KEYS */;
/*!40000 ALTER TABLE `bastet_case_commands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bastet_cases`
--

DROP TABLE IF EXISTS `bastet_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bastet_cases` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(32) NOT NULL,
  `product_identifier` varchar(32) NOT NULL,
  `current_state` varchar(32) NOT NULL,
  `created_on` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `created_by` varchar(32) NOT NULL,
  `last_modified_on` timestamp(3) NULL DEFAULT NULL,
  `last_modified_by` varchar(32) DEFAULT NULL,
  `end_of_term` timestamp(3) NULL DEFAULT NULL,
  `interest` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bastet_case_uq` (`identifier`,`product_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bastet_cases`
--

LOCK TABLES `bastet_cases` WRITE;
/*!40000 ALTER TABLE `bastet_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `bastet_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bastet_il_c_credit_facts`
--

DROP TABLE IF EXISTS `bastet_il_c_credit_facts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bastet_il_c_credit_facts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `case_id` bigint(20) NOT NULL,
  `customer_identifier` varchar(32) NOT NULL,
  `position_in_factor` int(11) NOT NULL,
  `position_in_customers` int(11) NOT NULL,
  `fact_type` varchar(32) NOT NULL,
  `description` varchar(4096) NOT NULL,
  `amount` decimal(19,4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bastet_il_c_credit_facts_uq` (`case_id`,`customer_identifier`,`position_in_factor`,`fact_type`),
  CONSTRAINT `bastet_il_c_credit_facts_par_fk` FOREIGN KEY (`case_id`) REFERENCES `bastet_il_cases` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bastet_il_c_credit_facts`
--

LOCK TABLES `bastet_il_c_credit_facts` WRITE;
/*!40000 ALTER TABLE `bastet_il_c_credit_facts` DISABLE KEYS */;
/*!40000 ALTER TABLE `bastet_il_c_credit_facts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bastet_il_c_docs`
--

DROP TABLE IF EXISTS `bastet_il_c_docs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bastet_il_c_docs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `case_id` bigint(20) NOT NULL,
  `customer_identifier` varchar(32) NOT NULL,
  `document_identifier` varchar(32) NOT NULL,
  `list_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bastet_il_c_docs_uq` (`case_id`,`customer_identifier`,`document_identifier`),
  CONSTRAINT `bastet_il_c_docs_fk` FOREIGN KEY (`case_id`) REFERENCES `bastet_il_cases` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bastet_il_c_docs`
--

LOCK TABLES `bastet_il_c_docs` WRITE;
/*!40000 ALTER TABLE `bastet_il_c_docs` DISABLE KEYS */;
/*!40000 ALTER TABLE `bastet_il_c_docs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bastet_il_cases`
--

DROP TABLE IF EXISTS `bastet_il_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bastet_il_cases` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `case_id` bigint(20) NOT NULL,
  `customer_identifier` varchar(32) NOT NULL,
  `term_range_temporal_unit` varchar(128) NOT NULL,
  `term_range_minimum` int(11) NOT NULL,
  `term_range_maximum` int(11) NOT NULL,
  `balance_range_maximum` decimal(19,4) NOT NULL,
  `pay_cycle_temporal_unit` varchar(128) NOT NULL,
  `pay_cycle_period` int(11) NOT NULL,
  `pay_cycle_align_day` int(11) DEFAULT NULL,
  `pay_cycle_align_week` int(11) DEFAULT NULL,
  `pay_cycle_align_month` int(11) DEFAULT NULL,
  `payment_size` decimal(19,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bastet_il_cases_uq` (`case_id`),
  CONSTRAINT `bastet_il_cases_par_fk` FOREIGN KEY (`case_id`) REFERENCES `bastet_cases` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bastet_il_cases`
--

LOCK TABLES `bastet_il_cases` WRITE;
/*!40000 ALTER TABLE `bastet_il_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `bastet_il_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bastet_il_late_cases`
--

DROP TABLE IF EXISTS `bastet_il_late_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bastet_il_late_cases` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `case_id` bigint(20) NOT NULL,
  `late_since` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `bastet_il_late_cases_uq` (`case_id`),
  CONSTRAINT `bastet_il_late_cases_fk` FOREIGN KEY (`case_id`) REFERENCES `bastet_cases` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bastet_il_late_cases`
--

LOCK TABLES `bastet_il_late_cases` WRITE;
/*!40000 ALTER TABLE `bastet_il_late_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `bastet_il_late_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bastet_p_acct_assigns`
--

DROP TABLE IF EXISTS `bastet_p_acct_assigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bastet_p_acct_assigns` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `designator` varchar(32) NOT NULL,
  `identifier` varchar(34) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `thoth_type` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bastet_p_acct_assign_uq` (`product_id`,`designator`),
  CONSTRAINT `bastet_p_acct_assign_par_fk` FOREIGN KEY (`product_id`) REFERENCES `bastet_products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bastet_p_acct_assigns`
--

LOCK TABLES `bastet_p_acct_assigns` WRITE;
/*!40000 ALTER TABLE `bastet_p_acct_assigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `bastet_p_acct_assigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bastet_p_arrears_config`
--

DROP TABLE IF EXISTS `bastet_p_arrears_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bastet_p_arrears_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `days_late` int(11) NOT NULL,
  `percent_provision` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bastet_p_arrears_config_uq` (`product_id`,`days_late`),
  CONSTRAINT `bastet_p_arrears_config_fk` FOREIGN KEY (`product_id`) REFERENCES `bastet_products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bastet_p_arrears_config`
--

LOCK TABLES `bastet_p_arrears_config` WRITE;
/*!40000 ALTER TABLE `bastet_p_arrears_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `bastet_p_arrears_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bastet_p_balance_segs`
--

DROP TABLE IF EXISTS `bastet_p_balance_segs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bastet_p_balance_segs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `seg_set_identifier` varchar(32) NOT NULL,
  `segment_identifier` varchar(32) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `lower_bound` decimal(19,4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bastet_p_balance_segs_uq` (`product_id`,`seg_set_identifier`,`segment_identifier`),
  CONSTRAINT `bastet_p_balance_segs_fk` FOREIGN KEY (`product_id`) REFERENCES `bastet_products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bastet_p_balance_segs`
--

LOCK TABLES `bastet_p_balance_segs` WRITE;
/*!40000 ALTER TABLE `bastet_p_balance_segs` DISABLE KEYS */;
/*!40000 ALTER TABLE `bastet_p_balance_segs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bastet_p_chrg_defs`
--

DROP TABLE IF EXISTS `bastet_p_chrg_defs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bastet_p_chrg_defs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(32) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `a_name` varchar(256) NOT NULL,
  `description` varchar(4096) NOT NULL,
  `accrue_action` varchar(32) DEFAULT NULL,
  `charge_action` varchar(32) NOT NULL,
  `amount` decimal(19,4) NOT NULL,
  `charge_method` varchar(32) NOT NULL,
  `from_account_designator` varchar(32) NOT NULL,
  `accru_account_designator` varchar(32) DEFAULT NULL,
  `to_account_designator` varchar(32) NOT NULL,
  `for_cycle_size_unit` varchar(32) DEFAULT NULL,
  `proportional_to` varchar(32) DEFAULT NULL,
  `read_only` tinyint(1) DEFAULT NULL,
  `segment_set` varchar(32) DEFAULT NULL,
  `from_segment` varchar(32) DEFAULT NULL,
  `to_segment` varchar(32) DEFAULT NULL,
  `on_top` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bastet_p_chrg_def_uq` (`product_id`,`identifier`),
  CONSTRAINT `bastet_p_chrg_def_par_fk` FOREIGN KEY (`product_id`) REFERENCES `bastet_products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bastet_p_chrg_defs`
--

LOCK TABLES `bastet_p_chrg_defs` WRITE;
/*!40000 ALTER TABLE `bastet_p_chrg_defs` DISABLE KEYS */;
/*!40000 ALTER TABLE `bastet_p_chrg_defs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bastet_p_task_defs`
--

DROP TABLE IF EXISTS `bastet_p_task_defs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bastet_p_task_defs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(32) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `a_name` varchar(256) NOT NULL,
  `description` varchar(4096) NOT NULL,
  `actions` varchar(512) NOT NULL,
  `four_eyes` tinyint(1) NOT NULL,
  `mandatory` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bastet_p_task_def_uq` (`product_id`,`identifier`),
  CONSTRAINT `bastet_p_task_def_par_fk` FOREIGN KEY (`product_id`) REFERENCES `bastet_products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bastet_p_task_defs`
--

LOCK TABLES `bastet_p_task_defs` WRITE;
/*!40000 ALTER TABLE `bastet_p_task_defs` DISABLE KEYS */;
/*!40000 ALTER TABLE `bastet_p_task_defs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bastet_products`
--

DROP TABLE IF EXISTS `bastet_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bastet_products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(32) NOT NULL,
  `a_name` varchar(256) NOT NULL,
  `term_range_temporal_unit` varchar(128) NOT NULL,
  `term_range_minimum` int(11) NOT NULL,
  `term_range_maximum` int(11) NOT NULL,
  `balance_range_minimum` decimal(19,4) NOT NULL,
  `balance_range_maximum` decimal(19,4) NOT NULL,
  `interest_range_minimum` decimal(5,2) NOT NULL,
  `interest_range_maximum` decimal(5,2) NOT NULL,
  `interest_basis` varchar(128) NOT NULL,
  `pattern_package` varchar(512) NOT NULL,
  `description` varchar(4096) DEFAULT NULL,
  `parameters` varchar(8092) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `minor_currency_unit_digits` int(11) NOT NULL,
  `created_on` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `created_by` varchar(32) NOT NULL,
  `last_modified_on` timestamp(3) NULL DEFAULT NULL,
  `last_modified_by` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bastet_product_uq` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bastet_products`
--

LOCK TABLES `bastet_products` WRITE;
/*!40000 ALTER TABLE `bastet_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `bastet_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cheques_schema_version`
--

DROP TABLE IF EXISTS `cheques_schema_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cheques_schema_version` (
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
  KEY `cheques_schema_version_vr_idx` (`version_rank`),
  KEY `cheques_schema_version_ir_idx` (`installed_rank`),
  KEY `cheques_schema_version_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cheques_schema_version`
--

LOCK TABLES `cheques_schema_version` WRITE;
/*!40000 ALTER TABLE `cheques_schema_version` DISABLE KEYS */;
INSERT INTO `cheques_schema_version` VALUES (1,1,'0','<< Flyway Baseline >>','BASELINE','<< Flyway Baseline >>',NULL,'root','2018-01-22 17:08:54',0,1),(2,2,'1','initial setup','SQL','V1__initial_setup.sql',396026721,'root','2018-01-22 17:08:54',83,1);
/*!40000 ALTER TABLE `cheques_schema_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_schema_version`
--

DROP TABLE IF EXISTS `customer_schema_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_schema_version` (
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
  KEY `customer_schema_version_vr_idx` (`version_rank`),
  KEY `customer_schema_version_ir_idx` (`installed_rank`),
  KEY `customer_schema_version_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_schema_version`
--

LOCK TABLES `customer_schema_version` WRITE;
/*!40000 ALTER TABLE `customer_schema_version` DISABLE KEYS */;
INSERT INTO `customer_schema_version` VALUES (1,1,'0','<< Flyway Baseline >>','BASELINE','<< Flyway Baseline >>',NULL,'root','2018-01-22 17:07:40',0,1),(2,2,'1','initial setup','SQL','V1__initial_setup.sql',-850572029,'root','2018-01-22 17:07:40',478,1),(3,3,'2','customer portrait','SQL','V2__customer_portrait.sql',2115517164,'root','2018-01-22 17:07:41',325,1),(4,4,'3','added is member flag','SQL','V3__added_is_member_flag.sql',-744420743,'root','2018-01-22 17:07:41',192,1),(5,5,'4','identification card scans','SQL','V4__identification_card_scans.sql',-186873324,'root','2018-01-22 17:07:41',46,1),(6,6,'5','add payroll distributions','SQL','V5__add_payroll_distributions.sql',34672921,'root','2018-01-22 17:07:41',92,1),(7,7,'6','drop pyroll distributions','SQL','V6__drop_pyroll_distributions.sql',-102263270,'root','2018-01-22 17:07:41',51,1),(8,8,'7','documents','SQL','V7__documents.sql',1629890747,'root','2018-01-22 17:07:42',940,1),(9,9,'8','documents description','SQL','V8__documents_description.sql',-247823693,'root','2018-01-22 17:07:42',85,1),(10,10,'9','add application date to customer','SQL','V9__add_application_date_to_customer.sql',-976816274,'root','2018-01-22 17:07:43',81,1);
/*!40000 ALTER TABLE `customer_schema_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposit_schema_version`
--

DROP TABLE IF EXISTS `deposit_schema_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposit_schema_version` (
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
  KEY `deposit_schema_version_vr_idx` (`version_rank`),
  KEY `deposit_schema_version_ir_idx` (`installed_rank`),
  KEY `deposit_schema_version_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposit_schema_version`
--

LOCK TABLES `deposit_schema_version` WRITE;
/*!40000 ALTER TABLE `deposit_schema_version` DISABLE KEYS */;
INSERT INTO `deposit_schema_version` VALUES (1,1,'0','<< Flyway Baseline >>','BASELINE','<< Flyway Baseline >>',NULL,'root','2018-01-22 17:08:04',0,1),(2,2,'1','initial setup','SQL','V1__initial_setup.sql',-1089780825,'root','2018-01-22 17:08:05',400,1),(3,3,'2','modify product instances','SQL','V2__modify_product_instances.sql',-1698736857,'root','2018-01-22 17:08:05',144,1),(4,4,'3','term nullable','SQL','V3__term_nullable.sql',-531260223,'root','2018-01-22 17:08:05',153,1),(5,5,'4','add unique constraint charges','SQL','V4__add_unique_constraint_charges.sql',2068611453,'root','2018-01-22 17:08:05',46,1),(6,6,'5','interest calculation','SQL','V5__interest_calculation.sql',636879506,'root','2018-01-22 17:08:06',282,1),(7,7,'6','add opened on last transaction to instance','SQL','V6__add_opened_on_last_transaction_to_instance.sql',634566294,'root','2018-01-22 17:08:06',136,1);
/*!40000 ALTER TABLE `deposit_schema_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horus_addresses`
--

DROP TABLE IF EXISTS `horus_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horus_addresses` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `office_id` bigint(20) NOT NULL,
  `street` varchar(256) NOT NULL,
  `city` varchar(256) NOT NULL,
  `region` varchar(256) DEFAULT NULL,
  `postal_code` varchar(32) DEFAULT NULL,
  `country_code` varchar(2) NOT NULL,
  `country` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `address_office_fk` (`office_id`),
  CONSTRAINT `address_office_fk` FOREIGN KEY (`office_id`) REFERENCES `horus_offices` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horus_addresses`
--

LOCK TABLES `horus_addresses` WRITE;
/*!40000 ALTER TABLE `horus_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `horus_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horus_contact_details`
--

DROP TABLE IF EXISTS `horus_contact_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horus_contact_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) NOT NULL,
  `a_type` varchar(256) NOT NULL,
  `a_group` varchar(256) NOT NULL,
  `a_value` varchar(256) NOT NULL,
  `preference_level` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_detail_employee_fk` (`employee_id`),
  CONSTRAINT `contact_detail_employee_fk` FOREIGN KEY (`employee_id`) REFERENCES `horus_employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horus_contact_details`
--

LOCK TABLES `horus_contact_details` WRITE;
/*!40000 ALTER TABLE `horus_contact_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `horus_contact_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horus_employees`
--

DROP TABLE IF EXISTS `horus_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horus_employees` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(32) NOT NULL,
  `given_name` varchar(256) DEFAULT NULL,
  `middle_name` varchar(256) DEFAULT NULL,
  `surname` varchar(256) DEFAULT NULL,
  `assigned_office_id` bigint(20) DEFAULT NULL,
  `created_by` varchar(32) NOT NULL,
  `created_on` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `last_modified_by` varchar(32) DEFAULT NULL,
  `last_modified_on` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_identifier_uq` (`identifier`),
  KEY `employee_office_fk` (`assigned_office_id`),
  CONSTRAINT `employee_office_fk` FOREIGN KEY (`assigned_office_id`) REFERENCES `horus_offices` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horus_employees`
--

LOCK TABLES `horus_employees` WRITE;
/*!40000 ALTER TABLE `horus_employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `horus_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horus_external_references`
--

DROP TABLE IF EXISTS `horus_external_references`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horus_external_references` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `office_identifier` varchar(32) NOT NULL,
  `a_type` varchar(32) DEFAULT NULL,
  `a_state` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `external_references_uq` (`office_identifier`,`a_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horus_external_references`
--

LOCK TABLES `horus_external_references` WRITE;
/*!40000 ALTER TABLE `horus_external_references` DISABLE KEYS */;
/*!40000 ALTER TABLE `horus_external_references` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horus_offices`
--

DROP TABLE IF EXISTS `horus_offices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horus_offices` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_office_id` bigint(20) DEFAULT NULL,
  `identifier` varchar(32) NOT NULL,
  `a_name` varchar(256) NOT NULL,
  `description` varchar(2048) DEFAULT NULL,
  `created_by` varchar(32) NOT NULL,
  `created_on` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `last_modified_by` varchar(32) DEFAULT NULL,
  `last_modified_on` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `office_identifier_uq` (`identifier`),
  KEY `office_parent_fk` (`parent_office_id`),
  CONSTRAINT `office_parent_fk` FOREIGN KEY (`parent_office_id`) REFERENCES `horus_offices` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horus_offices`
--

LOCK TABLES `horus_offices` WRITE;
/*!40000 ALTER TABLE `horus_offices` DISABLE KEYS */;
/*!40000 ALTER TABLE `horus_offices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maat_addresses`
--

DROP TABLE IF EXISTS `maat_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maat_addresses` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `street` varchar(256) NOT NULL,
  `city` varchar(256) NOT NULL,
  `postal_code` varchar(32) DEFAULT NULL,
  `region` varchar(256) DEFAULT NULL,
  `country_code` varchar(2) NOT NULL,
  `country` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maat_addresses`
--

LOCK TABLES `maat_addresses` WRITE;
/*!40000 ALTER TABLE `maat_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `maat_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maat_commands`
--

DROP TABLE IF EXISTS `maat_commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maat_commands` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NOT NULL,
  `a_type` varchar(32) NOT NULL,
  `a_comment` varchar(32) DEFAULT NULL,
  `created_by` varchar(32) NOT NULL,
  `created_on` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `maat_commands_customers_fk` (`customer_id`),
  CONSTRAINT `maat_commands_customers_fk` FOREIGN KEY (`customer_id`) REFERENCES `maat_customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maat_commands`
--

LOCK TABLES `maat_commands` WRITE;
/*!40000 ALTER TABLE `maat_commands` DISABLE KEYS */;
/*!40000 ALTER TABLE `maat_commands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maat_contact_details`
--

DROP TABLE IF EXISTS `maat_contact_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maat_contact_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NOT NULL,
  `a_type` varchar(32) NOT NULL,
  `a_group` varchar(256) NOT NULL,
  `a_value` varchar(32) NOT NULL,
  `preference_level` tinyint(4) DEFAULT NULL,
  `validated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `maat_contact_details_cust_fk` (`customer_id`),
  CONSTRAINT `maat_contact_details_cust_fk` FOREIGN KEY (`customer_id`) REFERENCES `maat_customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maat_contact_details`
--

LOCK TABLES `maat_contact_details` WRITE;
/*!40000 ALTER TABLE `maat_contact_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `maat_contact_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maat_customers`
--

DROP TABLE IF EXISTS `maat_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maat_customers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(32) NOT NULL,
  `a_type` varchar(32) NOT NULL,
  `given_name` varchar(256) NOT NULL,
  `middle_name` varchar(256) DEFAULT NULL,
  `surname` varchar(256) NOT NULL,
  `date_of_birth` date NOT NULL,
  `account_beneficiary` varchar(512) DEFAULT NULL,
  `reference_customer` varchar(32) DEFAULT NULL,
  `assigned_office` varchar(32) DEFAULT NULL,
  `assigned_employee` varchar(32) DEFAULT NULL,
  `current_state` varchar(32) NOT NULL,
  `address_id` bigint(20) NOT NULL,
  `created_by` varchar(32) DEFAULT NULL,
  `created_on` timestamp(3) NULL DEFAULT NULL,
  `last_modified_by` varchar(32) DEFAULT NULL,
  `last_modified_on` timestamp(3) NULL DEFAULT NULL,
  `is_member` tinyint(1) NOT NULL,
  `application_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `maat_customer_identifier_uq` (`identifier`),
  KEY `maat_customers_addresses_fk` (`address_id`),
  CONSTRAINT `maat_customers_addresses_fk` FOREIGN KEY (`address_id`) REFERENCES `maat_addresses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maat_customers`
--

LOCK TABLES `maat_customers` WRITE;
/*!40000 ALTER TABLE `maat_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `maat_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maat_document_pages`
--

DROP TABLE IF EXISTS `maat_document_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maat_document_pages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `document_id` bigint(20) NOT NULL,
  `page_number` int(11) NOT NULL,
  `content_type` varchar(256) NOT NULL,
  `size` bigint(20) NOT NULL,
  `image` mediumblob NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `maat_document_pages_uq` (`document_id`,`page_number`),
  CONSTRAINT `maat_document_pages_fk` FOREIGN KEY (`document_id`) REFERENCES `maat_documents` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maat_document_pages`
--

LOCK TABLES `maat_document_pages` WRITE;
/*!40000 ALTER TABLE `maat_document_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `maat_document_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maat_documents`
--

DROP TABLE IF EXISTS `maat_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maat_documents` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NOT NULL,
  `identifier` varchar(32) NOT NULL,
  `is_completed` tinyint(1) NOT NULL,
  `created_on` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `created_by` varchar(32) NOT NULL,
  `description` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `maat_documents_uq` (`customer_id`,`identifier`),
  CONSTRAINT `maat_documents_fk` FOREIGN KEY (`customer_id`) REFERENCES `maat_customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maat_documents`
--

LOCK TABLES `maat_documents` WRITE;
/*!40000 ALTER TABLE `maat_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `maat_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maat_identification_card_scans`
--

DROP TABLE IF EXISTS `maat_identification_card_scans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maat_identification_card_scans` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(32) NOT NULL,
  `description` varchar(4096) NOT NULL,
  `identification_card_id` bigint(20) NOT NULL,
  `content_type` varchar(256) NOT NULL,
  `size` bigint(20) NOT NULL,
  `image` mediumblob NOT NULL,
  `created_on` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `created_by` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `maat_ident_card_scans_ident_uq` (`identifier`,`identification_card_id`),
  KEY `maat_ident_card_scans_fk` (`identification_card_id`),
  CONSTRAINT `maat_ident_card_scans_fk` FOREIGN KEY (`identification_card_id`) REFERENCES `maat_identification_cards` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maat_identification_card_scans`
--

LOCK TABLES `maat_identification_card_scans` WRITE;
/*!40000 ALTER TABLE `maat_identification_card_scans` DISABLE KEYS */;
/*!40000 ALTER TABLE `maat_identification_card_scans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maat_identification_cards`
--

DROP TABLE IF EXISTS `maat_identification_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maat_identification_cards` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `a_type` varchar(128) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `a_number` varchar(32) NOT NULL,
  `expiration_date` date NOT NULL,
  `issuer` varchar(256) DEFAULT NULL,
  `created_by` varchar(32) DEFAULT NULL,
  `created_on` timestamp(3) NULL DEFAULT NULL,
  `last_modified_by` varchar(32) DEFAULT NULL,
  `last_modified_on` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `maat_id_cards_customers_fk` (`customer_id`),
  CONSTRAINT `maat_id_cards_customers_fk` FOREIGN KEY (`customer_id`) REFERENCES `maat_customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maat_identification_cards`
--

LOCK TABLES `maat_identification_cards` WRITE;
/*!40000 ALTER TABLE `maat_identification_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `maat_identification_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maat_portraits`
--

DROP TABLE IF EXISTS `maat_portraits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maat_portraits` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NOT NULL,
  `content_type` varchar(256) NOT NULL,
  `size` bigint(20) NOT NULL,
  `image` mediumblob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `maat_id_portraits_customers_fk` (`customer_id`),
  CONSTRAINT `maat_id_portraits_customers_fk` FOREIGN KEY (`customer_id`) REFERENCES `maat_customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maat_portraits`
--

LOCK TABLES `maat_portraits` WRITE;
/*!40000 ALTER TABLE `maat_portraits` DISABLE KEYS */;
/*!40000 ALTER TABLE `maat_portraits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maat_task_definitions`
--

DROP TABLE IF EXISTS `maat_task_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maat_task_definitions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(32) NOT NULL,
  `a_type` varchar(32) NOT NULL,
  `a_name` varchar(256) NOT NULL,
  `description` varchar(4096) DEFAULT NULL,
  `assigned_commands` varchar(512) NOT NULL,
  `mandatory` tinyint(1) DEFAULT NULL,
  `predefined` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `maat_task_def_identifier_uq` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maat_task_definitions`
--

LOCK TABLES `maat_task_definitions` WRITE;
/*!40000 ALTER TABLE `maat_task_definitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `maat_task_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maat_task_instances`
--

DROP TABLE IF EXISTS `maat_task_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maat_task_instances` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `task_definition_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `a_comment` varchar(4096) DEFAULT NULL,
  `executed_on` timestamp(3) NULL DEFAULT NULL,
  `executed_by` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `maat_task_instances_def_fk` (`task_definition_id`),
  KEY `maat_task_instances_cust_fk` (`customer_id`),
  CONSTRAINT `maat_task_instances_cust_fk` FOREIGN KEY (`customer_id`) REFERENCES `maat_customers` (`id`),
  CONSTRAINT `maat_task_instances_def_fk` FOREIGN KEY (`task_definition_id`) REFERENCES `maat_task_definitions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maat_task_instances`
--

LOCK TABLES `maat_task_instances` WRITE;
/*!40000 ALTER TABLE `maat_task_instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `maat_task_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meketre_payroll_allocations`
--

DROP TABLE IF EXISTS `meketre_payroll_allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meketre_payroll_allocations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `payroll_configuration_id` bigint(20) NOT NULL,
  `account_number` varchar(34) NOT NULL,
  `amount` decimal(15,5) NOT NULL,
  `proportional` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `meketre_payroll_alloc_acct_uq` (`payroll_configuration_id`,`account_number`),
  CONSTRAINT `meketre_payroll_alloc_config_fk` FOREIGN KEY (`payroll_configuration_id`) REFERENCES `meketre_payroll_configurations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meketre_payroll_allocations`
--

LOCK TABLES `meketre_payroll_allocations` WRITE;
/*!40000 ALTER TABLE `meketre_payroll_allocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `meketre_payroll_allocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meketre_payroll_collections`
--

DROP TABLE IF EXISTS `meketre_payroll_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meketre_payroll_collections` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(32) NOT NULL,
  `source_account_number` varchar(34) NOT NULL,
  `created_by` varchar(32) NOT NULL,
  `created_on` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `meketre_pay_col_identifier_uq` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meketre_payroll_collections`
--

LOCK TABLES `meketre_payroll_collections` WRITE;
/*!40000 ALTER TABLE `meketre_payroll_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `meketre_payroll_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meketre_payroll_configurations`
--

DROP TABLE IF EXISTS `meketre_payroll_configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meketre_payroll_configurations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_identifier` varchar(32) NOT NULL,
  `main_account_number` varchar(34) NOT NULL,
  `created_by` varchar(32) NOT NULL,
  `created_on` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `last_modified_by` varchar(32) DEFAULT NULL,
  `last_modified_on` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `meketre_payroll_config_acct_uq` (`customer_identifier`,`main_account_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meketre_payroll_configurations`
--

LOCK TABLES `meketre_payroll_configurations` WRITE;
/*!40000 ALTER TABLE `meketre_payroll_configurations` DISABLE KEYS */;
/*!40000 ALTER TABLE `meketre_payroll_configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meketre_payroll_payments`
--

DROP TABLE IF EXISTS `meketre_payroll_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meketre_payroll_payments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `payroll_collection_id` bigint(20) NOT NULL,
  `customer_identifier` varchar(32) NOT NULL,
  `employer` varchar(256) NOT NULL,
  `salary` decimal(15,5) NOT NULL,
  `processed` tinyint(1) NOT NULL,
  `message` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meketre_payroll_pay_coll_fk` (`payroll_collection_id`),
  CONSTRAINT `meketre_payroll_pay_coll_fk` FOREIGN KEY (`payroll_collection_id`) REFERENCES `meketre_payroll_collections` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meketre_payroll_payments`
--

LOCK TABLES `meketre_payroll_payments` WRITE;
/*!40000 ALTER TABLE `meketre_payroll_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `meketre_payroll_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nun_catalogs`
--

DROP TABLE IF EXISTS `nun_catalogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nun_catalogs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(32) NOT NULL,
  `a_name` varchar(256) NOT NULL,
  `description` varchar(4096) DEFAULT NULL,
  `created_by` varchar(32) DEFAULT NULL,
  `created_on` timestamp(3) NULL DEFAULT NULL,
  `last_modified_by` varchar(32) DEFAULT NULL,
  `last_modified_on` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nun_catalogs_identifier_uq` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nun_catalogs`
--

LOCK TABLES `nun_catalogs` WRITE;
/*!40000 ALTER TABLE `nun_catalogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `nun_catalogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nun_field_values`
--

DROP TABLE IF EXISTS `nun_field_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nun_field_values` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_id` bigint(20) NOT NULL,
  `field_id` bigint(20) NOT NULL,
  `a_value` varchar(4096) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nun_field_values_uq` (`entity_id`,`field_id`),
  KEY `nun_field_values_fields_fk` (`field_id`),
  CONSTRAINT `nun_field_values_entities_fk` FOREIGN KEY (`entity_id`) REFERENCES `maat_customers` (`id`),
  CONSTRAINT `nun_field_values_fields_fk` FOREIGN KEY (`field_id`) REFERENCES `nun_fields` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nun_field_values`
--

LOCK TABLES `nun_field_values` WRITE;
/*!40000 ALTER TABLE `nun_field_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `nun_field_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nun_fields`
--

DROP TABLE IF EXISTS `nun_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nun_fields` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `catalog_id` bigint(20) NOT NULL,
  `identifier` varchar(32) NOT NULL,
  `data_type` varchar(256) NOT NULL,
  `a_label` varchar(256) NOT NULL,
  `a_hint` varchar(512) DEFAULT NULL,
  `description` varchar(4096) DEFAULT NULL,
  `mandatory` tinyint(1) DEFAULT NULL,
  `a_length` bigint(20) DEFAULT NULL,
  `a_precision` bigint(20) DEFAULT NULL,
  `min_value` bigint(20) DEFAULT NULL,
  `max_value` bigint(20) DEFAULT NULL,
  `created_by` varchar(32) DEFAULT NULL,
  `created_on` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nun_fields_uq` (`catalog_id`,`identifier`),
  CONSTRAINT `nun_fields_catalogs_fk` FOREIGN KEY (`catalog_id`) REFERENCES `nun_catalogs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nun_fields`
--

LOCK TABLES `nun_fields` WRITE;
/*!40000 ALTER TABLE `nun_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `nun_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nun_options`
--

DROP TABLE IF EXISTS `nun_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nun_options` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `field_id` bigint(20) NOT NULL,
  `a_label` varchar(256) NOT NULL,
  `a_value` bigint(20) NOT NULL,
  `created_by` varchar(32) DEFAULT NULL,
  `created_on` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nun_options_uq` (`field_id`,`a_label`),
  CONSTRAINT `nun_options_fields_fk` FOREIGN KEY (`field_id`) REFERENCES `nun_fields` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nun_options`
--

LOCK TABLES `nun_options` WRITE;
/*!40000 ALTER TABLE `nun_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `nun_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_schema_version`
--

DROP TABLE IF EXISTS `office_schema_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office_schema_version` (
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
  KEY `office_schema_version_vr_idx` (`version_rank`),
  KEY `office_schema_version_ir_idx` (`installed_rank`),
  KEY `office_schema_version_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_schema_version`
--

LOCK TABLES `office_schema_version` WRITE;
/*!40000 ALTER TABLE `office_schema_version` DISABLE KEYS */;
INSERT INTO `office_schema_version` VALUES (1,1,'1','initial setup','SQL','V1__initial_setup.sql',-1667356718,'root','2018-01-22 17:05:36',208,1),(2,2,'2','add external references','SQL','V2__add_external_references.sql',-552627411,'root','2018-01-22 17:05:36',40,1);
/*!40000 ALTER TABLE `office_schema_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll_schema_version`
--

DROP TABLE IF EXISTS `payroll_schema_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payroll_schema_version` (
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
  KEY `payroll_schema_version_vr_idx` (`version_rank`),
  KEY `payroll_schema_version_ir_idx` (`installed_rank`),
  KEY `payroll_schema_version_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll_schema_version`
--

LOCK TABLES `payroll_schema_version` WRITE;
/*!40000 ALTER TABLE `payroll_schema_version` DISABLE KEYS */;
INSERT INTO `payroll_schema_version` VALUES (1,1,'0','<< Flyway Baseline >>','BASELINE','<< Flyway Baseline >>',NULL,'root','2018-01-22 17:09:11',0,1),(2,2,'1','initial setup','SQL','V1__initial_setup.sql',-462828734,'root','2018-01-22 17:09:11',175,1),(3,3,'2','add distribution processing behavior','SQL','V2__add_distribution_processing_behavior.sql',1858067784,'root','2018-01-22 17:09:11',182,1);
/*!40000 ALTER TABLE `payroll_schema_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_schema_version`
--

DROP TABLE IF EXISTS `portfolio_schema_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portfolio_schema_version` (
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
  KEY `portfolio_schema_version_vr_idx` (`version_rank`),
  KEY `portfolio_schema_version_ir_idx` (`installed_rank`),
  KEY `portfolio_schema_version_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_schema_version`
--

LOCK TABLES `portfolio_schema_version` WRITE;
/*!40000 ALTER TABLE `portfolio_schema_version` DISABLE KEYS */;
INSERT INTO `portfolio_schema_version` VALUES (1,1,'0','<< Flyway Baseline >>','BASELINE','<< Flyway Baseline >>',NULL,'root','2018-01-22 17:06:52',0,1),(2,2,'1','initial setup','SQL','V1__initial_setup.sql',1592358278,'root','2018-01-22 17:06:52',376,1),(11,11,'10','arrears determination2','SQL','V10__arrears_determination2.sql',1134865268,'root','2018-01-22 17:06:53',41,1),(12,12,'11','case documents','SQL','V11__case_documents.sql',1066618199,'root','2018-01-22 17:06:53',39,1),(3,3,'2','in motion','SQL','V2__in_motion.sql',315521872,'root','2018-01-22 17:06:52',81,1),(4,4,'3','task instances','SQL','V3__task_instances.sql',1559096820,'root','2018-01-22 17:06:52',48,1),(5,5,'4','fixing in motion migration','SQL','V4__fixing_in_motion_migration.sql',1534851168,'root','2018-01-22 17:06:53',71,1),(6,6,'5','readonly charges','SQL','V5__readonly_charges.sql',1474977046,'root','2018-01-22 17:06:53',67,1),(7,7,'6','interest and charges','SQL','V6__interest_and_charges.sql',1341125648,'root','2018-01-22 17:06:53',74,1),(8,8,'7','balance segment sets','SQL','V7__balance_segment_sets.sql',-690947313,'root','2018-01-22 17:06:53',281,1),(9,9,'8','late payment determination','SQL','V8__late_payment_determination.sql',1486751090,'root','2018-01-22 17:06:53',132,1),(10,10,'9','arrears determination','SQL','V9__arrears_determination.sql',1404499759,'root','2018-01-22 17:06:53',80,1);
/*!40000 ALTER TABLE `portfolio_schema_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shed_accrued_interests`
--

DROP TABLE IF EXISTS `shed_accrued_interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shed_accrued_interests` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accrue_account_identifier` varchar(34) NOT NULL,
  `customer_account_identifier` varchar(34) NOT NULL,
  `amount` decimal(15,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shed_accrued_interests_uq` (`accrue_account_identifier`,`customer_account_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shed_accrued_interests`
--

LOCK TABLES `shed_accrued_interests` WRITE;
/*!40000 ALTER TABLE `shed_accrued_interests` DISABLE KEYS */;
/*!40000 ALTER TABLE `shed_accrued_interests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shed_actions`
--

DROP TABLE IF EXISTS `shed_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shed_actions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(32) NOT NULL,
  `a_name` varchar(256) NOT NULL,
  `description` varchar(2048) DEFAULT NULL,
  `transaction_type` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shed_actions_identifier_uq` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shed_actions`
--

LOCK TABLES `shed_actions` WRITE;
/*!40000 ALTER TABLE `shed_actions` DISABLE KEYS */;
INSERT INTO `shed_actions` VALUES (1,'Open','Account Opening',NULL,'ACCO'),(2,'Transfer','Account Transfer',NULL,'ACCT'),(3,'Close','Account Closing',NULL,'ACCC'),(4,'Deposit','Cash Deposit',NULL,'CDPT'),(5,'Withdraw','Cash Withdrawal',NULL,'CWDL');
/*!40000 ALTER TABLE `shed_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shed_charges`
--

DROP TABLE IF EXISTS `shed_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shed_charges` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action_id` bigint(20) NOT NULL,
  `product_definition_id` bigint(20) NOT NULL,
  `income_account_identifier` varchar(32) NOT NULL,
  `a_name` varchar(256) NOT NULL,
  `description` varchar(2048) DEFAULT NULL,
  `proportional` tinyint(1) NOT NULL,
  `amount` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shed_charges_uq` (`product_definition_id`,`a_name`),
  KEY `shed_charges_actions_fk` (`action_id`),
  CONSTRAINT `shed_charges_actions_fk` FOREIGN KEY (`action_id`) REFERENCES `shed_actions` (`id`),
  CONSTRAINT `shed_charges_prod_def_fk` FOREIGN KEY (`product_definition_id`) REFERENCES `shed_product_definitions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shed_charges`
--

LOCK TABLES `shed_charges` WRITE;
/*!40000 ALTER TABLE `shed_charges` DISABLE KEYS */;
/*!40000 ALTER TABLE `shed_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shed_commands`
--

DROP TABLE IF EXISTS `shed_commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shed_commands` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_definition_id` bigint(20) NOT NULL,
  `a_action` varchar(256) NOT NULL,
  `note` varchar(2048) DEFAULT NULL,
  `created_on` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `created_by` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shed_commands_prod_def_fk` (`product_definition_id`),
  CONSTRAINT `shed_commands_prod_def_fk` FOREIGN KEY (`product_definition_id`) REFERENCES `shed_product_definitions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shed_commands`
--

LOCK TABLES `shed_commands` WRITE;
/*!40000 ALTER TABLE `shed_commands` DISABLE KEYS */;
/*!40000 ALTER TABLE `shed_commands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shed_currencies`
--

DROP TABLE IF EXISTS `shed_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shed_currencies` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_definition_id` bigint(20) NOT NULL,
  `a_code` varchar(4) NOT NULL,
  `a_name` varchar(256) NOT NULL,
  `sign` varchar(4) NOT NULL,
  `scale` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shed_currencies_prod_def_fk` (`product_definition_id`),
  CONSTRAINT `shed_currencies_prod_def_fk` FOREIGN KEY (`product_definition_id`) REFERENCES `shed_product_definitions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shed_currencies`
--

LOCK TABLES `shed_currencies` WRITE;
/*!40000 ALTER TABLE `shed_currencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `shed_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shed_dividend_distributions`
--

DROP TABLE IF EXISTS `shed_dividend_distributions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shed_dividend_distributions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_definition_id` bigint(20) NOT NULL,
  `due_date` date NOT NULL,
  `rate` decimal(15,5) NOT NULL,
  `created_on` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `created_by` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shed_div_dist_prod_def_fk` (`product_definition_id`),
  CONSTRAINT `shed_div_dist_prod_def_fk` FOREIGN KEY (`product_definition_id`) REFERENCES `shed_product_definitions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shed_dividend_distributions`
--

LOCK TABLES `shed_dividend_distributions` WRITE;
/*!40000 ALTER TABLE `shed_dividend_distributions` DISABLE KEYS */;
/*!40000 ALTER TABLE `shed_dividend_distributions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shed_product_definitions`
--

DROP TABLE IF EXISTS `shed_product_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shed_product_definitions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `a_type` varchar(32) NOT NULL,
  `identifier` varchar(32) NOT NULL,
  `a_name` varchar(256) NOT NULL,
  `description` varchar(2048) DEFAULT NULL,
  `minimum_balance` decimal(15,5) DEFAULT NULL,
  `equity_ledger_identifier` varchar(34) NOT NULL,
  `expense_account_identifier` varchar(34) NOT NULL,
  `interest` decimal(5,2) DEFAULT NULL,
  `is_flexible` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_on` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `created_by` varchar(32) NOT NULL,
  `last_modified_on` timestamp(3) NULL DEFAULT NULL,
  `last_modified_by` varchar(32) DEFAULT NULL,
  `cash_account_identifier` varchar(34) DEFAULT NULL,
  `accrue_account_identifier` varchar(34) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shed_prod_def_identifier_uq` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shed_product_definitions`
--

LOCK TABLES `shed_product_definitions` WRITE;
/*!40000 ALTER TABLE `shed_product_definitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `shed_product_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shed_product_instances`
--

DROP TABLE IF EXISTS `shed_product_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shed_product_instances` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_identifier` varchar(32) NOT NULL,
  `product_definition_id` bigint(20) NOT NULL,
  `account_identifier` varchar(34) NOT NULL,
  `a_state` varchar(32) NOT NULL,
  `created_on` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `created_by` varchar(32) NOT NULL,
  `last_modified_on` timestamp(3) NULL DEFAULT NULL,
  `last_modified_by` varchar(32) DEFAULT NULL,
  `beneficiaries` varchar(256) DEFAULT NULL,
  `opened_on` date DEFAULT NULL,
  `last_transaction_date` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shed_prod_inst_identifier_uq` (`account_identifier`),
  KEY `shed_prod_inst_prod_def_fk` (`product_definition_id`),
  CONSTRAINT `shed_prod_inst_prod_def_fk` FOREIGN KEY (`product_definition_id`) REFERENCES `shed_product_definitions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shed_product_instances`
--

LOCK TABLES `shed_product_instances` WRITE;
/*!40000 ALTER TABLE `shed_product_instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `shed_product_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shed_terms`
--

DROP TABLE IF EXISTS `shed_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shed_terms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_definition_id` bigint(20) NOT NULL,
  `period` int(5) DEFAULT NULL,
  `time_unit` varchar(32) DEFAULT NULL,
  `interest_payable` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shed_terms_prod_def_fk` (`product_definition_id`),
  CONSTRAINT `shed_terms_prod_def_fk` FOREIGN KEY (`product_definition_id`) REFERENCES `shed_product_definitions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shed_terms`
--

LOCK TABLES `shed_terms` WRITE;
/*!40000 ALTER TABLE `shed_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `shed_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sopdet_cheques`
--

DROP TABLE IF EXISTS `sopdet_cheques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sopdet_cheques` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cheque_number` varchar(8) NOT NULL,
  `branch_sort_code` varchar(11) NOT NULL,
  `account_number` varchar(34) NOT NULL,
  `drawee` varchar(2048) NOT NULL,
  `drawer` varchar(256) NOT NULL,
  `payee` varchar(256) NOT NULL,
  `amount` decimal(15,5) NOT NULL,
  `date_issued` date NOT NULL,
  `open_cheque` tinyint(1) DEFAULT NULL,
  `state` varchar(32) NOT NULL,
  `journal_entry_identifier` varchar(2200) NOT NULL,
  `created_on` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `created_by` varchar(32) NOT NULL,
  `last_modified_on` timestamp(3) NULL DEFAULT NULL,
  `last_modified_by` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sopdet_cheques_uq` (`cheque_number`,`branch_sort_code`,`account_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sopdet_cheques`
--

LOCK TABLES `sopdet_cheques` WRITE;
/*!40000 ALTER TABLE `sopdet_cheques` DISABLE KEYS */;
/*!40000 ALTER TABLE `sopdet_cheques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sopdet_issued_cheques`
--

DROP TABLE IF EXISTS `sopdet_issued_cheques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sopdet_issued_cheques` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_identifier` varchar(34) NOT NULL,
  `last_issued_number` decimal(8,0) NOT NULL,
  `created_on` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `created_by` varchar(32) NOT NULL,
  `last_modified_on` timestamp(3) NULL DEFAULT NULL,
  `last_modified_by` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sopdet_issued_cheques_uq` (`account_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sopdet_issued_cheques`
--

LOCK TABLES `sopdet_issued_cheques` WRITE;
/*!40000 ALTER TABLE `sopdet_issued_cheques` DISABLE KEYS */;
/*!40000 ALTER TABLE `sopdet_issued_cheques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tajet_cheques`
--

DROP TABLE IF EXISTS `tajet_cheques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tajet_cheques` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `teller_transaction_id` bigint(20) NOT NULL,
  `cheque_number` varchar(8) NOT NULL,
  `branch_sort_code` varchar(11) NOT NULL,
  `account_number` varchar(34) NOT NULL,
  `drawee` varchar(2048) NOT NULL,
  `drawer` varchar(256) NOT NULL,
  `payee` varchar(256) NOT NULL,
  `amount` decimal(15,5) NOT NULL,
  `date_issued` date NOT NULL,
  `open_cheque` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tajet_cheques_uq` (`cheque_number`,`branch_sort_code`,`account_number`),
  KEY `tajet_cheques_teller_tx_fk` (`teller_transaction_id`),
  CONSTRAINT `tajet_cheques_teller_tx_fk` FOREIGN KEY (`teller_transaction_id`) REFERENCES `tajet_teller_transactions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tajet_cheques`
--

LOCK TABLES `tajet_cheques` WRITE;
/*!40000 ALTER TABLE `tajet_cheques` DISABLE KEYS */;
/*!40000 ALTER TABLE `tajet_cheques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tajet_teller`
--

DROP TABLE IF EXISTS `tajet_teller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tajet_teller` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(32) NOT NULL,
  `a_password` varchar(4096) NOT NULL,
  `a_salt` varchar(4069) NOT NULL,
  `office_identifier` varchar(32) NOT NULL,
  `cashdraw_limit` decimal(15,5) NOT NULL,
  `teller_account_identifier` varchar(34) DEFAULT NULL,
  `vault_account_identifier` varchar(34) DEFAULT NULL,
  `assigned_employee_identifier` varchar(32) DEFAULT NULL,
  `a_state` varchar(256) NOT NULL,
  `created_on` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `created_by` varchar(32) NOT NULL,
  `last_modified_on` timestamp(3) NULL DEFAULT NULL,
  `last_modified_by` varchar(32) DEFAULT NULL,
  `cheques_receivable_account` varchar(34) DEFAULT NULL,
  `last_opened_by` varchar(32) DEFAULT NULL,
  `last_opened_on` timestamp(3) NULL DEFAULT NULL,
  `cash_over_short_account` varchar(34) DEFAULT NULL,
  `denomination_required` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tajet_teller_identifier_uq` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tajet_teller`
--

LOCK TABLES `tajet_teller` WRITE;
/*!40000 ALTER TABLE `tajet_teller` DISABLE KEYS */;
/*!40000 ALTER TABLE `tajet_teller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tajet_teller_denominations`
--

DROP TABLE IF EXISTS `tajet_teller_denominations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tajet_teller_denominations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `teller_id` bigint(20) NOT NULL,
  `counted_total` decimal(15,5) NOT NULL,
  `note` varchar(512) DEFAULT NULL,
  `adjusting_journal_entry` varchar(32) DEFAULT NULL,
  `created_on` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `created_by` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tajet_teller_denominations_fk` (`teller_id`),
  CONSTRAINT `tajet_teller_denominations_fk` FOREIGN KEY (`teller_id`) REFERENCES `tajet_teller` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tajet_teller_denominations`
--

LOCK TABLES `tajet_teller_denominations` WRITE;
/*!40000 ALTER TABLE `tajet_teller_denominations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tajet_teller_denominations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tajet_teller_transactions`
--

DROP TABLE IF EXISTS `tajet_teller_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tajet_teller_transactions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `teller_id` bigint(20) NOT NULL,
  `identifier` varchar(32) NOT NULL,
  `transaction_type` varchar(32) NOT NULL,
  `transaction_date` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `customer_identifier` varchar(32) NOT NULL,
  `product_identifier` varchar(32) NOT NULL,
  `product_case_identifier` varchar(32) DEFAULT NULL,
  `customer_account_identifier` varchar(34) DEFAULT NULL,
  `target_account_identifier` varchar(34) DEFAULT NULL,
  `clerk` varchar(32) NOT NULL,
  `amount` decimal(15,5) NOT NULL,
  `a_state` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tajet_teller_identifier_uq` (`identifier`),
  KEY `tajet_teller_transaction_fk` (`teller_id`),
  CONSTRAINT `tajet_teller_transaction_fk` FOREIGN KEY (`teller_id`) REFERENCES `tajet_teller` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tajet_teller_transactions`
--

LOCK TABLES `tajet_teller_transactions` WRITE;
/*!40000 ALTER TABLE `tajet_teller_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tajet_teller_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teller_schema_version`
--

DROP TABLE IF EXISTS `teller_schema_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teller_schema_version` (
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
  KEY `teller_schema_version_vr_idx` (`version_rank`),
  KEY `teller_schema_version_ir_idx` (`installed_rank`),
  KEY `teller_schema_version_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teller_schema_version`
--

LOCK TABLES `teller_schema_version` WRITE;
/*!40000 ALTER TABLE `teller_schema_version` DISABLE KEYS */;
INSERT INTO `teller_schema_version` VALUES (1,1,'0','<< Flyway Baseline >>','BASELINE','<< Flyway Baseline >>',NULL,'root','2018-01-22 17:08:22',0,1),(2,2,'1','initial setup','SQL','V1__initial_setup.sql',-1997783552,'root','2018-01-22 17:08:22',99,1),(3,3,'2','add cheques','SQL','V2__add_cheques.sql',123299570,'root','2018-01-22 17:08:22',53,1),(4,4,'3','add cheques receivable to teller','SQL','V3__add_cheques_receivable_to_teller.sql',1050234816,'root','2018-01-22 17:08:22',291,1),(5,5,'4','add last opened to teller','SQL','V4__add_last_opened_to_teller.sql',-362694869,'root','2018-01-22 17:08:22',135,1),(6,6,'5','add teller denomination','SQL','V5__add_teller_denomination.sql',-1036902582,'root','2018-01-22 17:08:23',164,1);
/*!40000 ALTER TABLE `teller_schema_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thoth_account_entries`
--

DROP TABLE IF EXISTS `thoth_account_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thoth_account_entries` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) DEFAULT NULL,
  `a_type` varchar(32) NOT NULL,
  `transaction_date` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `message` varchar(2048) DEFAULT NULL,
  `amount` decimal(15,5) NOT NULL,
  `balance` decimal(15,5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `thoth_account_entries_accounts_fk` (`account_id`),
  CONSTRAINT `thoth_account_entries_accounts_fk` FOREIGN KEY (`account_id`) REFERENCES `thoth_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thoth_account_entries`
--

LOCK TABLES `thoth_account_entries` WRITE;
/*!40000 ALTER TABLE `thoth_account_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `thoth_account_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thoth_accounts`
--

DROP TABLE IF EXISTS `thoth_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thoth_accounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `a_type` varchar(32) NOT NULL,
  `identifier` varchar(34) NOT NULL,
  `a_name` varchar(256) NOT NULL,
  `holders` varchar(256) DEFAULT NULL,
  `signature_authorities` varchar(256) DEFAULT NULL,
  `balance` decimal(15,5) NOT NULL,
  `reference_account_id` bigint(20) DEFAULT NULL,
  `ledger_id` bigint(20) NOT NULL,
  `a_state` varchar(32) NOT NULL,
  `created_on` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `created_by` varchar(32) NOT NULL,
  `last_modified_on` timestamp(3) NULL DEFAULT NULL,
  `last_modified_by` varchar(32) DEFAULT NULL,
  `alternative_account_number` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `thoth_accounts_identifier_uq` (`identifier`),
  UNIQUE KEY `thoth_alt_acct_no_uq` (`alternative_account_number`),
  KEY `thoth_reference_accounts_fk` (`reference_account_id`),
  KEY `thoth_accounts_ledgers_fk` (`ledger_id`),
  CONSTRAINT `thoth_accounts_ledgers_fk` FOREIGN KEY (`ledger_id`) REFERENCES `thoth_ledgers` (`id`),
  CONSTRAINT `thoth_reference_accounts_fk` FOREIGN KEY (`reference_account_id`) REFERENCES `thoth_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thoth_accounts`
--

LOCK TABLES `thoth_accounts` WRITE;
/*!40000 ALTER TABLE `thoth_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `thoth_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thoth_commands`
--

DROP TABLE IF EXISTS `thoth_commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thoth_commands` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) NOT NULL,
  `a_type` varchar(32) NOT NULL,
  `a_comment` varchar(32) DEFAULT NULL,
  `created_by` varchar(32) NOT NULL,
  `created_on` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `thoth_commands_accounts_fk` (`account_id`),
  CONSTRAINT `thoth_commands_accounts_fk` FOREIGN KEY (`account_id`) REFERENCES `thoth_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thoth_commands`
--

LOCK TABLES `thoth_commands` WRITE;
/*!40000 ALTER TABLE `thoth_commands` DISABLE KEYS */;
/*!40000 ALTER TABLE `thoth_commands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thoth_ledgers`
--

DROP TABLE IF EXISTS `thoth_ledgers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thoth_ledgers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `a_type` varchar(32) NOT NULL,
  `identifier` varchar(32) NOT NULL,
  `a_name` varchar(256) NOT NULL,
  `description` varchar(2048) DEFAULT NULL,
  `parent_ledger_id` bigint(20) DEFAULT NULL,
  `created_on` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `created_by` varchar(32) NOT NULL,
  `last_modified_on` timestamp(3) NULL DEFAULT NULL,
  `last_modified_by` varchar(32) DEFAULT NULL,
  `show_accounts_in_chart` tinyint(1) NOT NULL,
  `total_value` decimal(15,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `thoth_ledgers_identifier_uq` (`identifier`),
  KEY `thoth_ledgers_parent_fk` (`parent_ledger_id`),
  CONSTRAINT `thoth_ledgers_parent_fk` FOREIGN KEY (`parent_ledger_id`) REFERENCES `thoth_ledgers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thoth_ledgers`
--

LOCK TABLES `thoth_ledgers` WRITE;
/*!40000 ALTER TABLE `thoth_ledgers` DISABLE KEYS */;
INSERT INTO `thoth_ledgers` VALUES (1,'REVENUE','1000','1000','Income',NULL,'2018-01-22 17:09:13.739','operator',NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `thoth_ledgers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thoth_tx_types`
--

DROP TABLE IF EXISTS `thoth_tx_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thoth_tx_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(32) NOT NULL,
  `a_name` varchar(256) NOT NULL,
  `description` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `thoth_tx_types_identifier_uq` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thoth_tx_types`
--

LOCK TABLES `thoth_tx_types` WRITE;
/*!40000 ALTER TABLE `thoth_tx_types` DISABLE KEYS */;
INSERT INTO `thoth_tx_types` VALUES (1,'ACCC','Account Closing',NULL),(2,'ACCO','Account Opening',NULL),(3,'ACCT','Account Transfer',NULL),(4,'ACDT','ACH Credit',NULL),(5,'ADBT','ACH Debit',NULL),(6,'ADJT','Adjustments',NULL),(7,'APAC','ACH Pre-Authorised',NULL),(8,'ARET','ACH Return',NULL),(9,'AREV','ACH Reversal',NULL),(10,'ARPD','ARP Debit',NULL),(11,'ASET','ACH Settlement',NULL),(12,'ATXN','ACH Transaction',NULL),(13,'BACT','Branch Account Transfer',NULL),(14,'BBDD','SEPA B2B Direct Debit',NULL),(15,'BCDP','Branch Deposit',NULL),(16,'BCHQ','Branch Cheque',NULL),(17,'BCWD','Branch Withdrawal',NULL),(18,'CAJT','Credit Adjustments',NULL),(19,'CASH','Cash Letter',NULL),(20,'CCCH','Certified Customer Cheque',NULL),(21,'CCHQ','Cheque',NULL),(22,'CDIS','Controlled Disbursement',NULL),(23,'CDPT','Cash Deposit',NULL),(24,'CHRG','Charges',NULL),(25,'CQRV','Cheque Reversal',NULL),(26,'CRCQ','Crossed Cheque',NULL),(27,'CWDL','Cash Withdrawal',NULL),(28,'DAJT','Debit Adjustments',NULL),(29,'DDWN','Drawdown',NULL),(30,'DMCT','Domestic Credit Transfer',NULL),(31,'DSBR','Controlled Disbursement',NULL),(32,'ERTA','Exchange Rate Adjustment',NULL),(33,'FEES','Fees',NULL),(34,'ICCT','Intra Company Transfer',NULL),(35,'INTR','Interests',NULL),(36,'MIXD','Mixed Deposit',NULL),(37,'MSCD','Miscellaneous Deposit',NULL),(38,'NTAV','Not Available',NULL),(39,'OPCQ','Open Cheque',NULL),(40,'ORCQ','Order Cheque',NULL),(41,'OTHR','Other',NULL),(42,'PADD','Pre-Authorised Direct Debit',NULL),(43,'PMDD','Direct Debit Payment',NULL),(44,'POSC','Credit Card Payment',NULL),(45,'POSD','Point-of-Sale Payment Debit Card',NULL),(46,'POSP','Point-of-Sale Payment',NULL),(47,'PPAY','Principal Payment',NULL),(48,'PSTE','Posting Error',NULL),(49,'RCDD','Reversal Due To Payment Cancellation Request',NULL),(50,'RIMB','Reimbursement',NULL),(51,'RPCR','Reversal Due To Payment Cancellation Request',NULL),(52,'SMRT','Smart-Card Payment',NULL),(53,'TAXE','Taxes',NULL),(54,'YTDA','YTD Adjustment',NULL),(55,'ZABA','Zero Balancing',NULL),(56,'ICHQ','Issued Cheques',NULL),(57,'SALA','Payroll/Salary Payment',NULL);
/*!40000 ALTER TABLE `thoth_tx_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'playground'
--

--
-- Dumping routines for database 'playground'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-23  1:41:50
