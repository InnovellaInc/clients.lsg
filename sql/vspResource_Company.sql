DROP PROCEDURE IF EXISTS	vspResource_Company
;

DELIMITER //
CREATE PROCEDURE	vspResource_Company
(
	Resrc_id		INT SIGNED
,	Resrc_tp		VARCHAR(64)
,	Company_id		INT SIGNED
,	Company_tp		VARCHAR(64)
,	Resrc_nm		VARCHAR(256)
,	Resrc_cd		VARCHAR(128)
,	Alias_nm		VARCHAR(256)
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
**	Name:		vspResource_Company
**	Type:		Validation Stored Procedure
**	Purpose:	Validate a record in tblResource_Company
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	7/2/2013
**	Modnumber:
**	Modification:	
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResource_Company';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'vspResource_Company';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
VSP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	DECLARE	AK1		VARCHAR(255) DEFAULT CONCAT(Resrc_tp,",",Company_id,",",Company_tp,",",Resrc_nm);
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
				tblResource_Company
			WHERE	1=1
			AND	tblResource_Company.Resrc_id	= Resrc_id
			AND	tblResource_Company.Resrc_tp	= Resrc_tp
			AND	tblResource_Company.Company_id	= Company_id
			AND	tblResource_Company.Company_tp	= Company_tp
			AND	tblResource_Company.Resrc_nm	= Resrc_nm
		)
		THEN
			SET IsValid_fg	= TRUE;	-- Return if the attributes did not change
		ELSE
			CALL	rspResource_Company
			(
				@Resrc_id	:= Resrc_id
			,	@Resrc_tp	:= Resrc_tp
			,	@Company_id	:= Company_id
			,	@Company_tp	:= Company_tp
			,	@Resrc_nm	:= Resrc_nm
			,	@Resrc_cd	:= Resrc_cd
			,	@Alias_nm	:= Alias_nm
			,	@ADD_dm	:= ADD_dm
			,	@ADD_nm	:= ADD_nm
			,	@UPD_dm	:= UPD_dm
			,	@UPD_nm	:= UPD_nm
			,	@DEL_dm	:= DEL_dm
			,	@DEL_nm	:= DEL_nm
			
			,	@Key_cd		:= 'AK'
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

