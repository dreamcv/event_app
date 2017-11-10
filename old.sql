-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: qlsj1108
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
-- Table structure for table `accounts_projuser`
--

DROP TABLE IF EXISTS `accounts_projuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_projuser` (
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
  `nickname` varchar(50) NOT NULL,
  `mugshot` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_projuser`
--

LOCK TABLES `accounts_projuser` WRITE;
/*!40000 ALTER TABLE `accounts_projuser` DISABLE KEYS */;
INSERT INTO `accounts_projuser` VALUES (1,'pbkdf2_sha256$36000$bRiBcDIxhOy7$pSwWTzPB84HsPlU+Dn9VVoBWKpRfNeIMVhm9WTcVMls=','2017-11-10 02:31:34.554118',1,'actanble','','','actanble@qq.com',1,1,'2017-11-10 02:18:00.000000','管理员1','upload/mugshots/logo400x400_8oZIbXA.jpg');
/*!40000 ALTER TABLE `accounts_projuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_projuser_groups`
--

DROP TABLE IF EXISTS `accounts_projuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_projuser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projuser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_projuser_groups_projuser_id_group_id_6b9efe9f_uniq` (`projuser_id`,`group_id`),
  KEY `accounts_projuser_groups_group_id_1d09b368_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_projuser_gr_projuser_id_dba8df3d_fk_accounts_` FOREIGN KEY (`projuser_id`) REFERENCES `accounts_projuser` (`id`),
  CONSTRAINT `accounts_projuser_groups_group_id_1d09b368_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_projuser_groups`
--

LOCK TABLES `accounts_projuser_groups` WRITE;
/*!40000 ALTER TABLE `accounts_projuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_projuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_projuser_user_permissions`
--

DROP TABLE IF EXISTS `accounts_projuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_projuser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projuser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_projuser_user_p_projuser_id_permission_i_0f2e7389_uniq` (`projuser_id`,`permission_id`),
  KEY `accounts_projuser_us_permission_id_6f0a51fb_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_projuser_us_permission_id_6f0a51fb_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `accounts_projuser_us_projuser_id_27393580_fk_accounts_` FOREIGN KEY (`projuser_id`) REFERENCES `accounts_projuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_projuser_user_permissions`
--

LOCK TABLES `accounts_projuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `accounts_projuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_projuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_usershenfen`
--

DROP TABLE IF EXISTS `accounts_usershenfen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_usershenfen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shenfen` varchar(50) NOT NULL,
  `proty` int(11) NOT NULL,
  `webuser_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_usershenfen_webuser_id_2d68e450_fk_accounts_projuser_id` (`webuser_id`),
  CONSTRAINT `accounts_usershenfen_webuser_id_2d68e450_fk_accounts_projuser_id` FOREIGN KEY (`webuser_id`) REFERENCES `accounts_projuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_usershenfen`
--

LOCK TABLES `accounts_usershenfen` WRITE;
/*!40000 ALTER TABLE `accounts_usershenfen` DISABLE KEYS */;
INSERT INTO `accounts_usershenfen` VALUES (1,'管理员001号',5,1);
/*!40000 ALTER TABLE `accounts_usershenfen` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add 事件',7,'add_eventbase'),(20,'Can change 事件',7,'change_eventbase'),(21,'Can delete 事件',7,'delete_eventbase'),(22,'Can add 事件状态',8,'add_stat'),(23,'Can change 事件状态',8,'change_stat'),(24,'Can delete 事件状态',8,'delete_stat'),(25,'Can add 事件详细',9,'add_eventdetail'),(26,'Can change 事件详细',9,'change_eventdetail'),(27,'Can delete 事件详细',9,'delete_eventdetail'),(28,'Can add 状态集合',10,'add_stations'),(29,'Can change 状态集合',10,'change_stations'),(30,'Can delete 状态集合',10,'delete_stations'),(31,'Can add 事件类型集合',11,'add_eventcate'),(32,'Can change 事件类型集合',11,'change_eventcate'),(33,'Can delete 事件类型集合',11,'delete_eventcate'),(34,'Can add 用户身份表|固定填写',12,'add_usershenfen'),(35,'Can change 用户身份表|固定填写',12,'change_usershenfen'),(36,'Can delete 用户身份表|固定填写',12,'delete_usershenfen'),(37,'Can add 网站扩展用户',13,'add_projuser'),(38,'Can change 网站扩展用户',13,'change_projuser'),(39,'Can delete 网站扩展用户',13,'delete_projuser');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
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
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_projuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_projuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_projuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-11-10 02:18:57.870499','1','actanble',2,'[{\"changed\": {\"fields\": [\"last_login\", \"nickname\", \"mugshot\"]}}]',13,1),(2,'2017-11-10 02:19:17.320928','1','管理员001号::actanble',1,'[{\"added\": {}}]',12,1),(3,'2017-11-10 05:59:44.437839','2','签收',1,'[{\"added\": {}}]',8,1),(4,'2017-11-10 05:59:54.502272','3','处理',1,'[{\"added\": {}}]',8,1),(5,'2017-11-10 06:00:04.627779','4','完成',1,'[{\"added\": {}}]',8,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (13,'accounts','projuser'),(12,'accounts','usershenfen'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(7,'event','eventbase'),(11,'event','eventcate'),(9,'event','eventdetail'),(8,'event','stat'),(10,'event','stations'),(5,'sessions','session'),(6,'sites','site');
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-11-10 02:16:12.457072'),(2,'contenttypes','0002_remove_content_type_name','2017-11-10 02:16:14.473550'),(3,'auth','0001_initial','2017-11-10 02:16:25.755365'),(4,'auth','0002_alter_permission_name_max_length','2017-11-10 02:16:27.208561'),(5,'auth','0003_alter_user_email_max_length','2017-11-10 02:16:27.317942'),(6,'auth','0004_alter_user_username_opts','2017-11-10 02:16:27.442949'),(7,'auth','0005_alter_user_last_login_null','2017-11-10 02:16:27.489828'),(8,'auth','0006_require_contenttypes_0002','2017-11-10 02:16:27.536705'),(9,'auth','0007_alter_validators_add_error_messages','2017-11-10 02:16:27.583582'),(10,'auth','0008_alter_user_username_max_length','2017-11-10 02:16:27.646087'),(11,'accounts','0001_initial','2017-11-10 02:16:43.924407'),(12,'accounts','0002_auto_20171109_1427','2017-11-10 02:16:48.270971'),(13,'admin','0001_initial','2017-11-10 02:16:51.661766'),(14,'admin','0002_logentry_remove_auto_add','2017-11-10 02:16:51.771149'),(15,'event','0001_initial','2017-11-10 02:17:11.987036'),(16,'event','0002_auto_20171109_1435','2017-11-10 02:17:18.083308'),(17,'event','0003_auto_20171109_1517','2017-11-10 02:17:25.193039'),(18,'event','0004_auto_20171109_1541','2017-11-10 02:17:34.126534'),(19,'event','0005_auto_20171109_1807','2017-11-10 02:17:34.204670'),(20,'event','0006_auto_20171110_0908','2017-11-10 02:17:45.270390'),(21,'event','0007_auto_20171110_0916','2017-11-10 02:17:52.530632'),(22,'event','0008_auto_20171110_0922','2017-11-10 02:17:55.952702'),(23,'event','0009_auto_20171110_0937','2017-11-10 02:17:58.327798'),(24,'event','0010_auto_20171110_0953','2017-11-10 02:17:58.640313'),(25,'event','0011_auto_20171110_0953','2017-11-10 02:17:58.968453'),(26,'event','0012_auto_20171110_0956','2017-11-10 02:17:59.046584'),(27,'event','0013_auto_20171110_0957','2017-11-10 02:17:59.124711'),(28,'sessions','0001_initial','2017-11-10 02:18:00.624788'),(29,'sites','0001_initial','2017-11-10 02:18:01.390452'),(30,'sites','0002_alter_domain_unique','2017-11-10 02:18:01.827971');
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
INSERT INTO `django_session` VALUES ('9c64zegoo52a5h1l4ihrfr9nmsl1jr2a','M2NjMDU4NDYwN2I0YmVlODFjMzhhMzVkNzJlOGJhOGNlY2YyZmFlMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWNjb3VudHMudXNlcl9sb2dpbl9iYWNrZW5kLkVtYWlsT3JVc2VybmFtZU1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImYzNWMxYTkxOGVkMGEyOWYzNjgyYjk0ODI0ZGM5MDI3NDI1OTBmNDkifQ==','2017-11-24 02:18:44.515201'),('bi72cuwfgsrt1nnfq6p0da5tsccrjd8f','MmI4MDc3NGRmZGUxODBkMTRkYTZjZDFkZjc2NTcyYTE2MTg0YzNlYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImYzNWMxYTkxOGVkMGEyOWYzNjgyYjk0ODI0ZGM5MDI3NDI1OTBmNDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhY2NvdW50cy51c2VyX2xvZ2luX2JhY2tlbmQuRW1haWxPclVzZXJuYW1lTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-11-24 02:31:34.600993');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
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
-- Table structure for table `event_eventbase`
--

DROP TABLE IF EXISTS `event_eventbase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_eventbase` (
  `event_name` varchar(150) NOT NULL,
  `event_src` varchar(20) NOT NULL,
  `to_server` varchar(20) NOT NULL,
  `port` varchar(20) NOT NULL,
  `happened_date` date NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_cate_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_eventbase_event_cate_id_9f23a1aa_fk_event_eventcate_id` (`event_cate_id`),
  CONSTRAINT `event_eventbase_event_cate_id_9f23a1aa_fk_event_eventcate_id` FOREIGN KEY (`event_cate_id`) REFERENCES `event_eventcate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_eventbase`
--

LOCK TABLES `event_eventbase` WRITE;
/*!40000 ALTER TABLE `event_eventbase` DISABLE KEYS */;
INSERT INTO `event_eventbase` VALUES ('从 `192.168.36.3` 向 `192.36.53.98` 通过 `445`端口的 `交通` 信息泄露','192.168.36.3','192.36.53.98','445','2017-11-10',1,1),('从 `192.5.6.3` 向 `192.5.3.6` 通过 `223`端口的 `户政` 信息泄露','192.5.6.3','192.5.3.6','223','2017-11-10',2,2),('从 `187.23.45.6` 向 `136.3.6.9` 通过 `8808`端口的 `禁毒` 信息泄露','187.23.45.6','136.3.6.9','8808','2017-11-10',3,3),('从 `192.168.0.1` 向 `187.23.45.6` 通过 `443`端口的 `交通` 信息泄露','192.168.0.1','187.23.45.6','443','2017-11-10',4,1),('从 `192.168.1.1` 向 `187.23.45.6` 通过 `112`端口的 `内保` 信息泄露','192.168.1.1','187.23.45.6','112','2017-11-10',5,4),('从 `192.168.0.110` 向 `187.23.45.6` 通过 `556`端口的 `交通` 信息泄露','192.168.0.110','187.23.45.6','556','2017-11-10',6,1),('从 `192.168.0.11` 向 `187.23.45.6` 通过 `224`端口的 `交通` 信息泄露','192.168.0.11','187.23.45.6','224','2017-11-10',7,1),('从 `192.168.0.1` 向 `187.23.45.6` 通过 `1120`端口的 `网安` 信息泄露','192.168.0.1','187.23.45.6','1120','2017-11-10',8,5),('从 `192.168.0.1` 向 `187.23.45.6` 通过 `554`端口的 `交通` 信息泄露','192.168.0.1','187.23.45.6','554','2017-11-10',9,1),('从 `192.168.0.1` 向 `187.23.45.6` 通过 `1125`端口的 `交通` 信息泄露','192.168.0.1','187.23.45.6','1125','2017-11-10',10,1),('从 `192.168.0.1` 向 `187.23.45.6` 通过 `557`端口的 `交通` 信息泄露','192.168.0.1','187.23.45.6','557','2017-11-10',11,1),('从 `192.5.6.3` 向 `192.5.3.6` 通过 `223`端口的 `户政` 信息泄露','192.5.6.3','192.5.3.6','223','2017-11-10',12,2),('从 `187.23.45.6` 向 `136.3.6.9` 通过 `808`端口的 `交通` 信息泄露','187.23.45.6','136.3.6.9','808','2017-11-10',13,1),('从 `192.168.0.1` 向 `187.23.45.6` 通过 `443`端口的 `网安` 信息泄露','192.168.0.1','187.23.45.6','443','2017-11-10',14,5),('从 `192.168.156.1` 向 `187.23.45.6` 通过 `112`端口的 `内保` 信息泄露','192.168.156.1','187.23.45.6','112','2017-11-10',15,4),('从 `192.168.0.110` 向 `187.23.45.6` 通过 `556`端口的 `禁毒` 信息泄露','192.168.0.110','187.23.45.6','556','2017-11-10',16,3),('从 `192.168.0.1` 向 `187.23.45.6` 通过 `443`端口的 `交通` 信息泄露','192.168.0.1','187.23.45.6','443','2017-11-10',17,1),('从 `192.168.1.1` 向 `187.23.45.6` 通过 `112`端口的 `内保` 信息泄露','192.168.1.1','187.23.45.6','112','2017-11-10',18,4),('从 `192.168.0.110` 向 `187.23.45.6` 通过 `556`端口的 `交通` 信息泄露','192.168.0.110','187.23.45.6','556','2017-11-10',19,1),('从 `192.168.0.11` 向 `187.23.45.6` 通过 `224`端口的 `交通` 信息泄露','192.168.0.11','187.23.45.6','224','2017-11-10',20,1),('从 `192.168.0.1` 向 `187.23.45.6` 通过 `1120`端口的 `网安` 信息泄露','192.168.0.1','187.23.45.6','1120','2017-11-10',21,5);
/*!40000 ALTER TABLE `event_eventbase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_eventcate`
--

DROP TABLE IF EXISTS `event_eventcate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_eventcate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_eventcate`
--

LOCK TABLES `event_eventcate` WRITE;
/*!40000 ALTER TABLE `event_eventcate` DISABLE KEYS */;
INSERT INTO `event_eventcate` VALUES (1,'交通'),(2,'户政'),(3,'禁毒'),(4,'内保'),(5,'网安');
/*!40000 ALTER TABLE `event_eventcate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_eventdetail`
--

DROP TABLE IF EXISTS `event_eventdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_eventdetail` (
  `is_seen` tinyint(1) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `event_stat_id` int(11) NOT NULL,
  `event_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_eventdetail_event_id_bb590b56_fk_event_eventbase_id` (`event_id`),
  KEY `event_eventdetail_event_stat_id_b99bc7d0_fk_event_stat_id` (`event_stat_id`),
  CONSTRAINT `event_eventdetail_event_id_bb590b56_fk_event_eventbase_id` FOREIGN KEY (`event_id`) REFERENCES `event_eventbase` (`id`),
  CONSTRAINT `event_eventdetail_event_stat_id_b99bc7d0_fk_event_stat_id` FOREIGN KEY (`event_stat_id`) REFERENCES `event_stat` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_eventdetail`
--

LOCK TABLES `event_eventdetail` WRITE;
/*!40000 ALTER TABLE `event_eventdetail` DISABLE KEYS */;
INSERT INTO `event_eventdetail` VALUES (0,1,1,1,'2017-11-10 02:19:34.192960'),(0,2,2,1,'2017-11-10 02:19:34.333591'),(0,3,3,1,'2017-11-10 02:19:34.670288'),(0,4,4,1,'2017-11-10 02:19:34.732814'),(0,5,5,1,'2017-11-10 02:19:34.904702'),(0,6,6,1,'2017-11-10 02:19:35.014062'),(0,7,7,1,'2017-11-10 02:19:35.717216'),(0,8,8,1,'2017-11-10 02:19:36.092239'),(0,9,9,1,'2017-11-10 02:19:36.498509'),(0,10,10,1,'2017-11-10 02:19:36.607888'),(0,11,11,1,'2017-11-10 02:19:36.701645'),(0,12,12,1,'2017-11-10 02:19:36.982904'),(0,13,13,1,'2017-11-10 02:19:37.186040'),(0,14,14,1,'2017-11-10 02:19:37.764210'),(0,15,15,1,'2017-11-10 02:19:37.842345'),(0,16,16,1,'2017-11-10 02:19:37.936085'),(0,17,17,1,'2017-11-10 02:19:38.014207'),(0,18,18,1,'2017-11-10 02:19:38.264219'),(0,19,19,1,'2017-11-10 02:19:38.342348'),(0,20,20,1,'2017-11-10 02:19:38.467354'),(0,21,21,1,'2017-11-10 02:19:39.071282');
/*!40000 ALTER TABLE `event_eventdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_eventdetail_connect_person`
--

DROP TABLE IF EXISTS `event_eventdetail_connect_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_eventdetail_connect_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventdetail_id` int(11) NOT NULL,
  `projuser_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_eventdetail_connec_eventdetail_id_projuser__985b84ea_uniq` (`eventdetail_id`,`projuser_id`),
  KEY `event_eventdetail_co_projuser_id_d49f468f_fk_accounts_` (`projuser_id`),
  CONSTRAINT `event_eventdetail_co_eventdetail_id_e1f73444_fk_event_eve` FOREIGN KEY (`eventdetail_id`) REFERENCES `event_eventdetail` (`id`),
  CONSTRAINT `event_eventdetail_co_projuser_id_d49f468f_fk_accounts_` FOREIGN KEY (`projuser_id`) REFERENCES `accounts_projuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_eventdetail_connect_person`
--

LOCK TABLES `event_eventdetail_connect_person` WRITE;
/*!40000 ALTER TABLE `event_eventdetail_connect_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_eventdetail_connect_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_stat`
--

DROP TABLE IF EXISTS `event_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `extra` varchar(150) NOT NULL,
  `stat_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_stat_stat_id_aa1228b3_fk_event_stations_id` (`stat_id`),
  CONSTRAINT `event_stat_stat_id_aa1228b3_fk_event_stations_id` FOREIGN KEY (`stat_id`) REFERENCES `event_stations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_stat`
--

LOCK TABLES `event_stat` WRITE;
/*!40000 ALTER TABLE `event_stat` DISABLE KEYS */;
INSERT INTO `event_stat` VALUES (1,'事件发生无备注',1),(2,'描述无',2),(3,'描述无',3),(4,'描述无',4);
/*!40000 ALTER TABLE `event_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_stations`
--

DROP TABLE IF EXISTS `event_stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_stations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station` varchar(50) NOT NULL,
  `iStation` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_stations`
--

LOCK TABLES `event_stations` WRITE;
/*!40000 ALTER TABLE `event_stations` DISABLE KEYS */;
INSERT INTO `event_stations` VALUES (1,'发生',0),(2,'签收',11),(3,'处理',22),(4,'完成',33);
/*!40000 ALTER TABLE `event_stations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-10 14:16:06
