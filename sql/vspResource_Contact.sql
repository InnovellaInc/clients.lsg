DROP PROCEDURE IF EXISTS	vspResource_Contact
;

DELIMITER //
CREATE PROCEDURE	vspResource_Contact
(
	Resrc_id	INT SIGNED
,	Resrc_tp	VARCHAR(64)
,	Contact_id	INT SIGNED
,	Contact_tp	VARCHAR(64)
,	Contact_nm	VARCHAR(256)
,	Contact_cd	VARCHAR(128)
,	Alias_nm	VARCHAR(256)
,	Address_nm	VARCHAR(256)
,	City_cd		VARCHAR(128)
,	State_cd	VARCHAR(128)
,	Zip_cd		VARCHAR(128)
,	Phone_cd	VARCHAR(128)
,	GPS_cd		VARCHAR(128)
,INOUT	ADD_dm		DATETIME
,INOUT	ADD_nm		VARCHAR(256)
,INOUT	UPD_dm		DATETIME
,INOUT	UPD_nm		VARCHAR(256)
,INOUT	DEL_dm		DATETIME
,INOUT	DEL_nm		VARCHAR(256)

,	SYSRIGHT		VARCHAR(30)		-- Intended DML action
,	Mode_cd		VARCHAR(16)		-- Database cascade mode code
,	OUT 	IsValid_fg	BOOLEAN
)
BEGIN
/*
**	Name:		vspResource_Contact
**	Type:		Validation Stored Procedure
**	Purpose:	Validate a record in tblResource_Contact
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	7/2/2013
**	Modnumber:
**	Modification:	
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResource_Contact';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'vspResource_Contact';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
VSP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	DECLARE	AK1		VARCHAR(255) DEFAULT CONCAT(IFNULL(Resrc_id,"(null)"), Resrc_tp,",",Contact_tp);
	#######################################################################
	-- Validate:
	--
	--	Duplicate names within a type are not allowed
	--	Alternate (Candidate) Key Check
	#######################################################################
	IF
		SYSRIGHT	= 'INSERT'
	OR 	SYSRIGHT 	= 'UPDATE'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tblResource_Contact
			WHERE	1=1
			AND	tblResource_Contact.Resrc_id	= Resrc_id
			AND	tblResource_Contact.Resrc_tp	= Resrc_tp
			AND	tblResource_Contact.Contact_id	= Contact_id
			AND	tblResource_Contact.Contact_tp	= Contact_tp
--			AND	tblResource_Contact.Contact_nm	= Contact_nm
		)
		THEN
			SET IsValid_fg	= TRUE;	-- Return if the attributes did not change
		ELSE
			CALL	rspResource_Contact
			(
				@Resrc_id	:= Resrc_id
			,	@Resrc_tp	:= Resrc_tp
			,	@Contact_id	:= NULL
			,	@Contact_tp	:= Contact_tp
			,	@Contact_nm	:= NULL
			,	@Contact_cd	:= NULL
			,	@Alias_nm	:= NULL
			,	@Address_nm	:= NULL
			,	@City_cd	:= NULL
			,	@State_cd	:= NULL
			,	@Zip_cd		:= NULL
			,	@Phone_cd	:= NULL
			,	@GPS_cd		:= NULL
			,	@ADD_dm	:= NULL
			,	@ADD_nm	:= NULL
			,	@UPD_dm	:= NULL
			,	@UPD_nm	:= NULL
			,	@DEL_dm	:= NULL
			,	@DEL_nm	:= NULL
			,	@Key_cd	:= 'AK'
			,	@RowExists_fg
			);

			IF
				@RowExists_fg	= 1	-- AK exists and not for this PK
			THEN
				SET IsValid_fg	= FALSE;
				CALL 	errAKExist
				(
					@Proc_nm	:= Proc_nm
				,	@Table_nm	:= SYSTABLE
				,	@AK_nm		:= AK1
				);
			END IF;
		END IF;
	END IF;
	IF
		SYSRIGHT = 'INSERT'
	THEN
		IF	ADD_dm IS NULL OR ADD_dm = '0000-00-00 00:00:00'
		THEN
			SET	ADD_dm	= UTC_TIMESTAMP();
		END IF;
		IF	ADD_nm	IS NULL OR ADD_nm = '-2147483647'
		THEN
			SET	ADD_nm	= CURRENT_USER();
		END IF;
		LEAVE VSP;
	END IF;

	IF
		SYSRIGHT = 'UPDATE'
	THEN
		IF	UPD_dm	IS NULL OR UPD_dm = '0000-00-00 00:00:00'
		THEN
			SET	UPD_dm	= UTC_TIMESTAMP();
		END IF;
		IF	UPD_nm	IS NULL OR UPD_nm = '-2147483647'
		THEN
			SET	UPD_nm	= CURRENT_USER();
		END IF;
		IF	DEL_dm	IS NULL OR DEL_dm = '0000-00-00 00:00:00'
		THEN
			SET	DEL_dm	= NULL;
		END IF;
		IF	(DEL_nm	IS NULL OR DEL_nm = '-2147483647')
		AND	(DEL_dm > '0000-00-00 00:00:00')
		THEN
			SET	DEL_nm	= CURRENT_USER();
		ELSE
			SET 	DEL_nm	= NULL;
		END IF;
		LEAVE VSP;
	END IF;

	IF
		SYSRIGHT = 'DELETE'
	THEN
		IF	DEL_dm	IS NULL OR DEL_dm = '0000-00-00 00:00:00'
		THEN
			SET	DEL_dm	= UTC_TIMESTAMP();
		END IF;
		IF	DEL_nm	IS NULL OR DEL_nm = '-2147483647'
		THEN
			SET	DEL_nm	= CURRENT_USER();
		END IF;
		SET	UPD_dm	= UTC_TIMESTAMP();
		SET	UPD_nm	= CURRENT_USER();
		LEAVE VSP;
	END IF;
	#######################################################################
END	VSP
;
###############################################################################
END
//
DELIMITER ;
;

