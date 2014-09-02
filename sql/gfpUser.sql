DROP PROCEDURE IF EXISTS	gfpUser
;

DELIMITER //
CREATE PROCEDURE	gfpUser
(
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
END
//
DELIMITER ;
;

