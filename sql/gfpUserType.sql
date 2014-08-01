DROP PROCEDURE IF EXISTS	gfpUserType
;

DELIMITER //
CREATE PROCEDURE	gfpUserType
(
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
END
//
DELIMITER ;
;

