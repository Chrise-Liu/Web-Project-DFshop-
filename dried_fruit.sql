-- MySQL dump 10.13  Distrib 5.7.32, for Linux (x86_64)
--
-- Host: localhost    Database: dried_fruit
-- ------------------------------------------------------
-- Server version	5.7.32-0ubuntu0.18.04.1

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
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user model',7,'add_usermodel'),(20,'Can change user model',7,'change_usermodel'),(21,'Can delete user model',7,'delete_usermodel'),(22,'Can add product model',8,'add_productmodel'),(23,'Can change product model',8,'change_productmodel'),(24,'Can delete product model',8,'delete_productmodel'),(25,'Can add cart model',9,'add_cartmodel'),(26,'Can change cart model',9,'change_cartmodel'),(27,'Can delete cart model',9,'delete_cartmodel'),(28,'Can add order model',10,'add_ordermodel'),(29,'Can change order model',10,'change_ordermodel'),(30,'Can delete order model',10,'delete_ordermodel'),(31,'Can add order detail model',11,'add_orderdetailmodel'),(32,'Can change order detail model',11,'change_orderdetailmodel'),(33,'Can delete order detail model',11,'delete_orderdetailmodel');
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
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$8CGtRiT7I20A$QPr9zJH9edVdWdepEtSdGO3Ad7uBfOU1HlFrboUWs4s=','2020-11-11 03:50:10.861538',1,'work','','','xxx@gmail.com',1,1,'2020-11-04 12:55:03.256487');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-11-05 01:45:15.053243','1','yuhsuan',2,'[]',7,1),(2,'2020-11-05 06:56:53.476037','3','test01',3,'',7,1),(3,'2020-11-06 10:12:11.559351','1','懷舊古早味鳳梨果乾',1,'[{\"added\": {}}]',8,1),(4,'2020-11-06 10:12:35.052132','1','懷舊古早味鳳梨果乾',2,'[{\"changed\": {\"fields\": [\"pdiscription\"]}}]',8,1),(5,'2020-11-06 10:31:31.724977','1','懷舊古早味鳳梨果乾',2,'[{\"changed\": {\"fields\": [\"pimage\"]}}]',8,1),(6,'2020-11-06 10:31:41.231323','1','懷舊古早味鳳梨果乾',2,'[]',8,1),(7,'2020-11-06 10:38:47.273671','1','懷舊古早味鳳梨果乾',2,'[{\"changed\": {\"fields\": [\"pimage\"]}}]',8,1),(8,'2020-11-06 10:38:51.407641','1','懷舊古早味鳳梨果乾',2,'[]',8,1),(9,'2020-11-06 10:39:53.221894','1','懷舊古早味鳳梨果乾',2,'[{\"changed\": {\"fields\": [\"pimage\"]}}]',8,1),(10,'2020-11-06 10:45:54.647281','2','甘甜芭樂果乾(白心)',1,'[{\"added\": {}}]',8,1),(11,'2020-11-06 10:46:20.727377','3','甘甜芭樂果乾(紅心)',1,'[{\"added\": {}}]',8,1),(12,'2020-11-06 10:47:31.591224','4','愛文芒果乾',1,'[{\"added\": {}}]',8,1),(13,'2020-11-06 10:48:24.128878','5','脆皮香蕉乾',1,'[{\"added\": {}}]',8,1),(14,'2020-11-06 10:49:09.440023','6','酸甜檸檬果乾',1,'[{\"added\": {}}]',8,1),(15,'2020-11-06 10:54:36.606916','1','懷舊古早味鳳梨果乾',2,'[]',8,1),(16,'2020-11-06 10:54:40.219261','2','甘甜芭樂果乾(白心)',2,'[]',8,1),(17,'2020-11-07 08:48:36.936302','1','懷舊古早味鳳梨果乾',2,'[{\"changed\": {\"fields\": [\"pdescription\"]}}]',8,1),(18,'2020-11-07 08:49:06.423792','1','懷舊古早味鳳梨果乾',2,'[{\"changed\": {\"fields\": [\"pdescription\"]}}]',8,1),(19,'2020-11-07 08:49:28.355700','1','懷舊古早味鳳梨果乾',2,'[{\"changed\": {\"fields\": [\"pdescription\"]}}]',8,1),(20,'2020-11-07 08:49:56.472225','1','懷舊古早味鳳梨果乾',2,'[{\"changed\": {\"fields\": [\"pdescription\"]}}]',8,1),(21,'2020-11-07 08:50:02.359296','1','懷舊古早味鳳梨果乾',2,'[]',8,1),(22,'2020-11-07 08:50:06.972827','6','酸甜檸檬果乾',2,'[{\"changed\": {\"fields\": [\"pdescription\"]}}]',8,1),(23,'2020-11-07 08:50:10.719572','5','脆皮香蕉乾',2,'[{\"changed\": {\"fields\": [\"pdescription\"]}}]',8,1),(24,'2020-11-07 08:50:14.569319','4','愛文芒果乾',2,'[{\"changed\": {\"fields\": [\"pdescription\"]}}]',8,1),(25,'2020-11-07 08:50:17.922724','3','甘甜芭樂果乾(紅心)',2,'[{\"changed\": {\"fields\": [\"pdescription\"]}}]',8,1),(26,'2020-11-07 08:50:21.364778','2','甘甜芭樂果乾(白心)',2,'[{\"changed\": {\"fields\": [\"pdescription\"]}}]',8,1),(27,'2020-11-07 08:50:29.407409','1','懷舊古早味鳳梨果乾',2,'[]',8,1),(28,'2020-11-09 03:56:07.224908','6','test01',2,'[]',9,1),(29,'2020-11-09 03:56:20.292443','7','test01',3,'',9,1),(30,'2020-11-09 03:56:20.307579','6','test01',3,'',9,1),(31,'2020-11-09 03:56:20.309735','5','test01',3,'',9,1),(32,'2020-11-09 03:56:20.311628','4','test01',3,'',9,1),(33,'2020-11-09 03:56:20.315864','3','test01',3,'',9,1),(34,'2020-11-09 03:56:20.321978','2','test01',3,'',9,1),(35,'2020-11-09 03:56:20.324773','1','test01',3,'',9,1),(36,'2020-11-09 04:01:00.932894','9','test01',3,'',9,1),(37,'2020-11-09 04:01:00.938838','8','test01',3,'',9,1),(38,'2020-11-09 04:01:41.014422','10','test01',3,'',9,1),(39,'2020-11-09 08:08:03.640796','12','test01',3,'',9,1),(40,'2020-11-09 08:21:38.453729','16','test01',3,'',9,1),(41,'2020-11-09 08:22:37.692498','3','甘甜紅心芭樂果乾',2,'[{\"changed\": {\"fields\": [\"pname\"]}}]',8,1),(42,'2020-11-09 08:22:46.956068','2','甘甜白心芭樂果乾',2,'[{\"changed\": {\"fields\": [\"pname\"]}}]',8,1),(43,'2020-11-10 06:21:16.476509','5','test02',2,'[{\"changed\": {\"fields\": [\"username\"]}}]',7,1),(44,'2020-11-10 10:37:08.167172','1','1091100001',3,'',10,1),(45,'2020-11-10 10:47:10.148045','7','1091100004',3,'',10,1),(46,'2020-11-10 10:47:10.152117','6','1091100001',3,'',10,1),(47,'2020-11-10 10:47:10.154755','5','1091100001',3,'',10,1),(48,'2020-11-10 10:47:10.157312','4','1091100003',3,'',10,1),(49,'2020-11-10 10:47:10.159683','3','1091100002',3,'',10,1),(50,'2020-11-10 10:47:10.168511','2','1091100001',3,'',10,1),(51,'2020-11-11 06:42:51.922039','12','1091100005',3,'',10,1),(52,'2020-11-11 06:42:51.927484','11','1091100004',3,'',10,1),(53,'2020-11-11 06:42:51.930504','10','1091100003',3,'',10,1),(54,'2020-11-11 06:42:51.933537','9','1091100002',3,'',10,1),(55,'2020-11-11 06:42:51.935396','8','1091100001',3,'',10,1),(56,'2020-11-11 06:50:22.555479','14','1091100002',3,'',10,1),(57,'2020-11-11 06:50:22.561720','13','1091100001',3,'',10,1),(58,'2020-11-11 09:23:10.408651','15','1091100001',3,'',10,1),(59,'2020-11-11 10:48:45.975501','18','1091100003',3,'',10,1),(60,'2020-11-12 05:30:29.356229','11','1091100004',3,'',11,1),(61,'2020-11-12 05:30:29.361377','10','1091100004',3,'',11,1),(62,'2020-11-12 05:30:29.367073','9','1091100003',3,'',11,1),(63,'2020-11-12 05:30:29.368424','8','1091100003',3,'',11,1),(64,'2020-11-12 05:30:29.370421','7','1091100003',3,'',11,1),(65,'2020-11-12 05:30:29.371898','6','1091100002',3,'',11,1),(66,'2020-11-12 05:30:29.373407','5','1091100002',3,'',11,1),(67,'2020-11-12 05:30:29.375286','4','1091100002',3,'',11,1),(68,'2020-11-12 05:30:29.379736','3','1091100001',3,'',11,1),(69,'2020-11-12 05:30:29.381217','2','1091100001',3,'',11,1),(70,'2020-11-12 05:30:29.383588','1','1091100001',3,'',11,1),(71,'2020-11-12 05:30:37.789900','19','1091100004',3,'',10,1),(72,'2020-11-12 05:30:37.796602','17','1091100002',3,'',10,1),(73,'2020-11-12 05:30:37.799953','16','1091100001',3,'',10,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'product','cartmodel'),(11,'product','orderdetailmodel'),(10,'product','ordermodel'),(8,'product','productmodel'),(6,'sessions','session'),(7,'user','usermodel');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-11-03 12:53:07.171737'),(2,'auth','0001_initial','2020-11-03 12:53:07.752625'),(3,'admin','0001_initial','2020-11-03 12:53:07.862641'),(4,'admin','0002_logentry_remove_auto_add','2020-11-03 12:53:07.875608'),(5,'contenttypes','0002_remove_content_type_name','2020-11-03 12:53:07.947186'),(6,'auth','0002_alter_permission_name_max_length','2020-11-03 12:53:07.995983'),(7,'auth','0003_alter_user_email_max_length','2020-11-03 12:53:08.044007'),(8,'auth','0004_alter_user_username_opts','2020-11-03 12:53:08.051287'),(9,'auth','0005_alter_user_last_login_null','2020-11-03 12:53:08.091842'),(10,'auth','0006_require_contenttypes_0002','2020-11-03 12:53:08.095430'),(11,'auth','0007_alter_validators_add_error_messages','2020-11-03 12:53:08.102306'),(12,'auth','0008_alter_user_username_max_length','2020-11-03 12:53:08.190998'),(13,'sessions','0001_initial','2020-11-03 12:53:08.226591'),(14,'user','0001_initial','2020-11-04 12:56:58.042765'),(15,'user','0002_auto_20201105_0931','2020-11-05 01:31:31.484772'),(16,'product','0001_initial','2020-11-06 10:05:11.564500'),(17,'product','0002_auto_20201106_1836','2020-11-06 10:36:48.988527'),(18,'product','0003_auto_20201106_1838','2020-11-06 10:38:27.341746'),(19,'product','0004_auto_20201107_1647','2020-11-07 08:47:16.387688'),(20,'product','0005_cartmodel','2020-11-09 02:46:43.314534'),(21,'product','0006_cartmodel_pname','2020-11-09 04:00:50.426588'),(22,'product','0007_ordermodel','2020-11-10 07:18:05.944369'),(23,'product','0008_auto_20201110_1803','2020-11-10 10:04:02.744704'),(24,'product','0009_auto_20201111_1451','2020-11-11 06:51:53.329083'),(25,'product','0010_auto_20201111_1722','2020-11-11 09:22:54.401851');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2dhcmrjodkpwkjum8t464iudlytzhcsa','MDdlYmM1ODc5OWNjMWU2Y2ViNTAxZTk4YjgyNTU4Y2Q4ZTE3OTU1OTp7Il9zZXNzaW9uX2V4cGlyeSI6ODY0MDAsInVzZXJuYW1lIjoidGVzdDAxIn0=','2020-11-10 01:46:00.125014'),('4u3jmd7irtjeq66h9pipzimlzqht11j8','OWE3MjRiZTc0ZWIyMjMwNmI3Yzk3ZmNjNzAwNGE4NGVkNzUxY2E5YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MTAxMGRkNWZjZjc0ZDk0Y2IyNjc2ODFlMTFjMGFjZTgyMTYxMzUwIn0=','2020-11-20 10:39:47.311426'),('8hnwzr9xgq1tzeutpzn65vtq6dzxewh7','OWE3MjRiZTc0ZWIyMjMwNmI3Yzk3ZmNjNzAwNGE4NGVkNzUxY2E5YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MTAxMGRkNWZjZjc0ZDk0Y2IyNjc2ODFlMTFjMGFjZTgyMTYxMzUwIn0=','2020-11-19 01:20:54.516630'),('8s9rtv1mbrl7lg1jil6ko2n2t4odnrrx','OGY2ZTk3NGRhODVlZWE3OTRjNDEyN2U4YTY1YWE2Zjg4ZmNjMGI0OTp7Il9zZXNzaW9uX2V4cGlyeSI6ODY0MDAsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MTAxMGRkNWZjZjc0ZDk0Y2IyNjc2ODFlMTFjMGFjZTgyMTYxMzUwIiwidXNlcm5hbWUiOiJ0ZXN0MDEifQ==','2020-11-11 03:02:24.774153'),('8xns68rj0srcd6sdio53ptqlapoueeu5','OWE3MjRiZTc0ZWIyMjMwNmI3Yzk3ZmNjNzAwNGE4NGVkNzUxY2E5YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MTAxMGRkNWZjZjc0ZDk0Y2IyNjc2ODFlMTFjMGFjZTgyMTYxMzUwIn0=','2020-11-19 06:07:10.927161'),('942v7jdmnco0jemebfaqvn82jyylq46v','MjVmZTkzZjIzNzA1YjQyNzllODExYmEzZmM5OGE0ZDhkN2YzZGYyZTp7Il9zZXNzaW9uX2V4cGlyeSI6ODY0MDAsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MTAxMGRkNWZjZjc0ZDk0Y2IyNjc2ODFlMTFjMGFjZTgyMTYxMzUwIiwidXNlcm5hbWUiOiJcdTVjMGZcdTU0NDYifQ==','2020-11-13 05:55:24.379654'),('a237s1p9bwxoo5wurx7uhgfsh3ajot8f','OGRiYjAxNmVmMmU1ZWZiODcxYWU3ZWIwOWI1ZmVjM2Y4YjUzYWNlMjp7InVzZXJuYW1lIjoidGVzdDAxIiwiX3Nlc3Npb25fZXhwaXJ5Ijo4NjQwMCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjYxMDEwZGQ1ZmNmNzRkOTRjYjI2NzY4MWUxMWMwYWNlODIxNjEzNTAifQ==','2020-11-10 08:27:32.073909'),('a7kmz1g3ecmukjrn8ngtm6mjy43ab5f6','OWE3MjRiZTc0ZWIyMjMwNmI3Yzk3ZmNjNzAwNGE4NGVkNzUxY2E5YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MTAxMGRkNWZjZjc0ZDk0Y2IyNjc2ODFlMTFjMGFjZTgyMTYxMzUwIn0=','2020-11-20 10:44:51.393593'),('crnb1j5rb4zyfzdfsyagujpifkvnq7a4','MTAxYmMwM2EyYjAzNGQ3OTk0ZjNmMDY2ZjBhZjZlNTQxYTAxNjcxNjp7InVzZXJuYW1lIjoidGVzdDAxIiwiX3Nlc3Npb25fZXhwaXJ5Ijo4NjQwMH0=','2020-11-10 08:31:24.987136'),('hpj97knddvisu75tumfhj528tbkdnmhy','MTAxYmMwM2EyYjAzNGQ3OTk0ZjNmMDY2ZjBhZjZlNTQxYTAxNjcxNjp7InVzZXJuYW1lIjoidGVzdDAxIiwiX3Nlc3Npb25fZXhwaXJ5Ijo4NjQwMH0=','2020-11-12 02:32:04.706514'),('k39313qdeghpsls1zm561ev87ivamcy2','OGY2ZTk3NGRhODVlZWE3OTRjNDEyN2U4YTY1YWE2Zjg4ZmNjMGI0OTp7Il9zZXNzaW9uX2V4cGlyeSI6ODY0MDAsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MTAxMGRkNWZjZjc0ZDk0Y2IyNjc2ODFlMTFjMGFjZTgyMTYxMzUwIiwidXNlcm5hbWUiOiJ0ZXN0MDEifQ==','2020-11-10 03:34:43.726391'),('lh797k7ktkwvl71pj9zki1588yq0v870','NDMwMWU0Y2VjYTQxYzE2ZTI0YmZlZTlmZTM1NTZkMzc1ZjQ3ZWI5Mzp7Il9zZXNzaW9uX2V4cGlyeSI6ODY0MDB9','2020-11-10 01:53:44.358568'),('myy87fprhuyslr68oclbh3f1havwklfa','OWE3MjRiZTc0ZWIyMjMwNmI3Yzk3ZmNjNzAwNGE4NGVkNzUxY2E5YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MTAxMGRkNWZjZjc0ZDk0Y2IyNjc2ODFlMTFjMGFjZTgyMTYxMzUwIn0=','2020-11-20 10:06:32.771261'),('q3pi37rujakskx6muilim97d8i8xz9kd','NTE3NDUzY2YwZTFmODgwMDgxYjk4YTkwMjZjYWY2NGQ4MTdjNThjMDp7Il9zZXNzaW9uX2V4cGlyeSI6ODY0MDAsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MTAxMGRkNWZjZjc0ZDk0Y2IyNjc2ODFlMTFjMGFjZTgyMTYxMzUwIn0=','2020-11-06 06:58:50.144665'),('r2sq05dj6g7x2itdrl9a1y2rhn26jm1e','MTAxYmMwM2EyYjAzNGQ3OTk0ZjNmMDY2ZjBhZjZlNTQxYTAxNjcxNjp7InVzZXJuYW1lIjoidGVzdDAxIiwiX3Nlc3Npb25fZXhwaXJ5Ijo4NjQwMH0=','2020-11-10 04:19:38.107055'),('rqgfz0o8s8shtgasz9lqz0t2a5l3le6t','OWE3MjRiZTc0ZWIyMjMwNmI3Yzk3ZmNjNzAwNGE4NGVkNzUxY2E5YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MTAxMGRkNWZjZjc0ZDk0Y2IyNjc2ODFlMTFjMGFjZTgyMTYxMzUwIn0=','2020-11-20 10:54:27.601771'),('ryv1stfspb1ntwfy7tn59mrtmeqpasa7','OGY2ZTk3NGRhODVlZWE3OTRjNDEyN2U4YTY1YWE2Zjg4ZmNjMGI0OTp7Il9zZXNzaW9uX2V4cGlyeSI6ODY0MDAsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MTAxMGRkNWZjZjc0ZDk0Y2IyNjc2ODFlMTFjMGFjZTgyMTYxMzUwIiwidXNlcm5hbWUiOiJ0ZXN0MDEifQ==','2020-11-11 10:26:19.589108'),('v9yjtc6nsc5ubc8lxot3yvdu074xumbj','OWE3MjRiZTc0ZWIyMjMwNmI3Yzk3ZmNjNzAwNGE4NGVkNzUxY2E5YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MTAxMGRkNWZjZjc0ZDk0Y2IyNjc2ODFlMTFjMGFjZTgyMTYxMzUwIn0=','2020-11-18 12:57:25.160797'),('vdr271ixyi5yz5wcygj9t5323etj6qxg','OGRiYjAxNmVmMmU1ZWZiODcxYWU3ZWIwOWI1ZmVjM2Y4YjUzYWNlMjp7InVzZXJuYW1lIjoidGVzdDAxIiwiX3Nlc3Npb25fZXhwaXJ5Ijo4NjQwMCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjYxMDEwZGQ1ZmNmNzRkOTRjYjI2NzY4MWUxMWMwYWNlODIxNjEzNTAifQ==','2020-11-11 13:40:30.996258'),('vgosz5o0fir64t2te8u1n02liabbij7k','N2YxNWJjODNhMGM5MjhlODhjZTg2ZmMyNzEzMGRiMTc2NmNjZjI5NDp7Il9zZXNzaW9uX2V4cGlyeSI6ODY0MDAsInVzZXJuYW1lIjoiXHU1YzBmXHU1NDQ2In0=','2020-11-14 15:01:34.605290'),('vi14x1mz933it12v39c5oasrsxv7km4t','ZjJiOGM1MDg0ZDAxZDk2ZGQ0M2I4NzBlYmNjZmRlYjJiYjI2YjA1ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MTAxMGRkNWZjZjc0ZDk0Y2IyNjc2ODFlMTFjMGFjZTgyMTYxMzUwIiwiX3Nlc3Npb25fZXhwaXJ5Ijo4NjQwMCwidXNlcm5hbWUiOiJ0ZXN0MDEifQ==','2020-11-09 06:28:57.987860'),('vmct0suc0aexpz524na48w1mh12foi4e','MTAxYmMwM2EyYjAzNGQ3OTk0ZjNmMDY2ZjBhZjZlNTQxYTAxNjcxNjp7InVzZXJuYW1lIjoidGVzdDAxIiwiX3Nlc3Npb25fZXhwaXJ5Ijo4NjQwMH0=','2020-11-10 08:34:49.009782');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_cartmodel`
--

DROP TABLE IF EXISTS `product_cartmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_cartmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` varchar(16) NOT NULL,
  `username` varchar(32) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `pname` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_cartmodel`
--

LOCK TABLES `product_cartmodel` WRITE;
/*!40000 ALTER TABLE `product_cartmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_cartmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_orderdetailmodel`
--

DROP TABLE IF EXISTS `product_orderdetailmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_orderdetailmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(16) NOT NULL,
  `pname` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_orderdetailmodel`
--

LOCK TABLES `product_orderdetailmodel` WRITE;
/*!40000 ALTER TABLE `product_orderdetailmodel` DISABLE KEYS */;
INSERT INTO `product_orderdetailmodel` VALUES (12,'1091100001','懷舊古早味鳳梨果乾',150,1,150),(13,'1091100001','甘甜紅心芭樂果乾',120,25,3000),(14,'1091100002','懷舊古早味鳳梨果乾',150,1,150),(15,'1091100003','甘甜白心芭樂果乾',150,2,300),(16,'1091100003','愛文芒果乾',160,8,1280),(17,'1091100004','懷舊古早味鳳梨果乾',150,1,150),(18,'1091100004','甘甜紅心芭樂果乾',120,1,120),(19,'1091100004','愛文芒果乾',160,1,160);
/*!40000 ALTER TABLE `product_orderdetailmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_ordermodel`
--

DROP TABLE IF EXISTS `product_ordermodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_ordermodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(16) NOT NULL,
  `userphone` varchar(50) NOT NULL,
  `useraddr` varchar(255) NOT NULL,
  `useremail` varchar(100) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `username` varchar(32) NOT NULL,
  `alltotal` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_ordermodel`
--

LOCK TABLES `product_ordermodel` WRITE;
/*!40000 ALTER TABLE `product_ordermodel` DISABLE KEYS */;
INSERT INTO `product_ordermodel` VALUES (20,'1091100001','0905321321','新北市林口樹蛙的窩','zmlpqawsa@gmail.com','2020-11-12 05:56:55.825531','小呆',3150),(21,'1091100002','0905321321','新北市林口樹蛙的窩','zmlpqawsa@gmail.com','2020-11-12 06:15:31.428499','小呆',150),(22,'1091100003','0900000123','測試用帳號test01','test01@gmail.com','2020-11-13 14:16:31.460568','test01',1580),(23,'1091100004','0905321321','新北市林口樹蛙的窩','zmlpqawsa@gmail.com','2020-11-13 15:09:28.444567','小呆',430);
/*!40000 ALTER TABLE `product_ordermodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_productmodel`
--

DROP TABLE IF EXISTS `product_productmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_productmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(100) NOT NULL,
  `pprice` int(11) NOT NULL,
  `pimage` varchar(100) NOT NULL,
  `pdescription` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_productmodel`
--

LOCK TABLES `product_productmodel` WRITE;
/*!40000 ALTER TABLE `product_productmodel` DISABLE KEYS */;
INSERT INTO `product_productmodel` VALUES (1,'懷舊古早味鳳梨果乾',150,'/static/images/f01.jpg','以天然、健康的方式製造，不添加防腐劑，利用完善的烘烤箱新鮮製作，不含其他添加物。\r\n因近日適達高溫及兩季氣候，貨運過程中的溫差及儲藏溫度提高，可能會使果干出現「糖解」現象，本情況尚屬正常，敬請安心食用。'),(2,'甘甜白心芭樂果乾',150,'/static/images/f02.jpg','以天然、健康的方式製造，不添加防腐劑，利用完善的烘烤箱新鮮製作，不含其他添加物。\r\n因近日適達高溫及兩季氣候，貨運過程中的溫差及儲藏溫度提高，可能會使果干出現「糖解」現象，本情況尚屬正常，敬請安心食用。'),(3,'甘甜紅心芭樂果乾',120,'/static/images/f06.jpg','以天然、健康的方式製造，不添加防腐劑，利用完善的烘烤箱新鮮製作，不含其他添加物。\r\n因近日適達高溫及兩季氣候，貨運過程中的溫差及儲藏溫度提高，可能會使果干出現「糖解」現象，本情況尚屬正常，敬請安心食用。'),(4,'愛文芒果乾',160,'/static/images/f03.jpg','以天然、健康的方式製造，不添加防腐劑，利用完善的烘烤箱新鮮製作，不含其他添加物。\r\n因近日適達高溫及兩季氣候，貨運過程中的溫差及儲藏溫度提高，可能會使果干出現「糖解」現象，本情況尚屬正常，敬請安心食用。'),(5,'脆皮香蕉乾',110,'/static/images/f04.jpg','以天然、健康的方式製造，不添加防腐劑，利用完善的烘烤箱新鮮製作，不含其他添加物。\r\n因近日適達高溫及兩季氣候，貨運過程中的溫差及儲藏溫度提高，可能會使果干出現「糖解」現象，本情況尚屬正常，敬請安心食用。'),(6,'酸甜檸檬果乾',170,'/static/images/f07.jpg','以天然、健康的方式製造，不添加防腐劑，利用完善的烘烤箱新鮮製作，不含其他添加物。\r\n因近日適達高溫及兩季氣候，貨運過程中的溫差及儲藏溫度提高，可能會使果干出現「糖解」現象，本情況尚屬正常，敬請安心食用。');
/*!40000 ALTER TABLE `product_productmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_usermodel`
--

DROP TABLE IF EXISTS `user_usermodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_usermodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(32) NOT NULL,
  `username` varchar(20) NOT NULL,
  `sex` varchar(2) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `addr` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_usermodel`
--

LOCK TABLES `user_usermodel` WRITE;
/*!40000 ALTER TABLE `user_usermodel` DISABLE KEYS */;
INSERT INTO `user_usermodel` VALUES (1,'lion@gmail.com','f23ea28a37ac08aa5e55f3985b9e805a','yuhsuan','W','0905322717','心北林口樹蛙'),(2,'chrise@gmail.com','fd806be420ed3280a46a50cab717d669','chrise','M','0975661010','最愛林口樹蛙'),(4,'test01@gmail.com','0e698a8ffc1a0af622c7b4db3cb750cc','test01','M','0900000123','測試用帳號test01'),(5,'test02@gmail.com','4d5e2a885578299e5a5902ad295447c6','test02','M','0905099005','測試用帳號test02'),(6,'zmlpqawsa@gmail.com','36013f58cdea0c6dbdb4a139a0d3c953','小呆','M','0905321321','新北市林口樹蛙的窩');
/*!40000 ALTER TABLE `user_usermodel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-14 23:19:22
