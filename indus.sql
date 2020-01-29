-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: Indus
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add voucher header',7,'add_voucherheader'),(26,'Can change voucher header',7,'change_voucherheader'),(27,'Can delete voucher header',7,'delete_voucherheader'),(28,'Can view voucher header',7,'view_voucherheader'),(29,'Can add voucher detail',8,'add_voucherdetail'),(30,'Can change voucher detail',8,'change_voucherdetail'),(31,'Can delete voucher detail',8,'delete_voucherdetail'),(32,'Can view voucher detail',8,'view_voucherdetail'),(33,'Can add chart of account',9,'add_chartofaccount'),(34,'Can change chart of account',9,'change_chartofaccount'),(35,'Can delete chart of account',9,'delete_chartofaccount'),(36,'Can view chart of account',9,'view_chartofaccount'),(37,'Can add category',10,'add_category'),(38,'Can change category',10,'change_category'),(39,'Can delete category',10,'delete_category'),(40,'Can view category',10,'view_category'),(41,'Can add purchase detail',11,'add_purchasedetail'),(42,'Can change purchase detail',11,'change_purchasedetail'),(43,'Can delete purchase detail',11,'delete_purchasedetail'),(44,'Can view purchase detail',11,'view_purchasedetail'),(45,'Can add purchase header',12,'add_purchaseheader'),(46,'Can change purchase header',12,'change_purchaseheader'),(47,'Can delete purchase header',12,'delete_purchaseheader'),(48,'Can view purchase header',12,'view_purchaseheader'),(49,'Can add project',13,'add_project'),(50,'Can change project',13,'change_project'),(51,'Can delete project',13,'delete_project'),(52,'Can view project',13,'view_project'),(53,'Can add transactions',14,'add_transactions'),(54,'Can change transactions',14,'change_transactions'),(55,'Can delete transactions',14,'delete_transactions'),(56,'Can view transactions',14,'view_transactions'),(57,'Can add inventory',15,'add_inventory'),(58,'Can change inventory',15,'change_inventory'),(59,'Can delete inventory',15,'delete_inventory'),(60,'Can view inventory',15,'view_inventory'),(61,'Can add company info',16,'add_companyinfo'),(62,'Can change company info',16,'change_companyinfo'),(63,'Can delete company info',16,'delete_companyinfo'),(64,'Can view company info',16,'view_companyinfo'),(65,'Can add tbl action',17,'add_tblaction'),(66,'Can change tbl action',17,'change_tblaction'),(67,'Can delete tbl action',17,'delete_tblaction'),(68,'Can view tbl action',17,'view_tblaction'),(69,'Can add tbl company',18,'add_tblcompany'),(70,'Can change tbl company',18,'change_tblcompany'),(71,'Can delete tbl company',18,'delete_tblcompany'),(72,'Can view tbl company',18,'view_tblcompany'),(73,'Can add tbl object detail',19,'add_tblobjectdetail'),(74,'Can change tbl object detail',19,'change_tblobjectdetail'),(75,'Can delete tbl object detail',19,'delete_tblobjectdetail'),(76,'Can view tbl object detail',19,'view_tblobjectdetail'),(77,'Can add tbl object head',20,'add_tblobjecthead'),(78,'Can change tbl object head',20,'change_tblobjecthead'),(79,'Can delete tbl object head',20,'delete_tblobjecthead'),(80,'Can view tbl object head',20,'view_tblobjecthead'),(81,'Can add tbl transaction log',21,'add_tbltransactionlog'),(82,'Can change tbl transaction log',21,'change_tbltransactionlog'),(83,'Can delete tbl transaction log',21,'delete_tbltransactionlog'),(84,'Can view tbl transaction log',21,'view_tbltransactionlog'),(85,'Can add tbl user rights',22,'add_tbluserrights'),(86,'Can change tbl user rights',22,'change_tbluserrights'),(87,'Can delete tbl user rights',22,'delete_tbluserrights'),(88,'Can view tbl user rights',22,'view_tbluserrights'),(89,'Can add profile',23,'add_profile'),(90,'Can change profile',23,'change_profile'),(91,'Can delete profile',23,'delete_profile'),(92,'Can view profile',23,'view_profile'),(93,'Can add payment voucher',24,'add_paymentvoucher'),(94,'Can change payment voucher',24,'change_paymentvoucher'),(95,'Can delete payment voucher',24,'delete_paymentvoucher'),(96,'Can view payment voucher',24,'view_paymentvoucher');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$nDOQOfQlSbZn$6Jp68yOTsmQj/4hAt7fgbvFOWBTZsPlV9304TaB326Q=','2020-01-18 12:33:03.486632',1,'admin','Muhammad','Hammad','hammadarshad834@gmail.com',1,1,'2019-11-07 07:34:44.000000'),(4,'pbkdf2_sha256$150000$CcprjmjxwxQp$NB8UmBFGy4PubAypkZXGMfBe1dTKW9PazpHufH4w6UE=',NULL,0,'hammad','Muhammad','Sameer','sameerarshad7771@gmail.com',0,1,'2019-11-15 04:59:07.000000'),(5,'pbkdf2_sha256$150000$7KWpxRYbaULk$uoJfNj3WQIdz4eLaZ/F5KSQ3Ue9aLQchFD4Yj961Q4I=','2019-11-28 07:13:42.534528',0,'hamzawan','','','',0,1,'2019-11-28 07:13:29.361099'),(6,'pbkdf2_sha256$150000$7Ud7Ngdd0oKP$All4ejHNYSheHc2jSXAaSvDWaIBCXxSXUarRB33duMU=','2019-12-02 09:52:17.001930',0,'haseebawan','','','haseebawan@gmail.com',0,1,'2019-11-28 07:32:50.527347'),(7,'pbkdf2_sha256$150000$WrSUfftEl2Fh$fnNaNbj8EixIlpDzQnr5VAmPlGq9LCvJf6iZOlQXly0=','2019-11-28 07:36:45.039902',0,'asher','Asher','','asher@gmail.com',0,1,'2019-11-28 07:36:20.851769');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `construction_category`
--

DROP TABLE IF EXISTS `construction_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `construction_category` (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(100) NOT NULL,
  `userId_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`categoryId`),
  UNIQUE KEY `categoryName` (`categoryName`),
  KEY `construction_category_userId_id_3b8ea72f_fk_auth_user_id` (`userId_id`),
  CONSTRAINT `construction_category_userId_id_3b8ea72f_fk_auth_user_id` FOREIGN KEY (`userId_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `construction_category`
--

LOCK TABLES `construction_category` WRITE;
/*!40000 ALTER TABLE `construction_category` DISABLE KEYS */;
INSERT INTO `construction_category` VALUES (6,'FALCON CEMENT',1),(7,'D form grade 60',1);
/*!40000 ALTER TABLE `construction_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `construction_chartofaccount`
--

DROP TABLE IF EXISTS `construction_chartofaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `construction_chartofaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` varchar(100) NOT NULL,
  `account_title` varchar(100) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `opening_balance` decimal(20,2) NOT NULL,
  `phone_no` varchar(100) NOT NULL,
  `email_address` varchar(100) NOT NULL,
  `ntn` varchar(100) NOT NULL,
  `stn` varchar(100) NOT NULL,
  `cnic` varchar(100) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `remarks` varchar(100) NOT NULL,
  `credit_limit` decimal(20,2) NOT NULL,
  `user_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_title` (`account_title`),
  KEY `construction_chartofaccount_user_id_id_5e855e11_fk_auth_user_id` (`user_id_id`),
  CONSTRAINT `construction_chartofaccount_user_id_id_5e855e11_fk_auth_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `construction_chartofaccount`
--

LOCK TABLES `construction_chartofaccount` WRITE;
/*!40000 ALTER TABLE `construction_chartofaccount` DISABLE KEYS */;
INSERT INTO `construction_chartofaccount` VALUES (2,'100','HAMZA',13,-700000.00,'031543366','HAMZA@GMAIL.COM','876765','564543','5t65ftfur6fuyfrftfrtftrd7fr6tfrtcr','agratlajksghdgjhas','good',0.00,NULL),(4,'100','CASH',11,0.00,'','','','','','','',0.00,NULL),(5,'100','BANK ALFALAH',26,0.00,'','','','','','','',0.00,NULL),(6,'100','EXPENSE',11,0.00,'','','','','','','',0.00,NULL),(7,'100','CHEQUE',11,0.00,'','','','','','','',0.00,NULL),(8,'100','PURCHASE',11,0.00,'','','','','','','',0.00,1),(11,'100','HAMMAD',12,0.00,'','','','','','','',0.00,1),(12,'100','AIM engineer and constructor',12,0.00,'','','','','','','',0.00,1),(13,'100','Zahair Khan Steel Supplier',12,0.00,'','','','','','','',0.00,1),(14,'100','Faisal Ijaz',12,0.00,'','','','','','','',0.00,1),(15,'100','Indus Consultant',12,0.00,'','','','','','','',0.00,1),(16,'100','Sindh Employees Social Security Institute (SESSI) Govt of Sindh',12,0.00,'','','','','','','',0.00,1),(17,'100','General',12,0.00,'','','','','','','',0.00,1),(18,'100','Zahid Steel',13,0.00,'-','-','-','-','-','-','-',0.00,1),(19,'100','HBL Bank Client',13,0.00,'','','','','','','',0.00,1),(20,'100','SHOAIB INVESTER',12,0.00,'','','','','','','',0.00,1),(21,'100','AM Engineers',12,0.00,'','','','','','','',0.00,7),(22,'100','Hassam',12,0.00,'','','','','','','',0.00,1);
/*!40000 ALTER TABLE `construction_chartofaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `construction_companyinfo`
--

DROP TABLE IF EXISTS `construction_companyinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `construction_companyinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyName` varchar(100) NOT NULL,
  `companyAddress` longtext NOT NULL,
  `companyLogo` varchar(100) NOT NULL,
  `phoneNo` varchar(100) NOT NULL,
  `mobileNo` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `construction_companyinfo`
--

LOCK TABLES `construction_companyinfo` WRITE;
/*!40000 ALTER TABLE `construction_companyinfo` DISABLE KEYS */;
INSERT INTO `construction_companyinfo` VALUES (1,'Indus','lorem Ipsum lorem Ipsumlorem Ipsumlorem Ipsum','default.jpg','03146754432','03136657432','company@gmail.com','www.company.com');
/*!40000 ALTER TABLE `construction_companyinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `construction_inventory`
--

DROP TABLE IF EXISTS `construction_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `construction_inventory` (
  `itemId` int(11) NOT NULL AUTO_INCREMENT,
  `itemName` varchar(100) NOT NULL,
  `itemQuantity` decimal(20,2) NOT NULL,
  `unitPrice` decimal(20,2) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `itemCategory_id` int(11) NOT NULL,
  `projectId_id` int(11) NOT NULL,
  `userId_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemId`),
  KEY `construction_invento_itemCategory_id_739281b4_fk_construct` (`itemCategory_id`),
  KEY `construction_invento_projectId_id_1d5fd039_fk_construct` (`projectId_id`),
  KEY `construction_inventory_userId_id_acbb17a3_fk_auth_user_id` (`userId_id`),
  CONSTRAINT `construction_invento_itemCategory_id_739281b4_fk_construct` FOREIGN KEY (`itemCategory_id`) REFERENCES `construction_category` (`categoryId`),
  CONSTRAINT `construction_invento_projectId_id_1d5fd039_fk_construct` FOREIGN KEY (`projectId_id`) REFERENCES `construction_project` (`projectId`),
  CONSTRAINT `construction_inventory_userId_id_acbb17a3_fk_auth_user_id` FOREIGN KEY (`userId_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `construction_inventory`
--

LOCK TABLES `construction_inventory` WRITE;
/*!40000 ALTER TABLE `construction_inventory` DISABLE KEYS */;
INSERT INTO `construction_inventory` VALUES (62,'AMRELI STEEL',92.00,0.00,'KG',7,18,1),(66,'STEEL',200.00,0.00,'KG',7,18,1),(67,'BLOCK',100.00,0.00,'BAGS',6,18,1),(68,'STEEL',200.00,0.00,'KG',7,23,1),(69,'STEEL',2000.00,0.00,'kg',6,16,1);
/*!40000 ALTER TABLE `construction_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `construction_paymentvoucher`
--

DROP TABLE IF EXISTS `construction_paymentvoucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `construction_paymentvoucher` (
  `voucherID` int(11) NOT NULL AUTO_INCREMENT,
  `voucherDate` date NOT NULL,
  `description` longtext NOT NULL,
  `invAmount` decimal(20,2) NOT NULL,
  `paidAmount` decimal(20,2) NOT NULL,
  `balance` decimal(20,2) NOT NULL,
  `clientID_id` int(11) NOT NULL,
  `projectID_id` int(11) NOT NULL,
  `purchaseInvoiceID_id` int(11) NOT NULL,
  `sourceID_id` int(11) NOT NULL,
  `supplierID_id` int(11) NOT NULL,
  `userID_id` int(11) DEFAULT NULL,
  `paymentVoucherNo` varchar(100) NOT NULL,
  PRIMARY KEY (`voucherID`),
  KEY `construction_payment_clientID_id_ef7c4379_fk_construct` (`clientID_id`),
  KEY `construction_payment_projectID_id_1d1e3ab1_fk_construct` (`projectID_id`),
  KEY `construction_payment_purchaseInvoiceID_id_166e9e39_fk_construct` (`purchaseInvoiceID_id`),
  KEY `construction_payment_sourceID_id_b229c38e_fk_construct` (`sourceID_id`),
  KEY `construction_payment_supplierID_id_d38af89f_fk_construct` (`supplierID_id`),
  KEY `construction_paymentvoucher_userID_id_baecfea5_fk_auth_user_id` (`userID_id`),
  CONSTRAINT `construction_payment_clientID_id_ef7c4379_fk_construct` FOREIGN KEY (`clientID_id`) REFERENCES `construction_chartofaccount` (`id`),
  CONSTRAINT `construction_payment_projectID_id_1d1e3ab1_fk_construct` FOREIGN KEY (`projectID_id`) REFERENCES `construction_project` (`projectId`),
  CONSTRAINT `construction_payment_purchaseInvoiceID_id_166e9e39_fk_construct` FOREIGN KEY (`purchaseInvoiceID_id`) REFERENCES `construction_purchaseheader` (`purchaseHeaderId`),
  CONSTRAINT `construction_payment_sourceID_id_b229c38e_fk_construct` FOREIGN KEY (`sourceID_id`) REFERENCES `construction_chartofaccount` (`id`),
  CONSTRAINT `construction_payment_supplierID_id_d38af89f_fk_construct` FOREIGN KEY (`supplierID_id`) REFERENCES `construction_chartofaccount` (`id`),
  CONSTRAINT `construction_paymentvoucher_userID_id_baecfea5_fk_auth_user_id` FOREIGN KEY (`userID_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `construction_paymentvoucher`
--

LOCK TABLES `construction_paymentvoucher` WRITE;
/*!40000 ALTER TABLE `construction_paymentvoucher` DISABLE KEYS */;
INSERT INTO `construction_paymentvoucher` VALUES (7,'2019-12-03','',44000.00,200.00,44000.00,21,23,14,4,18,1,'1912CPV1'),(8,'2019-12-03','',410000.00,10000.00,410000.00,16,16,15,4,18,1,'1912CPV2'),(9,'2019-12-25','',44000.00,1000.00,43800.00,21,23,14,4,18,1,'1912CPV3');
/*!40000 ALTER TABLE `construction_paymentvoucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `construction_project`
--

DROP TABLE IF EXISTS `construction_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `construction_project` (
  `projectId` int(11) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(100) NOT NULL,
  `amount` decimal(20,2) NOT NULL,
  `narration` longtext NOT NULL,
  `projectDate` date NOT NULL,
  `payMethod` varchar(10) NOT NULL,
  `accountId_id` int(11) NOT NULL,
  `userId_id` int(11) DEFAULT NULL,
  `projectCode` varchar(100) NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `projectStatus` varchar(20) NOT NULL,
  PRIMARY KEY (`projectId`),
  KEY `construction_project_accountId_id_6d63e797_fk_construct` (`accountId_id`),
  KEY `construction_project_userId_id_6e779695_fk_auth_user_id` (`userId_id`),
  CONSTRAINT `construction_project_accountId_id_6d63e797_fk_construct` FOREIGN KEY (`accountId_id`) REFERENCES `construction_chartofaccount` (`id`),
  CONSTRAINT `construction_project_userId_id_6e779695_fk_auth_user_id` FOREIGN KEY (`userId_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `construction_project`
--

LOCK TABLES `construction_project` WRITE;
/*!40000 ALTER TABLE `construction_project` DISABLE KEYS */;
INSERT INTO `construction_project` VALUES (14,'Pakistan Rangers Sindh TCS building Z block',0.00,'Pakistan Rangers Sindh TCS Building Z block','2019-11-22','Cash',12,1,'1911PR1','2019-11-08','2020-08-13','On Holding'),(15,'Banglow No 431/A Karachi Bar Society Scheme 33',0.00,'Banglow No 431/A Karachi Bar Society Scheme 33','2019-11-22','Cash',14,1,'1911PR2','2017-09-15','2019-11-08','Complete'),(16,'Construction of Emergency Ward at Landhi Hospital Karachi',0.00,'Design Consultancy Services','2019-11-22','Cash',16,1,'1911PR3','2019-11-21','2020-05-22','None'),(17,'General',0.00,'General','2019-11-22','Cash',4,1,'0',NULL,NULL,''),(18,'HBL Building',1000000.00,'HBL Building Construction','2019-11-23','Cash',19,1,'1911PR4','2019-11-14','2021-07-30','On Going'),(19,'Sports Complex',100000.00,'-','2019-11-27','Cash',2,1,'1911PR5','2019-11-29','2019-11-05','On Holding'),(20,'GOOGLE BUILDING',20000.00,'','2019-11-29','Cash',2,1,'1911PR6','2019-11-02','2020-12-01','On Going'),(21,'UBL BUILDING CONSTRUCTION',10000000.00,'','2019-11-29','Cash',11,1,'1911PR7','2019-10-27','2021-01-22','None'),(23,'AM BUILDING RENOVATION',100000.00,'','2019-11-29','Cash',21,1,'1911PR8','2017-09-28','2020-01-28','On Going'),(24,'SMI UNIVERSITY',9000000.00,'','2019-11-29','Cash',14,1,'1911PR9','2019-10-28','2022-10-28','On Going'),(25,'SHAHEEN COMPLEX',4000000.00,'','2019-11-29','Cash',11,1,'1911PR10','2018-10-28','2021-12-30','On Holding'),(26,'HAMZA & SONS',20000.00,'','2019-11-29','Cash',11,1,'1911PR11','2018-10-28','2022-12-30','On Going'),(27,'SAGAR BUILDING',2000.00,'','2019-11-29','Cash',11,1,'1911PR12','2017-11-30','2021-09-28','On Going'),(28,'KARACHI UNI',2000.00,'','2019-11-29','Cash',11,1,'1911PR13','2018-10-28','2020-10-28','On Going'),(29,'DEFENCE HOUSING AUTHORITY',20000000.00,'','2019-12-01','Cash',12,1,'1912PR14','2019-12-03','2021-03-31','On Going'),(30,'BRIDGE CONSTRUCTION',1000000.00,'','2019-12-01','Cash',22,1,'1912PR15','2019-12-02','2021-03-30','On Holding');
/*!40000 ALTER TABLE `construction_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `construction_purchasedetail`
--

DROP TABLE IF EXISTS `construction_purchasedetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `construction_purchasedetail` (
  `purchaseDetailId` int(11) NOT NULL AUTO_INCREMENT,
  `purchaseQuantity` decimal(20,2) NOT NULL,
  `purchasePrice` decimal(20,2) NOT NULL,
  `total` decimal(20,3) DEFAULT NULL,
  `itemId_id` int(11) NOT NULL,
  `purchaseHeaderId_id` int(11) NOT NULL,
  PRIMARY KEY (`purchaseDetailId`),
  KEY `construction_purchas_itemId_id_f24327ef_fk_construct` (`itemId_id`),
  KEY `construction_purchas_purchaseHeaderId_id_ea7149ca_fk_construct` (`purchaseHeaderId_id`),
  CONSTRAINT `construction_purchas_itemId_id_f24327ef_fk_construct` FOREIGN KEY (`itemId_id`) REFERENCES `construction_inventory` (`itemId`),
  CONSTRAINT `construction_purchas_purchaseHeaderId_id_ea7149ca_fk_construct` FOREIGN KEY (`purchaseHeaderId_id`) REFERENCES `construction_purchaseheader` (`purchaseHeaderId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `construction_purchasedetail`
--

LOCK TABLES `construction_purchasedetail` WRITE;
/*!40000 ALTER TABLE `construction_purchasedetail` DISABLE KEYS */;
INSERT INTO `construction_purchasedetail` VALUES (14,200.00,100.00,40000.000,66,13),(15,100.00,200.00,40000.000,67,13),(16,200.00,190.00,44000.000,68,14),(17,2000.00,200.00,410000.000,69,15);
/*!40000 ALTER TABLE `construction_purchasedetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `construction_purchaseheader`
--

DROP TABLE IF EXISTS `construction_purchaseheader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `construction_purchaseheader` (
  `purchaseHeaderId` int(11) NOT NULL AUTO_INCREMENT,
  `purchaseNo` varchar(100) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `details` longtext NOT NULL,
  `tax` decimal(20,2) NOT NULL,
  `accountId_id` int(11) NOT NULL,
  `projectId_id` int(11) NOT NULL,
  `userId_id` int(11) DEFAULT NULL,
  `referenceNo` varchar(30) NOT NULL,
  `purchaseDate` date NOT NULL,
  PRIMARY KEY (`purchaseHeaderId`),
  KEY `construction_purchas_accountId_id_2dc10312_fk_construct` (`accountId_id`),
  KEY `construction_purchas_projectId_id_d78d5545_fk_construct` (`projectId_id`),
  KEY `construction_purchaseheader_userId_id_8e8039e0_fk_auth_user_id` (`userId_id`),
  CONSTRAINT `construction_purchas_accountId_id_2dc10312_fk_construct` FOREIGN KEY (`accountId_id`) REFERENCES `construction_chartofaccount` (`id`),
  CONSTRAINT `construction_purchas_projectId_id_d78d5545_fk_construct` FOREIGN KEY (`projectId_id`) REFERENCES `construction_project` (`projectId`),
  CONSTRAINT `construction_purchaseheader_userId_id_8e8039e0_fk_auth_user_id` FOREIGN KEY (`userId_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `construction_purchaseheader`
--

LOCK TABLES `construction_purchaseheader` WRITE;
/*!40000 ALTER TABLE `construction_purchaseheader` DISABLE KEYS */;
INSERT INTO `construction_purchaseheader` VALUES (13,'1911PUR1','Cash','',0.00,18,18,1,'0','2019-12-03'),(14,'1911PUR2','Credit','-',0.00,18,23,1,'98797','2019-12-03'),(15,'1912PUR3','Credit','87865',0.00,18,16,1,'8978','2019-12-03');
/*!40000 ALTER TABLE `construction_purchaseheader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `construction_transactions`
--

DROP TABLE IF EXISTS `construction_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `construction_transactions` (
  `transactionId` int(11) NOT NULL AUTO_INCREMENT,
  `refrenceId` varchar(100) NOT NULL,
  `refrenceDate` date NOT NULL,
  `tranType` varchar(100) NOT NULL,
  `amount` decimal(20,2) NOT NULL,
  `date` date NOT NULL,
  `refInvTranId` int(11) NOT NULL,
  `refInvTranType` varchar(100) NOT NULL,
  `remarks` varchar(100) NOT NULL,
  `voucherId` varchar(100) NOT NULL,
  `accountId_id` int(11) DEFAULT NULL,
  `userId_id` int(11) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`transactionId`),
  KEY `construction_transac_accountId_id_80337094_fk_construct` (`accountId_id`),
  KEY `construction_transactions_userId_id_44e50e13_fk_auth_user_id` (`userId_id`),
  CONSTRAINT `construction_transac_accountId_id_80337094_fk_construct` FOREIGN KEY (`accountId_id`) REFERENCES `construction_chartofaccount` (`id`),
  CONSTRAINT `construction_transactions_userId_id_44e50e13_fk_auth_user_id` FOREIGN KEY (`userId_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `construction_transactions`
--

LOCK TABLES `construction_transactions` WRITE;
/*!40000 ALTER TABLE `construction_transactions` DISABLE KEYS */;
INSERT INTO `construction_transactions` VALUES (76,'0','2018-10-21','',10000.00,'2019-11-22',97987,'JV','','18',6,1,0),(77,'0','2018-10-21','',-10000.00,'2019-11-22',97987,'JV','','18',4,1,0),(78,'0','2019-11-23','',-1990000.00,'2019-11-20',98796,'CRV','','19',16,1,0),(79,'0','2019-11-23','',1990000.00,'2019-11-20',98796,'CRV','','19',4,1,0),(80,'0','2019-11-15','',-1978765.00,'2019-11-13',989789,'BRV','','20',16,1,0),(81,'0','2019-11-15','',1978765.00,'2019-11-13',989789,'BRV','','20',5,1,0),(82,'0','2019-11-20','',1875745.00,'2019-11-11',998987,'CPV','','21',16,1,0),(83,'0','2019-11-20','',-1875745.00,'2019-11-11',998987,'CPV','','21',4,1,0),(84,'0','2019-11-23','',156745.00,'2019-11-14',6586876,'BPV','','22',16,1,0),(85,'0','2019-11-23','',-156745.00,'2019-11-14',6586876,'BPV','','22',5,1,0),(88,'0','2019-11-23','',-10000.00,'2019-11-23',98778897,'JV','','23',20,1,0),(89,'0','2019-11-23','',10000.00,'2019-11-23',98778897,'JV','','23',19,1,18),(94,'0','2019-10-24','Purchase Invoice',-40000.00,'2019-11-23',13,'','1911PUR1','',4,1,18),(95,'0','2019-10-24','Purchase Invoice',40000.00,'2019-11-23',13,'','1911PUR1','',18,1,18),(96,'0','2018-10-27','',1000.00,'2019-11-28',87678,'JV','','24',4,1,0),(97,'0','2018-10-27','',-1000.00,'2019-11-28',87678,'JV','','24',8,1,0),(98,'0','2018-10-27','',-89999.00,'2018-10-27',98789,'CRV','','25',12,1,0),(99,'0','2018-10-27','',89999.00,'2018-10-27',98789,'CRV','','25',4,1,0),(100,'0','2018-10-27','',-2000.00,'2018-10-27',886767,'BRV','','26',12,1,0),(101,'0','2018-10-27','',2000.00,'2018-10-27',886767,'BRV','','26',5,1,0),(102,'0','2019-10-29','',2000.00,'2019-09-27',987897,'CPV','','27',12,1,0),(103,'0','2019-10-29','',-2000.00,'2019-09-27',987897,'CPV','','27',4,1,0),(104,'0','2018-10-27','',1000.00,'2018-10-27',9878678,'BPV','','28',12,1,0),(105,'0','2018-10-27','',-1000.00,'2018-10-27',9878678,'BPV','','28',5,1,0),(106,'0','2018-10-28','',-1000.00,'2019-11-29',768687,'JV','','29',4,1,0),(107,'0','2018-10-28','',1000.00,'2019-11-29',768687,'JV','','29',4,1,0),(108,'0','2018-10-28','',10000.00,'2019-11-29',87678,'JV','','30',6,1,0),(109,'0','2018-10-28','',-10000.00,'2019-11-29',87678,'JV','','30',4,1,0),(110,'0','2018-10-28','',200.00,'2019-11-29',4654654,'JV','','31',5,1,0),(111,'0','2018-10-28','',-200.00,'2019-11-29',4654654,'JV','','31',7,1,0),(112,'0','2017-10-28','',1000.00,'2019-11-29',285745,'JV','','32',4,1,0),(113,'0','2017-10-28','',-1000.00,'2019-11-29',285745,'JV','','32',6,1,0),(114,'0','2018-10-28','',200.00,'2019-11-29',978978,'JV','','33',4,1,0),(115,'0','2018-10-28','',-200.00,'2019-11-29',978978,'JV','','33',6,1,0),(116,'0','2018-10-28','',-1000.00,'2019-11-29',576456,'JV','','34',4,1,0),(117,'0','2018-10-28','',1000.00,'2019-11-29',576456,'JV','','34',6,1,0),(118,'0','2018-10-26','',10000.00,'2019-11-29',7868768,'JV','','35',5,1,0),(119,'0','2018-10-26','',-10000.00,'2019-11-29',7868768,'JV','','35',4,1,0),(120,'0','2018-10-27','',3000.00,'2019-11-29',765765,'JV','','36',4,1,0),(121,'0','2018-10-27','',-3000.00,'2019-11-29',765765,'JV','','36',6,1,0),(122,'0','2019-11-14','Purchase Invoice',-44000.00,'2019-11-29',14,'','1911PUR2','',4,1,23),(123,'0','2019-11-14','Purchase Invoice',44000.00,'2019-11-29',14,'','1911PUR2','',18,1,23),(124,'0','2019-12-10','',-20000.00,'2019-12-19',768556,'BRV','','37',16,1,0),(125,'0','2019-12-10','',20000.00,'2019-12-19',768556,'BRV','','37',5,1,0),(126,'0','2019-12-03','',410000.00,'2019-12-03',15,'CPV','','1912CPV1',18,1,0),(127,'0','2019-12-03','',-410000.00,'2019-12-03',15,'CPV','','1912CPV1',4,1,0),(128,'0','2019-12-03','',44000.00,'2019-12-03',14,'CPV','','1912CPV2',18,1,0),(129,'0','2019-12-03','',-44000.00,'2019-12-03',14,'CPV','','1912CPV2',4,1,0),(132,'0','2019-12-03','',44000.00,'2019-12-03',14,'CPV','','1912CPV4',18,1,0),(133,'0','2019-12-03','',-44000.00,'2019-12-03',14,'CPV','','1912CPV4',4,1,0),(134,'0','2019-12-03','',44000.00,'2019-12-03',14,'CPV','','1912CPV5',18,1,0),(135,'0','2019-12-03','',-44000.00,'2019-12-03',14,'CPV','','1912CPV5',4,1,0),(136,'0','2019-12-03','',44000.00,'2019-12-03',14,'CPV','','1912CPV6',18,1,0),(137,'0','2019-12-03','',-44000.00,'2019-12-03',14,'CPV','','1912CPV6',4,1,0),(138,'0','2019-12-03','',44000.00,'2019-12-03',14,'CPV','','1912CPV1',18,1,0),(139,'0','2019-12-03','',-44000.00,'2019-12-03',14,'CPV','','1912CPV1',4,1,0),(140,'0','2019-12-03','',410000.00,'2019-12-03',15,'CPV','','1912CPV2',18,1,0),(141,'0','2019-12-03','',-410000.00,'2019-12-03',15,'CPV','','1912CPV2',4,1,0),(144,'0','2019-12-03','',410000.00,'2019-12-03',15,'CPV','','1912CPV4',18,1,0),(145,'0','2019-12-03','',-410000.00,'2019-12-03',15,'CPV','','1912CPV4',4,1,0),(146,'0','2019-12-18','',-20000.00,'2019-12-11',98797,'BRV','','38',11,1,0),(147,'0','2019-12-18','',20000.00,'2019-12-11',98797,'BRV','','38',5,1,0),(150,'0','2019-12-18','',20000.00,'2019-12-17',8996,'BPV','','40',11,1,0),(151,'0','2019-12-18','',-20000.00,'2019-12-17',8996,'BPV','','40',5,1,0),(152,'0','2019-12-18','',20000.00,'2019-12-18',87685,'BPV','','41',4,1,0),(153,'0','2019-12-18','',-20000.00,'2019-12-18',87685,'BPV','','41',5,1,0),(154,'0','2018-11-24','',-20000.00,'2018-11-24',765564,'CRV','','42',5,1,0),(155,'0','2018-11-24','',20000.00,'2018-11-24',765564,'CRV','','42',4,1,0),(156,'0','2019-12-17','',-1000.00,'2019-12-11',6543,'BRV','','43',2,1,0),(157,'0','2019-12-17','',1000.00,'2019-12-11',6543,'BRV','','43',5,1,0),(158,'0','2019-12-25','',44000.00,'2019-12-25',14,'CPV','','1912CPV3',18,1,0),(159,'0','2019-12-25','',-44000.00,'2019-12-25',14,'CPV','','1912CPV3',4,1,0),(160,'0','2019-12-16','',20000.00,'2019-12-11',75477,'BPV','','44',12,1,0),(161,'0','2019-12-16','',-20000.00,'2019-12-11',75477,'BPV','','44',5,1,0);
/*!40000 ALTER TABLE `construction_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `construction_voucherdetail`
--

DROP TABLE IF EXISTS `construction_voucherdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `construction_voucherdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `debit` decimal(20,2) NOT NULL,
  `credit` decimal(20,2) NOT NULL,
  `invoiceId` int(11) NOT NULL,
  `accountId_id` int(11) DEFAULT NULL,
  `voucherId_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `construction_voucher_accountId_id_17232151_fk_construct` (`accountId_id`),
  KEY `construction_voucher_voucherId_id_c22f2a51_fk_construct` (`voucherId_id`),
  CONSTRAINT `construction_voucher_accountId_id_17232151_fk_construct` FOREIGN KEY (`accountId_id`) REFERENCES `construction_chartofaccount` (`id`),
  CONSTRAINT `construction_voucher_voucherId_id_c22f2a51_fk_construct` FOREIGN KEY (`voucherId_id`) REFERENCES `construction_voucherheader` (`voucherId`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `construction_voucherdetail`
--

LOCK TABLES `construction_voucherdetail` WRITE;
/*!40000 ALTER TABLE `construction_voucherdetail` DISABLE KEYS */;
INSERT INTO `construction_voucherdetail` VALUES (27,10000.00,0.00,0,6,18),(28,0.00,-10000.00,0,4,18),(29,0.00,-1990000.00,0,16,19),(30,1990000.00,0.00,0,4,19),(31,0.00,-1978765.00,0,16,20),(32,1978765.00,0.00,0,5,20),(33,1875745.00,0.00,0,16,21),(34,0.00,-1875745.00,0,4,21),(35,156745.00,0.00,0,16,22),(36,0.00,-156745.00,0,5,22),(37,0.00,-10000.00,0,20,23),(38,10000.00,0.00,0,19,23),(39,1000.00,0.00,0,4,24),(40,0.00,-1000.00,0,8,24),(41,0.00,-89999.00,0,12,25),(42,89999.00,0.00,0,4,25),(43,0.00,-2000.00,0,12,26),(44,2000.00,0.00,0,5,26),(45,2000.00,0.00,0,12,27),(46,0.00,-2000.00,0,4,27),(47,1000.00,0.00,0,12,28),(48,0.00,-1000.00,0,5,28),(49,0.00,-1000.00,0,4,29),(50,1000.00,0.00,0,4,29),(51,10000.00,0.00,0,6,30),(52,0.00,-10000.00,0,4,30),(53,200.00,0.00,0,5,31),(54,0.00,-200.00,0,7,31),(55,1000.00,0.00,0,4,32),(56,0.00,-1000.00,0,6,32),(57,200.00,0.00,0,4,33),(58,0.00,-200.00,0,6,33),(59,0.00,-1000.00,0,4,34),(60,1000.00,0.00,0,6,34),(61,10000.00,0.00,0,5,35),(62,0.00,-10000.00,0,4,35),(63,3000.00,0.00,0,4,36),(64,0.00,-3000.00,0,6,36),(65,0.00,-20000.00,0,16,37),(66,20000.00,0.00,0,5,37),(67,0.00,-20000.00,0,11,38),(68,20000.00,0.00,0,5,38),(71,20000.00,0.00,0,11,40),(72,0.00,-20000.00,0,5,40),(73,20000.00,0.00,0,4,41),(74,0.00,-20000.00,0,5,41),(75,0.00,-20000.00,0,5,42),(76,20000.00,0.00,0,4,42),(77,0.00,-1000.00,0,2,43),(78,1000.00,0.00,0,5,43),(79,20000.00,0.00,0,12,44),(80,0.00,-20000.00,0,5,44);
/*!40000 ALTER TABLE `construction_voucherdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `construction_voucherheader`
--

DROP TABLE IF EXISTS `construction_voucherheader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `construction_voucherheader` (
  `voucherId` int(11) NOT NULL AUTO_INCREMENT,
  `voucherNo` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `docNo` varchar(100) NOT NULL,
  `docDate` date NOT NULL,
  `chequeNo` varchar(100) NOT NULL,
  `chequeDate` date NOT NULL,
  `description` longtext NOT NULL,
  `projectId_id` int(11) NOT NULL,
  `userId_id` int(11) DEFAULT NULL,
  `accountId_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`voucherId`),
  KEY `construction_voucher_projectId_id_7ddaf5c4_fk_construct` (`projectId_id`),
  KEY `construction_voucherheader_userId_id_4133f576_fk_auth_user_id` (`userId_id`),
  KEY `construction_voucher_accountId_id_70db85ea_fk_construct` (`accountId_id`),
  CONSTRAINT `construction_voucher_accountId_id_70db85ea_fk_construct` FOREIGN KEY (`accountId_id`) REFERENCES `construction_chartofaccount` (`id`),
  CONSTRAINT `construction_voucher_projectId_id_7ddaf5c4_fk_construct` FOREIGN KEY (`projectId_id`) REFERENCES `construction_project` (`projectId`),
  CONSTRAINT `construction_voucherheader_userId_id_4133f576_fk_auth_user_id` FOREIGN KEY (`userId_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `construction_voucherheader`
--

LOCK TABLES `construction_voucherheader` WRITE;
/*!40000 ALTER TABLE `construction_voucherheader` DISABLE KEYS */;
INSERT INTO `construction_voucherheader` VALUES (18,'1911JV1','2019-11-22','97987','2018-10-21','','2019-11-22','',17,1,6),(19,'1911CRV1','2019-11-20','98796','2019-11-23','','2019-11-20','',16,1,16),(20,'1911BRV1','2019-11-13','989789','2019-11-15','989789','2019-11-20','',16,1,16),(21,'1911CPV1','2019-11-11','998987','2019-11-20','','2019-11-11','',16,1,16),(22,'1911BPV1','2019-11-14','6586876','2019-11-23','6586876','2018-10-21','',16,1,16),(23,'1911JV2','2019-11-23','98778897','2019-11-23','','2019-11-23','',18,1,19),(24,'1911JV3','2019-11-28','87678','2018-10-27','','2019-11-28','',17,1,6),(25,'1911CRV2','2018-10-27','98789','2018-10-27','','2018-10-27','',14,1,12),(26,'1911BRV2','2018-10-27','886767','2018-10-27','886767','2018-10-27','',16,1,16),(27,'1911CPV2','2019-09-27','987897','2019-10-29','','2019-09-27','',14,1,12),(28,'1911BPV2','2018-10-27','9878678','2018-10-27','9878678','2018-10-27','',14,1,12),(29,'1911JV4','2019-11-29','768687','2018-10-28','','2019-11-29','',17,1,4),(30,'1911JV5','2019-11-29','87678','2018-10-28','','2019-11-29','',17,1,6),(31,'1911JV6','2019-11-29','4654654','2018-10-28','','2019-11-29','',17,1,7),(32,'1911JV7','2019-11-29','285745','2017-10-28','','2019-11-29','',17,1,4),(33,'1911JV8','2019-11-29','978978','2018-10-28','','2019-11-29','',17,1,4),(34,'1911JV9','2019-11-29','576456','2018-10-28','','2019-11-29','',17,1,6),(35,'1911JV10','2019-11-29','7868768','2018-10-26','','2019-11-29','',17,1,5),(36,'1911JV11','2019-11-29','765765','2018-10-27','','2019-11-29','',17,1,4),(37,'1912BRV3','2019-12-19','768556','2019-12-10','768556','2019-11-20','',16,1,16),(38,'1912BRV4','2019-12-11','98797','2019-12-18','98797','2018-11-11','',21,1,11),(40,'1912BPV4','2019-12-17','8996','2019-12-18','8996','2018-11-11','',21,1,11),(41,'1912BPV5','2019-12-18','87685','2019-12-18','87685','2018-11-24','',17,1,4),(42,'1912CRV3','2018-11-24','765564','2018-11-24','','2018-11-24','',17,1,5),(43,'1912BRV5','2019-12-11','6543','2019-12-17','6543','2018-11-24','',19,1,2),(44,'1912BPV6','2019-12-11','75477','2019-12-16','75477','2018-11-24','',29,1,12);
/*!40000 ALTER TABLE `construction_voucherheader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-11-07 13:52:37.552791','1','Transactions object (1)',3,'',14,1),(2,'2019-11-07 13:59:09.483376','2','Transactions object (2)',3,'',14,1),(3,'2019-11-07 14:08:25.824934','5','Transactions object (5)',3,'',14,1),(4,'2019-11-07 14:08:25.898070','4','Transactions object (4)',3,'',14,1),(5,'2019-11-07 14:08:25.932410','3','Transactions object (3)',3,'',14,1),(6,'2019-11-07 14:09:26.574429','6','Transactions object (6)',3,'',14,1),(7,'2019-11-07 14:10:55.884229','7','Transactions object (7)',3,'',14,1),(8,'2019-11-07 14:12:24.472748','9','Transactions object (9)',3,'',14,1),(9,'2019-11-07 14:12:24.573735','8','Transactions object (8)',3,'',14,1),(10,'2019-11-07 14:20:56.872299','11','Transactions object (11)',3,'',14,1),(11,'2019-11-07 14:20:56.940639','10','Transactions object (10)',3,'',14,1),(12,'2019-11-07 14:26:18.141866','13','Transactions object (13)',3,'',14,1),(13,'2019-11-07 14:26:18.190374','12','Transactions object (12)',3,'',14,1),(14,'2019-11-07 14:55:30.154527','1','VoucherDetail object (1)',3,'',8,1),(15,'2019-11-07 14:55:37.303402','16','Transactions object (16)',3,'',14,1),(16,'2019-11-07 14:55:37.399112','15','Transactions object (15)',3,'',14,1),(17,'2019-11-07 14:55:37.482036','14','Transactions object (14)',3,'',14,1),(18,'2019-11-07 14:55:45.793667','1','VoucherHeader object (1)',3,'',7,1),(19,'2019-11-07 14:59:58.204919','3','VoucherHeader object (3)',3,'',7,1),(20,'2019-11-07 14:59:58.283853','2','VoucherHeader object (2)',3,'',7,1),(21,'2019-11-07 15:05:20.615786','22','Transactions object (22)',3,'',14,1),(22,'2019-11-07 15:05:20.774376','21','Transactions object (21)',3,'',14,1),(23,'2019-11-07 15:05:20.817113','20','Transactions object (20)',3,'',14,1),(24,'2019-11-07 15:05:20.916855','19','Transactions object (19)',3,'',14,1),(25,'2019-11-07 15:05:20.949864','18','Transactions object (18)',3,'',14,1),(26,'2019-11-07 15:05:20.983362','17','Transactions object (17)',3,'',14,1),(27,'2019-11-07 15:07:17.828337','23','Transactions object (23)',3,'',14,1),(28,'2019-11-07 15:07:26.228359','3','VoucherDetail object (3)',3,'',8,1),(29,'2019-11-07 15:07:34.115841','8','VoucherHeader object (8)',3,'',7,1),(30,'2019-11-07 15:07:34.187266','7','VoucherHeader object (7)',3,'',7,1),(31,'2019-11-07 15:07:34.229003','6','VoucherHeader object (6)',3,'',7,1),(32,'2019-11-07 15:07:34.270617','5','VoucherHeader object (5)',3,'',7,1),(33,'2019-11-07 15:07:34.396022','4','VoucherHeader object (4)',3,'',7,1),(34,'2019-11-08 05:59:20.648703','18','VoucherHeader object (18)',3,'',7,1),(35,'2019-11-08 05:59:20.745740','17','VoucherHeader object (17)',3,'',7,1),(36,'2019-11-08 05:59:20.829197','16','VoucherHeader object (16)',3,'',7,1),(37,'2019-11-08 05:59:20.871220','15','VoucherHeader object (15)',3,'',7,1),(38,'2019-11-08 05:59:20.913134','14','VoucherHeader object (14)',3,'',7,1),(39,'2019-11-08 05:59:20.955063','13','VoucherHeader object (13)',3,'',7,1),(40,'2019-11-08 06:00:21.281545','35','Transactions object (35)',3,'',14,1),(41,'2019-11-08 06:00:21.379015','34','Transactions object (34)',3,'',14,1),(42,'2019-11-08 06:00:21.470840','33','Transactions object (33)',3,'',14,1),(43,'2019-11-08 06:00:21.512944','32','Transactions object (32)',3,'',14,1),(44,'2019-11-08 06:00:21.554680','31','Transactions object (31)',3,'',14,1),(45,'2019-11-08 06:00:21.596309','30','Transactions object (30)',3,'',14,1),(46,'2019-11-08 06:00:21.721348','29','Transactions object (29)',3,'',14,1),(47,'2019-11-08 06:00:21.763364','28','Transactions object (28)',3,'',14,1),(48,'2019-11-08 06:00:21.804780','27','Transactions object (27)',3,'',14,1),(49,'2019-11-08 06:00:21.846521','26','Transactions object (26)',3,'',14,1),(50,'2019-11-08 06:00:21.888196','25','Transactions object (25)',3,'',14,1),(51,'2019-11-08 06:00:21.930000','24','Transactions object (24)',3,'',14,1),(52,'2019-11-08 06:00:32.714022','17','VoucherDetail object (17)',3,'',8,1),(53,'2019-11-08 06:00:32.761314','16','VoucherDetail object (16)',3,'',8,1),(54,'2019-11-08 06:00:32.852821','15','VoucherDetail object (15)',3,'',8,1),(55,'2019-11-08 06:00:32.894950','14','VoucherDetail object (14)',3,'',8,1),(56,'2019-11-12 17:25:27.832538','1','100',1,'[{\"added\": {}}]',12,1),(57,'2019-11-13 10:17:38.232154','9','108',3,'',12,1),(58,'2019-11-13 10:17:38.336709','8','107',3,'',12,1),(59,'2019-11-13 10:17:38.420119','7','106',3,'',12,1),(60,'2019-11-13 10:17:38.461544','6','105',3,'',12,1),(61,'2019-11-13 10:17:38.503471','5','104',3,'',12,1),(62,'2019-11-13 10:17:38.545248','4','103',3,'',12,1),(63,'2019-11-13 10:17:38.587065','3','102',3,'',12,1),(64,'2019-11-13 10:17:38.628897','2','101',3,'',12,1),(65,'2019-11-13 10:17:38.695364','1','100',3,'',12,1),(66,'2019-11-13 10:23:11.813231','19','VoucherHeader object (19)',3,'',7,1),(67,'2019-11-13 10:25:57.470644','14','104',3,'',12,1),(68,'2019-11-13 10:25:57.548139','13','103',3,'',12,1),(69,'2019-11-13 10:25:57.589688','12','102',3,'',12,1),(70,'2019-11-13 10:25:57.631402','11','101',3,'',12,1),(71,'2019-11-13 10:25:57.673079','10','100',3,'',12,1),(72,'2019-11-13 10:30:47.095061','16','101',3,'',12,1),(73,'2019-11-13 10:30:47.183573','15','100',3,'',12,1),(74,'2019-11-13 11:14:25.918613','21','VoucherHeader object (21)',3,'',7,1),(75,'2019-11-13 11:14:26.000417','20','VoucherHeader object (20)',3,'',7,1),(76,'2019-11-13 12:59:39.513231','1','CompanyInfo object (1)',1,'[{\"added\": {}}]',16,1),(77,'2019-11-13 13:11:33.917262','27','VoucherHeader object (27)',3,'',7,1),(78,'2019-11-13 13:11:33.991373','26','VoucherHeader object (26)',3,'',7,1),(79,'2019-11-13 13:11:34.033859','25','VoucherHeader object (25)',3,'',7,1),(80,'2019-11-13 13:11:34.067351','24','VoucherHeader object (24)',3,'',7,1),(81,'2019-11-13 13:11:34.100734','23','VoucherHeader object (23)',3,'',7,1),(82,'2019-11-13 13:11:34.134308','22','VoucherHeader object (22)',3,'',7,1),(83,'2019-11-13 13:57:10.843185','30','VoucherHeader object (30)',3,'',7,1),(84,'2019-11-13 13:57:10.947423','29','VoucherHeader object (29)',3,'',7,1),(85,'2019-11-13 13:57:11.122818','28','VoucherHeader object (28)',3,'',7,1),(86,'2019-11-14 12:00:13.158705','17','Transactions object (17)',3,'',14,1),(87,'2019-11-14 12:00:13.205185','16','Transactions object (16)',3,'',14,1),(88,'2019-11-14 12:00:13.288040','15','Transactions object (15)',3,'',14,1),(89,'2019-11-14 12:00:13.321945','14','Transactions object (14)',3,'',14,1),(90,'2019-11-14 12:00:13.355697','13','Transactions object (13)',3,'',14,1),(91,'2019-11-14 12:00:13.388831','12','Transactions object (12)',3,'',14,1),(92,'2019-11-14 12:00:13.421928','11','Transactions object (11)',3,'',14,1),(93,'2019-11-14 12:00:13.455638','10','Transactions object (10)',3,'',14,1),(94,'2019-11-14 12:00:13.488975','9','Transactions object (9)',3,'',14,1),(95,'2019-11-14 12:00:13.522358','8','Transactions object (8)',3,'',14,1),(96,'2019-11-14 12:00:13.555824','7','Transactions object (7)',3,'',14,1),(97,'2019-11-14 12:00:13.588964','6','Transactions object (6)',3,'',14,1),(98,'2019-11-14 12:00:13.689270','5','Transactions object (5)',3,'',14,1),(99,'2019-11-14 12:00:13.722695','4','Transactions object (4)',3,'',14,1),(100,'2019-11-14 12:00:13.756129','3','Transactions object (3)',3,'',14,1),(101,'2019-11-14 12:00:13.789569','2','Transactions object (2)',3,'',14,1),(102,'2019-11-14 12:00:13.823034','1','Transactions object (1)',3,'',14,1),(103,'2019-11-14 15:08:51.416132','1','admin',2,'[{\"changed\": {\"fields\": [\"email\"]}}]',4,1),(104,'2019-11-14 18:59:00.496553','6','VoucherHeader object (6)',3,'',7,1),(105,'2019-11-15 05:01:01.404260','4','hammad',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',4,1),(106,'2019-11-18 14:03:40.102898','1','1911PUR1',3,'',12,1),(107,'2019-11-18 14:25:55.438848','2','1911PUR1',3,'',12,1),(108,'2019-11-18 14:26:28.300936','3','1911PUR1',3,'',12,1),(109,'2019-11-18 14:28:06.810525','4','1911PUR1',3,'',12,1),(110,'2019-11-18 14:31:20.900502','5','Blocks',3,'',15,1),(111,'2019-11-18 14:31:28.826759','5','1911PUR1',3,'',12,1),(112,'2019-11-18 14:59:35.394562','8','1911PUR3',3,'',12,1),(113,'2019-11-18 14:59:35.478803','7','1911PUR2',3,'',12,1),(114,'2019-11-18 14:59:35.553535','6','1911PUR1',3,'',12,1),(115,'2019-11-18 15:00:59.674333','7','CEMENT',3,'',15,1),(116,'2019-11-18 15:03:28.904496','9','1911PUR1',3,'',12,1),(117,'2019-11-18 15:06:08.575013','9','SAND',3,'',15,1),(118,'2019-11-18 15:06:08.707909','8','SAND',3,'',15,1),(119,'2019-11-18 15:07:41.788568','10','SAND',3,'',15,1),(120,'2019-11-18 15:08:09.068198','10','1911PUR1',3,'',12,1),(121,'2019-11-19 12:59:14.246927','13','1911PUR3',3,'',12,1),(122,'2019-11-19 12:59:14.309496','12','1911PUR2',3,'',12,1),(123,'2019-11-19 12:59:14.351200','11','1911PUR1',3,'',12,1),(124,'2019-11-19 12:59:41.367698','14','1911PUR1',3,'',12,1),(125,'2019-11-21 10:49:07.100260','39','Transactions object (39)',3,'',14,1),(126,'2019-11-21 10:49:07.527208','38','Transactions object (38)',3,'',14,1),(127,'2019-11-21 10:49:07.702670','37','Transactions object (37)',3,'',14,1),(128,'2019-11-21 10:49:07.779840','36','Transactions object (36)',3,'',14,1),(129,'2019-11-21 10:49:07.887291','35','Transactions object (35)',3,'',14,1),(130,'2019-11-21 10:49:07.954332','34','Transactions object (34)',3,'',14,1),(131,'2019-11-21 10:49:08.013424','33','Transactions object (33)',3,'',14,1),(132,'2019-11-21 10:49:08.105262','32','Transactions object (32)',3,'',14,1),(133,'2019-11-21 10:49:08.164520','29','Transactions object (29)',3,'',14,1),(134,'2019-11-21 10:49:08.231672','28','Transactions object (28)',3,'',14,1),(135,'2019-11-21 10:49:08.321695','27','Transactions object (27)',3,'',14,1),(136,'2019-11-21 10:49:08.406304','26','Transactions object (26)',3,'',14,1),(137,'2019-11-21 10:49:08.462014','25','Transactions object (25)',3,'',14,1),(138,'2019-11-21 10:49:08.593649','24','Transactions object (24)',3,'',14,1),(139,'2019-11-21 10:49:08.662831','23','Transactions object (23)',3,'',14,1),(140,'2019-11-21 10:49:08.760956','22','Transactions object (22)',3,'',14,1),(141,'2019-11-21 10:49:09.062232','21','Transactions object (21)',3,'',14,1),(142,'2019-11-21 10:49:09.171248','20','Transactions object (20)',3,'',14,1),(143,'2019-11-21 10:49:27.026613','16','STEEL',3,'',15,1),(144,'2019-11-21 10:49:27.085652','15','MATTI',3,'',15,1),(145,'2019-11-21 10:49:27.152357','14','STEEL',3,'',15,1),(146,'2019-11-21 10:49:27.185723','13','CEMENT',3,'',15,1),(147,'2019-11-21 10:49:27.219136','12','STEEL',3,'',15,1),(148,'2019-11-21 10:49:27.252577','11','SAND',3,'',15,1),(149,'2019-11-21 10:49:27.286076','6','BLOCKS',3,'',15,1),(150,'2019-11-21 10:49:27.327799','4','BLACK TILES',3,'',15,1),(151,'2019-11-21 10:49:27.369385','3','WHITE CEMENT',3,'',15,1),(152,'2019-11-21 10:49:27.411514','2','FOJI BLOCKS',3,'',15,1),(153,'2019-11-21 10:49:39.720901','15','1911PUR1',3,'',12,1),(154,'2019-11-21 10:49:54.730288','7','SCHOOL',3,'',13,1),(155,'2019-11-21 10:49:54.845733','6','BUILDING CONSTRUCTION',3,'',13,1),(156,'2019-11-21 10:49:54.887636','5','FLYOVER CONSTRUCTION',3,'',13,1),(157,'2019-11-21 10:49:54.929142','2','MOBILE MARKET RENOVATION',3,'',13,1),(158,'2019-11-21 11:26:15.247032','17','1911PUR1',3,'',12,1),(159,'2019-11-21 11:32:22.865202','19','1911PUR2',3,'',12,1),(160,'2019-11-21 11:32:22.937237','18','1911PUR1',3,'',12,1),(161,'2019-11-21 12:03:05.944709','20','1911PUR1',3,'',12,1),(162,'2019-11-21 12:07:14.393912','22','1911PUR2',3,'',12,1),(163,'2019-11-21 12:07:14.438831','21','1911PUR1',3,'',12,1),(164,'2019-11-21 12:08:52.461260','23','1911PUR',1,'[{\"added\": {}}]',12,1),(165,'2019-11-21 12:09:21.134124','23','1911PUR',3,'',12,1),(166,'2019-11-21 12:31:15.759666','34','1911PUR11',3,'',12,1),(167,'2019-11-21 12:31:15.794556','33','1911PUR10',3,'',12,1),(168,'2019-11-21 12:31:15.869377','32','1911PUR9',3,'',12,1),(169,'2019-11-21 12:31:15.927927','31','1911PUR8',3,'',12,1),(170,'2019-11-21 12:31:15.961164','30','1911PUR7',3,'',12,1),(171,'2019-11-21 12:31:15.994525','29','1911PUR6',3,'',12,1),(172,'2019-11-21 12:31:16.027873','28','1911PUR5',3,'',12,1),(173,'2019-11-21 12:31:16.061198','27','1911PUR4',3,'',12,1),(174,'2019-11-21 12:31:16.094521','26','1911PUR3',3,'',12,1),(175,'2019-11-21 12:31:16.127840','25','1911PUR2',3,'',12,1),(176,'2019-11-21 12:31:16.161268','24','1911PUR1',3,'',12,1),(177,'2019-11-21 12:34:58.131414','36','1911PUR2',3,'',12,1),(178,'2019-11-21 12:34:58.198528','35','1911PUR1',3,'',12,1),(179,'2019-11-21 12:41:39.553852','37','1911PUR1',3,'',12,1),(180,'2019-11-21 14:13:13.309471','24','PurchaseDetail object (24)',3,'',11,1),(181,'2019-11-21 14:13:13.373379','23','PurchaseDetail object (23)',3,'',11,1),(182,'2019-11-21 14:13:13.448614','22','PurchaseDetail object (22)',3,'',11,1),(183,'2019-11-21 14:13:13.482032','21','PurchaseDetail object (21)',3,'',11,1),(184,'2019-11-21 14:13:26.047336','45','Transactions object (45)',3,'',14,1),(185,'2019-11-21 14:13:26.166370','44','Transactions object (44)',3,'',14,1),(186,'2019-11-21 14:13:26.199960','43','Transactions object (43)',3,'',14,1),(187,'2019-11-21 14:13:26.233014','42','Transactions object (42)',3,'',14,1),(188,'2019-11-21 14:13:26.266555','41','Transactions object (41)',3,'',14,1),(189,'2019-11-21 14:13:26.299926','40','Transactions object (40)',3,'',14,1),(190,'2019-11-21 14:13:41.043444','42','1911PUR5',3,'',12,1),(191,'2019-11-21 14:13:41.111830','41','1911PUR4',3,'',12,1),(192,'2019-11-21 14:13:41.203161','40','1911PUR3',3,'',12,1),(193,'2019-11-21 14:13:41.295352','39','1911PUR2',3,'',12,1),(194,'2019-11-21 14:13:41.337156','38','1911PUR1',3,'',12,1),(195,'2019-11-21 18:53:52.190164','53','Transactions object (53)',3,'',14,1),(196,'2019-11-21 18:53:52.238056','52','Transactions object (52)',3,'',14,1),(197,'2019-11-21 18:53:52.321604','51','Transactions object (51)',3,'',14,1),(198,'2019-11-21 18:53:52.355244','50','Transactions object (50)',3,'',14,1),(199,'2019-11-21 18:53:52.388548','49','Transactions object (49)',3,'',14,1),(200,'2019-11-21 18:53:52.422020','48','Transactions object (48)',3,'',14,1),(201,'2019-11-21 18:53:52.463797','47','Transactions object (47)',3,'',14,1),(202,'2019-11-21 18:53:52.505578','46','Transactions object (46)',3,'',14,1),(203,'2019-11-21 20:18:18.459598','59','Transactions object (59)',3,'',14,1),(204,'2019-11-21 20:18:18.539189','58','Transactions object (58)',3,'',14,1),(205,'2019-11-21 20:18:18.572684','57','Transactions object (57)',3,'',14,1),(206,'2019-11-21 20:18:18.605774','56','Transactions object (56)',3,'',14,1),(207,'2019-11-21 20:18:18.639425','55','Transactions object (55)',3,'',14,1),(208,'2019-11-21 20:18:18.672493','54','Transactions object (54)',3,'',14,1),(209,'2019-11-22 04:39:18.160190','63','Transactions object (63)',3,'',14,1),(210,'2019-11-22 04:39:18.267469','62','Transactions object (62)',3,'',14,1),(211,'2019-11-22 04:39:18.309351','61','Transactions object (61)',3,'',14,1),(212,'2019-11-22 04:39:18.351232','60','Transactions object (60)',3,'',14,1),(213,'2019-11-22 04:40:53.414132','65','Transactions object (65)',3,'',14,1),(214,'2019-11-22 04:40:53.488252','64','Transactions object (64)',3,'',14,1),(215,'2019-11-22 04:44:58.929855','67','Transactions object (67)',3,'',14,1),(216,'2019-11-22 04:44:58.985570','66','Transactions object (66)',3,'',14,1),(217,'2019-11-22 04:47:23.190506','69','Transactions object (69)',3,'',14,1),(218,'2019-11-22 04:47:23.238619','68','Transactions object (68)',3,'',14,1),(219,'2019-11-22 04:49:24.529770','71','Transactions object (71)',3,'',14,1),(220,'2019-11-22 04:49:24.584840','70','Transactions object (70)',3,'',14,1),(221,'2019-11-22 05:45:36.779218','58','STEEL',3,'',15,1),(222,'2019-11-22 05:45:36.824886','57','STELL',3,'',15,1),(223,'2019-11-22 05:45:36.916414','56','STEEL',3,'',15,1),(224,'2019-11-22 05:45:36.958218','55','STEEL',3,'',15,1),(225,'2019-11-22 05:45:36.999985','54','STEEL',3,'',15,1),(226,'2019-11-22 05:45:37.042077','53','STEEL',3,'',15,1),(227,'2019-11-22 05:45:37.083863','52','STEEL',3,'',15,1),(228,'2019-11-22 05:45:37.125248','51','STEEL',3,'',15,1),(229,'2019-11-22 06:41:37.769461','59','steel',3,'',15,1),(230,'2019-11-22 11:07:06.371863','17','General',1,'[{\"added\": {}}]',13,1),(231,'2019-11-23 08:28:14.041870','14','Pakistan Rangers Sindh TCS building Z block',2,'[{\"changed\": {\"fields\": [\"narration\", \"projectCode\"]}}]',13,1),(232,'2019-11-23 08:28:34.784365','15','Banglow No 431/A Karachi Bar Society Scheme 33',2,'[{\"changed\": {\"fields\": [\"narration\", \"projectCode\"]}}]',13,1),(233,'2019-11-23 08:28:46.445761','16','Construction of Emergency Ward at Landhi Hospital Karachi',2,'[{\"changed\": {\"fields\": [\"projectCode\"]}}]',13,1),(234,'2019-11-27 13:03:06.474872','1','admin Profile',1,'[{\"added\": {}}]',23,1),(235,'2019-11-28 07:13:29.460015','5','hamzawan',1,'[{\"added\": {}}]',4,1),(236,'2019-11-29 07:35:59.278507','19','Sports Complex',2,'[{\"changed\": {\"fields\": [\"narration\", \"startDate\", \"endDate\", \"projectStatus\"]}}]',13,1),(237,'2019-11-29 09:12:36.374839','16','Construction of Emergency Ward at Landhi Hospital Karachi',2,'[{\"changed\": {\"fields\": [\"startDate\", \"endDate\", \"projectStatus\"]}}]',13,1),(238,'2019-11-29 10:46:43.784985','18','Zahid Steel',2,'[{\"changed\": {\"fields\": [\"parent_id\", \"phone_no\", \"email_address\", \"ntn\", \"stn\", \"cnic\", \"Address\", \"remarks\"]}}]',9,1),(239,'2019-12-02 11:32:51.241943','14','1911PUR2',2,'[{\"changed\": {\"fields\": [\"payment_method\", \"details\"]}}]',12,1),(240,'2019-12-02 11:33:07.446049','14','1911PUR2',2,'[{\"changed\": {\"fields\": [\"payment_method\"]}}]',12,1),(241,'2019-12-02 11:33:14.964303','14','1911PUR2',2,'[{\"changed\": {\"fields\": [\"payment_method\"]}}]',12,1),(242,'2019-12-02 12:55:29.466741','14','1911PUR2',2,'[{\"changed\": {\"fields\": [\"payment_method\"]}}]',12,1),(243,'2019-12-02 13:41:27.137526','14','1911PUR2',2,'[{\"changed\": {\"fields\": [\"payment_method\"]}}]',12,1),(244,'2019-12-02 13:58:30.588965','14','1911PUR2',2,'[{\"changed\": {\"fields\": [\"payment_method\"]}}]',12,1),(245,'2019-12-02 13:58:49.694998','14','1911PUR2',2,'[{\"changed\": {\"fields\": [\"payment_method\"]}}]',12,1),(246,'2019-12-03 13:28:39.581262','6','PaymentVoucher object (6)',3,'',24,1),(247,'2019-12-03 13:28:39.632815','5','PaymentVoucher object (5)',3,'',24,1),(248,'2019-12-03 13:28:39.674632','4','PaymentVoucher object (4)',3,'',24,1),(249,'2019-12-03 13:28:39.716581','3','PaymentVoucher object (3)',3,'',24,1),(250,'2019-12-03 13:28:39.758427','2','PaymentVoucher object (2)',3,'',24,1),(251,'2019-12-03 13:28:39.791853','1','PaymentVoucher object (1)',3,'',24,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(10,'construction','category'),(9,'construction','chartofaccount'),(16,'construction','companyinfo'),(15,'construction','inventory'),(24,'construction','paymentvoucher'),(13,'construction','project'),(11,'construction','purchasedetail'),(12,'construction','purchaseheader'),(14,'construction','transactions'),(8,'construction','voucherdetail'),(7,'construction','voucherheader'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(23,'users','profile'),(17,'users','tblaction'),(18,'users','tblcompany'),(19,'users','tblobjectdetail'),(20,'users','tblobjecthead'),(21,'users','tbltransactionlog'),(22,'users','tbluserrights');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-11-07 07:33:59.082995'),(2,'auth','0001_initial','2019-11-07 07:34:01.028090'),(3,'admin','0001_initial','2019-11-07 07:34:08.414687'),(4,'admin','0002_logentry_remove_auto_add','2019-11-07 07:34:10.114061'),(5,'admin','0003_logentry_add_action_flag_choices','2019-11-07 07:34:10.159850'),(6,'contenttypes','0002_remove_content_type_name','2019-11-07 07:34:11.296492'),(7,'auth','0002_alter_permission_name_max_length','2019-11-07 07:34:11.422705'),(8,'auth','0003_alter_user_email_max_length','2019-11-07 07:34:11.598427'),(9,'auth','0004_alter_user_username_opts','2019-11-07 07:34:11.637594'),(10,'auth','0005_alter_user_last_login_null','2019-11-07 07:34:12.134083'),(11,'auth','0006_require_contenttypes_0002','2019-11-07 07:34:12.167791'),(12,'auth','0007_alter_validators_add_error_messages','2019-11-07 07:34:12.217290'),(13,'auth','0008_alter_user_username_max_length','2019-11-07 07:34:12.337499'),(14,'auth','0009_alter_user_last_name_max_length','2019-11-07 07:34:12.538514'),(15,'auth','0010_alter_group_name_max_length','2019-11-07 07:34:12.671415'),(16,'auth','0011_update_proxy_permissions','2019-11-07 07:34:12.719201'),(17,'sessions','0001_initial','2019-11-07 07:34:13.060358'),(18,'construction','0001_initial','2019-11-07 07:35:10.781369'),(19,'construction','0002_voucherheader_accountid','2019-11-13 11:00:51.102629'),(20,'construction','0003_companyinfo','2019-11-13 11:00:52.134628'),(21,'construction','0004_transactions_project_id','2019-11-16 11:52:54.652501'),(22,'construction','0005_auto_20191121_1218','2019-11-21 12:18:50.150659'),(23,'construction','0006_auto_20191121_1238','2019-11-21 12:38:35.009459'),(24,'construction','0007_auto_20191121_1239','2019-11-21 12:39:04.455860'),(25,'construction','0008_auto_20191121_1321','2019-11-21 13:21:29.297546'),(26,'construction','0009_auto_20191121_1334','2019-11-21 13:34:58.070358'),(27,'construction','0010_project_projectcapital','2019-11-22 11:18:11.224398'),(28,'construction','0011_project_projectcode','2019-11-23 08:26:47.655795'),(29,'construction','0012_remove_project_projectcapital','2019-11-23 08:42:01.846096'),(30,'users','0001_initial','2019-11-26 10:59:19.824438'),(31,'construction','0002_project_startdate','2019-11-29 07:16:19.666411'),(32,'construction','0003_auto_20191129_0717','2019-11-29 07:17:45.935206'),(33,'construction','0004_purchaseheader_referenceno','2019-11-29 11:09:25.908507'),(34,'construction','0005_purchaseheader_purchasedate','2019-12-03 13:01:35.814111'),(35,'construction','0006_paymentvoucher','2019-12-03 13:01:36.192605'),(36,'construction','0007_paymentvoucher_paymentvoucherno','2019-12-03 13:01:41.453761');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2dbkjmtsbbilwt1wnnbps0bhy04ea9s3','ZDQwMTk4MjA5MTRkZjg3ZjVkM2VmNDMxNmVlZmMyN2IwMTY5NzFkNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYjNjZWRiZDA3NjA5ZDdlMWI5MjQzODUzZGFjMjUwMjJlNzE1NmNlIn0=','2020-02-01 12:33:03.636131'),('a1wmyenjiszkqj2gsuc8ddiq1edtlayt','ZDQwMTk4MjA5MTRkZjg3ZjVkM2VmNDMxNmVlZmMyN2IwMTY5NzFkNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYjNjZWRiZDA3NjA5ZDdlMWI5MjQzODUzZGFjMjUwMjJlNzE1NmNlIn0=','2019-12-26 09:08:16.600863'),('fpeg7xfbw6tfesuu72kcqqrcanhuio8w','ZDQwMTk4MjA5MTRkZjg3ZjVkM2VmNDMxNmVlZmMyN2IwMTY5NzFkNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYjNjZWRiZDA3NjA5ZDdlMWI5MjQzODUzZGFjMjUwMjJlNzE1NmNlIn0=','2020-01-07 15:17:51.158869'),('frxg33e7icja00ckrdnwua8nvjeuh2nh','ZDQwMTk4MjA5MTRkZjg3ZjVkM2VmNDMxNmVlZmMyN2IwMTY5NzFkNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYjNjZWRiZDA3NjA5ZDdlMWI5MjQzODUzZGFjMjUwMjJlNzE1NmNlIn0=','2020-01-08 09:10:43.938693'),('i11aaeyeh746zzqyled3ziyla6xpo898','ZDQwMTk4MjA5MTRkZjg3ZjVkM2VmNDMxNmVlZmMyN2IwMTY5NzFkNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYjNjZWRiZDA3NjA5ZDdlMWI5MjQzODUzZGFjMjUwMjJlNzE1NmNlIn0=','2020-01-07 12:52:02.578934'),('l16nftbpbrzgnla1d6ec39dynhqv6wno','MTY5YjEyYzFlMzZlNzNkZWJmNjdkNzNjNzg2MTNhYjU3NjE2Y2UzMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZTIzMTdjN2MzZmEzYmQzZGZiY2UyNDBjOWRmZTMwYmI1NGNjZGY2In0=','2019-12-07 07:26:24.010149'),('likimnvv0ixs7lwjjmbfl9ju8wzvo9uw','Y2ZjNDg3MTk1YWRjODU4NmMxY2FmOTczZTYzNTgyZTg4OTA0ZmI3ODp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYjgyZGM0OTNhNzhiNDgwMzMxN2MyYTY5NzI5NzRlMDcyZWMyYzcyIn0=','2019-12-12 07:13:42.660403'),('o2cfx2b7b4ucbhuunnvpmh5zbz4q9lam','MTY5YjEyYzFlMzZlNzNkZWJmNjdkNzNjNzg2MTNhYjU3NjE2Y2UzMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZTIzMTdjN2MzZmEzYmQzZGZiY2UyNDBjOWRmZTMwYmI1NGNjZGY2In0=','2019-12-14 12:39:48.490890'),('o52elsuewf5g3bs980mnzzodh3tanopj','ZDQwMTk4MjA5MTRkZjg3ZjVkM2VmNDMxNmVlZmMyN2IwMTY5NzFkNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYjNjZWRiZDA3NjA5ZDdlMWI5MjQzODUzZGFjMjUwMjJlNzE1NmNlIn0=','2019-12-16 10:05:14.886883'),('w7d9oh72g9un4y0gg9uf3y50u96ayfuk','MjgwOGFhMDI0NjRjODVmN2Q5YjRmYmMwZDY0MzE0YTliYmUyMGIwOTp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYzM5MGY0NDk1ZWJjY2UwZWRiZjFiNjRlN2JjNjg2MjY1ZTExNzQ3In0=','2019-12-12 07:36:45.077170'),('x5n5a6mytxxx7axbaj24fkrsm8w3ve71','OGQ1ZGI0NmEyZWUwYTU2M2U0NjY1Y2I4NjU4N2ZiYjI3MDI4Njk0ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlNWU2MzZmZDU4OTdmMjc0NTJjYmJlOTYxMDJjZmQ5ZWNlODM0NTJjIn0=','2019-11-28 19:23:11.646530'),('z9cyvwlcukm8yndynfzafnrw3wkgtn0r','MTY5YjEyYzFlMzZlNzNkZWJmNjdkNzNjNzg2MTNhYjU3NjE2Y2UzMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZTIzMTdjN2MzZmEzYmQzZGZiY2UyNDBjOWRmZTMwYmI1NGNjZGY2In0=','2019-12-06 08:05:48.380417'),('zugsf8dvlabumfdtynt7quy4b8c9hki2','ZDQwMTk4MjA5MTRkZjg3ZjVkM2VmNDMxNmVlZmMyN2IwMTY5NzFkNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYjNjZWRiZDA3NjA5ZDdlMWI5MjQzODUzZGFjMjUwMjJlNzE1NmNlIn0=','2019-12-17 12:56:40.717666');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblAction`
--

DROP TABLE IF EXISTS `tblAction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblAction` (
  `ActionID` int(11) NOT NULL AUTO_INCREMENT,
  `ActionName` varchar(200) NOT NULL,
  PRIMARY KEY (`ActionID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblAction`
--

LOCK TABLES `tblAction` WRITE;
/*!40000 ALTER TABLE `tblAction` DISABLE KEYS */;
INSERT INTO `tblAction` VALUES (1,'View'),(2,'Add'),(3,'Edit'),(4,'Delete');
/*!40000 ALTER TABLE `tblAction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblCompany`
--

DROP TABLE IF EXISTS `tblCompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblCompany` (
  `CompanyID` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyPin` varchar(200) NOT NULL,
  `CompanyName` varchar(200) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `PhoneNo` varchar(200) NOT NULL,
  `EmailAddress` varchar(200) NOT NULL,
  `Website` varchar(200) NOT NULL,
  `Image` varchar(100) NOT NULL,
  PRIMARY KEY (`CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblCompany`
--

LOCK TABLES `tblCompany` WRITE;
/*!40000 ALTER TABLE `tblCompany` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblCompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblObjectDetail`
--

DROP TABLE IF EXISTS `tblObjectDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblObjectDetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ObjectID` int(11) NOT NULL,
  `ActionID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblObjectDetail`
--

LOCK TABLES `tblObjectDetail` WRITE;
/*!40000 ALTER TABLE `tblObjectDetail` DISABLE KEYS */;
INSERT INTO `tblObjectDetail` VALUES (1,6,1),(2,6,2),(3,6,3),(4,6,4),(5,7,1),(6,7,2),(7,7,3),(8,7,4),(9,8,1),(10,8,2),(11,8,3),(12,8,4),(13,9,1),(14,9,2),(15,9,3),(16,9,4),(17,10,1),(18,10,2),(19,10,3),(20,10,4),(21,11,1),(22,11,2),(23,11,3),(24,11,4),(25,12,1),(26,12,2),(27,12,3),(28,12,4),(29,13,1),(30,13,2),(31,13,3),(32,13,4),(33,14,1),(34,14,2),(35,14,3),(36,14,4),(37,15,1),(38,15,2),(39,15,3),(40,15,4),(41,16,1),(42,16,2),(43,16,3),(44,16,4);
/*!40000 ALTER TABLE `tblObjectDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblObjectHead`
--

DROP TABLE IF EXISTS `tblObjectHead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblObjectHead` (
  `ObjectID` int(11) NOT NULL AUTO_INCREMENT,
  `ObjectTitle` varchar(200) NOT NULL,
  `ObjectName` varchar(200) NOT NULL,
  `ParentID` int(11) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `ObjectCategory` varchar(200) NOT NULL,
  `SerialNo` int(11) NOT NULL,
  `Icons` varchar(200) NOT NULL,
  PRIMARY KEY (`ObjectID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblObjectHead`
--

LOCK TABLES `tblObjectHead` WRITE;
/*!40000 ALTER TABLE `tblObjectHead` DISABLE KEYS */;
INSERT INTO `tblObjectHead` VALUES (1,'Project','',0,1,'Project',0,'fas fa-toolbox'),(2,'Inventory','',0,1,'Inventory',1,'fas fa-warehouse'),(3,'Transaction','',0,1,'Transaction',2,'far fa-money-bill-alt'),(4,'Reports','',0,1,'Reports',3,'far fa-chart-bar'),(5,'Setup','',0,1,'Setup',4,'fas fa-cog'),(6,'Projects','Project',1,1,'Project',5,''),(7,'Inventory','Inventory',2,1,'Inventory',6,''),(8,'Char Of Account','chart-of-account',3,1,'Transaction',7,''),(9,'Purchase','Purchase',3,1,'Transaction',8,''),(10,'Journal Voucher','Journal-Voucher',3,1,'Transaction',9,''),(11,'Cash Receiving Voucher','Cash-Receiving-Voucher',3,1,'Transaction',10,''),(12,'Bank Receiving Voucher','Bank-Receiving-Voucher',3,1,'Transaction',11,''),(13,'Cash Payment Voucher','Cash-Payment-Vocher',3,1,'Transaction',12,''),(14,'Bank Payment Voucher','Bank-Payment-Voucher',3,1,'Transaction',13,''),(15,'Reports','Report',4,1,'Report',14,''),(16,'User\'s Account','user-list',5,1,'Setup',15,'');
/*!40000 ALTER TABLE `tblObjectHead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblTransactionLog`
--

DROP TABLE IF EXISTS `tblTransactionLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblTransactionLog` (
  `TranID` int(11) NOT NULL AUTO_INCREMENT,
  `ObjectID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `AccessDateTime` datetime(6) NOT NULL,
  `SystemName` varchar(200) NOT NULL,
  `ActionID` int(11) NOT NULL,
  `Description` longtext NOT NULL,
  PRIMARY KEY (`TranID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblTransactionLog`
--

LOCK TABLES `tblTransactionLog` WRITE;
/*!40000 ALTER TABLE `tblTransactionLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblTransactionLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblUserRights`
--

DROP TABLE IF EXISTS `tblUserRights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblUserRights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ObjectID` int(11) NOT NULL,
  `ActionID` int(11) NOT NULL,
  `IsAllow` tinyint(1) NOT NULL,
  `UserID_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tblUserRights_UserID_id_d2f456dd_fk_auth_user_id` (`UserID_id`),
  CONSTRAINT `tblUserRights_UserID_id_d2f456dd_fk_auth_user_id` FOREIGN KEY (`UserID_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblUserRights`
--

LOCK TABLES `tblUserRights` WRITE;
/*!40000 ALTER TABLE `tblUserRights` DISABLE KEYS */;
INSERT INTO `tblUserRights` VALUES (1,6,1,1,4),(2,6,2,0,4),(3,6,3,0,4),(4,6,4,0,4),(5,6,1,1,1),(6,6,2,1,1),(7,6,3,1,1),(8,6,4,1,1),(9,7,1,1,1),(10,7,2,1,1),(11,7,3,1,1),(12,7,4,1,1),(13,8,1,1,1),(14,8,2,1,1),(15,8,3,1,1),(16,8,4,1,1),(17,9,1,1,1),(18,9,2,1,1),(19,9,3,1,1),(20,9,4,1,1),(21,10,1,1,1),(22,10,2,1,1),(23,10,3,1,1),(24,10,4,1,1),(25,11,1,1,1),(26,11,2,1,1),(27,11,3,1,1),(28,11,4,1,1),(29,12,1,1,1),(30,12,2,1,1),(31,12,3,1,1),(32,12,4,1,1),(33,13,1,1,1),(34,13,2,1,1),(35,13,3,1,1),(36,13,4,1,1),(37,14,1,1,1),(38,14,2,1,1),(39,14,3,1,1),(40,14,4,1,1),(41,15,1,1,1),(42,15,2,1,1),(43,15,3,1,1),(44,15,4,1,1),(45,16,1,1,1),(46,16,2,1,1),(47,16,3,1,1),(48,16,4,1,1);
/*!40000 ALTER TABLE `tblUserRights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_profile`
--

DROP TABLE IF EXISTS `users_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `users_profile_user_id_2112e78d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_profile`
--

LOCK TABLES `users_profile` WRITE;
/*!40000 ALTER TABLE `users_profile` DISABLE KEYS */;
INSERT INTO `users_profile` VALUES (1,'profile_pics/Actrex-Thiamethoxam_25_WG_Insecticide_Agro.png',1),(2,'default.jpg',6),(3,'default.jpg',7);
/*!40000 ALTER TABLE `users_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'Indus'
--

--
-- Dumping routines for database 'Indus'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-29 23:03:05
