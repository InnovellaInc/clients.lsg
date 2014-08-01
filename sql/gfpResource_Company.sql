DROP PROCEDURE IF EXISTS	gfpResource_Company
;

DELIMITER //
CREATE PROCEDURE	gfpResource_Company
(
	Resrc_id		INT SIGNED		-- PK1 
,	Resrc_tp		VARCHAR(64)		-- PK2 AK1
,	Company_id		INT SIGNED		-- PK1 
,	Company_tp		VARCHAR(64)		-- PK2 AK1
,	Resrc_nm		VARCHAR(256)		--  AK2
,	Resrc_cd		VARCHAR(128)	
,	Alias_nm		VARCHAR(256)		--  AK2
,	Company_nm		VARCHAR(256)		--  AK2
,	Company_cd		VARCHAR(128)	
,	Resrc_tx	MEDIUMTEXT
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
**	Name:		gfpResource_Company
**	Type:		DB API Stored Procedure: Get Filtered
**	Purpose:	To Get an active record or set of active records
**			from tvwResource_Company
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tvwResource_Company';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'VIEW';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'gfpResource_Company';
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

	IF Resrc_id IS NULL OR Resrc_id = 0 THEN SET Resrc_id =  -2147483647;	END IF;
	IF Resrc_tp IS NULL OR Resrc_tp = '' THEN SET Resrc_tp = '-2147483647';	END IF;
	IF Company_id IS NULL OR Company_id = 0 THEN SET Company_id =  -2147483647;	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = '-2147483647';	END IF;
	IF Resrc_nm IS NULL OR Resrc_nm = '' THEN SET Resrc_nm = '-2147483647';	END IF;
	IF Resrc_cd IS NULL OR Resrc_cd = '' THEN SET Resrc_cd = '-2147483647';	END IF;
	IF Alias_nm IS NULL OR Alias_nm = '' THEN SET Alias_nm = '-2147483647';	END IF;
	IF Company_nm IS NULL OR Company_nm = '' THEN SET Company_nm = '-2147483647';	END IF;
	IF Company_cd IS NULL OR Company_cd = '' THEN SET Company_cd = '-2147483647';	END IF;
	IF Resrc_tx IS NULL OR Resrc_tx = '' THEN SET Resrc_tx = '-2147483647';	END IF;
	IF Company_tx IS NULL OR Company_tx = '' THEN SET Company_tx = '-2147483647';	END IF;
	IF ADD_dm IS NULL THEN SET ADD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = '-2147483647';	END IF;
	IF UPD_dm IS NULL THEN SET UPD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = '-2147483647';	END IF;
	IF DEL_dm IS NULL THEN SET DEL_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
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
			tvwResource_Company
		WHERE	1=1
		AND	tvwResource_Company.Resrc_id	= Resrc_id
		AND	tvwResource_Company.Resrc_tp	= Resrc_tp
		AND	tvwResource_Company.Company_id	= Company_id
		AND	tvwResource_Company.Company_tp	= Company_tp
		AND	tvwResource_Company.DEL_dm	IS NULL
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
			tvwResource_Company
		WHERE	1=1
		AND	tvwResource_Company.Resrc_tp	= Resrc_tp
		AND	tvwResource_Company.Company_tp	= Company_tp
		AND	tvwResource_Company.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	IF	Key_cd	= 'FK2'
	THEN
		SELECT	*
		FROM
			tvwResource_Company
		WHERE	1=1
		AND	tvwResource_Company.Resrc_id	= Resrc_id
		AND	tvwResource_Company.Resrc_tp	= Resrc_tp
		AND	tvwResource_Company.DEL_dm	IS NULL

		;
		LEAVE GFP;
	END IF;
	IF	Key_cd	= 'FK3'
	THEN
		SELECT	*
		FROM
			tvwResource_Company
		WHERE   1=1
		AND	tvwResource_Company.Company_id	= Company_id
		AND	tvwResource_Company.Company_tp	= Company_tp
		AND	tvwResource_Company.DEL_dm	IS NULL

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
			tvwResource_Company
		WHERE	1=1
		AND	tvwResource_Company.Resrc_tp	= Resrc_tp
		AND	tvwResource_Company.Company_id	= Company_id
		AND	tvwResource_Company.Company_tp	= Company_tp
		AND	tvwResource_Company.Resrc_nm	= Resrc_nm
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
			tvwResource_Company
		WHERE	1=1
		AND	(
			tvwResource_Company.Resrc_id	= Resrc_id
		OR	Resrc_id	=  -2147483647
			)
		AND	(
			tvwResource_Company.Resrc_tp	= Resrc_tp
		OR	Resrc_tp	= '-2147483647'
			)
		AND	(
			tvwResource_Company.Company_id	=  Company_id
		OR	Company_id	=  -2147483647
			)
		AND	(
			tvwResource_Company.Company_tp	= Company_tp
		OR	Company_tp	= '-2147483647'
			)
		AND	(
			tvwResource_Company.Resrc_nm	LIKE CONCAT('%', Resrc_nm, '%')
		OR	Resrc_nm	= '-2147483647'
			)
		AND	(
			tvwResource_Company.Resrc_cd	LIKE CONCAT('%', Resrc_cd, '%')
		OR	Resrc_cd	= '-2147483647'
			)
		AND	(
			tvwResource_Company.Alias_nm	LIKE CONCAT('%', Alias_nm, '%')
		OR	Alias_nm	= '-2147483647'
			)
		AND	(
			tvwResource_Company.Company_nm	LIKE CONCAT('%', Company_nm, '%')
		OR	Company_nm	= '-2147483647'
			)
		AND	(
			tvwResource_Company.Company_cd	LIKE CONCAT('%', Company_cd, '%')
		OR	Company_cd	= '-2147483647'
			)
		AND	(
			tvwResource_Company.Resrc_tx	LIKE CONCAT('%', Resrc_tx, '%')
		OR	Resrc_tx	= '-2147483647'
			)
		AND	(
			tvwResource_Company.Company_tx	LIKE CONCAT('%', Company_tx, '%')
		OR	Company_tx	LIKE '-2147483647'
			)
 		AND	(
 			tvwResource_Company.ADD_dm	>= ADD_dm
 		OR	ADD_dm	= '0000-00-00 00:00:00'
 		OR	ADD_dm	IS NULL
 			)
		AND	(
			tvwResource_Company.ADD_nm	LIKE CONCAT('%', ADD_nm, '%')
		OR	ADD_nm	= '-2147483647'
			)
  		AND	(
  			tvwResource_Company.UPD_dm	>= UPD_dm
 		OR	UPD_dm	= '0000-00-00 00:00:00'
   		OR	UPD_dm	IS NULL
  			)
 		AND	(
 			tvwResource_Company.UPD_nm	LIKE CONCAT('%', UPD_nm, '%')
 		OR	UPD_nm	= '-2147483647'
 			)
  		AND	(
  			tvwResource_Company.DEL_dm	IS NULL
  			)
 		AND	(
 			tvwResource_Company.DEL_nm	IS NULL
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
CALL gfpResource_Company
(
	@Resrc_id	:= Resrc_id
,	@Resrc_tp	:= Resrc_tp
,	@Company_id	:= Company_id
,	@Company_tp	:= Company_tp
,	@Resrc_nm	:= Resrc_nm
,	@Resrc_cd	:= Resrc_cd
,	@Alias_nm	:= Alias_nm
,	@Company_nm	:= Company_nm
,	@Company_cd	:= Company_cd
,	@Resrc_tx	:= Resrc_tx
,	@Company_tx	:= Company_tx
,	@ADD_dm	:= ADD_dm
,	@ADD_nm	:= ADD_nm
,	@UPD_dm	:= UPD_dm
,	@UPD_nm	:= UPD_nm
,	@DEL_dm	:= DEL_dm
,	@DEL_nm	:= DEL_nm

,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Key_cd	:= "AL"
);
*/
