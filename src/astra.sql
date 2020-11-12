-- MySQL dump 10.13  Distrib 5.7.32, for Linux (x86_64)
--
-- Host: localhost    Database: astra
-- ------------------------------------------------------
-- Server version	5.7.32

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Softcam',7,'add_softcam'),(26,'Can change Softcam',7,'change_softcam'),(27,'Can delete Softcam',7,'delete_softcam'),(28,'Can view Softcam',7,'view_softcam'),(29,'Can add Stream',8,'add_stream'),(30,'Can change Stream',8,'change_stream'),(31,'Can delete Stream',8,'delete_stream'),(32,'Can view Stream',8,'view_stream'),(33,'Can add Tuner',9,'add_tuner'),(34,'Can change Tuner',9,'change_tuner'),(35,'Can delete Tuner',9,'delete_tuner'),(36,'Can view Tuner',9,'view_tuner');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
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
-- Table structure for table `core_softcam`
--

DROP TABLE IF EXISTS `core_softcam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_softcam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `name_id` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `host` varchar(50) NOT NULL,
  `port` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `user_pass` varchar(50) NOT NULL,
  `key` varchar(28) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_softcam_slug_711f16c0` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_softcam`
--

LOCK TABLES `core_softcam` WRITE;
/*!40000 ALTER TABLE `core_softcam` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_softcam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_stream`
--

DROP TABLE IF EXISTS `core_stream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_stream` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enable` tinyint(1) NOT NULL,
  `title` varchar(200) NOT NULL,
  `stream_id` varchar(200) NOT NULL,
  `url` varchar(150) NOT NULL,
  `set_map` varchar(200) DEFAULT NULL,
  `set_pnr` int(11) DEFAULT NULL,
  `set_tsid` int(11) DEFAULT NULL,
  `service_type` varchar(1) NOT NULL,
  `service_provider` varchar(200) NOT NULL,
  `service_name` varchar(200) NOT NULL,
  `input_u` varchar(200) NOT NULL,
  `output_u` varchar(200) NOT NULL,
  `scrambled` int(10) unsigned NOT NULL,
  `bitrate` int(10) unsigned NOT NULL,
  `cc_error` int(10) unsigned NOT NULL,
  `pes_error` int(10) unsigned NOT NULL,
  `ready` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_stream_url_9b047887` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_stream`
--

LOCK TABLES `core_stream` WRITE;
/*!40000 ALTER TABLE `core_stream` DISABLE KEYS */;
INSERT INTO `core_stream` VALUES (4,1,'THTMusic','THTMusic','thtmusic',NULL,NULL,NULL,'','','','dvb://adapter2_85#pnr=709','udp://238.1.2.9:1234',0,2472,0,0,0),(5,1,'Juvelirochka','Juvelirochka','juvelirochka',NULL,NULL,NULL,'','','','dvb://adapter2_85#pnr=703','udp://238.1.2.10:1234',0,4377,0,0,0),(6,1,'EuroNews','EuroNews','euronews',NULL,NULL,NULL,'','','','dvb://adapter2_85#pnr=714&cas','udp://238.1.5.10:1234',0,2755,0,28,0),(7,1,'U TV','U TV','u-tv',NULL,NULL,NULL,'','','','dvb://adapter2_85#pnr=707','udp://238.1.2.6:1234',0,2672,0,0,0),(8,1,'Souz','Souz','souz',NULL,NULL,NULL,'','','','dvb://adapter2_85#pnr=702','udp://238.1.2.5:1234',0,1924,0,0,0),(9,1,'CTC Love','CTC Love','ctc-love',NULL,NULL,NULL,'','','','dvb://adapter2_85#pnr=712','udp://238.1.2.34:1234',0,1955,0,0,0),(10,1,'8 Kanal','8 Kanal','8-kanal',NULL,NULL,NULL,'','','','dvb://adapter2_85#pnr=705','udp://238.1.2.44:1234',0,1788,0,0,0),(11,1,'Europa Plus','Europa Plus','europa-plus',NULL,NULL,NULL,'','','','dvb://adapter0_85#pnr=391','udp://238.1.5.1:1234',0,315,0,0,0),(14,1,'THT4','THT4','tht4',NULL,NULL,NULL,'','','','dvb://adapter1_75#pnr=820','udp://238.1.2.84:1234',0,3156,0,0,0),(15,1,'Super','Super','super',NULL,NULL,NULL,'','','','dvb://adapter1_75#pnr=830','udp://238.1.2.12:1234',0,3251,0,0,0),(16,1,'MirHD','MirHD','mirhd',NULL,NULL,NULL,'','','','dvb://adapter1_75#pnr=940','udp://238.1.2.13:1234',0,7968,0,0,0),(17,1,'2x2','2x2','2x2',NULL,NULL,NULL,'','','','dvb://adapter1_75#pnr=910','udp://238.1.2.32:1234',0,2482,0,0,0),(18,1,'Match! Planeta','Match! Planeta','match-planeta',NULL,NULL,NULL,'','','','dvb://adapter3_75#pnr=420','udp://238.1.2.7:1234',0,2283,0,0,0),(19,1,'RU.TV','RU.TV','rutv',NULL,NULL,NULL,'','','','dvb://adapter3_75#pnr=340','udp://238.1.2.73:1234',0,2535,0,0,0),(20,1,'DFM','DFM','dfm',NULL,NULL,NULL,'','','','dvb://adapter3_75#pnr=370','udp://238.1.5.2:1234',0,346,0,0,0),(21,1,'HIT FM','HIT FM','hit-fm',NULL,NULL,NULL,'','','','dvb://adapter3_75#pnr=380','udp://238.1.5.3:1234',0,346,0,0,0),(22,1,'Maximum','Maximum','maximum',NULL,NULL,NULL,'','','','dvb://adapter3_75#pnr=390','udp://238.1.5.4:1234',0,346,0,0,0),(23,1,'Russkoe Radio','Russkoe Radio','russkoe-radio',NULL,NULL,NULL,'','','','dvb://adapter3_75#pnr=400','udp://238.1.5.5:1234',0,346,0,0,0),(24,1,'Radio Zvezda','Radio Zvezda','radio-zvezda',NULL,NULL,NULL,'','','','dvb://adapter3_75#pnr=430','udp://238.1.5.6:1234',0,335,0,0,0);
/*!40000 ALTER TABLE `core_stream` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_tuner`
--

DROP TABLE IF EXISTS `core_tuner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_tuner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `dvb_id` varchar(25) NOT NULL,
  `url` varchar(50) NOT NULL,
  `adapter_id` varchar(200) NOT NULL,
  `signal_type` varchar(2) NOT NULL,
  `frequency` smallint(6) NOT NULL,
  `polarization` varchar(2) NOT NULL,
  `symbolrate` smallint(6) NOT NULL,
  `lof1` smallint(6) NOT NULL,
  `lof2` smallint(6) NOT NULL,
  `slof` smallint(6) NOT NULL,
  `snr` int(10) unsigned NOT NULL,
  `bitrate` int(10) unsigned NOT NULL,
  `unc` varchar(10) NOT NULL,
  `ber` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_tuner_url_71644463` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_tuner`
--

LOCK TABLES `core_tuner` WRITE;
/*!40000 ALTER TABLE `core_tuner` DISABLE KEYS */;
INSERT INTO `core_tuner` VALUES (1,'adapter0_85','adapter0_85','adapter0','0','S',11720,'V',28800,0,0,0,0,0,'0',0),(2,'adapter2_85','adapter2_85','adapter2_85','2','S',12000,'H',28000,0,0,0,0,0,'0',0),(3,'adapter1_75','adapter1_75','adapter1_75','1','S',11531,'V',22000,0,0,0,73,32,'0',0),(4,'adapter3_75','adapter3_75','adapter3_75','3','S',11559,'V',22000,0,0,0,72,31,'0',0);
/*!40000 ALTER TABLE `core_tuner` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'core','softcam'),(8,'core','stream'),(9,'core','tuner'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-11-10 11:21:30.290249'),(2,'auth','0001_initial','2020-11-10 11:21:31.283693'),(3,'admin','0001_initial','2020-11-10 11:21:34.834949'),(4,'admin','0002_logentry_remove_auto_add','2020-11-10 11:21:35.675769'),(5,'admin','0003_logentry_add_action_flag_choices','2020-11-10 11:21:35.701453'),(6,'contenttypes','0002_remove_content_type_name','2020-11-10 11:21:36.323991'),(7,'auth','0002_alter_permission_name_max_length','2020-11-10 11:21:36.397135'),(8,'auth','0003_alter_user_email_max_length','2020-11-10 11:21:36.476359'),(9,'auth','0004_alter_user_username_opts','2020-11-10 11:21:36.503835'),(10,'auth','0005_alter_user_last_login_null','2020-11-10 11:21:36.853971'),(11,'auth','0006_require_contenttypes_0002','2020-11-10 11:21:36.878010'),(12,'auth','0007_alter_validators_add_error_messages','2020-11-10 11:21:36.904853'),(13,'auth','0008_alter_user_username_max_length','2020-11-10 11:21:36.969343'),(14,'auth','0009_alter_user_last_name_max_length','2020-11-10 11:21:37.031283'),(15,'auth','0010_alter_group_name_max_length','2020-11-10 11:21:37.104421'),(16,'auth','0011_update_proxy_permissions','2020-11-10 11:21:37.139847'),(17,'core','0001_initial','2020-11-10 11:21:37.610264'),(18,'sessions','0001_initial','2020-11-10 11:21:38.135701'),(19,'core','0002_auto_20201110_1132','2020-11-10 11:32:34.753083');
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

-- Dump completed on 2020-11-12 17:21:55
