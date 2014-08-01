/*
**	Global settings for large AK indexes
*/
SET GLOBAL 	innodb_large_prefix	= 'ON'
;

SET GLOBAL 	innodb_file_format	= 'Barracuda'
;

/*
**
*/
DROP TABLE IF EXISTS	tblContactType
;
CREATE TABLE	tblContactType
(
	Contact_tp VARCHAR(64) NOT NULL

,	PRIMARY KEY (Contact_tp)
,	CONSTRAINT fk1ContactType FOREIGN KEY (Contact_tp) REFERENCES tblresourcetype(Resrc_tp)
)
ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC
;

DROP TABLE IF EXISTS	tblCompany
;
CREATE TABLE	tblcompany
(
	Company_id INT(11) NOT NULL AUTO_INCREMENT
,	Company_tp VARCHAR(64) NOT NULL
,	Company_nm VARCHAR(256) NOT NULL
,	Company_cd VARCHAR(128)
,	PRIMARY KEY (Company_id, Company_tp)
)
ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC
;

CREATE TABLE CompanyType
(
  Company_tp VARCHAR(64) NOT NULL,
  PRIMARY KEY (Company_tp)
)
ENGINE=INNODB CHARSET=utf32 COLLATE=utf32_general_ci ROW_FORMAT=DYNAMIC
;

DROP TABLE IF EXISTS	RightType
;
CREATE TABLE	RightType
(  
	Right_tp VARCHAR(64) NOT NULL
,	PRIMARY KEY (Right_tp)
)
ENGINE=INNODB CHARSET=utf32 COLLATE=utf32_general_ci ROW_FORMAT=DYNAMIC
;

DROP TABLE IF EXISTS	tblUserType
;
CREATE TABLE	tblUserType
(
	User_tp VARCHAR(64) NOT NULL

,	PRIMARY KEY (User_tp)
,	CONSTRAINT fk1UserType FOREIGN KEY (User_tp) REFERENCES tblresourcetype(Resrc_tp)
)
ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC
;

DROP TABLE IF EXISTS	tblUser
;
CREATE TABLE	tblUser
(
	User_id INT(11) NOT NULL
,	User_tp VARCHAR(64) NOT NULL
,	User_nm VARCHAR(256) NOT NULL
,	User_cd VARCHAR(128) NOT NULL
,	Hashed_cd VARCHAR(128) NOT NULL
,	Email_nm VARCHAR(256) NULL
,	Challenge_cd VARCHAR(128) NULL
,	Response_cd VARCHAR(128) NULL
,	PRIMARY KEY (User_id, User_tp)
,	UNIQUE INDEX akResource_User (User_tp, User_nm)
,	CONSTRAINT fk1User FOREIGN KEY (User_tp) REFERENCES tblUserType(User_tp)
,	CONSTRAINT fk2User FOREIGN KEY (User_id, User_tp) REFERENCES tblresource(Resrc_id,Resrc_tp)
)
ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC
;

DROP TABLE IF EXISTS	tblResourceType_CompanyType
;
CREATE TABLE	tblResourceType_CompanyType
(
	Resrc_tp VARCHAR(64) NOT NULL
,	Company_tp VARCHAR(64) NOT NULL
,	PRIMARY KEY (Resrc_tp, Company_tp)

,	CONSTRAINT fk1ResourceType_CompanyType FOREIGN KEY (Resrc_tp) REFERENCES tblresourcetype(Resrc_tp)
,	CONSTRAINT fk2ResourceType_CompanyType FOREIGN KEY (Company_tp) REFERENCES tblcompanytype(Company_tp)
)
ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC
;

DROP TABLE IF EXISTS	tblResource_Company
;
CREATE TABLE	tblResource_Company
(
	Resrc_id INT(11) NOT NULL
,	Resrc_tp VARCHAR(64) NOT NULL
,	Company_id INT(11) NOT NULL
,	Company_tp VARCHAR(64) NOT NULL
,	Resrc_nm VARCHAR(256) NOT NULL
,	Resrc_cd VARCHAR(128)
,	Alias_nm VARCHAR(256) NOT NULL
,	ADD_dm DATETIME NOT NULL
,	ADD_nm VARCHAR(256) NOT NULL
,	UPD_dm DATETIME NULL
,	UPD_nm VARCHAR(256) NULL
,	DEL_dm DATETIME NULL
,	DEL_nm VARCHAR(256) NULL

,	PRIMARY KEY (Resrc_id, Resrc_tp, Company_id, Company_tp)
,	UNIQUE INDEX akResource_Company (Resrc_tp, Company_id, Company_tp, Resrc_nm)
,	CONSTRAINT fk1Resource_Company FOREIGN KEY (Resrc_tp, Company_tp) REFERENCES tblresourcetype_companytype(Resrc_tp, Company_tp)
,	CONSTRAINT fk2Resource_Company FOREIGN KEY (Resrc_id, Resrc_tp) REFERENCES tblresource(Resrc_id,Resrc_tp)
,	CONSTRAINT fk3Resource_Company FOREIGN KEY (Company_id,Company_tp) REFERENCES tblcompany(Company_id,Company_tp)
)
ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC
;

SET GLOBAL 	innodb_large_prefix	= 'ON'
;
SET GLOBAL 	innodb_file_format	= 'Barracuda'
;
DROP TABLE IF EXISTS	tblResource_Contact
;
CREATE TABLE	tblResource_Contact
(
	Resrc_id INT(11) NOT NULL
,	Resrc_tp VARCHAR(64) NOT NULL
,	Contact_id INT(11) NOT NULL
,	Contact_tp VARCHAR(64) NOT NULL
,	Contact_nm VARCHAR(256) NOT NULL
,	Contact_cd VARCHAR(128)
,	Alias_nm VARCHAR(256) NOT NULL
,	Address_nm VARCHAR(256)
,	City_cd VARCHAR(128)
,	State_cd VARCHAR(128)
,	Zip_cd VARCHAR(128)
,	Phone_cd VARCHAR(128)
,	GPS_cd VARCHAR(128)
,	ADD_dm DATETIME NOT NULL
,	ADD_nm VARCHAR(256) NOT NULL
,	UPD_dm DATETIME NULL
,	UPD_nm VARCHAR(256) NULL
,	DEL_dm DATETIME NULL
,	DEL_nm VARCHAR(256) NULL

,	PRIMARY KEY (Resrc_id, Resrc_tp, Contact_id, Contact_tp)
,	UNIQUE INDEX akResource_Contact (Resrc_tp, Contact_tp, Contact_nm)
,	CONSTRAINT fk1Resource_Contact FOREIGN KEY (Resrc_tp) REFERENCES tblresourcetype(Resrc_tp)
,	CONSTRAINT fk2Resource_Contact FOREIGN KEY (Contact_tp) REFERENCES tblContactType(Contact_tp)
,	CONSTRAINT fk3Resource_Contact FOREIGN KEY (Resrc_id, Resrc_tp) REFERENCES tblresource(Resrc_id,Resrc_tp)
,	CONSTRAINT fk4Resource_Contact FOREIGN KEY (Contact_id, Contact_tp) REFERENCES tblresource(Resrc_id,Resrc_tp)
)
ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC
;


