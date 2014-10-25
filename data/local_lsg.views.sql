/*
SQLyog Enterprise v11.01 (64 bit)
MySQL - 5.6.10-log : Database - local_lsg
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table company */


/*Table structure for table tvwcompany */

DROP TABLE IF EXISTS tvwcompany;

/*!50001 DROP VIEW IF EXISTS tvwcompany */;
/*!50001 DROP TABLE IF EXISTS tvwcompany */;

/*!50001 CREATE TABLE  tvwcompany(
 Company_id int(11) ,
 Company_tp varchar(64) ,
 Company_nm varchar(256) ,
 Company_cd varchar(32) ,
 Company_tx mediumtext ,
 CompanyADD_dm datetime ,
 CompanyADD_nm varchar(256) ,
 CompanyUPD_dm datetime ,
 CompanyUPD_nm varchar(256) ,
 CompanyDEL_dm datetime ,
 CompanyDEL_nm varchar(256) ,
 ParentCompany_tp varchar(64) ,
 CompanyType_tx mediumtext ,
 CompanyTypeLeft_id int(11) ,
 CompanyTypeRight_id int(11) ,
 CompanyTypeLevel_id int(11) ,
 CompanyTypeOrder_id int(11) 
)*/;

/*Table structure for table tvwcompanytype */

DROP TABLE IF EXISTS tvwcompanytype;

/*!50001 DROP VIEW IF EXISTS tvwcompanytype */;
/*!50001 DROP TABLE IF EXISTS tvwcompanytype */;

/*!50001 CREATE TABLE  tvwcompanytype(
 Company_tp varchar(64) ,
 ParentCompany_tp varchar(64) ,
 CompanyType_tx mediumtext ,
 CompanyTypeLeft_id int(11) ,
 CompanyTypeRight_id int(11) ,
 CompanyTypeLevel_id int(11) ,
 CompanyTypeOrder_id int(11) 
)*/;

/*Table structure for table tvwcontact */

DROP TABLE IF EXISTS tvwcontact;

/*!50001 DROP VIEW IF EXISTS tvwcontact */;
/*!50001 DROP TABLE IF EXISTS tvwcontact */;

/*!50001 CREATE TABLE  tvwcontact(
 Contact_id int(11) ,
 Contact_tp varchar(64) ,
 Contact_tx mediumtext ,
 ContactADD_dm datetime ,
 ContactADD_nm varchar(256) ,
 ContactUPD_dm datetime ,
 ContactUPD_nm varchar(256) ,
 ContactDEL_dm datetime ,
 ContactDEL_nm varchar(256) ,
 ParentContact_tp varchar(64) ,
 ContactType_tx mediumtext ,
 ContactTypeLeft_id int(11) ,
 ContactTypeRight_id int(11) ,
 ContactTypeLevel_id int(11) ,
 ContactTypeOrder_id int(11) 
)*/;

/*Table structure for table tvwcontacttype */

DROP TABLE IF EXISTS tvwcontacttype;

/*!50001 DROP VIEW IF EXISTS tvwcontacttype */;
/*!50001 DROP TABLE IF EXISTS tvwcontacttype */;

/*!50001 CREATE TABLE  tvwcontacttype(
 Contact_tp varchar(64) ,
 ParentContact_tp varchar(64) ,
 ContactType_tx mediumtext ,
 ContactTypeLeft_id int(11) ,
 ContactTypeRight_id int(11) ,
 ContactTypeLevel_id int(11) ,
 ContactTypeOrder_id int(11) 
)*/;

/*Table structure for table tvwresource */

DROP TABLE IF EXISTS tvwresource;

/*!50001 DROP VIEW IF EXISTS tvwresource */;
/*!50001 DROP TABLE IF EXISTS tvwresource */;

/*!50001 CREATE TABLE  tvwresource(
 Resrc_id int(11) ,
 Resrc_tp varchar(64) ,
 Resrc_tx mediumtext ,
 ADD_dm datetime ,
 ADD_nm varchar(256) ,
 UPD_dm datetime ,
 UPD_nm varchar(256) ,
 DEL_dm datetime ,
 DEL_nm varchar(256) ,
 ParentResrc_tp varchar(64) ,
 ResrcType_tx mediumtext ,
 Left_id int(11) ,
 Right_id int(11) ,
 Level_id int(11) ,
 Order_id int(11) 
)*/;

/*Table structure for table tvwresource_company */

DROP TABLE IF EXISTS tvwresource_company;

/*!50001 DROP VIEW IF EXISTS tvwresource_company */;
/*!50001 DROP TABLE IF EXISTS tvwresource_company */;

/*!50001 CREATE TABLE  tvwresource_company(
 Resrc_id int(11) ,
 Resrc_tp varchar(64) ,
 Company_id int(11) ,
 Company_tp varchar(64) ,
 Resrc_nm varchar(256) ,
 Resrc_cd varchar(128) ,
 Alias_nm varchar(256) ,
 Company_nm varchar(256) ,
 Company_cd varchar(32) ,
 Resrc_tx mediumtext ,
 Company_tx mediumtext ,
 ADD_dm datetime ,
 ADD_nm varchar(256) ,
 UPD_dm datetime ,
 UPD_nm varchar(256) ,
 DEL_dm datetime ,
 DEL_nm varchar(256) 
)*/;

/*Table structure for table tvwresource_contact */

DROP TABLE IF EXISTS tvwresource_contact;

/*!50001 DROP VIEW IF EXISTS tvwresource_contact */;
/*!50001 DROP TABLE IF EXISTS tvwresource_contact */;

/*!50001 CREATE TABLE  tvwresource_contact(
 Resrc_id int(11) ,
 Resrc_tp varchar(64) ,
 Contact_id int(11) ,
 Contact_tp varchar(64) ,
 Contact_nm varchar(256) ,
 Contact_cd varchar(128) ,
 Alias_nm varchar(256) ,
 Address_nm varchar(256) ,
 City_cd varchar(128) ,
 State_cd varchar(128) ,
 Zip_cd varchar(128) ,
 Phone_cd varchar(128) ,
 GPS_cd varchar(128) ,
 Resrc_tx mediumtext ,
 Contact_tx mediumtext ,
 ADD_dm datetime ,
 ADD_nm varchar(256) ,
 UPD_dm datetime ,
 UPD_nm varchar(256) ,
 DEL_dm datetime ,
 DEL_nm varchar(256) 
)*/;

/*Table structure for table tvwresourcetype */

DROP TABLE IF EXISTS tvwresourcetype;

/*!50001 DROP VIEW IF EXISTS tvwresourcetype */;
/*!50001 DROP TABLE IF EXISTS tvwresourcetype */;

/*!50001 CREATE TABLE  tvwresourcetype(
 Resrc_tp varchar(64) ,
 ParentResrc_tp varchar(64) ,
 ResrcType_tx mediumtext ,
 Left_id int(11) ,
 Right_id int(11) ,
 Level_id int(11) ,
 Order_id int(11) 
)*/;

/*Table structure for table tvwuser */

DROP TABLE IF EXISTS tvwuser;

/*!50001 DROP VIEW IF EXISTS tvwuser */;
/*!50001 DROP TABLE IF EXISTS tvwuser */;

/*!50001 CREATE TABLE  tvwuser(
 User_id int(11) ,
 User_tp varchar(64) ,
 User_nm varchar(256) ,
 User_cd varchar(128) ,
 Hashed_cd varchar(128) ,
 Person_nm varchar(256) ,
 Email_nm varchar(256) ,
 Challenge_cd varchar(128) ,
 Response_cd varchar(128) ,
 User_tx mediumtext ,
 UserADD_dm datetime ,
 UserADD_nm varchar(256) ,
 UserUPD_dm datetime ,
 UserUPD_nm varchar(256) ,
 UserDEL_dm datetime ,
 UserDEL_nm varchar(256) ,
 ParentUser_tp varchar(64) ,
 UserType_tx mediumtext ,
 UserTypeLeft_id int(11) ,
 UserTypeRight_id int(11) ,
 UserTypeLevel_id int(11) ,
 UserTypeOrder_id int(11) 
)*/;

/*Table structure for table tvwuser_company */

DROP TABLE IF EXISTS tvwuser_company;

/*!50001 DROP VIEW IF EXISTS tvwuser_company */;
/*!50001 DROP TABLE IF EXISTS tvwuser_company */;

/*!50001 CREATE TABLE  tvwuser_company(
 User_id int(11) ,
 User_tp varchar(64) ,
 Company_id int(11) ,
 Company_tp varchar(64) ,
 User_nm varchar(256) ,
 User_cd varchar(128) ,
 Alias_nm varchar(256) ,
 Hashed_cd varchar(128) ,
 Person_nm varchar(256) ,
 Email_nm varchar(256) ,
 Challenge_cd varchar(128) ,
 Response_cd varchar(128) ,
 Company_nm varchar(256) ,
 Company_cd varchar(32) ,
 User_tx mediumtext ,
 Company_tx mediumtext ,
 ADD_dm datetime ,
 ADD_nm varchar(256) ,
 UPD_dm datetime ,
 UPD_nm varchar(256) ,
 DEL_dm datetime ,
 DEL_nm varchar(256) 
)*/;

/*Table structure for table tvwusertype */

DROP TABLE IF EXISTS tvwusertype;

/*!50001 DROP VIEW IF EXISTS tvwusertype */;
/*!50001 DROP TABLE IF EXISTS tvwusertype */;

/*!50001 CREATE TABLE  tvwusertype(
 User_tp varchar(64) ,
 ParentUser_tp varchar(64) ,
 UserType_tx mediumtext ,
 UserTypeLeft_id int(11) ,
 UserTypeRight_id int(11) ,
 UserTypeLevel_id int(11) ,
 UserTypeOrder_id int(11) 
)*/;

/*View structure for view tvwcompany */

/*!50001 DROP TABLE IF EXISTS tvwcompany */;
/*!50001 DROP VIEW IF EXISTS tvwcompany */;

/*!50001 CREATE  VIEW tvwcompany AS select tblcompany.Company_id AS Company_id,tblcompany.Company_tp AS Company_tp,tblcompany.Company_nm AS Company_nm,tblcompany.Company_cd AS Company_cd,tblresource.Resrc_tx AS Company_tx,tblresource.ADD_dm AS CompanyADD_dm,tblresource.ADD_nm AS CompanyADD_nm,tblresource.UPD_dm AS CompanyUPD_dm,tblresource.UPD_nm AS CompanyUPD_nm,tblresource.DEL_dm AS CompanyDEL_dm,tblresource.DEL_nm AS CompanyDEL_nm,tvwcompanytype.ParentCompany_tp AS ParentCompany_tp,tvwcompanytype.CompanyType_tx AS CompanyType_tx,tvwcompanytype.CompanyTypeLeft_id AS CompanyTypeLeft_id,tvwcompanytype.CompanyTypeRight_id AS CompanyTypeRight_id,tvwcompanytype.CompanyTypeLevel_id AS CompanyTypeLevel_id,tvwcompanytype.CompanyTypeOrder_id AS CompanyTypeOrder_id from ((tblcompany join tvwcompanytype on((tblcompany.Company_tp = tvwcompanytype.Company_tp))) join tblresource on(((tblcompany.Company_id = tblresource.Resrc_id) and (tblcompany.Company_tp = tblresource.Resrc_tp)))) */;

/*View structure for view tvwcompanytype */

/*!50001 DROP TABLE IF EXISTS tvwcompanytype */;
/*!50001 DROP VIEW IF EXISTS tvwcompanytype */;

/*!50001 CREATE  VIEW tvwcompanytype AS select tblcompanytype.Company_tp AS Company_tp,tblresourcetype.ParentResrc_tp AS ParentCompany_tp,tblresourcetype.ResrcType_tx AS CompanyType_tx,tblresourcetype.Left_id AS CompanyTypeLeft_id,tblresourcetype.Right_id AS CompanyTypeRight_id,tblresourcetype.Level_id AS CompanyTypeLevel_id,tblresourcetype.Order_id AS CompanyTypeOrder_id from (tblcompanytype join tblresourcetype on((tblcompanytype.Company_tp = tblresourcetype.Resrc_tp))) */;

/*View structure for view tvwcontact */

/*!50001 DROP TABLE IF EXISTS tvwcontact */;
/*!50001 DROP VIEW IF EXISTS tvwcontact */;

/*!50001 CREATE  VIEW tvwcontact AS select tblresource.Resrc_id AS Contact_id,tblresource.Resrc_tp AS Contact_tp,tblresource.Resrc_tx AS Contact_tx,tblresource.ADD_dm AS ContactADD_dm,tblresource.ADD_nm AS ContactADD_nm,tblresource.UPD_dm AS ContactUPD_dm,tblresource.UPD_nm AS ContactUPD_nm,tblresource.DEL_dm AS ContactDEL_dm,tblresource.DEL_nm AS ContactDEL_nm,tvwcontacttype.ParentContact_tp AS ParentContact_tp,tvwcontacttype.ContactType_tx AS ContactType_tx,tvwcontacttype.ContactTypeLeft_id AS ContactTypeLeft_id,tvwcontacttype.ContactTypeRight_id AS ContactTypeRight_id,tvwcontacttype.ContactTypeLevel_id AS ContactTypeLevel_id,tvwcontacttype.ContactTypeOrder_id AS ContactTypeOrder_id from (tblresource join tvwcontacttype on((tblresource.Resrc_tp = tvwcontacttype.Contact_tp))) */;

/*View structure for view tvwcontacttype */

/*!50001 DROP TABLE IF EXISTS tvwcontacttype */;
/*!50001 DROP VIEW IF EXISTS tvwcontacttype */;

/*!50001 CREATE  VIEW tvwcontacttype AS select tblcontacttype.Contact_tp AS Contact_tp,tblresourcetype.ParentResrc_tp AS ParentContact_tp,tblresourcetype.ResrcType_tx AS ContactType_tx,tblresourcetype.Left_id AS ContactTypeLeft_id,tblresourcetype.Right_id AS ContactTypeRight_id,tblresourcetype.Level_id AS ContactTypeLevel_id,tblresourcetype.Order_id AS ContactTypeOrder_id from (tblcontacttype join tblresourcetype on((tblcontacttype.Contact_tp = tblresourcetype.Resrc_tp))) */;

/*View structure for view tvwresource */

/*!50001 DROP TABLE IF EXISTS tvwresource */;
/*!50001 DROP VIEW IF EXISTS tvwresource */;

/*!50001 CREATE  VIEW tvwresource AS select tblresource.Resrc_id AS Resrc_id,tblresource.Resrc_tp AS Resrc_tp,tblresource.Resrc_tx AS Resrc_tx,tblresource.ADD_dm AS ADD_dm,tblresource.ADD_nm AS ADD_nm,tblresource.UPD_dm AS UPD_dm,tblresource.UPD_nm AS UPD_nm,tblresource.DEL_dm AS DEL_dm,tblresource.DEL_nm AS DEL_nm,tblresourcetype.ParentResrc_tp AS ParentResrc_tp,tblresourcetype.ResrcType_tx AS ResrcType_tx,tblresourcetype.Left_id AS Left_id,tblresourcetype.Right_id AS Right_id,tblresourcetype.Level_id AS Level_id,tblresourcetype.Order_id AS Order_id from (tblresource join tblresourcetype on((tblresource.Resrc_tp = tblresourcetype.Resrc_tp))) */;

/*View structure for view tvwresource_company */

/*!50001 DROP TABLE IF EXISTS tvwresource_company */;
/*!50001 DROP VIEW IF EXISTS tvwresource_company */;

/*!50001 CREATE  VIEW tvwresource_company AS select tblresource_company.Resrc_id AS Resrc_id,tblresource_company.Resrc_tp AS Resrc_tp,tblresource_company.Company_id AS Company_id,tblresource_company.Company_tp AS Company_tp,tblresource_company.Resrc_nm AS Resrc_nm,tblresource_company.Resrc_cd AS Resrc_cd,tblresource_company.Alias_nm AS Alias_nm,tvwcompany.Company_nm AS Company_nm,tvwcompany.Company_cd AS Company_cd,tvwresource.Resrc_tx AS Resrc_tx,tvwcompany.Company_tx AS Company_tx,tblresource_company.ADD_dm AS ADD_dm,tblresource_company.ADD_nm AS ADD_nm,tblresource_company.UPD_dm AS UPD_dm,tblresource_company.UPD_nm AS UPD_nm,tblresource_company.DEL_dm AS DEL_dm,tblresource_company.DEL_nm AS DEL_nm from ((tblresource_company join tvwresource on(((tblresource_company.Resrc_id = tvwresource.Resrc_id) and (tblresource_company.Resrc_tp = tvwresource.Resrc_tp)))) join tvwcompany on(((tblresource_company.Company_id = tvwcompany.Company_id) and (tblresource_company.Company_tp = tvwcompany.Company_tp)))) */;

/*View structure for view tvwresource_contact */

/*!50001 DROP TABLE IF EXISTS tvwresource_contact */;
/*!50001 DROP VIEW IF EXISTS tvwresource_contact */;

/*!50001 CREATE  VIEW tvwresource_contact AS select tblresource_contact.Resrc_id AS Resrc_id,tblresource_contact.Resrc_tp AS Resrc_tp,tblresource_contact.Contact_id AS Contact_id,tblresource_contact.Contact_tp AS Contact_tp,tblresource_contact.Contact_nm AS Contact_nm,tblresource_contact.Contact_cd AS Contact_cd,tblresource_contact.Alias_nm AS Alias_nm,tblresource_contact.Address_nm AS Address_nm,tblresource_contact.City_cd AS City_cd,tblresource_contact.State_cd AS State_cd,tblresource_contact.Zip_cd AS Zip_cd,tblresource_contact.Phone_cd AS Phone_cd,tblresource_contact.GPS_cd AS GPS_cd,tvwresource.Resrc_tx AS Resrc_tx,tvwcontact.Contact_tx AS Contact_tx,tblresource_contact.ADD_dm AS ADD_dm,tblresource_contact.ADD_nm AS ADD_nm,tblresource_contact.UPD_dm AS UPD_dm,tblresource_contact.UPD_nm AS UPD_nm,tblresource_contact.DEL_dm AS DEL_dm,tblresource_contact.DEL_nm AS DEL_nm from ((tblresource_contact join tvwresource on(((tblresource_contact.Resrc_id = tvwresource.Resrc_id) and (tblresource_contact.Resrc_tp = tvwresource.Resrc_tp)))) join tvwcontact on(((tblresource_contact.Contact_id = tvwcontact.Contact_id) and (tblresource_contact.Contact_tp = tvwcontact.Contact_tp)))) */;

/*View structure for view tvwresourcetype */

/*!50001 DROP TABLE IF EXISTS tvwresourcetype */;
/*!50001 DROP VIEW IF EXISTS tvwresourcetype */;

/*!50001 CREATE  VIEW tvwresourcetype AS select tblresourcetype.Resrc_tp AS Resrc_tp,tblresourcetype.ParentResrc_tp AS ParentResrc_tp,tblresourcetype.ResrcType_tx AS ResrcType_tx,tblresourcetype.Left_id AS Left_id,tblresourcetype.Right_id AS Right_id,tblresourcetype.Level_id AS Level_id,tblresourcetype.Order_id AS Order_id from tblresourcetype */;

/*View structure for view tvwuser */

/*!50001 DROP TABLE IF EXISTS tvwuser */;
/*!50001 DROP VIEW IF EXISTS tvwuser */;

/*!50001 CREATE  VIEW tvwuser AS select tbluser.User_id AS User_id,tbluser.User_tp AS User_tp,tbluser.User_nm AS User_nm,tbluser.User_cd AS User_cd,tbluser.Hashed_cd AS Hashed_cd,tbluser.Person_nm AS Person_nm,tbluser.Email_nm AS Email_nm,tbluser.Challenge_cd AS Challenge_cd,tbluser.Response_cd AS Response_cd,tblresource.Resrc_tx AS User_tx,tblresource.ADD_dm AS UserADD_dm,tblresource.ADD_nm AS UserADD_nm,tblresource.UPD_dm AS UserUPD_dm,tblresource.UPD_nm AS UserUPD_nm,tblresource.DEL_dm AS UserDEL_dm,tblresource.DEL_nm AS UserDEL_nm,tvwusertype.ParentUser_tp AS ParentUser_tp,tvwusertype.UserType_tx AS UserType_tx,tvwusertype.UserTypeLeft_id AS UserTypeLeft_id,tvwusertype.UserTypeRight_id AS UserTypeRight_id,tvwusertype.UserTypeLevel_id AS UserTypeLevel_id,tvwusertype.UserTypeOrder_id AS UserTypeOrder_id from ((tbluser join tvwusertype on((tbluser.User_tp = tvwusertype.User_tp))) join tblresource on(((tbluser.User_id = tblresource.Resrc_id) and (tbluser.User_tp = tblresource.Resrc_tp)))) */;

/*View structure for view tvwuser_company */

/*!50001 DROP TABLE IF EXISTS tvwuser_company */;
/*!50001 DROP VIEW IF EXISTS tvwuser_company */;

/*!50001 CREATE  VIEW tvwuser_company AS select tvwuser.User_id AS User_id,tvwuser.User_tp AS User_tp,tblresource_company.Company_id AS Company_id,tblresource_company.Company_tp AS Company_tp,tvwuser.User_nm AS User_nm,tvwuser.User_cd AS User_cd,tblresource_company.Alias_nm AS Alias_nm,tvwuser.Hashed_cd AS Hashed_cd,tvwuser.Person_nm AS Person_nm,tvwuser.Email_nm AS Email_nm,tvwuser.Challenge_cd AS Challenge_cd,tvwuser.Response_cd AS Response_cd,tvwcompany.Company_nm AS Company_nm,tvwcompany.Company_cd AS Company_cd,tvwuser.User_tx AS User_tx,tvwcompany.Company_tx AS Company_tx,tblresource_company.ADD_dm AS ADD_dm,tblresource_company.ADD_nm AS ADD_nm,tblresource_company.UPD_dm AS UPD_dm,tblresource_company.UPD_nm AS UPD_nm,tblresource_company.DEL_dm AS DEL_dm,tblresource_company.DEL_nm AS DEL_nm from ((tblresource_company join tvwuser on(((tblresource_company.Resrc_id = tvwuser.User_id) and (tblresource_company.Resrc_tp = tvwuser.User_tp)))) join tvwcompany on(((tblresource_company.Company_id = tvwcompany.Company_id) and (tblresource_company.Company_tp = tvwcompany.Company_tp)))) */;

/*View structure for view tvwusertype */

/*!50001 DROP TABLE IF EXISTS tvwusertype */;
/*!50001 DROP VIEW IF EXISTS tvwusertype */;

/*!50001 CREATE  VIEW tvwusertype AS select tblusertype.User_tp AS User_tp,tblresourcetype.ParentResrc_tp AS ParentUser_tp,tblresourcetype.ResrcType_tx AS UserType_tx,tblresourcetype.Left_id AS UserTypeLeft_id,tblresourcetype.Right_id AS UserTypeRight_id,tblresourcetype.Level_id AS UserTypeLevel_id,tblresourcetype.Order_id AS UserTypeOrder_id from (tblusertype join tblresourcetype on((tblusertype.User_tp = tblresourcetype.Resrc_tp))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
