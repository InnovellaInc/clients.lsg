/*
SQLyog Enterprise v11.01 (32 bit)
MySQL - 5.6.10-log : Database - public_lsg
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`public_lsg` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `public_lsg`;

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

insert  into `tblcompany`(`Company_id`,`Company_tp`,`Company_nm`,`Company_cd`) values (2,'Company','Vecchio Trees, LLC.','2|Company'),(8,'Company','Eye of The Day','LSG20140613-2'),(9,'Company','PHP Company-1','PHP Company-1'),(10,'Company','PHP Company-2','PHP Company-2'),(11,'Company','PHP Company-3','CODEs Company-3');

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
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tblresource` */

insert  into `tblresource`(`Resrc_id`,`Resrc_tp`,`Resrc_tx`,`ADD_dm`,`ADD_nm`,`UPD_dm`,`UPD_nm`,`DEL_dm`,`DEL_nm`) values (0,'RESOURCE','Root resource row','2014-05-25 00:00:00','db_service',NULL,NULL,NULL,NULL),(2,'Company','Vecchio Trees, LLC.','2014-05-25 00:00:00','db_service',NULL,NULL,NULL,NULL),(8,'Company','isp test','2014-06-13 19:55:29','innovella@localhost',NULL,NULL,NULL,NULL),(9,'Company','','2014-06-19 23:48:47','innovella@localhost',NULL,NULL,NULL,NULL),(10,'Company','Upd test2','2014-07-17 09:48:50','innovella@localhost','2014-07-27 23:02:27','2014-07-27 23:02:27',NULL,NULL),(11,'Company','uspCompany called from class.Company','2014-06-22 17:15:51','innovella@localhost','2014-06-22 21:14:27','innovella@localhost',NULL,NULL),(12,'User','isp test','2014-06-25 04:16:03','innovella@localhost',NULL,NULL,NULL,NULL),(13,'User','isp test','2014-06-25 04:16:34','innovella@localhost',NULL,NULL,NULL,NULL),(14,'UserAdmin','isp test','2014-06-25 04:25:54','innovella@localhost',NULL,NULL,NULL,NULL),(15,'User',NULL,'2014-06-29 06:37:55','innovella@localhost',NULL,NULL,NULL,NULL),(16,'User',NULL,'2014-06-29 06:44:32','innovella@localhost',NULL,NULL,NULL,NULL),(17,'User',NULL,'2014-06-29 06:45:15','innovella@localhost',NULL,NULL,NULL,NULL),(18,'User',NULL,'2014-06-29 19:24:03','innovella@localhost',NULL,NULL,NULL,NULL),(19,'User',NULL,'2014-06-29 19:24:09','innovella@localhost',NULL,NULL,NULL,NULL),(20,'User','gmccauley','2014-06-29 19:31:31','innovella@localhost',NULL,NULL,NULL,NULL),(21,'User','gmccauley','2014-06-29 19:32:46','innovella@localhost',NULL,NULL,NULL,NULL),(22,'User','gmccauley','2014-06-29 19:33:16','innovella@localhost',NULL,NULL,NULL,NULL),(23,'User','gmccauley','2014-06-29 19:35:28','innovella@localhost',NULL,NULL,NULL,NULL),(24,'User','gmccauley','2014-06-29 19:35:29','innovella@localhost',NULL,NULL,NULL,NULL),(25,'User','gmccauley','2014-06-29 19:35:59','innovella@localhost',NULL,NULL,NULL,NULL),(26,'User','gmccauley','2014-06-29 19:36:04','innovella@localhost',NULL,NULL,NULL,NULL),(27,'User','gmccauley','2014-06-29 19:36:05','innovella@localhost',NULL,NULL,NULL,NULL),(28,'User','test user 1','2014-06-29 19:58:43','innovella@localhost',NULL,NULL,NULL,NULL),(29,'User','test user 1','2014-06-29 19:58:43','innovella@localhost',NULL,NULL,NULL,NULL),(30,'User','test user 1','2014-06-29 19:59:36','innovella@localhost',NULL,NULL,NULL,NULL),(31,'User','test user 1','2014-06-29 19:59:37','innovella@localhost',NULL,NULL,NULL,NULL),(32,'User','test user 1','2014-06-29 20:15:31','innovella@localhost',NULL,NULL,NULL,NULL),(33,'User','test user 1','2014-06-29 20:20:13','innovella@localhost',NULL,NULL,NULL,NULL),(34,'User','test user 1','2014-06-29 20:25:17','innovella@localhost',NULL,NULL,NULL,NULL),(35,'User','test user 1','2014-06-29 20:32:35','innovella@localhost',NULL,NULL,NULL,NULL),(36,'User',NULL,'2014-07-05 22:01:38','root@localhost',NULL,NULL,NULL,NULL),(37,'User','','2014-07-05 23:31:48','root@localhost',NULL,NULL,NULL,NULL),(38,'User','','2014-07-05 23:36:47','root@localhost',NULL,NULL,NULL,NULL),(39,'User','','2014-07-05 23:40:13','root@localhost',NULL,NULL,NULL,NULL),(40,'User','','2014-07-05 23:40:28','root@localhost',NULL,NULL,NULL,NULL),(41,'User','','2014-07-05 23:44:44','root@localhost',NULL,NULL,NULL,NULL),(42,'User','','2014-07-05 23:46:04','root@localhost',NULL,NULL,NULL,NULL),(43,'User','','2014-07-05 23:46:39','root@localhost',NULL,NULL,NULL,NULL),(44,'User','','2014-07-05 23:47:30','root@localhost',NULL,NULL,NULL,NULL),(45,'User','','2014-07-05 23:47:54','root@localhost',NULL,NULL,NULL,NULL),(46,'User','','2014-07-05 23:48:24','root@localhost',NULL,NULL,NULL,NULL),(47,'User','','2014-07-05 23:50:02','root@localhost',NULL,NULL,NULL,NULL),(48,'User','','2014-07-05 23:53:25','root@localhost',NULL,NULL,NULL,NULL),(49,'User','','2014-07-05 23:54:41','root@localhost',NULL,NULL,NULL,NULL),(50,'User','','2014-07-05 23:56:19','root@localhost',NULL,NULL,NULL,NULL),(51,'User','','2014-07-05 23:56:51','root@localhost',NULL,NULL,NULL,NULL),(52,'User','','2014-07-05 23:58:37','root@localhost',NULL,NULL,NULL,NULL),(53,'User','','2014-07-05 23:58:55','root@localhost',NULL,NULL,NULL,NULL),(54,'User',NULL,'2014-07-06 00:01:49','root@localhost',NULL,NULL,NULL,NULL),(55,'User','','2014-07-06 00:06:04','root@localhost',NULL,NULL,NULL,NULL),(56,'User','','2014-07-06 00:06:19','root@localhost',NULL,NULL,NULL,NULL),(57,'User',NULL,'2014-07-06 00:28:28','root@localhost','0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),(58,'User',NULL,'2014-07-06 04:12:01','root@localhost','0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),(59,'UserAdmin',NULL,'2014-07-06 04:28:36','root@localhost','0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),(63,'User','Update Test','2014-07-17 09:48:50','innovella@localhost','2014-07-17 10:34:38','innovella@localhost',NULL,NULL),(64,'User','Update Test','2014-07-17 09:39:18','root@localhost','2014-07-17 09:39:18','innovella@localhost',NULL,NULL),(65,'User','test user 1','2014-07-27 22:20:08','root@localhost','2014-07-28 03:31:43','root@localhost',NULL,NULL),(77,'ContactEmail',NULL,'2014-07-28 02:51:16','root@localhost','2014-07-28 03:30:56','root@localhost',NULL,NULL),(78,'ContactAddress',NULL,'2014-07-28 03:02:07','root@localhost','2014-07-28 03:31:43','root@localhost',NULL,NULL);

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

insert  into `tblresource_company`(`Resrc_id`,`Resrc_tp`,`Company_id`,`Company_tp`,`Resrc_nm`,`Resrc_cd`,`Alias_nm`,`ADD_dm`,`ADD_nm`,`UPD_dm`,`UPD_nm`,`DEL_dm`,`DEL_nm`) values (34,'User',9,'Company','user1','password','test user1','2014-06-29 20:25:17','innovella@localhost',NULL,NULL,NULL,NULL),(35,'User',9,'Company','user2','password','test user1','2014-06-29 20:35:51','innovella@localhost',NULL,NULL,NULL,NULL),(35,'User',10,'Company','user2','password','test user2','2014-06-29 20:37:11','innovella@localhost',NULL,NULL,NULL,NULL),(63,'User',10,'Company','User3','new password','test user3','2014-07-13 21:27:07','root@localhost','2014-07-17 10:34:38','innovella@localhost',NULL,NULL),(64,'User',10,'Company','User5','new password','test user5','2014-07-14 06:24:07','root@localhost',NULL,NULL,NULL,NULL),(65,'User',10,'Company','mpower','mypass','test user1','2014-07-27 22:20:08','root@localhost','2014-07-27 23:02:27','root@localhost',NULL,NULL);

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
  `User_tp` varchar(64) NOT NULL,
  `User_nm` varchar(256) NOT NULL,
  `User_cd` varchar(128) NOT NULL,
  `Hashed_cd` varchar(128) NOT NULL,
  `Domain_cd` varchar(128) DEFAULT NULL,
  `Email_nm` varchar(256) DEFAULT NULL,
  `Challenge_cd` varchar(128) DEFAULT NULL,
  `Response_cd` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`User_id`,`User_tp`),
  UNIQUE KEY `akResource_User` (`User_tp`,`User_nm`),
  CONSTRAINT `fk1User` FOREIGN KEY (`User_tp`) REFERENCES `tblusertype` (`User_tp`),
  CONSTRAINT `fk2User` FOREIGN KEY (`User_id`, `User_tp`) REFERENCES `tblresource` (`Resrc_id`, `Resrc_tp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbluser` */

insert  into `tbluser`(`User_id`,`User_tp`,`User_nm`,`User_cd`,`Hashed_cd`,`Domain_cd`,`Email_nm`,`Challenge_cd`,`Response_cd`) values (34,'User','user1','password','D5D28637ff95fb94bd660e8febd6ab93d8f9d8d8fbff3f0d',NULL,'tu1@vt.com','pet name','Bentley'),(35,'User','user2','password','E80BDB3F5be49571db86ca3796b355b267e71d95a6138515',NULL,'tu1@vt.com','pet name','Bentley'),(63,'User','User3','','',NULL,'test user\'s5',NULL,NULL),(64,'User','User5','','',NULL,'test user5',NULL,NULL),(65,'User','mpower','mypass','7BFB550Db4d2843a7f0addaf58b96fa278014c56c811bc1a',NULL,'tu1@vt.com','pet name','Bentley');

/*Table structure for table `tblusertype` */

DROP TABLE IF EXISTS `tblusertype`;

CREATE TABLE `tblusertype` (
  `User_tp` varchar(64) NOT NULL,
  PRIMARY KEY (`User_tp`),
  CONSTRAINT `fk1UserType` FOREIGN KEY (`User_tp`) REFERENCES `tblresourcetype` (`Resrc_tp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tblusertype` */

insert  into `tblusertype`(`User_tp`) values ('User'),('UserAdmin'),('UserClient'),('UserContact'),('UserServiceAccount'),('UserStaff');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
