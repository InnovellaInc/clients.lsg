DROP PROCEDURE IF EXISTS	gfpCompany
;

DELIMITER //
CREATE PROCEDURE	gfpCompany
(
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
-- ,	RowSort_nm	VARCHAR(256)
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
		SET @SQL_tx := CONCAT
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
END
//
DELIMITER ;
;

