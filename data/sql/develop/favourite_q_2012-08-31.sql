# ************************************************************
# Sequel Pro SQL dump
# Version 3348
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.9)
# Database: favourite_q
# Generation Time: 2012-08-31 08:44:37 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table auth_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table auth_group_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group_permissions`;

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



# Dump of table auth_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_permission`;

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

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
	(1,'Can add permission',1,'add_permission'),
	(2,'Can change permission',1,'change_permission'),
	(3,'Can delete permission',1,'delete_permission'),
	(4,'Can add group',2,'add_group'),
	(5,'Can change group',2,'change_group'),
	(6,'Can delete group',2,'delete_group'),
	(7,'Can add user',3,'add_user'),
	(8,'Can change user',3,'change_user'),
	(9,'Can delete user',3,'delete_user'),
	(10,'Can add content type',4,'add_contenttype'),
	(11,'Can change content type',4,'change_contenttype'),
	(12,'Can delete content type',4,'delete_contenttype'),
	(13,'Can add session',5,'add_session'),
	(14,'Can change session',5,'change_session'),
	(15,'Can delete session',5,'delete_session'),
	(16,'Can add site',6,'add_site'),
	(17,'Can change site',6,'change_site'),
	(18,'Can delete site',6,'delete_site'),
	(19,'Can add question',7,'add_question'),
	(20,'Can change question',7,'change_question'),
	(21,'Can delete question',7,'delete_question'),
	(22,'Can add person',8,'add_person'),
	(23,'Can change person',8,'change_person'),
	(24,'Can delete person',8,'delete_person'),
	(25,'Can add answer',9,'add_answer'),
	(26,'Can change answer',9,'change_answer'),
	(27,'Can delete answer',9,'delete_answer'),
	(28,'Can add log entry',10,'add_logentry'),
	(29,'Can change log entry',10,'change_logentry'),
	(30,'Can delete log entry',10,'delete_logentry'),
	(31,'Can add migration history',11,'add_migrationhistory'),
	(32,'Can change migration history',11,'change_migrationhistory'),
	(33,'Can delete migration history',11,'delete_migrationhistory');

/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user`;

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

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;

INSERT INTO `auth_user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `is_staff`, `is_active`, `is_superuser`, `last_login`, `date_joined`)
VALUES
	(1,'Gunt','','','admin@guntlondon.com','pbkdf2_sha256$10000$hoBtmOISdEAP$GERcWZ/74v7QBGbnW9Tw4w4nQR9bbSCS+qtYsagF8jg=',1,1,1,'2012-08-25 16:30:45','2012-08-25 16:03:12');

/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_user_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_groups`;

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



# Dump of table auth_user_user_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_user_permissions`;

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



# Dump of table django_admin_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_admin_log`;

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;

INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`)
VALUES
	(1,'2012-08-25 16:36:50',1,7,'2','What\'s your favourite cheese?',1,''),
	(2,'2012-08-25 16:37:20',1,7,'3','What\'s your favourite animal?',1,''),
	(3,'2012-08-25 16:37:36',1,7,'4','What\'s your favourite colour?',1,''),
	(4,'2012-08-25 16:37:48',1,7,'5','Who\'s your favourite Booth?',1,''),
	(5,'2012-08-25 16:37:56',1,7,'6','What\'s your favourite sandwich?',1,''),
	(6,'2012-08-25 16:38:02',1,7,'7','Who\'s your favourite Mike?',1,''),
	(7,'2012-08-25 16:38:09',1,7,'8','What\'s your favourite plant?',1,''),
	(8,'2012-08-25 16:38:15',1,7,'9','What\'s your favourite drink?',1,''),
	(9,'2012-08-25 16:38:22',1,7,'10','What\'s your favourite box?',1,''),
	(10,'2012-08-25 16:38:28',1,7,'11','What\'s your favourite beer?',1,''),
	(11,'2012-08-25 16:38:40',1,7,'12','Who\'s your favourite game show host?',1,''),
	(12,'2012-08-25 16:39:13',1,7,'12','Who\'s your sfavourite game show host?',2,'Changed question.'),
	(13,'2012-08-25 16:39:29',1,7,'12','Who\'s your favourite game show host?',2,'Changed question.'),
	(14,'2012-08-25 16:45:59',1,8,'1','petexgraham',1,''),
	(15,'2012-08-25 16:46:44',1,8,'2','thegingerbloke',1,''),
	(16,'2012-08-25 16:47:36',1,8,'3','caz_lock',1,''),
	(17,'2012-08-25 16:48:17',1,8,'4','jamesbooth',1,''),
	(18,'2012-08-25 16:48:38',1,9,'1','Stilton',1,''),
	(19,'2012-08-25 16:49:03',1,9,'2','Gouda',1,''),
	(20,'2012-08-25 16:49:16',1,9,'3','I don\'t like cheese',1,''),
	(21,'2012-08-25 16:49:36',1,9,'4','Brie',1,''),
	(22,'2012-08-25 16:49:49',1,9,'5','monkey',1,''),
	(23,'2012-08-25 16:50:28',1,9,'6','tiger',1,''),
	(24,'2012-08-25 16:50:45',1,7,'13','What\'s your favourite fish?',1,''),
	(25,'2012-08-25 16:51:12',1,9,'7','horse',1,''),
	(26,'2012-08-25 16:51:48',1,9,'8','Monkey',1,''),
	(27,'2012-08-25 16:52:56',1,7,'2','What\'s your favourite cheese?',2,'Changed asked_date.'),
	(28,'2012-08-25 16:53:17',1,7,'3','What\'s your favourite animal?',2,'Changed asked_date.'),
	(29,'2012-08-25 17:54:11',1,7,'3','What\'s your favourite animal?',2,'Changed asked_date.'),
	(30,'2012-08-25 17:54:28',1,7,'2','What\'s your favourite cheese?',2,'Changed asked_date.'),
	(31,'2012-08-25 17:55:03',1,8,'5','k0ng',1,''),
	(32,'2012-08-25 17:55:22',1,9,'9','Pony',1,''),
	(33,'2012-08-25 18:08:10',1,7,'14','What\'s your favourite indian dish?',1,''),
	(34,'2012-08-25 18:08:34',1,7,'2','What\'s your favourite cheese?',2,'Changed asked_date.'),
	(35,'2012-08-25 18:09:03',1,9,'10','Baby Bells',1,''),
	(36,'2012-08-26 18:59:41',1,9,'93','FISK',2,'Changed answer_text.'),
	(37,'2012-08-26 18:59:49',1,9,'92','Vanilla milkshake',2,'Changed answer_text.');

/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_content_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`)
VALUES
	(1,'permission','auth','permission'),
	(2,'group','auth','group'),
	(3,'user','auth','user'),
	(4,'content type','contenttypes','contenttype'),
	(5,'session','sessions','session'),
	(6,'site','sites','site'),
	(7,'question','questions','question'),
	(8,'person','questions','person'),
	(9,'answer','questions','answer'),
	(10,'log entry','admin','logentry'),
	(11,'migration history','south','migrationhistory');

/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_c25c2c28` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`)
VALUES
	('2ee8ca5eae2defdcf5949575d070f04d','MmYyNDk0YmFkMGFkNWFjYjg3NDgyNjc4Y2Y4NWU0NzJhZjNmYzAzMzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-09-12 15:11:40'),
	('cbabd42b8373c604793c256d26b87559','Mzg5MGFiNTFiMTNjNWQ2YzA2ZTNhNzkyYTI2MmI5YTM3ZTg0MGNhMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-09-08 16:30:45');

/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_site
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_site`;

CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;

INSERT INTO `django_site` (`id`, `domain`, `name`)
VALUES
	(1,'example.com','example.com');

/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table questions_answer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `questions_answer`;

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
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

LOCK TABLES `questions_answer` WRITE;
/*!40000 ALTER TABLE `questions_answer` DISABLE KEYS */;

INSERT INTO `questions_answer` (`id`, `question_id`, `answer_text`, `person_id`, `created_at`, `updated_at`, `tweet_id`)
VALUES
	(1,2,'Stilton',1,'2012-08-25 16:48:38','2012-08-25 16:48:38',0),
	(2,2,'Gouda',4,'2012-08-25 16:49:03','2012-08-25 16:49:03',0),
	(3,2,'I don\'t like cheese',2,'2012-08-25 16:49:16','2012-08-25 16:49:16',0),
	(4,2,'Brie',3,'2012-08-25 16:49:36','2012-08-25 16:49:36',0),
	(5,3,'monkey',1,'2012-08-25 16:49:49','2012-08-25 16:49:49',0),
	(6,3,'tiger',3,'2012-08-25 16:50:28','2012-08-25 16:50:28',0),
	(7,3,'horse',2,'2012-08-25 16:51:12','2012-08-25 16:51:12',0),
	(8,3,'Monkey',4,'2012-08-25 16:51:48','2012-08-25 16:51:48',0),
	(9,3,'Pony',5,'2012-08-25 17:55:22','2012-08-25 17:55:22',0),
	(10,2,'Baby Bells',5,'2012-08-25 18:09:03','2012-08-25 18:09:03',0),
	(103,9,'Orange Juice',2,'2012-08-29 16:26:29','2012-08-29 16:26:29',239796989905227776),
	(104,9,'BEER',48,'2012-08-29 16:26:29','2012-08-29 16:26:29',239796492263624705),
	(105,9,'in particular stella! I love stella and a fight',47,'2012-08-29 16:26:29','2012-08-29 16:26:29',239786258585493504),
	(106,9,'Vanilla milkshake',4,'2012-08-29 16:26:29','2012-08-29 16:26:29',239784613373960192),
	(107,9,'FISK',2,'2012-08-29 16:26:29','2012-08-29 16:26:29',239782375473680385),
	(108,9,'beers! Lads love beers.',47,'2012-08-29 16:26:29','2012-08-29 16:26:29',239780467610644480);

/*!40000 ALTER TABLE `questions_answer` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table questions_person
# ------------------------------------------------------------

DROP TABLE IF EXISTS `questions_person`;

CREATE TABLE `questions_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `twitter_username` varchar(20) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `surname` varchar(25) NOT NULL,
  `middle_names` varchar(25) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

LOCK TABLES `questions_person` WRITE;
/*!40000 ALTER TABLE `questions_person` DISABLE KEYS */;

INSERT INTO `questions_person` (`id`, `twitter_username`, `first_name`, `surname`, `middle_names`, `created_at`, `updated_at`)
VALUES
	(1,'petexgraham','Pete','Graham','X','2012-08-25 16:45:59','2012-08-25 16:45:59'),
	(2,'thegingerbloke','Pete','Goodman','','2012-08-25 16:46:44','2012-08-25 16:46:44'),
	(3,'caz_lock','Caz','Lock','','2012-08-25 16:47:36','2012-08-25 16:47:36'),
	(4,'jamesbooth','James','Booth','\"Sex Pest\"','2012-08-25 16:48:17','2012-08-25 16:48:17'),
	(5,'k0ng','Matt','Collins','','2012-08-25 17:55:03','2012-08-25 17:55:03'),
	(47,'pxgunit','','','','2012-08-26 17:45:55','2012-08-26 17:45:55'),
	(48,'somaton','','','','2012-08-26 18:51:04','2012-08-26 18:51:04');

/*!40000 ALTER TABLE `questions_person` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table questions_question
# ------------------------------------------------------------

DROP TABLE IF EXISTS `questions_question`;

CREATE TABLE `questions_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(140) NOT NULL,
  `asked_date` datetime DEFAULT NULL,
  `priority` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `approved` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

LOCK TABLES `questions_question` WRITE;
/*!40000 ALTER TABLE `questions_question` DISABLE KEYS */;

INSERT INTO `questions_question` (`id`, `question`, `asked_date`, `priority`, `created_at`, `updated_at`, `approved`)
VALUES
	(2,'What\'s your favourite cheese?','2012-08-24 22:52:53',0,'2012-08-25 16:36:50','2012-08-25 18:08:34',1),
	(3,'What\'s your favourite animal?','2012-08-25 17:54:07',0,'2012-08-25 16:37:20','2012-08-25 17:54:11',1),
	(4,'What\'s your favourite colour?',NULL,1,'2012-08-25 16:37:36','2012-08-25 16:37:36',0),
	(5,'Who\'s your favourite Booth?',NULL,0,'2012-08-25 16:37:48','2012-08-25 16:37:48',0),
	(6,'What\'s your favourite sandwich?',NULL,0,'2012-08-25 16:37:56','2012-08-25 16:37:56',0),
	(7,'Who\'s your favourite Mike?',NULL,0,'2012-08-25 16:38:02','2012-08-25 16:38:02',0),
	(8,'What\'s your favourite plant?',NULL,0,'2012-08-25 16:38:09','2012-08-25 16:38:09',0),
	(9,'What\'s your favourite drink?','2012-08-26 17:13:22',0,'2012-08-25 16:38:15','2012-08-26 17:13:22',1),
	(10,'What\'s your favourite box?',NULL,0,'2012-08-25 16:38:22','2012-08-25 16:38:22',0),
	(11,'What\'s your favourite beer?',NULL,0,'2012-08-25 16:38:28','2012-08-25 16:38:28',0),
	(12,'Who\'s your favourite game show host?','2012-08-29 16:27:20',0,'2012-08-25 16:38:40','2012-08-29 16:27:20',1),
	(13,'What\'s your favourite fish?',NULL,0,'2012-08-25 16:50:45','2012-08-25 16:50:45',0),
	(14,'What\'s your favourite indian dish?','2012-08-29 16:54:50',0,'2012-08-25 18:08:10','2012-08-29 16:54:50',1),
	(16,'What\'s your favourite dog?',NULL,0,'2012-08-30 15:54:32','2012-08-30 15:54:32',1),
	(18,'What\'s your favourite supergrass song',NULL,0,'2012-08-30 16:14:32','2012-08-30 16:14:32',0),
	(22,'sadfadsfasdfasdadfs',NULL,0,'2012-08-30 16:50:15','2012-08-30 16:50:15',0),
	(23,'What\'s your favourite poo?',NULL,0,'2012-08-30 16:50:27','2012-08-30 16:50:27',1),
	(24,'What\'s your favourite key?',NULL,0,'2012-08-30 16:51:55','2012-08-30 16:51:55',0);

/*!40000 ALTER TABLE `questions_question` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table south_migrationhistory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `south_migrationhistory`;

CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;

INSERT INTO `south_migrationhistory` (`id`, `app_name`, `migration`, `applied`)
VALUES
	(1,'questions','0001_initial','2012-08-30 14:20:40'),
	(2,'questions','0002_auto__add_field_question_approved','2012-08-30 14:28:13');

/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
