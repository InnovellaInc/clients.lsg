DROP PROCEDURE IF EXISTS	gfpResource_Contact
;

DELIMITER //
CREATE PROCEDURE	gfpResource_Contact
(
	Resrc_id	INT SIGNED		-- PK1 
,	Resrc_tp	VARCHAR(64)		-- PK2 AK1
,	Contact_id	INT SIGNED		-- PK1 
,	Contact_tp	VARCHAR(64)		-- PK2 AK1
,	Contact_nm	VARCHAR(256)		--  AK2
,	Contact_cd	VARCHAR(128)	
,	Alias_nm	VARCHAR(256)		--  AK2
,	Address_nm	VARCHAR(256)
,	City_cd		VARCHAR(128)
,	State_cd	VARCHAR(128)
,	Zip_cd		VARCHAR(128)
,	Phone_cd	VARCHAR(128)
,	GPS_cd		VARCHAR(128)
,	Resrc_tx	MEDIUMTEXT	
,	Contact_tx	MEDIUMTEXT	
,	ADD_dm		DATETIME	
,	ADD_nm		VARCHAR(256)	
,	UPD_dm		DATETIME	
,	UPD_nm		VARCHAR(256)	
,	DEL_dm		DATETIME	
,	DEL_nm		VARCHAR(256)	

,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceContact	Contact name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Key_cd		VARCHAR(16)	-- Search key code
)
BEGIN
/*
**	Name:		gfpResource_Contact
**	Type:		DB API Stored Procedure: Get Filtered
**	Purpose:	To Get an active record or set of active records
**			from tvwResource_Contact
**	Author:		Solomon S. Shacter
**	Contact:	Innovella, Inc.
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tvwResource_Contact';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'VIEW';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'gfpResource_Contact';
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
	IF Contact_id IS NULL OR Contact_id = 0 THEN SET Contact_id =  -2147483647;	END IF;
	IF Contact_tp IS NULL OR Contact_tp = '' THEN SET Contact_tp = '-2147483647';	END IF;
	IF Contact_nm IS NULL OR Contact_nm = '' THEN SET Contact_nm = '-2147483647';	END IF;
	IF Contact_cd IS NULL OR Contact_cd = '' THEN SET Contact_cd = '-2147483647';	END IF;
	IF Alias_nm IS NULL OR Alias_nm = '' THEN SET Alias_nm = '-2147483647';	END IF;
	IF Address_nm IS NULL OR Address_nm = '' THEN SET Address_nm = '-2147483647';	END IF;
	IF City_cd IS NULL OR City_cd = '' THEN SET City_cd = '-2147483647';	END IF;
	IF State_cd IS NULL OR State_cd = '' THEN SET State_cd = '-2147483647';	END IF;
	IF ZIP_cd IS NULL OR ZIP_cd = '' THEN SET ZIP_cd = '-2147483647';	END IF;
	IF Phone_cd IS NULL OR Phone_cd = '' THEN SET Phone_cd = '-2147483647';	END IF;
	IF GPS_cd IS NULL OR GPS_cd = '' THEN SET GPS_cd = '-2147483647';	END IF;
	IF Resrc_tx IS NULL OR Resrc_tx = '' THEN SET Resrc_tx = '-2147483647';	END IF;
	IF Contact_tx IS NULL OR Contact_tx = '' THEN SET Contact_tx = '-2147483647';	END IF;
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
			tvwResource_Contact
		WHERE	1=1
		AND	tvwResource_Contact.Resrc_id	= Resrc_id
		AND	tvwResource_Contact.Resrc_tp	= Resrc_tp
		AND	tvwResource_Contact.Contact_id	= Contact_id
		AND	tvwResource_Contact.Contact_tp	= Contact_tp
		AND	tvwResource_Contact.DEL_dm	IS NULL
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
			tvwResource_Contact
		WHERE	1=1
		AND	tvwResource_Contact.Resrc_tp	= Resrc_tp
		AND	tvwResource_Contact.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	IF	Key_cd	= 'FK2'
	THEN
		SELECT	*
		FROM
			tvwResource_Contact
		WHERE	1=1
		AND	tvwResource_Contact.Contact_tp	= Contact_tp
		AND	tvwResource_Contact.DEL_dm	IS NULL

		;
		LEAVE GFP;
	END IF;
	IF	Key_cd	= 'FK3'
	THEN
		SELECT	*
		FROM
			tvwResource_Contact
		WHERE   1=1
		AND	tvwResource_Contact.Contact_id	= Resrc_id
		AND	tvwResource_Contact.Contact_tp	= Resrc_tp
		AND	tvwResource_Contact.DEL_dm	IS NULL

		;
		LEAVE GFP;
	END IF;
	IF	Key_cd	= 'FK4'
	THEN
		SELECT	*
		FROM
			tvwResource_Contact
		WHERE   1=1
		AND	tvwResource_Contact.Contact_id	= Contact_id
		AND	tvwResource_Contact.Contact_tp	= Contact_tp
		AND	tvwResource_Contact.DEL_dm	IS NULL

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
			tvwResource_Contact
		WHERE	1=1
		AND	tvwResource_Contact.Resrc_id	= Resrc_id
		AND	tvwResource_Contact.Resrc_tp	= Resrc_tp
		AND	tvwResource_Contact.Contact_tp	= Contact_tp
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
			tvwResource_Contact
		WHERE	1=1
		AND	(
			tvwResource_Contact.Resrc_id	= Resrc_id
		OR	Resrc_id	=  -2147483647
			)
		AND	(
			tvwResource_Contact.Resrc_tp	= Resrc_tp
		OR	Resrc_tp	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.Contact_id	=  Contact_id
		OR	Contact_id	=  -2147483647
			)
		AND	(
			tvwResource_Contact.Contact_tp	= Contact_tp
		OR	Contact_tp	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.Contact_nm	LIKE CONCAT('%', Contact_nm, '%')
		OR	Contact_nm	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.Contact_cd	LIKE CONCAT('%', Contact_cd, '%')
		OR	Contact_cd	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.Alias_nm	LIKE CONCAT('%', Alias_nm, '%')
		OR	Alias_nm	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.Address_nm	LIKE CONCAT('%', Address_nm, '%')
		OR	Address_nm	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.City_cd	LIKE CONCAT('%', City_cd, '%')
		OR	City_cd	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.State_cd	LIKE CONCAT('%', State_cd, '%')
		OR	State_cd	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.ZIP_cd	LIKE CONCAT('%', ZIP_cd, '%')
		OR	ZIP_cd	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.Phone_cd	LIKE CONCAT('%', Phone_cd, '%')
		OR	Phone_cd	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.GPS_cd	LIKE CONCAT('%', GPS_cd, '%')
		OR	GPS_cd	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.Contact_tx	LIKE CONCAT('%', Contact_tx, '%')
		OR	Contact_tx	LIKE '-2147483647'
			)
		AND	(
			tvwResource_Contact.Resrc_tx	LIKE CONCAT('%', Resrc_tx, '%')
		OR	Resrc_tx	LIKE '-2147483647'
			)
 		AND	(
 			tvwResource_Contact.ADD_dm	>= ADD_dm
 		OR	ADD_dm	= '0000-00-00 00:00:00'
 		OR	ADD_dm	IS NULL
 			)
		AND	(
			tvwResource_Contact.ADD_nm	LIKE CONCAT('%', ADD_nm, '%')
		OR	ADD_nm	= '-2147483647'
			)
  		AND	(
  			tvwResource_Contact.UPD_dm	>= UPD_dm
 		OR	UPD_dm	= '0000-00-00 00:00:00'
   		OR	UPD_dm	IS NULL
  			)
 		AND	(
 			tvwResource_Contact.UPD_nm	LIKE CONCAT('%', UPD_nm, '%')
 		OR	UPD_nm	= '-2147483647'
 			)
  		AND	(
  			tvwResource_Contact.DEL_dm	IS NULL
  			)
 		AND	(
 			tvwResource_Contact.DEL_nm	IS NULL
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
CALL gfpResource_Contact
(
	@Resrc_id	:= Resrc_id
,	@Resrc_tp	:= Resrc_tp
,	@Contact_id	:= Contact_id
,	@Contact_tp	:= Contact_tp
,	@Contact_nm	:= Contact_nm
,	@Contact_cd	:= Contact_cd
,	@Alias_nm	:= Alias_nm
,	@Address_nm	:= Address_nm
,	@City_cd	:= City_cd
,	@State_cd	:= State_cd
,	@ZIP_cd	:= ZIP_cd
,	@Phone_cd	:= Phone_cd
,	@GPS_cd	:= GPS_cd
,	@Contact_tx	:= Contact_tx
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
