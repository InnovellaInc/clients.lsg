DROP VIEW IF EXISTS	tvwResourceType
;

CREATE OR REPLACE VIEW	tvwResourceType
(
	Resrc_tp
,	ParentResrc_tp
,	ResrcType_tx
,	Left_id
,	Right_id
,	Level_id
,	Order_id
)
AS
/*
**	Name:		tvwResourceType
**	Type:		View
**	Purpose:	To return materialized data from one or more tables.
**	Author:		Solomon S. Shacter
**	Generated:	7/2/2013
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
SELECT
	tblResourceType.Resrc_tp
,	tblResourceType.ParentResrc_tp
,	tblResourceType.ResrcType_tx
,	tblResourceType.Left_id
,	tblResourceType.Right_id
,	tblResourceType.Level_id
,	tblResourceType.Order_id
FROM
	tblResourceType
;

DROP VIEW IF EXISTS	tvwCompanyType
;
CREATE OR REPLACE VIEW	tvwCompanyType
(
	Company_tp
,	ParentCompany_tp
,	CompanyType_tx
,	CompanyTypeLeft_id
,	CompanyTypeRight_id
,	CompanyTypeLevel_id
,	CompanyTypeOrder_id
)
AS
/*
**	Name:		tvwCompanyType
**	Type:		View
**	Purpose:	To return materialized data from one or more tables.
**	Author:		Solomon S. Shacter
**	Generated:	7/2/2013
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
SELECT
	tblCompanyType.Company_tp
,	tblResourceType.ParentResrc_tp
,	tblResourceType.ResrcType_tx
,	tblResourceType.Left_id
,	tblResourceType.Right_id
,	tblResourceType.Level_id
,	tblResourceType.Order_id
FROM
	tblCompanyType
JOIN	tblResourceType
ON	tblCompanyType.Company_tp	= tblResourceType.Resrc_tp	-- FK1
;

DROP VIEW IF EXISTS	tvwUserType
;
CREATE OR REPLACE VIEW	tvwUserType
(
	User_tp
,	ParentUser_tp
,	UserType_tx
,	UserTypeLeft_id
,	UserTypeRight_id
,	UserTypeLevel_id
,	UserTypeOrder_id
)
AS
/*
**	Name:		tvwUserType
**	Type:		View
**	Purpose:	To return materialized data from one or more tables.
**	Author:		Solomon S. Shacter
**	Generated:	7/2/2013
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
SELECT
	tblUserType.User_tp
,	tblResourceType.ParentResrc_tp
,	tblResourceType.ResrcType_tx
,	tblResourceType.Left_id
,	tblResourceType.Right_id
,	tblResourceType.Level_id
,	tblResourceType.Order_id
FROM
	tblUserType
JOIN	tblResourceType
ON	tblUserType.User_tp	= tblResourceType.Resrc_tp	-- FK1
;

DROP VIEW IF EXISTS	tvwContactType
;
CREATE OR REPLACE VIEW	tvwContactType
(
	Contact_tp
,	ParentContact_tp
,	ContactType_tx
,	ContactTypeLeft_id
,	ContactTypeRight_id
,	ContactTypeLevel_id
,	ContactTypeOrder_id
)
AS
/*
**	Name:		tvwContactType
**	Type:		View
**	Purpose:	To return materialized data from one or more tables.
**	Author:		Solomon S. Shacter
**	Generated:	7/2/2013
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
SELECT
	tblContactType.Contact_tp
,	tblResourceType.ParentResrc_tp
,	tblResourceType.ResrcType_tx
,	tblResourceType.Left_id
,	tblResourceType.Right_id
,	tblResourceType.Level_id
,	tblResourceType.Order_id
FROM
	tblContactType
JOIN	tblResourceType
ON	tblContactType.Contact_tp	= tblResourceType.Resrc_tp	-- FK1
;





/*
**

**
*/
DROP VIEW IF EXISTS	tvwResource
;

CREATE OR REPLACE VIEW	tvwResource
(
	Resrc_id
,	Resrc_tp
,	Resrc_tx
,	ADD_dm
,	ADD_nm
,	UPD_dm
,	UPD_nm
,	DEL_dm
,	DEL_nm
,	ParentResrc_tp
,	ResrcType_tx
,	Left_id
,	Right_id
,	Level_id
,	Order_id
)
AS
/*
**	Name:		tvwResource
**	Type:		View
**	Purpose:	To return materialized data from one or more tables.
**	Author:		Solomon S. Shacter
**	Generated:	7/2/2013
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
SELECT
	tblResource.Resrc_id
,	tblResource.Resrc_tp
,	tblResource.Resrc_tx
,	tblResource.ADD_dm
,	tblResource.ADD_nm
,	tblResource.UPD_dm
,	tblResource.UPD_nm
,	tblResource.DEL_dm
,	tblResource.DEL_nm
,	tblResourceType.ParentResrc_tp
,	tblResourceType.ResrcType_tx
,	tblResourceType.Left_id
,	tblResourceType.Right_id
,	tblResourceType.Level_id
,	tblResourceType.Order_id
FROM
	tblResource
JOIN	tblResourceType
ON	tblResource.Resrc_tp	= tblResourceType.Resrc_tp		-- FK1
;

DROP VIEW IF EXISTS	tvwCompany
;

CREATE OR REPLACE VIEW	tvwCompany
(
	Company_id
,	Company_tp
,	Company_nm
,	Company_cd
,	Company_tx
,	CompanyADD_dm
,	CompanyADD_nm
,	CompanyUPD_dm
,	CompanyUPD_nm
,	CompanyDEL_dm
,	CompanyDEL_nm
,	ParentCompany_tp
,	CompanyType_tx
,	CompanyTypeLeft_id
,	CompanyTypeRight_id
,	CompanyTypeLevel_id
,	CompanyTypeOrder_id
)
AS
/*
**	Name:		tvwCompany
**	Type:		View
**	Purpose:	To return materialized data from one or more tables.
**	Author:		Solomon S. Shacter
**	Generated:	7/9/2013
**
**	Modified:	7/9/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
SELECT
	tblCompany.Company_id
,	tblCompany.Company_tp
,	tblCompany.Company_nm
,	tblCompany.Company_cd
,	tblResource.Resrc_tx
,	tblResource.ADD_dm
,	tblResource.ADD_nm
,	tblResource.UPD_dm
,	tblResource.UPD_nm
,	tblResource.DEL_dm
,	tblResource.DEL_nm
,	tvwCompanyType.ParentCompany_tp
,	tvwCompanyType.CompanyType_tx
,	tvwCompanyType.CompanyTypeLeft_id
,	tvwCompanyType.CompanyTypeRight_id
,	tvwCompanyType.CompanyTypeLevel_id
,	tvwCompanyType.CompanyTypeOrder_id
FROM
	tblCompany
JOIN	tvwCompanyType
ON	tblCompany.Company_tp	= tvwCompanyType.Company_tp		-- FK1
JOIN	tblResource
ON	tblCompany.Company_id	= tblResource.Resrc_id		-- FK2
AND	tblCompany.Company_tp	= tblResource.Resrc_tp
;

DROP VIEW IF EXISTS	tvwContact
;

CREATE OR REPLACE VIEW	tvwContact
(
	Contact_id
,	Contact_tp
,	Contact_tx
,	ContactADD_dm
,	ContactADD_nm
,	ContactUPD_dm
,	ContactUPD_nm
,	ContactDEL_dm
,	ContactDEL_nm
,	ParentContact_tp
,	ContactType_tx
,	ContactTypeLeft_id
,	ContactTypeRight_id
,	ContactTypeLevel_id
,	ContactTypeOrder_id
)
AS
/*
**	Name:		tvwContact
**	Type:		View
**	Purpose:	To return materialized data from one or more tables.
**	Author:		Solomon S. Shacter
**	Generated:	7/9/2013
**
**	Modified:	7/9/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
SELECT
	tblResource.Resrc_id
,	tblResource.Resrc_tp
,	tblResource.Resrc_tx
,	tblResource.ADD_dm
,	tblResource.ADD_nm
,	tblResource.UPD_dm
,	tblResource.UPD_nm
,	tblResource.DEL_dm
,	tblResource.DEL_nm
,	tvwContactType.ParentContact_tp
,	tvwContactType.ContactType_tx
,	tvwContactType.ContactTypeLeft_id
,	tvwContactType.ContactTypeRight_id
,	tvwContactType.ContactTypeLevel_id
,	tvwContactType.ContactTypeOrder_id
FROM
	tblResource
JOIN	tvwContactType
ON	tblResource.Resrc_tp	= tvwContactType.Contact_tp		-- FK1
;

DROP VIEW IF EXISTS	tvwUser
;

CREATE OR REPLACE VIEW	tvwUser
(
	User_id
,	User_tp
,	User_nm
,	User_cd
,	Hashed_cd
,	Email_nm
,	Challenge_cd
,	Response_cd
,	User_tx
,	UserADD_dm
,	UserADD_nm
,	UserUPD_dm
,	UserUPD_nm
,	UserDEL_dm
,	UserDEL_nm
,	ParentUser_tp
,	UserType_tx
,	UserTypeLeft_id
,	UserTypeRight_id
,	UserTypeLevel_id
,	UserTypeOrder_id
)
AS
/*
**	Name:		tvwUser
**	Type:		View
**	Purpose:	To return materialized data from one or more tables.
**	Author:		Solomon S. Shacter
**	Generated:	7/9/2013
**
**	Modified:	7/9/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
SELECT
	tblUser.User_id
,	tblUser.User_tp
,	tblUser.User_nm
,	tblUser.User_cd
,	tblUser.Hashed_cd
,	tblUser.Email_nm
,	tblUser.Challenge_cd
,	tblUser.Response_cd
,	tblResource.Resrc_tx
,	tblResource.ADD_dm
,	tblResource.ADD_nm
,	tblResource.UPD_dm
,	tblResource.UPD_nm
,	tblResource.DEL_dm
,	tblResource.DEL_nm
,	tvwUserType.ParentUser_tp
,	tvwUserType.UserType_tx
,	tvwUserType.UserTypeLeft_id
,	tvwUserType.UserTypeRight_id
,	tvwUserType.UserTypeLevel_id
,	tvwUserType.UserTypeOrder_id
FROM
	tblUser
JOIN	tvwUserType
ON	tblUser.User_tp	= tvwUserType.User_tp		-- FK1
JOIN	tblResource
ON	tblUser.User_id	= tblResource.Resrc_id		-- FK2
AND	tblUser.User_tp	= tblResource.Resrc_tp
;


DROP VIEW IF EXISTS	tvwResource_Company
;

CREATE OR REPLACE VIEW	tvwResource_Company
(
	Resrc_id
,	Resrc_tp
,	Company_id
,	Company_tp
,	Resrc_nm
,	Resrc_cd
,	Alias_nm
,	Company_nm
,	Company_cd
,   Resrc_tx
,	Company_tx
,	ADD_dm
,	ADD_nm
,	UPD_dm
,	UPD_nm
,	DEL_dm
,	DEL_nm
-- ,	ParentCompany_tp
-- ,	CompanyType_tx
-- ,	CompanyTypeLeft_id
-- ,	CompanyTypeRight_id
-- ,	CompanyTypeLevel_id
-- ,	CompanyTypeOrder_id
-- ,	ParentResrc_tp
-- ,	ResrcType_tx
-- ,	Left_id
-- ,	Right_id
-- ,	Level_id
-- ,	Order_id
)
AS
/*
**	Name:		tvwResource_Company
**	Type:		View
**	Purpose:	To return materialized data from one or more tables.
**	Author:		Solomon S. Shacter
**	Generated:	7/9/2013
**
**	Modified:	7/9/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
SELECT
	tblResource_Company.Resrc_id
,	tblResource_Company.Resrc_tp
,	tblResource_Company.Company_id
,	tblResource_Company.Company_tp
,	tblResource_Company.Resrc_nm
,	tblResource_Company.Resrc_cd
,	tblResource_Company.Alias_nm

,	tvwCompany.Company_nm
,	tvwCompany.Company_cd
,   tvwResource.Resrc_tx
,	tvwCompany.Company_tx

,	tblResource_Company.ADD_dm
,	tblResource_Company.ADD_nm
,	tblResource_Company.UPD_dm
,	tblResource_Company.UPD_nm
,	tblResource_Company.DEL_dm
,	tblResource_Company.DEL_nm

-- ,	tvwCompany.ParentCompany_tp
-- ,	tvwCompany.CompanyType_tx
-- ,	tvwCompany.CompanyTypeLeft_id
-- ,	tvwCompany.CompanyTypeRight_id
-- ,	tvwCompany.CompanyTypeLevel_id
-- ,	tvwCompany.CompanyTypeOrder_id
-- 
-- ,	tvwResource.ParentResrc_tp
-- ,	tvwResource.ResrcType_tx
-- ,	tvwResource.Left_id
-- ,	tvwResource.Right_id
-- ,	tvwResource.Level_id
-- ,	tvwResource.Order_id
FROM
	tblResource_Company
INNER
JOIN	tvwResource
ON	tblResource_Company.Resrc_id	= tvwResource.Resrc_id
AND	tblResource_Company.Resrc_tp	= tvwResource.Resrc_tp
INNER
JOIN	tvwCompany
ON	tblResource_Company.Company_id	= tvwCompany.Company_id
AND	tblResource_Company.Company_tp	= tvwCompany.Company_tp
;

DROP VIEW IF EXISTS	tvwUser_Company
;

CREATE OR REPLACE VIEW	tvwUser_Company
(
	User_id
,	User_tp
,	Company_id
,	Company_tp
,	User_nm
,	User_cd
,	Alias_nm


,	Hashed_cd
,	Email_nm
,	Challenge_cd
,	Response_cd

,	Company_nm
,	Company_cd

,	User_tx
,	Company_tx

,	ADD_dm
,	ADD_nm
,	UPD_dm
,	UPD_nm
,	DEL_dm
,	DEL_nm
)
AS
/*
**	Name:		tvwUser_Company
**	Type:		View
**	Purpose:	To return materialized data from one or more tables.
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**	Generated:	7/9/2013
**
**	Modified:	7/9/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
SELECT
	tvwUser.User_id
,	tvwUser.User_tp
,	tblResource_Company.Company_id
,	tblResource_Company.Company_tp
,	tvwUser.User_nm
,	tvwUser.User_cd
,	tblResource_Company.Alias_nm

,	tvwUser.Hashed_cd
,	tvwUser.Email_nm
,	tvwUser.Challenge_cd
,	tvwUser.Response_cd

,	tvwCompany.Company_nm
,	tvwCompany.Company_cd

,	tvwUser.User_tx
,	tvwCompany.Company_tx

,	tblResource_Company.ADD_dm
,	tblResource_Company.ADD_nm
,	tblResource_Company.UPD_dm
,	tblResource_Company.UPD_nm
,	tblResource_Company.DEL_dm
,	tblResource_Company.DEL_nm

FROM
	tblResource_Company
INNER
JOIN	tvwUser
ON	tblResource_Company.Resrc_id	= tvwUser.User_id
AND	tblResource_Company.Resrc_tp	= tvwUser.User_tp
INNER
JOIN	tvwCompany
ON	tblResource_Company.Company_id	= tvwCompany.Company_id
AND	tblResource_Company.Company_tp	= tvwCompany.Company_tp
;

DROP VIEW IF EXISTS	tvwResource_Contact
;

CREATE OR REPLACE VIEW	tvwResource_Contact
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
,	Resrc_tx
,	Contact_tx
,	ADD_dm
,	ADD_nm
,	UPD_dm
,	UPD_nm
,	DEL_dm
,	DEL_nm
-- ,	ParentContact_tp
-- ,	ContactType_tx
-- ,	ContactTypeLeft_id
-- ,	ContactTypeRight_id
-- ,	ContactTypeLevel_id
-- ,	ContactTypeOrder_id
-- ,	ParentContact_tp
-- ,	ResrcType_tx
-- ,	Left_id
-- ,	Right_id
-- ,	Level_id
-- ,	Order_id
)
AS
/*
**	Name:		tvwResource_Contact
**	Type:		View
**	Purpose:	To return materialized data from one or more tables.
**	Author:		Solomon S. Shacter
**	Generated:	7/9/2013
**
**	Modified:	7/9/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
SELECT
	tblResource_Contact.Resrc_id
,	tblResource_Contact.Resrc_tp
,	tblResource_Contact.Contact_id
,	tblResource_Contact.Contact_tp
,	tblResource_Contact.Contact_nm
,	tblResource_Contact.Contact_cd
,	tblResource_Contact.Alias_nm
,	tblResource_Contact.Address_nm
,	tblResource_Contact.City_cd
,	tblResource_Contact.State_cd
,	tblResource_Contact.Zip_cd
,	tblResource_Contact.Phone_cd
,	tblResource_Contact.GPS_cd

,	tvwResource.Resrc_tx
,	tvwContact.Contact_tx

,	tblResource_Contact.ADD_dm
,	tblResource_Contact.ADD_nm
,	tblResource_Contact.UPD_dm
,	tblResource_Contact.UPD_nm
,	tblResource_Contact.DEL_dm
,	tblResource_Contact.DEL_nm

FROM
	tblResource_Contact
INNER
JOIN	tvwResource
ON	tblResource_Contact.Resrc_id	= tvwResource.Resrc_id
AND	tblResource_Contact.Resrc_tp	= tvwResource.Resrc_tp
INNER
JOIN	tvwContact
ON	tblResource_Contact.Contact_id	= tvwContact.Contact_id
AND	tblResource_Contact.Contact_tp	= tvwContact.Contact_tp
;

