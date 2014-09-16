/*
SQLyog Enterprise v11.01 (64 bit)
MySQL - 5.6.10-log : Database - public_lsg
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `fgusers3` */
SET GLOBAL 	innodb_large_prefix	= 'ON'
;

SET GLOBAL 	innodb_file_format	= 'Barracuda'
;

DROP TABLE IF EXISTS `fgusers3`;

CREATE TABLE `fgusers3` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `email` varchar(64) NOT NULL,
  `phone_number` varchar(16) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(32) NOT NULL,
  `confirmcode` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `fgusers3` */

insert  into `fgusers3`(`id_user`,`name`,`email`,`phone_number`,`username`,`password`,`confirmcode`) values (1,'max power','sshacter@innovella.com','','mpower','a029d0df84eb5549c641e04a9ef389e5','y'),(10,'Homer Simpson','info@innovella.com','','hsimpson','a029d0df84eb5549c641e04a9ef389e5','c40e1395377bea2645f082502e70dfbb'),(11,'Homer Simpson','info@innovella.com','','hsimpson','a029d0df84eb5549c641e04a9ef389e5','b7fb03e5f365b20aa1622b3c8232502a'),(12,'Homer Simpson','info@innovella.com','','hsimpson','a029d0df84eb5549c641e04a9ef389e5','3bb4b1110d30328465bb4255f3e606e5'),(13,'Homer Simpson','info@innovella.com','','hsimpson','a029d0df84eb5549c641e04a9ef389e5','22cf5981495c7362d487080df2d834df'),(14,'Homer Simpson','info@innovella.com','','hsimpson','a029d0df84eb5549c641e04a9ef389e5','094fe297439be81e1638ad9d3fbbe4a7'),(15,'Homer Simpson','info@innovella.com','','hsimpson','a029d0df84eb5549c641e04a9ef389e5','b3fb95528c9784f5124247de5c4aae5f'),(16,'Homer Simpson','info@innovella.com','','hsimpson','a029d0df84eb5549c641e04a9ef389e5','d1e6ce8bf09a7f341dd002cb03c54627'),(17,'Homer Simpson','info@innovella.com','','hsimpson','a029d0df84eb5549c641e04a9ef389e5','9392d5379a996be338ee68acd616e3c5');

/*Table structure for table `righttype` */

DROP TABLE IF EXISTS `righttype`;

CREATE TABLE `righttype` (
  `Right_tp` varchar(64) NOT NULL,
  PRIMARY KEY (`Right_tp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 ROW_FORMAT=DYNAMIC;

/*Data for the table `righttype` */

/*Table structure for table `tblcompany` */

DROP TABLE IF EXISTS `tblcompany`;

CREATE TABLE `tblcompany` (
  `Company_id` int(11) NOT NULL,
  `Company_tp` varchar(64) NOT NULL,
  `Company_nm` varchar(256) NOT NULL,
  `Company_cd` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`Company_id`,`Company_tp`),
  UNIQUE KEY `akCompany` (`Company_tp`,`Company_nm`),
  CONSTRAINT `fk1Company` FOREIGN KEY (`Company_id`, `Company_tp`) REFERENCES `tblresource` (`Resrc_id`, `Resrc_tp`),
  CONSTRAINT `fk2Company` FOREIGN KEY (`Company_tp`) REFERENCES `tblcompanytype` (`Company_tp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tblcompany` */

insert  into `tblcompany`(`Company_id`,`Company_tp`,`Company_nm`,`Company_cd`) values (2,'Company','Vecchio Trees, LLC.','2|Company'),(8,'Company','Eye of The Day','LSG20140613-2'),(9,'Company','PHP Company-1','PHP Company-1'),(10,'Company','PHP Company-2','PHP Company-2'),(11,'Company','PHP Company-3','CODEs Company-3'),(86,'Company','INNOVELLA, INC.',NULL);

/*Table structure for table `tblcompanytype` */

DROP TABLE IF EXISTS `tblcompanytype`;

CREATE TABLE `tblcompanytype` (
  `Company_tp` varchar(64) NOT NULL,
  PRIMARY KEY (`Company_tp`),
  CONSTRAINT `fk1CompanyType` FOREIGN KEY (`Company_tp`) REFERENCES `tblresourcetype` (`Resrc_tp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tblcompanytype` */

insert  into `tblcompanytype`(`Company_tp`) values ('Company'),('CompanyClass');

/*Table structure for table `tblcontacttype` */

DROP TABLE IF EXISTS `tblcontacttype`;

CREATE TABLE `tblcontacttype` (
  `Contact_tp` varchar(64) NOT NULL,
  PRIMARY KEY (`Contact_tp`),
  CONSTRAINT `fk1ContactType` FOREIGN KEY (`Contact_tp`) REFERENCES `tblresourcetype` (`Resrc_tp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tblcontacttype` */

insert  into `tblcontacttype`(`Contact_tp`) values ('Contact'),('ContactAddress'),('ContactEmail');

/*Table structure for table `tblresource` */

DROP TABLE IF EXISTS `tblresource`;

CREATE TABLE `tblresource` (
  `Resrc_id` int(11) NOT NULL AUTO_INCREMENT,
  `Resrc_tp` varchar(64) NOT NULL,
  `Resrc_tx` mediumtext,
  `ADD_dm` datetime NOT NULL,
  `ADD_nm` varchar(256) NOT NULL,
  `UPD_dm` datetime DEFAULT NULL,
  `UPD_nm` varchar(256) DEFAULT NULL,
  `DEL_dm` datetime DEFAULT NULL,
  `DEL_nm` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`Resrc_id`,`Resrc_tp`),
  KEY `ix1Resource` (`Resrc_tp`),
  CONSTRAINT `fk1Resource` FOREIGN KEY (`Resrc_tp`) REFERENCES `tblresourcetype` (`Resrc_tp`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tblresource` */

insert  into `tblresource`(`Resrc_id`,`Resrc_tp`,`Resrc_tx`,`ADD_dm`,`ADD_nm`,`UPD_dm`,`UPD_nm`,`DEL_dm`,`DEL_nm`) values (0,'RESOURCE','Root resource row','2014-05-25 00:00:00','db_service',NULL,NULL,NULL,NULL),(2,'Company','Vecchio Trees, LLC.','2014-05-25 00:00:00','db_service',NULL,NULL,NULL,NULL),(8,'Company','isp test','2014-06-13 19:55:29','innovella@localhost',NULL,NULL,NULL,NULL),(9,'Company','','2014-06-19 23:48:47','innovella@localhost','2014-09-01 19:19:15','2014-09-01 19:19:15',NULL,NULL),(10,'Company','Upd test2','2014-07-17 09:48:50','innovella@localhost','2014-07-27 23:02:27','2014-07-27 23:02:27',NULL,NULL),(11,'Company','uspCompany called from class.Company','2014-06-22 17:15:51','innovella@localhost','2014-06-22 21:14:27','innovella@localhost',NULL,NULL),(12,'User','isp test','2014-06-25 04:16:03','innovella@localhost',NULL,NULL,NULL,NULL),(13,'User','isp test','2014-06-25 04:16:34','innovella@localhost',NULL,NULL,NULL,NULL),(14,'UserAdmin','isp test','2014-06-25 04:25:54','innovella@localhost',NULL,NULL,NULL,NULL),(15,'User',NULL,'2014-06-29 06:37:55','innovella@localhost',NULL,NULL,NULL,NULL),(16,'User',NULL,'2014-06-29 06:44:32','innovella@localhost',NULL,NULL,NULL,NULL),(17,'User',NULL,'2014-06-29 06:45:15','innovella@localhost',NULL,NULL,NULL,NULL),(18,'User',NULL,'2014-06-29 19:24:03','innovella@localhost',NULL,NULL,NULL,NULL),(19,'User',NULL,'2014-06-29 19:24:09','innovella@localhost',NULL,NULL,NULL,NULL),(20,'User','gmccauley','2014-06-29 19:31:31','innovella@localhost',NULL,NULL,NULL,NULL),(21,'User','gmccauley','2014-06-29 19:32:46','innovella@localhost',NULL,NULL,NULL,NULL),(22,'User','gmccauley','2014-06-29 19:33:16','innovella@localhost',NULL,NULL,NULL,NULL),(23,'User','gmccauley','2014-06-29 19:35:28','innovella@localhost',NULL,NULL,NULL,NULL),(24,'User','gmccauley','2014-06-29 19:35:29','innovella@localhost',NULL,NULL,NULL,NULL),(25,'User','gmccauley','2014-06-29 19:35:59','innovella@localhost',NULL,NULL,NULL,NULL),(26,'User','gmccauley','2014-06-29 19:36:04','innovella@localhost',NULL,NULL,NULL,NULL),(27,'User','gmccauley','2014-06-29 19:36:05','innovella@localhost',NULL,NULL,NULL,NULL),(28,'User','test user 1','2014-06-29 19:58:43','innovella@localhost',NULL,NULL,NULL,NULL),(29,'User','test user 1','2014-06-29 19:58:43','innovella@localhost',NULL,NULL,NULL,NULL),(30,'User','test user 1','2014-06-29 19:59:36','innovella@localhost',NULL,NULL,NULL,NULL),(31,'User','test user 1','2014-06-29 19:59:37','innovella@localhost',NULL,NULL,NULL,NULL),(32,'User','test user 1','2014-06-29 20:15:31','innovella@localhost',NULL,NULL,NULL,NULL),(33,'User','test user 1','2014-06-29 20:20:13','innovella@localhost',NULL,NULL,NULL,NULL),(34,'User','test user 1','2014-06-29 20:25:17','innovella@localhost',NULL,NULL,NULL,NULL),(35,'User','test user 1','2014-06-29 20:32:35','innovella@localhost',NULL,NULL,NULL,NULL),(36,'User',NULL,'2014-07-05 22:01:38','root@localhost',NULL,NULL,NULL,NULL),(37,'User','','2014-07-05 23:31:48','root@localhost',NULL,NULL,NULL,NULL),(38,'User','','2014-07-05 23:36:47','root@localhost',NULL,NULL,NULL,NULL),(39,'User','','2014-07-05 23:40:13','root@localhost',NULL,NULL,NULL,NULL),(40,'User','','2014-07-05 23:40:28','root@localhost',NULL,NULL,NULL,NULL),(41,'User','','2014-07-05 23:44:44','root@localhost',NULL,NULL,NULL,NULL),(42,'User','','2014-07-05 23:46:04','root@localhost',NULL,NULL,NULL,NULL),(43,'User','','2014-07-05 23:46:39','root@localhost',NULL,NULL,NULL,NULL),(44,'User','','2014-07-05 23:47:30','root@localhost',NULL,NULL,NULL,NULL),(45,'User','','2014-07-05 23:47:54','root@localhost',NULL,NULL,NULL,NULL),(46,'User','','2014-07-05 23:48:24','root@localhost',NULL,NULL,NULL,NULL),(47,'User','','2014-07-05 23:50:02','root@localhost',NULL,NULL,NULL,NULL),(48,'User','','2014-07-05 23:53:25','root@localhost',NULL,NULL,NULL,NULL),(49,'User','','2014-07-05 23:54:41','root@localhost',NULL,NULL,NULL,NULL),(50,'User','','2014-07-05 23:56:19','root@localhost',NULL,NULL,NULL,NULL),(51,'User','','2014-07-05 23:56:51','root@localhost',NULL,NULL,NULL,NULL),(52,'User','','2014-07-05 23:58:37','root@localhost',NULL,NULL,NULL,NULL),(53,'User','','2014-07-05 23:58:55','root@localhost',NULL,NULL,NULL,NULL),(54,'User',NULL,'2014-07-06 00:01:49','root@localhost',NULL,NULL,NULL,NULL),(55,'User','','2014-07-06 00:06:04','root@localhost',NULL,NULL,NULL,NULL),(56,'User','','2014-07-06 00:06:19','root@localhost',NULL,NULL,NULL,NULL),(57,'User',NULL,'2014-07-06 00:28:28','root@localhost','0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),(58,'User',NULL,'2014-07-06 04:12:01','root@localhost','0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),(59,'UserAdmin',NULL,'2014-07-06 04:28:36','root@localhost','0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),(63,'User','Update Test','2014-07-17 09:48:50','innovella@localhost','2014-07-17 10:34:38','innovella@localhost',NULL,NULL),(64,'User','Update Test','2014-07-17 09:39:18','root@localhost','2014-07-17 09:39:18','innovella@localhost',NULL,NULL),(65,'User','test user 1','2014-07-27 22:20:08','root@localhost','2014-07-28 03:31:43','root@localhost',NULL,NULL),(77,'ContactEmail',NULL,'2014-07-28 02:51:16','root@localhost','2014-07-28 03:30:56','root@localhost',NULL,NULL),(78,'ContactAddress',NULL,'2014-07-28 03:02:07','root@localhost','2014-07-28 03:31:43','root@localhost',NULL,NULL),(79,'User','Safety Inspector','2014-09-01 18:52:08','innovella@localhost','2014-09-01 19:19:15','root@localhost',NULL,NULL),(85,'User','Owner','2014-09-10 21:38:03','root@localhost',NULL,NULL,NULL,NULL),(86,'Company','home owner','2014-09-10 21:38:03','innovella@localhost','0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL);

/*Table structure for table `tblresource_company` */

DROP TABLE IF EXISTS `tblresource_company`;

CREATE TABLE `tblresource_company` (
  `Resrc_id` int(11) NOT NULL,
  `Resrc_tp` varchar(64) NOT NULL,
  `Company_id` int(11) NOT NULL,
  `Company_tp` varchar(64) NOT NULL,
  `Resrc_nm` varchar(256) NOT NULL,
  `Resrc_cd` varchar(128) DEFAULT NULL,
  `Alias_nm` varchar(256) NOT NULL,
  `ADD_dm` datetime NOT NULL,
  `ADD_nm` varchar(256) NOT NULL,
  `UPD_dm` datetime DEFAULT NULL,
  `UPD_nm` varchar(256) DEFAULT NULL,
  `DEL_dm` datetime DEFAULT NULL,
  `DEL_nm` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`Resrc_id`,`Resrc_tp`,`Company_id`,`Company_tp`),
  UNIQUE KEY `akResource_Company` (`Resrc_tp`,`Company_id`,`Company_tp`,`Resrc_nm`),
  KEY `fk1Resource_Company` (`Resrc_tp`,`Company_tp`),
  KEY `fk3Resource_Company` (`Company_id`,`Company_tp`),
  CONSTRAINT `fk1Resource_Company` FOREIGN KEY (`Resrc_tp`, `Company_tp`) REFERENCES `tblresourcetype_companytype` (`Resrc_tp`, `Company_tp`),
  CONSTRAINT `fk2Resource_Company` FOREIGN KEY (`Resrc_id`, `Resrc_tp`) REFERENCES `tblresource` (`Resrc_id`, `Resrc_tp`),
  CONSTRAINT `fk3Resource_Company` FOREIGN KEY (`Company_id`, `Company_tp`) REFERENCES `tblcompany` (`Company_id`, `Company_tp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tblresource_company` */

insert  into `tblresource_company`(`Resrc_id`,`Resrc_tp`,`Company_id`,`Company_tp`,`Resrc_nm`,`Resrc_cd`,`Alias_nm`,`ADD_dm`,`ADD_nm`,`UPD_dm`,`UPD_nm`,`DEL_dm`,`DEL_nm`) values (34,'User',9,'Company','user1','password','test user1','2014-06-29 20:25:17','innovella@localhost',NULL,NULL,NULL,NULL),(35,'User',9,'Company','user2','password','test user1','2014-06-29 20:35:51','innovella@localhost',NULL,NULL,NULL,NULL),(35,'User',10,'Company','user2','password','test user2','2014-06-29 20:37:11','innovella@localhost',NULL,NULL,NULL,NULL),(63,'User',10,'Company','User3','new password','test user3','2014-07-13 21:27:07','root@localhost','2014-07-17 10:34:38','innovella@localhost',NULL,NULL),(64,'User',10,'Company','User5','new password','test user5','2014-07-14 06:24:07','root@localhost',NULL,NULL,NULL,NULL),(65,'User',10,'Company','mpower','mypass','test user1','2014-07-27 22:20:08','root@localhost','2014-07-27 23:02:27','root@localhost',NULL,NULL),(79,'User',9,'Company','hsimpson','mypass','hsimpson','2014-09-01 19:06:52','root@localhost','2014-09-01 19:19:15','root@localhost',NULL,NULL),(85,'User',86,'Company','bsimpson','a029d0df84eb5549c641e04a9ef389e5','bsimpson','2014-09-10 21:38:03','root@localhost',NULL,NULL,NULL,NULL);

/*Table structure for table `tblresource_contact` */

DROP TABLE IF EXISTS `tblresource_contact`;

CREATE TABLE `tblresource_contact` (
  `Resrc_id` int(11) NOT NULL,
  `Resrc_tp` varchar(64) NOT NULL,
  `Contact_id` int(11) NOT NULL,
  `Contact_tp` varchar(64) NOT NULL,
  `Contact_nm` varchar(256) NOT NULL,
  `Contact_cd` varchar(128) DEFAULT NULL,
  `Alias_nm` varchar(256) NOT NULL,
  `Address_nm` varchar(256) DEFAULT NULL,
  `City_cd` varchar(128) DEFAULT NULL,
  `State_cd` varchar(128) DEFAULT NULL,
  `Zip_cd` varchar(128) DEFAULT NULL,
  `Phone_cd` varchar(128) DEFAULT NULL,
  `GPS_cd` varchar(128) DEFAULT NULL,
  `ADD_dm` datetime NOT NULL,
  `ADD_nm` varchar(256) NOT NULL,
  `UPD_dm` datetime DEFAULT NULL,
  `UPD_nm` varchar(256) DEFAULT NULL,
  `DEL_dm` datetime DEFAULT NULL,
  `DEL_nm` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`Resrc_id`,`Resrc_tp`,`Contact_id`,`Contact_tp`),
  UNIQUE KEY `akResource_Contact` (`Resrc_tp`,`Contact_tp`,`Contact_nm`),
  KEY `fk2Resource_Contact` (`Contact_tp`),
  KEY `fk4Resource_Contact` (`Contact_id`,`Contact_tp`),
  CONSTRAINT `fk1Resource_Contact` FOREIGN KEY (`Resrc_tp`) REFERENCES `tblresourcetype` (`Resrc_tp`),
  CONSTRAINT `fk2Resource_Contact` FOREIGN KEY (`Contact_tp`) REFERENCES `tblcontacttype` (`Contact_tp`),
  CONSTRAINT `fk3Resource_Contact` FOREIGN KEY (`Resrc_id`, `Resrc_tp`) REFERENCES `tblresource` (`Resrc_id`, `Resrc_tp`),
  CONSTRAINT `fk4Resource_Contact` FOREIGN KEY (`Contact_id`, `Contact_tp`) REFERENCES `tblresource` (`Resrc_id`, `Resrc_tp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tblresource_contact` */

insert  into `tblresource_contact`(`Resrc_id`,`Resrc_tp`,`Contact_id`,`Contact_tp`,`Contact_nm`,`Contact_cd`,`Alias_nm`,`Address_nm`,`City_cd`,`State_cd`,`Zip_cd`,`Phone_cd`,`GPS_cd`,`ADD_dm`,`ADD_nm`,`UPD_dm`,`UPD_nm`,`DEL_dm`,`DEL_nm`) values (65,'User',77,'ContactEmail','mpower@ymail.net',NULL,'Max Power Address',NULL,NULL,'CA','92626','1234567890',NULL,'2014-07-28 02:51:16','root@localhost','2014-07-28 03:30:56','root@localhost',NULL,NULL),(65,'User',78,'ContactAddress','mpower@ymail.net',NULL,'Max Power Address','400 Enclave Cir #203, Costa Mesa, CA 92626','400 Enclave Cir #203, Costa Mesa, CA 92626','CA','92626','1234567890',NULL,'2014-07-28 03:02:07','root@localhost','2014-07-28 03:31:43','root@localhost',NULL,NULL);

/*Table structure for table `tblresourcetype` */

DROP TABLE IF EXISTS `tblresourcetype`;

CREATE TABLE `tblresourcetype` (
  `Resrc_tp` varchar(64) NOT NULL,
  `ParentResrc_tp` varchar(64) DEFAULT NULL,
  `ResrcType_tx` mediumtext,
  `Left_id` int(11) DEFAULT NULL,
  `Right_id` int(11) DEFAULT NULL,
  `Level_id` int(11) DEFAULT NULL,
  `Order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Resrc_tp`),
  UNIQUE KEY `akResourceType` (`Resrc_tp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tblresourcetype` */

insert  into `tblresourcetype`(`Resrc_tp`,`ParentResrc_tp`,`ResrcType_tx`,`Left_id`,`Right_id`,`Level_id`,`Order_id`) values ('Asset','RESOURCE',NULL,NULL,NULL,NULL,NULL),('AssetBlueprint','Asset',NULL,NULL,NULL,NULL,NULL),('AssetChangeOrder','Asset',NULL,NULL,NULL,NULL,NULL),('AssetContract','Asset',NULL,NULL,NULL,NULL,NULL),('AssetDocument','Asset',NULL,NULL,NULL,NULL,NULL),('AssetImage','Asset',NULL,NULL,NULL,NULL,NULL),('Company','RESOURCE','Company domain type',NULL,NULL,NULL,NULL),('CompanyClass','Company',NULL,-1,-1,-1,-1),('Contact','RESOURCE','Contact Types',-1,-1,-1,-1),('ContactAddress','Contact','Contact Types',-1,-1,-1,-1),('ContactEmail','Contact','Contact Types',-1,-1,-1,-1),('Event','RESOURCE','Event domain type',NULL,NULL,NULL,NULL),('Group','RESOURCE','Group domain type',NULL,NULL,NULL,NULL),('JobRole','Role','A collection of employees or profiles with a given set of skills assigned to the Role (and transitively to the person).',NULL,NULL,NULL,NULL),('Location','RESOURCE',NULL,NULL,NULL,NULL,NULL),('LocationCompany','Location',NULL,NULL,NULL,NULL,NULL),('LocationProject','Location',NULL,NULL,NULL,NULL,NULL),('Project','RESOURCE',NULL,NULL,NULL,NULL,NULL),('ProjectClient','Project','Client project with associated resources',NULL,NULL,NULL,NULL),('RESOURCE',NULL,'Root resource type',NULL,NULL,NULL,NULL),('Right','Security','Set of security privileges and policies for security model',NULL,NULL,NULL,NULL),('Role','RESOURCE','Role domain type',NULL,NULL,NULL,NULL),('Security','RESOURCE','Security domain type',NULL,NULL,NULL,NULL),('SecurityRole','Role','A Security Role is a collection of users with a given set of permissions assigned to the Role (and transitively, to the users).',NULL,NULL,NULL,NULL),('System','RESOURCE','System domain type',NULL,NULL,NULL,NULL),('User','RESOURCE','User domain type',NULL,NULL,NULL,NULL),('UserAdmin','User','Admin account for authentication and authorization.',NULL,NULL,NULL,NULL),('UserClient','User',NULL,NULL,NULL,NULL,NULL),('UserContact','User',NULL,NULL,NULL,NULL,NULL),('UserServiceAccount','User','The managed service account is designed to provide crucial applications with the isolation of their own PICS accounts, while eliminating the need for an administrator to manually administer the service principal name (SPN) and credentials for these accounts.',NULL,NULL,NULL,NULL),('UserStaff','User',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `tblresourcetype_companytype` */

DROP TABLE IF EXISTS `tblresourcetype_companytype`;

CREATE TABLE `tblresourcetype_companytype` (
  `Resrc_tp` varchar(64) NOT NULL,
  `Company_tp` varchar(64) NOT NULL,
  PRIMARY KEY (`Resrc_tp`,`Company_tp`),
  UNIQUE KEY `akResourceType_CompanyType` (`Resrc_tp`,`Company_tp`),
  KEY `fk2ResourceType_CompanyType` (`Company_tp`),
  CONSTRAINT `fk1ResourceType_CompanyType` FOREIGN KEY (`Resrc_tp`) REFERENCES `tblresourcetype` (`Resrc_tp`),
  CONSTRAINT `fk2ResourceType_CompanyType` FOREIGN KEY (`Company_tp`) REFERENCES `tblcompanytype` (`Company_tp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tblresourcetype_companytype` */

insert  into `tblresourcetype_companytype`(`Resrc_tp`,`Company_tp`) values ('User','Company'),('UserAdmin','Company');

/*Table structure for table `tbluser` */

DROP TABLE IF EXISTS `tbluser`;

CREATE TABLE `tbluser` (
  `User_id` int(11) NOT NULL,
  `User_tp` varchar(64) NOT NULL COMMENT 'User type',
  `User_nm` varchar(256) NOT NULL COMMENT 'User name',
  `User_cd` varchar(128) NOT NULL COMMENT 'Title or password',
  `Hashed_cd` varchar(128) NOT NULL COMMENT 'MD5 and confirmation code',
  `Person_nm` varchar(256) NOT NULL COMMENT 'Full name',
  `Email_nm` varchar(256) DEFAULT NULL COMMENT 'Email address',
  `Challenge_cd` varchar(128) DEFAULT NULL COMMENT 'Security question',
  `Response_cd` varchar(128) DEFAULT NULL COMMENT 'Security answer',
  PRIMARY KEY (`User_id`,`User_tp`),
  UNIQUE KEY `akResource_User` (`User_tp`,`User_nm`),
  CONSTRAINT `fk1User` FOREIGN KEY (`User_tp`) REFERENCES `tblusertype` (`User_tp`),
  CONSTRAINT `fk2User` FOREIGN KEY (`User_id`, `User_tp`) REFERENCES `tblresource` (`Resrc_id`, `Resrc_tp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbluser` */

insert  into `tbluser`(`User_id`,`User_tp`,`User_nm`,`User_cd`,`Hashed_cd`,`Person_nm`,`Email_nm`,`Challenge_cd`,`Response_cd`) values (34,'User','user1','a029d0df84eb5549c641e04a9ef389e5','D5D28637ff95fb94bd660e8febd6ab93d8f9d8d8fbff3f0d','','tu1@vt.com','pet name','Bentley'),(35,'User','user2','a029d0df84eb5549c641e04a9ef389e5','E80BDB3F5be49571db86ca3796b355b267e71d95a6138515','','tu1@vt.com','pet name','Bentley'),(63,'User','User3','a029d0df84eb5549c641e04a9ef389e5','','','test user\'s5',NULL,NULL),(64,'User','User5','a029d0df84eb5549c641e04a9ef389e5','','','test user5',NULL,NULL),(65,'User','mpower','a029d0df84eb5549c641e04a9ef389e5','Y','Max Power','info@innovella.com','pet name','Bentley'),(79,'User','hsimpson','a029d0df84eb5549c641e04a9ef389e5','Y','Homer Simpson','hsimpson@burns.com','pet name','Bentley'),(85,'User','bsimpson','a029d0df84eb5549c641e04a9ef389e5','830FFBEE7de80ab0cf38eda0f3afa7aa1887db87e00a77a1','bsimpson','bsimpson',NULL,NULL);

/*Table structure for table `tblusertype` */

DROP TABLE IF EXISTS `tblusertype`;

CREATE TABLE `tblusertype` (
  `User_tp` varchar(64) NOT NULL,
  PRIMARY KEY (`User_tp`),
  CONSTRAINT `fk1UserType` FOREIGN KEY (`User_tp`) REFERENCES `tblresourcetype` (`Resrc_tp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tblusertype` */

insert  into `tblusertype`(`User_tp`) values ('User'),('UserAdmin'),('UserClient'),('UserContact'),('UserServiceAccount'),('UserStaff');

/* Procedure structure for procedure `errAKExist` */

/*!50003 DROP PROCEDURE IF EXISTS  `errAKExist` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `errAKExist`(
	Proc_nm		VARCHAR(64)
,	Table_nm	VARCHAR(64)
,	Key_nm		VARCHAR(255)
)
BEGIN
/*
**	Name:		errAKExist
**	Type:		Special Procedure
**	Purpose:	To raise an error and print message based on arguments
**			passed to this procedure.
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**	Date:		03/15/03
**
**	Modified:	03/15/03
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE AK_EXIST	CONDITION FOR SQLSTATE '99003';
DECLARE ERRORMSG	VARCHAR(1024) DEFAULT
	CONCAT
			(
				'Error: '
			,	IFNULL(Proc_nm, '<Unknown>')
			,	' - A duplicate row in '
			,	IFNULL(Table_nm, '<Unknown>')
			,	' exists for AK - '
			,	IFNULL(Key_nm, '<Unknown>')
			);
###############################################################################
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
-- 	SHOW ERRORS;
-- 	SHOW WARNINGS;
	SIGNAL AK_EXIST
	SET MESSAGE_TEXT	= ERRORMSG
	,	MYSQL_ERRNO	= 9003
	,	TABLE_NAME	= Table_nm;  
	#######################################################################
###############################################################################
END;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `errFailedCall` */

/*!50003 DROP PROCEDURE IF EXISTS  `errFailedCall` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `errFailedCall`(
	Proc_nm		VARCHAR(64)
,	CallingProc_nm		VARCHAR(64)
)
BEGIN
/*
**	Name:		errFailedCall
**	Type:		Special Procedure
**	Purpose:	To raise an error and print message based on arguments
**			passed to this procedure.
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**	Date:		03/15/03
**
**	Modified:	03/15/03
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE FAILED_CALL	CONDITION FOR SQLSTATE '99004';
DECLARE ERRORMSG	VARCHAR(1024) DEFAULT
	CONCAT
			(
				'Error: '
			,	IFNULL(Proc_nm, '<Unknown>')
			,	' - Failed on call to '
			,	IFNULL(CallingProc_nm, '<Unknown>')
			);
###############################################################################
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
-- 	SHOW ERRORS;
-- 	SHOW WARNINGS;
	#######################################################################
	SIGNAL FAILED_CALL
	SET MESSAGE_TEXT	= ERRORMSG
	,	MYSQL_ERRNO	= 9004
	,	TABLE_NAME	= Table_nm;  
	#######################################################################
###############################################################################
 END;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `errFailedEvent` */

/*!50003 DROP PROCEDURE IF EXISTS  `errFailedEvent` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `errFailedEvent`(
	Proc_nm		VARCHAR(64)
,	Table_nm		VARCHAR(64)
,	Action_nm		VARCHAR(64)
)
BEGIN
/*
**	Name:		errFailedEvent
**	Type:		Special Procedure
**	Purpose:	To raise an error and print message based on arguments
**			passed to this procedure.
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**	Date:		03/15/03
**
**	Modified:	03/15/03
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE FAILED_EVENT	CONDITION FOR SQLSTATE '99001';
DECLARE ERRORMSG	VARCHAR(1024) DEFAULT
	CONCAT
			(
				'Error: '
			,	Proc_nm
			,	' - Failed to '
			,	Action_nm
			,	' record(s) for table '
			,	Table_nm
			);
###############################################################################
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
 	SHOW ERRORS;
-- 	SHOW WARNINGS;
	SIGNAL FAILED_EVENT
	SET MESSAGE_TEXT	= ERRORMSG
	,	MYSQL_ERRNO	= 9001
	,	TABLE_NAME	= Table_nm;  
	#######################################################################
###############################################################################
 END;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `errFailedMode` */

/*!50003 DROP PROCEDURE IF EXISTS  `errFailedMode` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `errFailedMode`(
	Proc_nm		VARCHAR(64)
,	Mode_cd		VARCHAR(48)
,	Action_nm	VARCHAR(64)
,	Table_nm	VARCHAR(64)
)
BEGIN
/*
**	Name:		errFailedMode
**	Type:		Special Procedure
**	Purpose:	To raise an error and print message based on arguments
**			passed to this procedure.
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**	Date:		03/15/03
**
**	Modified:	03/15/03
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE FAILED_MODE	CONDITION FOR SQLSTATE '99002'; -- '01099'
DECLARE ERRORMSG	VARCHAR(1024) DEFAULT
	CONCAT
			(
				'Error: '
			,	Proc_nm
			,	' - Database MODE is set to '
			,	Mode_cd
			,	'. '
			,	Action_nm
			,	' is not allowed on table '
			,	Table_nm
			,	' for this MODE setting.'
			);
###############################################################################
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
-- 	SHOW ERRORS;
-- 	SHOW WARNINGS;
	SIGNAL FAILED_MODE
	SET MESSAGE_TEXT	= ERRORMSG
	,	MYSQL_ERRNO	= 9002
	,	TABLE_NAME	= Table_nm;  
	#######################################################################
###############################################################################
END;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `errFKExist` */

/*!50003 DROP PROCEDURE IF EXISTS  `errFKExist` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `errFKExist`(
	Proc_nm		VARCHAR(64)
,	Table_nm	VARCHAR(64)
,	Action_nm	VARCHAR(64)
,	Key_nm		VARCHAR(255)
)
BEGIN
/*
**	Name:		errFKExist
**	Type:		Special Procedure
**	Purpose:	To raise an error and print message based on arguments
**			passed to this procedure.
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**	Date:		03/15/03
**
**	Modified:	03/15/03
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE FK_NOT_EXIST	CONDITION FOR SQLSTATE '99006';
DECLARE ERRORMSG	VARCHAR(1024) DEFAULT
	CONCAT
			(
				"Error: "
			,	IFNULL(Proc_nm, "<Unknown>")
			,	" - A matching Foreign Key row with value "
			,	"'",	IFNULL(Key_nm, "<Unknown>"),	"'"
			,	" already exists in "
			,	IFNULL(Table_nm, "<Unknown>")
			,	" for this "
			,	IFNULL(Action_nm, "<Unknown>")
			,	"."
			);
###############################################################################
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
-- 	SHOW ERRORS;
-- 	SHOW WARNINGS;
	SIGNAL FK_NOT_EXIST
	SET MESSAGE_TEXT	= ERRORMSG
	,	MYSQL_ERRNO	= 9006
	,	TABLE_NAME	= Table_nm;  
	#######################################################################
###############################################################################
END;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `errFKNotExist` */

/*!50003 DROP PROCEDURE IF EXISTS  `errFKNotExist` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `errFKNotExist`(
	Proc_nm		VARCHAR(64)
,	Table_nm	VARCHAR(64)
,	Action_nm	VARCHAR(64)
,	Key_nm		VARCHAR(255)
)
BEGIN
/*
**	Name:		errFKNotExist
**	Type:		Special Procedure
**	Purpose:	To raise an error and print message based on arguments
**			passed to this procedure.
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**	Date:		03/15/03
**
**	Modified:	03/15/03
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE FK_NOT_EXIST	CONDITION FOR SQLSTATE '99006';
DECLARE ERRORMSG	VARCHAR(1024) DEFAULT
	CONCAT
			(
				"Error: "
			,	IFNULL(Proc_nm, "<Unknown>")
			,	" - No matching Foreign Key row with value "
			,	"'",	IFNULL(Key_nm, "<Unknown>"),	"'"
			,	" was found in "
			,	IFNULL(Table_nm, "<Unknown>")
			,	" for this "
			,	IFNULL(Action_nm, "<Unknown>")
            ,   " action."
			);
###############################################################################
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
-- 	SHOW ERRORS;
-- 	SHOW WARNINGS;
	SIGNAL FK_NOT_EXIST
	SET MESSAGE_TEXT	= ERRORMSG
	,	MYSQL_ERRNO	= 9006
	,	TABLE_NAME	= Table_nm;  
	#######################################################################
###############################################################################
END;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `errNullArg` */

/*!50003 DROP PROCEDURE IF EXISTS  `errNullArg` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `errNullArg`(
	Proc_nm		VARCHAR(64)
,	Action_nm	VARCHAR(64)
)
BEGIN
/*
**	Name:		errNullArg
**	Type:		Special Procedure
**	Purpose:	To raise an error and print message based on arguments
**			passed to this procedure.
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**	Date:		03/15/03
**
**	Modified:	03/15/03
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE NULL_ARG	CONDITION FOR SQLSTATE '99005';
DECLARE ERRORMSG	VARCHAR(1024) DEFAULT
	CONCAT
			(
				'Error: '
			,	IFNULL(Proc_nm, '<Unknown>')
			,	' - Argument(s) cannot be NULL for '
			,	IFNULL(Action_nm, '<Unknown>')
			,	' action. '
			);
###############################################################################
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	#######################################################################
-- 	SHOW ERRORS;
-- 	SHOW WARNINGS;
	SIGNAL NULL_ARG
	SET MESSAGE_TEXT	= ERRORMSG
	,	MYSQL_ERRNO	= 9005;
	#######################################################################
###############################################################################
 END;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `errPKExist` */

/*!50003 DROP PROCEDURE IF EXISTS  `errPKExist` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `errPKExist`(
	Proc_nm		VARCHAR(64)
,	Table_nm	VARCHAR(64)
,	Action_nm	VARCHAR(64)
,	Key_nm		VARCHAR(255)
)
BEGIN
/*
**	Name:		errPKExist
**	Type:		Special Procedure
**	Purpose:	To raise an error and print message based on arguments
**			passed to this procedure.
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**	Date:		03/15/03
**
**	Modified:	03/15/03
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE FK_NOT_EXIST	CONDITION FOR SQLSTATE '99006';
DECLARE ERRORMSG	VARCHAR(1024) DEFAULT
	CONCAT
			(
				"Error: "
			,	IFNULL(Proc_nm, "<Unknown>")
			,	" - A matching Primary Key row with value "
			,	"'",	IFNULL(Key_nm, "<Unknown>"),	"'"
			,	" already exists in "
			,	IFNULL(Table_nm, "<Unknown>")
			,	" for this "
			,	IFNULL(Action_nm, "<Unknown>")
			,	"."
			);
###############################################################################
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
-- 	SHOW ERRORS;
-- 	SHOW WARNINGS;
	SIGNAL FK_NOT_EXIST
	SET MESSAGE_TEXT	= ERRORMSG
	,	MYSQL_ERRNO	= 9006
	,	TABLE_NAME	= Table_nm;  
	#######################################################################
###############################################################################
END;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `errPKNotExist` */

/*!50003 DROP PROCEDURE IF EXISTS  `errPKNotExist` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `errPKNotExist`(
	Proc_nm		VARCHAR(64)
,	Table_nm	VARCHAR(64)
,	Action_nm	VARCHAR(64)
,	Key_nm		VARCHAR(255)
)
BEGIN
/*
**	Name:		errPKNotExist
**	Type:		Special Procedure
**	Purpose:	To raise an error and print message based on arguments
**			passed to this procedure.
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**	Date:		03/15/03
**
**	Modified:	03/15/03
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE FK_NOT_EXIST	CONDITION FOR SQLSTATE '99006';
DECLARE ERRORMSG	VARCHAR(1024) DEFAULT
	CONCAT
			(
				"Error: "
			,	IFNULL(Proc_nm, "<Unknown>")
			,	" - No matching Primary Key row with value "
			,	"'",	IFNULL(Key_nm, "<Unknown>"),	"'"
			,	" was found in "
			,	IFNULL(Table_nm, "<Unknown>")
			,	" for this "
			,	IFNULL(Action_nm, "<Unknown>")
			,	"."
			);
###############################################################################
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
-- 	SHOW ERRORS;
-- 	SHOW WARNINGS;
	SIGNAL FK_NOT_EXIST
	SET MESSAGE_TEXT	= ERRORMSG
	,	MYSQL_ERRNO	= 9006
	,	TABLE_NAME	= Table_nm;  
	#######################################################################
###############################################################################
END;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `gfpCompany` */

/*!50003 DROP PROCEDURE IF EXISTS  `gfpCompany` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `gfpCompany`(
	Company_id		INT SIGNED		-- PK1 
,	Company_tp		VARCHAR(64)		-- PK2 AK1
,	Company_nm		VARCHAR(256)		--  AK2
,	Company_cd		VARCHAR(128)	
,	Company_tx		MEDIUMTEXT	
,	CompanyADD_dm		DATETIME	
,	CompanyADD_nm		VARCHAR(256)	
,	CompanyUPD_dm		DATETIME	
,	CompanyUPD_nm		VARCHAR(256)	
,	CompanyDEL_dm		DATETIME	
,	CompanyDEL_nm		VARCHAR(256)	
,	ParentCompany_tp		VARCHAR(64)	
,	CompanyType_tx		MEDIUMTEXT	
,	CompanyTypeLeft_id		INT SIGNED	
,	CompanyTypeRight_id		INT SIGNED	
,	CompanyTypeLevel_id		INT SIGNED	
,	CompanyTypeOrder_id		INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceCompany	Company name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Key_cd		VARCHAR(16)	-- Search key code
-- ,	RowSort_nm	varchar(256)
)
BEGIN
/*
**	Name:		gfpCompany
**	Type:		DB API Stored Procedure: Get Filtered
**	Purpose:	To Get an active record or set of active records
**			from tvwCompany
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tvwCompany';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'VIEW';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'gfpCompany';
DECLARE	SQL_tx	mediumtext;
###############################################################################
GFP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'AL';	END IF;
--	IF RowSort_nm IS NULL OR RowSort_nm = '' THEN SET RowSort_nm = 'Company_id';	END IF;
	IF Company_id IS NULL OR Company_id = 0 THEN SET Company_id =  -2147483647;	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = '-2147483647';	END IF;
	IF Company_nm IS NULL OR Company_nm = '' THEN SET Company_nm = '-2147483647';	END IF;
	IF Company_cd IS NULL OR Company_cd = '' THEN SET Company_cd = '-2147483647';	END IF;
	IF Company_tx IS NULL OR Company_tx = '' THEN SET Company_tx = '-2147483647';	END IF;
	IF CompanyADD_dm IS NULL THEN SET CompanyADD_dm = '0000-00-00 00:00:00';	END IF;
	IF CompanyADD_nm IS NULL OR CompanyADD_nm = '' THEN SET CompanyADD_nm = '-2147483647';	END IF;
	IF CompanyUPD_dm IS NULL THEN SET CompanyUPD_dm = '0000-00-00 00:00:00';	END IF;
	IF CompanyUPD_nm IS NULL OR CompanyUPD_nm = '' THEN SET CompanyUPD_nm = '-2147483647';	END IF;
	IF CompanyDEL_dm IS NULL THEN SET CompanyDEL_dm = '0000-00-00 00:00:00';	END IF;
	IF CompanyDEL_nm IS NULL OR CompanyDEL_nm = '' THEN SET CompanyDEL_nm = '-2147483647';	END IF;
	IF ParentCompany_tp IS NULL OR ParentCompany_tp = '' THEN SET ParentCompany_tp = '-2147483647';	END IF;
	IF CompanyType_tx IS NULL OR CompanyType_tx = '' THEN SET CompanyType_tx = '-2147483647';	END IF;
	IF CompanyTypeLeft_id IS NULL OR CompanyTypeLeft_id = 0 THEN SET CompanyTypeLeft_id =  -2147483647;	END IF;
	IF CompanyTypeRight_id IS NULL OR CompanyTypeRight_id = 0 THEN SET CompanyTypeRight_id =  -2147483647;	END IF;
	IF CompanyTypeLevel_id IS NULL OR CompanyTypeLevel_id = 0 THEN SET CompanyTypeLevel_id =  -2147483647;	END IF;
	IF CompanyTypeOrder_id IS NULL OR CompanyTypeOrder_id = 0 THEN SET CompanyTypeOrder_id =  -2147483647;	END IF;
	#######################################################################
	-- Check Security
	#######################################################################
/*	EXECUTE	RETURN		= spSecurityCheck
		SYSTABLE	= SYSTABLE
	,	SYSRIGHT	= SYSRIGHT
	IF
	(
		RETURN	<> 0
	)
	BEGIN
		EXECUTE	STATUS		= errFailedSecurity
			Proc_nm	= Proc_nm
		,	Table_nm	= SYSTABLE
		,	Action_nm	= SYSRIGHT
		RETURN	STATUS
	END
*/
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF	Key_cd = 'PK'
	THEN
		SELECT	*
		FROM
			tvwCompany
		WHERE
			tvwCompany.Company_id	= Company_id
		AND	tvwCompany.Company_tp	= Company_tp
		AND	tvwCompany.CompanyDEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd	= 'FK1'
	THEN
		SELECT	*
		FROM
			tvwCompany
		WHERE
			tvwCompany.Company_tp	= Company_tp
		AND	tvwCompany.CompanyDEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	IF	Key_cd	= 'FK2'
	THEN
		SELECT	*
		FROM
			tvwCompany
		WHERE
			tvwCompany.Company_tp	= Company_tp
		AND	tvwCompany.Company_id	= Company_id
		AND	tvwCompany.CompanyDEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	IF	Key_cd = 'AK'
	THEN
		SELECT	*
		FROM
			tvwCompany
		WHERE
			tvwCompany.Company_tp	= Company_tp
		AND	tvwCompany.Company_nm	= Company_nm
		AND	tvwCompany.CompanyDEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Search Key lookup
	#######################################################################
	--   NO UI SEARCH KEY(S) DEFINED FOR THIS OBJECT
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd = 'AL'
	THEN
		SELECT	*
		FROM
			tvwCompany
		WHERE
			(
			tvwCompany.Company_id	=  Company_id
		OR	Company_id	=  -2147483647
			)
		AND	(
			tvwCompany.Company_tp	= Company_tp
		OR	Company_tp	= '-2147483647'
			)
		AND	(
			tvwCompany.Company_nm	LIKE CONCAT('%', Company_nm, '%')
		OR	Company_nm	= '-2147483647'
			)
		AND	(
			tvwCompany.Company_cd	LIKE CONCAT('%', Company_cd, '%')
		OR	Company_cd	= '-2147483647'
			)
		AND	(
			tvwCompany.Company_tx	LIKE CONCAT('%', Company_tx, '%')
		OR	Company_tx	LIKE '-2147483647'
			)
 		AND	(
 			tvwCompany.CompanyADD_dm	>= CompanyADD_dm
 		OR	CompanyADD_dm	= '0000-00-00 00:00:00'
 		OR	CompanyADD_dm	IS NULL
 			)
		AND	(
			tvwCompany.CompanyADD_nm	LIKE CONCAT('%', CompanyADD_nm, '%')
		OR	CompanyADD_nm	= '-2147483647'
			)
  		AND	(
  			tvwCompany.CompanyUPD_dm	>= CompanyUPD_dm
 		OR	CompanyUPD_dm	= '0000-00-00 00:00:00'
   		OR	CompanyUPD_dm	IS NULL
  			)
 		AND	(
 			tvwCompany.CompanyUPD_nm	LIKE CONCAT('%', CompanyUPD_nm, '%')
 		OR	CompanyUPD_nm	= '-2147483647'
 			)
  		AND	(
  			tvwCompany.CompanyDEL_dm	IS NULL
  			)
 		AND	(
 			tvwCompany.CompanyDEL_nm	IS NULL
 			)
 		AND	(
 			tvwCompany.ParentCompany_tp	= ParentCompany_tp
 		OR	ParentCompany_tp	= '-2147483647'
 			)
 		AND	(
 			tvwCompany.CompanyType_tx	LIKE CONCAT('%', CompanyType_tx, '%')
 		OR	CompanyType_tx	LIKE '-2147483647'
 			)
 		AND	(
 			tvwCompany.CompanyTypeLeft_id	= CompanyTypeLeft_id
 		OR	CompanyTypeLeft_id	=  -2147483647
 			)
 		AND	(
 			tvwCompany.CompanyTypeRight_id	= CompanyTypeRight_id
 		OR	CompanyTypeRight_id	=  -2147483647
 			)
 		AND	(
 			tvwCompany.CompanyTypeLevel_id	= CompanyTypeLevel_id
 		OR	CompanyTypeLevel_id	=  -2147483647
 			)
 		AND	(
 			tvwCompany.CompanyTypeOrder_id	= CompanyTypeOrder_id
 		OR	CompanyTypeOrder_id	=  -2147483647
 			)
;
		set @SQL_tx := concat
		("
		SELECT	*
		FROM
			tvwCompany
		WHERE
			(
			tvwCompany.Company_id	=  Company_id
		OR	Company_id	=  -2147483647
			)
		AND	(
			tvwCompany.Company_tp	= Company_tp
		OR	Company_tp	= '-2147483647'
			)
		AND	(
			tvwCompany.Company_nm	LIKE CONCAT('%', Company_nm, '%')
		OR	Company_nm	= '-2147483647'
			)
		AND	(
			tvwCompany.Company_cd	LIKE CONCAT('%', Company_cd, '%')
		OR	Company_cd	= '-2147483647'
			)
		AND	(
			tvwCompany.Company_tx	LIKE CONCAT('%', Company_tx, '%')
		OR	Company_tx	LIKE '-2147483647'
			)
 		AND	(
 			tvwCompany.CompanyADD_dm	>= CompanyADD_dm
 		OR	CompanyADD_dm	= '0000-00-00 00:00:00'
 		OR	CompanyADD_dm	IS NULL
 			)
		AND	(
			tvwCompany.CompanyADD_nm	LIKE CONCAT('%', CompanyADD_nm, '%')
		OR	CompanyADD_nm	= '-2147483647'
			)
  		AND	(
  			tvwCompany.CompanyUPD_dm	>= CompanyUPD_dm
 		OR	CompanyUPD_dm	= '0000-00-00 00:00:00'
   		OR	CompanyUPD_dm	IS NULL
  			)
 		AND	(
 			tvwCompany.CompanyUPD_nm	LIKE CONCAT('%', CompanyUPD_nm, '%')
 		OR	CompanyUPD_nm	= '-2147483647'
 			)
  		AND	(
  			tvwCompany.CompanyDEL_dm	IS NULL
  		OR	1=1
  			)
 		AND	(
 			tvwCompany.CompanyDEL_nm	IS NULL
 		OR	1=1
 			)
 		AND	(
 			tvwCompany.ParentCompany_tp	= ParentCompany_tp
 		OR	ParentCompany_tp	= '-2147483647'
 			)
 		AND	(
 			tvwCompany.CompanyType_tx	LIKE CONCAT('%', CompanyType_tx, '%')
 		OR	CompanyType_tx	LIKE '-2147483647'
 			)
 		AND	(
 			tvwCompany.CompanyTypeLeft_id	= CompanyTypeLeft_id
 		OR	CompanyTypeLeft_id	=  -2147483647
 			)
 		AND	(
 			tvwCompany.CompanyTypeRight_id	= CompanyTypeRight_id
 		OR	CompanyTypeRight_id	=  -2147483647
 			)
 		AND	(
 			tvwCompany.CompanyTypeLevel_id	= CompanyTypeLevel_id
 		OR	CompanyTypeLevel_id	=  -2147483647
 			)
 		AND	(
 			tvwCompany.CompanyTypeOrder_id	= CompanyTypeOrder_id
 		OR	CompanyTypeOrder_id	=  -2147483647
 			)
		ORDER BY
		"
--		,	RowSort_nm
		);
-- select @SQL_tx;
-- prepare stmt from @SQL_tx ;
-- execute stmt;
-- deallocate prepare stmt;
		LEAVE GFP;
	END IF;
	#######################################################################
END	GFP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `gfpCompanyType` */

/*!50003 DROP PROCEDURE IF EXISTS  `gfpCompanyType` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `gfpCompanyType`(
	Company_tp		VARCHAR(64)		-- PK1 
,	ParentCompany_tp	VARCHAR(64)	
,	CompanyType_tx		MEDIUMTEXT	
,	CompanyTypeLeft_id	INT SIGNED	
,	CompanyTypeRight_id	INT SIGNED	
,	CompanyTypeLevel_id	INT SIGNED	
,	CompanyTypeOrder_id	INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceCompany	Company name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Key_cd		VARCHAR(16)	-- Search key code
)
BEGIN
/*
**	Name:		gfpCompanyType
**	Type:		DB API Stored Procedure: Get Filtered
**	Purpose:	To Get an active record or set of active records
**			from tvwCompanyType
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tvwCompanyType';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'VIEW';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'gfpCompanyType';
###############################################################################
GFP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'AL';	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = '-2147483647';	END IF;
	IF ParentCompany_tp IS NULL OR ParentCompany_tp = '' THEN SET ParentCompany_tp = '-2147483647';	END IF;
	IF CompanyType_tx IS NULL OR CompanyType_tx = '' THEN SET CompanyType_tx = '-2147483647';	END IF;
	IF CompanyTypeLeft_id IS NULL OR CompanyTypeLeft_id = 0 THEN SET CompanyTypeLeft_id =  -2147483647;	END IF;
	IF CompanyTypeRight_id IS NULL OR CompanyTypeRight_id = 0 THEN SET CompanyTypeRight_id =  -2147483647;	END IF;
	IF CompanyTypeLevel_id IS NULL OR CompanyTypeLevel_id = 0 THEN SET CompanyTypeLevel_id =  -2147483647;	END IF;
	IF CompanyTypeOrder_id IS NULL OR CompanyTypeOrder_id = 0 THEN SET CompanyTypeOrder_id =  -2147483647;	END IF;
	#######################################################################
	-- Check Security
	#######################################################################
/*	EXECUTE	RETURN		= spSecurityCheck
		SYSTABLE	= SYSTABLE
	,	SYSRIGHT	= SYSRIGHT
	IF
	(
		RETURN	<> 0
	)
	BEGIN
		EXECUTE	STATUS		= errFailedSecurity
			Proc_nm	= Proc_nm
		,	Table_nm	= SYSTABLE
		,	Action_nm	= SYSRIGHT
		RETURN	STATUS
	END
*/
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF	Key_cd = 'PK'
	THEN
		SELECT	*
		FROM
			tvwCompanyType
		WHERE
			tvwCompanyType.Company_tp	= Company_tp
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd	= 'FK1'
	THEN
		SELECT	*
		FROM
			tvwCompanyType
		WHERE
			tvwCompanyType.Company_tp	= Company_tp
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	-- NO ALTERNATE KEY DEFINED FOR THIS OBJECT
	#######################################################################
	-- Search Key lookup
	#######################################################################
	--   NO UI SEARCH KEY(S) DEFINED FOR THIS OBJECT
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd = 'AL'
	THEN
		SELECT	*
		FROM
			tvwCompanyType
		WHERE
			(
			tvwCompanyType.Company_tp	= Company_tp
		OR	Company_tp	= '-2147483647'
			)
		AND	(
			tvwCompanyType.ParentCompany_tp	= ParentCompany_tp
		OR	ParentCompany_tp	= '-2147483647'
			)
		AND	(
			tvwCompanyType.CompanyType_tx	LIKE CONCAT('%', CompanyType_tx, '%')
		OR	CompanyType_tx	LIKE '-2147483647'
			)
		AND	(
			tvwCompanyType.CompanyTypeLeft_id	= CompanyTypeLeft_id
		OR	CompanyTypeLeft_id	=  -2147483647
			)
		AND	(
			tvwCompanyType.CompanyTypeRight_id	= CompanyTypeRight_id
		OR	CompanyTypeRight_id	=  -2147483647
			)
		AND	(
			tvwCompanyType.CompanyTypeLevel_id	= CompanyTypeLevel_id
		OR	CompanyTypeLevel_id	=  -2147483647
			)
		AND	(
			tvwCompanyType.CompanyTypeOrder_id	= CompanyTypeOrder_id
		OR	CompanyTypeOrder_id	=  -2147483647
			)
		;
		LEAVE GFP;
	END IF;
	#######################################################################
END	GFP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `gfpContactType` */

/*!50003 DROP PROCEDURE IF EXISTS  `gfpContactType` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `gfpContactType`(
	Contact_tp		VARCHAR(64)		-- PK1 
,	ParentContact_tp	VARCHAR(64)	
,	ContactType_tx		MEDIUMTEXT	
,	ContactTypeLeft_id	INT SIGNED	
,	ContactTypeRight_id	INT SIGNED	
,	ContactTypeLevel_id	INT SIGNED	
,	ContactTypeOrder_id	INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceContact	Contact name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Key_cd		VARCHAR(16)	-- Search key code
)
BEGIN
/*
**	Name:		gfpContactType
**	Type:		DB API Stored Procedure: Get Filtered
**	Purpose:	To Get an active record or set of active records
**			from tvwContactType
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tvwContactType';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'VIEW';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'gfpContactType';
###############################################################################
GFP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'AL';	END IF;
	IF Contact_tp IS NULL OR Contact_tp = '' THEN SET Contact_tp = '-2147483647';	END IF;
	IF ParentContact_tp IS NULL OR ParentContact_tp = '' THEN SET ParentContact_tp = '-2147483647';	END IF;
	IF ContactType_tx IS NULL OR ContactType_tx = '' THEN SET ContactType_tx = '-2147483647';	END IF;
	IF ContactTypeLeft_id IS NULL OR ContactTypeLeft_id = 0 THEN SET ContactTypeLeft_id =  -2147483647;	END IF;
	IF ContactTypeRight_id IS NULL OR ContactTypeRight_id = 0 THEN SET ContactTypeRight_id =  -2147483647;	END IF;
	IF ContactTypeLevel_id IS NULL OR ContactTypeLevel_id = 0 THEN SET ContactTypeLevel_id =  -2147483647;	END IF;
	IF ContactTypeOrder_id IS NULL OR ContactTypeOrder_id = 0 THEN SET ContactTypeOrder_id =  -2147483647;	END IF;
	#######################################################################
	-- Check Security
	#######################################################################
/*	EXECUTE	RETURN		= spSecurityCheck
		SYSTABLE	= SYSTABLE
	,	SYSRIGHT	= SYSRIGHT
	IF
	(
		RETURN	<> 0
	)
	BEGIN
		EXECUTE	STATUS		= errFailedSecurity
			Proc_nm	= Proc_nm
		,	Table_nm	= SYSTABLE
		,	Action_nm	= SYSRIGHT
		RETURN	STATUS
	END
*/
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF	Key_cd = 'PK'
	THEN
		SELECT	*
		FROM
			tvwContactType
		WHERE
			tvwContactType.Contact_tp	= Contact_tp
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd	= 'FK1'
	THEN
		SELECT	*
		FROM
			tvwContactType
		WHERE
			tvwContactType.Contact_tp	= Contact_tp
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	-- NO ALTERNATE KEY DEFINED FOR THIS OBJECT
	#######################################################################
	-- Search Key lookup
	#######################################################################
	--   NO UI SEARCH KEY(S) DEFINED FOR THIS OBJECT
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd = 'AL'
	THEN
		SELECT	*
		FROM
			tvwContactType
		WHERE
			(
			tvwContactType.Contact_tp	= Contact_tp
		OR	Contact_tp	= '-2147483647'
			)
		AND	(
			tvwContactType.ParentContact_tp	= ParentContact_tp
		OR	ParentContact_tp	= '-2147483647'
			)
		AND	(
			tvwContactType.ContactType_tx	LIKE CONCAT('%', ContactType_tx, '%')
		OR	ContactType_tx	LIKE '-2147483647'
			)
		AND	(
			tvwContactType.ContactTypeLeft_id	= ContactTypeLeft_id
		OR	ContactTypeLeft_id	=  -2147483647
			)
		AND	(
			tvwContactType.ContactTypeRight_id	= ContactTypeRight_id
		OR	ContactTypeRight_id	=  -2147483647
			)
		AND	(
			tvwContactType.ContactTypeLevel_id	= ContactTypeLevel_id
		OR	ContactTypeLevel_id	=  -2147483647
			)
		AND	(
			tvwContactType.ContactTypeOrder_id	= ContactTypeOrder_id
		OR	ContactTypeOrder_id	=  -2147483647
			)
		;
		LEAVE GFP;
	END IF;
	#######################################################################
END	GFP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `gfpResource` */

/*!50003 DROP PROCEDURE IF EXISTS  `gfpResource` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `gfpResource`(
	Resrc_id	INT SIGNED		-- PK1 
,	Resrc_tp	VARCHAR(64)		-- PK2 AK1
,	Resrc_tx	MEDIUMTEXT
,	ADD_dm		DATETIME	
,	ADD_nm		VARCHAR(256)	
,	UPD_dm		DATETIME	
,	UPD_nm		VARCHAR(256)	
,	DEL_dm		DATETIME	
,	DEL_nm		VARCHAR(256)	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceCompany	Company name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Key_cd		VARCHAR(16)	-- Search key code
)
BEGIN
/*
**	Name:		gfpResource
**	Type:		DB API Stored Procedure: Get Filtered
**	Purpose:	To Get an active record or set of active records
**			from tvwResource
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tvwResource';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'VIEW';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'gfpResource';
DECLARE	SQL_tx	MEDIUMTEXT;
###############################################################################
GFP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'AL';	END IF;
	IF Resrc_id IS NULL OR Resrc_id = 0 THEN SET Resrc_id =  -2147483647;	END IF;
	IF Resrc_tp IS NULL OR Resrc_tp = '' THEN SET Resrc_tp = '-2147483647';	END IF;
	IF Resrc_tx IS NULL OR Resrc_tx = '' THEN SET Resrc_tx = '-2147483647';	END IF;
	IF ADD_dm IS NULL THEN SET ADD_dm = '0000-00-00 00:00:00';	END IF;
	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = '-2147483647';	END IF;
	IF UPD_dm IS NULL THEN SET UPD_dm = '0000-00-00 00:00:00';	END IF;
	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = '-2147483647';	END IF;
	IF DEL_dm IS NULL THEN SET DEL_dm = '0000-00-00 00:00:00';	END IF;
	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = '-2147483647';	END IF;
	#######################################################################
	-- Check Security
	#######################################################################
/*	EXECUTE	RETURN		= spSecurityCheck
		SYSTABLE	= SYSTABLE
	,	SYSRIGHT	= SYSRIGHT
	IF
	(
		RETURN	<> 0
	)
	BEGIN
		EXECUTE	STATUS		= errFailedSecurity
			Proc_nm	= Proc_nm
		,	Table_nm	= SYSTABLE
		,	Action_nm	= SYSRIGHT
		RETURN	STATUS
	END
*/
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF	Key_cd = 'PK'
	THEN
		SELECT	*
		FROM
			tvwResource
		WHERE	1=1
		AND	tvwResource.Resrc_id	= Resrc_id
		AND	tvwResource.Resrc_tp	= Resrc_tp
		AND	tvwResource.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd	= 'FK1'
	THEN
		SELECT	*
		FROM
			tvwResource
		WHERE	1=1
		AND	tvwResource.Resrc_tp	= Resrc_tp
		AND	tvwResource.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	#######################################################################
	-- Search Key lookup
	#######################################################################
	--   NO UI SEARCH KEY(S) DEFINED FOR THIS OBJECT
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd = 'AL'
	THEN
		SELECT	*
		FROM
			tvwResource
		WHERE	1=1
		AND	(
			tvwResource.Resrc_id	= Resrc_id
		OR	Resrc_id	=  -2147483647
			)
		AND	(
			tvwResource.Resrc_tp	= Resrc_tp
		OR	Resrc_tp	= '-2147483647'
			)
		AND	(
			tvwResource.Resrc_tx	LIKE CONCAT('%', Resrc_tx, '%')
		OR	Resrc_tx	= '-2147483647'
			)
 		AND	(
 			tvwResource.ADD_dm	>= ADD_dm
 		OR	ADD_dm	= '0000-00-00 00:00:00'
 		OR	ADD_dm	IS NULL
 			)
		AND	(
			tvwResource.ADD_nm	LIKE CONCAT('%', ADD_nm, '%')
		OR	ADD_nm	= '-2147483647'
			)
  		AND	(
  			tvwResource.UPD_dm	>= UPD_dm
 		OR	UPD_dm	= '0000-00-00 00:00:00'
   		OR	UPD_dm	IS NULL
  			)
 		AND	(
 			tvwResource.UPD_nm	LIKE CONCAT('%', UPD_nm, '%')
 		OR	UPD_nm	= '-2147483647'
 			)
  		AND	(
  			tvwResource.DEL_dm	IS NULL
  			)
 		AND	(
 			tvwResource.DEL_nm	IS NULL
 			)
		;
		LEAVE GFP;
	END IF;
	#######################################################################
END	GFP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `gfpResource_Company` */

/*!50003 DROP PROCEDURE IF EXISTS  `gfpResource_Company` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `gfpResource_Company`(
	Resrc_id		INT SIGNED		-- PK1 
,	Resrc_tp		VARCHAR(64)		-- PK2 AK1
,	Company_id		INT SIGNED		-- PK1 
,	Company_tp		VARCHAR(64)		-- PK2 AK1
,	Resrc_nm		VARCHAR(256)		--  AK2
,	Resrc_cd		VARCHAR(128)	
,	Alias_nm		VARCHAR(256)		--  AK2
,	Company_nm		VARCHAR(256)		--  AK2
,	Company_cd		VARCHAR(128)	
,	Resrc_tx	MEDIUMTEXT
,	Company_tx		MEDIUMTEXT	
,	ADD_dm		DATETIME	
,	ADD_nm		VARCHAR(256)	
,	UPD_dm		DATETIME	
,	UPD_nm		VARCHAR(256)	
,	DEL_dm		DATETIME	
,	DEL_nm		VARCHAR(256)	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceCompany	Company name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Key_cd		VARCHAR(16)	-- Search key code
)
BEGIN
/*
**	Name:		gfpResource_Company
**	Type:		DB API Stored Procedure: Get Filtered
**	Purpose:	To Get an active record or set of active records
**			from tvwResource_Company
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tvwResource_Company';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'VIEW';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'gfpResource_Company';
DECLARE	SQL_tx	MEDIUMTEXT;
###############################################################################
GFP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'AL';	END IF;
	IF Resrc_id IS NULL OR Resrc_id = 0 THEN SET Resrc_id =  -2147483647;	END IF;
	IF Resrc_tp IS NULL OR Resrc_tp = '' THEN SET Resrc_tp = '-2147483647';	END IF;
	IF Company_id IS NULL OR Company_id = 0 THEN SET Company_id =  -2147483647;	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = '-2147483647';	END IF;
	IF Resrc_nm IS NULL OR Resrc_nm = '' THEN SET Resrc_nm = '-2147483647';	END IF;
	IF Resrc_cd IS NULL OR Resrc_cd = '' THEN SET Resrc_cd = '-2147483647';	END IF;
	IF Alias_nm IS NULL OR Alias_nm = '' THEN SET Alias_nm = '-2147483647';	END IF;
	IF Company_nm IS NULL OR Company_nm = '' THEN SET Company_nm = '-2147483647';	END IF;
	IF Company_cd IS NULL OR Company_cd = '' THEN SET Company_cd = '-2147483647';	END IF;
	IF Resrc_tx IS NULL OR Resrc_tx = '' THEN SET Resrc_tx = '-2147483647';	END IF;
	IF Company_tx IS NULL OR Company_tx = '' THEN SET Company_tx = '-2147483647';	END IF;
	IF ADD_dm IS NULL THEN SET ADD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = '-2147483647';	END IF;
	IF UPD_dm IS NULL THEN SET UPD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = '-2147483647';	END IF;
	IF DEL_dm IS NULL THEN SET DEL_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = '-2147483647';	END IF;
	#######################################################################
	-- Check Security
	#######################################################################
/*	EXECUTE	RETURN		= spSecurityCheck
		SYSTABLE	= SYSTABLE
	,	SYSRIGHT	= SYSRIGHT
	IF
	(
		RETURN	<> 0
	)
	BEGIN
		EXECUTE	STATUS		= errFailedSecurity
			Proc_nm	= Proc_nm
		,	Table_nm	= SYSTABLE
		,	Action_nm	= SYSRIGHT
		RETURN	STATUS
	END
*/
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF	Key_cd = 'PK'
	THEN
		SELECT	*
		FROM
			tvwResource_Company
		WHERE	1=1
		AND	tvwResource_Company.Resrc_id	= Resrc_id
		AND	tvwResource_Company.Resrc_tp	= Resrc_tp
		AND	tvwResource_Company.Company_id	= Company_id
		AND	tvwResource_Company.Company_tp	= Company_tp
		AND	tvwResource_Company.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd	= 'FK1'
	THEN
		SELECT	*
		FROM
			tvwResource_Company
		WHERE	1=1
		AND	tvwResource_Company.Resrc_tp	= Resrc_tp
		AND	tvwResource_Company.Company_tp	= Company_tp
		AND	tvwResource_Company.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	IF	Key_cd	= 'FK2'
	THEN
		SELECT	*
		FROM
			tvwResource_Company
		WHERE	1=1
		AND	tvwResource_Company.Resrc_id	= Resrc_id
		AND	tvwResource_Company.Resrc_tp	= Resrc_tp
		AND	tvwResource_Company.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	IF	Key_cd	= 'FK3'
	THEN
		SELECT	*
		FROM
			tvwResource_Company
		WHERE   1=1
		AND	tvwResource_Company.Company_id	= Company_id
		AND	tvwResource_Company.Company_tp	= Company_tp
		AND	tvwResource_Company.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	IF	Key_cd = 'AK'
	THEN
		SELECT	*
		FROM
			tvwResource_Company
		WHERE	1=1
		AND	tvwResource_Company.Resrc_tp	= Resrc_tp
		AND	tvwResource_Company.Company_id	= Company_id
		AND	tvwResource_Company.Company_tp	= Company_tp
		AND	tvwResource_Company.Resrc_nm	= Resrc_nm
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Search Key lookup
	#######################################################################
	--   NO UI SEARCH KEY(S) DEFINED FOR THIS OBJECT
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd = 'AL'
	THEN
		SELECT	*
		FROM
			tvwResource_Company
		WHERE	1=1
		AND	(
			tvwResource_Company.Resrc_id	= Resrc_id
		OR	Resrc_id	=  -2147483647
			)
		AND	(
			tvwResource_Company.Resrc_tp	= Resrc_tp
		OR	Resrc_tp	= '-2147483647'
			)
		AND	(
			tvwResource_Company.Company_id	=  Company_id
		OR	Company_id	=  -2147483647
			)
		AND	(
			tvwResource_Company.Company_tp	= Company_tp
		OR	Company_tp	= '-2147483647'
			)
		AND	(
			tvwResource_Company.Resrc_nm	LIKE CONCAT('%', Resrc_nm, '%')
		OR	Resrc_nm	= '-2147483647'
			)
		AND	(
			tvwResource_Company.Resrc_cd	LIKE CONCAT('%', Resrc_cd, '%')
		OR	Resrc_cd	= '-2147483647'
			)
		AND	(
			tvwResource_Company.Alias_nm	LIKE CONCAT('%', Alias_nm, '%')
		OR	Alias_nm	= '-2147483647'
			)
		AND	(
			tvwResource_Company.Company_nm	LIKE CONCAT('%', Company_nm, '%')
		OR	Company_nm	= '-2147483647'
			)
		AND	(
			tvwResource_Company.Company_cd	LIKE CONCAT('%', Company_cd, '%')
		OR	Company_cd	= '-2147483647'
			)
		AND	(
			tvwResource_Company.Resrc_tx	LIKE CONCAT('%', Resrc_tx, '%')
		OR	Resrc_tx	= '-2147483647'
			)
		AND	(
			tvwResource_Company.Company_tx	LIKE CONCAT('%', Company_tx, '%')
		OR	Company_tx	LIKE '-2147483647'
			)
 		AND	(
 			tvwResource_Company.ADD_dm	>= ADD_dm
 		OR	ADD_dm	= '0000-00-00 00:00:00'
 		OR	ADD_dm	IS NULL
 			)
		AND	(
			tvwResource_Company.ADD_nm	LIKE CONCAT('%', ADD_nm, '%')
		OR	ADD_nm	= '-2147483647'
			)
  		AND	(
  			tvwResource_Company.UPD_dm	>= UPD_dm
 		OR	UPD_dm	= '0000-00-00 00:00:00'
   		OR	UPD_dm	IS NULL
  			)
 		AND	(
 			tvwResource_Company.UPD_nm	LIKE CONCAT('%', UPD_nm, '%')
 		OR	UPD_nm	= '-2147483647'
 			)
  		AND	(
  			tvwResource_Company.DEL_dm	IS NULL
  			)
 		AND	(
 			tvwResource_Company.DEL_nm	IS NULL
 			)
		;
		LEAVE GFP;
	END IF;
	#######################################################################
END	GFP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `gfpResource_Contact` */

/*!50003 DROP PROCEDURE IF EXISTS  `gfpResource_Contact` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `gfpResource_Contact`(
	Resrc_id	INT SIGNED		-- PK1 
,	Resrc_tp	VARCHAR(64)		-- PK2 AK1
,	Contact_id	INT SIGNED		-- PK1 
,	Contact_tp	VARCHAR(64)		-- PK2 AK1
,	Contact_nm	VARCHAR(256)		--  AK2
,	Contact_cd	VARCHAR(128)	
,	Alias_nm	VARCHAR(256)		--  AK2
,	Address_nm	VARCHAR(256)
,	City_cd		VARCHAR(128)
,	State_cd	VARCHAR(128)
,	Zip_cd		VARCHAR(128)
,	Phone_cd	VARCHAR(128)
,	GPS_cd		VARCHAR(128)
,	Resrc_tx	MEDIUMTEXT	
,	Contact_tx	MEDIUMTEXT	
,	ADD_dm		DATETIME	
,	ADD_nm		VARCHAR(256)	
,	UPD_dm		DATETIME	
,	UPD_nm		VARCHAR(256)	
,	DEL_dm		DATETIME	
,	DEL_nm		VARCHAR(256)	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceContact	Contact name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Key_cd		VARCHAR(16)	-- Search key code
)
BEGIN
/*
**	Name:		gfpResource_Contact
**	Type:		DB API Stored Procedure: Get Filtered
**	Purpose:	To Get an active record or set of active records
**			from tvwResource_Contact
**	Author:		Solomon S. Shacter
**	Contact:	Innovella, Inc.
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tvwResource_Contact';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'VIEW';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'gfpResource_Contact';
DECLARE	SQL_tx	MEDIUMTEXT;
###############################################################################
GFP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'AL';	END IF;
	IF Resrc_id IS NULL OR Resrc_id = 0 THEN SET Resrc_id =  -2147483647;	END IF;
	IF Resrc_tp IS NULL OR Resrc_tp = '' THEN SET Resrc_tp = '-2147483647';	END IF;
	IF Contact_id IS NULL OR Contact_id = 0 THEN SET Contact_id =  -2147483647;	END IF;
	IF Contact_tp IS NULL OR Contact_tp = '' THEN SET Contact_tp = '-2147483647';	END IF;
	IF Contact_nm IS NULL OR Contact_nm = '' THEN SET Contact_nm = '-2147483647';	END IF;
	IF Contact_cd IS NULL OR Contact_cd = '' THEN SET Contact_cd = '-2147483647';	END IF;
	IF Alias_nm IS NULL OR Alias_nm = '' THEN SET Alias_nm = '-2147483647';	END IF;
	IF Address_nm IS NULL OR Address_nm = '' THEN SET Address_nm = '-2147483647';	END IF;
	IF City_cd IS NULL OR City_cd = '' THEN SET City_cd = '-2147483647';	END IF;
	IF State_cd IS NULL OR State_cd = '' THEN SET State_cd = '-2147483647';	END IF;
	IF ZIP_cd IS NULL OR ZIP_cd = '' THEN SET ZIP_cd = '-2147483647';	END IF;
	IF Phone_cd IS NULL OR Phone_cd = '' THEN SET Phone_cd = '-2147483647';	END IF;
	IF GPS_cd IS NULL OR GPS_cd = '' THEN SET GPS_cd = '-2147483647';	END IF;
	IF Resrc_tx IS NULL OR Resrc_tx = '' THEN SET Resrc_tx = '-2147483647';	END IF;
	IF Contact_tx IS NULL OR Contact_tx = '' THEN SET Contact_tx = '-2147483647';	END IF;
	IF ADD_dm IS NULL THEN SET ADD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = '-2147483647';	END IF;
	IF UPD_dm IS NULL THEN SET UPD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = '-2147483647';	END IF;
	IF DEL_dm IS NULL THEN SET DEL_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = '-2147483647';	END IF;
	#######################################################################
	-- Check Security
	#######################################################################
/*	EXECUTE	RETURN		= spSecurityCheck
		SYSTABLE	= SYSTABLE
	,	SYSRIGHT	= SYSRIGHT
	IF
	(
		RETURN	<> 0
	)
	BEGIN
		EXECUTE	STATUS		= errFailedSecurity
			Proc_nm	= Proc_nm
		,	Table_nm	= SYSTABLE
		,	Action_nm	= SYSRIGHT
		RETURN	STATUS
	END
*/
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF	Key_cd = 'PK'
	THEN
		SELECT	*
		FROM
			tvwResource_Contact
		WHERE	1=1
		AND	tvwResource_Contact.Resrc_id	= Resrc_id
		AND	tvwResource_Contact.Resrc_tp	= Resrc_tp
		AND	tvwResource_Contact.Contact_id	= Contact_id
		AND	tvwResource_Contact.Contact_tp	= Contact_tp
		AND	tvwResource_Contact.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd	= 'FK1'
	THEN
		SELECT	*
		FROM
			tvwResource_Contact
		WHERE	1=1
		AND	tvwResource_Contact.Resrc_tp	= Resrc_tp
		AND	tvwResource_Contact.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	IF	Key_cd	= 'FK2'
	THEN
		SELECT	*
		FROM
			tvwResource_Contact
		WHERE	1=1
		AND	tvwResource_Contact.Contact_tp	= Contact_tp
		AND	tvwResource_Contact.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	IF	Key_cd	= 'FK3'
	THEN
		SELECT	*
		FROM
			tvwResource_Contact
		WHERE   1=1
		AND	tvwResource_Contact.Contact_id	= Resrc_id
		AND	tvwResource_Contact.Contact_tp	= Resrc_tp
		AND	tvwResource_Contact.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	IF	Key_cd	= 'FK4'
	THEN
		SELECT	*
		FROM
			tvwResource_Contact
		WHERE   1=1
		AND	tvwResource_Contact.Contact_id	= Contact_id
		AND	tvwResource_Contact.Contact_tp	= Contact_tp
		AND	tvwResource_Contact.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	IF	Key_cd = 'AK'
	THEN
		SELECT	*
		FROM
			tvwResource_Contact
		WHERE	1=1
		AND	tvwResource_Contact.Resrc_id	= Resrc_id
		AND	tvwResource_Contact.Resrc_tp	= Resrc_tp
		AND	tvwResource_Contact.Contact_tp	= Contact_tp
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Search Key lookup
	#######################################################################
	--   NO UI SEARCH KEY(S) DEFINED FOR THIS OBJECT
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd = 'AL'
	THEN
		SELECT	*
		FROM
			tvwResource_Contact
		WHERE	1=1
		AND	(
			tvwResource_Contact.Resrc_id	= Resrc_id
		OR	Resrc_id	=  -2147483647
			)
		AND	(
			tvwResource_Contact.Resrc_tp	= Resrc_tp
		OR	Resrc_tp	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.Contact_id	=  Contact_id
		OR	Contact_id	=  -2147483647
			)
		AND	(
			tvwResource_Contact.Contact_tp	= Contact_tp
		OR	Contact_tp	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.Contact_nm	LIKE CONCAT('%', Contact_nm, '%')
		OR	Contact_nm	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.Contact_cd	LIKE CONCAT('%', Contact_cd, '%')
		OR	Contact_cd	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.Alias_nm	LIKE CONCAT('%', Alias_nm, '%')
		OR	Alias_nm	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.Address_nm	LIKE CONCAT('%', Address_nm, '%')
		OR	Address_nm	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.City_cd	LIKE CONCAT('%', City_cd, '%')
		OR	City_cd	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.State_cd	LIKE CONCAT('%', State_cd, '%')
		OR	State_cd	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.ZIP_cd	LIKE CONCAT('%', ZIP_cd, '%')
		OR	ZIP_cd	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.Phone_cd	LIKE CONCAT('%', Phone_cd, '%')
		OR	Phone_cd	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.GPS_cd	LIKE CONCAT('%', GPS_cd, '%')
		OR	GPS_cd	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.Contact_tx	LIKE CONCAT('%', Contact_tx, '%')
		OR	Contact_tx	LIKE '-2147483647'
			)
		AND	(
			tvwResource_Contact.Resrc_tx	LIKE CONCAT('%', Resrc_tx, '%')
		OR	Resrc_tx	LIKE '-2147483647'
			)
 		AND	(
 			tvwResource_Contact.ADD_dm	>= ADD_dm
 		OR	ADD_dm	= '0000-00-00 00:00:00'
 		OR	ADD_dm	IS NULL
 			)
		AND	(
			tvwResource_Contact.ADD_nm	LIKE CONCAT('%', ADD_nm, '%')
		OR	ADD_nm	= '-2147483647'
			)
  		AND	(
  			tvwResource_Contact.UPD_dm	>= UPD_dm
 		OR	UPD_dm	= '0000-00-00 00:00:00'
   		OR	UPD_dm	IS NULL
  			)
 		AND	(
 			tvwResource_Contact.UPD_nm	LIKE CONCAT('%', UPD_nm, '%')
 		OR	UPD_nm	= '-2147483647'
 			)
  		AND	(
  			tvwResource_Contact.DEL_dm	IS NULL
  			)
 		AND	(
 			tvwResource_Contact.DEL_nm	IS NULL
 			)
		;
		LEAVE GFP;
	END IF;
	#######################################################################
END	GFP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `gfpUser` */

/*!50003 DROP PROCEDURE IF EXISTS  `gfpUser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `gfpUser`(
	User_id		INT SIGNED		-- PK1 
,	User_tp		VARCHAR(64)		-- PK2 AK1
,	User_nm		VARCHAR(256)		--  AK2
,	User_cd		VARCHAR(128)	
,	Hashed_cd	VARCHAR(128)
,	Person_nm	VARCHAR(256)
,	Email_nm	VARCHAR(256)
,	Challenge_cd	VARCHAR(128)
,	Response_cd	VARCHAR(128)
,	User_tx		MEDIUMTEXT	
,	UserADD_dm		DATETIME	
,	UserADD_nm		VARCHAR(256)	
,	UserUPD_dm		DATETIME	
,	UserUPD_nm		VARCHAR(256)	
,	UserDEL_dm		DATETIME	
,	UserDEL_nm		VARCHAR(256)	
,	ParentUser_tp		VARCHAR(64)	
,	UserType_tx		MEDIUMTEXT	
,	UserTypeLeft_id		INT SIGNED	
,	UserTypeRight_id		INT SIGNED	
,	UserTypeLevel_id		INT SIGNED	
,	UserTypeOrder_id		INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceUser	User name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Key_cd		VARCHAR(16)	-- Search key code
)
BEGIN
/*
**	Name:		gfpUser
**	Type:		DB API Stored Procedure: Get Filtered
**	Purpose:	To Get an active record or set of active records
**			from tvwUser
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tvwUser';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'VIEW';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'gfpUser';
DECLARE	SQL_tx	MEDIUMTEXT;
###############################################################################
GFP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'AL';	END IF;
	IF User_id IS NULL OR User_id = 0 THEN SET User_id =  -2147483647;	END IF;
	IF User_tp IS NULL OR User_tp = '' THEN SET User_tp = '-2147483647';	END IF;
	IF User_nm IS NULL OR User_nm = '' THEN SET User_nm = '-2147483647';	END IF;
	IF User_cd IS NULL OR User_cd = '' THEN SET User_cd = '-2147483647';	END IF;
	IF Hashed_cd IS NULL OR Hashed_cd = '' THEN SET Hashed_cd = '-2147483647';	END IF;
	IF Person_nm IS NULL OR Person_nm = '' THEN SET Person_nm = '-2147483647';	END IF;
	IF Email_nm IS NULL OR Email_nm = '' THEN SET Email_nm = '-2147483647';	END IF;
	IF Challenge_cd IS NULL OR Challenge_cd = '' THEN SET Challenge_cd = '-2147483647';	END IF;
	IF Response_cd IS NULL OR Response_cd = '' THEN SET Response_cd = '-2147483647';	END IF;
	IF User_tx IS NULL OR User_tx = '' THEN SET User_tx = '-2147483647';	END IF;
	IF UserADD_dm IS NULL THEN SET UserADD_dm = '0000-00-00 00:00:00';	END IF;
	IF UserADD_nm IS NULL OR UserADD_nm = '' THEN SET UserADD_nm = '-2147483647';	END IF;
	IF UserUPD_dm IS NULL THEN SET UserUPD_dm = '0000-00-00 00:00:00';	END IF;
	IF UserUPD_nm IS NULL OR UserUPD_nm = '' THEN SET UserUPD_nm = '-2147483647';	END IF;
	IF UserDEL_dm IS NULL THEN SET UserDEL_dm = '0000-00-00 00:00:00';	END IF;
	IF UserDEL_nm IS NULL OR UserDEL_nm = '' THEN SET UserDEL_nm = '-2147483647';	END IF;
	IF ParentUser_tp IS NULL OR ParentUser_tp = '' THEN SET ParentUser_tp = '-2147483647';	END IF;
	IF UserType_tx IS NULL OR UserType_tx = '' THEN SET UserType_tx = '-2147483647';	END IF;
	IF UserTypeLeft_id IS NULL OR UserTypeLeft_id = 0 THEN SET UserTypeLeft_id =  -2147483647;	END IF;
	IF UserTypeRight_id IS NULL OR UserTypeRight_id = 0 THEN SET UserTypeRight_id =  -2147483647;	END IF;
	IF UserTypeLevel_id IS NULL OR UserTypeLevel_id = 0 THEN SET UserTypeLevel_id =  -2147483647;	END IF;
	IF UserTypeOrder_id IS NULL OR UserTypeOrder_id = 0 THEN SET UserTypeOrder_id =  -2147483647;	END IF;
	#######################################################################
	-- Check Security
	#######################################################################
/*	EXECUTE	RETURN		= spSecurityCheck
		SYSTABLE	= SYSTABLE
	,	SYSRIGHT	= SYSRIGHT
	IF
	(
		RETURN	<> 0
	)
	BEGIN
		EXECUTE	STATUS		= errFailedSecurity
			Proc_nm	= Proc_nm
		,	Table_nm	= SYSTABLE
		,	Action_nm	= SYSRIGHT
		RETURN	STATUS
	END
*/
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF	Key_cd = 'PK'
	THEN
		SELECT	*
		FROM
			tvwUser
		WHERE
			tvwUser.User_id	= User_id
		AND	tvwUser.User_tp	= User_tp
		AND	tvwUser.UserDEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd	= 'FK1'
	THEN
		SELECT	*
		FROM
			tvwUser
		WHERE
			tvwUser.User_tp	= User_tp
		AND	tvwUser.UserDEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	IF	Key_cd	= 'FK2'
	THEN
		SELECT	*
		FROM
			tvwUser
		WHERE
			tvwUser.User_tp	= User_tp
		AND	tvwUser.User_id	= User_id
		AND	tvwUser.UserDEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	IF	Key_cd = 'AK'
	THEN
		SELECT	*
		FROM
			tvwUser
		WHERE
			tvwUser.User_tp	= User_tp
		AND	tvwUser.User_nm	= User_nm
		AND	tvwUser.UserDEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Search Key lookup
	#######################################################################
	--   NO UI SEARCH KEY(S) DEFINED FOR THIS OBJECT
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd = 'AL'
	THEN
		SELECT	*
		FROM
			tvwUser
		WHERE
			(
			tvwUser.User_id	=  User_id
		OR	User_id	=  -2147483647
			)
		AND	(
			tvwUser.User_tp	= User_tp
		OR	User_tp	= '-2147483647'
			)
		AND	(
			tvwUser.User_nm	LIKE CONCAT('%', User_nm, '%')
		OR	User_nm	= '-2147483647'
			)
		AND	(
			tvwUser.User_cd	LIKE CONCAT('%', User_cd, '%')
		OR	User_cd	= '-2147483647'
			)
		AND	(
			tvwUser.Hashed_cd	LIKE CONCAT('%', Hashed_cd, '%')
		OR	Hashed_cd	= '-2147483647'
			)
		AND	(
			tvwUser.Person_nm	LIKE CONCAT('%', Person_nm, '%')
		OR	Person_nm	= '-2147483647'
			)
		AND	(
			tvwUser.Email_nm	LIKE CONCAT('%', Email_nm, '%')
		OR	Email_nm	= '-2147483647'
			)
		AND	(
			tvwUser.Challenge_cd	LIKE CONCAT('%', Challenge_cd, '%')
		OR	Challenge_cd	= '-2147483647'
			)
		AND	(
			tvwUser.Response_cd	LIKE CONCAT('%', Response_cd, '%')
		OR	Response_cd	= '-2147483647'
			)
		AND	(
			tvwUser.User_tx	LIKE CONCAT('%', User_tx, '%')
		OR	User_tx	LIKE '-2147483647'
			)
 		AND	(
 			tvwUser.UserADD_dm	>= UserADD_dm
 		OR	UserADD_dm	= '0000-00-00 00:00:00'
 		OR	UserADD_dm	IS NULL
 			)
		AND	(
			tvwUser.UserADD_nm	LIKE CONCAT('%', UserADD_nm, '%')
		OR	UserADD_nm	= '-2147483647'
			)
  		AND	(
  			tvwUser.UserUPD_dm	>= UserUPD_dm
 		OR	UserUPD_dm	= '0000-00-00 00:00:00'
   		OR	UserUPD_dm	IS NULL
  			)
 		AND	(
 			tvwUser.UserUPD_nm	LIKE CONCAT('%', UserUPD_nm, '%')
 		OR	UserUPD_nm	= '-2147483647'
 			)
  		AND	(
  			tvwUser.UserDEL_dm	IS NULL
  			)
 		AND	(
 			tvwUser.UserDEL_nm	IS NULL
 			)
 		AND	(
 			tvwUser.ParentUser_tp	= ParentUser_tp
 		OR	ParentUser_tp	= '-2147483647'
 			)
 		AND	(
 			tvwUser.UserType_tx	LIKE CONCAT('%', UserType_tx, '%')
 		OR	UserType_tx	LIKE '-2147483647'
 			)
 		AND	(
 			tvwUser.UserTypeLeft_id	= UserTypeLeft_id
 		OR	UserTypeLeft_id	=  -2147483647
 			)
 		AND	(
 			tvwUser.UserTypeRight_id	= UserTypeRight_id
 		OR	UserTypeRight_id	=  -2147483647
 			)
 		AND	(
 			tvwUser.UserTypeLevel_id	= UserTypeLevel_id
 		OR	UserTypeLevel_id	=  -2147483647
 			)
 		AND	(
 			tvwUser.UserTypeOrder_id	= UserTypeOrder_id
 		OR	UserTypeOrder_id	=  -2147483647
 			)
		;
		LEAVE GFP;
	END IF;
	#######################################################################
END	GFP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `gfpUserType` */

/*!50003 DROP PROCEDURE IF EXISTS  `gfpUserType` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `gfpUserType`(
	User_tp		VARCHAR(64)		-- PK1 
,	ParentUser_tp	VARCHAR(64)	
,	UserType_tx		MEDIUMTEXT	
,	UserTypeLeft_id	INT SIGNED	
,	UserTypeRight_id	INT SIGNED	
,	UserTypeLevel_id	INT SIGNED	
,	UserTypeOrder_id	INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceUser	User name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Key_cd		VARCHAR(16)	-- Search key code
)
BEGIN
/*
**	Name:		gfpUserType
**	Type:		DB API Stored Procedure: Get Filtered
**	Purpose:	To Get an active record or set of active records
**			from tvwUserType
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tvwUserType';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'VIEW';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'gfpUserType';
###############################################################################
GFP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'AL';	END IF;
	IF User_tp IS NULL OR User_tp = '' THEN SET User_tp = '-2147483647';	END IF;
	IF ParentUser_tp IS NULL OR ParentUser_tp = '' THEN SET ParentUser_tp = '-2147483647';	END IF;
	IF UserType_tx IS NULL OR UserType_tx = '' THEN SET UserType_tx = '-2147483647';	END IF;
	IF UserTypeLeft_id IS NULL OR UserTypeLeft_id = 0 THEN SET UserTypeLeft_id =  -2147483647;	END IF;
	IF UserTypeRight_id IS NULL OR UserTypeRight_id = 0 THEN SET UserTypeRight_id =  -2147483647;	END IF;
	IF UserTypeLevel_id IS NULL OR UserTypeLevel_id = 0 THEN SET UserTypeLevel_id =  -2147483647;	END IF;
	IF UserTypeOrder_id IS NULL OR UserTypeOrder_id = 0 THEN SET UserTypeOrder_id =  -2147483647;	END IF;
	#######################################################################
	-- Check Security
	#######################################################################
/*	EXECUTE	RETURN		= spSecurityCheck
		SYSTABLE	= SYSTABLE
	,	SYSRIGHT	= SYSRIGHT
	IF
	(
		RETURN	<> 0
	)
	BEGIN
		EXECUTE	STATUS		= errFailedSecurity
			Proc_nm	= Proc_nm
		,	Table_nm	= SYSTABLE
		,	Action_nm	= SYSRIGHT
		RETURN	STATUS
	END
*/
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF	Key_cd = 'PK'
	THEN
		SELECT	*
		FROM
			tvwUserType
		WHERE
			tvwUserType.User_tp	= User_tp
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd	= 'FK1'
	THEN
		SELECT	*
		FROM
			tvwUserType
		WHERE
			tvwUserType.User_tp	= User_tp
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	-- NO ALTERNATE KEY DEFINED FOR THIS OBJECT
	#######################################################################
	-- Search Key lookup
	#######################################################################
	--   NO UI SEARCH KEY(S) DEFINED FOR THIS OBJECT
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd = 'AL'
	THEN
		SELECT	*
		FROM
			tvwUserType
		WHERE
			(
			tvwUserType.User_tp	= User_tp
		OR	User_tp	= '-2147483647'
			)
		AND	(
			tvwUserType.ParentUser_tp	= ParentUser_tp
		OR	ParentUser_tp	= '-2147483647'
			)
		AND	(
			tvwUserType.UserType_tx	LIKE CONCAT('%', UserType_tx, '%')
		OR	UserType_tx	LIKE '-2147483647'
			)
		AND	(
			tvwUserType.UserTypeLeft_id	= UserTypeLeft_id
		OR	UserTypeLeft_id	=  -2147483647
			)
		AND	(
			tvwUserType.UserTypeRight_id	= UserTypeRight_id
		OR	UserTypeRight_id	=  -2147483647
			)
		AND	(
			tvwUserType.UserTypeLevel_id	= UserTypeLevel_id
		OR	UserTypeLevel_id	=  -2147483647
			)
		AND	(
			tvwUserType.UserTypeOrder_id	= UserTypeOrder_id
		OR	UserTypeOrder_id	=  -2147483647
			)
		;
		LEAVE GFP;
	END IF;
	#######################################################################
END	GFP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `gfpUser_Company` */

/*!50003 DROP PROCEDURE IF EXISTS  `gfpUser_Company` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `gfpUser_Company`(
	User_id		INT SIGNED		-- PK1 
,	User_tp		VARCHAR(64)		-- PK2 AK1
,	Company_id		INT SIGNED		-- PK1 
,	Company_tp		VARCHAR(64)		-- PK2 AK1
,	User_nm		VARCHAR(256)		--  AK2
,	User_cd		VARCHAR(128)	
,	Alias_nm		VARCHAR(256)		--  AK2
,	Hashed_cd	VARCHAR(128)
,	Person_nm	VARCHAR(256)
,	Email_nm	VARCHAR(256)
,	Challenge_cd	VARCHAR(128)
,	Response_cd	VARCHAR(128)
,	Company_nm		VARCHAR(256)		--  AK2
,	Company_cd		VARCHAR(128)	
,	User_tx	MEDIUMTEXT
,	Company_tx		MEDIUMTEXT	
,	ADD_dm		DATETIME	
,	ADD_nm		VARCHAR(256)	
,	UPD_dm		DATETIME	
,	UPD_nm		VARCHAR(256)	
,	DEL_dm		DATETIME	
,	DEL_nm		VARCHAR(256)	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceCompany	Company name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Key_cd		VARCHAR(16)	-- Search key code
)
BEGIN
/*
**	Name:		gfpUser_Company
**	Type:		DB API Stored Procedure: Get Filtered
**	Purpose:	To Get an active record or set of active records
**			from tvwUser_Company
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tvwUser_Company';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'VIEW';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'gfpUser_Company';
DECLARE	SQL_tx	MEDIUMTEXT;
###############################################################################
GFP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'AL';	END IF;
	IF User_id IS NULL OR User_id = 0 THEN SET User_id =  -2147483647;	END IF;
	IF User_tp IS NULL OR User_tp = '' THEN SET User_tp = '-2147483647';	END IF;
	IF Company_id IS NULL OR Company_id = 0 THEN SET Company_id =  -2147483647;	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = '-2147483647';	END IF;
	IF User_nm IS NULL OR User_nm = '' THEN SET User_nm = '-2147483647';	END IF;
	IF User_cd IS NULL OR User_cd = '' THEN SET User_cd = '-2147483647';	END IF;
	IF Hashed_cd IS NULL OR Hashed_cd = '' THEN SET Hashed_cd = '-2147483647';	END IF;
	IF Person_nm IS NULL OR Person_nm = '' THEN SET Person_nm = '-2147483647';	END IF;
	IF Alias_nm IS NULL OR Alias_nm = '' THEN SET Alias_nm = '-2147483647';	END IF;
	IF Email_nm IS NULL OR Email_nm = '' THEN SET User_cd = '-2147483647';	END IF;
	IF Challenge_cd IS NULL OR Challenge_cd = '' THEN SET Challenge_cd = '-2147483647';	END IF;
	IF Response_cd IS NULL OR Response_cd = '' THEN SET Response_cd = '-2147483647';	END IF;
	IF Company_nm IS NULL OR Company_nm = '' THEN SET Company_nm = '-2147483647';	END IF;
	IF Company_cd IS NULL OR Company_cd = '' THEN SET Company_cd = '-2147483647';	END IF;
	IF User_tx IS NULL OR User_tx = '' THEN SET User_tx = '-2147483647';	END IF;
	IF Company_tx IS NULL OR Company_tx = '' THEN SET Company_tx = '-2147483647';	END IF;
	IF ADD_dm IS NULL THEN SET ADD_dm = '0000-00-00 00:00:00';	END IF;
	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = '-2147483647';	END IF;
	IF UPD_dm IS NULL THEN SET UPD_dm = '0000-00-00 00:00:00';	END IF;
	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = '-2147483647';	END IF;
	IF DEL_dm IS NULL THEN SET DEL_dm = '0000-00-00 00:00:00';	END IF;
	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = '-2147483647';	END IF;
	#######################################################################
	-- Check Security
	#######################################################################
/*	EXECUTE	RETURN		= spSecurityCheck
		SYSTABLE	= SYSTABLE
	,	SYSRIGHT	= SYSRIGHT
	IF
	(
		RETURN	<> 0
	)
	BEGIN
		EXECUTE	STATUS		= errFailedSecurity
			Proc_nm	= Proc_nm
		,	Table_nm	= SYSTABLE
		,	Action_nm	= SYSRIGHT
		RETURN	STATUS
	END
*/
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF	Key_cd = 'PK'
	THEN
		SELECT	*
		FROM
			tvwUser_Company
		WHERE	1=1
		AND	tvwUser_Company.User_id	= User_id
		AND	tvwUser_Company.User_tp	= User_tp
		AND	tvwUser_Company.Company_id	= Company_id
		AND	tvwUser_Company.Company_tp	= Company_tp
		AND	tvwUser_Company.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd	= 'FK1'
	THEN
		SELECT	*
		FROM
			tvwUser_Company
		WHERE	1=1
		AND	tvwUser_Company.User_tp	= User_tp
		AND	tvwUser_Company.Company_tp	= Company_tp
		AND	tvwUser_Company.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	IF	Key_cd	= 'FK2'
	THEN
		SELECT	*
		FROM
			tvwUser_Company
		WHERE	1=1
		AND	tvwUser_Company.User_id	= User_id
		AND	tvwUser_Company.User_tp	= User_tp
		AND	tvwUser_Company.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	IF	Key_cd	= 'FK3'
	THEN
		SELECT	*
		FROM
			tvwUser_Company
		WHERE   1=1
		AND	tvwUser_Company.Company_id	= Company_id
		AND	tvwUser_Company.Company_tp	= Company_tp
		AND	tvwUser_Company.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	IF	Key_cd = 'AK'
	THEN
		SELECT	*
		FROM
			tvwUser_Company
		WHERE	1=1
		AND	tvwUser_Company.User_tp	= User_tp
		AND	tvwUser_Company.User_nm	= User_nm
		AND	tvwUser_Company.Company_tp	= Company_tp
		AND	tvwUser_Company.Company_nm	= Company_nm
		AND	tvwUser_Company.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Search Key lookup
	#######################################################################
	--   NO UI SEARCH KEY(S) DEFINED FOR THIS OBJECT
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd = 'AL'
	THEN
		SELECT	*
		FROM
			tvwUser_Company
		WHERE	1=1
		AND	(
			tvwUser_Company.User_id	= User_id
		OR	User_id	=  -2147483647
			)
		AND	(
			tvwUser_Company.User_tp	= User_tp
		OR	User_tp	= '-2147483647'
			)
		AND	(
			tvwUser_Company.Company_id	=  Company_id
		OR	Company_id	=  -2147483647
			)
		AND	(
			tvwUser_Company.Company_tp	= Company_tp
		OR	Company_tp	= '-2147483647'
			)
		AND	(
			tvwUser_Company.User_nm	LIKE CONCAT('%', User_nm, '%')
		OR	User_nm	= '-2147483647'
			)
		AND	(
			tvwUser_Company.User_cd	LIKE CONCAT('%', User_cd, '%')
		OR	User_cd	= '-2147483647'
			)
		AND	(
			tvwUser_Company.Hashed_cd	= Hashed_cd
		OR	Hashed_cd	= '-2147483647'
			)
		AND	(
			tvwUser_Company.Person_nm	LIKE CONCAT('%', Person_nm, '%')
		OR	Person_nm	= '-2147483647'
			)
		AND	(
			tvwUser_Company.Email_nm	LIKE CONCAT('%', Email_nm, '%')
		OR	Email_nm	= '-2147483647'
			)
		AND	(
			tvwUser_Company.Challenge_cd	LIKE CONCAT('%', Challenge_cd, '%')
		OR	Challenge_cd	= '-2147483647'
			)
		AND	(
			tvwUser_Company.Response_cd	LIKE CONCAT('%', Response_cd, '%')
		OR	Response_cd	= '-2147483647'
			)
		AND	(
			tvwUser_Company.Alias_nm	LIKE CONCAT('%', Alias_nm, '%')
		OR	Alias_nm	= '-2147483647'
			)
		AND	(
			tvwUser_Company.Company_nm	LIKE CONCAT('%', Company_nm, '%')
		OR	Company_nm	= '-2147483647'
			)
		AND	(
			tvwUser_Company.Company_cd	LIKE CONCAT('%', Company_cd, '%')
		OR	Company_cd	= '-2147483647'
			)
		AND	(
			tvwUser_Company.User_tx	LIKE CONCAT('%', User_tx, '%')
		OR	User_tx	= '-2147483647'
			)
		AND	(
			tvwUser_Company.Company_tx	LIKE CONCAT('%', Company_tx, '%')
		OR	Company_tx	LIKE '-2147483647'
			)
 		AND	(
 			tvwUser_Company.ADD_dm	>= ADD_dm
 		OR	ADD_dm	= '0000-00-00 00:00:00'
 		OR	ADD_dm	IS NULL
 			)
		AND	(
			tvwUser_Company.ADD_nm	LIKE CONCAT('%', ADD_nm, '%')
		OR	ADD_nm	= '-2147483647'
			)
  		AND	(
  			tvwUser_Company.UPD_dm	>= UPD_dm
 		OR	UPD_dm	= '0000-00-00 00:00:00'
   		OR	UPD_dm	IS NULL
  			)
 		AND	(
 			tvwUser_Company.UPD_nm	LIKE CONCAT('%', UPD_nm, '%')
 		OR	UPD_nm	= '-2147483647'
 			)
 
 		AND	(
 			tvwUser_Company.DEL_nm	IS NULL
 			)
		;
		LEAVE GFP;
	END IF;
	#######################################################################
END	GFP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `ispCompany` */

/*!50003 DROP PROCEDURE IF EXISTS  `ispCompany` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ispCompany`(
INOUT	Company_id		INT SIGNED		-- PK1 
,	Company_tp		VARCHAR(64)		-- PK2 AK1
,	Company_nm		VARCHAR(256)		--  AK2
,	Company_cd		VARCHAR(128)	
,	Company_tx		MEDIUMTEXT	
,	CompanyADD_dm		DATETIME	
,	CompanyADD_nm		VARCHAR(256)	
,	CompanyUPD_dm		DATETIME	
,	CompanyUPD_nm		VARCHAR(256)	
,	CompanyDEL_dm		DATETIME	
,	CompanyDEL_nm		VARCHAR(256)	
,	ParentCompany_tp		VARCHAR(64)	
,	CompanyType_tx		MEDIUMTEXT	
,	CompanyTypeLeft_id		INT SIGNED	
,	CompanyTypeRight_id		INT SIGNED	
,	CompanyTypeLevel_id		INT SIGNED	
,	CompanyTypeOrder_id		INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceCompany	Company name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		ispCompany
**	Type:		DB API procedure: Insert
**	Purpose:	To insert Company data into tblCompany
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	6/14/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblCompany';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'INSERT';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'ispCompany';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
DECLARE	FK1		VARCHAR(255) DEFAULT CONCAT(Company_tp);
DECLARE	FK2		VARCHAR(255) DEFAULT CONCAT(Company_id,",",Company_tp);
###############################################################################
ISP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	IF Company_id = '0' OR Company_id = 0 THEN SET Company_id =  NULL;	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = NULL;	END IF;
	IF Company_nm IS NULL OR Company_nm = '' THEN SET Company_nm = NULL;	END IF;
	IF Company_cd IS NULL OR Company_cd = '' THEN SET Company_cd = NULL;	END IF;
	IF Company_tx IS NULL OR Company_tx = '' THEN SET Company_tx = NULL;	END IF;
	IF CompanyADD_dm IS NULL THEN SET CompanyADD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF CompanyADD_nm IS NULL OR CompanyADD_nm = '' THEN SET CompanyADD_nm = NULL;	END IF;
	IF CompanyUPD_dm IS NULL THEN SET CompanyUPD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF CompanyUPD_nm IS NULL OR CompanyUPD_nm = '' THEN SET CompanyUPD_nm = NULL;	END IF;
	IF CompanyDEL_dm IS NULL THEN SET CompanyDEL_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF CompanyDEL_nm IS NULL OR CompanyDEL_nm = '' THEN SET CompanyDEL_nm = NULL;	END IF;
	IF ParentCompany_tp IS NULL OR ParentCompany_tp = '' THEN SET ParentCompany_tp = NULL;	END IF;
	IF CompanyType_tx IS NULL OR CompanyType_tx = '' THEN SET CompanyType_tx = NULL;	END IF;
	IF CompanyTypeLeft_id = '0' OR CompanyTypeLeft_id = 0 THEN SET CompanyTypeLeft_id = NULL;	END IF;
	IF CompanyTypeRight_id = '0' OR CompanyTypeRight_id = 0 THEN SET CompanyTypeRight_id = NULL;	END IF;
	IF CompanyTypeLevel_id = '0' OR CompanyTypeLevel_id = 0 THEN SET CompanyTypeLevel_id = NULL;	END IF;
	IF CompanyTypeOrder_id = '0' OR CompanyTypeOrder_id = 0 THEN SET CompanyTypeOrder_id = NULL;	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
	CALL	rspCompany
	(
		@Company_id	:= Company_id
	,	@Company_tp	:= Company_tp
	,	@Company_nm	:= Company_nm
	,	@Company_cd	:= Company_cd
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 1	-- If PK exists then return without error
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				Company_id
			,	Company_tp
			,	Company_nm
			;
		END IF;
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################
	SELECT
		tvwCompany.Company_id
	,	tvwCompany.Company_tp
	INTO
		Company_id
	,	Company_tp
	FROM
		tvwCompany
	WHERE
		tvwCompany.Company_tp	= Company_tp
	AND	tvwCompany.Company_nm	= Company_nm
	;
	IF
		FOUND_ROWS()	> 0
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				Company_id
			,	Company_tp
			,	Company_nm
			;
		END IF;
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Validate attributes
	#######################################################################
	CALL	vspCompany
	(
		@Company_id	:= Company_id
	,	@Company_tp	:= Company_tp
	,	@Company_nm	:= Company_nm
	,	@Company_cd	:= Company_cd
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= Proc_nm
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET	@FK1	= CONCAT(Company_tp);
	SET	@FK2	= CONCAT(Company_id,",",Company_tp);
	-- --------------------------------------------------------------------
	IF
		Mode_cd	= 'R'
	THEN
		--
		--	RESTRICT MODE:	tblCompanyType
		--
		CALL	rspCompanyType
		(
			@Company_tp	:= Company_tp
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblCompanyType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= 'tblCompanyType'
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= 'tblCompanyType'
			);
			LEAVE	ISP;
		END IF;
		--
		--	RESTRICT MODE:	tblResource
		--
		CALL	rspResource
		(
			@Resrc_id	:= Company_id
		,	@Resrc_tp	:= Company_tp
		,	@Resrc_tx	:= Company_tx
		,	@ADD_dm		:= CompanyADD_dm
		,	@ADD_nm		:= CompanyADD_nm
		,	@UPD_dm		:= CompanyUPD_dm
		,	@UPD_nm		:= CompanyUPD_nm
		,	@DEL_dm		:= CompanyDEL_dm
		,	@DEL_nm		:= CompanyDEL_nm
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblCompanyType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= 'tblResource'
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK2
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= 'tblResource'
			);
			LEAVE	ISP;
		END IF;
	END IF;
	-- --------------------------------------------------------------------
	-- --------------------------------------------------------------------
	IF
		Mode_cd	= 'C'
	THEN
		--
		--	CASCADE MODE:	tblCompanyType
		--
		CALL	ispCompanyType
		(
			@Company_tp		:= Company_tp
		,	@ParentCompany_tp	:= ParentCompany_tp
		,	@CompanyType_tx		:= CompanyType_tx
		,	@CompanyTypeLeft_id	:= CompanyTypeLeft_id
		,	@CompanyTypeRight_id	:= CompanyTypeRight_id
		,	@CompanyTypeLevel_id	:= CompanyTypeLevel_id
		,	@CompanyTypeOrder_id	:= CompanyTypeOrder_id
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= 'R'	-- This Table Is Restricted and Does Not Allow A Cascade From an FK Table.
		);
		--
		--	CASCADE MODE:	tblResource
		--
		SET	@Resrc_id	= Company_id;
		CALL	ispResource
		(
			@Resrc_id
		,	@Resrc_tp	:= Company_tp
		,	@Resrc_tx	:= Company_tx
		,	@ADD_dm		:= CompanyADD_dm
		,	@ADD_nm		:= CompanyADD_nm
		,	@UPD_dm		:= CompanyUPD_dm
		,	@UPD_nm		:= CompanyUPD_nm
		,	@DEL_dm		:= CompanyDEL_dm
		,	@DEL_nm		:= CompanyDEL_nm
		,	@ParentResrc_tp	:= ParentCompany_tp
		,	@ResrcType_tx	:= CompanyType_tx
		,	@Left_id	:= CompanyTypeLeft_id
		,	@Right_id	:= CompanyTypeRight_id
		,	@Level_id	:= CompanyTypeLevel_id
		,	@Order_id	:= CompanyTypeOrder_id
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		);
	END IF;
	#######################################################################
	-- Insert values
	#######################################################################
	--	Set the proc IN parameters to the parent ISP INOUT parameters
	SET Company_id	= @Resrc_id;
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedEvent
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
	INSERT
	INTO	tblCompany
	(
		Company_id
	,	Company_tp
	,	Company_nm
	,	Company_cd
	)
	VALUES
	(
		Company_id
	,	Company_tp
	,	Company_nm
	,	Company_cd
	);
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
	-- Return the Primary Key to the front-end if this procedure
	-- was not called from another API stored procedure.
	#######################################################################
 	IF
 		CallingProc_nm	IS NULL OR CallingProc_nm = ''
 	THEN
		SELECT
			Company_id
		,	Company_tp
		,	Company_nm
 		;
 	END IF;
	#######################################################################
END ISP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `ispCompanyType` */

/*!50003 DROP PROCEDURE IF EXISTS  `ispCompanyType` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `ispCompanyType`(
	Company_tp		VARCHAR(64)		-- PK1 
,	ParentCompany_tp		VARCHAR(64)	
,	CompanyType_tx		MEDIUMTEXT	
,	CompanyTypeLeft_id		INT SIGNED	
,	CompanyTypeRight_id		INT SIGNED	
,	CompanyTypeLevel_id		INT SIGNED	
,	CompanyTypeOrder_id		INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceCompany	Company name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		ispCompanyType
**	Type:		DB API procedure: Insert
**	Purpose:	To insert CompanyType data into tblCompanyType
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	6/14/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblCompanyType';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'INSERT';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'ispCompanyType';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
DECLARE	FK1		VARCHAR(255) DEFAULT CONCAT(Company_tp);
###############################################################################
ISP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
	CALL	rspCompanyType
	(
		@Company_tp	:= Company_tp
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 1	-- If PK exists then return without error
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				Company_tp
			;
		END IF;
		LEAVE	ISP;
	END IF;
	IF
		CallingProc_nm	= "ispCompany"
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFKNotExist
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		,	@Key_nm		:= FK1
		);
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################
	#######################################################################
	-- Validate attributes
	#######################################################################
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	--
	--	RESTRICT MODE:	tblResourceType
	--
	IF
		@Mode_cd	= 'R'
	THEN
		CALL	rspResourceType
		(
			@Resrc_tp	:= Company_tp
		,	@ParentResrc_tp	:= ParentCompany_tp
		,	@ResrcType_tx	:= CompanyType_tx
		,	@Left_id	:= CompanyTypeLeft_id
		,	@Right_id	:= CompanyTypeRight_id
		,	@Level_id	:= CompanyTypeLevel_id
		,	@Order_id	:= CompanyTypeOrder_id
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblResourceType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= 'tblResourceType'
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= 'tblResourceType'
			);
			LEAVE	ISP;
		END IF;
	END IF;
	--
	--	CASCADE MODE:	tblResourceType
	--
	IF
		@Mode_cd	= 'C'
	THEN
		CALL	ispResourceType
		(
			@Resrc_tp	:= Company_tp
		,	@ParentResrc_tp	:= ParentCompany_tp
		,	@ResrcType_tx	:= CompanyType_tx
		,	@Left_id	:= CompanyTypeLeft_id
		,	@Right_id	:= CompanyTypeRight_id
		,	@Level_id	:= CompanyTypeLevel_id
		,	@Order_id	:= CompanyTypeOrder_id
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= 'R'	-- This Table Is Restricted and Does Not Allow A Cascade From an FK Table.
		);
	END IF;
	#######################################################################
	-- Insert values
	#######################################################################
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCompany
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
	INSERT
	INTO	tblCompanyType
	(
		Company_tp
	)
	VALUES
	(
		Company_tp
	);
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
	-- Return the Primary Key to the front-end if this procedure
	-- was not called from another API stored procedure.
	#######################################################################
 	IF
 		CallingProc_nm	IS NULL OR CallingProc_nm = ''
 	THEN
		SELECT
			@Company_tp	AS Company_tp
 		;
 	END IF;
	#######################################################################
END	ISP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `ispContactType` */

/*!50003 DROP PROCEDURE IF EXISTS  `ispContactType` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ispContactType`(
	Contact_tp		VARCHAR(64)		-- PK1 
,	ParentContact_tp		VARCHAR(64)	
,	ContactType_tx		MEDIUMTEXT	
,	ContactTypeLeft_id		INT SIGNED	
,	ContactTypeRight_id		INT SIGNED	
,	ContactTypeLevel_id		INT SIGNED	
,	ContactTypeOrder_id		INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceContact	Contact name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		ispContactType
**	Type:		DB API procedure: Insert
**	Purpose:	To insert ContactType data into tblContactType
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	6/14/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblContactType';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'INSERT';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'ispContactType';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
DECLARE	FK1		VARCHAR(255) DEFAULT CONCAT(Contact_tp);
###############################################################################
ISP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
	CALL	rspContactType
	(
		@Contact_tp	:= Contact_tp
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 1	-- If PK exists then return without error
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				Contact_tp
			;
		END IF;
		LEAVE	ISP;
	END IF;
	IF
		CallingProc_nm	= "ispResource_Contact"
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFKNotExist
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		,	@Key_nm		:= FK1
		);
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################
	#######################################################################
	-- Validate attributes
	#######################################################################
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	--
	--	RESTRICT MODE:	tblResourceType
	--
	IF
		@Mode_cd	= 'R'
	THEN
		SET 	@TABLE	= "tblResourceType";
		CALL	rspResourceType
		(
			@Resrc_tp	:= Contact_tp
		,	@ParentResrc_tp	:= ParentContact_tp
		,	@ResrcType_tx	:= ContactType_tx
		,	@Left_id	:= ContactTypeLeft_id
		,	@Right_id	:= ContactTypeRight_id
		,	@Level_id	:= ContactTypeLevel_id
		,	@Order_id	:= ContactTypeOrder_id
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblResourceType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	ISP;
		END IF;
	END IF;
	--
	--	CASCADE MODE:	tblResourceType
	--
	IF
		@Mode_cd	= 'C'
	THEN
		CALL	ispResourceType
		(
			@Resrc_tp	:= Contact_tp
		,	@ParentResrc_tp	:= ParentContact_tp
		,	@ResrcType_tx	:= ContactType_tx
		,	@Left_id	:= ContactTypeLeft_id
		,	@Right_id	:= ContactTypeRight_id
		,	@Level_id	:= ContactTypeLevel_id
		,	@Order_id	:= ContactTypeOrder_id
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= 'R'	-- This Table Is Restricted and Does Not Allow A Cascade From an FK Table.
		);
	END IF;
	#######################################################################
	-- Insert values
	#######################################################################
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedContact
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
	INSERT
	INTO	tblContactType
	(
		Contact_tp
	)
	VALUES
	(
		Contact_tp
	);
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
	-- Return the Primary Key to the front-end if this procedure
	-- was not called from another API stored procedure.
	#######################################################################
 	IF
 		CallingProc_nm	IS NULL OR CallingProc_nm = ''
 	THEN
		SELECT
			@Contact_tp	AS Contact_tp
 		;
 	END IF;
	#######################################################################
END	ISP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `ispResource` */

/*!50003 DROP PROCEDURE IF EXISTS  `ispResource` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `ispResource`(
INOUT	Resrc_id		INT SIGNED		-- PK1 
,	Resrc_tp		VARCHAR(64)		-- PK2 AK1
,	Resrc_tx		MEDIUMTEXT	
,	ADD_dm		DATETIME	
,	ADD_nm		VARCHAR(128)	
,	UPD_dm		DATETIME	
,	UPD_nm		VARCHAR(128)	
,	DEL_dm		DATETIME	
,	DEL_nm		VARCHAR(128)	
,	ParentResrc_tp		VARCHAR(64)	
,	ResrcType_tx		MEDIUMTEXT	
,	Left_id		INT SIGNED	
,	Right_id		INT SIGNED	
,	Level_id		INT SIGNED	
,	Order_id		INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		ispResource
**	Type:		DB API procedure: Insert
**	Purpose:	To insert Resource data into tblResource
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	4/12/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResource';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'INSERT';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'ispResource';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
ISP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF CallingProc_nm IS NULL OR CallingProc_nm = '' THEN SET CallingProc_nm = '';	END IF;
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= 'tblResource'
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
	CALL	rspResource
	(
		@Resrc_id	:= Resrc_id
	,	@Resrc_tp	:= Resrc_tp
	,	@Resrc_tx	:= Resrc_tx
	,	@ADD_dm	:= ADD_dm
	,	@ADD_nm	:= ADD_nm
	,	@UPD_dm	:= UPD_dm
	,	@UPD_nm	:= UPD_nm
	,	@DEL_dm	:= DEL_dm
	,	@DEL_nm	:= DEL_nm
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 1	-- If PK exists then return without error
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				Resrc_id
			,	Resrc_tp
			;
		END IF;
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################
	#######################################################################
	-- Validate attributes
	#######################################################################
	SET 	@ADD_dm	= ADD_dm;
	SET 	@ADD_nm	= ADD_nm;
	SET 	@UPD_dm	= UPD_dm;
	SET 	@UPD_nm	= UPD_nm;
	SET 	@DEL_dm	= DEL_dm;
	SET 	@DEL_nm	= DEL_nm;
	CALL	vspResource
	(
		@Resrc_id	:= Resrc_id
	,	@Resrc_tp	:= Resrc_tp
	,	@Resrc_tx	:= Resrc_tx
	,	@ADD_dm
	,	@ADD_nm
	,	@UPD_dm
	,	@UPD_nm
	,	@DEL_dm
	,	@DEL_nm
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= 'vspResource'
		);
		LEAVE	ISP;
	END IF;
	SET 	ADD_dm	= @ADD_dm;
	SET 	ADD_nm	= @ADD_nm;
	SET 	UPD_dm	= @UPD_dm;
	SET 	UPD_nm	= @UPD_nm;
	SET 	DEL_dm	= @DEL_dm;
	SET 	DEL_nm	= @DEL_nm;
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	--
	--	RESTRICT MODE:	tblResourceType
	--
	IF
		Mode_cd	= 'R'
	THEN
		CALL	rspResourceType
		(
			@Resrc_tp	:= Resrc_tp
		,	@ParentResrc_tp	:= ParentResrc_tp
		,	@ResrcType_tx	:= ResrcType_tx
		,	@Left_id	:= Left_id
		,	@Right_id	:= Right_id
		,	@Level_id	:= Level_id
		,	@Order_id	:= Order_id
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblResourceType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= SYSTABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= 'Resrc_tp'
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= 'tblResourceType'
			);
			LEAVE	ISP;
		END IF;
	END IF;
	--
	--	CASCADE MODE:	tblResourceType
	--
	IF
		Mode_cd	= 'C'
	THEN
		CALL	ispResourceType
		(
			@Resrc_tp	:= Resrc_tp
		,	@ParentResrc_tp	:= ParentResrc_tp
		,	@ResrcType_tx	:= ResrcType_tx
		,	@Left_id	:= Left_id
		,	@Right_id	:= Right_id
		,	@Level_id	:= Level_id
		,	@Order_id	:= Order_id
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= 'R'	-- This Table Is Restricted and Does Not Allow A Cascade From an FK Table.
		);
	END IF;
	#######################################################################
	-- Insert values
	#######################################################################
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedEvent
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
	INSERT
	INTO	tblResource
	(
		Resrc_tp
	,	Resrc_tx
	,	ADD_dm
	,	ADD_nm
	,	UPD_dm
	,	UPD_nm
	,	DEL_dm
	,	DEL_nm
	)
	VALUES
	(
		Resrc_tp
	,	Resrc_tx
	,	ADD_dm
	,	ADD_nm
	,	UPD_dm
	,	UPD_nm
	,	DEL_dm
	,	DEL_nm
	);
	SET Resrc_id	= LAST_INSERT_ID();
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
	-- Return the Primary Key to the front-end if this procedure
	-- was not called from another API stored procedure.
	#######################################################################
 	IF
 		CallingProc_nm	IS NULL OR CallingProc_nm = ''
 	THEN
		SELECT
			Resrc_id
		,	Resrc_tp
 		;
 	END IF;
	#######################################################################
END ISP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `ispResourceType` */

/*!50003 DROP PROCEDURE IF EXISTS  `ispResourceType` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `ispResourceType`(
	Resrc_tp		VARCHAR(80)		-- PK1 AK1
,	ParentResrc_tp		VARCHAR(80)	
,	ResrcType_tx		MEDIUMTEXT	
,	Left_id		INT SIGNED	
,	Right_id		INT SIGNED	
,	Level_id		INT SIGNED	
,	Order_id		INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd	VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		ispResourceType
**	Type:		DB API procedure: Insert
**	Purpose:	To insert ResourceType data into tblResourceType
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	4/9/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResourceType';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'INSERT';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'ispResourceType';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
ISP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	IF ParentResrc_tp IS NULL OR ParentResrc_tp = '' THEN SET ParentResrc_tp = 'RESOURCE';	END IF;
	IF Left_id IS NULL OR Left_id = 0 THEN SET Left_id =  -1;	END IF;
	IF Right_id IS NULL OR Right_id = 0 THEN SET Right_id =  -1;	END IF;
	IF Level_id IS NULL OR Level_id = 0 THEN SET Level_id =  -1;	END IF;
	IF Order_id IS NULL OR Order_id = 0 THEN SET Order_id =  -1;	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
	CALL	rspResourceType
	(
		@Resrc_tp	:= Resrc_tp
	,	@ParentResrc_tp	:= ParentResrc_tp
	,	@ResrcType_tx	:= ResrcType_tx
	,	@Left_id	:= Left_id
	,	@Right_id	:= Right_id
	,	@Level_id	:= Level_id
	,	@Order_id	:= Order_id
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 1	-- If PK exists then return without error
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				Resrc_tp
			;
		END IF;
		LEAVE ISP;
	END IF;
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################
	SELECT
		tvwResourceType.Resrc_tp
	INTO
		Resrc_tp
	FROM
		tvwResourceType
	WHERE
		tvwResourceType.Resrc_tp	= Resrc_tp
	;
	IF
		FOUND_ROWS()	> 0
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				Resrc_tp
			;
		END IF;
		LEAVE ISP;
	END IF;
	#######################################################################
	-- Validate attributes
	#######################################################################
	CALL	vspResourceType
	(
		@Resrc_tp	:= Resrc_tp
	,	@ParentResrc_tp	:= ParentResrc_tp
	,	@ResrcType_tx	:= ResrcType_tx
	,	@Left_id	:= Left_id
	,	@Right_id	:= Right_id
	,	@Level_id	:= Level_id
	,	@Order_id	:= Order_id
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= 'vspResourceType'
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET	@FK1	= CONCAT(ParentResrc_tp);
	-- --------------------------------------------------------------------
	--
	--	RESTRICT MODE:	tblResourceType
	--
	IF
		Mode_cd	= 'R'
	THEN
		CALL	rspResourceType
		(
			@Resrc_tp	:= ParentResrc_tp
		,	@ParentResrc_tp	:= ParentResrc_tp
		,	@ResrcType_tx	:= ResrcType_tx
		,	@Left_id	:= Left_id
		,	@Right_id	:= Right_id
		,	@Level_id	:= Level_id
		,	@Order_id	:= Order_id
		,	@Key_cd		:= @Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblResourceType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= SYSTABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= SYSTABLE
			);
			LEAVE	ISP;
		END IF;
	END IF;
	--
	--	CASCADE MODE:	tblResourceType
	--
	IF
	(
		Mode_cd	= 'C'
	AND	ParentResrc_tp	IS NOT NULL
	)
	THEN
		CALL	rspResourceType
		(
			@Resrc_tp	:= ParentResrc_tp
		,	@ParentResrc_tp	:= ParentResrc_tp
		,	@ResrcType_tx	:= ResrcType_tx
		,	@Left_id	:= Left_id
		,	@Right_id	:= Right_id
		,	@Level_id	:= Level_id
		,	@Order_id	:= Order_id
		,	@Key_cd		:= @Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblResourceType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= SYSTABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= SYSTABLE
			);
			LEAVE	ISP;
		END IF;
	END IF;
	#######################################################################
	-- Insert values
	#######################################################################
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedEvent
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
	INSERT
	INTO	tblResourceType
	(
		Resrc_tp
	,	ParentResrc_tp
	,	ResrcType_tx
	,	Left_id
	,	Right_id
	,	Level_id
	,	Order_id
	)
	VALUES
	(
		Resrc_tp
	,	ParentResrc_tp
	,	ResrcType_tx
	,	Left_id
	,	Right_id
	,	Level_id
	,	Order_id
	);
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
	-- Return the Primary Key to the front-end if this procedure
	-- was not called from another API stored procedure.
	#######################################################################
 	IF
 		CallingProc_nm	IS NULL OR CallingProc_nm = ''
 	THEN
		SELECT
			@Resrc_tp	AS Resrc_tp
 		;
 	END IF;
	#######################################################################
END ISP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `ispResource_Company` */

/*!50003 DROP PROCEDURE IF EXISTS  `ispResource_Company` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ispResource_Company`(
INOUT	Resrc_id	INT SIGNED		-- PK1 
,	Resrc_tp	VARCHAR(64)		-- PK2 AK1
,INOUT	Company_id	INT SIGNED		-- PK1 
,	Company_tp	VARCHAR(64)		-- PK2 AK1
,	Resrc_nm	VARCHAR(256)		--  AK2
,	Resrc_cd	VARCHAR(128)	
,	Alias_nm	VARCHAR(256)
,	Company_nm	VARCHAR(256)
,	Company_cd	VARCHAR(128)	
,	Resrc_tx	MEDIUMTEXT	
,	Company_tx	MEDIUMTEXT	
,	ADD_dm		DATETIME	
,	ADD_nm		VARCHAR(128)	
,	UPD_dm		DATETIME	
,	UPD_nm		VARCHAR(128)	
,	DEL_dm		DATETIME	
,	DEL_nm		VARCHAR(128)	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		ispResource_Company
**	Type:		DB API procedure: Insert
**	Purpose:	To insert Resource data into tblResource_Company
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	4/12/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResource_Company';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'INSERT';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'ispResource_Company';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
DECLARE	FK1		VARCHAR(255) DEFAULT CONCAT(Resrc_tp,",",Company_tp);
DECLARE	FK2		VARCHAR(255) DEFAULT CONCAT(Resrc_id,",",Resrc_tp);
DECLARE	FK3		VARCHAR(255) DEFAULT CONCAT(Company_id,",",Company_tp);
DECLARE	AK1		VARCHAR(255) DEFAULT CONCAT(Resrc_tp,",",Company_id,",",Company_tp,",",Resrc_nm);
DECLARE	AK2		VARCHAR(255) DEFAULT CONCAT(Resrc_tp,",",Company_tp,",",Company_nm,",",Resrc_nm);
###############################################################################
ISP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF CallingProc_nm IS NULL OR CallingProc_nm = '' THEN SET CallingProc_nm = '';	END IF;
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	IF Resrc_id = '0' OR Resrc_id = 0 THEN SET Resrc_id =  NULL;	END IF;
	IF Resrc_tp IS NULL OR Resrc_tp = '' THEN SET Resrc_tp = NULL;	END IF;
	IF Company_id = '0' OR Company_id = 0 THEN SET Company_id =  NULL;	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = NULL;	END IF;
	IF Resrc_nm IS NULL OR Resrc_nm = '' THEN SET Resrc_nm = NULL;	END IF;
	IF Resrc_cd IS NULL OR Resrc_cd = '' THEN SET Resrc_cd = NULL;	END IF;
	IF Alias_nm IS NULL OR Alias_nm = '' THEN SET Alias_nm = NULL;	END IF;
	IF Company_nm IS NULL OR Company_nm = '' THEN SET Company_nm = NULL;	END IF;
	IF Company_cd IS NULL OR Company_cd = '' THEN SET Company_cd = NULL;	END IF;
	IF Resrc_tx IS NULL OR Resrc_tx = '' THEN SET Resrc_tx = NULL;	END IF;
	IF Company_tx IS NULL OR Company_tx = '' THEN SET Company_tx = NULL;	END IF;
-- 	IF ADD_dm IS NULL THEN SET ADD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
 	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = NULL;	END IF;
-- 	IF UPD_dm IS NULL THEN SET UPD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
 	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = NULL;	END IF;
-- 	IF DEL_dm IS NULL THEN SET DEL_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
 	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = NULL;	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= 'tblResource_Company'
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
	CALL	rspResource_Company
	(
		@Resrc_id	:= Resrc_id
	,	@Resrc_tp	:= Resrc_tp
	,	@Company_id	:= Company_id
	,	@Company_tp	:= Company_tp
	,	@Resrc_nm	:= Resrc_nm
	,	@Resrc_cd	:= Resrc_cd
	,	@Alias_nm	:= Alias_nm
	,	@ADD_dm	:= ADD_dm
	,	@ADD_nm	:= ADD_nm
	,	@UPD_dm	:= UPD_dm
	,	@UPD_nm	:= UPD_nm
	,	@DEL_dm	:= DEL_dm
	,	@DEL_nm	:= DEL_nm
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 1	-- If PK exists then return without error
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				Resrc_id
			,	Resrc_tp
			,	Company_id
			,	Company_tp
			,	Resrc_nm
			,	Company_nm
			;
		END IF;
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################
	SELECT
		tvwResource_Company.Resrc_id
	,	tvwResource_Company.Resrc_tp
	,	tvwResource_Company.Company_id
	,	tvwResource_Company.Company_tp
	,	tvwResource_Company.Company_nm
	INTO
		Resrc_id
	,	Resrc_tp
	,	Company_id
	,	Company_tp
	,	Company_nm
	FROM
		tvwResource_Company
	WHERE	1=1
	AND	tvwResource_Company.Resrc_tp	= Resrc_tp
	AND	tvwResource_Company.Company_id	= Company_id
	AND	tvwResource_Company.Company_tp	= Company_tp
	AND	tvwResource_Company.Resrc_nm	= Resrc_nm
	;
	IF
		FOUND_ROWS()	> 0
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				Resrc_id
			,	Resrc_tp
			,	Company_id
			,	Company_tp
			,	Resrc_nm
			,	Company_nm
			;
		END IF;
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Validate attributes
	#######################################################################
	SET 	@ADD_dm	= ADD_dm;
	SET 	@ADD_nm	= ADD_nm;
	SET 	@UPD_dm	= UPD_dm;
	SET 	@UPD_nm	= UPD_nm;
	SET 	@DEL_dm	= DEL_dm;
	SET 	@DEL_nm	= DEL_nm;
	CALL	vspResource_Company
	(
		@Resrc_id	:= Resrc_id
	,	@Resrc_tp	:= Resrc_tp
	,	@Company_id	:= Company_id
	,	@Company_tp	:= Company_tp
	,	@Resrc_nm	:= Resrc_nm
	,	@Resrc_cd	:= Resrc_cd
	,	@Alias_nm	:= Alias_nm	
	,	@ADD_dm
	,	@ADD_nm
	,	@UPD_dm
	,	@UPD_nm
	,	@DEL_dm
	,	@DEL_nm
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= 'vspResource_Company'
		);
		LEAVE	ISP;
	END IF;
	SET 	ADD_dm	= @ADD_dm;
	SET 	ADD_nm	= @ADD_nm;
	SET 	UPD_dm	= @UPD_dm;
	SET 	UPD_nm	= @UPD_nm;
	SET 	DEL_dm	= @DEL_dm;
	SET 	DEL_nm	= @DEL_nm;
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET	@FK1	= CONCAT(Resrc_tp,",",Company_tp);
	SET	@FK2	= CONCAT(IFNULL(Resrc_id,"(null)"),",",Resrc_tp);
	SET 	@FK3	= CONCAT(IFNULL(Company_id,"(null)"),",",Company_tp);
	--
	--	RESTRICT MODE:
	--
	IF
		Mode_cd	= 'R'
	THEN
		SET 	@TABLE	= "tblResourceType_CompanyType";
		CALL	rspResourceType_CompanyType
		(
			@Resrc_tp	:= Resrc_tp
		,	@Company_tp	:= Company_tp
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	ISP;
		END IF;
		SET 	@TABLE	= "tblCompany";
		CALL	rspCompany
		(
			@Company_id	:= Company_id
		,	@Company_tp	:= Company_tp
		,	@Company_nm	:= Company_nm
		,	@Company_cd	:= Company_cd
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK3
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	ISP;
		END IF;
		SET 	@TABLE	= "tblResource";
		CALL	rspResource
		(
			@Resrc_id	:= Resrc_id
		,	@Resrc_tp	:= Resrc_tp
		,	@Resrc_tx	:= Resrc_tx
		,	@ADD_dm	:= ADD_dm
		,	@ADD_nm	:= ADD_nm
		,	@UPD_dm	:= UPD_dm
		,	@UPD_nm	:= UPD_nm
		,	@DEL_dm	:= DEL_dm
		,	@DEL_nm	:= DEL_nm
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK2
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	ISP;
		END IF;
	END IF;
	--
	--	CASCADE MODE:
	--
	IF
		Mode_cd	= 'C'
	THEN
		--	-------------------------------------------------------
		SET 	@TABLE	= "tblCompany";
		SET	@Company_id	= Company_id;
		CALL	ispCompany
		(
			@Company_id
		,	@Company_tp		:= Company_tp
		,	@Company_nm		:= Company_nm
		,	@Company_cd		:= Company_cd
		,	@Company_tx		:= Company_tx
		,	@CompanyADD_dm		:= NULL
		,	@CompanyADD_nm		:= NULL
		,	@CompanyUPD_dm		:= NULL
		,	@CompanyUPD_nm		:= NULL
		,	@CompanyDEL_dm		:= NULL
		,	@CompanyDEL_nm		:= NULL
		,	@ParentCompany_tp	:= NULL
		,	@CompanyType_tx		:= NULL
		,	@CompanyLeft_id		:= NULL
		,	@CompanyRight_id	:= NULL
		,	@CompanyLevel_id	:= NULL
		,	@CompanyOrder_id	:= NULL
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		);
		--	Set the proc IN parameters to the parent ISP INOUT parameters
		SET	Company_id	= @Company_id;
		--	-------------------------------------------------------
		SET 	@TABLE	= "tblResource";
		SET	@Resrc_id	= Resrc_id;
		CALL	ispResource
		(
			@Resrc_id
		,	@Resrc_tp	:= Resrc_tp
		,	@Resrc_tx	:= Resrc_tx
		,	@ADD_dm		:= ADD_dm
		,	@ADD_nm		:= ADD_nm
		,	@UPD_dm		:= UPD_dm
		,	@UPD_nm		:= UPD_nm
		,	@DEL_dm		:= DEL_dm
		,	@DEL_nm		:= DEL_nm
		,	@ParentResrc_tp	:= NULL
		,	@ResrcType_tx	:= NULL
		,	@Left_id	:= NULL
		,	@Right_id	:= NULL
		,	@Level_id	:= NULL
		,	@Order_id	:= NULL
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		);
		--	Set the proc IN parameters to the parent ISP INOUT parameters
		SET	Resrc_id	= @Resrc_id;
		--	-------------------------------------------------------
		--	-------------------------------------------------------
	END IF;
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################
	SELECT
		tvwResource_Company.Resrc_id
	,	tvwResource_Company.Resrc_tp
	,	tvwResource_Company.Company_id
	,	tvwResource_Company.Company_tp
	,	tvwResource_Company.Company_nm
	INTO
		Resrc_id
	,	Resrc_tp
	,	Company_id
	,	Company_tp
	,	Company_nm
	FROM
		tvwResource_Company
	WHERE	1=1
	AND	tvwResource_Company.Resrc_tp	= Resrc_tp
	AND	tvwResource_Company.Company_id	= Company_id
	AND	tvwResource_Company.Company_tp	= Company_tp
	AND	tvwResource_Company.Resrc_nm	= Resrc_nm
	;
	IF
		FOUND_ROWS()	> 0
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				Resrc_id
			,	Resrc_tp
			,	Company_id
			,	Company_tp
			,	Resrc_nm
			,	Company_nm
			;
		END IF;
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Insert values
	#######################################################################
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedEvent
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
	INSERT
	INTO	tblResource_Company
	(
		Resrc_id
	,	Resrc_tp
	,	Company_id
	,	Company_tp
	,	Resrc_nm
	,	Resrc_cd
	,	Alias_nm
	,	ADD_dm
	,	ADD_nm
	,	UPD_dm
	,	UPD_nm
	,	DEL_dm
	,	DEL_nm
	)
	VALUES
	(
		Resrc_id
	,	Resrc_tp
	,	Company_id
	,	Company_tp
	,	Resrc_nm
	,	Resrc_cd
	,	Alias_nm
	,	ADD_dm
	,	ADD_nm
	,	UPD_dm
	,	UPD_nm
	,	DEL_dm
	,	DEL_nm
	);
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
	-- Return the Primary Key to the front-end if this procedure
	-- was not called from another API stored procedure.
	#######################################################################
 	IF
 		CallingProc_nm	IS NULL OR CallingProc_nm = ''
 	THEN
		SELECT
			Resrc_id
		,	Resrc_tp
		,	Company_id
		,	Company_tp
		,	Resrc_nm
		,	Company_nm
		;
 	END IF;
	#######################################################################
END ISP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `ispResource_Contact` */

/*!50003 DROP PROCEDURE IF EXISTS  `ispResource_Contact` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ispResource_Contact`(
INOUT	Resrc_id	INT SIGNED		-- PK1 
,	Resrc_tp	VARCHAR(64)		-- PK2 AK1
,INOUT	Contact_id	INT SIGNED		-- PK1 
,	Contact_tp	VARCHAR(64)		-- PK2 AK1
,	Contact_nm	VARCHAR(256)		--  AK2
,	Contact_cd	VARCHAR(128)	
,	Alias_nm	VARCHAR(256)
,	Address_nm	VARCHAR(256)
,	City_cd		VARCHAR(128)
,	State_cd	VARCHAR(128)
,	Zip_cd		VARCHAR(128)
,	Phone_cd	VARCHAR(128)
,	GPS_cd		VARCHAR(128)
,	Resrc_tx	MEDIUMTEXT	
,	Contact_tx	MEDIUMTEXT	
,	ADD_dm		DATETIME	
,	ADD_nm		VARCHAR(128)	
,	UPD_dm		DATETIME	
,	UPD_nm		VARCHAR(128)	
,	DEL_dm		DATETIME	
,	DEL_nm		VARCHAR(128)	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		ispResource_Contact
**	Type:		DB API procedure: Insert
**	Purpose:	To insert Resource data into tblResource_Contact
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	4/12/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResource_Contact';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'INSERT';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'ispResource_Contact';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
ISP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF CallingProc_nm IS NULL OR CallingProc_nm = '' THEN SET CallingProc_nm = '';	END IF;
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	IF Resrc_id = '0' OR Resrc_id = 0 THEN SET Resrc_id =  NULL;	END IF;
	IF Resrc_tp IS NULL OR Resrc_tp = '' THEN SET Resrc_tp = NULL;	END IF;
	IF Contact_id = '0' OR Contact_id = 0 THEN SET Contact_id =  NULL;	END IF;
	IF Contact_tp IS NULL OR Contact_tp = '' THEN SET Contact_tp = NULL;	END IF;
	IF Contact_nm IS NULL OR Contact_nm = '' THEN SET Contact_nm = NULL;	END IF;
	IF Contact_cd IS NULL OR Contact_cd = '' THEN SET Contact_cd = NULL;	END IF;
	IF Alias_nm IS NULL OR Alias_nm = '' THEN SET Alias_nm = NULL;	END IF;
	IF Address_nm IS NULL OR Address_nm = '' THEN SET Address_nm = null;	END IF;
	IF City_cd IS NULL OR City_cd = '' THEN SET City_cd = NULL;	END IF;
	IF State_cd IS NULL OR State_cd = '' THEN SET State_cd = NULL;	END IF;
	IF ZIP_cd IS NULL OR ZIP_cd = '' THEN SET ZIP_cd = NULL;	END IF;
	IF Phone_cd IS NULL OR Phone_cd = '' THEN SET Phone_cd = NULL;	END IF;
	IF GPS_cd IS NULL OR GPS_cd = '' THEN SET GPS_cd = NULL;	END IF;
	IF Resrc_tx IS NULL OR Resrc_tx = '' THEN SET Resrc_tx = NULL;	END IF;
	IF Contact_tx IS NULL OR Contact_tx = '' THEN SET Contact_tx = NULL;	END IF;
-- 	IF ADD_dm IS NULL THEN SET ADD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
 	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = NULL;	END IF;
-- 	IF UPD_dm IS NULL THEN SET UPD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
 	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = NULL;	END IF;
-- 	IF DEL_dm IS NULL THEN SET DEL_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
 	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = NULL;	END IF;
	SET	@PK1	= CONCAT(IFNULL(Resrc_id,"(null)"),",",Resrc_tp,",",IFNULL(Contact_id,"(null)"),",",Contact_tp);
	SET	@FK1	= CONCAT(Resrc_tp);
	SET	@FK2	= CONCAT(Contact_tp);
	SET	@FK3	= CONCAT(IFNULL(Resrc_id,"(null)"),",",Resrc_tp);
	SET	@FK4	= CONCAT(IFNULL(Contact_id,"(null)"),",",Contact_tp);
	SET	@AK1	= CONCAT(IFNULL(Resrc_id,"(null)"),",",Resrc_tp,",",Contact_tp);
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= 'tblResource_Contact'
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
	CALL	rspResource_Contact
	(
		@Resrc_id	:= Resrc_id
	,	@Resrc_tp	:= Resrc_tp
	,	@Contact_id	:= Contact_id
	,	@Contact_tp	:= Contact_tp
	,	@Contact_nm	:= Contact_nm
	,	@Contact_cd	:= Contact_cd
	,	@Alias_nm	:= Alias_nm
	,	@Address_nm	:= Address_nm
	,	@City_cd	:= City_cd
	,	@State_cd	:= State_cd
	,	@Zip_cd		:= Zip_cd
	,	@Phone_cd	:= Phone_cd
	,	@GPS_cd		:= GPS_cd
	,	@ADD_dm	:= ADD_dm
	,	@ADD_nm	:= ADD_nm
	,	@UPD_dm	:= UPD_dm
	,	@UPD_nm	:= UPD_nm
	,	@DEL_dm	:= DEL_dm
	,	@DEL_nm	:= DEL_nm
	,	@Key_cd	:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 1	-- If PK exists then return without error
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				Resrc_id
			,	Resrc_tp
			,	Contact_id
			,	Contact_tp
			,	Contact_nm
			;
		END IF;
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################
	SELECT
		tvwResource_Contact.Resrc_id
	,	tvwResource_Contact.Resrc_tp
	,	tvwResource_Contact.Contact_id
	,	tvwResource_Contact.Contact_tp
	,	tvwResource_Contact.Contact_nm
	INTO
		Resrc_id
	,	Resrc_tp
	,	Contact_id
	,	Contact_tp
	,	Contact_nm
	FROM
		tvwResource_Contact
	WHERE	1=1
	AND	tvwResource_Contact.Resrc_id	= Resrc_id
	AND	tvwResource_Contact.Resrc_tp	= Resrc_tp
	AND	tvwResource_Contact.Contact_tp	= Contact_tp
	;
	IF
		FOUND_ROWS()	> 0
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				Resrc_id
			,	Resrc_tp
			,	Contact_id
			,	Contact_tp
			,	Contact_nm
			;
		END IF;
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Validate attributes
	#######################################################################
	SET 	@ADD_dm	= ADD_dm;
	SET 	@ADD_nm	= ADD_nm;
	SET 	@UPD_dm	= UPD_dm;
	SET 	@UPD_nm	= UPD_nm;
	SET 	@DEL_dm	= DEL_dm;
	SET 	@DEL_nm	= DEL_nm;
	CALL	vspResource_Contact
	(
		@Resrc_id	:= Resrc_id
	,	@Resrc_tp	:= Resrc_tp
	,	@Contact_id	:= Contact_id
	,	@Contact_tp	:= Contact_tp
	,	@Contact_nm	:= Contact_nm
	,	@Contact_cd	:= Contact_cd
	,	@Alias_nm	:= Alias_nm	
	,	@Address_nm	:= Address_nm
	,	@City_cd	:= City_cd
	,	@State_cd	:= State_cd
	,	@Zip_cd		:= Zip_cd
	,	@Phone_cd	:= Phone_cd
	,	@GPS_cd		:= GPS_cd
	,	@ADD_dm
	,	@ADD_nm
	,	@UPD_dm
	,	@UPD_nm
	,	@DEL_dm
	,	@DEL_nm
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= 'vspResource_Contact'
		);
		LEAVE	ISP;
	END IF;
	SET 	ADD_dm	= @ADD_dm;
	SET 	ADD_nm	= @ADD_nm;
	SET 	UPD_dm	= @UPD_dm;
	SET 	UPD_nm	= @UPD_nm;
	SET 	DEL_dm	= @DEL_dm;
	SET 	DEL_nm	= @DEL_nm;
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET	@FK1	= CONCAT(Resrc_tp);
	SET	@FK2	= CONCAT(Contact_tp);
	SET	@FK3	= CONCAT(IFNULL(Resrc_id,"(null)"),",",Resrc_tp);
	SET	@FK4	= CONCAT(IFNULL(Contact_id,"(null)"),",",Contact_tp);
	SET	@AK1	= CONCAT(IFNULL(Resrc_id,"(null)"),",",Resrc_tp,",",Contact_tp);
	--
	--	RESTRICT MODE:
	--
	IF
		Mode_cd	= 'R'
	THEN
		SET 	@TABLE	= "tblResourceType";
		CALL	rspResourceType
		(
			@Resrc_tp	:= Resrc_tp
		,	@ParentResrc_tp	:= NULL
		,	@ResrcType_tx	:= NULL
		,	@Left_id	:= NULL
		,	@Right_id	:= NULL
		,	@Level_id	:= NULL
		,	@Order_id	:= NULL
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	ISP;
		END IF;
		SET 	@TABLE	= "tblContactType";
		CALL	rspContactType
		(
			@Contact_tp	:= Contact_tp
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK2
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	ISP;
		END IF;
		SET 	@TABLE	= "tblResource";	-- Contact
		CALL	rspResource
		(
			@Resrc_id	:= Contact_id
		,	@Resrc_tp	:= Contact_tp
		,	@Resrc_tx	:= Contact_tx
		,	@ADD_dm	:= ADD_dm
		,	@ADD_nm	:= ADD_nm
		,	@UPD_dm	:= UPD_dm
		,	@UPD_nm	:= UPD_nm
		,	@DEL_dm	:= DEL_dm
		,	@DEL_nm	:= DEL_nm
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK4
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	ISP;
		END IF;
		SET 	@TABLE	= "tblResource";	-- Resource
		CALL	rspResource
		(
			@Resrc_id	:= Resrc_id
		,	@Resrc_tp	:= Resrc_tp
		,	@Resrc_tx	:= Resrc_tx
		,	@ADD_dm	:= ADD_dm
		,	@ADD_nm	:= ADD_nm
		,	@UPD_dm	:= UPD_dm
		,	@UPD_nm	:= UPD_nm
		,	@DEL_dm	:= DEL_dm
		,	@DEL_nm	:= DEL_nm
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK3
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	ISP;
		END IF;
	END IF;
	--
	--	CASCADE MODE:
	--
	IF
		Mode_cd	= 'C'
	THEN
		--	-------------------------------------------------------
		SET 	@TABLE	= "tblResource";	-- Contact
		SET	@Resrc_id	= Contact_id;
		CALL	ispResource
		(
			@Resrc_id
		,	@Resrc_tp	:= Contact_tp
		,	@Resrc_tx	:= Contact_tx
		,	@ADD_dm		:= ADD_dm
		,	@ADD_nm		:= ADD_nm
		,	@UPD_dm		:= UPD_dm
		,	@UPD_nm		:= UPD_nm
		,	@DEL_dm		:= DEL_dm
		,	@DEL_nm		:= DEL_nm
		,	@ParentResrc_tp	:= NULL
		,	@ResrcType_tx	:= NULL
		,	@Left_id	:= NULL
		,	@Right_id	:= NULL
		,	@Level_id	:= NULL
		,	@Order_id	:= NULL
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		);
		--	Set the proc IN parameters to the parent ISP INOUT parameters
		SET	Contact_id	= @Resrc_id;
		--	-------------------------------------------------------
		SET 	@TABLE	= "tblResource";
		SET	@Resrc_id	= Resrc_id;
		CALL	ispResource
		(
			@Resrc_id
		,	@Resrc_tp	:= Resrc_tp
		,	@Resrc_tx	:= Resrc_tx
		,	@ADD_dm		:= ADD_dm
		,	@ADD_nm		:= ADD_nm
		,	@UPD_dm		:= UPD_dm
		,	@UPD_nm		:= UPD_nm
		,	@DEL_dm		:= DEL_dm
		,	@DEL_nm		:= DEL_nm
		,	@ParentResrc_tp	:= NULL
		,	@ResrcType_tx	:= NULL
		,	@Left_id	:= NULL
		,	@Right_id	:= NULL
		,	@Level_id	:= NULL
		,	@Order_id	:= NULL
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		);
		--	Set the proc IN parameters to the parent ISP INOUT parameters
		SET	Resrc_id	= @Resrc_id;
		--	-------------------------------------------------------
		--	-------------------------------------------------------
	END IF;
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################
	SELECT
		tvwResource_Contact.Resrc_id
	,	tvwResource_Contact.Resrc_tp
	,	tvwResource_Contact.Contact_id
	,	tvwResource_Contact.Contact_tp
	,	tvwResource_Contact.Contact_nm
	INTO
		Resrc_id
	,	Resrc_tp
	,	Contact_id
	,	Contact_tp
	,	Contact_nm
	FROM
		tvwResource_Contact
	WHERE	1=1
	AND	tvwResource_Contact.Resrc_tp	= Resrc_tp
	AND	tvwResource_Contact.Contact_tp	= Contact_tp
	AND	tvwResource_Contact.Contact_nm	= Contact_nm
	;
	IF
		FOUND_ROWS()	> 0
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				Resrc_id
			,	Resrc_tp
			,	Contact_id
			,	Contact_tp
			,	Contact_nm
			;
		END IF;
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Insert values
	#######################################################################
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedEvent
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
	INSERT
	INTO	tblResource_Contact
	(
		Resrc_id
	,	Resrc_tp
	,	Contact_id
	,	Contact_tp
	,	Contact_nm
	,	Contact_cd
	,	Alias_nm
	,	Address_nm
	,	City_cd
	,	State_cd
	,	Zip_cd
	,	Phone_cd
	,	GPS_cd
	,	ADD_dm
	,	ADD_nm
	,	UPD_dm
	,	UPD_nm
	,	DEL_dm
	,	DEL_nm
	)
	VALUES
	(
		Resrc_id
	,	Resrc_tp
	,	Contact_id
	,	Contact_tp
	,	Contact_nm
	,	Contact_cd
	,	Alias_nm
	,	Address_nm
	,	City_cd
	,	State_cd
	,	Zip_cd
	,	Phone_cd
	,	GPS_cd
	,	ADD_dm
	,	ADD_nm
	,	UPD_dm
	,	UPD_nm
	,	DEL_dm
	,	DEL_nm
	);
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
	-- Return the Primary Key to the front-end if this procedure
	-- was not called from another API stored procedure.
	#######################################################################
 	IF
 		CallingProc_nm	IS NULL OR CallingProc_nm = ''
 	THEN
		SELECT
			Resrc_id
		,	Resrc_tp
		,	Contact_id
		,	Contact_tp
		,	Contact_nm
		;
 	END IF;
	#######################################################################
END ISP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `ispUser` */

/*!50003 DROP PROCEDURE IF EXISTS  `ispUser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ispUser`(
INOUT	User_id		INT SIGNED		-- PK1 
,	User_tp		VARCHAR(64)		-- PK2 AK1
,	User_nm		VARCHAR(256)		--  AK2
,	User_cd		VARCHAR(128)	
,	Hashed_cd	VARCHAR(128)
,	Person_nm	VARCHAR(256)
,	Email_nm	VARCHAR(256)
,	Challenge_cd	VARCHAR(128)
,	Response_cd	VARCHAR(128)
,	User_tx		MEDIUMTEXT	
,	UserADD_dm		DATETIME	
,	UserADD_nm		VARCHAR(256)	
,	UserUPD_dm		DATETIME	
,	UserUPD_nm		VARCHAR(256)	
,	UserDEL_dm		DATETIME	
,	UserDEL_nm		VARCHAR(256)	
,	ParentUser_tp		VARCHAR(64)	
,	UserType_tx		MEDIUMTEXT	
,	UserTypeLeft_id		INT SIGNED	
,	UserTypeRight_id		INT SIGNED	
,	UserTypeLevel_id		INT SIGNED	
,	UserTypeOrder_id		INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceUser	User name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		ispUser
**	Type:		DB API procedure: Insert
**	Purpose:	To insert User data into tblUser
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	6/14/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblUser';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'INSERT';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'ispUser';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
DECLARE	FK1		VARCHAR(255) DEFAULT CONCAT(User_tp);
DECLARE	FK2		VARCHAR(255) DEFAULT CONCAT(User_id,",",User_tp);
###############################################################################
ISP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	IF User_id = '0' OR User_id = 0 THEN SET User_id =  NULL;	END IF;
	IF User_tp IS NULL OR User_tp = '' THEN SET User_tp = NULL;	END IF;
	IF User_nm IS NULL OR User_nm = '' THEN SET User_nm = NULL;	END IF;
	IF User_cd IS NULL OR User_cd = '' THEN SET ProcFailed_fg = TRUE;
	ELSE
		SET @salt := LPAD(CONV(FLOOR(RAND() * 0x100000000), 10, 16), 8 ,'0');
		SET Hashed_cd = CONCAT(@salt, SHA(CONCAT(@salt, User_cd)));
	END IF;
	IF Email_nm IS NULL OR Email_nm = '' THEN SET ProcFailed_fg = TRUE;	END IF;
	IF Person_nm IS NULL OR Person_nm = '' THEN SET Person_nm = NULL;	END IF;
	IF Challenge_cd IS NULL OR Challenge_cd = '' THEN SET Challenge_cd = NULL;	END IF;
	IF Response_cd IS NULL OR Response_cd = '' THEN SET Response_cd = NULL;	END IF;
	IF User_tx IS NULL OR User_tx = '' THEN SET User_tx = NULL;	END IF;
	IF UserADD_nm IS NULL OR UserADD_nm = '' THEN SET UserADD_nm = NULL;	END IF;
	IF UserUPD_nm IS NULL OR UserUPD_nm = '' THEN SET UserUPD_nm = NULL;	END IF;
	IF UserDEL_nm IS NULL OR UserDEL_nm = '' THEN SET UserDEL_nm = NULL;	END IF;
	IF ParentUser_tp IS NULL OR ParentUser_tp = '' THEN SET ParentUser_tp = NULL;	END IF;
	IF UserType_tx IS NULL OR UserType_tx = '' THEN SET UserType_tx = NULL;	END IF;
	IF UserTypeLeft_id = '0' OR UserTypeLeft_id = 0 THEN SET UserTypeLeft_id = NULL;	END IF;
	IF UserTypeRight_id = '0' OR UserTypeRight_id = 0 THEN SET UserTypeRight_id = NULL;	END IF;
	IF UserTypeLevel_id = '0' OR UserTypeLevel_id = 0 THEN SET UserTypeLevel_id = NULL;	END IF;
	IF UserTypeOrder_id = '0' OR UserTypeOrder_id = 0 THEN SET UserTypeOrder_id = NULL;	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
	CALL	rspUser
	(
		@User_id	:= User_id
	,	@User_tp	:= User_tp
	,	@User_nm	:= User_nm
	,	@User_cd	:= User_cd
	,	@Hashed_cd	:= Hashed_cd
	,	@Person_nm	:= Person_nm
	,	@Email_nm	:= Email_nm
	,	@Challenge_cd	:= Challenge_cd
	,	@Response_cd	:= Response_cd
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 1	-- If PK exists then return without error
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				User_id
			,	User_tp
			,	User_nm
			;
		END IF;
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################
	SELECT
		tvwUser.User_id
	,	tvwUser.User_tp
	INTO
		User_id
	,	User_tp
	FROM
		tvwUser
	WHERE
		tvwUser.User_tp	= User_tp
	AND	tvwUser.User_nm	= User_nm
	;
	IF
		FOUND_ROWS()	> 0
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				User_id
			,	User_tp
			,	User_nm
			;
		END IF;
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Validate attributes
	#######################################################################
	CALL	vspUser
	(
		@User_id	:= User_id
	,	@User_tp	:= User_tp
	,	@User_nm	:= User_nm
	,	@User_cd	:= User_cd
	,	@Hashed_cd	:= Hashed_cd
	,	@Person_nm	:= Person_nm
	,	@Email_nm	:= Email_nm
	,	@Challenge_cd	:= Challenge_cd
	,	@Response_cd	:= Response_cd
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= Proc_nm
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET	@FK1	= CONCAT(User_tp);
	SET	@FK2	= CONCAT(IFNULL(User_id,"(null)"),",",User_tp);
	-- --------------------------------------------------------------------
	--
	--	RESTRICT MODE:
	--
	IF
		Mode_cd	= 'R'
	THEN
		SET 	@TABLE	= "tblUserType";
		CALL	rspUserType
		(
			@User_tp	:= User_tp
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblUserType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	ISP;
		END IF;
		SET 	@TABLE	= "tblResource";
		CALL	rspResource
		(
			@Resrc_id	:= User_id
		,	@Resrc_tp	:= User_tp
		,	@Resrc_tx	:= User_tx
		,	@ADD_dm		:= UserADD_dm
		,	@ADD_nm		:= UserADD_nm
		,	@UPD_dm		:= UserUPD_dm
		,	@UPD_nm		:= UserUPD_nm
		,	@DEL_dm		:= UserDEL_dm
		,	@DEL_nm		:= UserDEL_nm
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblUserType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK2
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	ISP;
		END IF;
	END IF;
	-- --------------------------------------------------------------------
	-- --------------------------------------------------------------------
	--
	--	CASCADE MODE:
	--
	IF
		Mode_cd	= 'C'
	THEN
		SET 	@TABLE	= "tblUserType";
		CALL	ispUserType
		(
			@User_tp		:= User_tp
		,	@ParentUser_tp	:= ParentUser_tp
		,	@UserType_tx		:= UserType_tx
		,	@UserTypeLeft_id	:= UserTypeLeft_id
		,	@UserTypeRight_id	:= UserTypeRight_id
		,	@UserTypeLevel_id	:= UserTypeLevel_id
		,	@UserTypeOrder_id	:= UserTypeOrder_id
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= 'R'	-- This Table Is Restricted and Does Not Allow A Cascade From an FK Table.
		);
		SET 	@TABLE	= "tblResource";
		SET	@Resrc_id	= User_id;
		CALL	ispResource
		(
			@Resrc_id
		,	@Resrc_tp	:= User_tp
		,	@Resrc_tx	:= User_tx
		,	@ADD_dm		:= UserADD_dm
		,	@ADD_nm		:= UserADD_nm
		,	@UPD_dm		:= UserUPD_dm
		,	@UPD_nm		:= UserUPD_nm
		,	@DEL_dm		:= UserDEL_dm
		,	@DEL_nm		:= UserDEL_nm
		,	@ParentResrc_tp	:= ParentUser_tp
		,	@ResrcType_tx	:= UserType_tx
		,	@Left_id	:= UserTypeLeft_id
		,	@Right_id	:= UserTypeRight_id
		,	@Level_id	:= UserTypeLevel_id
		,	@Order_id	:= UserTypeOrder_id
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		);
		--	Set the proc IN parameters to the parent ISP INOUT parameters
		SET	User_id	= @Resrc_id;
	END IF;
	#######################################################################
	-- Insert values
	#######################################################################
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedEvent
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
	INSERT
	INTO	tblUser
	(
		User_id
	,	User_tp
	,	User_nm
	,	User_cd
	,	Hashed_cd
	,	Person_nm
	,	Email_nm
	,	Challenge_cd
	,	Response_cd
	)
	VALUES
	(
		User_id
	,	User_tp
	,	User_nm
	,	User_cd
	,	Hashed_cd
	,	Person_nm
	,	Email_nm
	,	Challenge_cd
	,	Response_cd
	);
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
	-- Return the Primary Key to the front-end if this procedure
	-- was not called from another API stored procedure.
	#######################################################################
 	IF
 		CallingProc_nm	IS NULL OR CallingProc_nm = ''
 	THEN
		SELECT
			User_id
		,	User_tp
		,	User_nm
 		;
 	END IF;
	#######################################################################
END ISP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `ispUserType` */

/*!50003 DROP PROCEDURE IF EXISTS  `ispUserType` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `ispUserType`(
	User_tp		VARCHAR(64)		-- PK1 
,	ParentUser_tp		VARCHAR(64)	
,	UserType_tx		MEDIUMTEXT	
,	UserTypeLeft_id		INT SIGNED	
,	UserTypeRight_id		INT SIGNED	
,	UserTypeLevel_id		INT SIGNED	
,	UserTypeOrder_id		INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceUser	User name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		ispUserType
**	Type:		DB API procedure: Insert
**	Purpose:	To insert UserType data into tblUserType
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	6/14/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblUserType';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'INSERT';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'ispUserType';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
DECLARE	FK1		VARCHAR(255) DEFAULT CONCAT(User_tp);
###############################################################################
ISP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
	CALL	rspUserType
	(
		@User_tp	:= User_tp
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 1	-- If PK exists then return without error
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				User_tp
			;
		END IF;
		LEAVE	ISP;
	END IF;
	IF
		CallingProc_nm	= "ispUser"
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFKNotExist
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		,	@Key_nm		:= FK1
		);
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################
	#######################################################################
	-- Validate attributes
	#######################################################################
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	--
	--	RESTRICT MODE:	tblResourceType
	--
	IF
		@Mode_cd	= 'R'
	THEN
		CALL	rspResourceType
		(
			@Resrc_tp	:= User_tp
		,	@ParentResrc_tp	:= ParentUser_tp
		,	@ResrcType_tx	:= UserType_tx
		,	@Left_id	:= UserTypeLeft_id
		,	@Right_id	:= UserTypeRight_id
		,	@Level_id	:= UserTypeLevel_id
		,	@Order_id	:= UserTypeOrder_id
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblResourceType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= 'tblResourceType'
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= 'tblResourceType'
			);
			LEAVE	ISP;
		END IF;
	END IF;
	--
	--	CASCADE MODE:	tblResourceType
	--
	IF
		@Mode_cd	= 'C'
	THEN
		CALL	ispResourceType
		(
			@Resrc_tp	:= User_tp
		,	@ParentResrc_tp	:= ParentUser_tp
		,	@ResrcType_tx	:= UserType_tx
		,	@Left_id	:= UserTypeLeft_id
		,	@Right_id	:= UserTypeRight_id
		,	@Level_id	:= UserTypeLevel_id
		,	@Order_id	:= UserTypeOrder_id
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= 'R'	-- This Table Is Restricted and Does Not Allow A Cascade From an FK Table.
		);
	END IF;
	#######################################################################
	-- Insert values
	#######################################################################
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedUser
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
	INSERT
	INTO	tblUserType
	(
		User_tp
	)
	VALUES
	(
		User_tp
	);
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
	-- Return the Primary Key to the front-end if this procedure
	-- was not called from another API stored procedure.
	#######################################################################
 	IF
 		CallingProc_nm	IS NULL OR CallingProc_nm = ''
 	THEN
		SELECT
			@User_tp	AS User_tp
 		;
 	END IF;
	#######################################################################
END	ISP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `ispUser_Company` */

/*!50003 DROP PROCEDURE IF EXISTS  `ispUser_Company` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ispUser_Company`(
INOUT	User_id		INT SIGNED		-- PK1 
,	User_tp		VARCHAR(64)		-- PK2 AK1
,INOUT	Company_id	INT SIGNED		-- PK1 
,	Company_tp	VARCHAR(64)		-- PK2 AK1
,	User_nm		VARCHAR(256)		--  AK2
,	User_cd		VARCHAR(128)	
,	Alias_nm	VARCHAR(256)		--  AK2
,	Hashed_cd	VARCHAR(128)
,	Person_nm	VARCHAR(256)
,	Email_nm	VARCHAR(256)
,	Challenge_cd	VARCHAR(128)
,	Response_cd	VARCHAR(128)
,	Company_nm	VARCHAR(256)
,	Company_cd	VARCHAR(128)	
,	User_tx		MEDIUMTEXT	
,	Company_tx	MEDIUMTEXT	
,	ADD_dm		DATETIME	
,	ADD_nm		VARCHAR(128)	
,	UPD_dm		DATETIME	
,	UPD_nm		VARCHAR(128)	
,	DEL_dm		DATETIME	
,	DEL_nm		VARCHAR(128)	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		ispUser_Company
**	Type:		DB API procedure: Insert
**	Purpose:	To insert Resource data into tblResource_Company
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	4/12/2013
**	Modnumber:	00
**	Modification:	Original
**	NOTE: Special Case
	AK in parent tblUser = User_tp, User_nm 
	AK in tblResource_Company = Resrc_tp, Company_id, Company_tp, Resrc_nm
	AK for "User_Company" = User_tp(tblResource_Company.Resrc_tp), Company_tp, Company_nm, User_nm(tblResource_Company.Resrc_nm)
**
	A user type and user name exists once in tblUser and once in tblCompany
	A user type and user name exists once in tblUser but may exist once or more in tblResource_Conatct, tblResource_Project
	A user may belong to more than one Group which may belong to one or more Companies
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResource_Company';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'INSERT';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'ispUser_Company';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
DECLARE	FK1		VARCHAR(255) DEFAULT CONCAT(User_id,",",User_tp);
DECLARE	FK2		VARCHAR(255) DEFAULT CONCAT(User_id,",",User_tp,",",Company_id,",",Company_tp);
###############################################################################
ISP:
BEGIN
DECLARE CONTINUE HANDLER FOR NOT FOUND SET ProcFailed_fg	= 0;
	#######################################################################
	-- Initialize
	#######################################################################
	IF CallingProc_nm IS NULL OR CallingProc_nm = '' THEN SET CallingProc_nm = '';	END IF;
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	IF User_id = '0' OR User_id = 0 THEN SET User_id =  NULL;	END IF;
	IF User_tp IS NULL OR User_tp = '' THEN SET User_tp = NULL;	END IF;
	IF Company_id = '0' OR Company_id = 0 THEN SET Company_id =  NULL;	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = NULL;	END IF;
	IF User_nm IS NULL OR User_nm = '' THEN SET User_nm = NULL;	END IF;
	IF User_cd IS NULL OR User_cd = '' THEN SET ProcFailed_fg = TRUE;	END IF;
	IF Alias_nm IS NULL OR Alias_nm = '' THEN SET Alias_nm = NULL;	END IF;
	IF Email_nm IS NULL OR Email_nm = '' THEN SET ProcFailed_fg = TRUE;	END IF;
	IF Person_nm IS NULL OR Person_nm = '' THEN SET Person_nm = NULL;	END IF;
	IF Challenge_cd IS NULL OR Challenge_cd = '' THEN SET Challenge_cd = NULL;	END IF;
	IF Response_cd IS NULL OR Response_cd = '' THEN SET Response_cd = NULL;	END IF;
	IF Company_nm IS NULL OR Company_nm = '' THEN SET Company_nm = NULL;	END IF;
	IF Company_cd IS NULL OR Company_cd = '' THEN SET Company_cd = NULL;	END IF;
	IF User_tx IS NULL OR User_tx = '' THEN SET User_tx = NULL;	END IF;
	IF Company_tx IS NULL OR Company_tx = '' THEN SET Company_tx = NULL;	END IF;
-- 	IF ADD_dm IS NULL THEN SET ADD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
 	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = NULL;	END IF;
-- 	IF UPD_dm IS NULL THEN SET UPD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
 	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = NULL;	END IF;
-- 	IF DEL_dm IS NULL THEN SET DEL_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
 	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = NULL;	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
	CALL	rspResource_Company
	(
		@Resrc_id	:= User_id
	,	@Resrc_tp	:= User_tp
	,	@Company_id	:= Company_id
	,	@Company_tp	:= Company_tp
	,	@Resrc_nm	:= NULL
	,	@Resrc_cd	:= NULL
	,	@Alias_nm	:= NULL
	,	@ADD_dm	:= ADD_dm
	,	@ADD_nm	:= ADD_nm
	,	@UPD_dm	:= UPD_dm
	,	@UPD_nm	:= UPD_nm
	,	@DEL_dm	:= DEL_dm
	,	@DEL_nm	:= DEL_nm
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 1	-- If PK exists then return without error
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				User_id
			,	User_tp
			,	Company_id
			,	Company_tp
			,	User_nm
			,	Company_nm
			;
		END IF;
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################
	SELECT
		tvwUser_Company.User_id
	,	tvwUser_Company.User_tp
	,	tvwUser_Company.Company_id
	,	tvwUser_Company.Company_tp
	,	tvwUser_Company.Company_nm
	INTO
		User_id
	,	User_tp
	,	Company_id
	,	Company_tp
	,	Company_nm
	FROM
		tvwUser_Company
	WHERE	1=1
	AND	tvwUser_Company.User_tp	= User_tp
	AND	tvwUser_Company.User_nm	= User_nm
--	AND	tvwUser_Company.Company_id	= Company_id
-- 	AND	tvwUser_Company.Company_tp	= Company_tp
-- 	AND	tvwUser_Company.Company_nm	= Company_nm
	;
	IF
		FOUND_ROWS()	> 0
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				User_id
			,	User_tp
			,	Company_id
			,	Company_tp
			,	User_nm
			,	Company_nm
			;
		END IF;
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Validate attributes
	#######################################################################
	SET 	@ADD_dm	= ADD_dm;
	SET 	@ADD_nm	= ADD_nm;
	SET 	@UPD_dm	= UPD_dm;
	SET 	@UPD_nm	= UPD_nm;
	SET 	@DEL_dm	= DEL_dm;
	SET 	@DEL_nm	= DEL_nm;
	CALL	vspUser_Company
	(
		@User_id	:= User_id
	,	@User_tp	:= User_tp
	,	@Company_id	:= Company_id
	,	@Company_tp	:= Company_tp
	,	@User_nm	:= User_nm
	,	@User_cd	:= User_cd
	,	@Company_nm	:= Company_nm
	,	@ADD_dm
	,	@ADD_nm
	,	@UPD_dm
	,	@UPD_nm
	,	@DEL_dm
	,	@DEL_nm
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= 'vspUser_Company'
		);
		LEAVE	ISP;
	END IF;
	-- --------------------------------------------------------------------
	SET 	ADD_dm	= @ADD_dm;
	SET 	ADD_nm	= @ADD_nm;
	SET 	UPD_dm	= @UPD_dm;
	SET 	UPD_nm	= @UPD_nm;
	SET 	DEL_dm	= @DEL_dm;
	SET 	DEL_nm	= @DEL_nm;
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET @FK1	= CONCAT(IFNULL(User_id,"(null)"),",",User_tp);
	SET @FK2	= CONCAT(IFNULL(User_id,"(null)"),",",User_tp,",",IFNULL(Company_id,"(null)"),",",Company_tp);
	-- --------------------------------------------------------------------
	--
	--	RESTRICT MODE:
	--
	IF
		Mode_cd	= 'R'
	THEN
		SET 	@TABLE	= "tblUser";
		CALL	rspUser
		(
			@User_id	:= User_id
		,	@User_tp	:= User_tp
		,	@User_nm	:= User_nm
		,	@User_cd	:= User_cd
		,	@Hashed_cd	:= Hashed_cd
		,	@Person_nm	:= Person_nm
		,	@Email_nm	:= Email_nm
		,	@Challenge_cd	:= Challenge_cd
		,	@Response_cd	:= Response_cd
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	ISP;
		END IF;
		SET 	@TABLE	= "tblResource_Company";
		CALL	rspResource_Company
		(
			@Resrc_id	:= User_id
		,	@Resrc_tp	:= User_tp
		,	@Company_id	:= Company_id
		,	@Company_tp	:= Company_tp
		,	@Resrc_nm	:= User_nm
		,	@Resrc_cd	:= User_cd
		,	@Alias_nm	:= Alias_nm
		,	@ADD_dm	:= ADD_dm
		,	@ADD_nm	:= ADD_nm
		,	@UPD_dm	:= UPD_dm
		,	@UPD_nm	:= UPD_nm
		,	@DEL_dm	:= DEL_dm
		,	@DEL_nm	:= DEL_nm
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK2
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	ISP;
		END IF;
	END IF;
	--
	--	CASCADE MODE:
	--
	IF
		Mode_cd	= 'C'
	THEN
		SET 	@TABLE	= "tblUser";
		SET	@User_id	= User_id;
		CALL	ispUser
		(
			@User_id
		,	@User_tp	:= User_tp
		,	@User_nm	:= User_nm
		,	@User_cd	:= User_cd
		,	@Hashed_cd	:= Hashed_cd
		,	@Person_nm	:= Person_nm
		,	@Email_nm	:= Email_nm
		,	@Challenge_cd	:= Challenge_cd
		,	@Response_cd	:= Response_cd
		,	@User_tx	:= User_tx
		,	@UserADD_dm	:= ADD_dm
		,	@UserADD_nm	:= ADD_nm
		,	@UserUPD_dm	:= UPD_dm
		,	@UserUPD_nm	:= UPD_nm
		,	@UserDEL_dm	:= DEL_dm
		,	@UserDEL_nm	:= DEL_nm
		,	@ParentUser_tp	:= NULL
		,	@UserType_tx	:= NULL
		,	@UserTypeLeft_id	:= NULL
		,	@UserTypeRight_id	:= NULL
		,	@UserTypeLevel_id	:= NULL
		,	@UserTypeOrder_id	:= NULL
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		)
		;
		--	Set the proc IN parameters to the parent ISP INOUT parameters
		SET	User_id	= @User_id;
		--	-------------------------------------------------------
		SET 	@TABLE	= "tblResource_Company";
		SET 	@Resrc_id	= User_id;
		SET 	@Company_id	= Company_id;
		CALL	ispResource_Company
		(
			@Resrc_id
		,	@Resrc_tp	:= User_tp
		,	@Company_id
		,	@Company_tp	:= Company_tp
		,	@Resrc_nm	:= User_nm
		,	@Resrc_cd	:= User_cd
		,	@Alias_nm	:= Alias_nm
		,	@Company_nm := Company_nm
		,	@Company_cd := Company_cd
		,	@Resrc_tx   := User_tx
		,	@Company_tx := Company_tx
		,	@ADD_dm	:= ADD_dm
		,	@ADD_nm	:= ADD_nm
		,	@UPD_dm	:= UPD_dm
		,	@UPD_nm	:= UPD_nm
		,	@DEL_dm	:= DEL_dm
		,	@DEL_nm	:= DEL_nm
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		)
		;
		--	Set the proc IN parameters to the parent ISP INOUT parameters
		SET 	Company_id	= @Company_id;
	END IF;
	#######################################################################
	-- Insert values
	#######################################################################
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
	-- Return the Primary Key to the front-end if this procedure
	-- was not called from another API stored procedure.
	#######################################################################
 	IF
 		CallingProc_nm	IS NULL OR CallingProc_nm = ''
 	THEN
		SELECT
			User_id
		,	User_tp
		,	Company_id
		,	Company_tp
		,	User_nm
		,	Company_nm
		;
 	END IF;
	#######################################################################
END ISP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `rspCompany` */

/*!50003 DROP PROCEDURE IF EXISTS  `rspCompany` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `rspCompany`(
	Company_id		INT SIGNED		
,	Company_tp		VARCHAR(64)		
,	Company_nm		VARCHAR(256)		
,	Company_cd		VARCHAR(128)		
,		Key_cd		VARCHAR(16)		-- = 'PK'	-- Search key code
,	OUT 	RowExists_fg	TINYINT	
)
BEGIN
/*
**	Name:		rspCompany
**	Type:		DB API Procedure: Referential 
**	Purpose:	Check existence of a record in tblCompany
**	Author:		Solomon S. Shacter
**	Generated:	7/9/2013
**
**	Modified:	7/9/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
###############################################################################
RSP:
BEGIN
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'PK';	END IF;
	IF Company_id IS NULL OR Company_id = 0 THEN SET Company_id =  -2147483647;	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = '-2147483647';	END IF;
	IF Company_nm IS NULL OR Company_nm = '' THEN SET Company_nm = '-2147483647';	END IF;
	IF Company_cd IS NULL OR Company_cd = '' THEN SET Company_cd = '-2147483647';	END IF;
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF 	Key_cd	= 'PK'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblCompany
			WHERE
				tblCompany.Company_id	= Company_id
			AND	tblCompany.Company_tp	= Company_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd = 'FK1'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblCompany
			WHERE
				tblCompany.Company_tp	= Company_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd = 'FK2'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblCompany
			WHERE
				tblCompany.Company_id	= Company_id
			AND	tblCompany.Company_tp	= Company_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	IF	Key_cd = 'AK'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblCompany
			WHERE
				tblCompany.Company_tp	= Company_tp
			AND	tblCompany.Company_nm	= Company_nm
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd	= 'AL'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblCompany
			WHERE
				(
				Company_id	= Company_id
			OR	Company_id	=  -2147483647
				)
			AND	(
				Company_tp	= Company_tp
			OR	Company_tp	= '-2147483647'
				)
			AND	(
				Company_nm	= Company_nm
			OR	Company_nm	= '-2147483647'
				)
			AND	(
				Company_cd	= Company_cd
			OR	Company_cd	= '-2147483647'
				)
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
END	RSP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `rspCompanyType` */

/*!50003 DROP PROCEDURE IF EXISTS  `rspCompanyType` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `rspCompanyType`(
	Company_tp		varchar(64)		
,		Key_cd		VARCHAR(16)		-- = 'PK'	-- Search key code
,	OUT 	RowExists_fg	TINYINT	
)
BEGIN
/*
**	Name:		rspCompanyType
**	Type:		DB API Procedure: Referential 
**	Purpose:	Check existence of a record in tblCompanyType
**	Author:		Solomon S. Shacter
**	Generated:	7/2/2013
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
###############################################################################
RSP:
BEGIN
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'PK';	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = '-2147483647';	END IF;
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF 	Key_cd	= 'PK'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblCompanyType
			WHERE
				tblCompanyType.Company_tp	= Company_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd = 'FK1'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblCompanyType
			WHERE
				tblCompanyType.Company_tp	= Company_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd	= 'AL'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblCompanyType
			WHERE
				(
				Company_tp	= Company_tp
			OR	Company_tp	= '-2147483647'
				)
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
END	RSP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `rspContactType` */

/*!50003 DROP PROCEDURE IF EXISTS  `rspContactType` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `rspContactType`(
	Contact_tp		VARCHAR(64)		
,	Key_cd		VARCHAR(16)		-- = 'PK'	-- Search key code
,	OUT 	RowExists_fg	TINYINT	
)
BEGIN
/*
**	Name:		rspContactType
**	Type:		DB API Procedure: Referential 
**	Purpose:	Check existence of a record in tblContactType
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**	Generated:	7/2/2013
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
###############################################################################
RSP:
BEGIN
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'PK';	END IF;
	IF Contact_tp IS NULL OR Contact_tp = '' THEN SET Contact_tp = '-2147483647';	END IF;
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF 	Key_cd	= 'PK'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblContactType
			WHERE
				tblContactType.Contact_tp	= Contact_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd = 'FK1'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblContactType
			WHERE
				tblContactType.Contact_tp	= Contact_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd	= 'AL'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblContactType
			WHERE
				(
				Contact_tp	= Contact_tp
			OR	Contact_tp	= '-2147483647'
				)
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
END	RSP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `rspResource` */

/*!50003 DROP PROCEDURE IF EXISTS  `rspResource` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `rspResource`(
	Resrc_id		int signed		
,	Resrc_tp		varchar(64)
,	Resrc_tx		mediumtext		
,	ADD_dm		datetime		
,	ADD_nm		varchar(256)		
,	UPD_dm		datetime		
,	UPD_nm		varchar(256)		
,	DEL_dm		datetime		
,	DEL_nm		varchar(256)		
,		Key_cd		VARCHAR(16)		-- = 'PK'	-- Search key code
,	OUT 	RowExists_fg	TINYINT	
)
BEGIN
/*
**	Name:		rspResource
**	Type:		DB API Procedure: Referential 
**	Purpose:	Check existence of a record in tblResource
**	Author:		Solomon S. Shacter
**	Generated:	7/2/2013
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
###############################################################################
RSP:
BEGIN
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'PK';	END IF;
	IF Resrc_id IS NULL OR Resrc_id = 0 THEN SET Resrc_id =  -2147483647;	END IF;
	IF Resrc_tp IS NULL OR Resrc_tp = '' THEN SET Resrc_tp = '-2147483647';	END IF;
	IF Resrc_tx IS NULL OR Resrc_tx = '' THEN SET Resrc_tx = '-2147483647';	END IF;
	IF ADD_dm IS NULL OR ADD_dm = '' THEN SET ADD_dm = '0000-00-00 00:00:00';	END IF;
	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = '-2147483647';	END IF;
	IF UPD_dm IS NULL OR UPD_dm = '' THEN SET UPD_dm = '0000-00-00 00:00:00';	END IF;
	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = '-2147483647';	END IF;
	IF DEL_dm IS NULL OR DEL_dm = '' THEN SET DEL_dm = '0000-00-00 00:00:00';	END IF;
	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = '-2147483647';	END IF;
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF 	Key_cd	= 'PK'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblResource
			WHERE
				tblResource.Resrc_id	= Resrc_id
			AND	tblResource.Resrc_tp	= Resrc_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd = 'FK1'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblResource
			WHERE
				tblResource.Resrc_tp	= Resrc_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd	= 'AL'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblResource
			WHERE
				(
				Resrc_id	= Resrc_id
			OR	Resrc_id	=  -2147483647
				)
			AND	(
				Resrc_tp	= Resrc_tp
			OR	Resrc_tp	= '-2147483647'
				)
			AND	(
				Resrc_tx	LIKE Resrc_tx
			OR	Resrc_tx	LIKE '-2147483647'
				)
			AND	(
				ADD_dm	= ADD_dm
			OR	ADD_dm	= '0000-00-00 00:00:00'
				)
			AND	(
				ADD_nm	= ADD_nm
			OR	ADD_nm	= '-2147483647'
				)
			AND	(
				UPD_dm	= UPD_dm
			OR	UPD_dm	= '0000-00-00 00:00:00'
				)
			AND	(
				UPD_nm	= UPD_nm
			OR	UPD_nm	= '-2147483647'
				)
			AND	(
				DEL_dm	= DEL_dm
			OR	DEL_dm	= '0000-00-00 00:00:00'
				)
			AND	(
				DEL_nm	= DEL_nm
			OR	DEL_nm	= '-2147483647'
				)
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
END	RSP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `rspResourceType` */

/*!50003 DROP PROCEDURE IF EXISTS  `rspResourceType` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `rspResourceType`(
	Resrc_tp		VARCHAR(64)		
,	ParentResrc_tp		VARCHAR(64)		
,	ResrcType_tx		MEDIUMTEXT		
,	Left_id		INT SIGNED		
,	Right_id		INT SIGNED		
,	Level_id		INT SIGNED		
,	Order_id		INT SIGNED		
,	Key_cd		VARCHAR(16)		-- = 'PK'	-- Search key code
,	OUT 	RowExists_fg	TINYINT	
)
BEGIN
/*
**	Name:		rspResourceType
**	Type:		DB API Procedure: Referential 
**	Purpose:	Check existence of a record in tblResourceType
**	Author:		Solomon S. Shacter
**	Generated:	7/2/2013
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
###############################################################################
RSP:
BEGIN
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'PK';	END IF;
	IF Resrc_tp IS NULL OR Resrc_tp = '' THEN SET Resrc_tp = '-2147483647';	END IF;
	IF ParentResrc_tp IS NULL OR ParentResrc_tp = '' THEN SET ParentResrc_tp = '-2147483647';	END IF;
	IF ResrcType_tx IS NULL OR ResrcType_tx = '' THEN SET ResrcType_tx = '-2147483647';	END IF;
	IF Left_id IS NULL OR Left_id = 0 THEN SET Left_id =  -2147483647;	END IF;
	IF Right_id IS NULL OR Right_id = 0 THEN SET Right_id =  -2147483647;	END IF;
	IF Level_id IS NULL OR Level_id = 0 THEN SET Level_id =  -2147483647;	END IF;
	IF Order_id IS NULL OR Order_id = 0 THEN SET Order_id =  -2147483647;	END IF;
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF 	Key_cd	= 'PK'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tblResourceType
			WHERE	1=1
			AND	tblResourceType.Resrc_tp	= Resrc_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	IF	Key_cd = 'AK'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tblResourceType
			WHERE	1=1
			AND	tblResourceType.Resrc_tp	= Resrc_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd	= 'AL'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tblResourceType
			WHERE	1=1
			AND	(
				Resrc_tp	= Resrc_tp
			OR	Resrc_tp	= '-2147483647'
				)
			AND	(
				ParentResrc_tp	= ParentResrc_tp
			OR	ParentResrc_tp	= '-2147483647'
				)
			AND	(
				ResrcType_tx	LIKE ResrcType_tx
			OR	ResrcType_tx	LIKE '-2147483647'
				)
			AND	(
				Left_id	= Left_id
			OR	Left_id	=  -2147483647
				)
			AND	(
				Right_id	= Right_id
			OR	Right_id	=  -2147483647
				)
			AND	(
				Level_id	= Level_id
			OR	Level_id	=  -2147483647
				)
			AND	(
				Order_id	= Order_id
			OR	Order_id	=  -2147483647
				)
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
END	RSP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `rspResourceType_CompanyType` */

/*!50003 DROP PROCEDURE IF EXISTS  `rspResourceType_CompanyType` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `rspResourceType_CompanyType`(
	Resrc_tp		VARCHAR(64)		
,	Company_tp		VARCHAR(64)		
,	Key_cd		VARCHAR(16)		-- = 'PK'	-- Search key code
,	OUT 	RowExists_fg	TINYINT	
)
BEGIN
/*
**	Name:		rspResourceType_CompanyType
**	Type:		DB API Procedure: Referential 
**	Purpose:	Check existence of a record in tblResourceType_CompanyType
**	Author:		Solomon S. Shacter
**	Generated:	7/2/2013
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
###############################################################################
RSP:
BEGIN
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'PK';	END IF;
	IF Resrc_tp IS NULL OR Resrc_tp = '' THEN SET Resrc_tp = '-2147483647';	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = '-2147483647';	END IF;
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF 	Key_cd	= 'PK'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tblResourceType_CompanyType
			WHERE	1=1
			AND	tblResourceType_CompanyType.Resrc_tp	= Resrc_tp
			AND	tblResourceType_CompanyType.Company_tp	= Company_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF 	Key_cd	= 'FK1'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tblResourceType_CompanyType
			WHERE	1=1
			AND	tblResourceType_CompanyType.Resrc_tp	= Resrc_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	IF 	Key_cd	= 'FK2'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tblResourceType_CompanyType
			WHERE	1=1
			AND	tblResourceType_CompanyType.Company_tp	= Company_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	IF	Key_cd = 'AK'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tblResourceType_CompanyType
			WHERE	1=1
			AND	tblResourceType_CompanyType.Resrc_tp	= Resrc_tp
			AND	tblResourceType_CompanyType.Company_tp	= Company_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd	= 'AL'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tblResourceType_CompanyType
			WHERE	1=1
			AND	(
				Resrc_tp	= Resrc_tp
			OR	Resrc_tp	= '-2147483647'
				)
			AND	(
				Company_tp	= Company_tp
			OR	Company_tp	= '-2147483647'
				)
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
END	RSP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `rspResource_Company` */

/*!50003 DROP PROCEDURE IF EXISTS  `rspResource_Company` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `rspResource_Company`(
	Resrc_id		INT SIGNED
,	Resrc_tp		VARCHAR(64)
,	Company_id		INT SIGNED
,	Company_tp		VARCHAR(64)
,	Resrc_nm		VARCHAR(256)
,	Resrc_cd		VARCHAR(128)
,	Alias_nm		VARCHAR(256)
,	ADD_dm		DATETIME
,	ADD_nm		VARCHAR(256)
,	UPD_dm		DATETIME
,	UPD_nm		VARCHAR(256)
,	DEL_dm		DATETIME
,	DEL_nm		VARCHAR(256)
,		Key_cd		VARCHAR(16)		-- = 'PK'	-- Search key code
,	OUT 	RowExists_fg	TINYINT	
)
BEGIN
/*
**	Name:		rspResource_Company
**	Type:		DB API Procedure: Referential 
**	Purpose:	Check existence of a record in tblResource_Company
**	Author:		Solomon S. Shacter
**	Generated:	7/9/2013
**
**	Modified:	7/9/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
###############################################################################
RSP:
BEGIN
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'PK';	END IF;
	IF Resrc_id IS NULL OR Resrc_id = 0 THEN SET Resrc_id =  -2147483647;	END IF;
	IF Resrc_tp IS NULL OR Resrc_tp = '' THEN SET Resrc_tp = '-2147483647';	END IF;
	IF Company_id IS NULL OR Company_id = 0 THEN SET Company_id =  -2147483647;	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = '-2147483647';	END IF;
	IF Resrc_nm IS NULL OR Resrc_nm = '' THEN SET Resrc_nm = '-2147483647';	END IF;
	IF Resrc_cd IS NULL OR Resrc_cd = '' THEN SET Resrc_cd = '-2147483647';	END IF;
	IF Alias_nm IS NULL OR Alias_nm = '' THEN SET Alias_nm = '-2147483647';	END IF;
	IF ADD_dm IS NULL THEN SET ADD_dm = CAST('0000-00-00 00:00:00' AS DATEtime);	END IF;
	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = '-2147483647';	END IF;
	IF UPD_dm IS NULL THEN SET UPD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = '-2147483647';	END IF;
	IF DEL_dm IS NULL THEN SET DEL_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = '-2147483647';	END IF;
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF 	Key_cd	= 'PK'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
                tblResource_Company
			WHERE	1=1
			AND	tblResource_Company.Resrc_id	= Resrc_id
			AND	tblResource_Company.Resrc_tp	= Resrc_tp
			AND	tblResource_Company.Company_id	= Company_id
			AND	tblResource_Company.Company_tp	= Company_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd = 'FK1'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
                tblResource_Company
			WHERE	1=1
			AND	tblResource_Company.Resrc_tp	= Resrc_tp
			AND	tblResource_Company.Company_tp	= Company_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd = 'FK2'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
                tblResource_Company
			WHERE	1=1
			AND	tblResource_Company.Resrc_id	= Resrc_id
			AND	tblResource_Company.Resrc_tp	= Resrc_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd = 'FK3'
	THEN
		IF
		EXISTS
		(
			SELECT	1
		    FROM
			    tblResource_Company
		    WHERE   1=1
		    AND	tblResource_Company.Company_id	= Company_id
		    AND	tblResource_Company.Company_tp	= Company_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	IF	Key_cd = 'AK'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
                tblResource_Company
			WHERE	1=1
			AND	tblResource_Company.Resrc_tp	= Resrc_tp
			AND	tblResource_Company.Company_id	= Company_id
			AND	tblResource_Company.Company_tp	= Company_tp
			AND	tblResource_Company.Resrc_nm	= Resrc_nm
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd	= 'AL'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
                tblResource_Company
			WHERE	1=1
			AND	(
				tblResource_Company.Resrc_id	= Resrc_id
			OR	Resrc_id	=  -2147483647
				)
			AND	(
				tblResource_Company.Resrc_tp	= Resrc_tp
			OR	Resrc_tp	= '-2147483647'
				)
			AND	(
				tblResource_Company.Company_id	= Company_id
			OR	Company_id	=  -2147483647
				)
			AND	(
				tblResource_Company.Company_tp	= Company_tp
			OR	Company_tp	= '-2147483647'
				)
			AND	(
				tblResource_Company.Resrc_nm	= Resrc_nm
			OR	Resrc_nm	= '-2147483647'
				)
			AND	(
				tblResource_Company.Resrc_cd	= Resrc_cd
			OR	Resrc_cd	= '-2147483647'
				)
			AND	(
				tblResource_Company.Alias_nm	= Alias_nm
			OR	Alias_nm	= '-2147483647'
				)
			AND	(
				tblResource_Company.ADD_dm	= ADD_dm
			OR	ADD_dm	= '0000-00-00 00:00:00'
				)
			AND	(
				tblResource_Company.ADD_nm	= ADD_nm
			OR	ADD_nm	= '-2147483647'
				)
			AND	(
				tblResource_Company.UPD_dm	= UPD_dm
			OR	UPD_dm	= '0000-00-00 00:00:00'
				)
			AND	(
				tblResource_Company.UPD_nm	= UPD_nm
			OR	UPD_nm	= '-2147483647'
				)
			AND	(
				tblResource_Company.DEL_dm	= DEL_dm
			OR	DEL_dm	= '0000-00-00 00:00:00'
				)
			AND	(
				tblResource_Company.DEL_nm	= DEL_nm
			OR	DEL_nm	= '-2147483647'
				)
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
END	RSP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `rspResource_Contact` */

/*!50003 DROP PROCEDURE IF EXISTS  `rspResource_Contact` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `rspResource_Contact`(
	Resrc_id	INT SIGNED
,	Resrc_tp	VARCHAR(64)
,	Contact_id	INT SIGNED
,	Contact_tp	VARCHAR(64)
,	Contact_nm	VARCHAR(256)
,	Contact_cd	VARCHAR(128)
,	Alias_nm	VARCHAR(256)
,	Address_nm	VARCHAR(256)
,	City_cd		VARCHAR(128)
,	State_cd	VARCHAR(128)
,	Zip_cd		VARCHAR(128)
,	Phone_cd	VARCHAR(128)
,	GPS_cd		VARCHAR(128)
,	ADD_dm		DATETIME
,	ADD_nm		VARCHAR(256)
,	UPD_dm		DATETIME
,	UPD_nm		VARCHAR(256)
,	DEL_dm		DATETIME
,	DEL_nm		VARCHAR(256)
,		Key_cd		VARCHAR(16)		-- = 'PK'	-- Search key code
,	OUT 	RowExists_fg	TINYINT	
)
BEGIN
/*
**	Name:		rspResource_Contact
**	Type:		DB API Procedure: Referential 
**	Purpose:	Check existence of a record in tblResource_Contact
**	Author:		Solomon S. Shacter
**	Generated:	7/9/2013
**
**	Modified:	7/9/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
###############################################################################
RSP:
BEGIN
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'PK';	END IF;
	IF Resrc_id IS NULL OR Resrc_id = 0 THEN SET Resrc_id =  -2147483647;	END IF;
	IF Resrc_tp IS NULL OR Resrc_tp = '' THEN SET Resrc_tp = '-2147483647';	END IF;
	IF Contact_id IS NULL OR Contact_id = 0 THEN SET Contact_id =  -2147483647;	END IF;
	IF Contact_tp IS NULL OR Contact_tp = '' THEN SET Contact_tp = '-2147483647';	END IF;
	IF Contact_nm IS NULL OR Contact_nm = '' THEN SET Contact_nm = '-2147483647';	END IF;
	IF Contact_cd IS NULL OR Contact_cd = '' THEN SET Contact_cd = '-2147483647';	END IF;
	IF Alias_nm IS NULL OR Alias_nm = '' THEN SET Alias_nm = '-2147483647';	END IF;
	IF Address_nm IS NULL OR Address_nm = '' THEN SET Address_nm = '-2147483647';	END IF;
	IF City_cd IS NULL OR City_cd = '' THEN SET City_cd = '-2147483647';	END IF;
	IF State_cd IS NULL OR State_cd = '' THEN SET State_cd = '-2147483647';	END IF;
	IF ZIP_cd IS NULL OR ZIP_cd = '' THEN SET ZIP_cd = '-2147483647';	END IF;
	IF Phone_cd IS NULL OR Phone_cd = '' THEN SET Phone_cd = '-2147483647';	END IF;
	IF GPS_cd IS NULL OR GPS_cd = '' THEN SET GPS_cd = '-2147483647';	END IF;
	IF ADD_dm IS NULL THEN SET ADD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = '-2147483647';	END IF;
	IF UPD_dm IS NULL THEN SET UPD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = '-2147483647';	END IF;
	IF DEL_dm IS NULL THEN SET DEL_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = '-2147483647';	END IF;
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF 	Key_cd	= 'PK'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tblResource_Contact
			WHERE	1=1
			AND	tblResource_Contact.Resrc_id	= Resrc_id
			AND	tblResource_Contact.Resrc_tp	= Resrc_tp
			AND	tblResource_Contact.Contact_id	= Contact_id
			AND	tblResource_Contact.Contact_tp	= Contact_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd = 'FK1'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tblResource_Contact
			WHERE	1=1
			AND	tblResource_Contact.Resrc_tp	= Resrc_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	IF	Key_cd = 'FK2'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tblResource_Contact
			WHERE	1=1
			AND	tblResource_Contact.Contact_tp	= Contact_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	IF	Key_cd = 'FK3'
	THEN
		IF
		EXISTS
		(
			SELECT	1
		    FROM
			    tblResource_Contact
		    WHERE   1=1
		    AND	tblResource_Contact.Resrc_id	= Resrc_id
		    AND	tblResource_Contact.Resrc_tp	= Resrc_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	IF	Key_cd = 'FK4'
	THEN
		IF
		EXISTS
		(
			SELECT	1
		    FROM
			    tblResource_Contact
		    WHERE   1=1
		    AND	tblResource_Contact.Contact_id	= Contact_id
		    AND	tblResource_Contact.Contact_tp	= Contact_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	IF	Key_cd = 'AK'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tblResource_Contact
			WHERE	1=1
			AND	tblResource_Contact.Resrc_id	= Resrc_id
			AND	tblResource_Contact.Resrc_tp	= Resrc_tp
			AND	tblResource_Contact.Contact_tp	= Contact_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd	= 'AL'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tblResource_Contact
			WHERE	1=1
			AND	(
				tblResource_Contact.Resrc_id	= Resrc_id
			OR	Resrc_id	=  -2147483647
				)
			AND	(
				tblResource_Contact.Resrc_tp	= Resrc_tp
			OR	Resrc_tp	= '-2147483647'
				)
			AND	(
				tblResource_Contact.Contact_id	= Contact_id
			OR	Contact_id	=  -2147483647
				)
			AND	(
				tblResource_Contact.Contact_tp	= Contact_tp
			OR	Contact_tp	= '-2147483647'
				)
			AND	(
				tblResource_Contact.Contact_nm	= Contact_nm
			OR	Contact_nm	= '-2147483647'
				)
			AND	(
				tblResource_Contact.Contact_cd	= Contact_cd
			OR	Contact_cd	= '-2147483647'
				)
			AND	(
				tblResource_Contact.Alias_nm	= Alias_nm
			OR	Alias_nm	= '-2147483647'
				)
			AND	(
				tblResource_Contact.Address_nm	LIKE CONCAT('%', Address_nm, '%')
			OR	Address_nm	= '-2147483647'
				)
			AND	(
				tblResource_Contact.City_cd	LIKE CONCAT('%', City_cd, '%')
			OR	City_cd	= '-2147483647'
				)
			AND	(
				tblResource_Contact.State_cd	LIKE CONCAT('%', State_cd, '%')
			OR	State_cd	= '-2147483647'
				)
			AND	(
				tblResource_Contact.ZIP_cd	LIKE CONCAT('%', ZIP_cd, '%')
			OR	ZIP_cd	= '-2147483647'
				)
			AND	(
				tblResource_Contact.Phone_cd	LIKE CONCAT('%', Phone_cd, '%')
			OR	Phone_cd	= '-2147483647'
				)
			AND	(
				tblResource_Contact.GPS_cd	LIKE CONCAT('%', GPS_cd, '%')
			OR	GPS_cd	= '-2147483647'
				)
			AND	(
				tblResource_Contact.ADD_dm	= ADD_dm
			OR	ADD_dm	= '0000-00-00 00:00:00'
				)
			AND	(
				tblResource_Contact.ADD_nm	= ADD_nm
			OR	ADD_nm	= '-2147483647'
				)
			AND	(
				tblResource_Contact.UPD_dm	= UPD_dm
			OR	UPD_dm	= '0000-00-00 00:00:00'
				)
			AND	(
				tblResource_Contact.UPD_nm	= UPD_nm
			OR	UPD_nm	= '-2147483647'
				)
			AND	(
				tblResource_Contact.DEL_dm	= DEL_dm
			OR	DEL_dm	= '0000-00-00 00:00:00'
				)
			AND	(
				tblResource_Contact.DEL_nm	= DEL_nm
			OR	DEL_nm	= '-2147483647'
				)
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
END	RSP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `rspUser` */

/*!50003 DROP PROCEDURE IF EXISTS  `rspUser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `rspUser`(
	User_id		INT SIGNED
,	User_tp		VARCHAR(64)
,	User_nm		VARCHAR(256)
,	User_cd		VARCHAR(128)
,	Hashed_cd	VARCHAR(128)
,	Person_nm	VARCHAR(256)
,	Email_nm	VARCHAR(256)
,	Challenge_cd	VARCHAR(128)
,	Response_cd	VARCHAR(128)
,		Key_cd		VARCHAR(16)		-- = 'PK'	-- Search key code
,	OUT 	RowExists_fg	TINYINT	
)
BEGIN
/*
**	Name:		rspUser
**	Type:		DB API Procedure: Referential 
**	Purpose:	Check existence of a record in tblUser
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**	Generated:	7/9/2013
**
**	Modified:	7/9/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
###############################################################################
RSP:
BEGIN
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'PK';	END IF;
	IF User_id IS NULL OR User_id = 0 THEN SET User_id =  -2147483647;	END IF;
	IF User_tp IS NULL OR User_tp = '' THEN SET User_tp = '-2147483647';	END IF;
	IF User_nm IS NULL OR User_nm = '' THEN SET User_nm = '-2147483647';	END IF;
	IF User_cd IS NULL OR User_cd = '' THEN SET User_cd = '-2147483647';	END IF;
	IF Hashed_cd IS NULL OR Hashed_cd = '' THEN SET Hashed_cd = '-2147483647';	END IF;
	IF Person_nm IS NULL OR Person_nm = '' THEN SET Person_nm = '-2147483647';	END IF;
	IF Email_nm IS NULL OR Email_nm = '' THEN SET Email_nm = '-2147483647';	END IF;
	IF Challenge_cd IS NULL OR Challenge_cd = '' THEN SET Challenge_cd = '-2147483647';	END IF;
	IF Response_cd IS NULL OR Response_cd = '' THEN SET Response_cd = '-2147483647';	END IF;
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF 	Key_cd	= 'PK'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblUser
			WHERE
				tblUser.User_id	= User_id
			AND	tblUser.User_tp	= User_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd = 'FK1'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblUser
			WHERE
				tblUser.User_tp	= User_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd = 'FK2'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblUser
			WHERE
				tblUser.User_id	= User_id
			AND	tblUser.User_tp	= User_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	IF	Key_cd = 'AK'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblUser
			WHERE
				tblUser.User_tp	= User_tp
			AND	tblUser.User_nm	= User_nm
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd	= 'AL'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblUser
			WHERE
				(
				User_id	= User_id
			OR	User_id	=  -2147483647
				)
			AND	(
				User_tp	= User_tp
			OR	User_tp	= '-2147483647'
				)
			AND	(
				User_nm	= User_nm
			OR	User_nm	= '-2147483647'
				)
			AND	(
				User_cd	= User_cd
			OR	User_cd	= '-2147483647'
				)
			AND	(
				Hashed_cd	= Hashed_cd
			OR	Hashed_cd	= '-2147483647'
				)
			AND	(
				Person_nm	LIKE CONCAT('%', Person_nm, '%')
			OR	Person_nm	= '-2147483647'
				)
			AND	(
				Email_nm	= Email_nm
			OR	Email_nm	= '-2147483647'
				)
			AND	(
				Challenge_cd	= Challenge_cd
			OR	Challenge_cd	= '-2147483647'
				)
			AND	(
				Response_cd	= Response_cd
			OR	Response_cd	= '-2147483647'
				)
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
END	RSP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `rspUserType` */

/*!50003 DROP PROCEDURE IF EXISTS  `rspUserType` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `rspUserType`(
	User_tp		VARCHAR(64)		
,	Key_cd		VARCHAR(16)		-- = 'PK'	-- Search key code
,	OUT 	RowExists_fg	TINYINT	
)
BEGIN
/*
**	Name:		rspUserType
**	Type:		DB API Procedure: Referential 
**	Purpose:	Check existence of a record in tblUserType
**	Author:		Solomon S. Shacter
**	Generated:	7/2/2013
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
###############################################################################
RSP:
BEGIN
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'PK';	END IF;
	IF User_tp IS NULL OR User_tp = '' THEN SET User_tp = '-2147483647';	END IF;
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF 	Key_cd	= 'PK'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblUserType
			WHERE
				tblUserType.User_tp	= User_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd = 'FK1'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblUserType
			WHERE
				tblUserType.User_tp	= User_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd	= 'AL'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblUserType
			WHERE
				(
				User_tp	= User_tp
			OR	User_tp	= '-2147483647'
				)
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
END	RSP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `uspCompany` */

/*!50003 DROP PROCEDURE IF EXISTS  `uspCompany` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `uspCompany`(
	Company_id		INT SIGNED		-- PK1 
,	Company_tp		VARCHAR(64)		-- PK2 AK1
,	Company_nm		VARCHAR(256)		--  AK2
,	Company_cd		VARCHAR(128)	
,	Company_tx		MEDIUMTEXT	
,	CompanyADD_dm		DATETIME	
,	CompanyADD_nm		VARCHAR(256)	
,	CompanyUPD_dm		DATETIME	
,	CompanyUPD_nm		VARCHAR(256)	
,	CompanyDEL_dm		DATETIME	
,	CompanyDEL_nm		VARCHAR(256)	
,	ParentCompany_tp		VARCHAR(64)	
,	CompanyType_tx		MEDIUMTEXT	
,	CompanyTypeLeft_id		INT SIGNED	
,	CompanyTypeRight_id		INT SIGNED	
,	CompanyTypeLevel_id		INT SIGNED	
,	CompanyTypeOrder_id		INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		uspCompany
**	Type:		DB API procedure: Insert
**	Purpose:	To update Company data in tblCompany
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	6/14/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblCompany';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'UPDATE';
DECLARE	Proc_nm		VARCHAR(255) DEFAULT 'uspCompany';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
USP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	IF Company_id IS NULL OR Company_id = 0 THEN SET Company_id =  -2147483647;	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = '-2147483647';	END IF;
	IF Company_nm IS NULL OR Company_nm = '' THEN SET Company_nm = '-2147483647';	END IF;
	IF Company_cd IS NULL OR Company_cd = '' THEN SET Company_cd = '-2147483647';	END IF;
	IF Company_tx IS NULL OR Company_tx = '' THEN SET Company_tx = '-2147483647';	END IF;
	IF CompanyADD_dm IS NULL OR CompanyADD_dm = '' THEN SET CompanyADD_dm = '0000-00-00 00:00:00';	END IF;
	IF CompanyADD_nm IS NULL OR CompanyADD_nm = '' THEN SET CompanyADD_nm = '-2147483647';	END IF;
	IF CompanyUPD_dm IS NULL OR CompanyUPD_dm = '' THEN SET CompanyUPD_dm = '0000-00-00 00:00:00';	END IF;
	IF CompanyUPD_nm IS NULL OR CompanyUPD_nm = '' THEN SET CompanyUPD_nm = '-2147483647';	END IF;
	IF CompanyDEL_dm IS NULL OR CompanyDEL_dm = '' THEN SET CompanyDEL_dm = '0000-00-00 00:00:00';	END IF;
	IF CompanyDEL_nm IS NULL OR CompanyDEL_nm = '' THEN SET CompanyDEL_nm = '-2147483647';	END IF;
	IF ParentCompany_tp IS NULL OR ParentCompany_tp = '' THEN SET ParentCompany_tp = '-2147483647';	END IF;
	IF CompanyType_tx IS NULL OR CompanyType_tx = '' THEN SET CompanyType_tx = '-2147483647';	END IF;
	IF CompanyTypeLeft_id IS NULL OR CompanyTypeLeft_id = 0 THEN SET CompanyTypeLeft_id =  -2147483647;	END IF;
	IF CompanyTypeRight_id IS NULL OR CompanyTypeRight_id = 0 THEN SET CompanyTypeRight_id =  -2147483647;	END IF;
	IF CompanyTypeLevel_id IS NULL OR CompanyTypeLevel_id = 0 THEN SET CompanyTypeLevel_id =  -2147483647;	END IF;
	IF CompanyTypeOrder_id IS NULL OR CompanyTypeOrder_id = 0 THEN SET CompanyTypeOrder_id =  -2147483647;	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Return error if Primary Key TABLE record does NOT exist
	#######################################################################
	SET 	@PK1	= CONCAT(Company_id,",",Company_tp);
	-- --------------------------------------------------------------------
	CALL	rspCompany
	(
		@Company_id	:= Company_id
	,	@Company_tp	:= Company_tp
	,	@Company_nm	:= Company_nm
	,	@Company_cd	:= Company_cd
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 0	-- If PK row does not exist then return with error
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errPKNotExist
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		,	@Key_nm		:= @PK1
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Validate attributes
	#######################################################################
	--	Set the VSP INOUT parameters to the proc IN parameters
	-- --------------------------------------------------------------------
	CALL	vspCompany
	(
		@Company_id	:= Company_id
	,	@Company_tp	:= Company_tp
	,	@Company_nm	:= Company_nm
	,	@Company_cd	:= Company_cd
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= Proc_nm
		);
		LEAVE	USP;
	END IF;
	--	Set the proc IN parameters to the VSP INOUT parameters
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET 	@FK1	= CONCAT(Company_tp);
	SET 	@FK2	= CONCAT(Company_id,",",Company_tp);
	-- --------------------------------------------------------------------
	IF
		Mode_cd	= 'R'
	THEN
		--
		--	RESTRICT MODE:	tblCompanyType
		--
		CALL	rspCompanyType
		(
			@Company_tp	:= Company_tp
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblCompanyType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= 'tblCompanyType'
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= 'tblCompanyType'
			);
			LEAVE	USP;
		END IF;
		--
		--	RESTRICT MODE:	tblResource
		--
		CALL	rspResource
		(
			@Resrc_id	:= Company_id
		,	@Resrc_tp	:= Company_tp
		,	@Resrc_tx	:= Company_tx
		,	@ADD_dm		:= CompanyADD_dm
		,	@ADD_nm		:= CompanyADD_nm
		,	@UPD_dm		:= CompanyUPD_dm
		,	@UPD_nm		:= CompanyUPD_nm
		,	@DEL_dm		:= CompanyDEL_dm
		,	@DEL_nm		:= CompanyDEL_nm
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblResource not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= 'tblResource'
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK2
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= 'tblResource'
			);
			LEAVE	USP;
		END IF;
	END IF;
	-- --------------------------------------------------------------------
	-- --------------------------------------------------------------------
	IF
		Mode_cd	= 'C'
	THEN
		--
		--	CASCADE MODE:	tblCompanyType
		--
		CALL	uspCompanyType
		(
			@Company_tp		:= Company_tp
		,	@ParentCompany_tp	:= ParentCompany_tp
		,	@CompanyType_tx		:= CompanyType_tx
		,	@CompanyTypeLeft_id	:= CompanyTypeLeft_id
		,	@CompanyTypeRight_id	:= CompanyTypeRight_id
		,	@CompanyTypeLevel_id	:= CompanyTypeLevel_id
		,	@CompanyTypeOrder_id	:= CompanyTypeOrder_id
		,	@CallingProc_nm	:= CallingProc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= 'R'	-- This Table Is Restricted and Does Not Allow A Cascade From an FK Table.
		);
		--
		--	CASCADE MODE:	tblResource
		--
		CALL	uspResource
		(
			@Resrc_id	:= Company_id
		,	@Resrc_tp	:= Company_tp
		,	@Resrc_tx	:= Company_tx
		,	@ADD_dm		:= CompanyADD_dm
		,	@ADD_nm		:= CompanyADD_nm
		,	@UPD_dm		:= CompanyUPD_dm
		,	@UPD_nm		:= CompanyUPD_nm
		,	@DEL_dm		:= CompanyDEL_dm
		,	@DEL_nm		:= CompanyDEL_nm
		,	@ParentResrc_tp	:= ParentCompany_tp
		,	@ResrcType_tx	:= CompanyType_tx
		,	@Left_id	:= CompanyTypeLeft_id
		,	@Right_id	:= CompanyTypeRight_id
		,	@Level_id	:= CompanyTypeLevel_id
		,	@Order_id	:= CompanyTypeOrder_id
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		);
	END IF;
	#######################################################################
	-- Update NON-KEY values
	#######################################################################
	-- --------------------------------------------------------------------
	-- Invoke an UPDATE when a non-key attribute is actually modified.
	-- --------------------------------------------------------------------
	IF 	
		Company_nm	= '-2147483647'
	AND 	Company_cd	= '-2147483647'
	THEN
		LEAVE 	USP;
	END IF;
	-- --------------------------------------------------------------------
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedEvent
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
	UPDATE
		tblCompany
	SET	
		tblCompany.Company_nm	=
		CASE
			WHEN	Company_nm	= '-2147483647'
			THEN	tblCompany.Company_nm
			ELSE 	Company_nm
		END
	,	tblCompany.Company_cd	=
		CASE
			WHEN	Company_cd	= '-2147483647'
			THEN	tblCompany.Company_cd
			ELSE 	Company_cd
		END
	WHERE
		tblCompany.Company_id	= Company_id
	AND	tblCompany.Company_tp	= Company_tp
	;
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
END USP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `uspCompanyType` */

/*!50003 DROP PROCEDURE IF EXISTS  `uspCompanyType` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `uspCompanyType`(
	Company_tp		VARCHAR(64)		-- PK1 
,	ParentCompany_tp		VARCHAR(64)	
,	CompanyType_tx		MEDIUMTEXT	
,	CompanyTypeLeft_id		INT SIGNED	
,	CompanyTypeRight_id		INT SIGNED	
,	CompanyTypeLevel_id		INT SIGNED	
,	CompanyTypeOrder_id		INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		uspCompanyType
**	Type:		DB API procedure: Insert
**	Purpose:	To insert CompanyType data into tblCompanyType
**	Author:		Solomon S. Shacter
**	Organiztion:	Innovella, Inc.
**
**	Modified:	6/14/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblCompanyType';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'UPDATE';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'uspCompanyType';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
USP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = '-2147483647';	END IF;
	IF ParentCompany_tp IS NULL OR ParentCompany_tp = '' THEN SET ParentCompany_tp = '-2147483647';	END IF;
	IF CompanyType_tx IS NULL OR CompanyType_tx = '' THEN SET CompanyType_tx = '-2147483647';	END IF;
	IF CompanyTypeLeft_id IS NULL OR CompanyTypeLeft_id = 0 THEN SET CompanyTypeLeft_id =  -2147483647;	END IF;
	IF CompanyTypeRight_id IS NULL OR CompanyTypeRight_id = 0 THEN SET CompanyTypeRight_id =  -2147483647;	END IF;
	IF CompanyTypeLevel_id IS NULL OR CompanyTypeLevel_id = 0 THEN SET CompanyTypeLevel_id =  -2147483647;	END IF;
	IF CompanyTypeOrder_id IS NULL OR CompanyTypeOrder_id = 0 THEN SET CompanyTypeOrder_id =  -2147483647;	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Return error if Primary Key TABLE record does NOT exist
	#######################################################################
	SET 	@PK1	= CONCAT(Company_tp);
	-- --------------------------------------------------------------------
	CALL	rspCompanyType
	(
		@Company_tp	:= Company_tp
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 0	-- If PK row does not exist then return with error
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errPKNotExist
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		,	@Key_nm		:= @PK1
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################
	#######################################################################
	-- Validate attributes
	#######################################################################
	CALL	vspCompanyType
	(
		@Company_tp	:= Company_tp
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= Proc_nm
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET	@FK1	= CONCAT(Company_tp);
	-- --------------------------------------------------------------------
	--
	--	RESTRICT MODE:	tblResourceType
	--
	IF
		Mode_cd	= 'R'
	THEN
		CALL	rspResourceType
		(
			@Resrc_tp	:= Company_tp
		,	@ParentResrc_tp	:= ParentCompany_tp
		,	@ResrcType_tx	:= CompanyType_tx
		,	@Left_id	:= CompanyTypeLeft_id
		,	@Right_id	:= CompanyTypeRight_id
		,	@Level_id	:= CompanyTypeLevel_id
		,	@Order_id	:= CompanyTypeOrder_id
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblResourceType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= 'tblResourceType'
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= 'tblResourceType'
			);
			LEAVE	USP;
		END IF;
	END IF;
	--
	--	CASCADE MODE:	tblResourceType
	--
	IF
		Mode_cd	= 'C'
	THEN
		CALL	uspResourceType
		(
			@Resrc_tp	:= Company_tp
		,	@ParentResrc_tp	:= ParentCompany_tp
		,	@ResrcType_tx	:= CompanyType_tx
		,	@Left_id	:= CompanyTypeLeft_id
		,	@Right_id	:= CompanyTypeRight_id
		,	@Level_id	:= CompanyTypeLevel_id
		,	@Order_id	:= CompanyTypeOrder_id
		,	@CallingProc_nm	:= CallingProc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= 'R'	-- This Table Is Restricted and Does Not Allow A Cascade From an FK Table.
		);
	END IF;
	#######################################################################
	-- Update NON-KEY values
	#######################################################################
	-- --------------------------------------------------------------------
	-- Invoke an UPDATE when a non-key attribute is actually modified.
	-- --------------------------------------------------------------------
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCompany
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
END	USP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `uspResource` */

/*!50003 DROP PROCEDURE IF EXISTS  `uspResource` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `uspResource`(
	Resrc_id		INT SIGNED		-- PK1 
,	Resrc_tp		VARCHAR(64)		-- PK2 AK1
,	Resrc_tx		MEDIUMTEXT	
,	ADD_dm		DATETIME	
,	ADD_nm		VARCHAR(128)	
,	UPD_dm		DATETIME	
,	UPD_nm		VARCHAR(128)	
,	DEL_dm		DATETIME	
,	DEL_nm		VARCHAR(128)	
,	ParentResrc_tp		VARCHAR(64)	
,	ResrcType_tx		MEDIUMTEXT	
,	Left_id		INT SIGNED	
,	Right_id		INT SIGNED	
,	Level_id		INT SIGNED	
,	Order_id		INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		uspResource
**	Type:		DB API procedure: Insert
**	Purpose:	To insert Resource data into tblResource
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	4/12/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResource';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'UPDATE';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'uspResource';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
USP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF CallingProc_nm IS NULL OR CallingProc_nm = '' THEN SET CallingProc_nm = '';	END IF;
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	IF Resrc_id IS NULL OR Resrc_id = 0 THEN SET Resrc_id =  -2147483647;	END IF;
	IF Resrc_tp IS NULL OR Resrc_tp = '' THEN SET Resrc_tp = '-2147483647';	END IF;
	IF Resrc_tx IS NULL OR Resrc_tx = '' THEN SET Resrc_tx = '-2147483647';	END IF;
	IF ADD_dm IS NULL OR ADD_dm = cast('' as datetime) THEN SET ADD_dm = '0000-00-00 00:00:00';	END IF;
	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = '-2147483647';	END IF;
	IF UPD_dm IS NULL OR UPD_dm = CAST('' AS DATETIME) THEN SET UPD_dm = '0000-00-00 00:00:00';	END IF;
	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = '-2147483647';	END IF;
	IF DEL_dm IS NULL OR DEL_dm = CAST('' AS DATETIME) THEN SET DEL_dm = '0000-00-00 00:00:00';	END IF;
	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = '-2147483647';	END IF;
	IF ParentResrc_tp IS NULL OR ParentResrc_tp = '' THEN SET ParentResrc_tp = '-2147483647';	END IF;
	IF ResrcType_tx IS NULL OR ResrcType_tx = '' THEN SET ResrcType_tx = '-2147483647';	END IF;
	IF Left_id IS NULL OR Left_id = 0 THEN SET Left_id =  -2147483647;	END IF;
	IF Right_id IS NULL OR Right_id = 0 THEN SET Right_id =  -2147483647;	END IF;
	IF Level_id IS NULL OR Level_id = 0 THEN SET Level_id =  -2147483647;	END IF;
	IF Order_id IS NULL OR Order_id = 0 THEN SET Order_id =  -2147483647;	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Return error if Primary Key TABLE record does NOT exist
	#######################################################################
	SET 	@PK1	= CONCAT(Resrc_id,",",Resrc_tp);
	-- --------------------------------------------------------------------
	CALL	rspResource
	(
		@Resrc_id	:= Resrc_id
	,	@Resrc_tp	:= Resrc_tp
	,	@Resrc_tx	:= Resrc_tx
	,	@ADD_dm		:= ADD_dm
	,	@ADD_nm		:= ADD_nm
	,	@UPD_dm		:= UPD_dm
	,	@UPD_nm		:= UPD_nm
	,	@DEL_dm		:= DEL_dm
	,	@DEL_nm		:= DEL_nm
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 0	-- If PK row does not exist then return with error
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errPKNotExist
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		,	@Key_nm		:= @PK1
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Validate attributes
	#######################################################################
	SET 	@ADD_dm	= ADD_dm;
	SET 	@ADD_nm	= ADD_nm;
	SET 	@UPD_dm	= UPD_dm;
	SET 	@UPD_nm	= UPD_nm;
	SET 	@DEL_dm	= DEL_dm;
	SET 	@DEL_nm	= DEL_nm;
	CALL	vspResource
	(
		@Resrc_id	:= Resrc_id
	,	@Resrc_tp	:= Resrc_tp
	,	@Resrc_tx	:= Resrc_tx
	,	@ADD_dm
	,	@ADD_nm
	,	@UPD_dm
	,	@UPD_nm
	,	@DEL_dm
	,	@DEL_nm
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= 'vspResource'
		);
		LEAVE	USP;
	END IF;
	SET 	ADD_dm	= @ADD_dm;
	SET 	ADD_nm	= @ADD_nm;
	SET 	UPD_dm	= @UPD_dm;
	SET 	UPD_nm	= @UPD_nm;
	SET 	DEL_dm	= @DEL_dm;
	SET 	DEL_nm	= @DEL_nm;
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET 	@FK1	= CONCAT(Resrc_tp);
	-- --------------------------------------------------------------------
	--
	--	RESTRICT MODE:	tblResourceType
	--
	IF
		Mode_cd	= 'R'
	THEN
		CALL	rspResourceType
		(
			@Resrc_tp	:= Resrc_tp
		,	@ParentResrc_tp	:= ParentResrc_tp
		,	@ResrcType_tx	:= ResrcType_tx
		,	@Left_id	:= Left_id
		,	@Right_id	:= Right_id
		,	@Level_id	:= Level_id
		,	@Order_id	:= Order_id
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblResourceType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= 'tblResourceType'
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= 'tblResourceType'
			);
			LEAVE	USP;
		END IF;
	END IF;
	--
	--	CASCADE MODE:	tblResourceType
	--
	IF
		Mode_cd	= 'C'
	THEN
		CALL	uspResourceType
		(
			@Resrc_tp	:= Resrc_tp
		,	@ParentResrc_tp	:= ParentResrc_tp
		,	@ResrcType_tx	:= ResrcType_tx
		,	@Left_id	:= Left_id
		,	@Right_id	:= Right_id
		,	@Level_id	:= Level_id
		,	@Order_id	:= Order_id
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= 'R'	-- This Table Is Restricted and Does Not Allow A Cascade From an FK Table.
		);
	END IF;
	#######################################################################
	-- Update NON-KEY values
	#######################################################################
	-- --------------------------------------------------------------------
	-- Invoke an UPDATE when a non-key attribute is actually modified.
	-- --------------------------------------------------------------------
	IF 	
	(
	 	Resrc_tx	= '-2147483647'
	AND 	ADD_dm		= '0000-00-00 00:00:00'
	AND 	ADD_nm		= '-2147483647'
	AND 	UPD_dm		= '0000-00-00 00:00:00'
	AND 	UPD_nm		= '-2147483647'
 	AND 	DEL_dm		= '0000-00-00 00:00:00'
 	AND 	DEL_nm		= '-2147483647'
	)
	THEN
		LEAVE 	USP;
	END IF;
	-- --------------------------------------------------------------------
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedEvent
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
	UPDATE
		tblResource
	SET	
		tblResource.Resrc_tx	=
		CASE
			WHEN	Resrc_tx	= '-2147483647'
			THEN	tblResource.Resrc_tx
			ELSE 	Resrc_tx
		END
	,	tblResource.ADD_dm	=
		CASE
			WHEN	ADD_dm	= '0000-00-00 00:00:00'
			THEN	tblResource.ADD_dm
			ELSE 	ADD_dm
		END
	,	tblResource.ADD_nm	=
		CASE
			WHEN	ADD_nm	= '-2147483647'
			THEN	tblResource.ADD_nm
			ELSE 	ADD_nm
		END
	,	tblResource.UPD_dm	=
		CASE
			WHEN	UPD_dm	= '0000-00-00 00:00:00'
			THEN	tblResource.UPD_dm
			ELSE 	UPD_dm
		END
	,	tblResource.UPD_nm	=
		CASE
			WHEN	UPD_nm	= '-2147483647'
			THEN	tblResource.UPD_nm
			ELSE 	UPD_nm
		END
	,	tblResource.DEL_dm	=
		CASE
			WHEN	DEL_dm	= '0000-00-00 00:00:00'
			THEN	tblResource.DEL_dm
			ELSE 	DEL_dm
		END
	,	tblResource.DEL_nm	=
		CASE
			WHEN	DEL_nm	= '-2147483647'
			THEN	tblResource.DEL_nm
			ELSE 	DEL_nm
		END
	WHERE
		tblResource.Resrc_id	= Resrc_id
	AND	tblResource.Resrc_tp	= Resrc_tp
	;
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
END USP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `uspResourceType` */

/*!50003 DROP PROCEDURE IF EXISTS  `uspResourceType` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `uspResourceType`(
	Resrc_tp		VARCHAR(64)		-- PK1 AK1
,	ParentResrc_tp		VARCHAR(64)	
,	ResrcType_tx		MEDIUMTEXT	
,	Left_id			INT SIGNED
,	Right_id		INT SIGNED	
,	Level_id		INT SIGNED	
,	Order_id		INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd	VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		uspResourceType
**	Type:		DB API procedure: Insert
**	Purpose:	To insert ResourceType data into tblResourceType
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	4/9/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResourceType';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'UPDATE';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'uspResourceType';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
USP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	IF Resrc_tp IS NULL OR Resrc_tp = '' THEN SET Resrc_tp = '-2147483647';	END IF;
	IF ParentResrc_tp IS NULL OR ParentResrc_tp = '' THEN SET ParentResrc_tp = '-2147483647';	END IF;
	IF ResrcType_tx IS NULL OR ResrcType_tx = '' THEN SET ResrcType_tx = '-2147483647';	END IF;
	IF Left_id IS NULL OR Left_id = 0 THEN SET Left_id =  -2147483647;	END IF;
	IF Right_id IS NULL OR Right_id = 0 THEN SET Right_id =  -2147483647;	END IF;
	IF Level_id IS NULL OR Level_id = 0 THEN SET Level_id =  -2147483647;	END IF;
	IF Order_id IS NULL OR Order_id = 0 THEN SET Order_id =  -2147483647;	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
	SET 	@PK1	= CONCAT(Resrc_tp);
	-- --------------------------------------------------------------------
	CALL	rspResourceType
	(
		@Resrc_tp	:= Resrc_tp
	,	@ParentResrc_tp	:= ParentResrc_tp
	,	@ResrcType_tx	:= ResrcType_tx
	,	@Left_id	:= Left_id
	,	@Right_id	:= Right_id
	,	@Level_id	:= Level_id
	,	@Order_id	:= Order_id
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 0	-- If PK row does not exist then return with error
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errPKNotExist
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		,	@Key_nm		:= @PK1
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Validate attributes
	#######################################################################
	CALL	vspResourceType
	(
		@Resrc_tp	:= Resrc_tp
	,	@ParentResrc_tp	:= ParentResrc_tp
	,	@ResrcType_tx	:= ResrcType_tx
	,	@Left_id	:= Left_id
	,	@Right_id	:= Right_id
	,	@Level_id	:= Level_id
	,	@Order_id	:= Order_id
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= Proc_nm
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET	@FK1	= CONCAT(ParentResrc_tp);
	-- --------------------------------------------------------------------
	--
	--	RESTRICT MODE:	tblResourceType
	--
	IF
		Mode_cd	= 'R'
	AND	ParentResrc_tp	<> '-2147483647'
	THEN
		CALL	rspResourceType
		(
			@Resrc_tp	:= ParentResrc_tp
		,	@ParentResrc_tp	:= ParentResrc_tp
		,	@ResrcType_tx	:= ResrcType_tx
		,	@Left_id	:= Left_id
		,	@Right_id	:= Right_id
		,	@Level_id	:= Level_id
		,	@Order_id	:= Order_id
		,	@Key_cd		:= @Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblResourceType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= SYSTABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= SYSTABLE
			);
			LEAVE	USP;
		END IF;
	END IF;
	--
	--	CASCADE MODE:	tblResourceType
	--
	IF
	(
		Mode_cd	= 'C'
	AND	ParentResrc_tp	<> '-2147483647'
	)
	THEN
		CALL	rspResourceType
		(
			@Resrc_tp	:= ParentResrc_tp
		,	@ParentResrc_tp	:= ParentResrc_tp
		,	@ResrcType_tx	:= ResrcType_tx
		,	@Left_id	:= Left_id
		,	@Right_id	:= Right_id
		,	@Level_id	:= Level_id
		,	@Order_id	:= Order_id
		,	@Key_cd		:= @Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblResourceType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= SYSTABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= SYSTABLE
			);
			LEAVE	USP;
		END IF;
	END IF;
	#######################################################################
	-- Update NON-KEY values
	#######################################################################
	-- --------------------------------------------------------------------
	-- Invoke an UPDATE when a non-key attribute is actually modified.
	-- --------------------------------------------------------------------
	IF 
	(
		ParentResrc_tp	= '-2147483647'
	AND	ResrcType_tx	= '-2147483647'
	AND	Left_id		= -2147483647
	AND	Right_id	= -2147483647
	AND	Level_id	= -2147483647
	AND	Order_id	= -2147483647
	)
	THEN
		LEAVE 	USP;
	END IF;
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedEvent
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
	UPDATE
		tblResourceType
	SET	
		tblResourceType.ParentResrc_tp	=
		CASE
			WHEN	ParentResrc_tp	= '-2147483647'
			THEN	tblResourceType.ParentResrc_tp
			ELSE 	ParentResrc_tp
		END
	,	tblResourceType.ResrcType_tx	=
		CASE
			WHEN	ResrcType_tx	= '-2147483647'
			THEN	tblResourceType.ResrcType_tx
			ELSE 	ResrcType_tx
		END
	,	tblResourceType.Left_id	=
		CASE
			WHEN	Left_id	= -2147483647
			THEN	tblResourceType.Left_id
			ELSE 	Left_id
		END
	,	tblResourceType.Right_id	=
		CASE
			WHEN	Right_id	= -2147483647
			THEN	tblResourceType.Right_id
			ELSE 	Right_id
		END
	,	tblResourceType.Level_id	=
		CASE
			WHEN	Level_id	= -2147483647
			THEN	tblResourceType.Level_id
			ELSE 	Level_id
		END
	,	tblResourceType.Order_id	=
		CASE
			WHEN	Order_id	= -2147483647
			THEN	tblResourceType.Order_id
			ELSE 	Order_id
		END
	WHERE
		tblResourceType.Resrc_tp	= Resrc_tp
	;
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
END USP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `uspResource_Company` */

/*!50003 DROP PROCEDURE IF EXISTS  `uspResource_Company` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `uspResource_Company`(
	Resrc_id	INT SIGNED		-- PK1 
,	Resrc_tp	VARCHAR(64)		-- PK2 AK1
,	Company_id	INT SIGNED		-- PK1 
,	Company_tp	VARCHAR(64)		-- PK2 AK1
,	Resrc_nm	VARCHAR(256)		--  AK2
,	Resrc_cd	VARCHAR(128)	
,	Alias_nm	VARCHAR(256)
,	Company_nm	VARCHAR(256)
,	Company_cd	VARCHAR(128)	
,	Resrc_tx	MEDIUMTEXT	
,	Company_tx	MEDIUMTEXT	
,	ADD_dm		DATETIME	
,	ADD_nm		VARCHAR(128)	
,	UPD_dm		DATETIME	
,	UPD_nm		VARCHAR(128)	
,	DEL_dm		DATETIME	
,	DEL_nm		VARCHAR(128)	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		uspResource_Company
**	Type:		DB API procedure: Insert
**	Purpose:	To insert Resource data into tblResource_Company
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	4/12/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResource_Company';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'UPDATE';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'uspResource_Company';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
DECLARE	PK1		VARCHAR(255) DEFAULT CONCAT(Resrc_id,",",Resrc_tp,",",Company_id,",",Company_tp);
DECLARE	FK1		VARCHAR(255) DEFAULT CONCAT(Resrc_tp,",",Company_tp);
DECLARE	FK2		VARCHAR(255) DEFAULT CONCAT(Resrc_id,",",Resrc_tp);
DECLARE	FK3		VARCHAR(255) DEFAULT CONCAT(Company_id,",",Company_tp);
DECLARE	AK1		VARCHAR(255) DEFAULT CONCAT(Resrc_tp,",",Company_id,",",Company_tp,",",Resrc_nm);
DECLARE	AK2		VARCHAR(255) DEFAULT CONCAT(Resrc_tp,",",Company_tp,",",Company_nm,",",Resrc_nm);
###############################################################################
usp:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF CallingProc_nm IS NULL OR CallingProc_nm = '' THEN SET CallingProc_nm = '';	END IF;
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	IF Resrc_id IS NULL OR Resrc_id = 0 THEN SET Resrc_id =  -2147483647;	END IF;
	IF Resrc_tp IS NULL OR Resrc_tp = '' THEN SET Resrc_tp = '-2147483647';	END IF;
	IF Company_id IS NULL OR Company_id = 0 THEN SET Company_id =  -2147483647;	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = '-2147483647';	END IF;
	IF Resrc_nm IS NULL OR Resrc_nm = '' THEN SET Resrc_nm = '-2147483647';	END IF;
	IF Resrc_cd IS NULL OR Resrc_cd = '' THEN SET Resrc_cd = '-2147483647';	END IF;
	IF Alias_nm IS NULL OR Alias_nm = '' THEN SET Alias_nm = '-2147483647';	END IF;
	IF Company_nm IS NULL OR Company_nm = '' THEN SET Company_nm = '-2147483647';	END IF;
	IF Company_cd IS NULL OR Company_cd = '' THEN SET Company_cd = '-2147483647';	END IF;
	IF Resrc_tx IS NULL OR Resrc_tx = '' THEN SET Resrc_tx = '-2147483647';	END IF;
	IF Company_tx IS NULL OR Company_tx = '' THEN SET Company_tx = '-2147483647';	END IF;
	IF ADD_dm IS NULL THEN SET ADD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = '-2147483647';	END IF;
	IF UPD_dm IS NULL THEN SET UPD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = '-2147483647';	END IF;
	IF DEL_dm IS NULL THEN SET DEL_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = '-2147483647';	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= 'tblResource_Company'
		);
		LEAVE	usp;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
	CALL	rspResource_Company
	(
		@Resrc_id	:= Resrc_id
	,	@Resrc_tp	:= Resrc_tp
	,	@Company_id	:= Company_id
	,	@Company_tp	:= Company_tp
	,	@Resrc_nm	:= NULL
	,	@Resrc_cd	:= NULL
	,	@Alias_nm	:= NULL
	,	@ADD_dm	:= ADD_dm
	,	@ADD_nm	:= ADD_nm
	,	@UPD_dm	:= UPD_dm
	,	@UPD_nm	:= UPD_nm
	,	@DEL_dm	:= DEL_dm
	,	@DEL_nm	:= DEL_nm
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 0	-- If PK row dows not exists then return with error
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errPKNotExist
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		,	@Key_nm		:= @PK1
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Validate attributes
	#######################################################################
	SET 	@ADD_dm	= ADD_dm;
	SET 	@ADD_nm	= ADD_nm;
	SET 	@UPD_dm	= UPD_dm;
	SET 	@UPD_nm	= UPD_nm;
	SET 	@DEL_dm	= DEL_dm;
	SET 	@DEL_nm	= DEL_nm;
	CALL	vspResource_Company
	(
		@Resrc_id	:= Resrc_id
	,	@Resrc_tp	:= Resrc_tp
	,	@Company_id	:= Company_id
	,	@Company_tp	:= Company_tp
	,	@Resrc_nm	:= Resrc_nm
	,	@Resrc_cd	:= Resrc_cd
	,	@Alias_nm	:= Alias_nm	
	,	@ADD_dm
	,	@ADD_nm
	,	@UPD_dm
	,	@UPD_nm
	,	@DEL_dm
	,	@DEL_nm
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= 'vspResource_Company'
		);
		LEAVE	usp;
	END IF;
	SET 	ADD_dm	= @ADD_dm;
	SET 	ADD_nm	= @ADD_nm;
	SET 	UPD_dm	= @UPD_dm;
	SET 	UPD_nm	= @UPD_nm;
	SET 	DEL_dm	= @DEL_dm;
	SET 	DEL_nm	= @DEL_nm;
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET	@FK1	= CONCAT(Resrc_tp,",",Company_tp);
	SET	@FK2	= CONCAT(IFNULL(Resrc_id,"(null)"),",",Resrc_tp);
	SET 	@FK3	= CONCAT(IFNULL(Company_id,"(null)"),",",Company_tp);
	--
	--	RESTRICT MODE:
	--
	IF
		Mode_cd	= 'R'
	THEN
		SET 	@TABLE	= "tblResourceType_CompanyType";
		CALL	rspResourceType_CompanyType
		(
			@Resrc_tp	:= Resrc_tp
		,	@Company_tp	:= Company_tp
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	usp;
		END IF;
		SET 	@TABLE	= "tblCompany";
		CALL	rspCompany
		(
			@Company_id	:= Company_id
		,	@Company_tp	:= Company_tp
		,	@Company_nm	:= Company_nm
		,	@Company_cd	:= Company_cd
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK3
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	usp;
		END IF;
		SET 	@TABLE	= "tblResource";
		CALL	rspResource
		(
			@Resrc_id	:= Resrc_id
		,	@Resrc_tp	:= Resrc_tp
		,	@Resrc_tx	:= Resrc_tx
		,	@ADD_dm	:= ADD_dm
		,	@ADD_nm	:= ADD_nm
		,	@UPD_dm	:= UPD_dm
		,	@UPD_nm	:= UPD_nm
		,	@DEL_dm	:= DEL_dm
		,	@DEL_nm	:= DEL_nm
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK2
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	usp;
		END IF;
	END IF;
	--
	--	CASCADE MODE:
	--
	IF
		Mode_cd	= 'C'
	THEN
		--	-------------------------------------------------------
		SET 	@TABLE	= "tblCompany";
		--	-------------------------------------------------------
		CALL	uspCompany
		(
			@Company_id		:= Company_id
		,	@Company_tp		:= Company_tp
		,	@Company_nm		:= Company_nm
		,	@Company_cd		:= Company_cd
		,	@Company_tx		:= Company_tx
		,	@CompanyADD_dm		:= ADD_dm
		,	@CompanyADD_nm		:= ADD_nm
		,	@CompanyUPD_dm		:= UPD_dm
		,	@CompanyUPD_nm		:= UPD_dm
		,	@CompanyDEL_dm		:= DEL_dm
		,	@CompanyDEL_nm		:= DEL_nm
		,	@ParentCompany_tp	:= NULL
		,	@CompanyType_tx		:= NULL
		,	@CompanyLeft_id		:= NULL
		,	@CompanyRight_id	:= NULL
		,	@CompanyLevel_id	:= NULL
		,	@CompanyOrder_id	:= NULL
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		);
		--	-------------------------------------------------------
		SET 	@TABLE	= "tblResource";
		--	-------------------------------------------------------
		CALL	uspResource
		(
			@Resrc_id	:= Resrc_id
		,	@Resrc_tp	:= Resrc_tp
		,	@Resrc_tx	:= Resrc_tx
		,	@ADD_dm		:= ADD_dm
		,	@ADD_nm		:= ADD_nm
		,	@UPD_dm		:= UPD_dm
		,	@UPD_nm		:= UPD_nm
		,	@DEL_dm		:= DEL_dm
		,	@DEL_nm		:= DEL_nm
		,	@ParentResrc_tp	:= NULL
		,	@ResrcType_tx	:= NULL
		,	@Left_id	:= NULL
		,	@Right_id	:= NULL
		,	@Level_id	:= NULL
		,	@Order_id	:= NULL
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		);
		--	-------------------------------------------------------
		--	-------------------------------------------------------
	END IF;
	#######################################################################
	-- Update NON-KEY values
	#######################################################################
	-- --------------------------------------------------------------------
	-- Invoke an UPDATE when a non-key attribute if actually modified.
	-- --------------------------------------------------------------------
	IF
		Resrc_nm	= '-2147483647'
	AND	Resrc_cd	= '-2147483647'
	AND	Alias_nm	= '-2147483647'
-- 	AND	ADD_dm	= '0000-00-00 00:00:00'
-- 	AND	ADD_nm	= '-2147483647'
	AND	UPD_dm	= '0000-00-00 00:00:00'
	AND	UPD_nm	= '-2147483647'
	AND	DEL_dm	= '0000-00-00 00:00:00'
	AND	DEL_nm	= '-2147483647'
	THEN
		LEAVE	USP;
	END IF;
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedEvent
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
	UPDATE
		tblResource_Company
	SET
		tblResource_Company.Resrc_nm	= 
		CASE
			WHEN	Resrc_nm	= '-2147483647'
			THEN	tblResource_Company.Resrc_nm
			ELSE 	Resrc_nm
		END
	,	tblResource_Company.Resrc_cd	= 
		CASE
			WHEN	Resrc_cd	= '-2147483647'
			THEN	tblResource_Company.Resrc_cd
			ELSE 	Resrc_cd
		END
	,	tblResource_Company.Alias_nm	=
		CASE
			WHEN	Alias_nm	= '-2147483647'
			THEN	tblResource_Company.Alias_nm
			ELSE 	Alias_nm
		END
	,	tblResource_Company.UPD_dm	=
		CASE
			WHEN	UPD_dm	= '0000-00-00 00:00:00'
			THEN	tblResource_Company.UPD_dm
			ELSE 	UPD_dm
		END
	,	tblResource_Company.UPD_nm	=
		CASE
			WHEN	UPD_nm	= '-2147483647'
			THEN	tblResource_Company.UPD_nm
			ELSE 	UPD_nm
		END
	,	tblResource_Company.DEL_dm	=
		CASE
			WHEN	DEL_dm	= '0000-00-00 00:00:00'
			THEN	tblResource_Company.DEL_dm
			ELSE 	DEL_dm
		END
	,	tblResource_Company.DEL_nm	=
		CASE
			WHEN	DEL_nm	= '-2147483647'
			THEN	tblResource_Company.DEL_nm
			ELSE 	DEL_nm
		END
	WHERE	1=1
	AND
		tblResource_Company.Resrc_id	= Resrc_id
	AND	tblResource_Company.Resrc_tp	= Resrc_tp
	AND	tblResource_Company.Company_id	= Company_id
	AND	tblResource_Company.Company_tp	= Company_tp
	;
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
END usp;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `uspResource_Contact` */

/*!50003 DROP PROCEDURE IF EXISTS  `uspResource_Contact` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `uspResource_Contact`(
	Resrc_id	INT SIGNED		-- PK1 
,	Resrc_tp	VARCHAR(64)		-- PK2 AK1
,	Contact_id	INT SIGNED		-- PK1 
,	Contact_tp	VARCHAR(64)		-- PK2 AK1
,	Contact_nm	VARCHAR(256)		--  AK2
,	Contact_cd	VARCHAR(128)	
,	Alias_nm	VARCHAR(256)
,	Address_nm	VARCHAR(256)
,	City_cd		VARCHAR(128)
,	State_cd	VARCHAR(128)
,	Zip_cd		VARCHAR(128)
,	Phone_cd	VARCHAR(128)
,	GPS_cd		VARCHAR(128)
,	Resrc_tx	MEDIUMTEXT	
,	Contact_tx	MEDIUMTEXT	
,	ADD_dm		DATETIME	
,	ADD_nm		VARCHAR(128)	
,	UPD_dm		DATETIME	
,	UPD_nm		VARCHAR(128)	
,	DEL_dm		DATETIME	
,	DEL_nm		VARCHAR(128)	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		uspResource_Contact
**	Type:		DB API procedure: Insert
**	Purpose:	To insert Resource data into tblResource_Contact
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	4/12/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResource_Contact';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'UPDATE';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'uspResource_Contact';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
usp:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF CallingProc_nm IS NULL OR CallingProc_nm = '' THEN SET CallingProc_nm = '';	END IF;
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	IF Resrc_id IS NULL OR Resrc_id = 0 THEN SET Resrc_id =  -2147483647;	END IF;
	IF Resrc_tp IS NULL OR Resrc_tp = '' THEN SET Resrc_tp = '-2147483647';	END IF;
	IF Contact_id IS NULL OR Contact_id = 0 THEN SET Contact_id =  -2147483647;	END IF;
	IF Contact_tp IS NULL OR Contact_tp = '' THEN SET Contact_tp = '-2147483647';	END IF;
	IF Contact_nm IS NULL OR Contact_nm = '' THEN SET Contact_nm = '-2147483647';	END IF;
	IF Contact_cd IS NULL OR Contact_cd = '' THEN SET Contact_cd = '-2147483647';	END IF;
	IF Alias_nm IS NULL OR Alias_nm = '' THEN SET Alias_nm = '-2147483647';	END IF;
	IF Address_nm IS NULL OR Address_nm = '' THEN SET Address_nm = '-2147483647';	END IF;
	IF City_cd IS NULL OR City_cd = '' THEN SET City_cd = '-2147483647';	END IF;
	IF State_cd IS NULL OR State_cd = '' THEN SET State_cd = '-2147483647';	END IF;
	IF ZIP_cd IS NULL OR ZIP_cd = '' THEN SET ZIP_cd = '-2147483647';	END IF;
	IF Phone_cd IS NULL OR Phone_cd = '' THEN SET Phone_cd = '-2147483647';	END IF;
	IF GPS_cd IS NULL OR GPS_cd = '' THEN SET GPS_cd = '-2147483647';	END IF;
	IF Resrc_tx IS NULL OR Resrc_tx = '' THEN SET Resrc_tx = '-2147483647';	END IF;
	IF Contact_tx IS NULL OR Contact_tx = '' THEN SET Contact_tx = '-2147483647';	END IF;
	IF ADD_dm IS NULL THEN SET ADD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = '-2147483647';	END IF;
	IF UPD_dm IS NULL THEN SET UPD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = '-2147483647';	END IF;
	IF DEL_dm IS NULL THEN SET DEL_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = '-2147483647';	END IF;
	set	@PK1	= CONCAT(IFNULL(Resrc_id,"(null)"),",",Resrc_tp,",",IFNULL(Contact_id,"(null)"),",",Contact_tp);
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= 'tblResource_Contact'
		);
		LEAVE	usp;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
	CALL	rspResource_Contact
	(
		@Resrc_id	:= Resrc_id
	,	@Resrc_tp	:= Resrc_tp
	,	@Contact_id	:= Contact_id
	,	@Contact_tp	:= Contact_tp
	,	@Contact_nm	:= NULL
	,	@Contact_cd	:= NULL
	,	@Alias_nm	:= NULL
	,	@Address_nm	:= Address_nm
	,	@City_cd	:= City_cd
	,	@State_cd	:= State_cd
	,	@Zip_cd		:= Zip_cd
	,	@Phone_cd	:= Phone_cd
	,	@GPS_cd		:= GPS_cd
	,	@ADD_dm	:= ADD_dm
	,	@ADD_nm	:= ADD_nm
	,	@UPD_dm	:= UPD_dm
	,	@UPD_nm	:= UPD_nm
	,	@DEL_dm	:= DEL_dm
	,	@DEL_nm	:= DEL_nm
	,	@Key_cd	:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 0	-- If PK row dows not exists then return with error
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errPKNotExist
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		,	@Key_nm		:= @PK1
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Validate attributes
	#######################################################################
	SET 	@ADD_dm	= ADD_dm;
	SET 	@ADD_nm	= ADD_nm;
	SET 	@UPD_dm	= UPD_dm;
	SET 	@UPD_nm	= UPD_nm;
	SET 	@DEL_dm	= DEL_dm;
	SET 	@DEL_nm	= DEL_nm;
	CALL	vspResource_Contact
	(
		@Resrc_id	:= Resrc_id
	,	@Resrc_tp	:= Resrc_tp
	,	@Contact_id	:= Contact_id
	,	@Contact_tp	:= Contact_tp
	,	@Contact_nm	:= Contact_nm
	,	@Contact_cd	:= Contact_cd
	,	@Alias_nm	:= Alias_nm
	,	@Address_nm	:= Address_nm
	,	@City_cd	:= City_cd
	,	@State_cd	:= State_cd
	,	@Zip_cd		:= Zip_cd
	,	@Phone_cd	:= Phone_cd
	,	@GPS_cd		:= GPS_cd
	,	@ADD_dm
	,	@ADD_nm
	,	@UPD_dm
	,	@UPD_nm
	,	@DEL_dm
	,	@DEL_nm
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= 'vspResource_Contact'
		);
		LEAVE	usp;
	END IF;
	SET 	ADD_dm	= @ADD_dm;
	SET 	ADD_nm	= @ADD_nm;
	SET 	UPD_dm	= @UPD_dm;
	SET 	UPD_nm	= @UPD_nm;
	SET 	DEL_dm	= @DEL_dm;
	SET 	DEL_nm	= @DEL_nm;
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET	@FK1	= CONCAT(Resrc_tp);
	SET	@FK2	= CONCAT(Contact_tp);
	SET	@FK3	= CONCAT(IFNULL(Resrc_id,"(null)"),",",Resrc_tp);
	SET	@FK4	= CONCAT(IFNULL(Contact_id,"(null)"),",",Contact_tp);
	SET	@AK1	= CONCAT(IFNULL(Resrc_id,"(null)"),",",Resrc_tp,",",Contact_tp);
	--
	--	RESTRICT MODE:
	--
	IF
		Mode_cd	= 'R'
	THEN
		SET 	@TABLE	= "tblResourceType";
		CALL	rspResourceType
		(
			@Resrc_tp	:= Resrc_tp
		,	@ParentResrc_tp	:= NULL
		,	@ResrcType_tx	:= NULL
		,	@Left_id	:= NULL
		,	@Right_id	:= NULL
		,	@Level_id	:= NULL
		,	@Order_id	:= NULL
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	usp;
		END IF;
		SET 	@TABLE	= "tblContactType";
		CALL	rspContactType
		(
			@Contact_tp	:= Contact_tp
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK2
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	usp;
		END IF;
		SET 	@TABLE	= "tblResource";
		CALL	rspResource
		(
			@Resrc_id	:= Resrc_id
		,	@Resrc_tp	:= Resrc_tp
		,	@Resrc_tx	:= Resrc_tx
		,	@ADD_dm	:= ADD_dm
		,	@ADD_nm	:= ADD_nm
		,	@UPD_dm	:= UPD_dm
		,	@UPD_nm	:= UPD_nm
		,	@DEL_dm	:= DEL_dm
		,	@DEL_nm	:= DEL_nm
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK3
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	usp;
		END IF;
		SET 	@TABLE	= "tblResource";	-- Contact
		CALL	rspResource
		(
			@Resrc_id	:= Contact_id
		,	@Resrc_tp	:= Contact_tp
		,	@Resrc_tx	:= Contact_tx
		,	@ADD_dm	:= ADD_dm
		,	@ADD_nm	:= ADD_nm
		,	@UPD_dm	:= UPD_dm
		,	@UPD_nm	:= UPD_nm
		,	@DEL_dm	:= DEL_dm
		,	@DEL_nm	:= DEL_nm
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK4
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	usp;
		END IF;
	END IF;
	--
	--	CASCADE MODE:
	--
	IF
		Mode_cd	= 'C'
	THEN
		--	-------------------------------------------------------
		SET 	@TABLE	= "tblResource";	-- Contact
		--	-------------------------------------------------------
		CALL	uspResource
		(
			@Resrc_id	:= Contact_id
		,	@Resrc_tp	:= Contact_tp
		,	@Resrc_tx	:= Contact_tx
		,	@ADD_dm		:= ADD_dm
		,	@ADD_nm		:= ADD_nm
		,	@UPD_dm		:= UPD_dm
		,	@UPD_nm		:= UPD_nm
		,	@DEL_dm		:= DEL_dm
		,	@DEL_nm		:= DEL_nm
		,	@ParentResrc_tp	:= NULL
		,	@ResrcType_tx	:= NULL
		,	@Left_id	:= NULL
		,	@Right_id	:= NULL
		,	@Level_id	:= NULL
		,	@Order_id	:= NULL
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		);
		--	-------------------------------------------------------
		SET 	@TABLE	= "tblResource";
		--	-------------------------------------------------------
		CALL	uspResource
		(
			@Resrc_id	:= Resrc_id
		,	@Resrc_tp	:= Resrc_tp
		,	@Resrc_tx	:= Resrc_tx
		,	@ADD_dm		:= ADD_dm
		,	@ADD_nm		:= ADD_nm
		,	@UPD_dm		:= UPD_dm
		,	@UPD_nm		:= UPD_nm
		,	@DEL_dm		:= DEL_dm
		,	@DEL_nm		:= DEL_nm
		,	@ParentResrc_tp	:= NULL
		,	@ResrcType_tx	:= NULL
		,	@Left_id	:= NULL
		,	@Right_id	:= NULL
		,	@Level_id	:= NULL
		,	@Order_id	:= NULL
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		);
		--	-------------------------------------------------------
		--	-------------------------------------------------------
	END IF;
	#######################################################################
	-- Update NON-KEY values
	#######################################################################
	-- --------------------------------------------------------------------
	-- Invoke an UPDATE when a non-key attribute is actually modified.
	-- --------------------------------------------------------------------
	IF
		Contact_nm	= '-2147483647'
	AND	Contact_cd	= '-2147483647'
	AND	Alias_nm	= '-2147483647'
	AND	Address_nm	= '-2147483647'
	AND	City_cd		= '-2147483647'
	AND	State_cd	= '-2147483647'
	AND	ZIP_cd		= '-2147483647'
	AND	Phone_cd	= '-2147483647'
	AND	GPS_cd	= '-2147483647'
-- 	AND	ADD_dm	= '0000-00-00 00:00:00'
-- 	AND	ADD_nm	= '-2147483647'
	AND	UPD_dm	= '0000-00-00 00:00:00'
	AND	UPD_nm	= '-2147483647'
	AND	DEL_dm	= '0000-00-00 00:00:00'
	AND	DEL_nm	= '-2147483647'
	THEN
		LEAVE	USP;
	END IF;
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedEvent
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
	UPDATE
		tblResource_Contact
	SET
		tblResource_Contact.Contact_nm	= 
		CASE
			WHEN	Contact_nm	= '-2147483647'
			THEN	tblResource_Contact.Contact_nm
			ELSE 	Contact_nm
		END
	,	tblResource_Contact.Contact_cd	= 
		CASE
			WHEN	Contact_cd	= '-2147483647'
			THEN	tblResource_Contact.Contact_cd
			ELSE 	Contact_cd
		END
	,	tblResource_Contact.Alias_nm	=
		CASE
			WHEN	Alias_nm	= '-2147483647'
			THEN	tblResource_Contact.Alias_nm
			ELSE 	Alias_nm
		END
	,	tblResource_Contact.Address_nm	=
		CASE
			WHEN	Address_nm	= '-2147483647'
			THEN	tblResource_Contact.Address_nm
			ELSE 	Address_nm
		END
	,	tblResource_Contact.City_cd	=
		CASE
			WHEN	City_cd	= '-2147483647'
			THEN	tblResource_Contact.City_cd
			ELSE 	City_cd
		END
	,	tblResource_Contact.State_cd	=
		CASE
			WHEN	State_cd	= '-2147483647'
			THEN	tblResource_Contact.State_cd
			ELSE 	State_cd
		END
	,	tblResource_Contact.ZIP_cd	=
		CASE
			WHEN	ZIP_cd	= '-2147483647'
			THEN	tblResource_Contact.ZIP_cd
			ELSE 	ZIP_cd
		END
	,	tblResource_Contact.Phone_cd	=
		CASE
			WHEN	Phone_cd	= '-2147483647'
			THEN	tblResource_Contact.Phone_cd
			ELSE 	Phone_cd
		END
	,	tblResource_Contact.GPS_cd	=
		CASE
			WHEN	GPS_cd	= '-2147483647'
			THEN	tblResource_Contact.GPS_cd
			ELSE 	GPS_cd
		END
	,	tblResource_Contact.UPD_dm	=
		CASE
			WHEN	UPD_dm	= '0000-00-00 00:00:00'
			THEN	tblResource_Contact.UPD_dm
			ELSE 	UPD_dm
		END
	,	tblResource_Contact.UPD_nm	=
		CASE
			WHEN	UPD_nm	= '-2147483647'
			THEN	tblResource_Contact.UPD_nm
			ELSE 	UPD_nm
		END
	,	tblResource_Contact.DEL_dm	=
		CASE
			WHEN	DEL_dm	= '0000-00-00 00:00:00'
			THEN	tblResource_Contact.DEL_dm
			ELSE 	DEL_dm
		END
	,	tblResource_Contact.DEL_nm	=
		CASE
			WHEN	DEL_nm	= '-2147483647'
			THEN	tblResource_Contact.DEL_nm
			ELSE 	DEL_nm
		END
	WHERE	1=1
	AND
		tblResource_Contact.Resrc_id	= Resrc_id
	AND	tblResource_Contact.Resrc_tp	= Resrc_tp
	AND	tblResource_Contact.Contact_id	= Contact_id
	AND	tblResource_Contact.Contact_tp	= Contact_tp
	;
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
END usp;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `uspUser` */

/*!50003 DROP PROCEDURE IF EXISTS  `uspUser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUser`(
	User_id		INT SIGNED		-- PK1 
,	User_tp		VARCHAR(64)		-- PK2 AK1
,	User_nm		VARCHAR(256)		--  AK2
,	User_cd		VARCHAR(128)	
,	Hashed_cd	VARCHAR(128)
,	Person_nm	VARCHAR(256)
,	Email_nm	VARCHAR(256)
,	Challenge_cd	VARCHAR(128)
,	Response_cd	VARCHAR(128)
,	User_tx		MEDIUMTEXT	
,	UserADD_dm	DATETIME	
,	UserADD_nm	VARCHAR(256)	
,	UserUPD_dm	DATETIME	
,	UserUPD_nm	VARCHAR(256)	
,	UserDEL_dm	DATETIME	
,	UserDEL_nm	VARCHAR(256)	
,	ParentUser_tp	VARCHAR(64)	
,	UserType_tx	MEDIUMTEXT	
,	UserTypeLeft_id	INT SIGNED	
,	UserTypeRight_id	INT SIGNED	
,	UserTypeLevel_id	INT SIGNED	
,	UserTypeOrder_id	INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		uspUser
**	Type:		DB API procedure: Insert
**	Purpose:	To update User data in tblUser
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	6/14/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblUser';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'UPDATE';
DECLARE	Proc_nm		VARCHAR(255) DEFAULT 'uspUser';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
USP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	IF User_id IS NULL OR User_id = 0 THEN SET User_id =  -2147483647;	END IF;
	IF User_tp IS NULL OR User_tp = '' THEN SET User_tp = '-2147483647';	END IF;
	IF User_nm IS NULL OR User_nm = '' THEN SET User_nm = '-2147483647';	END IF;
	IF User_cd IS NULL OR User_cd = '' THEN SET User_cd = '-2147483647';	END IF;
	IF Hashed_cd IS NULL OR Hashed_cd = '' THEN SET Hashed_cd = '-2147483647';	END IF;
	IF Person_nm IS NULL OR Person_nm = '' THEN SET Person_nm = '-2147483647';	END IF;
	IF Email_nm IS NULL OR Email_nm = '' THEN SET User_cd = '-2147483647';	END IF;
	IF Challenge_cd IS NULL OR Challenge_cd = '' THEN SET Challenge_cd = '-2147483647';	END IF;
	IF Response_cd IS NULL OR Response_cd = '' THEN SET Response_cd = '-2147483647';	END IF;
	IF User_tx IS NULL OR User_tx = '' THEN SET User_tx = '-2147483647';	END IF;
	IF UserADD_dm IS NULL OR UserADD_dm = '' THEN SET UserADD_dm = '0000-00-00 00:00:00';	END IF;
	IF UserADD_nm IS NULL OR UserADD_nm = '' THEN SET UserADD_nm = '-2147483647';	END IF;
	IF UserUPD_dm IS NULL OR UserUPD_dm = '' THEN SET UserUPD_dm = '0000-00-00 00:00:00';	END IF;
	IF UserUPD_nm IS NULL OR UserUPD_nm = '' THEN SET UserUPD_nm = '-2147483647';	END IF;
	IF UserDEL_dm IS NULL OR UserDEL_dm = '' THEN SET UserDEL_dm = '0000-00-00 00:00:00';	END IF;
	IF UserDEL_nm IS NULL OR UserDEL_nm = '' THEN SET UserDEL_nm = '-2147483647';	END IF;
	IF ParentUser_tp IS NULL OR ParentUser_tp = '' THEN SET ParentUser_tp = '-2147483647';	END IF;
	IF UserType_tx IS NULL OR UserType_tx = '' THEN SET UserType_tx = '-2147483647';	END IF;
	IF UserTypeLeft_id IS NULL OR UserTypeLeft_id = 0 THEN SET UserTypeLeft_id =  -2147483647;	END IF;
	IF UserTypeRight_id IS NULL OR UserTypeRight_id = 0 THEN SET UserTypeRight_id =  -2147483647;	END IF;
	IF UserTypeLevel_id IS NULL OR UserTypeLevel_id = 0 THEN SET UserTypeLevel_id =  -2147483647;	END IF;
	IF UserTypeOrder_id IS NULL OR UserTypeOrder_id = 0 THEN SET UserTypeOrder_id =  -2147483647;	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Return error if Primary Key TABLE record does NOT exist
	#######################################################################
	SET 	@PK1	= CONCAT(User_id,",",User_tp);
	-- --------------------------------------------------------------------
	CALL	rspUser
	(
		@User_id	:= User_id
	,	@User_tp	:= User_tp
	,	@User_nm	:= User_nm
	,	@User_cd	:= User_cd
	,	@Hashed_cd	:= Hashed_cd
	,	@Person_nm	:= Person_nm
	,	@Email_nm	:= Email_nm
	,	@Challenge_cd	:= Challenge_cd
	,	@Response_cd	:= Response_cd
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 0	-- If PK row does not exist then return with error
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errPKNotExist
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		,	@Key_nm		:= @PK1
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Validate attributes
	#######################################################################
	--	Set the VSP INOUT parameters to the proc IN parameters
	-- --------------------------------------------------------------------
	CALL	vspUser
	(
		@User_id	:= User_id
	,	@User_tp	:= User_tp
	,	@User_nm	:= User_nm
	,	@User_cd	:= User_cd
	,	@Hashed_cd	:= Hashed_cd
	,	@Person_nm	:= Person_nm
	,	@Email_nm	:= Email_nm
	,	@Challenge_cd	:= Challenge_cd
	,	@Response_cd	:= Response_cd
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= Proc_nm
		);
		LEAVE	USP;
	END IF;
	--	Set the proc IN parameters to the VSP INOUT parameters
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET 	@FK1	= CONCAT(User_tp);
	SET 	@FK2	= CONCAT(User_id,",",User_tp);
	-- --------------------------------------------------------------------
	IF
		Mode_cd	= 'R'
	THEN
		--
		--	RESTRICT MODE:	tblUserType
		--
		CALL	rspUserType
		(
			@User_tp	:= User_tp
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblUserType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= 'tblUserType'
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= 'tblUserType'
			);
			LEAVE	USP;
		END IF;
		--
		--	RESTRICT MODE:	tblResource
		--
		CALL	rspResource
		(
			@Resrc_id	:= User_id
		,	@Resrc_tp	:= User_tp
		,	@Resrc_tx	:= User_tx
		,	@ADD_dm		:= UserADD_dm
		,	@ADD_nm		:= UserADD_nm
		,	@UPD_dm		:= UserUPD_dm
		,	@UPD_nm		:= UserUPD_nm
		,	@DEL_dm		:= UserDEL_dm
		,	@DEL_nm		:= UserDEL_nm
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblResource not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= 'tblResource'
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK2
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= 'tblResource'
			);
			LEAVE	USP;
		END IF;
	END IF;
	-- --------------------------------------------------------------------
	-- --------------------------------------------------------------------
	IF
		Mode_cd	= 'C'
	THEN
		--
		--	CASCADE MODE:	tblUserType
		--
		CALL	uspUserType
		(
			@User_tp		:= User_tp
		,	@ParentUser_tp	:= ParentUser_tp
		,	@UserType_tx		:= UserType_tx
		,	@UserTypeLeft_id	:= UserTypeLeft_id
		,	@UserTypeRight_id	:= UserTypeRight_id
		,	@UserTypeLevel_id	:= UserTypeLevel_id
		,	@UserTypeOrder_id	:= UserTypeOrder_id
		,	@CallingProc_nm	:= CallingProc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= 'R'	-- This Table Is Restricted and Does Not Allow A Cascade From an FK Table.
		);
		--
		--	CASCADE MODE:	tblResource
		--
		CALL	uspResource
		(
			@Resrc_id	:= User_id
		,	@Resrc_tp	:= User_tp
		,	@Resrc_tx	:= User_tx
		,	@ADD_dm		:= UserADD_dm
		,	@ADD_nm		:= UserADD_nm
		,	@UPD_dm		:= UserUPD_dm
		,	@UPD_nm		:= UserUPD_nm
		,	@DEL_dm		:= UserDEL_dm
		,	@DEL_nm		:= UserDEL_nm
		,	@ParentResrc_tp	:= ParentUser_tp
		,	@ResrcType_tx	:= UserType_tx
		,	@Left_id	:= UserTypeLeft_id
		,	@Right_id	:= UserTypeRight_id
		,	@Level_id	:= UserTypeLevel_id
		,	@Order_id	:= UserTypeOrder_id
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		);
	END IF;
	#######################################################################
	-- Update NON-KEY values
	#######################################################################
	-- --------------------------------------------------------------------
	-- Invoke an UPDATE when a non-key attribute is actually modified.
	-- --------------------------------------------------------------------
	IF 	
		User_nm	= '-2147483647'
	AND 	User_cd	= '-2147483647'
	AND 	Hashed_cd	= '-2147483647'
	AND 	Person_nm	= '-2147483647'
	AND 	Email_nm	= '-2147483647'
	AND 	Challenge_cd	= '-2147483647'
	AND 	Response_cd	= '-2147483647'
	THEN
		LEAVE 	USP;
	END IF;
	-- --------------------------------------------------------------------
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedEvent
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
	UPDATE
		tblUser
	SET	
		tblUser.User_nm	=
		CASE
			WHEN	User_nm	= '-2147483647'
			THEN	tblUser.User_nm
			ELSE 	User_nm
		END
	,	tblUser.User_cd	=
		CASE
			WHEN	User_cd	= '-2147483647'
			THEN	tblUser.User_cd
			ELSE 	User_cd
		END
	,	tblUser.Hashed_cd	=
		CASE
			WHEN	Hashed_cd	= '-2147483647'
			THEN	tblUser.Hashed_cd
			ELSE 	Hashed_cd
		END
	,	tblUser.Person_nm	=
		CASE
			WHEN	Person_nm	= '-2147483647'
			THEN	tblUser.Person_nm
			ELSE 	Person_nm
		END
	,	tblUser.Email_nm	=
		CASE
			WHEN	Email_nm	= '-2147483647'
			THEN	tblUser.Email_nm
			ELSE 	Email_nm
		END
	,	tblUser.Challenge_cd	=
		CASE
			WHEN	Challenge_cd	= '-2147483647'
			THEN	tblUser.Challenge_cd
			ELSE 	Challenge_cd
		END
	,	tblUser.Response_cd	=
		CASE
			WHEN	Response_cd	= '-2147483647'
			THEN	tblUser.Response_cd
			ELSE 	Response_cd
		END
	WHERE
		tblUser.User_id	= User_id
	AND	tblUser.User_tp	= User_tp
	;
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
END USP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `uspUserType` */

/*!50003 DROP PROCEDURE IF EXISTS  `uspUserType` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUserType`(
	User_tp		VARCHAR(64)		-- PK1 
,	ParentUser_tp		VARCHAR(64)	
,	UserType_tx		MEDIUMTEXT	
,	UserTypeLeft_id		INT SIGNED	
,	UserTypeRight_id		INT SIGNED	
,	UserTypeLevel_id		INT SIGNED	
,	UserTypeOrder_id		INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		uspUserType
**	Type:		DB API procedure: Insert
**	Purpose:	To insert UserType data into tblUserType
**	Author:		Solomon S. Shacter
**	Organiztion:	Innovella, Inc.
**
**	Modified:	6/14/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblUserType';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'UPDATE';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'uspUserType';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
USP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	IF User_tp IS NULL OR User_tp = '' THEN SET User_tp = '-2147483647';	END IF;
	IF ParentUser_tp IS NULL OR ParentUser_tp = '' THEN SET ParentUser_tp = '-2147483647';	END IF;
	IF UserType_tx IS NULL OR UserType_tx = '' THEN SET UserType_tx = '-2147483647';	END IF;
	IF UserTypeLeft_id IS NULL OR UserTypeLeft_id = 0 THEN SET UserTypeLeft_id =  -2147483647;	END IF;
	IF UserTypeRight_id IS NULL OR UserTypeRight_id = 0 THEN SET UserTypeRight_id =  -2147483647;	END IF;
	IF UserTypeLevel_id IS NULL OR UserTypeLevel_id = 0 THEN SET UserTypeLevel_id =  -2147483647;	END IF;
	IF UserTypeOrder_id IS NULL OR UserTypeOrder_id = 0 THEN SET UserTypeOrder_id =  -2147483647;	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Return error if Primary Key TABLE record does NOT exist
	#######################################################################
	SET 	@PK1	= CONCAT(User_tp);
	-- --------------------------------------------------------------------
	CALL	rspUserType
	(
		@User_tp	:= User_tp
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 0	-- If PK row does not exist then return with error
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errPKNotExist
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		,	@Key_nm		:= @PK1
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################
	#######################################################################
	-- Validate attributes
	#######################################################################
	CALL	vspUserType
	(
		@User_tp	:= User_tp
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= Proc_nm
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET	@FK1	= CONCAT(User_tp);
	-- --------------------------------------------------------------------
	--
	--	RESTRICT MODE:	tblResourceType
	--
	IF
		Mode_cd	= 'R'
	THEN
		CALL	rspResourceType
		(
			@Resrc_tp	:= User_tp
		,	@ParentResrc_tp	:= ParentUser_tp
		,	@ResrcType_tx	:= UserType_tx
		,	@Left_id	:= UserTypeLeft_id
		,	@Right_id	:= UserTypeRight_id
		,	@Level_id	:= UserTypeLevel_id
		,	@Order_id	:= UserTypeOrder_id
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblResourceType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= 'tblResourceType'
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= 'tblResourceType'
			);
			LEAVE	USP;
		END IF;
	END IF;
	--
	--	CASCADE MODE:	tblResourceType
	--
	IF
		Mode_cd	= 'C'
	THEN
		CALL	uspResourceType
		(
			@Resrc_tp	:= User_tp
		,	@ParentResrc_tp	:= ParentUser_tp
		,	@ResrcType_tx	:= UserType_tx
		,	@Left_id	:= UserTypeLeft_id
		,	@Right_id	:= UserTypeRight_id
		,	@Level_id	:= UserTypeLevel_id
		,	@Order_id	:= UserTypeOrder_id
		,	@CallingProc_nm	:= CallingProc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= 'R'	-- This Table Is Restricted and Does Not Allow A Cascade From an FK Table.
		);
	END IF;
	#######################################################################
	-- Update NON-KEY values
	#######################################################################
	-- --------------------------------------------------------------------
	-- Invoke an UPDATE when a non-key attribute is actually modified.
	-- --------------------------------------------------------------------
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedUser
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
END	USP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `uspUser_Company` */

/*!50003 DROP PROCEDURE IF EXISTS  `uspUser_Company` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `uspUser_Company`(
	User_id		INT SIGNED		-- PK1 
,	User_tp		VARCHAR(64)		-- PK2 AK1
,	Company_id	INT SIGNED		-- PK1 
,	Company_tp	VARCHAR(64)		-- PK2 AK1
,	User_nm		VARCHAR(256)		--  AK2
,	User_cd		VARCHAR(128)	
,	Alias_nm	VARCHAR(256)		--  AK2
,	Hashed_cd	VARCHAR(128)
,	Person_nm	VARCHAR(256)
,	Email_nm	VARCHAR(256)
,	Challenge_cd	VARCHAR(128)
,	Response_cd	VARCHAR(128)
,	Company_nm	VARCHAR(256)
,	Company_cd	VARCHAR(128)	
,	User_tx		MEDIUMTEXT	
,	Company_tx	MEDIUMTEXT	
,	ADD_dm		DATETIME	
,	ADD_nm		VARCHAR(128)	
,	UPD_dm		DATETIME	
,	UPD_nm		VARCHAR(128)	
,	DEL_dm		DATETIME	
,	DEL_nm		VARCHAR(128)	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		uspUser_Company
**	Type:		DB API procedure: Insert
**	Purpose:	To insert Resource data into tblResource_Company
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	4/12/2013
**	Modnumber:	00
**	Modification:	Original
**	NOTE: Special Case
	AK in parent tblUser = User_tp, User_nm 
	AK in tblResource_Company = Resrc_tp, Company_id, Company_tp, Resrc_nm
	AK for "User_Company" = User_tp(tblResource_Company.Resrc_tp), Company_tp, Company_nm, User_nm(tblResource_Company.Resrc_nm)
**
	A user type and user name exists once in tblUser and once in tblCompany
	A user type and user name exists once in tblUser but may exist once or more in tblResource_Conatct, tblResource_Project
	A user may belong to more than one Group which may belong to one or more Companies
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResource_Company';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'UPDATE';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'uspUser_Company';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
DECLARE	PK1		VARCHAR(255) DEFAULT CONCAT(User_id,",",User_tp,",",Company_id,",",Company_tp);
DECLARE	FK1		VARCHAR(255) DEFAULT CONCAT(User_id,",",User_tp);
DECLARE	FK2		VARCHAR(255) DEFAULT CONCAT(User_id,",",User_tp,",",Company_id,",",Company_tp);
###############################################################################
usp:
BEGIN
DECLARE CONTINUE HANDLER FOR NOT FOUND SET ProcFailed_fg	= 0;
	#######################################################################
	-- Initialize
	#######################################################################
	IF CallingProc_nm IS NULL OR CallingProc_nm = '' THEN SET CallingProc_nm = '';	END IF;
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	IF User_id IS NULL OR User_id = 0 THEN SET User_id =  -2147483647;	END IF;
	IF User_tp IS NULL OR User_tp = '' THEN SET User_tp = '-2147483647';	END IF;
	IF Company_id IS NULL OR Company_id = 0 THEN SET Company_id =  -2147483647;	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = '-2147483647';	END IF;
	IF User_nm IS NULL OR User_nm = '' THEN SET User_nm = '-2147483647';	END IF;
	IF User_cd IS NULL OR User_cd = '' THEN SET User_cd = '-2147483647';	END IF;
	IF Hashed_cd IS NULL OR Hashed_cd = '' THEN SET Hashed_cd = '-2147483647';	END IF;
	IF Person_nm IS NULL OR Person_nm = '' THEN SET Person_nm = '-2147483647';	END IF;
	IF Alias_nm IS NULL OR Alias_nm = '' THEN SET Alias_nm = '-2147483647';	END IF;
	IF Email_nm IS NULL OR Email_nm = '' THEN SET User_cd = '-2147483647';	END IF;
	IF Challenge_cd IS NULL OR Challenge_cd = '' THEN SET Challenge_cd = '-2147483647';	END IF;
	IF Response_cd IS NULL OR Response_cd = '' THEN SET Response_cd = '-2147483647';	END IF;
	IF Company_nm IS NULL OR Company_nm = '' THEN SET Company_nm = '-2147483647';	END IF;
	IF Company_cd IS NULL OR Company_cd = '' THEN SET Company_cd = '-2147483647';	END IF;
	IF User_tx IS NULL OR User_tx = '' THEN SET User_tx = '-2147483647';	END IF;
	IF Company_tx IS NULL OR Company_tx = '' THEN SET Company_tx = '-2147483647';	END IF;
	IF ADD_dm IS NULL THEN SET ADD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = '-2147483647';	END IF;
	IF UPD_dm IS NULL THEN SET UPD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = '-2147483647';	END IF;
	IF DEL_dm IS NULL THEN SET DEL_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = '-2147483647';	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	usp;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
	CALL	rspResource_Company
	(
		@Resrc_id	:= User_id
	,	@Resrc_tp	:= User_tp
	,	@Company_id	:= Company_id
	,	@Company_tp	:= Company_tp
	,	@Resrc_nm	:= NULL
	,	@Resrc_cd	:= NULL
	,	@Alias_nm	:= NULL
	,	@ADD_dm	:= ADD_dm
	,	@ADD_nm	:= ADD_nm
	,	@UPD_dm	:= UPD_dm
	,	@UPD_nm	:= UPD_nm
	,	@DEL_dm	:= DEL_dm
	,	@DEL_nm	:= DEL_nm
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 0	-- If PK row dows not exists then return with error
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errPKNotExist
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		,	@Key_nm		:= PK1
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Validate attributes
	#######################################################################
	SET 	@ADD_dm	= ADD_dm;
	SET 	@ADD_nm	= ADD_nm;
	SET 	@UPD_dm	= UPD_dm;
	SET 	@UPD_nm	= UPD_nm;
	SET 	@DEL_dm	= DEL_dm;
	SET 	@DEL_nm	= DEL_nm;
	CALL	vspUser_Company
	(
		@User_id	:= User_id
	,	@User_tp	:= User_tp
	,	@Company_id	:= Company_id
	,	@Company_tp	:= Company_tp
	,	@User_nm	:= User_nm
	,	@User_cd	:= User_cd
	,	@Company_nm	:= Company_nm
	,	@ADD_dm
	,	@ADD_nm
	,	@UPD_dm
	,	@UPD_nm
	,	@DEL_dm
	,	@DEL_nm
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= 'vspResource_Company'
		);
		LEAVE	usp;
	END IF;
	-- --------------------------------------------------------------------
	SET 	ADD_dm	= @ADD_dm;
	SET 	ADD_nm	= @ADD_nm;
	SET 	UPD_dm	= @UPD_dm;
	SET 	UPD_nm	= @UPD_nm;
	SET 	DEL_dm	= @DEL_dm;
	SET 	DEL_nm	= @DEL_nm;
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET @FK1	= CONCAT(IFNULL(User_id,"(null)"),",",User_tp);
	SET @FK2	= CONCAT(IFNULL(User_id,"(null)"),",",User_tp,",",IFNULL(Company_id,"(null)"),",",Company_tp);
	-- --------------------------------------------------------------------
	--
	--	RESTRICT MODE:
	--
	IF
		Mode_cd	= 'R'
	THEN
		SET 	@TABLE	= "tblUser";
		CALL	rspUser
		(
			@User_id	:= User_id
		,	@User_tp	:= User_tp
		,	@User_nm	:= User_nm
		,	@User_cd	:= User_cd
		,	@Hashed_cd	:= Hashed_cd
		,	@Person_nm	:= Person_nm
		,	@Email_nm	:= Email_nm
		,	@Challenge_cd	:= Challenge_cd
		,	@Response_cd	:= Response_cd
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	usp;
		END IF;
		SET 	@TABLE	= "tblResource_Company";
		CALL	rspResource_Company
		(
			@Resrc_id	:= User_id
		,	@Resrc_tp	:= User_tp
		,	@Company_id	:= Company_id
		,	@Company_tp	:= Company_tp
		,	@Resrc_nm	:= User_nm
		,	@Resrc_cd	:= User_cd
		,	@Alias_nm	:= Alias_nm
		,	@ADD_dm	:= ADD_dm
		,	@ADD_nm	:= ADD_nm
		,	@UPD_dm	:= UPD_dm
		,	@UPD_nm	:= UPD_nm
		,	@DEL_dm	:= DEL_dm
		,	@DEL_nm	:= DEL_nm
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= FK2
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	usp;
		END IF;
	END IF;
	--
	--	CASCADE MODE:
	--
	IF
		Mode_cd	= 'C'
	THEN
		--	-------------------------------------------------------
		SET 	@TABLE	= "tblUser";
		--	-------------------------------------------------------
		CALL	uspUser
		(
			@User_id	:= User_id
		,	@User_tp	:= User_tp
		,	@User_nm	:= User_nm
		,	@User_cd	:= User_cd
		,	@Hashed_cd	:= Hashed_cd
		,	@Person_nm	:= Person_nm
		,	@Email_nm	:= Email_nm
		,	@Challenge_cd	:= Challenge_cd
		,	@Response_cd	:= Response_cd
		,	@User_tx	:= User_tx
		,	@UserADD_dm	:= ADD_dm
		,	@UserADD_nm	:= ADD_nm
		,	@UserUPD_dm	:= UPD_dm
		,	@UserUPD_nm	:= UPD_nm
		,	@UserDEL_dm	:= DEL_dm
		,	@UserDEL_nm	:= DEL_nm
		,	@ParentUser_tp	:= NULL
		,	@UserType_tx	:= NULL
		,	@UserTypeLeft_id	:= NULL
		,	@UserTypeRight_id	:= NULL
		,	@UserTypeLevel_id	:= NULL
		,	@UserTypeOrder_id	:= NULL
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		)
		;
		--	-------------------------------------------------------
		SET 	@TABLE	= "tblResource_Company";
		--	-------------------------------------------------------
		CALL	uspResource_Company
		(
			@Resrc_id	:= User_id
		,	@Resrc_tp	:= User_tp
		,	@Company_id	:= Company_id
		,	@Company_tp	:= Company_tp
		,	@Resrc_nm	:= User_nm
		,	@Resrc_cd	:= User_cd
		,	@Alias_nm	:= Alias_nm
		,	@Company_nm := Company_nm
		,	@Company_cd := Company_cd
		,	@Resrc_tx   := User_tx
		,	@Company_tx := Company_tx
		,	@ADD_dm	:= ADD_dm
		,	@ADD_nm	:= ADD_nm
		,	@UPD_dm	:= UPD_dm
		,	@UPD_nm	:= UPD_nm
		,	@DEL_dm	:= DEL_dm
		,	@DEL_nm	:= DEL_nm
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		)
		;
		--	Set the proc IN parameters to the parent usp INOUT parameters
		SET 	Company_id	= @Company_id;
	END IF;
	#######################################################################
	-- Update NON-KEY values
	#######################################################################
	-- --------------------------------------------------------------------
	-- Invoke an UPDATE when a non-key attribute is actually modified.
	-- --------------------------------------------------------------------
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
END usp;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `vspCompany` */

/*!50003 DROP PROCEDURE IF EXISTS  `vspCompany` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `vspCompany`(
	Company_id		INT SIGNED		
,	Company_tp		VARCHAR(64)		
,	Company_nm		VARCHAR(256)		
,	Company_cd		VARCHAR(128)		
,	SYSRIGHT		VARCHAR(30)		-- Intended DML action
,	Mode_cd		VARCHAR(16)		-- Database cascade mode code
,	OUT 	IsValid_fg	BOOLEAN
)
BEGIN
/*
**	Name:		vspCompany
**	Type:		Validation Stored Procedure
**	Purpose:	Validate a record in tblCompany
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	6/18/2013
**	Modnumber:
**	Modification:	
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblCompany';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'vspCompany';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
VSP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	DECLARE	AK1		VARCHAR(255) DEFAULT CONCAT(Company_tp,",",Company_nm);
	#######################################################################
	-- Validate:
	--
	--	Duplicate names within a type are not allowed
	--	Alternate (Candidate) Key Check
	#######################################################################
	IF
		SYSRIGHT	= 'INSERT'
	OR 	SYSRIGHT 	= 'UPDATE'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tblCompany
			WHERE
					tblCompany.Company_id	= Company_id
				AND	tblCompany.Company_tp	= Company_tp
				AND	tblCompany.Company_nm	= Company_nm
		)
		THEN
			SET IsValid_fg	= TRUE;	-- Return if the attributes did not change
			LEAVE VSP;
		ELSE
			CALL	rspCompany
			(
				@Company_id	:= Company_id
			,	@Company_tp	:= Company_tp
			,	@Company_nm	:= Company_nm
			,	@Company_cd	:= Company_cd
			,	@Key_cd		:= 'AK'
			,	@RowExists_fg
			);
			IF
				@RowExists_fg	= 1	-- AK exists and not for this PK
			THEN
				SET IsValid_fg	= FALSE;
				CALL 	errAKExist
				(
					@Proc_nm	:= Proc_nm
				,	@Table_nm	:= SYSTABLE
				,	@AK_nm		:= AK1
				);
				LEAVE VSP;
			END IF;
		END IF;
	END IF;
	IF
		SYSRIGHT	= 'DELETE'
	THEN
		IF
			Mode_cd	= 'H'
		THEN
			SET 	@DEL_dm	= UTC_TIMESTAMP();
			SET 	@DEL_nm	= CURRENT_USER();
		END IF;
	END IF;
	#######################################################################
END	VSP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `vspCompanyType` */

/*!50003 DROP PROCEDURE IF EXISTS  `vspCompanyType` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `vspCompanyType`(
	Company_tp		VARCHAR(64)		
,	SYSRIGHT		VARCHAR(30)		-- Intended DML action
,	Mode_cd		VARCHAR(16)		-- Database cascade mode code
,	OUT 	IsValid_fg	BOOLEAN
)
BEGIN
/*
**	Name:		vspCompanyType
**	Type:		Validation Stored Procedure
**	Purpose:	Validate a record in tblCompanyType
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	6/18/2013
**	Modnumber:
**	Modification:	
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblCompanyType';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'vspCompanyType';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
VSP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	#######################################################################
	-- Validate:
	--
	--	Duplicate names within a type are not allowed
	--	Alternate (Candidate) Key Check
	#######################################################################
	SET IsValid_fg	= TRUE;	-- Return if the attributes did not change
	#######################################################################
END	VSP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `vspResource` */

/*!50003 DROP PROCEDURE IF EXISTS  `vspResource` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `vspResource`(
	Resrc_id		INT SIGNED		
,	Resrc_tp		VARCHAR(64)		
,	Resrc_tx		MEDIUMTEXT		
,INOUT	ADD_dm		DATETIME		
,INOUT	ADD_nm		VARCHAR(256)		
,INOUT	UPD_dm		DATETIME		
,INOUT	UPD_nm		VARCHAR(256)		
,INOUT	DEL_dm		DATETIME		
,INOUT	DEL_nm		VARCHAR(256)		
,	SYSRIGHT		VARCHAR(30)		-- Intended DML action
,	Mode_cd		VARCHAR(16)		-- Database cascade mode code
,	OUT 	IsValid_fg	BOOLEAN
)
BEGIN
/*
**	Name:		vspResource
**	Type:		Validation Stored Procedure
**	Purpose:	Validate a record in tblResource
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	7/2/2013
**	Modnumber:
**	Modification:	
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResource';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'vspResource';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
VSP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	#######################################################################
	-- Validate:
	--
	--	Duplicate names within a type are not allowed
	--	Alternate (Candidate) Key Check
	#######################################################################
	IF
		SYSRIGHT = 'INSERT'
	THEN
		IF	ADD_dm	IS NULL OR ADD_dm = '0000-00-00 00:00:00'
		THEN
			SET	ADD_dm	= UTC_TIMESTAMP();
		END IF;
		IF	ADD_nm	IS NULL OR ADD_nm = '-2147483647'
		THEN
			SET	ADD_nm	= CURRENT_USER();
		END IF;
		LEAVE VSP;
	END IF;
	IF
		SYSRIGHT = 'UPDATE'
	THEN
		IF	UPD_dm	IS NULL OR UPD_dm = '0000-00-00 00:00:00'
		THEN
			SET	UPD_dm	= UTC_TIMESTAMP();
		END IF;
		IF	UPD_nm	IS NULL OR UPD_nm = '-2147483647'
		THEN
			SET	UPD_nm	= CURRENT_USER();
		END IF;
		IF	DEL_dm	IS NULL OR DEL_dm = '0000-00-00 00:00:00'
		THEN
			SET	DEL_dm	= NULL;
		END IF;
		IF	(DEL_nm	IS NULL OR DEL_nm = '-2147483647')
		AND	(DEL_dm > '0000-00-00 00:00:00')
		THEN
			SET	DEL_nm	= CURRENT_USER();
		ELSE
			SET 	DEL_nm	= NULL;
		END IF;
		LEAVE VSP;
	END IF;
	IF
		SYSRIGHT = 'DELETE'
	THEN
		IF	DEL_dm	IS NULL OR DEL_dm = '0000-00-00 00:00:00'
		THEN
			SET	DEL_dm	= UTC_TIMESTAMP();
		END IF;
		IF	DEL_nm	IS NULL OR DEL_nm = '-2147483647'
		THEN
			SET	DEL_nm	= CURRENT_USER();
		END IF;
		SET	UPD_dm	= UTC_TIMESTAMP();
		SET	UPD_nm	= CURRENT_USER();
		LEAVE VSP;
	END IF;
	#######################################################################
END	VSP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `vspResourceType` */

/*!50003 DROP PROCEDURE IF EXISTS  `vspResourceType` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `vspResourceType`(
	Resrc_tp		VARCHAR(64)		
,	ParentResrc_tp		VARCHAR(64)		
,	ResrcType_tx		MEDIUMTEXT		
,	Left_id		INT SIGNED		
,	Right_id		INT SIGNED		
,	Level_id		INT SIGNED		
,	Order_id		INT SIGNED		
,	SYSRIGHT		VARCHAR(30)		-- Intended DML action
,	Mode_cd		VARCHAR(16)		-- Database cascade mode code
,	OUT 	IsValid_fg	BOOLEAN
)
BEGIN
/*
**	Name:		vspResourceType
**	Type:		Validation Stored Procedure
**	Purpose:	Validate a record in tblResourceType
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	4/9/2013
**	Modnumber:
**	Modification:	
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResourceType';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'vspResourceType';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
VSP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	#######################################################################
	-- Validate:
	--
	--	Duplicate names within a type are not allowed
	--	Alternate (Candidate) Key Check
	#######################################################################
	IF
		Resrc_tp	IS NULL
	OR 	Resrc_tp = ''
	THEN
		CALL	errNullArg
		(
			@Proc_nm	:= Proc_nm
		,	@Action_nm	:= SYSRIGHT
		);
		LEAVE VSP;
	END IF;
	#######################################################################
END VSP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `vspResource_Company` */

/*!50003 DROP PROCEDURE IF EXISTS  `vspResource_Company` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `vspResource_Company`(
	Resrc_id		INT SIGNED
,	Resrc_tp		VARCHAR(64)
,	Company_id		INT SIGNED
,	Company_tp		VARCHAR(64)
,	Resrc_nm		VARCHAR(256)
,	Resrc_cd		VARCHAR(128)
,	Alias_nm		VARCHAR(256)
,INOUT	ADD_dm		DATETIME
,INOUT	ADD_nm		VARCHAR(256)
,INOUT	UPD_dm		DATETIME
,INOUT	UPD_nm		VARCHAR(256)
,INOUT	DEL_dm		DATETIME
,INOUT	DEL_nm		VARCHAR(256)
,	SYSRIGHT		VARCHAR(30)		-- Intended DML action
,	Mode_cd		VARCHAR(16)		-- Database cascade mode code
,	OUT 	IsValid_fg	BOOLEAN
)
BEGIN
/*
**	Name:		vspResource_Company
**	Type:		Validation Stored Procedure
**	Purpose:	Validate a record in tblResource_Company
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	7/2/2013
**	Modnumber:
**	Modification:	
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResource_Company';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'vspResource_Company';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
VSP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	DECLARE	AK1		VARCHAR(255) DEFAULT CONCAT(Resrc_tp,",",Company_id,",",Company_tp,",",Resrc_nm);
	#######################################################################
	-- Validate:
	--
	--	Duplicate names within a type are not allowed
	--	Alternate (Candidate) Key Check
	#######################################################################
	IF
		SYSRIGHT	= 'INSERT'
	OR 	SYSRIGHT 	= 'UPDATE'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tblResource_Company
			WHERE	1=1
			AND	tblResource_Company.Resrc_id	= Resrc_id
			AND	tblResource_Company.Resrc_tp	= Resrc_tp
			AND	tblResource_Company.Company_id	= Company_id
			AND	tblResource_Company.Company_tp	= Company_tp
			AND	tblResource_Company.Resrc_nm	= Resrc_nm
		)
		THEN
			SET IsValid_fg	= TRUE;	-- Return if the attributes did not change
		ELSE
			CALL	rspResource_Company
			(
				@Resrc_id	:= Resrc_id
			,	@Resrc_tp	:= Resrc_tp
			,	@Company_id	:= Company_id
			,	@Company_tp	:= Company_tp
			,	@Resrc_nm	:= Resrc_nm
			,	@Resrc_cd	:= Resrc_cd
			,	@Alias_nm	:= Alias_nm
			,	@ADD_dm	:= ADD_dm
			,	@ADD_nm	:= ADD_nm
			,	@UPD_dm	:= UPD_dm
			,	@UPD_nm	:= UPD_nm
			,	@DEL_dm	:= DEL_dm
			,	@DEL_nm	:= DEL_nm
			
			,	@Key_cd		:= 'AK'
			,	@RowExists_fg
			);
			IF
				@RowExists_fg	= 1	-- AK exists and not for this PK
			THEN
				SET IsValid_fg	= FALSE;
				CALL 	errAKExist
				(
					@Proc_nm	:= Proc_nm
				,	@Table_nm	:= SYSTABLE
				,	@AK_nm		:= AK1
				);
			END IF;
		END IF;
	END IF;
	IF
		SYSRIGHT = 'INSERT'
	THEN
		IF	ADD_dm IS NULL OR ADD_dm = '0000-00-00 00:00:00'
		THEN
			SET	ADD_dm	= UTC_TIMESTAMP();
		END IF;
		IF	ADD_nm	IS NULL OR ADD_nm = '-2147483647'
		THEN
			SET	ADD_nm	= CURRENT_USER();
		END IF;
		LEAVE VSP;
	END IF;
	IF
		SYSRIGHT = 'UPDATE'
	THEN
		IF	UPD_dm	IS NULL OR UPD_dm = '0000-00-00 00:00:00'
		THEN
			SET	UPD_dm	= UTC_TIMESTAMP();
		END IF;
		IF	UPD_nm	IS NULL OR UPD_nm = '-2147483647'
		THEN
			SET	UPD_nm	= CURRENT_USER();
		END IF;
		IF	DEL_dm	IS NULL OR DEL_dm = '0000-00-00 00:00:00'
		THEN
			SET	DEL_dm	= NULL;
		END IF;
		IF	(DEL_nm	IS NULL OR DEL_nm = '-2147483647')
		AND	(DEL_dm > '0000-00-00 00:00:00')
		THEN
			SET	DEL_nm	= CURRENT_USER();
		ELSE
			SET 	DEL_nm	= NULL;
		END IF;
		LEAVE VSP;
	END IF;
	IF
		SYSRIGHT = 'DELETE'
	THEN
		IF	DEL_dm	IS NULL OR DEL_dm = '0000-00-00 00:00:00'
		THEN
			SET	DEL_dm	= UTC_TIMESTAMP();
		END IF;
		IF	DEL_nm	IS NULL OR DEL_nm = '-2147483647'
		THEN
			SET	DEL_nm	= CURRENT_USER();
		END IF;
		SET	UPD_dm	= UTC_TIMESTAMP();
		SET	UPD_nm	= CURRENT_USER();
		LEAVE VSP;
	END IF;
	#######################################################################
END	VSP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `vspResource_Contact` */

/*!50003 DROP PROCEDURE IF EXISTS  `vspResource_Contact` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `vspResource_Contact`(
	Resrc_id	INT SIGNED
,	Resrc_tp	VARCHAR(64)
,	Contact_id	INT SIGNED
,	Contact_tp	VARCHAR(64)
,	Contact_nm	VARCHAR(256)
,	Contact_cd	VARCHAR(128)
,	Alias_nm	VARCHAR(256)
,	Address_nm	VARCHAR(256)
,	City_cd		VARCHAR(128)
,	State_cd	VARCHAR(128)
,	Zip_cd		VARCHAR(128)
,	Phone_cd	VARCHAR(128)
,	GPS_cd		VARCHAR(128)
,INOUT	ADD_dm		DATETIME
,INOUT	ADD_nm		VARCHAR(256)
,INOUT	UPD_dm		DATETIME
,INOUT	UPD_nm		VARCHAR(256)
,INOUT	DEL_dm		DATETIME
,INOUT	DEL_nm		VARCHAR(256)
,	SYSRIGHT		VARCHAR(30)		-- Intended DML action
,	Mode_cd		VARCHAR(16)		-- Database cascade mode code
,	OUT 	IsValid_fg	BOOLEAN
)
BEGIN
/*
**	Name:		vspResource_Contact
**	Type:		Validation Stored Procedure
**	Purpose:	Validate a record in tblResource_Contact
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	7/2/2013
**	Modnumber:
**	Modification:	
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResource_Contact';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'vspResource_Contact';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
VSP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	DECLARE	AK1		VARCHAR(255) DEFAULT CONCAT(IFNULL(Resrc_id,"(null)"), Resrc_tp,",",Contact_tp);
	#######################################################################
	-- Validate:
	--
	--	Duplicate names within a type are not allowed
	--	Alternate (Candidate) Key Check
	#######################################################################
	IF
		SYSRIGHT	= 'INSERT'
	OR 	SYSRIGHT 	= 'UPDATE'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tblResource_Contact
			WHERE	1=1
			AND	tblResource_Contact.Resrc_id	= Resrc_id
			AND	tblResource_Contact.Resrc_tp	= Resrc_tp
			AND	tblResource_Contact.Contact_id	= Contact_id
			AND	tblResource_Contact.Contact_tp	= Contact_tp
--			AND	tblResource_Contact.Contact_nm	= Contact_nm
		)
		THEN
			SET IsValid_fg	= TRUE;	-- Return if the attributes did not change
		ELSE
			CALL	rspResource_Contact
			(
				@Resrc_id	:= Resrc_id
			,	@Resrc_tp	:= Resrc_tp
			,	@Contact_id	:= NULL
			,	@Contact_tp	:= Contact_tp
			,	@Contact_nm	:= NULL
			,	@Contact_cd	:= NULL
			,	@Alias_nm	:= NULL
			,	@Address_nm	:= NULL
			,	@City_cd	:= NULL
			,	@State_cd	:= NULL
			,	@Zip_cd		:= NULL
			,	@Phone_cd	:= NULL
			,	@GPS_cd		:= NULL
			,	@ADD_dm	:= NULL
			,	@ADD_nm	:= NULL
			,	@UPD_dm	:= NULL
			,	@UPD_nm	:= NULL
			,	@DEL_dm	:= NULL
			,	@DEL_nm	:= NULL
			,	@Key_cd	:= 'AK'
			,	@RowExists_fg
			);
			IF
				@RowExists_fg	= 1	-- AK exists and not for this PK
			THEN
				SET IsValid_fg	= FALSE;
				CALL 	errAKExist
				(
					@Proc_nm	:= Proc_nm
				,	@Table_nm	:= SYSTABLE
				,	@AK_nm		:= AK1
				);
			END IF;
		END IF;
	END IF;
	IF
		SYSRIGHT = 'INSERT'
	THEN
		IF	ADD_dm IS NULL OR ADD_dm = '0000-00-00 00:00:00'
		THEN
			SET	ADD_dm	= UTC_TIMESTAMP();
		END IF;
		IF	ADD_nm	IS NULL OR ADD_nm = '-2147483647'
		THEN
			SET	ADD_nm	= CURRENT_USER();
		END IF;
		LEAVE VSP;
	END IF;
	IF
		SYSRIGHT = 'UPDATE'
	THEN
		IF	UPD_dm	IS NULL OR UPD_dm = '0000-00-00 00:00:00'
		THEN
			SET	UPD_dm	= UTC_TIMESTAMP();
		END IF;
		IF	UPD_nm	IS NULL OR UPD_nm = '-2147483647'
		THEN
			SET	UPD_nm	= CURRENT_USER();
		END IF;
		IF	DEL_dm	IS NULL OR DEL_dm = '0000-00-00 00:00:00'
		THEN
			SET	DEL_dm	= NULL;
		END IF;
		IF	(DEL_nm	IS NULL OR DEL_nm = '-2147483647')
		AND	(DEL_dm > '0000-00-00 00:00:00')
		THEN
			SET	DEL_nm	= CURRENT_USER();
		ELSE
			SET 	DEL_nm	= NULL;
		END IF;
		LEAVE VSP;
	END IF;
	IF
		SYSRIGHT = 'DELETE'
	THEN
		IF	DEL_dm	IS NULL OR DEL_dm = '0000-00-00 00:00:00'
		THEN
			SET	DEL_dm	= UTC_TIMESTAMP();
		END IF;
		IF	DEL_nm	IS NULL OR DEL_nm = '-2147483647'
		THEN
			SET	DEL_nm	= CURRENT_USER();
		END IF;
		SET	UPD_dm	= UTC_TIMESTAMP();
		SET	UPD_nm	= CURRENT_USER();
		LEAVE VSP;
	END IF;
	#######################################################################
END	VSP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `vspUser` */

/*!50003 DROP PROCEDURE IF EXISTS  `vspUser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `vspUser`(
	User_id		INT SIGNED		
,	User_tp		VARCHAR(64)		
,	User_nm		VARCHAR(256)		
,	User_cd		VARCHAR(128)		
,	Hashed_cd	VARCHAR(128)
,	Person_nm	VARCHAR(256)
,	Email_nm	VARCHAR(256)
,	Challenge_cd	VARCHAR(128)
,	Response_cd	VARCHAR(128)
,	SYSRIGHT		VARCHAR(30)		-- Intended DML action
,	Mode_cd		VARCHAR(16)		-- Database cascade mode code
,	OUT 	IsValid_fg	BOOLEAN
)
BEGIN
/*
**	Name:		vspUser
**	Type:		Validation Stored Procedure
**	Purpose:	Validate a record in tblUser
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	6/18/2013
**	Modnumber:
**	Modification:	
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblUser';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'vspUser';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
VSP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	DECLARE	AK1		VARCHAR(255) DEFAULT CONCAT(User_tp,",",User_nm);
	#######################################################################
	-- Validate:
	--
	--	Duplicate names within a type are not allowed
	--	Alternate (Candidate) Key Check
	#######################################################################
	IF
		SYSRIGHT	= 'INSERT'
	OR 	SYSRIGHT 	= 'UPDATE'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tblUser
			WHERE
					tblUser.User_id	= User_id
				AND	tblUser.User_tp	= User_tp
				AND	tblUser.User_nm	= User_nm
		)
		THEN
			SET IsValid_fg	= TRUE;	-- Return if the attributes did not change
			LEAVE VSP;
		ELSE
			CALL	rspUser
			(
				@User_id	:= User_id
			,	@User_tp	:= User_tp
			,	@User_nm	:= User_nm
			,	@User_cd	:= User_cd
			,	@Hashed_cd	:= Hashed_cd
			,	@Person_nm	:= Person_nm
			,	@Email_nm	:= Email_nm
			,	@Challenge_cd	:= Challenge_cd
			,	@Response_cd	:= Response_cd
			,	@Key_cd		:= 'AK'
			,	@RowExists_fg
			);
			IF
				@RowExists_fg	= 1	-- AK exists and not for this PK
			THEN
				SET IsValid_fg	= FALSE;
				CALL 	errAKExist
				(
					@Proc_nm	:= Proc_nm
				,	@Table_nm	:= SYSTABLE
				,	@AK_nm		:= AK1
				);
				LEAVE VSP;
			END IF;
		END IF;
	END IF;
	IF
		SYSRIGHT	= 'DELETE'
	THEN
		IF
			Mode_cd	= 'H'
		THEN
			SET 	@DEL_dm	= UTC_TIMESTAMP();
			SET 	@DEL_nm	= CURRENT_USER();
		END IF;
	END IF;
	#######################################################################
END	VSP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `vspUserType` */

/*!50003 DROP PROCEDURE IF EXISTS  `vspUserType` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`innovella`@`localhost` PROCEDURE `vspUserType`(
	User_tp		VARCHAR(64)		
,	SYSRIGHT		VARCHAR(30)		-- Intended DML action
,	Mode_cd		VARCHAR(16)		-- Database cascade mode code
,	OUT 	IsValid_fg	BOOLEAN
)
BEGIN
/*
**	Name:		vspUserType
**	Type:		Validation Stored Procedure
**	Purpose:	Validate a record in tblUserType
**	Author:		Solomon S. Shacter
**	User:	Innovella, Inc.
**
**	Modified:	6/18/2013
**	Modnumber:
**	Modification:	
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblUserType';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'vspUserType';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
VSP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	#######################################################################
	-- Validate:
	--
	--	Duplicate names within a type are not allowed
	--	Alternate (Candidate) Key Check
	#######################################################################
	SET IsValid_fg	= TRUE;	-- Return if the attributes did not change
	#######################################################################
END	VSP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure `vspUser_Company` */

/*!50003 DROP PROCEDURE IF EXISTS  `vspUser_Company` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `vspUser_Company`(
	User_id		INT SIGNED
,	User_tp		VARCHAR(64)
,	Company_id	INT SIGNED
,	Company_tp	VARCHAR(64)
,	User_nm		VARCHAR(256)
,	User_cd		VARCHAR(128)
,	Company_nm	VARCHAR(256)
,INOUT	ADD_dm		DATETIME
,INOUT	ADD_nm		VARCHAR(256)
,INOUT	UPD_dm		DATETIME
,INOUT	UPD_nm		VARCHAR(256)
,INOUT	DEL_dm		DATETIME
,INOUT	DEL_nm		VARCHAR(256)
,	SYSRIGHT		VARCHAR(30)		-- Intended DML action
,	Mode_cd		VARCHAR(16)		-- Database cascade mode code
,	OUT 	IsValid_fg	BOOLEAN
)
BEGIN
/*
**	Name:		vspUser_Company
**	Type:		Validation Stored Procedure
**	Purpose:	Validate a record in tblResource_Company
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	7/2/2013
**	Modnumber:
**	Modification:	
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResource_Company';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'vspUser_Company';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
VSP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	DECLARE	AK1		VARCHAR(255) DEFAULT CONCAT(User_tp,",",Company_tp,",",Company_nm,",",User_nm);
	#######################################################################
	-- Validate:
	--
	--	Duplicate names within a type are not allowed
	--	Alternate (Candidate) Key Check
	#######################################################################
	IF
		SYSRIGHT	= 'INSERT'
	OR 	SYSRIGHT 	= 'UPDATE'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tvwUser_Company
			WHERE	1=1
			AND	tvwUser_Company.User_id	= User_id
			AND	tvwUser_Company.User_tp	= User_tp
			AND	tvwUser_Company.User_nm	= User_nm
			AND	tvwUser_Company.Company_id	= Company_id
			AND	tvwUser_Company.Company_tp	= Company_tp
			AND	tvwUser_Company.Company_nm	= Company_nm
		)
		THEN
			SET IsValid_fg	= TRUE;	-- Return if the attributes did not change
		ELSE
			IF
			EXISTS
			(
				SELECT	1
				FROM
					tvwUser_Company
				WHERE	1=1
				AND	tvwUser_Company.User_tp	= User_tp
				AND	tvwUser_Company.User_nm	= User_nm
				AND	tvwUser_Company.Company_tp	= Company_tp
				AND	tvwUser_Company.Company_nm	= Company_nm
			)	-- AK exists and not for this PK
			THEN
				SET IsValid_fg	= FALSE;
				CALL 	errAKExist
				(
					@Proc_nm	:= Proc_nm
				,	@Table_nm	:= SYSTABLE
				,	@AK_nm		:= AK1
				);
			END IF;
		END IF;
	END IF;
	IF
		SYSRIGHT = 'INSERT'
	THEN
		IF	ADD_dm IS NULL OR ADD_dm = '0000-00-00 00:00:00'
		THEN
			SET	ADD_dm	= UTC_TIMESTAMP();
		END IF;
		IF	ADD_nm	IS NULL OR ADD_nm = '-2147483647'
		THEN
			SET	ADD_nm	= CURRENT_USER();
		END IF;
		LEAVE VSP;
	END IF;
	IF
		SYSRIGHT = 'UPDATE'
	THEN
		IF	UPD_dm	IS NULL OR UPD_dm = '0000-00-00 00:00:00'
		THEN
			SET	UPD_dm	= UTC_TIMESTAMP();
		END IF;
		IF	UPD_nm	IS NULL OR UPD_nm = '-2147483647'
		THEN
			SET	UPD_nm	= CURRENT_USER();
		END IF;
		IF	DEL_dm	IS NULL OR DEL_dm = '0000-00-00 00:00:00'
		THEN
			SET	DEL_dm	= NULL;
		END IF;
		IF	(DEL_nm	IS NULL OR DEL_nm = '-2147483647')
		AND	(DEL_dm > '0000-00-00 00:00:00')
		THEN
			SET	DEL_nm	= CURRENT_USER();
		ELSE
			SET 	DEL_nm	= NULL;
		END IF;
		LEAVE VSP;
	END IF;
	IF
		SYSRIGHT = 'DELETE'
	THEN
		IF	DEL_dm	IS NULL OR DEL_dm = '0000-00-00 00:00:00'
		THEN
			SET	DEL_dm	= UTC_TIMESTAMP();
		END IF;
		IF	DEL_nm	IS NULL OR DEL_nm = '-2147483647'
		THEN
			SET	DEL_nm	= CURRENT_USER();
		END IF;
		SET	UPD_dm	= UTC_TIMESTAMP();
		SET	UPD_nm	= CURRENT_USER();
		LEAVE VSP;
	END IF;
	#######################################################################
END	VSP
;
###############################################################################
END */$$
DELIMITER ;

/*Table structure for table `company` */

DROP TABLE IF EXISTS `company`;

/*!50001 DROP VIEW IF EXISTS `company` */;
/*!50001 DROP TABLE IF EXISTS `company` */;

/*!50001 CREATE TABLE  `company`(
 `Company_id` int(11) ,
 `Company_tp` varchar(64) ,
 `Company_nm` varchar(256) ,
 `Company_cd` varchar(32) ,
 `Company_tx` mediumtext ,
 `CompanyADD_dm` datetime ,
 `CompanyADD_nm` varchar(256) ,
 `CompanyUPD_dm` datetime ,
 `CompanyUPD_nm` varchar(256) ,
 `CompanyDEL_dm` datetime ,
 `CompanyDEL_nm` varchar(256) ,
 `ParentCompany_tp` varchar(64) ,
 `CompanyType_tx` mediumtext ,
 `CompanyTypeLeft_id` int(11) ,
 `CompanyTypeRight_id` int(11) ,
 `CompanyTypeLevel_id` int(11) ,
 `CompanyTypeOrder_id` int(11) 
)*/;

/*Table structure for table `companytype` */

DROP TABLE IF EXISTS `companytype`;

/*!50001 DROP VIEW IF EXISTS `companytype` */;
/*!50001 DROP TABLE IF EXISTS `companytype` */;

/*!50001 CREATE TABLE  `companytype`(
 `Company_tp` varchar(64) ,
 `ParentCompany_tp` varchar(64) ,
 `CompanyType_tx` mediumtext ,
 `CompanyTypeLeft_id` int(11) ,
 `CompanyTypeRight_id` int(11) ,
 `CompanyTypeLevel_id` int(11) ,
 `CompanyTypeOrder_id` int(11) 
)*/;

/*Table structure for table `resource` */

DROP TABLE IF EXISTS `resource`;

/*!50001 DROP VIEW IF EXISTS `resource` */;
/*!50001 DROP TABLE IF EXISTS `resource` */;

/*!50001 CREATE TABLE  `resource`(
 `Resrc_id` int(11) ,
 `Resrc_tp` varchar(64) ,
 `Resrc_tx` mediumtext ,
 `ADD_dm` datetime ,
 `ADD_nm` varchar(256) ,
 `UPD_dm` datetime ,
 `UPD_nm` varchar(256) ,
 `DEL_dm` datetime ,
 `DEL_nm` varchar(256) ,
 `ParentResrc_tp` varchar(64) ,
 `ResrcType_tx` mediumtext ,
 `Left_id` int(11) ,
 `Right_id` int(11) ,
 `Level_id` int(11) ,
 `Order_id` int(11) 
)*/;

/*Table structure for table `resourcetype` */

DROP TABLE IF EXISTS `resourcetype`;

/*!50001 DROP VIEW IF EXISTS `resourcetype` */;
/*!50001 DROP TABLE IF EXISTS `resourcetype` */;

/*!50001 CREATE TABLE  `resourcetype`(
 `Resrc_tp` varchar(64) ,
 `ParentResrc_tp` varchar(64) ,
 `ResrcType_tx` mediumtext ,
 `Left_id` int(11) ,
 `Right_id` int(11) ,
 `Level_id` int(11) ,
 `Order_id` int(11) 
)*/;

/*Table structure for table `tvwcompany` */

DROP TABLE IF EXISTS `tvwcompany`;

/*!50001 DROP VIEW IF EXISTS `tvwcompany` */;
/*!50001 DROP TABLE IF EXISTS `tvwcompany` */;

/*!50001 CREATE TABLE  `tvwcompany`(
 `Company_id` int(11) ,
 `Company_tp` varchar(64) ,
 `Company_nm` varchar(256) ,
 `Company_cd` varchar(32) ,
 `Company_tx` mediumtext ,
 `CompanyADD_dm` datetime ,
 `CompanyADD_nm` varchar(256) ,
 `CompanyUPD_dm` datetime ,
 `CompanyUPD_nm` varchar(256) ,
 `CompanyDEL_dm` datetime ,
 `CompanyDEL_nm` varchar(256) ,
 `ParentCompany_tp` varchar(64) ,
 `CompanyType_tx` mediumtext ,
 `CompanyTypeLeft_id` int(11) ,
 `CompanyTypeRight_id` int(11) ,
 `CompanyTypeLevel_id` int(11) ,
 `CompanyTypeOrder_id` int(11) 
)*/;

/*Table structure for table `tvwcompanytype` */

DROP TABLE IF EXISTS `tvwcompanytype`;

/*!50001 DROP VIEW IF EXISTS `tvwcompanytype` */;
/*!50001 DROP TABLE IF EXISTS `tvwcompanytype` */;

/*!50001 CREATE TABLE  `tvwcompanytype`(
 `Company_tp` varchar(64) ,
 `ParentCompany_tp` varchar(64) ,
 `CompanyType_tx` mediumtext ,
 `CompanyTypeLeft_id` int(11) ,
 `CompanyTypeRight_id` int(11) ,
 `CompanyTypeLevel_id` int(11) ,
 `CompanyTypeOrder_id` int(11) 
)*/;

/*Table structure for table `tvwcontact` */

DROP TABLE IF EXISTS `tvwcontact`;

/*!50001 DROP VIEW IF EXISTS `tvwcontact` */;
/*!50001 DROP TABLE IF EXISTS `tvwcontact` */;

/*!50001 CREATE TABLE  `tvwcontact`(
 `Contact_id` int(11) ,
 `Contact_tp` varchar(64) ,
 `Contact_tx` mediumtext ,
 `ContactADD_dm` datetime ,
 `ContactADD_nm` varchar(256) ,
 `ContactUPD_dm` datetime ,
 `ContactUPD_nm` varchar(256) ,
 `ContactDEL_dm` datetime ,
 `ContactDEL_nm` varchar(256) ,
 `ParentContact_tp` varchar(64) ,
 `ContactType_tx` mediumtext ,
 `ContactTypeLeft_id` int(11) ,
 `ContactTypeRight_id` int(11) ,
 `ContactTypeLevel_id` int(11) ,
 `ContactTypeOrder_id` int(11) 
)*/;

/*Table structure for table `tvwcontacttype` */

DROP TABLE IF EXISTS `tvwcontacttype`;

/*!50001 DROP VIEW IF EXISTS `tvwcontacttype` */;
/*!50001 DROP TABLE IF EXISTS `tvwcontacttype` */;

/*!50001 CREATE TABLE  `tvwcontacttype`(
 `Contact_tp` varchar(64) ,
 `ParentContact_tp` varchar(64) ,
 `ContactType_tx` mediumtext ,
 `ContactTypeLeft_id` int(11) ,
 `ContactTypeRight_id` int(11) ,
 `ContactTypeLevel_id` int(11) ,
 `ContactTypeOrder_id` int(11) 
)*/;

/*Table structure for table `tvwresource` */

DROP TABLE IF EXISTS `tvwresource`;

/*!50001 DROP VIEW IF EXISTS `tvwresource` */;
/*!50001 DROP TABLE IF EXISTS `tvwresource` */;

/*!50001 CREATE TABLE  `tvwresource`(
 `Resrc_id` int(11) ,
 `Resrc_tp` varchar(64) ,
 `Resrc_tx` mediumtext ,
 `ADD_dm` datetime ,
 `ADD_nm` varchar(256) ,
 `UPD_dm` datetime ,
 `UPD_nm` varchar(256) ,
 `DEL_dm` datetime ,
 `DEL_nm` varchar(256) ,
 `ParentResrc_tp` varchar(64) ,
 `ResrcType_tx` mediumtext ,
 `Left_id` int(11) ,
 `Right_id` int(11) ,
 `Level_id` int(11) ,
 `Order_id` int(11) 
)*/;

/*Table structure for table `tvwresource_company` */

DROP TABLE IF EXISTS `tvwresource_company`;

/*!50001 DROP VIEW IF EXISTS `tvwresource_company` */;
/*!50001 DROP TABLE IF EXISTS `tvwresource_company` */;

/*!50001 CREATE TABLE  `tvwresource_company`(
 `Resrc_id` int(11) ,
 `Resrc_tp` varchar(64) ,
 `Company_id` int(11) ,
 `Company_tp` varchar(64) ,
 `Resrc_nm` varchar(256) ,
 `Resrc_cd` varchar(128) ,
 `Alias_nm` varchar(256) ,
 `Company_nm` varchar(256) ,
 `Company_cd` varchar(32) ,
 `Resrc_tx` mediumtext ,
 `Company_tx` mediumtext ,
 `ADD_dm` datetime ,
 `ADD_nm` varchar(256) ,
 `UPD_dm` datetime ,
 `UPD_nm` varchar(256) ,
 `DEL_dm` datetime ,
 `DEL_nm` varchar(256) 
)*/;

/*Table structure for table `tvwresource_contact` */

DROP TABLE IF EXISTS `tvwresource_contact`;

/*!50001 DROP VIEW IF EXISTS `tvwresource_contact` */;
/*!50001 DROP TABLE IF EXISTS `tvwresource_contact` */;

/*!50001 CREATE TABLE  `tvwresource_contact`(
 `Resrc_id` int(11) ,
 `Resrc_tp` varchar(64) ,
 `Contact_id` int(11) ,
 `Contact_tp` varchar(64) ,
 `Contact_nm` varchar(256) ,
 `Contact_cd` varchar(128) ,
 `Alias_nm` varchar(256) ,
 `Address_nm` varchar(256) ,
 `City_cd` varchar(128) ,
 `State_cd` varchar(128) ,
 `Zip_cd` varchar(128) ,
 `Phone_cd` varchar(128) ,
 `GPS_cd` varchar(128) ,
 `Resrc_tx` mediumtext ,
 `Contact_tx` mediumtext ,
 `ADD_dm` datetime ,
 `ADD_nm` varchar(256) ,
 `UPD_dm` datetime ,
 `UPD_nm` varchar(256) ,
 `DEL_dm` datetime ,
 `DEL_nm` varchar(256) 
)*/;

/*Table structure for table `tvwresourcetype` */

DROP TABLE IF EXISTS `tvwresourcetype`;

/*!50001 DROP VIEW IF EXISTS `tvwresourcetype` */;
/*!50001 DROP TABLE IF EXISTS `tvwresourcetype` */;

/*!50001 CREATE TABLE  `tvwresourcetype`(
 `Resrc_tp` varchar(64) ,
 `ParentResrc_tp` varchar(64) ,
 `ResrcType_tx` mediumtext ,
 `Left_id` int(11) ,
 `Right_id` int(11) ,
 `Level_id` int(11) ,
 `Order_id` int(11) 
)*/;

/*Table structure for table `tvwuser` */

DROP TABLE IF EXISTS `tvwuser`;

/*!50001 DROP VIEW IF EXISTS `tvwuser` */;
/*!50001 DROP TABLE IF EXISTS `tvwuser` */;

/*!50001 CREATE TABLE  `tvwuser`(
 `User_id` int(11) ,
 `User_tp` varchar(64) ,
 `User_nm` varchar(256) ,
 `User_cd` varchar(128) ,
 `Hashed_cd` varchar(128) ,
 `Person_nm` varchar(256) ,
 `Email_nm` varchar(256) ,
 `Challenge_cd` varchar(128) ,
 `Response_cd` varchar(128) ,
 `User_tx` mediumtext ,
 `UserADD_dm` datetime ,
 `UserADD_nm` varchar(256) ,
 `UserUPD_dm` datetime ,
 `UserUPD_nm` varchar(256) ,
 `UserDEL_dm` datetime ,
 `UserDEL_nm` varchar(256) ,
 `ParentUser_tp` varchar(64) ,
 `UserType_tx` mediumtext ,
 `UserTypeLeft_id` int(11) ,
 `UserTypeRight_id` int(11) ,
 `UserTypeLevel_id` int(11) ,
 `UserTypeOrder_id` int(11) 
)*/;

/*Table structure for table `tvwuser_company` */

DROP TABLE IF EXISTS `tvwuser_company`;

/*!50001 DROP VIEW IF EXISTS `tvwuser_company` */;
/*!50001 DROP TABLE IF EXISTS `tvwuser_company` */;

/*!50001 CREATE TABLE  `tvwuser_company`(
 `User_id` int(11) ,
 `User_tp` varchar(64) ,
 `Company_id` int(11) ,
 `Company_tp` varchar(64) ,
 `User_nm` varchar(256) ,
 `User_cd` varchar(128) ,
 `Alias_nm` varchar(256) ,
 `Hashed_cd` varchar(128) ,
 `Person_nm` varchar(256) ,
 `Email_nm` varchar(256) ,
 `Challenge_cd` varchar(128) ,
 `Response_cd` varchar(128) ,
 `Company_nm` varchar(256) ,
 `Company_cd` varchar(32) ,
 `User_tx` mediumtext ,
 `Company_tx` mediumtext ,
 `ADD_dm` datetime ,
 `ADD_nm` varchar(256) ,
 `UPD_dm` datetime ,
 `UPD_nm` varchar(256) ,
 `DEL_dm` datetime ,
 `DEL_nm` varchar(256) 
)*/;

/*Table structure for table `tvwusertype` */

DROP TABLE IF EXISTS `tvwusertype`;

/*!50001 DROP VIEW IF EXISTS `tvwusertype` */;
/*!50001 DROP TABLE IF EXISTS `tvwusertype` */;

/*!50001 CREATE TABLE  `tvwusertype`(
 `User_tp` varchar(64) ,
 `ParentUser_tp` varchar(64) ,
 `UserType_tx` mediumtext ,
 `UserTypeLeft_id` int(11) ,
 `UserTypeRight_id` int(11) ,
 `UserTypeLevel_id` int(11) ,
 `UserTypeOrder_id` int(11) 
)*/;

/*View structure for view company */

/*!50001 DROP TABLE IF EXISTS `company` */;
/*!50001 DROP VIEW IF EXISTS `company` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`innovella`@`localhost` SQL SECURITY DEFINER VIEW `company` AS select `tblcompany`.`Company_id` AS `Company_id`,`tblcompany`.`Company_tp` AS `Company_tp`,`tblcompany`.`Company_nm` AS `Company_nm`,`tblcompany`.`Company_cd` AS `Company_cd`,`resource`.`Resrc_tx` AS `Company_tx`,`resource`.`ADD_dm` AS `CompanyADD_dm`,`resource`.`ADD_nm` AS `CompanyADD_nm`,`resource`.`UPD_dm` AS `CompanyUPD_dm`,`resource`.`UPD_nm` AS `CompanyUPD_nm`,`resource`.`DEL_dm` AS `CompanyDEL_dm`,`resource`.`DEL_nm` AS `CompanyDEL_nm`,`companytype`.`ParentCompany_tp` AS `ParentCompany_tp`,`companytype`.`CompanyType_tx` AS `CompanyType_tx`,`companytype`.`CompanyTypeLeft_id` AS `CompanyTypeLeft_id`,`companytype`.`CompanyTypeRight_id` AS `CompanyTypeRight_id`,`companytype`.`CompanyTypeLevel_id` AS `CompanyTypeLevel_id`,`companytype`.`CompanyTypeOrder_id` AS `CompanyTypeOrder_id` from ((`tblcompany` join `companytype` on((`tblcompany`.`Company_tp` = `companytype`.`Company_tp`))) join `resource` on(((`tblcompany`.`Company_id` = `resource`.`Resrc_id`) and (`tblcompany`.`Company_tp` = `resource`.`Resrc_tp`)))) */;

/*View structure for view companytype */

/*!50001 DROP TABLE IF EXISTS `companytype` */;
/*!50001 DROP VIEW IF EXISTS `companytype` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`innovella`@`localhost` SQL SECURITY DEFINER VIEW `companytype` AS select `tblcompanytype`.`Company_tp` AS `Company_tp`,`tblresourcetype`.`ParentResrc_tp` AS `ParentCompany_tp`,`tblresourcetype`.`ResrcType_tx` AS `CompanyType_tx`,`tblresourcetype`.`Left_id` AS `CompanyTypeLeft_id`,`tblresourcetype`.`Right_id` AS `CompanyTypeRight_id`,`tblresourcetype`.`Level_id` AS `CompanyTypeLevel_id`,`tblresourcetype`.`Order_id` AS `CompanyTypeOrder_id` from (`tblcompanytype` join `tblresourcetype` on((`tblcompanytype`.`Company_tp` = `tblresourcetype`.`Resrc_tp`))) */;

/*View structure for view resource */

/*!50001 DROP TABLE IF EXISTS `resource` */;
/*!50001 DROP VIEW IF EXISTS `resource` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`innovella`@`localhost` SQL SECURITY DEFINER VIEW `resource` AS select `tblresource`.`Resrc_id` AS `Resrc_id`,`tblresource`.`Resrc_tp` AS `Resrc_tp`,`tblresource`.`Resrc_tx` AS `Resrc_tx`,`tblresource`.`ADD_dm` AS `ADD_dm`,`tblresource`.`ADD_nm` AS `ADD_nm`,`tblresource`.`UPD_dm` AS `UPD_dm`,`tblresource`.`UPD_nm` AS `UPD_nm`,`tblresource`.`DEL_dm` AS `DEL_dm`,`tblresource`.`DEL_nm` AS `DEL_nm`,`tblresourcetype`.`ParentResrc_tp` AS `ParentResrc_tp`,`tblresourcetype`.`ResrcType_tx` AS `ResrcType_tx`,`tblresourcetype`.`Left_id` AS `Left_id`,`tblresourcetype`.`Right_id` AS `Right_id`,`tblresourcetype`.`Level_id` AS `Level_id`,`tblresourcetype`.`Order_id` AS `Order_id` from (`tblresource` join `tblresourcetype` on((`tblresource`.`Resrc_tp` = `tblresourcetype`.`Resrc_tp`))) */;

/*View structure for view resourcetype */

/*!50001 DROP TABLE IF EXISTS `resourcetype` */;
/*!50001 DROP VIEW IF EXISTS `resourcetype` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`innovella`@`localhost` SQL SECURITY DEFINER VIEW `resourcetype` AS select `tblresourcetype`.`Resrc_tp` AS `Resrc_tp`,`tblresourcetype`.`ParentResrc_tp` AS `ParentResrc_tp`,`tblresourcetype`.`ResrcType_tx` AS `ResrcType_tx`,`tblresourcetype`.`Left_id` AS `Left_id`,`tblresourcetype`.`Right_id` AS `Right_id`,`tblresourcetype`.`Level_id` AS `Level_id`,`tblresourcetype`.`Order_id` AS `Order_id` from `tblresourcetype` */;

/*View structure for view tvwcompany */

/*!50001 DROP TABLE IF EXISTS `tvwcompany` */;
/*!50001 DROP VIEW IF EXISTS `tvwcompany` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`innovella`@`localhost` SQL SECURITY DEFINER VIEW `tvwcompany` AS select `tblcompany`.`Company_id` AS `Company_id`,`tblcompany`.`Company_tp` AS `Company_tp`,`tblcompany`.`Company_nm` AS `Company_nm`,`tblcompany`.`Company_cd` AS `Company_cd`,`tblresource`.`Resrc_tx` AS `Company_tx`,`tblresource`.`ADD_dm` AS `CompanyADD_dm`,`tblresource`.`ADD_nm` AS `CompanyADD_nm`,`tblresource`.`UPD_dm` AS `CompanyUPD_dm`,`tblresource`.`UPD_nm` AS `CompanyUPD_nm`,`tblresource`.`DEL_dm` AS `CompanyDEL_dm`,`tblresource`.`DEL_nm` AS `CompanyDEL_nm`,`tvwcompanytype`.`ParentCompany_tp` AS `ParentCompany_tp`,`tvwcompanytype`.`CompanyType_tx` AS `CompanyType_tx`,`tvwcompanytype`.`CompanyTypeLeft_id` AS `CompanyTypeLeft_id`,`tvwcompanytype`.`CompanyTypeRight_id` AS `CompanyTypeRight_id`,`tvwcompanytype`.`CompanyTypeLevel_id` AS `CompanyTypeLevel_id`,`tvwcompanytype`.`CompanyTypeOrder_id` AS `CompanyTypeOrder_id` from ((`tblcompany` join `tvwcompanytype` on((`tblcompany`.`Company_tp` = `tvwcompanytype`.`Company_tp`))) join `tblresource` on(((`tblcompany`.`Company_id` = `tblresource`.`Resrc_id`) and (`tblcompany`.`Company_tp` = `tblresource`.`Resrc_tp`)))) */;

/*View structure for view tvwcompanytype */

/*!50001 DROP TABLE IF EXISTS `tvwcompanytype` */;
/*!50001 DROP VIEW IF EXISTS `tvwcompanytype` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`innovella`@`localhost` SQL SECURITY DEFINER VIEW `tvwcompanytype` AS select `tblcompanytype`.`Company_tp` AS `Company_tp`,`tblresourcetype`.`ParentResrc_tp` AS `ParentCompany_tp`,`tblresourcetype`.`ResrcType_tx` AS `CompanyType_tx`,`tblresourcetype`.`Left_id` AS `CompanyTypeLeft_id`,`tblresourcetype`.`Right_id` AS `CompanyTypeRight_id`,`tblresourcetype`.`Level_id` AS `CompanyTypeLevel_id`,`tblresourcetype`.`Order_id` AS `CompanyTypeOrder_id` from (`tblcompanytype` join `tblresourcetype` on((`tblcompanytype`.`Company_tp` = `tblresourcetype`.`Resrc_tp`))) */;

/*View structure for view tvwcontact */

/*!50001 DROP TABLE IF EXISTS `tvwcontact` */;
/*!50001 DROP VIEW IF EXISTS `tvwcontact` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tvwcontact` AS select `tblresource`.`Resrc_id` AS `Contact_id`,`tblresource`.`Resrc_tp` AS `Contact_tp`,`tblresource`.`Resrc_tx` AS `Contact_tx`,`tblresource`.`ADD_dm` AS `ContactADD_dm`,`tblresource`.`ADD_nm` AS `ContactADD_nm`,`tblresource`.`UPD_dm` AS `ContactUPD_dm`,`tblresource`.`UPD_nm` AS `ContactUPD_nm`,`tblresource`.`DEL_dm` AS `ContactDEL_dm`,`tblresource`.`DEL_nm` AS `ContactDEL_nm`,`tvwcontacttype`.`ParentContact_tp` AS `ParentContact_tp`,`tvwcontacttype`.`ContactType_tx` AS `ContactType_tx`,`tvwcontacttype`.`ContactTypeLeft_id` AS `ContactTypeLeft_id`,`tvwcontacttype`.`ContactTypeRight_id` AS `ContactTypeRight_id`,`tvwcontacttype`.`ContactTypeLevel_id` AS `ContactTypeLevel_id`,`tvwcontacttype`.`ContactTypeOrder_id` AS `ContactTypeOrder_id` from (`tblresource` join `tvwcontacttype` on((`tblresource`.`Resrc_tp` = `tvwcontacttype`.`Contact_tp`))) */;

/*View structure for view tvwcontacttype */

/*!50001 DROP TABLE IF EXISTS `tvwcontacttype` */;
/*!50001 DROP VIEW IF EXISTS `tvwcontacttype` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tvwcontacttype` AS select `tblcontacttype`.`Contact_tp` AS `Contact_tp`,`tblresourcetype`.`ParentResrc_tp` AS `ParentContact_tp`,`tblresourcetype`.`ResrcType_tx` AS `ContactType_tx`,`tblresourcetype`.`Left_id` AS `ContactTypeLeft_id`,`tblresourcetype`.`Right_id` AS `ContactTypeRight_id`,`tblresourcetype`.`Level_id` AS `ContactTypeLevel_id`,`tblresourcetype`.`Order_id` AS `ContactTypeOrder_id` from (`tblcontacttype` join `tblresourcetype` on((`tblcontacttype`.`Contact_tp` = `tblresourcetype`.`Resrc_tp`))) */;

/*View structure for view tvwresource */

/*!50001 DROP TABLE IF EXISTS `tvwresource` */;
/*!50001 DROP VIEW IF EXISTS `tvwresource` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`innovella`@`localhost` SQL SECURITY DEFINER VIEW `tvwresource` AS select `tblresource`.`Resrc_id` AS `Resrc_id`,`tblresource`.`Resrc_tp` AS `Resrc_tp`,`tblresource`.`Resrc_tx` AS `Resrc_tx`,`tblresource`.`ADD_dm` AS `ADD_dm`,`tblresource`.`ADD_nm` AS `ADD_nm`,`tblresource`.`UPD_dm` AS `UPD_dm`,`tblresource`.`UPD_nm` AS `UPD_nm`,`tblresource`.`DEL_dm` AS `DEL_dm`,`tblresource`.`DEL_nm` AS `DEL_nm`,`tblresourcetype`.`ParentResrc_tp` AS `ParentResrc_tp`,`tblresourcetype`.`ResrcType_tx` AS `ResrcType_tx`,`tblresourcetype`.`Left_id` AS `Left_id`,`tblresourcetype`.`Right_id` AS `Right_id`,`tblresourcetype`.`Level_id` AS `Level_id`,`tblresourcetype`.`Order_id` AS `Order_id` from (`tblresource` join `tblresourcetype` on((`tblresource`.`Resrc_tp` = `tblresourcetype`.`Resrc_tp`))) */;

/*View structure for view tvwresource_company */

/*!50001 DROP TABLE IF EXISTS `tvwresource_company` */;
/*!50001 DROP VIEW IF EXISTS `tvwresource_company` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`innovella`@`localhost` SQL SECURITY DEFINER VIEW `tvwresource_company` AS select `tblresource_company`.`Resrc_id` AS `Resrc_id`,`tblresource_company`.`Resrc_tp` AS `Resrc_tp`,`tblresource_company`.`Company_id` AS `Company_id`,`tblresource_company`.`Company_tp` AS `Company_tp`,`tblresource_company`.`Resrc_nm` AS `Resrc_nm`,`tblresource_company`.`Resrc_cd` AS `Resrc_cd`,`tblresource_company`.`Alias_nm` AS `Alias_nm`,`tvwcompany`.`Company_nm` AS `Company_nm`,`tvwcompany`.`Company_cd` AS `Company_cd`,`tvwresource`.`Resrc_tx` AS `Resrc_tx`,`tvwcompany`.`Company_tx` AS `Company_tx`,`tblresource_company`.`ADD_dm` AS `ADD_dm`,`tblresource_company`.`ADD_nm` AS `ADD_nm`,`tblresource_company`.`UPD_dm` AS `UPD_dm`,`tblresource_company`.`UPD_nm` AS `UPD_nm`,`tblresource_company`.`DEL_dm` AS `DEL_dm`,`tblresource_company`.`DEL_nm` AS `DEL_nm` from ((`tblresource_company` join `tvwresource` on(((`tblresource_company`.`Resrc_id` = `tvwresource`.`Resrc_id`) and (`tblresource_company`.`Resrc_tp` = `tvwresource`.`Resrc_tp`)))) join `tvwcompany` on(((`tblresource_company`.`Company_id` = `tvwcompany`.`Company_id`) and (`tblresource_company`.`Company_tp` = `tvwcompany`.`Company_tp`)))) */;

/*View structure for view tvwresource_contact */

/*!50001 DROP TABLE IF EXISTS `tvwresource_contact` */;
/*!50001 DROP VIEW IF EXISTS `tvwresource_contact` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tvwresource_contact` AS select `tblresource_contact`.`Resrc_id` AS `Resrc_id`,`tblresource_contact`.`Resrc_tp` AS `Resrc_tp`,`tblresource_contact`.`Contact_id` AS `Contact_id`,`tblresource_contact`.`Contact_tp` AS `Contact_tp`,`tblresource_contact`.`Contact_nm` AS `Contact_nm`,`tblresource_contact`.`Contact_cd` AS `Contact_cd`,`tblresource_contact`.`Alias_nm` AS `Alias_nm`,`tblresource_contact`.`Address_nm` AS `Address_nm`,`tblresource_contact`.`City_cd` AS `City_cd`,`tblresource_contact`.`State_cd` AS `State_cd`,`tblresource_contact`.`Zip_cd` AS `Zip_cd`,`tblresource_contact`.`Phone_cd` AS `Phone_cd`,`tblresource_contact`.`GPS_cd` AS `GPS_cd`,`tvwresource`.`Resrc_tx` AS `Resrc_tx`,`tvwcontact`.`Contact_tx` AS `Contact_tx`,`tblresource_contact`.`ADD_dm` AS `ADD_dm`,`tblresource_contact`.`ADD_nm` AS `ADD_nm`,`tblresource_contact`.`UPD_dm` AS `UPD_dm`,`tblresource_contact`.`UPD_nm` AS `UPD_nm`,`tblresource_contact`.`DEL_dm` AS `DEL_dm`,`tblresource_contact`.`DEL_nm` AS `DEL_nm` from ((`tblresource_contact` join `tvwresource` on(((`tblresource_contact`.`Resrc_id` = `tvwresource`.`Resrc_id`) and (`tblresource_contact`.`Resrc_tp` = `tvwresource`.`Resrc_tp`)))) join `tvwcontact` on(((`tblresource_contact`.`Contact_id` = `tvwcontact`.`Contact_id`) and (`tblresource_contact`.`Contact_tp` = `tvwcontact`.`Contact_tp`)))) */;

/*View structure for view tvwresourcetype */

/*!50001 DROP TABLE IF EXISTS `tvwresourcetype` */;
/*!50001 DROP VIEW IF EXISTS `tvwresourcetype` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`innovella`@`localhost` SQL SECURITY DEFINER VIEW `tvwresourcetype` AS select `tblresourcetype`.`Resrc_tp` AS `Resrc_tp`,`tblresourcetype`.`ParentResrc_tp` AS `ParentResrc_tp`,`tblresourcetype`.`ResrcType_tx` AS `ResrcType_tx`,`tblresourcetype`.`Left_id` AS `Left_id`,`tblresourcetype`.`Right_id` AS `Right_id`,`tblresourcetype`.`Level_id` AS `Level_id`,`tblresourcetype`.`Order_id` AS `Order_id` from `tblresourcetype` */;

/*View structure for view tvwuser */

/*!50001 DROP TABLE IF EXISTS `tvwuser` */;
/*!50001 DROP VIEW IF EXISTS `tvwuser` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tvwuser` AS select `tbluser`.`User_id` AS `User_id`,`tbluser`.`User_tp` AS `User_tp`,`tbluser`.`User_nm` AS `User_nm`,`tbluser`.`User_cd` AS `User_cd`,`tbluser`.`Hashed_cd` AS `Hashed_cd`,`tbluser`.`Person_nm` AS `Person_nm`,`tbluser`.`Email_nm` AS `Email_nm`,`tbluser`.`Challenge_cd` AS `Challenge_cd`,`tbluser`.`Response_cd` AS `Response_cd`,`tblresource`.`Resrc_tx` AS `User_tx`,`tblresource`.`ADD_dm` AS `UserADD_dm`,`tblresource`.`ADD_nm` AS `UserADD_nm`,`tblresource`.`UPD_dm` AS `UserUPD_dm`,`tblresource`.`UPD_nm` AS `UserUPD_nm`,`tblresource`.`DEL_dm` AS `UserDEL_dm`,`tblresource`.`DEL_nm` AS `UserDEL_nm`,`tvwusertype`.`ParentUser_tp` AS `ParentUser_tp`,`tvwusertype`.`UserType_tx` AS `UserType_tx`,`tvwusertype`.`UserTypeLeft_id` AS `UserTypeLeft_id`,`tvwusertype`.`UserTypeRight_id` AS `UserTypeRight_id`,`tvwusertype`.`UserTypeLevel_id` AS `UserTypeLevel_id`,`tvwusertype`.`UserTypeOrder_id` AS `UserTypeOrder_id` from ((`tbluser` join `tvwusertype` on((`tbluser`.`User_tp` = `tvwusertype`.`User_tp`))) join `tblresource` on(((`tbluser`.`User_id` = `tblresource`.`Resrc_id`) and (`tbluser`.`User_tp` = `tblresource`.`Resrc_tp`)))) */;

/*View structure for view tvwuser_company */

/*!50001 DROP TABLE IF EXISTS `tvwuser_company` */;
/*!50001 DROP VIEW IF EXISTS `tvwuser_company` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tvwuser_company` AS select `tvwuser`.`User_id` AS `User_id`,`tvwuser`.`User_tp` AS `User_tp`,`tblresource_company`.`Company_id` AS `Company_id`,`tblresource_company`.`Company_tp` AS `Company_tp`,`tvwuser`.`User_nm` AS `User_nm`,`tvwuser`.`User_cd` AS `User_cd`,`tblresource_company`.`Alias_nm` AS `Alias_nm`,`tvwuser`.`Hashed_cd` AS `Hashed_cd`,`tvwuser`.`Person_nm` AS `Person_nm`,`tvwuser`.`Email_nm` AS `Email_nm`,`tvwuser`.`Challenge_cd` AS `Challenge_cd`,`tvwuser`.`Response_cd` AS `Response_cd`,`tvwcompany`.`Company_nm` AS `Company_nm`,`tvwcompany`.`Company_cd` AS `Company_cd`,`tvwuser`.`User_tx` AS `User_tx`,`tvwcompany`.`Company_tx` AS `Company_tx`,`tblresource_company`.`ADD_dm` AS `ADD_dm`,`tblresource_company`.`ADD_nm` AS `ADD_nm`,`tblresource_company`.`UPD_dm` AS `UPD_dm`,`tblresource_company`.`UPD_nm` AS `UPD_nm`,`tblresource_company`.`DEL_dm` AS `DEL_dm`,`tblresource_company`.`DEL_nm` AS `DEL_nm` from ((`tblresource_company` join `tvwuser` on(((`tblresource_company`.`Resrc_id` = `tvwuser`.`User_id`) and (`tblresource_company`.`Resrc_tp` = `tvwuser`.`User_tp`)))) join `tvwcompany` on(((`tblresource_company`.`Company_id` = `tvwcompany`.`Company_id`) and (`tblresource_company`.`Company_tp` = `tvwcompany`.`Company_tp`)))) */;

/*View structure for view tvwusertype */

/*!50001 DROP TABLE IF EXISTS `tvwusertype` */;
/*!50001 DROP VIEW IF EXISTS `tvwusertype` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`innovella`@`localhost` SQL SECURITY DEFINER VIEW `tvwusertype` AS select `tblusertype`.`User_tp` AS `User_tp`,`tblresourcetype`.`ParentResrc_tp` AS `ParentUser_tp`,`tblresourcetype`.`ResrcType_tx` AS `UserType_tx`,`tblresourcetype`.`Left_id` AS `UserTypeLeft_id`,`tblresourcetype`.`Right_id` AS `UserTypeRight_id`,`tblresourcetype`.`Level_id` AS `UserTypeLevel_id`,`tblresourcetype`.`Order_id` AS `UserTypeOrder_id` from (`tblusertype` join `tblresourcetype` on((`tblusertype`.`User_tp` = `tblresourcetype`.`Resrc_tp`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
