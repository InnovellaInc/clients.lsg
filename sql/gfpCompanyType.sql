DROP PROCEDURE IF EXISTS	gfpCompanyType
;

DELIMITER //
CREATE PROCEDURE	gfpCompanyType
(
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
END
//
DELIMITER ;
;

