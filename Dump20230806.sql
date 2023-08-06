-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: dbms_project
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `CONSUMER_CART`
--

DROP TABLE IF EXISTS `CONSUMER_CART`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CONSUMER_CART` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CUSTOMER_ID` int NOT NULL,
  `PRODUCT_ID` int NOT NULL,
  `FARMER_ID` int NOT NULL,
  `PRICE` int NOT NULL,
  `QUANTITY` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  KEY `PRODUCT_ID` (`PRODUCT_ID`),
  KEY `FARMER_ID` (`FARMER_ID`),
  CONSTRAINT `CONSUMER_CART_ibfk_1` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `CUSTOMER` (`CUSTOMER_ID`) ON DELETE CASCADE,
  CONSTRAINT `CONSUMER_CART_ibfk_2` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`PRODUCT_ID`) ON DELETE CASCADE,
  CONSTRAINT `CONSUMER_CART_ibfk_3` FOREIGN KEY (`FARMER_ID`) REFERENCES `FARMER` (`FARMER_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CONSUMER_CART`
--

LOCK TABLES `CONSUMER_CART` WRITE;
/*!40000 ALTER TABLE `CONSUMER_CART` DISABLE KEYS */;
/*!40000 ALTER TABLE `CONSUMER_CART` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER`
--

DROP TABLE IF EXISTS `CUSTOMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOMER` (
  `CUSTOMER_ID` int NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(20) NOT NULL,
  `LNAME` varchar(20) NOT NULL,
  `PNO` bigint DEFAULT NULL,
  `CITY` varchar(20) DEFAULT NULL,
  `PINCODE` int DEFAULT NULL,
  `EMAIL` varchar(20) NOT NULL,
  `FNAME` varchar(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ID`,`USERNAME`),
  UNIQUE KEY `USERNAME` (`USERNAME`),
  UNIQUE KEY `EMAIL` (`EMAIL`),
  UNIQUE KEY `PNO` (`PNO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER`
--

LOCK TABLES `CUSTOMER` WRITE;
/*!40000 ALTER TABLE `CUSTOMER` DISABLE KEYS */;
INSERT INTO `CUSTOMER` VALUES (1,'poojary2003','Poojary',94485153,'Varamballi',576213,'mk093200@gmail.com','Manoj'),(2,'poojary20','Poojary',9433575153,'Varamballi',576213,'mk@gmail.com','Manoj'),(3,'gedwa','tger',9648575153,'Varamballi',576213,'mk11@gmail.com','fde');
/*!40000 ALTER TABLE `CUSTOMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FARMER`
--

DROP TABLE IF EXISTS `FARMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FARMER` (
  `FARMER_ID` int NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(20) NOT NULL,
  `FNAME` varchar(20) NOT NULL,
  `LNAME` varchar(20) NOT NULL,
  `PNO` bigint DEFAULT NULL,
  `CITY` varchar(20) DEFAULT NULL,
  `PINCODE` int DEFAULT NULL,
  `EMAIL` varchar(20) NOT NULL,
  PRIMARY KEY (`FARMER_ID`,`USERNAME`),
  UNIQUE KEY `USERNAME` (`USERNAME`),
  UNIQUE KEY `EMAIL` (`EMAIL`),
  UNIQUE KEY `PNO` (`PNO`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FARMER`
--

LOCK TABLES `FARMER` WRITE;
/*!40000 ALTER TABLE `FARMER` DISABLE KEYS */;
INSERT INTO `FARMER` VALUES (11,'pory2001','Mano','Poojry',2348575153,'Varamballi',576213,'mk0932002@il.com'),(12,'poory2001','fde','dwes',94423175153,'Varambal',576213,'mk0002@gmail.com'),(13,'manojgyj','fde','hukh',94789575153,'Varamballi',576213,'m2002@gmail.com'),(14,'manojdsadsa','fde','asxas',9128575153,'Varamballi',576213,'mk093200@ail.com'),(15,'poojarydwdw2001','fde','dsadwqs',94321575153,'Varamballi',576213,'mk002@gmail.com'),(16,'poojary2001dqd','dasd','dasd',1448575153,'Varamballi',576213,'mk0932@ail.com'),(17,'poojar1','Man','Poojary',9421753153,'Varamballi',576213,'mwdds02@gmail.com'),(18,'poojary2001','Manoj','Poojary',9448575153,'Varamballi',576213,'mk0932002@gmail.com'),(19,'pooj2001','FDFDSA','Poojary',9448325153,'Varamballi',576213,'mk1@gmail.com'),(20,'1234-5678-1234','manoj','kumar',7894561237,'sxdahbj',445678,'mk093dsad@gmail.com'),(21,'3467-1475-2176','ramesh','poojary',9867342948,'udupi',576213,'mk0937@ghhd.sd.com');
/*!40000 ALTER TABLE `FARMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT`
--

DROP TABLE IF EXISTS `PRODUCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRODUCT` (
  `PRODUCT_ID` int NOT NULL AUTO_INCREMENT,
  `PRODUCT_NAME` varchar(20) NOT NULL,
  `CATEGORY` varchar(20) DEFAULT NULL,
  `PRODUCT_DESC` varchar(200) NOT NULL,
  `IMG` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT`
--

LOCK TABLES `PRODUCT` WRITE;
/*!40000 ALTER TABLE `PRODUCT` DISABLE KEYS */;
INSERT INTO `PRODUCT` VALUES (2,'Onion','Vegetables','Vegetables','greenmarket/images/product-2.png'),(3,'Orange','Fruits','Fruits','greenmarket/images/product-1.png'),(4,'Tomato','Vegetables','Vegetables','greenmarket/images/tomato.jpg'),(5,'Cabbage','Vegetables','Vegetables','greenmarket/images/product-4.png'),(6,'Potato','Vegetables','Vegetables','greenmarket/images/product-5.png'),(7,'Avocado','Fruits','Fruits','greenmarket/images/product-6.png'),(8,'Carrot','Vegetables','Vegetables','greenmarket/images/product-7.png'),(9,'Lemon','Vegetables','Vegetables','greenmarket/images/product-8.png');
/*!40000 ALTER TABLE `PRODUCT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PURCHASES`
--

DROP TABLE IF EXISTS `PURCHASES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PURCHASES` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` int NOT NULL,
  `CUSTOMER_ID` int NOT NULL,
  `FARMER_ID` int NOT NULL,
  `QUANTITY` int NOT NULL,
  `PURCHASE_PRICE` int NOT NULL,
  `PURCHASE_TIMESTAMP` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `PRODUCT_ID` (`PRODUCT_ID`),
  KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  KEY `FARMER_ID` (`FARMER_ID`),
  CONSTRAINT `PURCHASES_ibfk_1` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`PRODUCT_ID`) ON DELETE CASCADE,
  CONSTRAINT `PURCHASES_ibfk_2` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `CUSTOMER` (`CUSTOMER_ID`) ON DELETE CASCADE,
  CONSTRAINT `PURCHASES_ibfk_3` FOREIGN KEY (`FARMER_ID`) REFERENCES `FARMER` (`FARMER_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PURCHASES`
--

LOCK TABLES `PURCHASES` WRITE;
/*!40000 ALTER TABLE `PURCHASES` DISABLE KEYS */;
INSERT INTO `PURCHASES` VALUES (3,2,3,11,100,5,'2022-02-26 12:51:27'),(4,2,3,11,100,5,'2022-02-26 16:36:28'),(5,2,3,13,50,6,'2022-02-26 16:36:28'),(7,2,3,11,100,5,'2022-02-27 16:58:09'),(8,2,3,11,50,5,'2022-02-27 16:58:09'),(9,9,3,20,50,3,'2022-02-27 16:58:09'),(10,7,3,20,100,15,'2022-02-28 09:17:52'),(11,9,3,20,100,3,'2022-02-28 09:17:52'),(12,2,3,11,30,5,'2022-02-28 09:17:52'),(13,6,3,16,200,8,'2022-02-28 09:17:53'),(14,2,3,11,30,5,'2022-03-02 06:07:23'),(15,3,3,20,240,15,'2022-04-22 06:59:06'),(16,2,3,11,32,5,'2022-04-22 06:59:06'),(17,2,3,11,100,5,'2022-11-25 15:23:40');
/*!40000 ALTER TABLE `PURCHASES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SOLD_BY`
--

DROP TABLE IF EXISTS `SOLD_BY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SOLD_BY` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` int NOT NULL,
  `FARMER_ID` int NOT NULL,
  `PRICE` int NOT NULL,
  `QUANTITY` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PRODUCT_ID` (`PRODUCT_ID`),
  KEY `FARMER_ID` (`FARMER_ID`),
  CONSTRAINT `SOLD_BY_ibfk_1` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`PRODUCT_ID`) ON DELETE CASCADE,
  CONSTRAINT `SOLD_BY_ibfk_2` FOREIGN KEY (`FARMER_ID`) REFERENCES `FARMER` (`FARMER_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SOLD_BY`
--

LOCK TABLES `SOLD_BY` WRITE;
/*!40000 ALTER TABLE `SOLD_BY` DISABLE KEYS */;
INSERT INTO `SOLD_BY` VALUES (1,2,11,5,258),(3,6,16,8,1800),(4,2,13,6,1950),(6,8,20,10,160),(7,9,20,3,150),(8,7,20,15,400),(9,3,20,15,760),(11,9,20,1,10000),(13,3,21,10,2000),(14,3,20,10,100),(15,5,20,8,500),(16,3,20,265,3838);
/*!40000 ALTER TABLE `SOLD_BY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add auth group',9,'add_authgroup'),(26,'Can change auth group',9,'change_authgroup'),(27,'Can delete auth group',9,'delete_authgroup'),(28,'Can view auth group',9,'view_authgroup'),(29,'Can add auth group permissions',10,'add_authgrouppermissions'),(30,'Can change auth group permissions',10,'change_authgrouppermissions'),(31,'Can delete auth group permissions',10,'delete_authgrouppermissions'),(32,'Can view auth group permissions',10,'view_authgrouppermissions'),(33,'Can add auth permission',11,'add_authpermission'),(34,'Can change auth permission',11,'change_authpermission'),(35,'Can delete auth permission',11,'delete_authpermission'),(36,'Can view auth permission',11,'view_authpermission'),(37,'Can add auth user',12,'add_authuser'),(38,'Can change auth user',12,'change_authuser'),(39,'Can delete auth user',12,'delete_authuser'),(40,'Can view auth user',12,'view_authuser'),(41,'Can add auth user groups',13,'add_authusergroups'),(42,'Can change auth user groups',13,'change_authusergroups'),(43,'Can delete auth user groups',13,'delete_authusergroups'),(44,'Can view auth user groups',13,'view_authusergroups'),(45,'Can add auth user user permissions',14,'add_authuseruserpermissions'),(46,'Can change auth user user permissions',14,'change_authuseruserpermissions'),(47,'Can delete auth user user permissions',14,'delete_authuseruserpermissions'),(48,'Can view auth user user permissions',14,'view_authuseruserpermissions'),(49,'Can add chat communication',15,'add_chatcommunication'),(50,'Can change chat communication',15,'change_chatcommunication'),(51,'Can delete chat communication',15,'delete_chatcommunication'),(52,'Can view chat communication',15,'view_chatcommunication'),(53,'Can add consumer cart',16,'add_consumercart'),(54,'Can change consumer cart',16,'change_consumercart'),(55,'Can delete consumer cart',16,'delete_consumercart'),(56,'Can view consumer cart',16,'view_consumercart'),(57,'Can add customer',17,'add_customer'),(58,'Can change customer',17,'change_customer'),(59,'Can delete customer',17,'delete_customer'),(60,'Can view customer',17,'view_customer'),(61,'Can add django admin log',18,'add_djangoadminlog'),(62,'Can change django admin log',18,'change_djangoadminlog'),(63,'Can delete django admin log',18,'delete_djangoadminlog'),(64,'Can view django admin log',18,'view_djangoadminlog'),(65,'Can add django content type',19,'add_djangocontenttype'),(66,'Can change django content type',19,'change_djangocontenttype'),(67,'Can delete django content type',19,'delete_djangocontenttype'),(68,'Can view django content type',19,'view_djangocontenttype'),(69,'Can add django migrations',20,'add_djangomigrations'),(70,'Can change django migrations',20,'change_djangomigrations'),(71,'Can delete django migrations',20,'delete_djangomigrations'),(72,'Can view django migrations',20,'view_djangomigrations'),(73,'Can add django session',21,'add_djangosession'),(74,'Can change django session',21,'change_djangosession'),(75,'Can delete django session',21,'delete_djangosession'),(76,'Can view django session',21,'view_djangosession'),(77,'Can add farmer',7,'add_farmer'),(78,'Can change farmer',7,'change_farmer'),(79,'Can delete farmer',7,'delete_farmer'),(80,'Can view farmer',7,'view_farmer'),(81,'Can add product',8,'add_product'),(82,'Can change product',8,'change_product'),(83,'Can delete product',8,'delete_product'),(84,'Can view product',8,'view_product'),(85,'Can add purchases',22,'add_purchases'),(86,'Can change purchases',22,'change_purchases'),(87,'Can delete purchases',22,'delete_purchases'),(88,'Can view purchases',22,'view_purchases'),(89,'Can add sold by',23,'add_soldby'),(90,'Can change sold by',23,'change_soldby'),(91,'Can delete sold by',23,'delete_soldby'),(92,'Can view sold by',23,'view_soldby'),(93,'Can add sold',24,'add_sold'),(94,'Can change sold',24,'change_sold'),(95,'Can delete sold',24,'delete_sold'),(96,'Can view sold',24,'view_sold'),(97,'Can add produc',25,'add_produc'),(98,'Can change produc',25,'change_produc'),(99,'Can delete produc',25,'delete_produc'),(100,'Can view produc',25,'view_produc');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$320000$mGdg0XqbnlbuQJpvsJZUWY$Q6blim4d+z+nRVeFtMmfX7MZ1OoZo/ID7NRQoFtqRnc=','2022-02-28 12:20:10.094520',1,'manoj','','','mk0932002@gmail.com',1,1,'2022-01-23 11:38:29.605151'),(3,'pbkdf2_sha256$320000$3mDR5byD5s8cSWHu6E13j4$kt+U/9yxsqYseiwLM7vXRfKBpTC3PBdufmZMQtocoes=','2022-01-31 10:01:52.462600',0,'poojary2002','','','mk0932002@gmail.com',0,1,'2022-01-31 10:01:52.211761'),(4,'pbkdf2_sha256$320000$V7PiwmeMjPtzNf2seL5nl9$y6Rf6tCCprNMpZ8NpwJIkknlT2lLP7f+iXb4ZXRTPNo=','2022-02-02 17:44:16.882077',0,'pory2001','','','mk0932002@il.com',0,1,'2022-02-02 17:44:16.611593'),(5,'pbkdf2_sha256$320000$rtqNcgB856T4nEVSBycPZh$NzgGG7yM+IIouUC424zdAz6egVlsOWK8bo4HEsJrTVI=','2022-02-02 17:46:47.034861',0,'poory2001','','','mk0002@gmail.com',0,1,'2022-02-02 17:46:46.777264'),(6,'pbkdf2_sha256$320000$CO5ejC4VbMxngZuMep1MWj$t9wmHTW1BYAcN7UORpmyM5wdA2tG2XFKH4crjt3E4CQ=','2022-02-02 17:48:05.822342',0,'manojgyj','','','m2002@gmail.com',0,1,'2022-02-02 17:48:05.573194'),(7,'pbkdf2_sha256$320000$h09vnFksUs7dduQnlQeGbO$I0YZoSE4HCpKSZVa8HuwHYFDulxklHpGfKceXGsYDvk=','2022-02-02 17:49:03.467314',0,'manojdsadsa','','','mk093200@ail.com',0,1,'2022-02-02 17:49:03.208466'),(8,'pbkdf2_sha256$320000$svqQ0CWwMtSjWEaH3SYI5b$qgF9Xh2rESk/6Vsh3Og9McZwpnrebC92wHui2BCUVIg=','2022-02-02 17:54:19.995639',0,'poojarydwdw2001','','','mk002@gmail.com',0,1,'2022-02-02 17:54:19.701110'),(10,'pbkdf2_sha256$320000$SymeJBITnTI5863bxdAs1e$aa/+APCPMtbL/PdhjTmnU6sIem8bY+Q5W+iuFzsHR0A=','2022-02-03 16:08:18.908953',0,'poojary2001dqd','','','mk0932@ail.com',0,1,'2022-02-03 16:08:18.653135'),(12,'pbkdf2_sha256$320000$PyfEL1bSUlvxps3QNmStcx$954aiGpJP8y2FtRLnyhg9PjafQpMtatLj7qSXB8GpXg=','2022-02-03 16:45:13.030668',0,'poojar1','','','mwdds02@gmail.com',0,1,'2022-02-03 16:45:12.808372'),(13,'pbkdf2_sha256$320000$mJLPDDchQbsW9N4ko2AVCE$97RtAtRlBKntNFgceXIUr/29k4Q8inHSXJP+MqwiDfA=','2022-02-14 10:05:34.115291',0,'poojary2001','','','mk0932002@gmail.com',0,1,'2022-02-03 18:31:29.435247'),(14,'pbkdf2_sha256$320000$7E01PoFK1bwlIKZ77uwkiP$H9v4GvOhp5G8SNQ51M4cAR9lSjvZ5oKQI7udgAPzNc0=','2022-02-03 18:49:57.700138',0,'poojary2003','','','mk093200@gmail.com',0,1,'2022-02-03 18:49:57.475005'),(15,'pbkdf2_sha256$320000$VRvLvOzPVZJOp74Ohu69WQ$L4WhbE3r/cL5OzhPLtWFSAzdcQKriWp62MjH7ew/nKA=','2022-02-04 05:35:12.483699',0,'poojary20','','','mk@gmail.com',0,1,'2022-02-04 05:29:15.170603'),(16,'pbkdf2_sha256$320000$9paa82Kl8ckNMxDJYeVjuR$9ksYxXFg0qioCIuTp9OwXkf6vPr76fzevIumeBijbkE=','2022-02-05 12:10:26.198468',0,'pooj2001','','','mk1@gmail.com',0,1,'2022-02-04 05:37:26.592819'),(17,'pbkdf2_sha256$320000$mmqTnBnjw0kwKSPBWiQdEa$QxTVIrfWFzhGyWgW/c+HL6Q/zpakwQkaLupn43/UMcg=','2022-11-25 15:22:50.165899',1,'1234-5678-1234','','','mk093dsad@gmail.com',1,1,'2022-02-14 10:35:25.000000'),(18,'pbkdf2_sha256$320000$kRR68Oz1Mg3dFfa9eP3sSe$IImWth177+Le+TTeU4sVhl4x3HWhcIC/jbYSbSndXmc=','2022-11-25 15:23:21.887446',1,'gedwa','','','mk11@gmail.com',1,1,'2022-02-14 12:16:33.000000'),(19,'pbkdf2_sha256$320000$hSSwCmCRF7dVys4swtgKcc$JHz84174s+UGdluHvsjYq7q14O/atpN8slF7FcjMy9s=','2022-02-28 12:20:37.258562',1,'3467-1475-2176','','','mk0937@ghhd.sd.com',1,1,'2022-02-28 12:18:01.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-02-04 08:40:25.766816','1','Product object (1)',1,'[{\"added\": {}}]',8,1),(2,'2022-02-04 09:23:02.210595','1','Product object (1)',3,'',8,1),(3,'2022-02-04 10:05:53.410367','2','Product object (2)',1,'[{\"added\": {}}]',8,1),(4,'2022-02-04 10:55:16.890973','3','Product object (3)',1,'[{\"added\": {}}]',8,1),(5,'2022-02-04 11:00:29.257528','4','Product object (4)',1,'[{\"added\": {}}]',8,1),(6,'2022-02-04 11:01:04.183367','5','Product object (5)',1,'[{\"added\": {}}]',8,1),(7,'2022-02-04 11:01:36.553954','6','Product object (6)',1,'[{\"added\": {}}]',8,1),(8,'2022-02-04 11:02:06.175374','7','Product object (7)',1,'[{\"added\": {}}]',8,1),(9,'2022-02-04 11:02:33.424681','8','Product object (8)',1,'[{\"added\": {}}]',8,1),(10,'2022-02-04 11:02:55.772549','9','Product object (9)',1,'[{\"added\": {}}]',8,1),(11,'2022-02-05 06:39:04.317243','0','SoldBy object (0)',1,'[{\"added\": {}}]',23,1),(12,'2022-02-05 06:40:03.149774','0','SoldBy object (0)',1,'[{\"added\": {}}]',23,1),(13,'2022-02-05 06:44:58.639836','0','SoldBy object (0)',1,'[{\"added\": {}}]',23,1),(14,'2022-02-05 06:49:54.070409','0','SoldBy object (0)',1,'[{\"added\": {}}]',23,1),(15,'2022-02-05 07:44:23.090255','1','SoldBy object (1)',1,'[{\"added\": {}}]',23,1),(16,'2022-02-05 07:44:39.043693','2','SoldBy object (2)',1,'[{\"added\": {}}]',23,1),(17,'2022-02-05 07:45:06.694428','3','SoldBy object (3)',1,'[{\"added\": {}}]',23,1),(18,'2022-02-05 07:45:40.629631','4','SoldBy object (4)',1,'[{\"added\": {}}]',23,1),(19,'2022-02-20 13:00:51.500104','1','Purchases object (1)',1,'[{\"added\": {}}]',22,1),(20,'2022-02-20 13:03:22.790962','2','Purchases object (2)',1,'[{\"added\": {}}]',22,1),(21,'2022-02-20 14:24:17.028758','5','SoldBy object (5)',3,'',23,1),(22,'2022-02-26 04:47:43.357891','18','gedwa',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',4,1),(23,'2022-02-26 04:47:53.019263','17','1234-5678-1234',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',4,1),(24,'2022-02-26 05:16:59.198135','17','1234-5678-1234',2,'[{\"changed\": {\"fields\": [\"Superuser status\"]}}]',4,1),(25,'2022-02-26 05:17:05.552333','18','gedwa',2,'[{\"changed\": {\"fields\": [\"Superuser status\"]}}]',4,1),(26,'2022-02-26 11:21:02.384204','2','Purchases object (2)',3,'',22,18),(27,'2022-02-26 11:21:02.391339','1','Purchases object (1)',3,'',22,18),(28,'2022-02-26 12:50:01.947704','2','ConsumerCart object (2)',3,'',16,18),(29,'2022-02-26 16:37:35.405696','6','Purchases object (6)',3,'',22,18),(30,'2022-02-28 11:55:21.622911','10','SoldBy object (10)',3,'',23,17),(31,'2022-02-28 12:20:29.403528','19','3467-1475-2176',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'greenmarket','authgroup'),(10,'greenmarket','authgrouppermissions'),(11,'greenmarket','authpermission'),(12,'greenmarket','authuser'),(13,'greenmarket','authusergroups'),(14,'greenmarket','authuseruserpermissions'),(15,'greenmarket','chatcommunication'),(16,'greenmarket','consumercart'),(17,'greenmarket','customer'),(18,'greenmarket','djangoadminlog'),(19,'greenmarket','djangocontenttype'),(20,'greenmarket','djangomigrations'),(21,'greenmarket','djangosession'),(7,'greenmarket','farmer'),(25,'greenmarket','produc'),(8,'greenmarket','product'),(22,'greenmarket','purchases'),(24,'greenmarket','sold'),(23,'greenmarket','soldby'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-01-23 06:51:40.184965'),(2,'auth','0001_initial','2022-01-23 06:51:41.407151'),(3,'admin','0001_initial','2022-01-23 06:51:41.650752'),(4,'admin','0002_logentry_remove_auto_add','2022-01-23 06:51:41.677298'),(5,'admin','0003_logentry_add_action_flag_choices','2022-01-23 06:51:41.690704'),(6,'contenttypes','0002_remove_content_type_name','2022-01-23 06:51:41.848992'),(7,'auth','0002_alter_permission_name_max_length','2022-01-23 06:51:41.977425'),(8,'auth','0003_alter_user_email_max_length','2022-01-23 06:51:42.028199'),(9,'auth','0004_alter_user_username_opts','2022-01-23 06:51:42.044046'),(10,'auth','0005_alter_user_last_login_null','2022-01-23 06:51:42.117625'),(11,'auth','0006_require_contenttypes_0002','2022-01-23 06:51:42.123289'),(12,'auth','0007_alter_validators_add_error_messages','2022-01-23 06:51:42.137391'),(13,'auth','0008_alter_user_username_max_length','2022-01-23 06:51:42.252885'),(14,'auth','0009_alter_user_last_name_max_length','2022-01-23 06:51:42.375672'),(15,'auth','0010_alter_group_name_max_length','2022-01-23 06:51:42.421811'),(16,'auth','0011_update_proxy_permissions','2022-01-23 06:51:42.440223'),(17,'auth','0012_alter_user_first_name_max_length','2022-01-23 06:51:42.527665'),(18,'sessions','0001_initial','2022-01-23 06:51:42.588238'),(19,'greenmarket','0001_initial','2022-02-04 07:04:02.523097'),(20,'greenmarket','0002_remove_sold_id_alter_sold_price','2022-02-04 07:05:33.913878'),(21,'greenmarket','0003_delete_chatcommunication_delete_consumercart_and_more','2022-02-04 07:26:17.557894'),(22,'greenmarket','0004_delete_sold','2022-02-04 07:26:53.932448'),(23,'greenmarket','0002_delete_sold_delete_chatcommunication_and_more','2022-02-04 07:41:42.275254'),(24,'greenmarket','0003_alter_product_category_alter_product_img_and_more','2022-02-04 07:44:59.206829'),(25,'greenmarket','0004_produc_delete_product','2022-02-04 07:44:59.213696'),(26,'greenmarket','0002_product','2022-02-04 08:34:30.471296'),(27,'greenmarket','0003_chatcommunication_consumercart_purchases_soldby_and_more','2022-02-04 09:27:52.068952'),(28,'greenmarket','0004_alter_product_img','2022-02-04 09:28:20.647688'),(29,'greenmarket','0005_alter_product_img','2022-02-04 09:30:13.519968');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2gzkp5r1etwvdjky35sf7hupm3n4qjav','.eJxVjLsOwjAMAP8lM4oc0-CEkZ1viOw8aAElUtNOiH9HRR1gvTvdSwVelzGsPc9hSuqsDKnDLxSOj1w3k-5cb03HVpd5Er0lerddX1vKz8ve_g1G7uP3W-zgnVgEZkJLIsUIYjIZMsPgAY_g46kYpGiBPQI4B0LkhyiF1PsD7Qk3NA:1oMiLb:imCOkbd2d4QDH6ejE_nf2mRHqbbtKSwedFu0X2cuQ0g','2022-08-27 04:02:03.900693'),('8lfh1xicr3znn0hl9hw5wuci3b08sr18','.eJxVjLsOwjAMAP8lM4oc0-CEkZ1viOw8aAElUtNOiH9HRR1gvTvdSwVelzGsPc9hSuqsDKnDLxSOj1w3k-5cb03HVpd5Er0lerddX1vKz8ve_g1G7uP3W-zgnVgEZkJLIsUIYjIZMsPgAY_g46kYpGiBPQI4B0LkhyiF1PsD7Qk3NA:1nJa6x:Y6FhGaDXAmVHLG5lAfqW9lQ1a6Qi7H5v7A6Z9MH7BLA','2022-02-28 12:05:43.347616'),('eahnbql7mcmjf8tm2abdwxbwjm3zxlab','.eJxVjLsOwjAMAP8lM4oc0-CEkZ1viOw8aAElUtNOiH9HRR1gvTvdSwVelzGsPc9hSuqsDKnDLxSOj1w3k-5cb03HVpd5Er0lerddX1vKz8ve_g1G7uP3W-zgnVgEZkJLIsUIYjIZMsPgAY_g46kYpGiBPQI4B0LkhyiF1PsD7Qk3NA:1nRFEl:gTS8OP_c8vEUE-ac1VS6OY1LG8RITHRKzJpNdWkj_oM','2022-03-21 15:25:27.951204'),('gg1s1tfwrswrlfhwoaprtwtbuf71yn8s','.eJxVjMEOgjAQRP-lZ9NsKbDUo3e-gcyyraAGEgon478LCQc9zrw38zYdtnXothyXblRzNa4xl99S0D_jdBB9YLrPtp-ndRnFHoo9abbtrPF1O92_gwF52NcNu6qsBBxTEhSasAdXM4pECPC-Jg4UQdF7ogApnYJZuJakFNR8viHMOLE:1oyaXx:Iyw5VWu8Y_A-E1RhhhkxQU80fGwOvnJjwOnEODgsjow','2022-12-09 15:23:21.891953'),('swzhzs8vtjw428sf4sldd2nq23wgmw8t','.eJxVjM0OwiAQhN-FsyEsK5T16N1nIMtPpWogKe3J-O62SQ-azGm-b-YtPK9L8WvPs5-SuAgUp98ucHzmuoP04HpvMra6zFOQuyIP2uWtpfy6Hu7fQeFetrVGQAzWgqNzVillJHRg48hACgajDNkt2qloRh4cMDhDDrQlCyGQ-HwBo6Y2Bw:1nETVQ:j0aJjfOr8HsHSM04bbHNpDJEP7KUaW5jsloxgLHtH0Y','2022-02-14 10:01:52.472412'),('xf95zbgn2dxazqyvfsjh3wvp30frvyy0','.eJxVjMEOgjAQRP-lZ9NsKbDUo3e-gcyyraAGEgon478LCQc9zrw38zYdtnXothyXblRzNa4xl99S0D_jdBB9YLrPtp-ndRnFHoo9abbtrPF1O92_gwF52NcNu6qsBBxTEhSasAdXM4pECPC-Jg4UQdF7ogApnYJZuJakFNR8viHMOLE:1nh6ee:Le6DiDmI4cjb6otoUZrvJPpHA8HISIYNouW1N3Lc46Q','2022-05-04 09:29:44.951752');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-06 20:50:55
