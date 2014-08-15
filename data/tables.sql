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

/*Table structure for table `tblcompanytype` */

DROP TABLE IF EXISTS `tblcompanytype`;

CREATE TABLE `tblcompanytype` (
  `Company_tp` varchar(64) NOT NULL,
  PRIMARY KEY (`Company_tp`),
  CONSTRAINT `fk1CompanyType` FOREIGN KEY (`Company_tp`) REFERENCES `tblresourcetype` (`Resrc_tp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tblcontacttype` */

DROP TABLE IF EXISTS `tblcontacttype`;

CREATE TABLE `tblcontacttype` (
  `Contact_tp` varchar(64) NOT NULL,
  PRIMARY KEY (`Contact_tp`),
  CONSTRAINT `fk1ContactType` FOREIGN KEY (`Contact_tp`) REFERENCES `tblresourcetype` (`Resrc_tp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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

/*Table structure for table `tblusertype` */

DROP TABLE IF EXISTS `tblusertype`;

CREATE TABLE `tblusertype` (
  `User_tp` varchar(64) NOT NULL,
  PRIMARY KEY (`User_tp`),
  CONSTRAINT `fk1UserType` FOREIGN KEY (`User_tp`) REFERENCES `tblresourcetype` (`Resrc_tp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
