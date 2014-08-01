DROP PROCEDURE IF EXISTS	gfpContactType
;

DELIMITER //
CREATE PROCEDURE	gfpContactType
(
	Contact_tp		VARCHAR(64)		-- PK1 
,	ParentContact_tp	VARCHAR(64)	
,	ContactType_tx		MEDIUMTEXT	
,	ContactTypeLeft_id	INT SIGNED	
,	ContactTypeRight_id	INT SIGNED	
,	ContactTypeLevel_id	INT SIGNED	
,	ContactTypeOrder_id	INT SIGNED	

,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceContact	Contact name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Key_cd		VARCHAR(16)	-- Search key code
)
BEGIN
/*
**	Name:		gfpContactType
**	Type:		DB API Stored Procedure: Get Filtered
**	Purpose:	To Get an active record or set of active records
**			from tvwContactType
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tvwContactType';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'VIEW';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'gfpContactType';
###############################################################################
GFP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'AL';	END IF;
	IF Contact_tp IS NULL OR Contact_tp = '' THEN SET Contact_tp = '-2147483647';	END IF;
	IF ParentContact_tp IS NULL OR ParentContact_tp = '' THEN SET ParentContact_tp = '-2147483647';	END IF;
	IF ContactType_tx IS NULL OR ContactType_tx = '' THEN SET ContactType_tx = '-2147483647';	END IF;
	IF ContactTypeLeft_id IS NULL OR ContactTypeLeft_id = 0 THEN SET ContactTypeLeft_id =  -2147483647;	END IF;
	IF ContactTypeRight_id IS NULL OR ContactTypeRight_id = 0 THEN SET ContactTypeRight_id =  -2147483647;	END IF;
	IF ContactTypeLevel_id IS NULL OR ContactTypeLevel_id = 0 THEN SET ContactTypeLevel_id =  -2147483647;	END IF;
	IF ContactTypeOrder_id IS NULL OR ContactTypeOrder_id = 0 THEN SET ContactTypeOrder_id =  -2147483647;	END IF;
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
			tvwContactType
		WHERE
			tvwContactType.Contact_tp	= Contact_tp

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
			tvwContactType
		WHERE
			tvwContactType.Contact_tp	= Contact_tp

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
			tvwContactType
		WHERE
			(
			tvwContactType.Contact_tp	= Contact_tp
		OR	Contact_tp	= '-2147483647'
			)
		AND	(
			tvwContactType.ParentContact_tp	= ParentContact_tp
		OR	ParentContact_tp	= '-2147483647'
			)
		AND	(
			tvwContactType.ContactType_tx	LIKE CONCAT('%', ContactType_tx, '%')
		OR	ContactType_tx	LIKE '-2147483647'
			)
		AND	(
			tvwContactType.ContactTypeLeft_id	= ContactTypeLeft_id
		OR	ContactTypeLeft_id	=  -2147483647
			)
		AND	(
			tvwContactType.ContactTypeRight_id	= ContactTypeRight_id
		OR	ContactTypeRight_id	=  -2147483647
			)
		AND	(
			tvwContactType.ContactTypeLevel_id	= ContactTypeLevel_id
		OR	ContactTypeLevel_id	=  -2147483647
			)
		AND	(
			tvwContactType.ContactTypeOrder_id	= ContactTypeOrder_id
		OR	ContactTypeOrder_id	=  -2147483647
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

