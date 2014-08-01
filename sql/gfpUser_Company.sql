DROP PROCEDURE IF EXISTS	gfpUser_Company
;

DELIMITER //
CREATE PROCEDURE	gfpUser_Company
(
	User_id		INT SIGNED		-- PK1 
,	User_tp		VARCHAR(64)		-- PK2 AK1
,	Company_id		INT SIGNED		-- PK1 
,	Company_tp		VARCHAR(64)		-- PK2 AK1
,	User_nm		VARCHAR(256)		--  AK2
,	User_cd		VARCHAR(128)	
,	Alias_nm		VARCHAR(256)		--  AK2
,	Hashed_cd	VARCHAR(128)
,	Email_nm	VARCHAR(256)
,	Challenge_cd	VARCHAR(128)
,	Response_cd	VARCHAR(128)
,	Company_nm		VARCHAR(256)		--  AK2
,	Company_cd		VARCHAR(128)	
,	User_tx	MEDIUMTEXT
,	Company_tx		MEDIUMTEXT	
,	ADD_dm		DATETIME	
,	ADD_nm		VARCHAR(256)	
,	UPD_dm		DATETIME	
,	UPD_nm		VARCHAR(256)	
,	DEL_dm		DATETIME	
,	DEL_nm		VARCHAR(256)	

,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceCompany	Company name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Key_cd		VARCHAR(16)	-- Search key code
)
BEGIN
/*
**	Name:		gfpUser_Company
**	Type:		DB API Stored Procedure: Get Filtered
**	Purpose:	To Get an active record or set of active records
**			from tvwUser_Company
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tvwUser_Company';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'VIEW';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'gfpUser_Company';
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
	IF Company_id IS NULL OR Company_id = 0 THEN SET Company_id =  -2147483647;	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = '-2147483647';	END IF;
	IF User_nm IS NULL OR User_nm = '' THEN SET User_nm = '-2147483647';	END IF;
	IF User_cd IS NULL OR User_cd = '' THEN SET User_cd = '-2147483647';	END IF;
	IF Hashed_cd IS NULL OR Hashed_cd = '' THEN SET Hashed_cd = '-2147483647';	END IF;
	IF Alias_nm IS NULL OR Alias_nm = '' THEN SET Alias_nm = '-2147483647';	END IF;
	IF Email_nm IS NULL OR Email_nm = '' THEN SET User_cd = '-2147483647';	END IF;
	IF Challenge_cd IS NULL OR Challenge_cd = '' THEN SET Challenge_cd = '-2147483647';	END IF;
	IF Response_cd IS NULL OR Response_cd = '' THEN SET Response_cd = '-2147483647';	END IF;
	IF Company_nm IS NULL OR Company_nm = '' THEN SET Company_nm = '-2147483647';	END IF;
	IF Company_cd IS NULL OR Company_cd = '' THEN SET Company_cd = '-2147483647';	END IF;
	IF User_tx IS NULL OR User_tx = '' THEN SET User_tx = '-2147483647';	END IF;
	IF Company_tx IS NULL OR Company_tx = '' THEN SET Company_tx = '-2147483647';	END IF;
	IF ADD_dm IS NULL THEN SET ADD_dm = '0000-00-00 00:00:00';	END IF;
	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = '-2147483647';	END IF;
	IF UPD_dm IS NULL THEN SET UPD_dm = '0000-00-00 00:00:00';	END IF;
	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = '-2147483647';	END IF;
	IF DEL_dm IS NULL THEN SET DEL_dm = '0000-00-00 00:00:00';	END IF;
	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = '-2147483647';	END IF;
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
			tvwUser_Company
		WHERE	1=1
		AND	tvwUser_Company.User_id	= User_id
		AND	tvwUser_Company.User_tp	= User_tp
		AND	tvwUser_Company.Company_id	= Company_id
		AND	tvwUser_Company.Company_tp	= Company_tp
		AND	tvwUser_Company.DEL_dm	IS NULL
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
			tvwUser_Company
		WHERE	1=1
		AND	tvwUser_Company.User_tp	= User_tp
		AND	tvwUser_Company.Company_tp	= Company_tp
		AND	tvwUser_Company.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	IF	Key_cd	= 'FK2'
	THEN
		SELECT	*
		FROM
			tvwUser_Company
		WHERE	1=1
		AND	tvwUser_Company.User_id	= User_id
		AND	tvwUser_Company.User_tp	= User_tp
		AND	tvwUser_Company.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	IF	Key_cd	= 'FK3'
	THEN
		SELECT	*
		FROM
			tvwUser_Company
		WHERE   1=1
		AND	tvwUser_Company.Company_id	= Company_id
		AND	tvwUser_Company.Company_tp	= Company_tp
		AND	tvwUser_Company.DEL_dm	IS NULL
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
			tvwUser_Company
		WHERE	1=1
		AND	tvwUser_Company.User_tp	= User_tp
		AND	tvwUser_Company.User_nm	= User_nm
		AND	tvwUser_Company.Company_tp	= Company_tp
		AND	tvwUser_Company.Company_nm	= Company_nm
		AND	tvwUser_Company.DEL_dm	IS NULL
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
			tvwUser_Company
		WHERE	1=1
		AND	(
			tvwUser_Company.User_id	= User_id
		OR	User_id	=  -2147483647
			)
		AND	(
			tvwUser_Company.User_tp	= User_tp
		OR	User_tp	= '-2147483647'
			)
		AND	(
			tvwUser_Company.Company_id	=  Company_id
		OR	Company_id	=  -2147483647
			)
		AND	(
			tvwUser_Company.Company_tp	= Company_tp
		OR	Company_tp	= '-2147483647'
			)
		AND	(
			tvwUser_Company.User_nm	LIKE CONCAT('%', User_nm, '%')
		OR	User_nm	= '-2147483647'
			)
		AND	(
			tvwUser_Company.User_cd	LIKE CONCAT('%', User_cd, '%')
		OR	User_cd	= '-2147483647'
			)
		AND	(
			tvwUser_Company.Hashed_cd	= Hashed_cd
		OR	Hashed_cd	= '-2147483647'
			)
		AND	(
			tvwUser_Company.Email_nm	LIKE CONCAT('%', Email_nm, '%')
		OR	Email_nm	= '-2147483647'
			)
		AND	(
			tvwUser_Company.Challenge_cd	LIKE CONCAT('%', Challenge_cd, '%')
		OR	Challenge_cd	= '-2147483647'
			)
		AND	(
			tvwUser_Company.Response_cd	LIKE CONCAT('%', Response_cd, '%')
		OR	Response_cd	= '-2147483647'
			)
		AND	(
			tvwUser_Company.Alias_nm	LIKE CONCAT('%', Alias_nm, '%')
		OR	Alias_nm	= '-2147483647'
			)
		AND	(
			tvwUser_Company.Company_nm	LIKE CONCAT('%', Company_nm, '%')
		OR	Company_nm	= '-2147483647'
			)
		AND	(
			tvwUser_Company.Company_cd	LIKE CONCAT('%', Company_cd, '%')
		OR	Company_cd	= '-2147483647'
			)
		AND	(
			tvwUser_Company.User_tx	LIKE CONCAT('%', User_tx, '%')
		OR	User_tx	= '-2147483647'
			)
		AND	(
			tvwUser_Company.Company_tx	LIKE CONCAT('%', Company_tx, '%')
		OR	Company_tx	LIKE '-2147483647'
			)
 		AND	(
 			tvwUser_Company.ADD_dm	>= ADD_dm
 		OR	ADD_dm	= '0000-00-00 00:00:00'
 		OR	ADD_dm	IS NULL
 			)
		AND	(
			tvwUser_Company.ADD_nm	LIKE CONCAT('%', ADD_nm, '%')
		OR	ADD_nm	= '-2147483647'
			)
  		AND	(
  			tvwUser_Company.UPD_dm	>= UPD_dm
 		OR	UPD_dm	= '0000-00-00 00:00:00'
   		OR	UPD_dm	IS NULL
  			)
 		AND	(
 			tvwUser_Company.UPD_nm	LIKE CONCAT('%', UPD_nm, '%')
 		OR	UPD_nm	= '-2147483647'
 			)
 
 		AND	(
 			tvwUser_Company.DEL_nm	IS NULL
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
/*
CALL gfpUser_Company
(
	@User_id	:= :User_id
,	@User_tp	:= :User_tp
,	@Company_id	:= :Company_id
,	@Company_tp	:= :Company_tp
,	@User_nm	:= :User_nm
,	@User_cd	:= :User_cd
,	@Alias_nm	:= :Alias_nm
,	@Hashed_cd	:= :Hashed_cd
,	@Email_nm	:= :Email_nm
,	@Challenge_cd	:= :Challenge_cd
,	@Response_cd	:= :Response_cd
,	@Company_nm	:= :Company_nm
,	@Company_cd	:= :Company_cd
,	@User_tx	:= :User_tx
,	@Company_tx	:= :Company_tx
,	@ADD_dm	:= :ADD_dm
,	@ADD_nm	:= :ADD_nm
,	@UPD_dm	:= :UPD_dm
,	@UPD_nm	:= :UPD_nm
,	@DEL_dm	:= :DEL_dm
,	@DEL_nm	:= :DEL_nm

,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Key_cd	:= "AL"
);
*/
