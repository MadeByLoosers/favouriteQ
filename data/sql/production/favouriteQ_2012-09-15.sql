-- MySQL dump 10.13  Distrib 5.5.24, for Linux (x86_64)
--
-- Host: localhost    Database: favouriteQ
-- ------------------------------------------------------
-- Server version	5.5.24

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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_bda51c3c` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_a7792de1` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
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
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_e4470c6e` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add question',7,'add_question'),(20,'Can change question',7,'change_question'),(21,'Can delete question',7,'delete_question'),(22,'Can add person',8,'add_person'),(23,'Can change person',8,'change_person'),(24,'Can delete person',8,'delete_person'),(25,'Can add answer',9,'add_answer'),(26,'Can change answer',9,'change_answer'),(27,'Can delete answer',9,'delete_answer'),(28,'Can add log entry',10,'add_logentry'),(29,'Can change log entry',10,'change_logentry'),(30,'Can delete log entry',10,'delete_logentry'),(31,'Can add migration history',11,'add_migrationhistory'),(32,'Can change migration history',11,'change_migrationhistory'),(33,'Can delete migration history',11,'delete_migrationhistory');
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
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'Gunt','','','admin@guntlondon.com','pbkdf2_sha256$10000$hoBtmOISdEAP$GERcWZ/74v7QBGbnW9Tw4w4nQR9bbSCS+qtYsagF8jg=',1,1,1,'2012-09-15 14:46:28','2012-08-25 16:03:12');
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
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_fbfc09f1` (`user_id`),
  KEY `auth_user_groups_bda51c3c` (`group_id`),
  CONSTRAINT `group_id_refs_id_f0ee9890` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_831107f1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_fbfc09f1` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_f2045483` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_fbfc09f1` (`user_id`),
  KEY `django_admin_log_e4470c6e` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2012-08-25 16:36:50',1,7,'2','What\'s your favourite cheese?',1,''),(2,'2012-08-25 16:37:20',1,7,'3','What\'s your favourite animal?',1,''),(3,'2012-08-25 16:37:36',1,7,'4','What\'s your favourite colour?',1,''),(4,'2012-08-25 16:37:48',1,7,'5','Who\'s your favourite Booth?',1,''),(5,'2012-08-25 16:37:56',1,7,'6','What\'s your favourite sandwich?',1,''),(6,'2012-08-25 16:38:02',1,7,'7','Who\'s your favourite Mike?',1,''),(7,'2012-08-25 16:38:09',1,7,'8','What\'s your favourite plant?',1,''),(8,'2012-08-25 16:38:15',1,7,'9','What\'s your favourite drink?',1,''),(9,'2012-08-25 16:38:22',1,7,'10','What\'s your favourite box?',1,''),(10,'2012-08-25 16:38:28',1,7,'11','What\'s your favourite beer?',1,''),(11,'2012-08-25 16:38:40',1,7,'12','Who\'s your favourite game show host?',1,''),(12,'2012-08-25 16:39:13',1,7,'12','Who\'s your sfavourite game show host?',2,'Changed question.'),(13,'2012-08-25 16:39:29',1,7,'12','Who\'s your favourite game show host?',2,'Changed question.'),(14,'2012-08-25 16:45:59',1,8,'1','petexgraham',1,''),(15,'2012-08-25 16:46:44',1,8,'2','thegingerbloke',1,''),(16,'2012-08-25 16:47:36',1,8,'3','caz_lock',1,''),(17,'2012-08-25 16:48:17',1,8,'4','jamesbooth',1,''),(18,'2012-08-25 16:48:38',1,9,'1','Stilton',1,''),(19,'2012-08-25 16:49:03',1,9,'2','Gouda',1,''),(20,'2012-08-25 16:49:16',1,9,'3','I don\'t like cheese',1,''),(21,'2012-08-25 16:49:36',1,9,'4','Brie',1,''),(22,'2012-08-25 16:49:49',1,9,'5','monkey',1,''),(23,'2012-08-25 16:50:28',1,9,'6','tiger',1,''),(24,'2012-08-25 16:50:45',1,7,'13','What\'s your favourite fish?',1,''),(25,'2012-08-25 16:51:12',1,9,'7','horse',1,''),(26,'2012-08-25 16:51:48',1,9,'8','Monkey',1,''),(27,'2012-08-25 16:52:56',1,7,'2','What\'s your favourite cheese?',2,'Changed asked_date.'),(28,'2012-08-25 16:53:17',1,7,'3','What\'s your favourite animal?',2,'Changed asked_date.'),(29,'2012-08-25 17:54:11',1,7,'3','What\'s your favourite animal?',2,'Changed asked_date.'),(30,'2012-08-25 17:54:28',1,7,'2','What\'s your favourite cheese?',2,'Changed asked_date.'),(31,'2012-08-25 17:55:03',1,8,'5','k0ng',1,''),(32,'2012-08-25 17:55:22',1,9,'9','Pony',1,''),(33,'2012-08-25 18:08:10',1,7,'14','What\'s your favourite indian dish?',1,''),(34,'2012-08-25 18:08:34',1,7,'2','What\'s your favourite cheese?',2,'Changed asked_date.'),(35,'2012-08-25 18:09:03',1,9,'10','Baby Bells',1,''),(36,'2012-08-26 18:59:41',1,9,'93','FISK',2,'Changed answer_text.'),(37,'2012-08-26 18:59:49',1,9,'92','Vanilla milkshake',2,'Changed answer_text.'),(38,'2012-08-31 14:05:36',1,9,'111','Jim Bowen',3,''),(39,'2012-08-31 15:43:43',1,7,'26','Cheese',3,''),(40,'2012-08-31 15:43:44',1,7,'25','Cheese',3,''),(41,'2012-08-31 15:43:53',1,7,'22','sadfadsfasdfasdadfs',3,''),(42,'2012-08-31 15:44:02',1,7,'18','What\'s your favourite supergrass song?',2,'Changed question.'),(43,'2012-08-31 15:44:19',1,7,'27','What\'s your favourite song?',2,'Changed approved.'),(44,'2012-09-03 09:45:37',1,7,'6','What\'s your favourite sandwich?',2,'Changed approved.'),(45,'2012-09-03 09:45:48',1,7,'28','what is your favourite head wear?',2,'Changed approved.'),(46,'2012-09-03 09:45:54',1,7,'24','What\'s your favourite key?',2,'Changed approved.'),(47,'2012-09-03 09:46:02',1,7,'13','What\'s your favourite fish?',2,'Changed approved.'),(48,'2012-09-03 09:46:18',1,7,'10','What\'s your favourite box?',2,'Changed approved.'),(49,'2012-09-03 09:46:23',1,7,'8','What\'s your favourite plant?',2,'Changed approved.'),(50,'2012-09-03 09:46:30',1,7,'7','Who\'s your favourite Mike?',2,'Changed approved.'),(51,'2012-09-11 15:35:28',1,7,'31','When is your favourite time?',2,'Changed priority and approved.'),(52,'2012-09-13 13:53:51',1,7,'30','What is your favourite type of flooring?',2,'Changed approved.'),(53,'2012-09-13 13:54:00',1,7,'29','What is your favourite punctuation mark?',2,'Changed approved.'),(54,'2012-09-14 09:28:34',1,7,'32','What is your favourite emoticon?',2,'Changed approved.'),(55,'2012-09-15 14:49:34',1,7,'34','What\'s your favourite cheese',1,''),(56,'2012-09-15 14:49:45',1,7,'35','What\'s your favourite unit of measurement',1,''),(57,'2012-09-15 14:50:01',1,7,'36','Who is your favourite duck',1,''),(58,'2012-09-15 14:50:09',1,7,'37','Who is your favourite German',1,''),(59,'2012-09-15 14:50:18',1,7,'38','What\'s your favourite dinosaur',1,''),(60,'2012-09-15 14:50:26',1,7,'39','What\'s your favourite duck joke',1,''),(61,'2012-09-15 14:50:33',1,7,'40','What\'s your favourite cheese joke',1,''),(62,'2012-09-15 14:50:43',1,7,'41','Who is your favourite animal?',1,''),(63,'2012-09-15 14:50:52',1,7,'42','Who\'s your favouite ginger',1,''),(64,'2012-09-15 14:51:00',1,7,'43','What\'s your favourite curry?',1,''),(65,'2012-09-15 14:51:09',1,7,'44','Who is your favourite inanimate object?',1,''),(66,'2012-09-15 14:51:19',1,7,'45','WHo is your favourite British Prime Minister from the 19th Century?',1,''),(67,'2012-09-15 14:51:27',1,7,'46','What\'s your favourite word?',1,''),(68,'2012-09-15 14:51:36',1,7,'47','What\'s your favourite police academy film?',1,''),(69,'2012-09-15 14:51:44',1,7,'48','Who is your favourite Charles?',1,''),(70,'2012-09-15 14:51:51',1,7,'49','Who is your favourite foot?',1,''),(71,'2012-09-15 14:51:59',1,7,'50','What is your favourite key?',1,''),(72,'2012-09-15 14:52:05',1,7,'51','What is your favourite size envelope?',1,''),(73,'2012-09-15 14:52:13',1,7,'52','What is your favourite bean?',1,''),(74,'2012-09-15 14:52:19',1,7,'53','Who\'s your favouite fish?',1,''),(75,'2012-09-15 14:52:25',1,7,'54','Who is your favourite queen',1,''),(76,'2012-09-15 14:52:31',1,7,'55','What is your favourite glue?',1,''),(77,'2012-09-15 14:52:36',1,7,'56','What is your favourite hat?',1,''),(78,'2012-09-15 14:52:44',1,7,'57','What is your favourite cereal?',1,''),(79,'2012-09-15 14:52:51',1,7,'58','What is your favourite colour?',1,''),(80,'2012-09-15 14:52:57',1,7,'59','Who is your favourite lord?',1,''),(81,'2012-09-15 14:53:04',1,7,'60','What is your favourite type of egg',1,''),(82,'2012-09-15 14:53:13',1,7,'61','What\'s your favourite highlighter pen',1,''),(83,'2012-09-15 14:53:20',1,7,'62','What\'s your favourite day',1,''),(84,'2012-09-15 14:53:29',1,7,'63','Who is your favourite prince',1,''),(85,'2012-09-15 14:53:36',1,7,'64','Who is your favourite Nelson',1,''),(86,'2012-09-15 14:53:44',1,7,'65','Who is/was your favourite character in Neighbours',1,''),(87,'2012-09-15 14:53:50',1,7,'66','What\'s your favourite sausage?',1,''),(88,'2012-09-15 14:53:58',1,7,'67','What is your favourite chair?',1,''),(89,'2012-09-15 14:54:05',1,7,'68','What is your favourite word?',1,''),(90,'2012-09-15 14:54:11',1,7,'69','What is your favourite french word?',1,''),(91,'2012-09-15 14:54:17',1,7,'70','What is your favourite german word?',1,''),(92,'2012-09-15 14:54:24',1,7,'71','Who is your favourite doctor?',1,''),(93,'2012-09-15 14:55:42',1,7,'72','Who is your favourite dictator?',1,''),(94,'2012-09-15 14:55:51',1,7,'73','Who is your favourite mass murderer?',1,''),(95,'2012-09-15 14:56:02',1,7,'74','What is your favourite road?',1,''),(96,'2012-09-15 14:56:09',1,7,'75','What\'s your favourite method of transport?',1,''),(97,'2012-09-15 14:56:15',1,7,'76','What\'s your favourite semi-aquatic egg-laying mammal?',1,''),(98,'2012-09-15 14:56:22',1,7,'77','What\'s your favourite Cephalopod?',1,''),(99,'2012-09-15 14:56:28',1,7,'78','Who is your favourite Wu-Tang member?',1,''),(100,'2012-09-15 14:56:36',1,7,'79','What\'s your favourite kind of sauce?',1,''),(101,'2012-09-15 14:56:43',1,7,'80','What\'s your favourite wire?',1,''),(102,'2012-09-15 14:56:50',1,7,'81','What\'s your favourite kind of light?',1,''),(103,'2012-09-15 14:56:59',1,7,'82','What\'s your favourite item of clothing?',1,''),(104,'2012-09-15 14:57:06',1,7,'83','What\'s your favourite type of neckline?',1,''),(105,'2012-09-15 14:57:13',1,7,'84','What\'s your favourite pill?',1,''),(106,'2012-09-15 14:57:18',1,7,'85','What\'s your favourite prescription drug?',1,''),(107,'2012-09-15 14:57:24',1,7,'86','What\'s your Guinness record record?',1,''),(108,'2012-09-15 14:57:31',1,7,'87','What\'s your favourite size',1,''),(109,'2012-09-15 14:57:39',1,7,'88','What\'s your favourite blind',1,''),(110,'2012-09-15 14:58:00',1,7,'89','What\'s your favourite brand',1,''),(111,'2012-09-15 14:58:10',1,7,'90','What\'s your favourite celebrity',1,''),(112,'2012-09-15 14:58:17',1,7,'91','What\'s your favourite type of roofing',1,''),(113,'2012-09-15 14:58:28',1,7,'92','What\'s your favourite charger',1,''),(114,'2012-09-15 14:58:35',1,7,'93','What\'s your favourite paint',1,''),(115,'2012-09-15 14:58:41',1,7,'94','What\'s your favourite crisp',1,''),(116,'2012-09-15 14:58:48',1,7,'95','What\'s your favourite weed',1,''),(117,'2012-09-15 14:58:58',1,7,'96','What\'s your favourite moustache',1,''),(118,'2012-09-15 14:59:07',1,7,'97','What\'s your favourite reptile',1,''),(119,'2012-09-15 14:59:15',1,7,'98','What\'s your favourite shellfish',1,''),(120,'2012-09-15 14:59:24',1,7,'99','What\'s your favourite pattern',1,''),(121,'2012-09-15 14:59:34',1,7,'100','What\'s your favourite rim',1,''),(122,'2012-09-15 14:59:42',1,7,'101','What\'s your favourite knicker',1,''),(123,'2012-09-15 14:59:49',1,7,'102','What\'s your favourite part of a pig',1,''),(124,'2012-09-15 15:00:03',1,7,'103','What\'s your favourite cake',1,''),(125,'2012-09-15 15:00:09',1,7,'104','Who\'s your favourite Daniel',1,''),(126,'2012-09-15 15:00:36',1,7,'104','Who\'s your favourite Daniel?',2,'Changed question and approved.'),(127,'2012-09-15 15:00:38',1,7,'104','Who\'s your favourite Daniel?',2,'No fields changed.'),(128,'2012-09-15 15:00:46',1,7,'103','What\'s your favourite cake?',2,'Changed question and approved.'),(129,'2012-09-15 15:00:53',1,7,'102','What\'s your favourite part of a pig?',2,'Changed question and approved.'),(130,'2012-09-15 15:01:03',1,7,'101','What\'s your favourite knicker?',2,'Changed question and approved.'),(131,'2012-09-15 15:01:11',1,7,'100','What\'s your favourite rim?',2,'Changed question and approved.'),(132,'2012-09-15 15:01:19',1,7,'99','What\'s your favourite pattern?',2,'Changed question and approved.'),(133,'2012-09-15 15:01:26',1,7,'98','What\'s your favourite shellfish?',2,'Changed question and approved.'),(134,'2012-09-15 15:01:35',1,7,'97','What\'s your favourite reptile?',2,'Changed question and approved.'),(135,'2012-09-15 15:01:51',1,7,'96','What\'s your favourite type of moustache?',2,'Changed question and approved.'),(136,'2012-09-15 15:01:58',1,7,'96','What\'s your favourite moustache?',2,'Changed question.'),(137,'2012-09-15 15:02:07',1,7,'95','What\'s your favourite weed?',2,'Changed question and approved.'),(138,'2012-09-15 15:02:34',1,7,'94','What\'s your favourite crisp?',2,'Changed question and approved.'),(139,'2012-09-15 15:02:44',1,7,'93','What\'s your favourite paint?',2,'Changed question and approved.'),(140,'2012-09-15 15:02:53',1,7,'92','What\'s your favourite charger?',2,'Changed question and approved.'),(141,'2012-09-15 15:03:10',1,7,'91','What\'s your favourite type of roofing?',2,'Changed question and approved.'),(142,'2012-09-15 15:03:22',1,7,'90','Who\'s your favourite celebrity?',2,'Changed question and approved.'),(143,'2012-09-15 15:03:29',1,7,'89','What\'s your favourite brand?',2,'Changed question and approved.'),(144,'2012-09-15 15:03:38',1,7,'88','What\'s your favourite blind?',2,'Changed question and approved.'),(145,'2012-09-15 15:03:46',1,7,'87','What\'s your favourite size?',2,'Changed question and approved.'),(146,'2012-09-15 15:04:01',1,7,'86','What\'s your favourite Guinness world record?',2,'Changed question and approved.'),(147,'2012-09-15 15:04:08',1,7,'85','What\'s your favourite prescription drug?',2,'Changed approved.'),(148,'2012-09-15 15:04:20',1,7,'84','What\'s your favourite pill?',2,'Changed approved.'),(149,'2012-09-15 15:04:26',1,7,'83','What\'s your favourite type of neckline?',2,'Changed approved.'),(150,'2012-09-15 15:04:38',1,7,'82','What\'s your favourite item of clothing?',2,'Changed approved.'),(151,'2012-09-15 15:04:47',1,7,'81','What\'s your favourite kind of light?',2,'Changed approved.'),(152,'2012-09-15 15:04:57',1,7,'80','What\'s your favourite wire?',2,'Changed approved.'),(153,'2012-09-15 15:05:06',1,7,'79','What\'s your favourite kind of sauce?',2,'Changed approved.'),(154,'2012-09-15 15:05:19',1,7,'78','Who\'s your favourite Wu-Tang member?',2,'Changed question and approved.'),(155,'2012-09-15 15:05:26',1,7,'77','What\'s your favourite Cephalopod?',2,'Changed approved.'),(156,'2012-09-15 15:05:34',1,7,'76','What\'s your favourite semi-aquatic egg-laying mammal?',2,'Changed approved.'),(157,'2012-09-15 15:05:40',1,7,'75','What\'s your favourite method of transport?',2,'Changed approved.'),(158,'2012-09-15 15:05:56',1,7,'74','What\'s your favourite road?',2,'Changed question and approved.'),(159,'2012-09-15 15:06:07',1,7,'73','Who\'s your favourite mass murderer?',2,'Changed question and approved.'),(160,'2012-09-15 15:06:18',1,7,'72','Who\'s your favourite dictator?',2,'Changed question and approved.'),(161,'2012-09-15 15:06:29',1,7,'71','Who\'s your favourite doctor?',2,'Changed question and approved.'),(162,'2012-09-15 15:06:41',1,7,'70','What\'s your favourite German word?',2,'Changed question and approved.'),(163,'2012-09-15 15:06:59',1,7,'69','What\'s your favourite French word?',2,'Changed question and approved.'),(164,'2012-09-15 15:07:11',1,7,'68','What\'s your favourite word?',2,'Changed question and approved.'),(165,'2012-09-15 15:07:22',1,7,'67','What\'s your favourite chair?',2,'Changed question and approved.'),(166,'2012-09-15 15:07:31',1,7,'66','What\'s your favourite sausage?',2,'Changed approved.'),(167,'2012-09-15 15:08:09',1,7,'65','Who\'s your favourite character from Neighbours?',2,'Changed question and approved.'),(168,'2012-09-15 15:08:24',1,7,'64','Who\'s your favourite Nelson?',2,'Changed question and approved.'),(169,'2012-09-15 15:08:38',1,7,'63','Who\'s your favourite prince?',2,'Changed question and approved.'),(170,'2012-09-15 15:08:48',1,7,'62','What\'s your favourite day?',2,'Changed question and priority.'),(171,'2012-09-15 15:09:07',1,7,'61','What\'s your favourite pen?',2,'Changed question and approved.'),(172,'2012-09-15 15:09:19',1,7,'60','What\'s your favourite type of egg?',2,'Changed question and approved.'),(173,'2012-09-15 15:09:33',1,7,'59','Who\'s your favourite lord?',2,'Changed question and approved.'),(174,'2012-09-15 15:09:43',1,7,'58','What\'s your favourite colour?',2,'Changed question and approved.'),(175,'2012-09-15 15:09:55',1,7,'57','What\'s your favourite cereal?',2,'Changed question and approved.'),(176,'2012-09-15 15:10:05',1,7,'56','What\'s your favourite hat?',2,'Changed question and approved.'),(177,'2012-09-15 15:10:20',1,7,'55','What\'s your favourite glue?',2,'Changed question and approved.'),(178,'2012-09-15 15:10:34',1,7,'54','Who\'s your favourite queen?',2,'Changed question and approved.'),(179,'2012-09-15 15:10:53',1,7,'53','What\'s your favourite fish?',2,'Changed question and approved.'),(180,'2012-09-15 15:11:26',1,7,'52','What\'s your favourite bean?',2,'Changed question and approved.'),(181,'2012-09-15 15:11:47',1,7,'51','What\'s your favourite size of envelope?',2,'Changed question and approved.'),(182,'2012-09-15 15:11:59',1,7,'50','What\'s your favourite key?',2,'Changed question and approved.'),(183,'2012-09-15 15:12:10',1,7,'49','Who\'s your favourite foot?',2,'Changed question and approved.'),(184,'2012-09-15 15:12:22',1,7,'48','Who\'s your favourite Charles?',2,'Changed question and approved.'),(185,'2012-09-15 15:12:40',1,7,'47','What\'s your favourite police academy film?',2,'Changed approved.'),(186,'2012-09-15 15:13:01',1,7,'46','What\'s your favourite word?',3,''),(187,'2012-09-15 15:13:19',1,7,'45','Who\'s your favourite British Prime Minister from the 19th Century?',2,'Changed question and approved.'),(188,'2012-09-15 15:13:34',1,7,'44','What\'s your favourite inanimate object?',2,'Changed question and approved.'),(189,'2012-09-15 15:13:47',1,7,'43','What\'s your favourite curry?',2,'Changed approved.'),(190,'2012-09-15 15:14:00',1,7,'42','Who\'s your favouite ginger?',2,'Changed question and approved.'),(191,'2012-09-15 15:14:14',1,7,'41','Who\'s your favourite animal?',2,'Changed question and approved.'),(192,'2012-09-15 15:14:27',1,7,'40','What\'s your favourite cheese joke?',2,'Changed question and approved.'),(193,'2012-09-15 15:14:36',1,7,'39','What\'s your favourite duck joke?',2,'Changed question and approved.'),(194,'2012-09-15 15:14:44',1,7,'38','What\'s your favourite dinosaur?',2,'Changed question and approved.'),(195,'2012-09-15 15:14:59',1,7,'37','Who is your favourite German?',2,'Changed question and approved.'),(196,'2012-09-15 15:15:13',1,7,'36','Who is your favourite duck?',2,'Changed question and approved.'),(197,'2012-09-15 15:15:27',1,7,'35','What\'s your favourite unit of measurement?',2,'Changed question and approved.'),(198,'2012-09-15 15:15:43',1,7,'34','What\'s your favourite cheese?',2,'Changed question and approved.'),(199,'2012-09-15 15:15:57',1,7,'33','What\'s the punch line to your favourite joke?',2,'Changed question, asked_date and approved.'),(200,'2012-09-15 15:16:08',1,7,'32','What\'s your favourite emoticon?',2,'Changed question.'),(201,'2012-09-15 15:16:36',1,7,'31','When\'s your favourite time?',2,'Changed question and priority.'),(202,'2012-09-15 15:16:48',1,7,'30','What\'s your favourite type of flooring?',2,'Changed question.'),(203,'2012-09-15 15:17:02',1,7,'29','What\'s your favourite punctuation mark?',2,'Changed question.'),(204,'2012-09-15 15:17:15',1,7,'28','What\'s your favourite head wear?',2,'Changed question.'),(205,'2012-09-15 15:17:38',1,7,'18','What\'s your favourite Supergrass song?',2,'Changed question.'),(206,'2012-09-15 15:17:46',1,7,'18','What\'s your favourite Supergrass song?',2,'Changed approved.'),(207,'2012-09-15 15:18:06',1,7,'16','What\'s your favourite breed of dog?',2,'Changed question.'),(208,'2012-09-15 15:18:16',1,7,'14','What\'s your favourite Indian dish?',2,'Changed question.'),(209,'2012-09-15 15:18:45',1,7,'53','What\'s your favourite fish?',3,''),(210,'2012-09-15 15:18:57',1,7,'11','What\'s your favourite beer?',2,'Changed approved.'),(211,'2012-09-15 15:19:20',1,7,'5','Who\'s your favourite Booth?',2,'Changed approved.'),(212,'2012-09-15 15:19:32',1,7,'4','What\'s your favourite colour?',2,'Changed priority and approved.'),(213,'2012-09-15 15:20:21',1,7,'41','Who\'s your favourite animal?',3,''),(214,'2012-09-15 15:20:21',1,7,'34','What\'s your favourite cheese?',3,''),(215,'2012-09-15 15:20:21',1,7,'4','What\'s your favourite colour?',3,'');
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
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'question','questions','question'),(8,'person','questions','person'),(9,'answer','questions','answer'),(10,'log entry','admin','logentry'),(11,'migration history','south','migrationhistory');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
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
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_c25c2c28` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1f495091ee264e45bc24981a374a8612','MmYyNDk0YmFkMGFkNWFjYjg3NDgyNjc4Y2Y4NWU0NzJhZjNmYzAzMzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-09-27 13:53:32'),('2ee8ca5eae2defdcf5949575d070f04d','MmYyNDk0YmFkMGFkNWFjYjg3NDgyNjc4Y2Y4NWU0NzJhZjNmYzAzMzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-09-12 15:11:40'),('5fc3e81bece63d0a0bc68739d9a6ac7a','Mzg5MGFiNTFiMTNjNWQ2YzA2ZTNhNzkyYTI2MmI5YTM3ZTg0MGNhMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-09-29 14:46:28'),('cbabd42b8373c604793c256d26b87559','Mzg5MGFiNTFiMTNjNWQ2YzA2ZTNhNzkyYTI2MmI5YTM3ZTg0MGNhMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-09-08 16:30:45'),('d49ae41a4a46c4b6a44732601e262730','Mzg5MGFiNTFiMTNjNWQ2YzA2ZTNhNzkyYTI2MmI5YTM3ZTg0MGNhMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-09-14 14:05:19'),('dba1e70fc0dc7d76811d8de174dcd5df','Mzg5MGFiNTFiMTNjNWQ2YzA2ZTNhNzkyYTI2MmI5YTM3ZTg0MGNhMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-09-17 09:45:18'),('fabd7e514b91749885799b2cb5e7d577','Mzg5MGFiNTFiMTNjNWQ2YzA2ZTNhNzkyYTI2MmI5YTM3ZTg0MGNhMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-09-15 10:06:15');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions_answer`
--

DROP TABLE IF EXISTS `questions_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `answer_text` varchar(200) NOT NULL DEFAULT '',
  `person_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `tweet_id` bigint(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `questions_answer_1f92e550` (`question_id`),
  KEY `questions_answer_21b911c5` (`person_id`),
  CONSTRAINT `person_id_refs_id_2685dfa8` FOREIGN KEY (`person_id`) REFERENCES `questions_person` (`id`),
  CONSTRAINT `question_id_refs_id_a2523e4d` FOREIGN KEY (`question_id`) REFERENCES `questions_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions_answer`
--

LOCK TABLES `questions_answer` WRITE;
/*!40000 ALTER TABLE `questions_answer` DISABLE KEYS */;
INSERT INTO `questions_answer` VALUES (1,2,'Stilton',1,'2012-08-25 16:48:38','2012-08-25 16:48:38',0),(2,2,'Gouda',4,'2012-08-25 16:49:03','2012-08-25 16:49:03',0),(3,2,'I don\'t like cheese',2,'2012-08-25 16:49:16','2012-08-25 16:49:16',0),(4,2,'Brie',3,'2012-08-25 16:49:36','2012-08-25 16:49:36',0),(5,3,'monkey',1,'2012-08-25 16:49:49','2012-08-25 16:49:49',0),(6,3,'tiger',3,'2012-08-25 16:50:28','2012-08-25 16:50:28',0),(7,3,'horse',2,'2012-08-25 16:51:12','2012-08-25 16:51:12',0),(8,3,'Monkey',4,'2012-08-25 16:51:48','2012-08-25 16:51:48',0),(9,3,'Pony',5,'2012-08-25 17:55:22','2012-08-25 17:55:22',0),(10,2,'Baby Bells',5,'2012-08-25 18:09:03','2012-08-25 18:09:03',0),(103,9,'Orange Juice',2,'2012-08-29 16:26:29','2012-08-29 16:26:29',239796989905227776),(104,9,'BEER',48,'2012-08-29 16:26:29','2012-08-29 16:26:29',239796492263624705),(105,9,'in particular stella! I love stella and a fight',47,'2012-08-29 16:26:29','2012-08-29 16:26:29',239786258585493504),(106,9,'Vanilla milkshake',4,'2012-08-29 16:26:29','2012-08-29 16:26:29',239784613373960192),(107,9,'FISK',2,'2012-08-29 16:26:29','2012-08-29 16:26:29',239782375473680385),(108,9,'beers! Lads love beers.',47,'2012-08-29 16:26:29','2012-08-29 16:26:29',239780467610644480),(109,14,'Jim Davidson',2,'2012-08-31 12:05:01','2012-08-31 12:05:01',240878729772015616),(110,14,'Needoo\'s mixed grill',4,'2012-08-31 12:05:01','2012-08-31 12:05:01',240862278302445568),(112,14,'Slow cooked dry meat.',5,'2012-08-31 14:35:34','2012-08-31 14:35:34',241510037472821248),(113,23,'pooh bear',47,'2012-08-31 14:40:22','2012-08-31 14:40:22',241545589609885697),(114,23,'Walnut whip',5,'2012-08-31 14:47:01','2012-08-31 14:47:01',241547445551628288),(115,16,'scooby dooby doo',47,'2012-08-31 14:54:02','2012-08-31 14:54:02',241549332720013312),(116,16,'Lassy',5,'2012-08-31 15:03:02','2012-08-31 15:03:02',241551109993418752),(117,16,'test',5,'2012-08-31 15:24:02','2012-08-31 15:24:02',241556608679829504),(118,16,'Snoop Dogg',4,'2012-08-31 15:58:02','2012-08-31 15:58:02',241565360862666752),(119,16,'Beethoven',1,'2012-08-31 18:37:01','2012-08-31 18:37:01',241605457830100993),(120,16,'bouncer',2,'2012-08-31 19:47:02','2012-08-31 19:47:02',241622723791577088),(121,27,'Snowblind - Black Sabbath',1,'2012-09-01 09:18:02','2012-09-01 09:18:02',241826704736276480),(122,27,'En Vogue - It ain\'t over till the fat lady sings',2,'2012-09-01 10:05:02','2012-09-01 10:05:02',241838952611446784),(123,27,'Alex Song',4,'2012-09-01 11:59:02','2012-09-01 11:59:02',241867314570612736),(124,27,'Kyuss - Whitewater',48,'2012-09-02 11:06:01','2012-09-02 11:06:01',242216315266400256),(125,8,'Venus fly trap',5,'2012-09-03 09:50:01','2012-09-03 09:50:01',242559690976927744),(126,8,'venus fly trap',1,'2012-09-03 09:50:01','2012-09-03 09:50:01',242559675982295040),(127,8,'Robert Plant',48,'2012-09-03 11:10:02','2012-09-03 11:10:02',242579750198075392),(128,8,'robert plant',2,'2012-09-03 13:18:02','2012-09-03 13:18:02',242612316439465984),(129,8,'Orchid',3,'2012-09-03 16:54:02','2012-09-03 16:54:02',242666284414824448),(130,7,'Perilous Mike',5,'2012-09-04 09:01:02','2012-09-04 09:01:02',242910059082969088),(131,7,'Microphone',2,'2012-09-04 09:46:01','2012-09-04 09:46:01',242920958036418560),(132,7,'Mike Oldfield',1,'2012-09-04 10:24:02','2012-09-04 10:24:02',242930444478316544),(133,7,'Mike Patton',48,'2012-09-04 11:12:01','2012-09-04 11:12:01',242942849191120896),(134,10,'The cardboard one that comes after Big Fish &amp; Little Fish.',5,'2012-09-05 09:06:02','2012-09-05 09:06:02',243273472820801536),(135,10,'the css box model',1,'2012-09-05 09:06:02','2012-09-05 09:06:02',243272919550156800),(136,10,'&lt;h1&gt;html tag injection test&lt;/h1&gt;',1,'2012-09-05 10:57:02','2012-09-05 10:57:02',243301217382584320),(137,10,'Living in a box',2,'2012-09-05 11:41:01','2012-09-05 11:41:01',243312600740413440),(138,24,'Richard Keys',2,'2012-09-06 09:02:02','2012-09-06 09:02:02',243634751716614144),(139,24,'C',4,'2012-09-06 09:27:02','2012-09-06 09:27:02',243641319753408512),(140,24,'Yale',5,'2012-09-06 10:20:01','2012-09-06 10:20:01',243654566233653248),(141,24,'keyhole surgery.',1,'2012-09-06 12:59:02','2012-09-06 12:59:02',243693591015350272),(142,6,'Android 4.0',2,'2012-09-07 09:11:02','2012-09-07 09:11:02',243999597427585024),(143,6,'John Montagu',4,'2012-09-07 09:16:02','2012-09-07 09:16:02',244000810688708608),(144,6,'The Earl of Sandwich',1,'2012-09-07 14:39:02','2012-09-07 14:39:02',244082212843159553),(145,28,'hulk hogan style bandana',1,'2012-09-08 09:08:02','2012-09-08 09:08:02',244361106204794881),(146,28,'The cat in the hats hat',48,'2012-09-08 11:08:01','2012-09-08 11:08:01',244391403457757184),(147,28,'Cap',4,'2012-09-08 11:08:01','2012-09-08 11:08:01',244391339473649664),(148,28,'My Huskie beanie hat.',3,'2012-09-08 11:15:01','2012-09-08 11:15:01',244393191460175872),(149,28,'Fez',2,'2012-09-08 11:18:02','2012-09-08 11:18:02',244393734287007745),(150,13,'megalodon',1,'2012-09-09 09:05:01','2012-09-09 09:05:01',244722567611564032),(151,13,'Manta Rays',3,'2012-09-09 09:56:02','2012-09-09 09:56:02',244735837374402561),(152,13,'Sharky',4,'2012-09-09 13:16:02','2012-09-09 13:16:02',244786111942107136),(153,31,'Clobberin\' time',2,'2012-09-12 12:03:02','2012-09-12 12:03:02',245854510638043136),(154,31,'Hammer time',4,'2012-09-12 13:03:01','2012-09-12 13:03:01',245869747177140224),(155,31,'Dinner time',48,'2012-09-12 17:02:02','2012-09-12 17:02:02',245929753075408898),(156,31,'beer o\'clock',3,'2012-09-12 17:07:02','2012-09-12 17:07:02',245931268842328064),(157,31,'time to get ill!',1,'2012-09-12 18:11:02','2012-09-12 18:11:02',245947458708987905),(158,31,'herb time',49,'2012-09-13 13:57:01','2012-09-13 13:57:01',246245559638319104),(159,29,'?',4,'2012-09-14 09:05:01','2012-09-14 09:05:01',246534890705809408),(160,29,'.',1,'2012-09-14 09:13:02','2012-09-14 09:13:02',246536795674796032),(161,29,'~',5,'2012-09-14 09:18:02','2012-09-14 09:18:02',246538018847072256),(162,29,'',2,'2012-09-14 09:32:02','2012-09-14 09:32:02',246541716201545728),(163,29,'The octothorpe',48,'2012-09-14 09:56:01','2012-09-14 09:56:01',246547342407393280),(164,32,'^_^',3,'2012-09-15 12:16:02','2012-09-15 12:16:02',246945053522681858),(165,32,':)',4,'2012-09-15 12:42:02','2012-09-15 12:42:02',246951769521917952);
/*!40000 ALTER TABLE `questions_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions_person`
--

DROP TABLE IF EXISTS `questions_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `twitter_username` varchar(20) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `surname` varchar(25) NOT NULL,
  `middle_names` varchar(25) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions_person`
--

LOCK TABLES `questions_person` WRITE;
/*!40000 ALTER TABLE `questions_person` DISABLE KEYS */;
INSERT INTO `questions_person` VALUES (1,'petexgraham','Pete','Graham','X','2012-08-25 16:45:59','2012-08-25 16:45:59'),(2,'thegingerbloke','Pete','Goodman','','2012-08-25 16:46:44','2012-08-25 16:46:44'),(3,'caz_lock','Caz','Lock','','2012-08-25 16:47:36','2012-08-25 16:47:36'),(4,'jamesbooth','James','Booth','\"Sex Pest\"','2012-08-25 16:48:17','2012-08-25 16:48:17'),(5,'k0ng','Matt','Collins','','2012-08-25 17:55:03','2012-08-25 17:55:03'),(47,'pxgunit','','','','2012-08-26 17:45:55','2012-08-26 17:45:55'),(48,'somaton','','','','2012-08-26 18:51:04','2012-08-26 18:51:04'),(49,'johnridpath','','','','2012-09-13 13:57:01','2012-09-13 13:57:01');
/*!40000 ALTER TABLE `questions_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions_question`
--

DROP TABLE IF EXISTS `questions_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(140) NOT NULL,
  `asked_date` datetime DEFAULT NULL,
  `priority` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `approved` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions_question`
--

LOCK TABLES `questions_question` WRITE;
/*!40000 ALTER TABLE `questions_question` DISABLE KEYS */;
INSERT INTO `questions_question` VALUES (2,'What\'s your favourite cheese?','2012-08-24 22:52:53',0,'2012-08-25 16:36:50','2012-08-25 18:08:34',1),(3,'What\'s your favourite animal?','2012-08-25 17:54:07',0,'2012-08-25 16:37:20','2012-08-25 17:54:11',1),(5,'Who\'s your favourite Booth?',NULL,0,'2012-08-25 16:37:48','2012-09-15 15:19:20',1),(6,'What\'s your favourite sandwich?','2012-09-07 09:00:02',0,'2012-08-25 16:37:56','2012-09-07 09:00:02',1),(7,'Who\'s your favourite Mike?','2012-09-04 09:00:02',0,'2012-08-25 16:38:02','2012-09-04 09:00:02',1),(8,'What\'s your favourite plant?','2012-09-03 09:47:28',0,'2012-08-25 16:38:09','2012-09-03 09:47:28',1),(9,'What\'s your favourite drink?','2012-08-26 17:13:22',0,'2012-08-25 16:38:15','2012-08-26 17:13:22',1),(10,'What\'s your favourite box?','2012-09-05 09:00:02',0,'2012-08-25 16:38:22','2012-09-05 09:00:02',1),(11,'What\'s your favourite beer?',NULL,0,'2012-08-25 16:38:28','2012-09-15 15:18:57',1),(12,'Who\'s your favourite game show host?','2012-08-29 16:27:20',0,'2012-08-25 16:38:40','2012-08-29 16:27:20',1),(13,'What\'s your favourite fish?','2012-09-09 09:00:02',0,'2012-08-25 16:50:45','2012-09-09 09:00:02',1),(14,'What\'s your favourite Indian dish?','2012-08-29 16:54:50',0,'2012-08-25 18:08:10','2012-09-15 15:18:16',1),(16,'What\'s your favourite breed of dog?','2012-08-31 14:52:34',0,'2012-08-30 15:54:32','2012-09-15 15:18:06',1),(18,'What\'s your favourite Supergrass song?',NULL,0,'2012-08-30 16:14:32','2012-09-15 15:17:46',1),(23,'What\'s your favourite poo?','2012-08-31 14:35:52',0,'2012-08-30 16:50:27','2012-08-31 14:35:52',1),(24,'What\'s your favourite key?','2012-09-06 09:00:03',0,'2012-08-30 16:51:55','2012-09-06 09:00:03',1),(27,'What\'s your favourite song?','2012-09-01 09:00:02',0,'2012-08-31 15:43:18','2012-09-01 09:00:02',1),(28,'What\'s your favourite head wear?','2012-09-08 09:00:02',0,'2012-09-02 22:48:51','2012-09-15 15:17:15',1),(29,'What\'s your favourite punctuation mark?','2012-09-14 09:00:02',0,'2012-09-11 15:33:41','2012-09-15 15:17:02',1),(30,'What\'s your favourite type of flooring?',NULL,0,'2012-09-11 15:34:05','2012-09-15 15:16:48',1),(31,'When\'s your favourite time?','2012-09-12 09:00:02',0,'2012-09-11 15:34:40','2012-09-15 15:16:36',1),(32,'What\'s your favourite emoticon?','2012-09-15 09:00:03',0,'2012-09-14 09:28:18','2012-09-15 15:16:08',1),(33,'What\'s the punch line to your favourite joke?',NULL,0,'2012-09-15 09:57:44','2012-09-15 15:15:57',1),(35,'What\'s your favourite unit of measurement?',NULL,0,'2012-09-15 14:49:45','2012-09-15 15:15:27',1),(36,'Who is your favourite duck?',NULL,0,'2012-09-15 14:50:01','2012-09-15 15:15:13',1),(37,'Who is your favourite German?',NULL,0,'2012-09-15 14:50:09','2012-09-15 15:14:59',1),(38,'What\'s your favourite dinosaur?',NULL,0,'2012-09-15 14:50:18','2012-09-15 15:14:44',1),(39,'What\'s your favourite duck joke?',NULL,0,'2012-09-15 14:50:26','2012-09-15 15:14:36',1),(40,'What\'s your favourite cheese joke?',NULL,0,'2012-09-15 14:50:33','2012-09-15 15:14:27',1),(42,'Who\'s your favouite ginger?',NULL,0,'2012-09-15 14:50:52','2012-09-15 15:14:00',1),(43,'What\'s your favourite curry?',NULL,0,'2012-09-15 14:51:00','2012-09-15 15:13:47',1),(44,'What\'s your favourite inanimate object?',NULL,0,'2012-09-15 14:51:09','2012-09-15 15:13:34',1),(45,'Who\'s your favourite British Prime Minister from the 19th Century?',NULL,0,'2012-09-15 14:51:19','2012-09-15 15:13:19',1),(47,'What\'s your favourite police academy film?',NULL,0,'2012-09-15 14:51:36','2012-09-15 15:12:40',1),(48,'Who\'s your favourite Charles?',NULL,0,'2012-09-15 14:51:44','2012-09-15 15:12:22',1),(49,'Who\'s your favourite foot?',NULL,0,'2012-09-15 14:51:51','2012-09-15 15:12:10',1),(50,'What\'s your favourite key?',NULL,0,'2012-09-15 14:51:59','2012-09-15 15:11:59',1),(51,'What\'s your favourite size of envelope?',NULL,0,'2012-09-15 14:52:05','2012-09-15 15:11:47',1),(52,'What\'s your favourite bean?',NULL,0,'2012-09-15 14:52:13','2012-09-15 15:11:26',1),(54,'Who\'s your favourite queen?',NULL,0,'2012-09-15 14:52:25','2012-09-15 15:10:34',1),(55,'What\'s your favourite glue?',NULL,0,'2012-09-15 14:52:31','2012-09-15 15:10:20',1),(56,'What\'s your favourite hat?',NULL,0,'2012-09-15 14:52:36','2012-09-15 15:10:05',1),(57,'What\'s your favourite cereal?',NULL,0,'2012-09-15 14:52:44','2012-09-15 15:09:55',1),(58,'What\'s your favourite colour?',NULL,0,'2012-09-15 14:52:51','2012-09-15 15:09:43',1),(59,'Who\'s your favourite lord?',NULL,0,'2012-09-15 14:52:57','2012-09-15 15:09:33',1),(60,'What\'s your favourite type of egg?',NULL,0,'2012-09-15 14:53:04','2012-09-15 15:09:19',1),(61,'What\'s your favourite pen?',NULL,0,'2012-09-15 14:53:13','2012-09-15 15:09:07',1),(62,'What\'s your favourite day?',NULL,1,'2012-09-15 14:53:20','2012-09-15 15:08:48',0),(63,'Who\'s your favourite prince?',NULL,0,'2012-09-15 14:53:29','2012-09-15 15:08:38',1),(64,'Who\'s your favourite Nelson?',NULL,0,'2012-09-15 14:53:36','2012-09-15 15:08:24',1),(65,'Who\'s your favourite character from Neighbours?',NULL,0,'2012-09-15 14:53:44','2012-09-15 15:08:09',1),(66,'What\'s your favourite sausage?',NULL,0,'2012-09-15 14:53:50','2012-09-15 15:07:31',1),(67,'What\'s your favourite chair?',NULL,0,'2012-09-15 14:53:58','2012-09-15 15:07:22',1),(68,'What\'s your favourite word?',NULL,0,'2012-09-15 14:54:05','2012-09-15 15:07:11',1),(69,'What\'s your favourite French word?',NULL,0,'2012-09-15 14:54:11','2012-09-15 15:06:59',1),(70,'What\'s your favourite German word?',NULL,0,'2012-09-15 14:54:17','2012-09-15 15:06:41',1),(71,'Who\'s your favourite doctor?',NULL,0,'2012-09-15 14:54:24','2012-09-15 15:06:29',1),(72,'Who\'s your favourite dictator?',NULL,0,'2012-09-15 14:55:42','2012-09-15 15:06:18',1),(73,'Who\'s your favourite mass murderer?',NULL,0,'2012-09-15 14:55:51','2012-09-15 15:06:07',1),(74,'What\'s your favourite road?',NULL,0,'2012-09-15 14:56:02','2012-09-15 15:05:56',1),(75,'What\'s your favourite method of transport?',NULL,0,'2012-09-15 14:56:09','2012-09-15 15:05:40',1),(76,'What\'s your favourite semi-aquatic egg-laying mammal?',NULL,0,'2012-09-15 14:56:15','2012-09-15 15:05:34',1),(77,'What\'s your favourite Cephalopod?',NULL,0,'2012-09-15 14:56:22','2012-09-15 15:05:26',1),(78,'Who\'s your favourite Wu-Tang member?',NULL,0,'2012-09-15 14:56:28','2012-09-15 15:05:19',1),(79,'What\'s your favourite kind of sauce?',NULL,0,'2012-09-15 14:56:36','2012-09-15 15:05:06',1),(80,'What\'s your favourite wire?',NULL,0,'2012-09-15 14:56:43','2012-09-15 15:04:57',1),(81,'What\'s your favourite kind of light?',NULL,0,'2012-09-15 14:56:50','2012-09-15 15:04:47',1),(82,'What\'s your favourite item of clothing?',NULL,0,'2012-09-15 14:56:59','2012-09-15 15:04:38',1),(83,'What\'s your favourite type of neckline?',NULL,0,'2012-09-15 14:57:06','2012-09-15 15:04:26',1),(84,'What\'s your favourite pill?',NULL,0,'2012-09-15 14:57:13','2012-09-15 15:04:20',1),(85,'What\'s your favourite prescription drug?',NULL,0,'2012-09-15 14:57:18','2012-09-15 15:04:08',1),(86,'What\'s your favourite Guinness world record?',NULL,0,'2012-09-15 14:57:24','2012-09-15 15:04:01',1),(87,'What\'s your favourite size?',NULL,0,'2012-09-15 14:57:31','2012-09-15 15:03:46',1),(88,'What\'s your favourite blind?',NULL,0,'2012-09-15 14:57:39','2012-09-15 15:03:38',1),(89,'What\'s your favourite brand?',NULL,0,'2012-09-15 14:58:00','2012-09-15 15:03:29',1),(90,'Who\'s your favourite celebrity?',NULL,0,'2012-09-15 14:58:10','2012-09-15 15:03:22',1),(91,'What\'s your favourite type of roofing?',NULL,0,'2012-09-15 14:58:17','2012-09-15 15:03:10',1),(92,'What\'s your favourite charger?',NULL,0,'2012-09-15 14:58:28','2012-09-15 15:02:53',1),(93,'What\'s your favourite paint?',NULL,0,'2012-09-15 14:58:35','2012-09-15 15:02:44',1),(94,'What\'s your favourite crisp?',NULL,0,'2012-09-15 14:58:41','2012-09-15 15:02:34',1),(95,'What\'s your favourite weed?',NULL,0,'2012-09-15 14:58:48','2012-09-15 15:02:07',1),(96,'What\'s your favourite moustache?',NULL,0,'2012-09-15 14:58:58','2012-09-15 15:01:58',1),(97,'What\'s your favourite reptile?',NULL,0,'2012-09-15 14:59:07','2012-09-15 15:01:35',1),(98,'What\'s your favourite shellfish?',NULL,0,'2012-09-15 14:59:15','2012-09-15 15:01:26',1),(99,'What\'s your favourite pattern?',NULL,0,'2012-09-15 14:59:24','2012-09-15 15:01:19',1),(100,'What\'s your favourite rim?',NULL,0,'2012-09-15 14:59:34','2012-09-15 15:01:11',1),(101,'What\'s your favourite knicker?',NULL,0,'2012-09-15 14:59:42','2012-09-15 15:01:03',1),(102,'What\'s your favourite part of a pig?',NULL,0,'2012-09-15 14:59:49','2012-09-15 15:00:53',1),(103,'What\'s your favourite cake?',NULL,0,'2012-09-15 15:00:03','2012-09-15 15:00:46',1),(104,'Who\'s your favourite Daniel?',NULL,0,'2012-09-15 15:00:09','2012-09-15 15:00:38',1);
/*!40000 ALTER TABLE `questions_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'questions','0001_initial','2012-08-30 14:20:40'),(2,'questions','0002_auto__add_field_question_approved','2012-08-30 14:28:13');
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-09-15 15:30:52
