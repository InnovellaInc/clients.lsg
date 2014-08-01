INSERT INTO tblresourcetype_companytype
VALUES ("User","Company");
INSERT INTO tblresourcetype_companytype
VALUES ("UserAdmin","Company");

CALL ispResourceType
(
	@Resrc_tp	:= "T3"
,	@ParentResrc_tp	:= NULL
,	@ResrcType_tx	:= NULL
,	@Left_id	:= NULL
,	@Right_id	:= NULL
,	@Level_id	:= NULL
,	@Order_id	:= NULL

,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Mode_cd	:= "DD"
);

SELECT *
FROM tblresourcetype
;


SET @Resrc_id	= 4;
CALL	ispResource
(
	@Resrc_id
,	@Resrc_tp	:= "T1"
,	@Resrc_tx	:= "isp test"
,	@ADD_dm	:= NULL
,	@ADD_nm	:= NULL
,	@UPD_dm	:= NULL
,	@UPD_nm	:= NULL
,	@DEL_dm	:= NULL
,	@DEL_nm	:= NULL
,	@ParentResrc_tp	:= NULL
,	@ResrcType_tx	:= NULL
,	@Left_id	:= NULL
,	@Right_id	:= NULL
,	@Level_id	:= NULL
,	@Order_id	:= NULL
,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Mode_cd	:= NULL
)
;
SELECT *
FROM tvwresource
;



CALL ispCompanyType
(
	@Company_tp	:= "CompanyClass123"
,	@ParentCompany_tp	:= "Company"
,	@CompanyType_tx	:= NULL
,	@Left_id	:= NULL
,	@Right_id	:= NULL
,	@Level_id	:= NULL
,	@Order_id	:= NULL

,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Mode_cd	:= "C"
);

SELECT *
FROM tvwcompanytype
;


SET @Company_id	= NULL;
CALL	ispCompany
(
	@Company_id
,	@Company_tp	:= "Company"
,	@Company_nm	:= "Eye of The Day"
,	@Company_cd	:= "LSG20140613-2"
,	@Company_tx	:= "isp test"
,	@CompanyADD_dm	:= NULL
,	@CompanyADD_nm	:= NULL
,	@CompanyUPD_dm	:= NULL
,	@CompanyUPD_nm	:= NULL
,	@CompanyDEL_dm	:= NULL
,	@CompanyDEL_nm	:= NULL
,	@ParentCompany_tp	:= NULL
,	@CompanyType_tx	:= NULL
,	@CompanyTypeLeft_id	:= NULL
,	@CompanyTypeRight_id	:= NULL
,	@CompanyTypeLevel_id	:= NULL
,	@CompanyTypeOrder_id	:= NULL

,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Mode_cd	:= "C"
)
;
SELECT *
FROM tvwcompany
;

CALL gfpCompanyType
(
	@Company_tp	:= "Company"
,	@ParentCompany_tp	:= NULL
,	@CompanyType_tx	:= NULL
,	@Left_id	:= NULL
,	@Right_id	:= NULL
,	@Level_id	:= NULL
,	@Order_id	:= NULL

,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Key_cd	:= "AL"
)
;

CALL	gfpCompany
(
	@Company_id	:= 6
,	@Company_tp	:= "Company"
,	@Company_nm	:= "Eye of The Day"
,	@Company_cd	:= NULL -- "LSG20140613-2"
,	@Company_tx	:= NULL
,	@CompanyADD_dm	:= NULL
,	@CompanyADD_nm	:= NULL
,	@CompanyUPD_dm	:= NULL
,	@CompanyUPD_nm	:= NULL
,	@CompanyDEL_dm	:= NULL
,	@CompanyDEL_nm	:= NULL
,	@ParentCompany_tp	:= NULL
,	@CompanyType_tx	:= NULL
,	@CompanyTypeLeft_id	:= NULL
,	@CompanyTypeRight_id	:= NULL
,	@CompanyTypeLevel_id	:= NULL
,	@CompanyTypeOrder_id	:= NULL

,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Key_cd	:= "PK"
)
;

/*
**	***************************************************************
**	TYPES (DOMAIN)
**	***************************************************************
*/
CALL ispResourceType
(
	@Resrc_tp	:= "User"
,	@ParentResrc_tp	:= "RESOURCE"
,	@ResrcType_tx	:= "User domain type."
,	@Left_id	:= NULL
,	@Right_id	:= NULL
,	@Level_id	:= NULL
,	@Order_id	:= NULL

,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Mode_cd	:= "C"
);

CALL ispResourceType
(
	@Resrc_tp	:= "UserAdmin"
,	@ParentResrc_tp	:= "User"
,	@ResrcType_tx	:= "Admin account for authentication and authorization."
,	@Left_id	:= NULL
,	@Right_id	:= NULL
,	@Level_id	:= NULL
,	@Order_id	:= NULL

,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Mode_cd	:= "C"
);

CALL ispUserType
(
	@User_tp	:= "User"
,	@ParentUser_tp	:= "RESOURCE"
,	@UserType_tx	:= NULL
,	@Left_id	:= NULL
,	@Right_id	:= NULL
,	@Level_id	:= NULL
,	@Order_id	:= NULL

,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Mode_cd	:= "C"
);
CALL ispUserType
(
	@User_tp	:= "UserAdmin"
,	@ParentUser_tp	:= "User"
,	@UserType_tx	:= NULL
,	@Left_id	:= NULL
,	@Right_id	:= NULL
,	@Level_id	:= NULL
,	@Order_id	:= NULL

,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Mode_cd	:= "C"
);
/*
**	***************************************************************
**	RESOURCES (KEY)
**	***************************************************************
*/

SELECT @salt;
UPDATE  tblUser
SET     Hashed_cd = CONCAT(@salt, SHA(CONCAT(@salt, "Innovella123")))
;
SELECT *
FROM tvwuser
WHERE SHA(CONCAT(SUBSTRING(Hashed_cd, 1, 8), "Innovella123")) = SUBSTRING(Hashed_cd, 9, 40)
;

SET @salt := LPAD(CONV(FLOOR(RAND() * 0x100000000), 10, 16), 8 ,'0');
SET @Hashed_cd = CONCAT(@salt, SHA(CONCAT(@salt, "Innovella123")));
SET @User_id	= NULL;
CALL	ispUser
(
	@User_id
,	@User_tp	:= "User"
,	@User_nm	:= "Administrator"
,	@User_cd	:= "Innovella123"
,	@Hashed_cd
,	@Email_nm	:= "sysadmin@landscapegalleria.com"
,	@Challenge_cd	:= NULL
,	@Response_cd	:= NULL
,	@User_tx	:= "isp test"
,	@UserADD_dm	:= NULL
,	@UserADD_nm	:= NULL
,	@UserUPD_dm	:= NULL
,	@UserUPD_nm	:= NULL
,	@UserDEL_dm	:= NULL
,	@UserDEL_nm	:= NULL
,	@ParentUser_tp	:= NULL
,	@UserType_tx	:= NULL
,	@UserTypeLeft_id	:= NULL
,	@UserTypeRight_id	:= NULL
,	@UserTypeLevel_id	:= NULL
,	@UserTypeOrder_id	:= NULL

,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Mode_cd	:= "C"
)
;

SET @Resrc_id = 13; SET @Company_id = 2;
CALL	ispResource_Company
(
	@Resrc_id
,	@Resrc_tp	:= "User"
,	@Company_id
,	@Company_tp	:= "Company"
,	@Resrc_nm	:= "Super User"
,	@Resrc_cd	:= NULL
,	@Alias_nm	:= "Paul McCauley"
,	@ADD_dm	:= NULL
,	@ADD_nm	:= NULL
,	@UPD_dm	:= NULL
,	@UPD_nm	:= NULL
,	@DEL_dm	:= NULL
,	@DEL_nm	:= NULL
,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Mode_cd	:= NULL
)
;

SET @User_id = NULL; SET @Company_id = 2;
CALL	ispUser_Company
(
	@User_id
,	@User_tp	:= "User"
,	@Company_id
,	@Company_tp	:= "Company"
,	@Resrc_nm	:= "gmccauley"
,	@Resrc_cd	:= "password"
,	@Alias_nm	:= "Gretchen McCauley"
,	@Hashed_cd	:= NULL
,	@Email_nm	:= "gmccauley@vt.com"
,	@Challenge_cd	:= "pet name"
,	@Response_cd	:= "Bentley"
,	@User_tx	:= NULL
,	@ADD_dm	:= NULL
,	@ADD_nm	:= NULL
,	@UPD_dm	:= NULL
,	@UPD_nm	:= NULL
,	@DEL_dm	:= NULL
,	@DEL_nm	:= NULL
,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Mode_cd	:= "C"
)
;

SELECT *
FROM tvwUser_Company
;



SET @User_id = NULL; SET @Company_id = NULL;
CALL	ispUser_Company
(
	@User_id
,	@User_tp	:= "User"
,	@Company_id
,	@Company_tp	:= "Company"
,	@User_nm	:= "user4"
,	@User_cd	:= "password"
,	@Alias_nm	:= "test user1"
,	@Hashed_cd	:= NULL
,	@Email_nm	:= "tu1@vt.com"
,	@Challenge_cd	:= "pet name"
,	@Response_cd	:= "Bentley"
,	@Company_nm := "PHP Company-2"
,	@Company_cd := NULL
,	@User_tx	:= "test user 1"
,	@Company_tx := NULL
,	@ADD_dm	:= NULL
,	@ADD_nm	:= NULL
,	@UPD_dm	:= NULL
,	@UPD_nm	:= NULL
,	@DEL_dm	:= NULL
,	@DEL_nm	:= NULL
,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Mode_cd	:= "C"
)
;


CALL	uspUser_Company
(
	@User_id	:= 65
,	@User_tp	:= "User"
,	@Company_id	:= 10
,	@Company_tp	:= "Company"
,	@User_nm	:= ""
,	@User_cd	:= "mypass"
,	@Alias_nm	:= "test user1"
,	@Hashed_cd	:= NULL
,	@Email_nm	:= "tu1@vt.com"
,	@Challenge_cd	:= "pet name"
,	@Response_cd	:= "Bentley"
,	@Company_nm := "PHP Company-2"
,	@Company_cd := NULL
,	@User_tx	:= "test user 1"
,	@Company_tx := NULL
,	@ADD_dm	:= NULL
,	@ADD_nm	:= NULL
,	@UPD_dm	:= NULL
,	@UPD_nm	:= NULL
,	@DEL_dm	:= NULL
,	@DEL_nm	:= NULL
,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Mode_cd	:= "C"
)
;

CALL	ispContactType
(
	@Contact_tp	:= "Contact"
,	@ParentContact_tp	:= "RESOURCE"
,	@ContactType_tx	:= "Contact Types"	
,	@ContactTypeLeft_id	:= NULL
,	@ContactTypeRight_id	:= NULL
,	@ContactTypeLevel_id	:= NULL
,	@ContactTypeOrder_id	:= NULL

,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Mode_cd	:= "C"
)
;
CALL	ispContactType
(
	@Contact_tp	:= "ContactAddress"
,	@ParentContact_tp	:= "Contact"
,	@ContactType_tx	:= "Contact Types"	
,	@ContactTypeLeft_id	:= NULL
,	@ContactTypeRight_id	:= NULL
,	@ContactTypeLevel_id	:= NULL
,	@ContactTypeOrder_id	:= NULL

,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Mode_cd	:= "C"
)
;
CALL	ispContactType
(
	@Contact_tp	:= "ContactEmail"
,	@ParentContact_tp	:= "Contact"
,	@ContactType_tx	:= "Contact Types"	
,	@ContactTypeLeft_id	:= NULL
,	@ContactTypeRight_id	:= NULL
,	@ContactTypeLevel_id	:= NULL
,	@ContactTypeOrder_id	:= NULL

,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Mode_cd	:= "C"
)
;

SET @Resrc_id = 65, @Contact_id = NULL;
CALL	ispResource_Contact
(
	@Resrc_id
,	@Resrc_tp	:= "User"
,	@Contact_id
,	@Contact_tp	:= "ContactEmail"
,	@Contact_nm	:= "mpower@company2.com"
,	@Contact_cd	:= NULL
,	@Alias_nm	:= "Max Power Email"
,	@Address_nm	:= NULL
,	@City_cd	:= NULL
,	@State_cd	:= NULL
,	@Zip_cd		:= NULL
,	@Phone_cd	:= NULL
,	@GPS_cd		:= NULL
,	@Resrc_tx   := NULL
,	@Contact_tx := NULL
,	@ADD_dm	:= NULL
,	@ADD_nm	:= NULL
,	@UPD_dm	:= NULL
,	@UPD_nm	:= NULL
,	@DEL_dm	:= NULL
,	@DEL_nm	:= NULL
,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Mode_cd	:= "C"
)
;

SET @Resrc_id = 65, @Contact_id = NULL;
CALL	ispResource_Contact
(
	@Resrc_id
,	@Resrc_tp	:= "User"
,	@Contact_id
,	@Contact_tp	:= "ContactAddress"
,	@Contact_nm	:= "mpower@company2.com"
,	@Contact_cd	:= NULL
,	@Alias_nm	:= "Max Power Address"
,	@Address_nm	:= "400 Enclave Cir #203, Costa Mesa, CA 92626"
,	@City_cd	:= "400 Enclave Cir #203, Costa Mesa, CA 92626"
,	@State_cd	:= "CA"
,	@Zip_cd		:= "92626"
,	@Phone_cd	:= "1234567890"
,	@GPS_cd		:= NULL
,	@Resrc_tx   := NULL
,	@Contact_tx := NULL
,	@ADD_dm	:= NULL
,	@ADD_nm	:= NULL
,	@UPD_dm	:= NULL
,	@UPD_nm	:= NULL
,	@DEL_dm	:= NULL
,	@DEL_nm	:= NULL
,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Mode_cd	:= "C"
)
;

CALL	uspResource_Contact
(
	@Resrc_id	:= 65
,	@Resrc_tp	:= "User"
,	@Contact_id	:= 78
,	@Contact_tp	:= "ContactAddress"
,	@Contact_nm	:= "mpower@ymail.net"
,	@Contact_cd	:= NULL
,	@Alias_nm	:= "Max Power Address"
,	@Address_nm	:= ""
,	@City_cd	:= ""
,	@State_cd	:= "CA"
,	@Zip_cd		:= "92626"
,	@Phone_cd	:= "1234567890"
,	@GPS_cd		:= NULL
,	@Resrc_tx   := NULL
,	@Contact_tx := NULL
,	@ADD_dm	:= NULL
,	@ADD_nm	:= NULL
,	@UPD_dm	:= NULL
,	@UPD_nm	:= NULL
,	@DEL_dm	:= NULL
,	@DEL_nm	:= NULL
,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Mode_cd	:= "C"
)
;

CALL	gfpResource_Contact
(
	@Resrc_id	:= NULL
,	@Resrc_tp	:= "User"
,	@Contact_id	:= NULL
,	@Contact_tp	:= "ContactAddress"
,	@Contact_nm	:= "mpower@ymail.net"
,	@Contact_cd	:= NULL
,	@Alias_nm	:= "Max Power Address"
,	@Address_nm	:= ""
,	@City_cd	:= ""
,	@State_cd	:= "CA"
,	@Zip_cd		:= "92626"
,	@Phone_cd	:= "1234567890"
,	@GPS_cd		:= NULL
,	@Resrc_tx   := NULL
,	@Contact_tx := NULL
,	@ADD_dm	:= NULL
,	@ADD_nm	:= NULL
,	@UPD_dm	:= NULL
,	@UPD_nm	:= NULL
,	@DEL_dm	:= NULL
,	@DEL_nm	:= NULL
,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Key_cd	:= "AL"
)
;
