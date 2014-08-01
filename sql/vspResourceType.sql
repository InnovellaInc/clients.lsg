DROP PROCEDURE IF EXISTS	vspResourceType
;

DELIMITER //
CREATE PROCEDURE	vspResourceType
(
	Resrc_tp		VARCHAR(64)		
,	ParentResrc_tp		VARCHAR(64)		
,	ResrcType_tx		MEDIUMTEXT		
,	Left_id		INT SIGNED		
,	Right_id		INT SIGNED		
,	Level_id		INT SIGNED		
,	Order_id		INT SIGNED		

,	SYSRIGHT		VARCHAR(30)		-- Intended DML action
,	Mode_cd		VARCHAR(16)		-- Database cascade mode code
,	OUT 	IsValid_fg	BOOLEAN
)
BEGIN
/*
**	Name:		vspResourceType
**	Type:		Validation Stored Procedure
**	Purpose:	Validate a record in tblResourceType
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	4/9/2013
**	Modnumber:
**	Modification:	
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResourceType';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'vspResourceType';
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
		Resrc_tp	IS NULL
	OR 	Resrc_tp = ''
	THEN
		CALL	errNullArg
		(
			@Proc_nm	:= Proc_nm
		,	@Action_nm	:= SYSRIGHT
		);
		LEAVE VSP;
	END IF;
	#######################################################################
END VSP;
###############################################################################
END
//
DELIMITER ;
;

