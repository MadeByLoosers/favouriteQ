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
INSERT INTO `auth_user` VALUES (1,'Gunt','','','admin@guntlondon.com','pbkdf2_sha256$10000$hoBtmOISdEAP$GERcWZ/74v7QBGbnW9Tw4w4nQR9bbSCS+qtYsagF8jg=',1,1,1,'2012-09-03 09:45:18','2012-08-25 16:03:12');
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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2012-08-25 16:36:50',1,7,'2','What\'s your favourite cheese?',1,''),(2,'2012-08-25 16:37:20',1,7,'3','What\'s your favourite animal?',1,''),(3,'2012-08-25 16:37:36',1,7,'4','What\'s your favourite colour?',1,''),(4,'2012-08-25 16:37:48',1,7,'5','Who\'s your favourite Booth?',1,''),(5,'2012-08-25 16:37:56',1,7,'6','What\'s your favourite sandwich?',1,''),(6,'2012-08-25 16:38:02',1,7,'7','Who\'s your favourite Mike?',1,''),(7,'2012-08-25 16:38:09',1,7,'8','What\'s your favourite plant?',1,''),(8,'2012-08-25 16:38:15',1,7,'9','What\'s your favourite drink?',1,''),(9,'2012-08-25 16:38:22',1,7,'10','What\'s your favourite box?',1,''),(10,'2012-08-25 16:38:28',1,7,'11','What\'s your favourite beer?',1,''),(11,'2012-08-25 16:38:40',1,7,'12','Who\'s your favourite game show host?',1,''),(12,'2012-08-25 16:39:13',1,7,'12','Who\'s your sfavourite game show host?',2,'Changed question.'),(13,'2012-08-25 16:39:29',1,7,'12','Who\'s your favourite game show host?',2,'Changed question.'),(14,'2012-08-25 16:45:59',1,8,'1','petexgraham',1,''),(15,'2012-08-25 16:46:44',1,8,'2','thegingerbloke',1,''),(16,'2012-08-25 16:47:36',1,8,'3','caz_lock',1,''),(17,'2012-08-25 16:48:17',1,8,'4','jamesbooth',1,''),(18,'2012-08-25 16:48:38',1,9,'1','Stilton',1,''),(19,'2012-08-25 16:49:03',1,9,'2','Gouda',1,''),(20,'2012-08-25 16:49:16',1,9,'3','I don\'t like cheese',1,''),(21,'2012-08-25 16:49:36',1,9,'4','Brie',1,''),(22,'2012-08-25 16:49:49',1,9,'5','monkey',1,''),(23,'2012-08-25 16:50:28',1,9,'6','tiger',1,''),(24,'2012-08-25 16:50:45',1,7,'13','What\'s your favourite fish?',1,''),(25,'2012-08-25 16:51:12',1,9,'7','horse',1,''),(26,'2012-08-25 16:51:48',1,9,'8','Monkey',1,''),(27,'2012-08-25 16:52:56',1,7,'2','What\'s your favourite cheese?',2,'Changed asked_date.'),(28,'2012-08-25 16:53:17',1,7,'3','What\'s your favourite animal?',2,'Changed asked_date.'),(29,'2012-08-25 17:54:11',1,7,'3','What\'s your favourite animal?',2,'Changed asked_date.'),(30,'2012-08-25 17:54:28',1,7,'2','What\'s your favourite cheese?',2,'Changed asked_date.'),(31,'2012-08-25 17:55:03',1,8,'5','k0ng',1,''),(32,'2012-08-25 17:55:22',1,9,'9','Pony',1,''),(33,'2012-08-25 18:08:10',1,7,'14','What\'s your favourite indian dish?',1,''),(34,'2012-08-25 18:08:34',1,7,'2','What\'s your favourite cheese?',2,'Changed asked_date.'),(35,'2012-08-25 18:09:03',1,9,'10','Baby Bells',1,''),(36,'2012-08-26 18:59:41',1,9,'93','FISK',2,'Changed answer_text.'),(37,'2012-08-26 18:59:49',1,9,'92','Vanilla milkshake',2,'Changed answer_text.'),(38,'2012-08-31 14:05:36',1,9,'111','Jim Bowen',3,''),(39,'2012-08-31 15:43:43',1,7,'26','Cheese',3,''),(40,'2012-08-31 15:43:44',1,7,'25','Cheese',3,''),(41,'2012-08-31 15:43:53',1,7,'22','sadfadsfasdfasdadfs',3,''),(42,'2012-08-31 15:44:02',1,7,'18','What\'s your favourite supergrass song?',2,'Changed question.'),(43,'2012-08-31 15:44:19',1,7,'27','What\'s your favourite song?',2,'Changed approved.'),(44,'2012-09-03 09:45:37',1,7,'6','What\'s your favourite sandwich?',2,'Changed approved.'),(45,'2012-09-03 09:45:48',1,7,'28','what is your favourite head wear?',2,'Changed approved.'),(46,'2012-09-03 09:45:54',1,7,'24','What\'s your favourite key?',2,'Changed approved.'),(47,'2012-09-03 09:46:02',1,7,'13','What\'s your favourite fish?',2,'Changed approved.'),(48,'2012-09-03 09:46:18',1,7,'10','What\'s your favourite box?',2,'Changed approved.'),(49,'2012-09-03 09:46:23',1,7,'8','What\'s your favourite plant?',2,'Changed approved.'),(50,'2012-09-03 09:46:30',1,7,'7','Who\'s your favourite Mike?',2,'Changed approved.'),(51,'2012-09-11 15:35:28',1,7,'31','When is your favourite time?',2,'Changed priority and approved.'),(52,'2012-09-13 13:53:51',1,7,'30','What is your favourite type of flooring?',2,'Changed approved.'),(53,'2012-09-13 13:54:00',1,7,'29','What is your favourite punctuation mark?',2,'Changed approved.'),(54,'2012-09-14 09:28:34',1,7,'32','What is your favourite emoticon?',2,'Changed approved.');
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
INSERT INTO `django_session` VALUES ('1f495091ee264e45bc24981a374a8612','MmYyNDk0YmFkMGFkNWFjYjg3NDgyNjc4Y2Y4NWU0NzJhZjNmYzAzMzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-09-27 13:53:32'),('2ee8ca5eae2defdcf5949575d070f04d','MmYyNDk0YmFkMGFkNWFjYjg3NDgyNjc4Y2Y4NWU0NzJhZjNmYzAzMzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-09-12 15:11:40'),('cbabd42b8373c604793c256d26b87559','Mzg5MGFiNTFiMTNjNWQ2YzA2ZTNhNzkyYTI2MmI5YTM3ZTg0MGNhMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-09-08 16:30:45'),('d49ae41a4a46c4b6a44732601e262730','Mzg5MGFiNTFiMTNjNWQ2YzA2ZTNhNzkyYTI2MmI5YTM3ZTg0MGNhMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-09-14 14:05:19'),('dba1e70fc0dc7d76811d8de174dcd5df','Mzg5MGFiNTFiMTNjNWQ2YzA2ZTNhNzkyYTI2MmI5YTM3ZTg0MGNhMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-09-17 09:45:18'),('fabd7e514b91749885799b2cb5e7d577','Mzg5MGFiNTFiMTNjNWQ2YzA2ZTNhNzkyYTI2MmI5YTM3ZTg0MGNhMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-09-15 10:06:15');
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions_question`
--

LOCK TABLES `questions_question` WRITE;
/*!40000 ALTER TABLE `questions_question` DISABLE KEYS */;
INSERT INTO `questions_question` VALUES (2,'What\'s your favourite cheese?','2012-08-24 22:52:53',0,'2012-08-25 16:36:50','2012-08-25 18:08:34',1),(3,'What\'s your favourite animal?','2012-08-25 17:54:07',0,'2012-08-25 16:37:20','2012-08-25 17:54:11',1),(4,'What\'s your favourite colour?',NULL,1,'2012-08-25 16:37:36','2012-08-25 16:37:36',0),(5,'Who\'s your favourite Booth?',NULL,0,'2012-08-25 16:37:48','2012-08-25 16:37:48',0),(6,'What\'s your favourite sandwich?','2012-09-07 09:00:02',0,'2012-08-25 16:37:56','2012-09-07 09:00:02',1),(7,'Who\'s your favourite Mike?','2012-09-04 09:00:02',0,'2012-08-25 16:38:02','2012-09-04 09:00:02',1),(8,'What\'s your favourite plant?','2012-09-03 09:47:28',0,'2012-08-25 16:38:09','2012-09-03 09:47:28',1),(9,'What\'s your favourite drink?','2012-08-26 17:13:22',0,'2012-08-25 16:38:15','2012-08-26 17:13:22',1),(10,'What\'s your favourite box?','2012-09-05 09:00:02',0,'2012-08-25 16:38:22','2012-09-05 09:00:02',1),(11,'What\'s your favourite beer?',NULL,0,'2012-08-25 16:38:28','2012-08-25 16:38:28',0),(12,'Who\'s your favourite game show host?','2012-08-29 16:27:20',0,'2012-08-25 16:38:40','2012-08-29 16:27:20',1),(13,'What\'s your favourite fish?','2012-09-09 09:00:02',0,'2012-08-25 16:50:45','2012-09-09 09:00:02',1),(14,'What\'s your favourite indian dish?','2012-08-29 16:54:50',0,'2012-08-25 18:08:10','2012-08-29 16:54:50',1),(16,'What\'s your favourite dog?','2012-08-31 14:52:34',0,'2012-08-30 15:54:32','2012-08-31 14:52:34',1),(18,'What\'s your favourite supergrass song?',NULL,0,'2012-08-30 16:14:32','2012-08-31 15:44:01',0),(23,'What\'s your favourite poo?','2012-08-31 14:35:52',0,'2012-08-30 16:50:27','2012-08-31 14:35:52',1),(24,'What\'s your favourite key?','2012-09-06 09:00:03',0,'2012-08-30 16:51:55','2012-09-06 09:00:03',1),(27,'What\'s your favourite song?','2012-09-01 09:00:02',0,'2012-08-31 15:43:18','2012-09-01 09:00:02',1),(28,'what is your favourite head wear?','2012-09-08 09:00:02',0,'2012-09-02 22:48:51','2012-09-08 09:00:02',1),(29,'What is your favourite punctuation mark?','2012-09-14 09:00:02',0,'2012-09-11 15:33:41','2012-09-14 09:00:02',1),(30,'What is your favourite type of flooring?',NULL,0,'2012-09-11 15:34:05','2012-09-13 13:53:51',1),(31,'When is your favourite time?','2012-09-12 09:00:02',1,'2012-09-11 15:34:40','2012-09-12 09:00:02',1),(32,'What is your favourite emoticon?','2012-09-15 09:00:03',0,'2012-09-14 09:28:18','2012-09-15 09:00:03',1),(33,'What is the punch line to your favourite joke?',NULL,0,'2012-09-15 09:57:44','2012-09-15 09:57:44',0);
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

-- Dump completed on 2012-09-15 13:28:21
