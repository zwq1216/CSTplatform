-- MySQL dump 10.13  Distrib 5.7.19, for Win64 (x86_64)
--
-- Host: localhost    Database: cstplatform
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
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
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can add group',3,'add_group'),(9,'Can change group',3,'change_group'),(10,'Can delete group',3,'delete_group'),(11,'Can view group',3,'view_group'),(12,'Can view permission',2,'view_permission'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add 用户信息',6,'add_userprofile'),(22,'Can change 用户信息',6,'change_userprofile'),(23,'Can delete 用户信息',6,'delete_userprofile'),(24,'Can add 邮箱验证',7,'add_emailverifyrecord'),(25,'Can change 邮箱验证',7,'change_emailverifyrecord'),(26,'Can delete 邮箱验证',7,'delete_emailverifyrecord'),(27,'Can view 邮箱验证',7,'view_emailverifyrecord'),(28,'Can view 用户信息',6,'view_userprofile'),(29,'Can add 商品信息',8,'add_goods'),(30,'Can change 商品信息',8,'change_goods'),(31,'Can delete 商品信息',8,'delete_goods'),(32,'Can add 商品实体图',9,'add_goodsimage'),(33,'Can change 商品实体图',9,'change_goodsimage'),(34,'Can delete 商品实体图',9,'delete_goodsimage'),(35,'Can view 商品信息',8,'view_goods'),(36,'Can view 商品实体图',9,'view_goodsimage'),(37,'Can add Bookmark',10,'add_bookmark'),(38,'Can change Bookmark',10,'change_bookmark'),(39,'Can delete Bookmark',10,'delete_bookmark'),(40,'Can add User Setting',11,'add_usersettings'),(41,'Can change User Setting',11,'change_usersettings'),(42,'Can delete User Setting',11,'delete_usersettings'),(43,'Can add User Widget',12,'add_userwidget'),(44,'Can change User Widget',12,'change_userwidget'),(45,'Can delete User Widget',12,'delete_userwidget'),(46,'Can add log entry',13,'add_log'),(47,'Can change log entry',13,'change_log'),(48,'Can delete log entry',13,'delete_log'),(49,'Can view Bookmark',10,'view_bookmark'),(50,'Can view log entry',13,'view_log'),(51,'Can view User Setting',11,'view_usersettings'),(52,'Can view User Widget',12,'view_userwidget'),(53,'Can add 可注册学生信息',14,'add_useractive'),(54,'Can change 可注册学生信息',14,'change_useractive'),(55,'Can delete 可注册学生信息',14,'delete_useractive'),(56,'Can view 可注册学生信息',14,'view_useractive'),(57,'Can add 用户收藏',15,'add_userfavorite'),(58,'Can change 用户收藏',15,'change_userfavorite'),(59,'Can delete 用户收藏',15,'delete_userfavorite'),(60,'Can add 用户商品',16,'add_usergoods'),(61,'Can change 用户商品',16,'change_usergoods'),(62,'Can delete 用户商品',16,'delete_usergoods'),(63,'Can view 用户收藏',15,'view_userfavorite'),(64,'Can view 用户商品',16,'view_usergoods'),(65,'Can add 轮播图',17,'add_banner'),(66,'Can change 轮播图',17,'change_banner'),(67,'Can delete 轮播图',17,'delete_banner'),(68,'Can view 轮播图',17,'view_banner'),(69,'Can add captcha store',18,'add_captchastore'),(70,'Can change captcha store',18,'change_captchastore'),(71,'Can delete captcha store',18,'delete_captchastore'),(72,'Can view captcha store',18,'view_captchastore');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=635 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
INSERT INTO `captcha_captchastore` VALUES (631,'SMBU','smbu','b4d7606f0fc0c13aa43b6ed39cd6e5a0b9451d87','2018-07-06 18:24:39.652000'),(632,'HMWR','hmwr','26b647c83241c5009b5230f5701dd94767f54eaa','2018-07-06 18:24:44.281000'),(633,'FYWY','fywy','1caf14893a86c85a044ca1aa782402467feae7a3','2018-07-06 18:24:53.338000'),(634,'AODX','aodx','0f7c1570aafe3cd696b20469b92cfe109aac5956','2018-07-06 18:25:00.489000');
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
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
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(18,'captcha','captchastore'),(4,'contenttypes','contenttype'),(8,'goods','goods'),(9,'goods','goodsimage'),(15,'operation','userfavorite'),(16,'operation','usergoods'),(5,'sessions','session'),(17,'users','banner'),(7,'users','emailverifyrecord'),(14,'users','useractive'),(6,'users','userprofile'),(10,'xadmin','bookmark'),(13,'xadmin','log'),(11,'xadmin','usersettings'),(12,'xadmin','userwidget');
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
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-04-25 17:12:06.849000'),(2,'contenttypes','0002_remove_content_type_name','2018-04-25 17:12:07.849000'),(3,'auth','0001_initial','2018-04-25 17:12:11.904000'),(4,'auth','0002_alter_permission_name_max_length','2018-04-25 17:12:12.796000'),(5,'auth','0003_alter_user_email_max_length','2018-04-25 17:12:12.846000'),(6,'auth','0004_alter_user_username_opts','2018-04-25 17:12:12.892000'),(7,'auth','0005_alter_user_last_login_null','2018-04-25 17:12:12.935000'),(8,'auth','0006_require_contenttypes_0002','2018-04-25 17:12:12.971000'),(9,'auth','0007_alter_validators_add_error_messages','2018-04-25 17:12:13.040000'),(10,'users','0001_initial','2018-04-25 17:12:17.833000'),(11,'admin','0001_initial','2018-04-25 17:12:20.585000'),(12,'admin','0002_logentry_remove_auto_add','2018-04-25 17:12:20.733000'),(13,'goods','0001_initial','2018-04-25 17:12:21.920000'),(14,'sessions','0001_initial','2018-04-25 17:12:22.396000'),(15,'xadmin','0001_initial','2018-04-25 17:12:26.675000'),(16,'xadmin','0002_log','2018-04-25 17:12:29.792000'),(17,'xadmin','0003_auto_20160715_0100','2018-04-25 17:12:31.988000'),(18,'goods','0002_auto_20180426_1010','2018-04-26 10:10:22.292000'),(19,'users','0002_auto_20180426_1010','2018-04-26 10:10:23.483000'),(20,'goods','0003_goods_user','2018-04-26 10:46:54.540000'),(21,'goods','0004_auto_20180426_1049','2018-04-26 10:49:44.298000'),(22,'operation','0001_initial','2018-04-26 12:48:01.397000'),(23,'users','0003_useractive_active','2018-04-26 13:00:24.997000'),(24,'goods','0005_auto_20180426_1502','2018-04-26 15:03:02.326000'),(25,'operation','0002_auto_20180426_1550','2018-04-26 15:50:32.254000'),(26,'users','0004_banner','2018-04-27 13:21:10.689000'),(27,'captcha','0001_initial','2018-04-27 13:29:47.792000'),(28,'users','0005_auto_20180428_1645','2018-04-28 16:45:29.603000'),(29,'users','0006_userprofile_image','2018-04-29 09:12:55.856000'),(30,'goods','0006_goods_category','2018-04-29 10:08:36.912000');
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
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('00jmnrncmir1loijmwp7jmnzs10339za','NTVkZDEyNDRmOTQ2OGM0NTY3YzU2MzhhNTEzM2UxOTBiNmZhYmE0Mjp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5MjdmN2ZiZjEyMmE3NWU3NTJkOTQyYmRiZGY1MzZhMzBjZDZmYjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-05-11 10:13:40.826000'),('1pq6tevac2vr7iugna4kaidx0bgp2o37','NmI1YTczYzRmMDY0MzhkNDBlZDRmNzU4ZjAxM2I0MzIxYmRmZjFkNjp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5MjdmN2ZiZjEyMmE3NWU3NTJkOTQyYmRiZGY1MzZhMzBjZDZmYjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2018-05-14 17:17:52.674000'),('7gyrr005r7tg9mst0yyvdhmwakt40a0u','ZmZhNzMzNTZmMDEyNTMzNjI3YjNlNDFmYjZhNjdjOWIyNjlkN2FjNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiTElTVF9RVUVSWSI6W1sib3BlcmF0aW9uIiwidXNlcmdvb2RzIl0sIiJdLCJfYXV0aF91c2VyX2hhc2giOiJlOTI3ZjdmYmYxMjJhNzVlNzUyZDk0MmJkYmRmNTM2YTMwY2Q2ZmI5IiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2018-05-10 15:38:08.845000'),('7ktr7nkhzhq3xoerucyph7vchcs0a6zq','ZTM3NDc3MmU4Yzg5ZmNiMWRmNGY4Mjk0ZTdkNGFlNWIwZjBkOGMwMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjViMzAzZTMyNTlhOWI0NmJjZTJhMTRiYzAxMTcxMTJkYzgwNDNmNGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjQifQ==','2018-07-20 18:20:11.389000'),('afa7qfkpiesodawieddo5qvw22d7y5id','NTdlZDI5NzlkZDM1MTZjMWM2ZTQ5ZjVhYjNkOTYwYjQ1YzUyNDE0Yjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJMSVNUX1FVRVJZIjpbWyJ1c2VycyIsInVzZXJwcm9maWxlIl0sIl9kb189ZXhwb3J0JmV4cG9ydF90eXBlPWpzb24mZXhwb3J0X2pzb25fZm9ybWF0PW9uIl0sIl9hdXRoX3VzZXJfaGFzaCI6IjdjOWIwMmZiMjNmZmNiNmM4NTVhYTA3NzkwZWRmYTE2NDdmYjg2NDYiLCJfYXV0aF91c2VyX2lkIjoiMSJ9','2018-05-27 08:22:10.462000'),('bcrawo912s183u32mft1ow4e2dh73llx','NjUxOTk2ZTJmMGI0N2RiMTQ3Y2Y4ZDFlNTI4ZjMzMTQyOTYxNTI5Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiTElTVF9RVUVSWSI6W1siZ29vZHMiLCJnb29kc2ltYWdlIl0sIiJdLCJfYXV0aF91c2VyX2hhc2giOiJlOTI3ZjdmYmYxMjJhNzVlNzUyZDk0MmJkYmRmNTM2YTMwY2Q2ZmI5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==','2018-05-10 19:24:19.271000'),('bp385bcotja2lemuqtl2w531t5q5un1s','ZmU4YWM1MjQyYTgyYWM3YTNlMTE3MmY4MjVkYTEwMDM0ZmFkODc3ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiTElTVF9RVUVSWSI6W1sidXNlcnMiLCJ1c2VyYWN0aXZlIl0sIiJdLCJfYXV0aF91c2VyX2hhc2giOiI3YzliMDJmYjIzZmZjYjZjODU1YWEwNzc5MGVkZmExNjQ3ZmI4NjQ2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCJ9','2018-05-14 20:25:31.432000'),('cjv4wul9rshepsmfqwupgkifi61vexrh','MjJjMGUwMzcxODNkM2E5YWIyM2NhNmMzNTViMDYwNzc3YjA5MWVkNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE3NTU3ZTJhMGMwYmFkZDM4NGUxNTVmZTBjMjc1N2FmMzA5MjcwY2MiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjMifQ==','2018-05-12 15:19:48.713000'),('e4nxw4gzmd1si3mzqv3rhnke8ss7tnrm','NzU0ZTg1MDM0YTFmNmEwYzc2OTY1YmNhMDAyODBlMzQyYTFhMWU1YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiTElTVF9RVUVSWSI6W1sidXNlcnMiLCJ1c2VycHJvZmlsZSJdLCImX3FfPTEmX2NvbHM9aWQuX19zdHJfXyJdLCJfYXV0aF91c2VyX2hhc2giOiJlOTI3ZjdmYmYxMjJhNzVlNzUyZDk0MmJkYmRmNTM2YTMwY2Q2ZmI5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==','2018-05-10 15:56:19.890000'),('egcihgxdwev4hc7un8bu03qjxs0lf5r8','NmI1YTczYzRmMDY0MzhkNDBlZDRmNzU4ZjAxM2I0MzIxYmRmZjFkNjp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5MjdmN2ZiZjEyMmE3NWU3NTJkOTQyYmRiZGY1MzZhMzBjZDZmYjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2018-05-12 08:16:58.193000'),('hyzagw190ref0j7ta5vmynlyw3f4ae7m','NmQwZjA0ODJhZjBhNDMxZjFiYzY2NTZhNzhjMTZhOWFiYjRlZmUwOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiTElTVF9RVUVSWSI6W1siZ29vZHMiLCJnb29kcyJdLCIiXSwiX2F1dGhfdXNlcl9oYXNoIjoiZTkyN2Y3ZmJmMTIyYTc1ZTc1MmQ5NDJiZGJkZjUzNmEzMGNkNmZiOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-05-10 15:05:41.365000'),('j9mbo0v4wp1d1y5fq4gho2gd98c0lzqr','ODA1YzQ0MGNkNTE0NjRiNWJiYTRiNmY2ZDgyOTVkNjY0NzBlZTNlZjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiTElTVF9RVUVSWSI6W1sidXNlcnMiLCJ1c2VycHJvZmlsZSJdLCIiXSwiX2F1dGhfdXNlcl9oYXNoIjoiZTkyN2Y3ZmJmMTIyYTc1ZTc1MmQ5NDJiZGJkZjUzNmEzMGNkNmZiOSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-05-10 15:35:21.481000'),('lbqgtct5oo3vtoyhv02mhy8psli59gbk','NDY0ZmUwNDg2YTgzZWRjNzVmMWRjMzY0MzljMjBmZTc3OGNkZTk5OTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJMSVNUX1FVRVJZIjpbWyJ1c2VycyIsInVzZXJwcm9maWxlIl0sIiJdLCJfYXV0aF91c2VyX2hhc2giOiI3YzliMDJmYjIzZmZjYjZjODU1YWEwNzc5MGVkZmExNjQ3ZmI4NjQ2IiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2018-05-14 19:54:23.043000'),('tqla9xraqb81avzb0egr5vral0uv2jtt','NjUxOTk2ZTJmMGI0N2RiMTQ3Y2Y4ZDFlNTI4ZjMzMTQyOTYxNTI5Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiTElTVF9RVUVSWSI6W1siZ29vZHMiLCJnb29kc2ltYWdlIl0sIiJdLCJfYXV0aF91c2VyX2hhc2giOiJlOTI3ZjdmYmYxMjJhNzVlNzUyZDk0MmJkYmRmNTM2YTMwY2Q2ZmI5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==','2018-05-10 14:57:17.063000'),('uimih58lkwwbgjbdbxh6886rlruc34iq','YTc0OGU2NmRmNTkwZDIyYmFiZDVkYjg1N2UyZTUwMzI4OWNhNDVjZjp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiTElTVF9RVUVSWSI6W1sieGFkbWluIiwibG9nIl0sIiJdLCJfYXV0aF91c2VyX2hhc2giOiI1YjMwM2UzMjU5YTliNDZiY2UyYTE0YmMwMTE3MTEyZGM4MDQzZjRkIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCJ9','2018-07-20 08:48:25.100000'),('vq9ujuv14m70p59mxi8rlqohjn6zph6e','NTk2OTk1MWZhMDdlNzZhYjU0ZmM5NjczMzYxZTIxZDcyNDVhOWU4Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiTElTVF9RVUVSWSI6W1sidXNlcnMiLCJ1c2VyYWN0aXZlIl0sIiJdLCJfYXV0aF91c2VyX2hhc2giOiJlOTI3ZjdmYmYxMjJhNzVlNzUyZDk0MmJkYmRmNTM2YTMwY2Q2ZmI5IiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2018-05-10 12:11:17.035000');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_goods`
--

DROP TABLE IF EXISTS `goods_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_title` varchar(50) NOT NULL,
  `price` varchar(20) NOT NULL,
  `oprice` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `description` varchar(500) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goods_e8701ad4` (`user_id`),
  CONSTRAINT `goods_goods_user_id_b4661309_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_goods`
--

LOCK TABLES `goods_goods` WRITE;
/*!40000 ALTER TABLE `goods_goods` DISABLE KEYS */;
INSERT INTO `goods_goods` VALUES (3,'转让手机2','500','1500','11#306','15716659774','转让手机2',0,'2018-04-29 10:15:00.000000',7,3),(4,'转让手机3','500','1500','11#307','15716659773','转让手机3',0,'2018-04-29 10:17:00.000000',3,3),(5,'转让手机4','600','1800','11#308','15716659772','转让手机4',0,'2018-04-29 10:17:00.000000',3,3),(6,'转让手机5','200','1000','12#201','15716659773','转让手机5',0,'2018-04-29 10:18:00.000000',1,3),(7,'转让手机6','300','1200','12#108','15716659775','转让手机6',0,'2018-04-29 10:19:00.000000',1,3),(9,'转让书籍2','20','30','14#206','15716659770','转让书籍2',0,'2018-04-29 10:20:00.000000',1,1),(10,'转让书籍3','25','50','11#305','15716659773','转让书籍3',0,'2018-04-29 10:21:00.000000',3,1),(11,'转让书籍4','15','30','10#503','15716659774','转让书籍4',0,'2018-04-29 10:22:00.000000',7,1),(12,'转让书籍5','20','40','20#302','15716659774','转让书籍5',0,'2018-04-29 10:23:00.000000',3,1),(13,'转让书籍6','63','285','21#309','15716659770','转让书籍6',0,'2018-04-29 10:23:00.000000',1,1),(14,'转让自行车1','100','400','16#404','15716659774','转让自行车1',0,'2018-04-29 10:24:00.000000',3,2),(15,'转让自行车2','200','600','15#202','15716659774','转让自行车2',0,'2018-04-29 10:25:00.000000',1,2),(16,'转让自行车3','50','200','18#301','15716659774','转让自行车3',0,'2018-04-29 10:26:00.000000',3,2),(17,'转让自行车4','65','180','11#306','15716659774','转让自行车4',0,'2018-04-29 10:27:00.000000',7,2),(18,'转让自行车5','500','1500','11#308','15716659770','转让自行车5',0,'2018-04-29 10:27:00.000000',7,2),(19,'转让自行车6','200','500','12#108','15716659775','转让自行车6',0,'2018-04-29 10:28:00.000000',3,2),(20,'其他转让1','500','1500','11#306','15716659774','其他转让1',0,'2018-04-29 10:30:00.000000',1,4),(21,'其他转让2','200','1000','12#108','15716659775','其他转让2',0,'2018-04-29 10:30:00.000000',3,4),(23,'其他转让4','600','1800','11#308','15716659775','其他转让4',0,'2018-04-29 10:31:00.000000',1,4),(24,'其他转让5','500','1800','11#308','15716659775','其他转让5',0,'2018-04-29 10:32:00.000000',3,4),(25,'其他转让6','600','1000','11#305','15716659770','其他转让6',0,'2018-04-29 10:33:00.000000',3,4),(26,'旧手机','500','1500','11#308','15716659774','旧手机',0,'2018-04-30 10:36:03.418000',1,1),(27,'旧手机2','500','1500','11#305','15716659774','旧手机',0,'2018-04-30 10:38:39.962000',1,1),(28,'旧手机3','500','1500','11#308','15716659774','旧手机3',0,'2018-04-30 11:05:26.798000',1,3),(29,'旧手机4','500','1500','11#308','15716659774','旧手机4',0,'2018-04-30 11:09:29.520000',1,3),(30,'旧手机5','500','1500','11#305','15716659774','旧手机5',0,'2018-04-30 11:16:27.453000',1,3),(34,'二手电脑','2000','5600','11#305','15716659774','ASUS 4G 2核  五成新',0,'2018-04-30 19:45:41.125000',7,3);
/*!40000 ALTER TABLE `goods_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_goodsimage`
--

DROP TABLE IF EXISTS `goods_goodsimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_goodsimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goodsimage_goods_id_08cb23b1_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `goods_goodsimage_goods_id_08cb23b1_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_goodsimage`
--

LOCK TABLES `goods_goodsimage` WRITE;
/*!40000 ALTER TABLE `goods_goodsimage` DISABLE KEYS */;
INSERT INTO `goods_goodsimage` VALUES (2,'images/2018_04/myblog.jpg',0,NULL,'2018-04-26 14:55:00.000000'),(3,'images/2018_04/img1.jpg',0,NULL,'2018-04-26 15:55:00.000000'),(4,'images/2018_04/img2.jpg',0,25,'2018-04-29 10:35:00.000000'),(5,'images/2018_04/default_middile_2_3eQH1Bm.png',0,24,'2018-04-29 10:35:00.000000'),(6,'images/2018_04/img4.jpg',0,23,'2018-04-29 10:35:00.000000'),(7,'images/2018_04/img2_sTmU0o1.jpg',0,NULL,'2018-04-29 10:36:00.000000'),(8,'images/2018_04/img5.jpg',0,21,'2018-04-29 10:36:00.000000'),(9,'images/2018_04/img1_he2A0Cp.jpg',0,20,'2018-04-29 10:36:00.000000'),(10,'images/2018_04/img4_rFU38fw.jpg',0,19,'2018-04-29 10:37:00.000000'),(11,'images/2018_04/img4_CtuVbuu.jpg',0,18,'2018-04-29 10:37:00.000000'),(12,'images/2018_04/img4_O8gkb6E.jpg',0,17,'2018-04-29 10:38:00.000000'),(13,'images/2018_04/img4_N68s5QP.jpg',0,16,'2018-04-29 10:38:00.000000'),(14,'images/2018_04/img4_bB3qRWo.jpg',0,15,'2018-04-29 10:38:00.000000'),(15,'images/2018_04/img4_YaO6y88.jpg',0,14,'2018-04-29 10:38:00.000000'),(16,'images/2018_04/img6.jpg',0,13,'2018-04-29 10:39:00.000000'),(17,'images/2018_04/img6_uvWw2mV.jpg',0,12,'2018-04-29 10:39:00.000000'),(18,'images/2018_04/img6_z2WKs6R.jpg',0,11,'2018-04-29 10:39:00.000000'),(19,'images/2018_04/img6_Ehkc8eT.jpg',0,9,'2018-04-29 10:39:00.000000'),(20,'images/2018_04/img6_zdyxWUT.jpg',0,NULL,'2018-04-29 10:40:00.000000'),(21,'images/2018_04/img1_QmyYFa8.jpg',0,7,'2018-04-29 10:40:00.000000'),(22,'images/2018_04/img1_noCmIEZ.jpg',0,6,'2018-04-29 10:40:00.000000'),(23,'images/2018_04/img1_1dG7CkL.jpg',0,5,'2018-04-29 10:40:00.000000'),(24,'images/2018_04/img1_YnclzLK.jpg',0,4,'2018-04-29 10:41:00.000000'),(25,'images/2018_04/img1_bSdwkyc.jpg',0,3,'2018-04-29 10:41:00.000000'),(26,'images/2018_04/img6_CjeqlhS.jpg',0,10,'2018-04-29 14:01:00.000000'),(27,'images/2018_04/default_middile_2_fUX1ii9.png',0,7,'2018-04-29 15:09:00.000000'),(28,'images/2018_04/img2_zgAlKMe.jpg',0,NULL,'2018-04-29 16:44:00.000000'),(29,'images/2018_04/default_middile_2_qkPGEoX.png',0,NULL,'2018-04-29 16:44:00.000000'),(30,'images/2018_04/img5_W9zeVa0.jpg',0,NULL,'2018-04-29 16:44:00.000000'),(31,'images/2018_04/default_middile_2_iIinKQq.png',0,26,'2018-04-30 10:36:03.511000'),(32,'images/2018_04/default_middile_2_q6x6WH8.png',0,27,'2018-04-30 10:38:40.319000'),(33,'images/2018_04/myblog_FjW3h1b.jpg',0,28,'2018-04-30 11:05:26.955000'),(34,'images/2018_04/default_middile_2_Ia3cScN.png',0,29,'2018-04-30 11:09:29.637000'),(35,'images/2018_04/myblog_WOmqRlg.jpg',0,30,'2018-04-30 11:16:27.606000'),(36,'images/2018_04/myblog_BtW477r.jpg',0,NULL,'2018-04-30 11:21:40.843000'),(37,'images/2018_04/default_middile_2_6owFsfQ.png',0,NULL,'2018-04-30 11:25:21.112000'),(38,'images/2018_04/myblog_pNNQoY3.jpg',0,NULL,'2018-04-30 11:25:21.167000'),(39,'images/2018_04/default_middile_2_XbCmB0H.png',0,NULL,'2018-04-30 11:25:21.323000'),(40,'images/2018_04/default_middile_2_it97hDI.png',0,NULL,'2018-04-30 11:49:52.187000'),(41,'images/2018_04/4e136c0fe40de2787691481a26ba6ca3.jpg',0,34,'2018-04-30 19:45:41.240000'),(42,'images/2018_04/e09c8710921c23aae22dbcd55b317b4e.jpg',0,34,'2018-04-30 19:45:41.284000'),(43,'images/2018_04/20274d1d748bf643ab2c5092ace4d1f1.jpg',0,34,'2018-04-30 19:45:41.361000');
/*!40000 ALTER TABLE `goods_goodsimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_userfavorite`
--

DROP TABLE IF EXISTS `operation_userfavorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_userfavorite`
--

LOCK TABLES `operation_userfavorite` WRITE;
/*!40000 ALTER TABLE `operation_userfavorite` DISABLE KEYS */;
INSERT INTO `operation_userfavorite` VALUES (36,11,2,'2018-04-30 13:35:38.696000',1),(43,9,2,'2018-04-30 16:28:03.310000',1),(44,3,1,'2018-04-30 17:15:27.790000',1),(45,12,2,'2018-04-30 19:47:14.523000',7),(46,3,1,'2018-04-30 19:47:16.420000',7);
/*!40000 ALTER TABLE `operation_userfavorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usergoods`
--

DROP TABLE IF EXISTS `operation_usergoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_usergoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usergoods_goods_id_af0ea9a5_fk_goods_goods_id` (`goods_id`),
  KEY `operation_usergoods_user_id_75cb9d8b_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_usergoods_goods_id_af0ea9a5_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`),
  CONSTRAINT `operation_usergoods_user_id_75cb9d8b_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usergoods`
--

LOCK TABLES `operation_usergoods` WRITE;
/*!40000 ALTER TABLE `operation_usergoods` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation_usergoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_banner`
--

DROP TABLE IF EXISTS `users_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_banner`
--

LOCK TABLES `users_banner` WRITE;
/*!40000 ALTER TABLE `users_banner` DISABLE KEYS */;
INSERT INTO `users_banner` VALUES (1,'电子产品','banner/2018/04/img1.jpg','https://bbs.csdn.net/home',1,'2018-04-29 10:50:00.000000'),(2,'机动类商品','banner/2018/04/img4.jpg','https://bbs.csdn.net/home',2,'2018-04-29 10:52:00.000000'),(3,'书籍类商品','banner/2018/04/img6.jpg','https://bbs.csdn.net/home',3,'2018-04-29 10:53:00.000000'),(4,'其他','banner/2018/04/myblog.jpg','https://bbs.csdn.net/home',4,'2018-04-29 10:53:00.000000');
/*!40000 ALTER TABLE `users_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_emailverifyrecord`
--

DROP TABLE IF EXISTS `users_emailverifyrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(30) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_emailverifyrecord`
--

LOCK TABLES `users_emailverifyrecord` WRITE;
/*!40000 ALTER TABLE `users_emailverifyrecord` DISABLE KEYS */;
INSERT INTO `users_emailverifyrecord` VALUES (4,'fM9WSSZeTm+CW67yg+t/XA==','15716659774@163.com','register','2018-04-28 19:21:33.505000','2018-04-28 19:21:33.505000'),(5,'Ej/LvWseSKWjzEclZq/JVg==','15716659774@163.com','forget','2018-04-28 21:11:48.552000','2018-04-28 21:11:48.552000'),(6,'NwsfMP7gRDi2SaP6aeI26Q==','15716659774@163.com','forget','2018-04-28 21:13:38.496000','2018-04-28 21:13:38.496000'),(7,'GUDzSZpvQea/Cx/KG/mjOQ==','15716659774@163.com','forget','2018-04-28 21:15:04.799000','2018-04-28 21:15:04.799000'),(8,'vt4AkARbQh+ncl0ozeBZDw==','15716659774@163.com','forget','2018-04-28 21:28:09.802000','2018-04-28 21:28:09.802000'),(9,'MUR4Ww8ESF+AtA4FfmR+Xg==','15716659774@163.com','forget','2018-04-28 21:35:05.535000','2018-04-28 21:35:05.535000'),(10,'vbTOmuoKSCivONS+C6e90w==','15716659774@163.com','forget','2018-04-29 08:57:45.780000','2018-04-29 08:57:45.780000'),(11,'CS6Ju/GuQui2IBoA37/nCw==','15716659774@163.com','forget','2018-04-29 09:05:28.862000','2018-04-29 09:05:28.862000');
/*!40000 ALTER TABLE `users_emailverifyrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_useractive`
--

DROP TABLE IF EXISTS `users_useractive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_useractive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentid` varchar(20) NOT NULL,
  `grade` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_useractive`
--

LOCK TABLES `users_useractive` WRITE;
/*!40000 ALTER TABLE `users_useractive` DISABLE KEYS */;
INSERT INTO `users_useractive` VALUES (1,'1515925687','15云计算3班','zzz','2018-04-26 10:12:00.000000',1),(2,'1515925686','15云计算3班','qqq','2018-04-28 12:39:00.000000',0),(3,'1515925685','15云计算3班','sss','2018-04-28 12:40:00.000000',1),(4,'1515925600','15云计算3班','张三','2018-05-13 08:14:15.937000',0),(5,'1515925601','15云计算3班','李四','2018-05-13 08:14:16.035000',0),(6,'1515925602','15云计算3班','王五','2018-05-13 08:14:16.079000',0),(7,'1515925603','15云计算3班','李留','2018-05-13 08:14:16.146000',0),(8,'1515925604','15云计算3班','秦琪','2018-05-13 08:14:16.203000',0),(9,'1515925600','15云计算3班','张三','2018-05-13 08:16:28.845000',0),(10,'1515925601','15云计算3班','李四','2018-05-13 08:16:28.893000',0),(11,'1515925602','15云计算3班','王五','2018-05-13 08:16:28.914000',0),(12,'1515925603','15云计算3班','李留','2018-05-13 08:16:28.948000',0),(13,'1515925604','15云计算3班','秦琪','2018-05-13 08:16:29.002000',0);
/*!40000 ALTER TABLE `users_useractive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile`
--

DROP TABLE IF EXISTS `users_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `studentid` varchar(20) NOT NULL,
  `grade` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `altertime` datetime(6) NOT NULL,
  `activetime` datetime(6) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile`
--

LOCK TABLES `users_userprofile` WRITE;
/*!40000 ALTER TABLE `users_userprofile` DISABLE KEYS */;
INSERT INTO `users_userprofile` VALUES (1,'pbkdf2_sha256$24000$89D97ftrTBw0$eq36QWxUWMh8YivQSOZNrbIf4YiS0SH2tVRN4HAHgMY=','2018-05-12 21:49:52.886000',1,'zwq','','','2427012918@qq.com',1,1,'2018-04-25 17:13:00.000000','1515925688','15云计算3班','11#305','15716659774','2018-04-25 17:13:00.000000','2018-04-25 17:13:00.000000','imagepersonal/2018_04/default_middile_2.png'),(3,'pbkdf2_sha256$24000$vLiKH62EAHEA$hukDeTPLP+B+enFHmJR1qwH+iDSBmTPWLZIMkWqxN2k=','2018-04-28 15:19:00.000000',0,'sss','','','2427016918@qq.com',0,1,'2018-04-28 15:15:00.000000','1515925685','15云计算3班','11#308','15716659775','2018-04-28 15:15:00.000000','2018-04-28 15:15:00.000000','img/default_middile_2.png'),(4,'pbkdf2_sha256$24000$Z6LvNzB1NgFB$IwwrK2KXz7Epy9U/Dbm+2p71wQFFxteMlGwZLB3n454=','2018-07-06 18:20:11.349000',1,'weiqiang','','','2427011818@qq.com',1,1,'2018-04-28 17:08:21.168000','','','','','2018-04-28 17:08:21.168000','2018-04-28 17:08:21.168000','img/default_middile_2.png'),(7,'pbkdf2_sha256$24000$a9FhLbSHDcpT$n9ZL9Ij2SbbLSVKjFfJrHDQBwlxRtzY1MR8CB6DUpPg=','2018-04-30 19:43:43.160000',0,'zzz','','','15716659774@163.com',0,1,'2018-04-28 19:21:00.000000','1515925687','15云计算3班','11#308','18739459372','2018-04-28 19:21:00.000000','2018-04-28 19:21:00.000000','img/default_middile_2.png');
/*!40000 ALTER TABLE `users_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_groups`
--

DROP TABLE IF EXISTS `users_userprofile_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofil_userprofile_id_a4496a80_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_groups`
--

LOCK TABLES `users_userprofile_groups` WRITE;
/*!40000 ALTER TABLE `users_userprofile_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_user_permissions`
--

DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_permissions_userprofile_id_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `users_userprofil_userprofile_id_34544737_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_user_permissions`
--

LOCK TABLES `users_userprofile_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_bookmark`
--

DROP TABLE IF EXISTS `xadmin_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_bookmark`
--

LOCK TABLES `xadmin_bookmark` WRITE;
/*!40000 ALTER TABLE `xadmin_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_log`
--

DROP TABLE IF EXISTS `xadmin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_log`
--

LOCK TABLES `xadmin_log` WRITE;
/*!40000 ALTER TABLE `xadmin_log` DISABLE KEYS */;
INSERT INTO `xadmin_log` VALUES (1,'2018-04-26 10:13:00.927000','127.0.0.1','1','UserActive object','create','已添加。',14,1),(2,'2018-04-26 10:52:29.845000','127.0.0.1','1','1515925688','change','已修改 last_login，studentid，grade，address 和 phone 。',6,1),(3,'2018-04-26 10:53:43.431000','127.0.0.1','2','','create','已添加。',6,1),(4,'2018-04-26 11:27:48.316000','127.0.0.1','2','1515925687','change','已修改 email，studentid，grade，address 和 phone 。',6,1),(5,'2018-04-26 13:04:39.624000','127.0.0.1','1','UserActive object','change','已修改 active 。',14,1),(6,'2018-04-26 13:04:46.420000','127.0.0.1','1','UserActive object','change','已修改 active 。',14,1),(7,'2018-04-26 13:20:36.246000','127.0.0.1','1','EmailVerifyRecord object','create','已添加。',7,1),(8,'2018-04-26 13:33:05.736000','127.0.0.1','1','转让手机','create','已添加。',8,1),(9,'2018-04-26 13:33:30.217000','127.0.0.1','1','UserGoods object','create','已添加。',16,1),(10,'2018-04-26 14:46:43.246000','127.0.0.1','1','GoodsImage object','create','已添加。',9,1),(11,'2018-04-26 14:55:38.262000','127.0.0.1','2','GoodsImage object','create','已添加。',9,1),(12,'2018-04-26 14:56:41.327000','127.0.0.1','1','GoodsImage object','delete','',9,1),(13,'2018-04-26 15:56:02.176000','127.0.0.1','2','转让手机1','create','已添加。',8,1),(14,'2018-04-28 12:40:14.423000','127.0.0.1','2','UserActive object','create','已添加。',14,1),(15,'2018-04-28 12:40:45.180000','127.0.0.1','3','UserActive object','create','已添加。',14,1),(16,'2018-04-28 17:59:07.510000','127.0.0.1','1','UserActive object','change','已修改 username 。',14,1),(17,'2018-04-28 17:59:17.384000','127.0.0.1','1','UserActive object','change','已修改 username 。',14,1),(18,'2018-04-28 18:07:42.238000','127.0.0.1','5','1515925687','change','已修改 is_active，address 和 phone 。',6,1),(19,'2018-04-28 18:10:37.337000','127.0.0.1','5','1515925687','change','已修改 is_active 。',6,1),(20,'2018-04-28 18:15:28.078000','127.0.0.1','5','1515925687','change','已修改 is_staff 。',6,1),(21,'2018-04-28 18:17:12.838000','127.0.0.1','5','1515925687','change','已修改 is_superuser 。',6,1),(22,'2018-04-28 18:20:36.779000','127.0.0.1','2','1515925687','delete','',6,1),(24,'2018-04-28 19:12:14.328000','127.0.0.1','5','1515925687','delete','',6,1),(25,'2018-04-28 19:12:45.332000','127.0.0.1','2','EmailVerifyRecord object','delete','',7,1),(26,'2018-04-28 19:12:55.514000','127.0.0.1','1','EmailVerifyRecord object','delete','',7,1),(27,'2018-04-28 19:15:18.522000','127.0.0.1','1','UserActive object','change','已修改 active 。',14,1),(28,'2018-04-28 19:16:43.845000','127.0.0.1','3','EmailVerifyRecord object','delete','',7,1),(29,'2018-04-28 19:20:06.027000','127.0.0.1','6','1515925687','delete','',6,1),(30,'2018-04-28 19:21:22.489000','127.0.0.1','1','UserActive object','change','已修改 active 。',14,1),(31,'2018-04-29 09:45:41.056000','127.0.0.1','1','1515925688','change','已修改 last_login 和 image 。',6,1),(32,'2018-04-29 10:15:09.955000','127.0.0.1','2','转让手机1','change','已修改 category 。',8,1),(33,'2018-04-29 10:15:53.329000','127.0.0.1','2','转让手机1','change','没有字段被修改。',8,1),(34,'2018-04-29 10:17:13.173000','127.0.0.1','3','转让手机2','create','已添加。',8,1),(35,'2018-04-29 10:17:44.274000','127.0.0.1','4','转让手机3','create','已添加。',8,1),(36,'2018-04-29 10:18:24.876000','127.0.0.1','5','转让手机4','create','已添加。',8,1),(37,'2018-04-29 10:19:07.371000','127.0.0.1','6','转让手机5','create','已添加。',8,1),(38,'2018-04-29 10:19:49.656000','127.0.0.1','7','转让手机6','create','已添加。',8,1),(39,'2018-04-29 10:20:50.453000','127.0.0.1','8','转让书籍1','create','已添加。',8,1),(40,'2018-04-29 10:21:43.358000','127.0.0.1','9','转让书籍2','create','已添加。',8,1),(41,'2018-04-29 10:22:15.054000','127.0.0.1','10','转让书籍3','create','已添加。',8,1),(42,'2018-04-29 10:23:04.091000','127.0.0.1','11','转让书籍4','create','已添加。',8,1),(43,'2018-04-29 10:23:37.047000','127.0.0.1','12','转让书籍5','create','已添加。',8,1),(44,'2018-04-29 10:24:15.771000','127.0.0.1','13','转让书籍6','create','已添加。',8,1),(45,'2018-04-29 10:25:41.281000','127.0.0.1','14','转让自行车1','create','已添加。',8,1),(46,'2018-04-29 10:26:24.004000','127.0.0.1','15','转让自行车2','create','已添加。',8,1),(47,'2018-04-29 10:27:05.464000','127.0.0.1','16','转让自行车3','create','已添加。',8,1),(48,'2018-04-29 10:27:32.497000','127.0.0.1','17','转让自行车4','create','已添加。',8,1),(49,'2018-04-29 10:28:05.767000','127.0.0.1','18','转让自行车5','create','已添加。',8,1),(50,'2018-04-29 10:29:16.536000','127.0.0.1','19','转让自行车6','create','已添加。',8,1),(51,'2018-04-29 10:30:50.328000','127.0.0.1','20','其他转让1','create','已添加。',8,1),(52,'2018-04-29 10:31:22.206000','127.0.0.1','21','其他转让2','create','已添加。',8,1),(53,'2018-04-29 10:31:46.286000','127.0.0.1','22','其他转让3','create','已添加。',8,1),(54,'2018-04-29 10:32:22.453000','127.0.0.1','23','其他转让4','create','已添加。',8,1),(55,'2018-04-29 10:32:49.915000','127.0.0.1','24','其他转让5','create','已添加。',8,1),(56,'2018-04-29 10:33:46.573000','127.0.0.1','25','其他转让6','create','已添加。',8,1),(57,'2018-04-29 10:35:09.209000','127.0.0.1','2','转让手机1','change','没有字段被修改。',8,1),(58,'2018-04-29 10:35:20.889000','127.0.0.1','2','转让手机1','change','没有字段被修改。',8,1),(59,'2018-04-29 10:35:35.309000','127.0.0.1','25','其他转让6','change','没有字段被修改。',8,1),(60,'2018-04-29 10:35:53.106000','127.0.0.1','24','其他转让5','change','没有字段被修改。',8,1),(61,'2018-04-29 10:36:05.862000','127.0.0.1','23','其他转让4','change','没有字段被修改。',8,1),(62,'2018-04-29 10:36:18.267000','127.0.0.1','22','其他转让3','change','没有字段被修改。',8,1),(63,'2018-04-29 10:36:31.339000','127.0.0.1','21','其他转让2','change','没有字段被修改。',8,1),(64,'2018-04-29 10:36:50.392000','127.0.0.1','20','其他转让1','change','没有字段被修改。',8,1),(65,'2018-04-29 10:37:41.851000','127.0.0.1','19','转让自行车6','change','没有字段被修改。',8,1),(66,'2018-04-29 10:38:00.295000','127.0.0.1','18','转让自行车5','change','没有字段被修改。',8,1),(67,'2018-04-29 10:38:12.438000','127.0.0.1','17','转让自行车4','change','没有字段被修改。',8,1),(68,'2018-04-29 10:38:23.894000','127.0.0.1','16','转让自行车3','change','没有字段被修改。',8,1),(69,'2018-04-29 10:38:41.989000','127.0.0.1','15','转让自行车2','change','没有字段被修改。',8,1),(70,'2018-04-29 10:38:57.640000','127.0.0.1','14','转让自行车1','change','没有字段被修改。',8,1),(71,'2018-04-29 10:39:14.112000','127.0.0.1','13','转让书籍6','change','没有字段被修改。',8,1),(72,'2018-04-29 10:39:27.872000','127.0.0.1','12','转让书籍5','change','没有字段被修改。',8,1),(73,'2018-04-29 10:39:44.402000','127.0.0.1','11','转让书籍4','change','没有字段被修改。',8,1),(74,'2018-04-29 10:40:02.049000','127.0.0.1','9','转让书籍2','change','没有字段被修改。',8,1),(75,'2018-04-29 10:40:18.643000','127.0.0.1','8','转让书籍1','change','没有字段被修改。',8,1),(76,'2018-04-29 10:40:32.614000','127.0.0.1','7','转让手机6','change','没有字段被修改。',8,1),(77,'2018-04-29 10:40:46.472000','127.0.0.1','6','转让手机5','change','没有字段被修改。',8,1),(78,'2018-04-29 10:41:00.143000','127.0.0.1','5','转让手机4','change','没有字段被修改。',8,1),(79,'2018-04-29 10:41:12.237000','127.0.0.1','4','转让手机3','change','没有字段被修改。',8,1),(80,'2018-04-29 10:41:25.836000','127.0.0.1','3','转让手机2','change','没有字段被修改。',8,1),(81,'2018-04-29 10:41:32.498000','127.0.0.1','2','转让手机1','change','没有字段被修改。',8,1),(82,'2018-04-29 10:52:25.969000','127.0.0.1','1','Banner object','create','已添加。',17,1),(83,'2018-04-29 10:53:01.625000','127.0.0.1','2','Banner object','create','已添加。',17,1),(84,'2018-04-29 10:53:27.437000','127.0.0.1','3','Banner object','create','已添加。',17,1),(85,'2018-04-29 10:53:57.671000','127.0.0.1','4','Banner object','create','已添加。',17,1),(86,'2018-04-29 14:01:19.030000','127.0.0.1','10','转让书籍3','change','没有字段被修改。',8,1),(87,'2018-04-29 14:02:15.700000','127.0.0.1','10','转让书籍3','change','没有字段被修改。',8,1),(88,'2018-04-29 15:10:05.425000','127.0.0.1','7','转让手机6','change','没有字段被修改。',8,1),(89,'2018-04-29 16:45:12.128000','127.0.0.1','8','转让书籍1','change','没有字段被修改。',8,1),(90,'2018-04-30 08:22:49.539000','127.0.0.1','22','其他转让3','change','已修改 description 。',8,1),(91,'2018-04-30 17:17:01.746000','127.0.0.1','3','1515925685','change','已修改 last_login，address 和 phone 。',6,1),(92,'2018-04-30 19:41:13.422000','127.0.0.1','7','1515925687','change','已修改 last_login，address 和 phone 。',6,1);
/*!40000 ALTER TABLE `xadmin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_usersettings`
--

DROP TABLE IF EXISTS `xadmin_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_usersettings`
--

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;
INSERT INTO `xadmin_usersettings` VALUES (1,'dashboard:home:pos','',1),(2,'site-theme','/static/xadmin/css/themes/bootstrap-xadmin.css',1),(3,'goods_goods_editform_portal','box-0,goodsimage_set-group',1),(4,'dashboard:home:pos','',4);
/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_userwidget`
--

DROP TABLE IF EXISTS `xadmin_userwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_userwidget`
--

LOCK TABLES `xadmin_userwidget` WRITE;
/*!40000 ALTER TABLE `xadmin_userwidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_userwidget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-12 22:45:12
