DROP PROCEDURE IF EXISTS	vspResource
;

DELIMITER //
CREATE PROCEDURE	vspResource
(
	Resrc_id		INT SIGNED		
,	Resrc_tp		VARCHAR(64)		
,	Resrc_tx		MEDIUMTEXT		
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
**	Name:		vspResource
**	Type:		Validation Stored Procedure
**	Purpose:	Validate a record in tblResource
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	7/2/2013
**	Modnumber:
**	Modification:	
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResource';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'vspResource';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
VSP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	#######################################################################
	-- Validate:
	--
	--	Duplicate names within a type are not allowed
	--	Alternate (Candidate) Key Check
	#######################################################################
	IF
		SYSRIGHT = 'INSERT'
	THEN
		IF	ADD_dm	IS NULL OR ADD_dm = '0000-00-00 00:00:00'
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

