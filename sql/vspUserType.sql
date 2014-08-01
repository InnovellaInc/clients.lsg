DROP PROCEDURE IF EXISTS	vspUserType
;

DELIMITER //
CREATE PROCEDURE	vspUserType
(
	User_tp		VARCHAR(64)		

,	SYSRIGHT		VARCHAR(30)		-- Intended DML action
,	Mode_cd		VARCHAR(16)		-- Database cascade mode code
,	OUT 	IsValid_fg	BOOLEAN
)
BEGIN
/*
**	Name:		vspUserType
**	Type:		Validation Stored Procedure
**	Purpose:	Validate a record in tblUserType
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	6/18/2013
**	Modnumber:
**	Modification:	
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblUserType';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'vspUserType';
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
	SET IsValid_fg	= TRUE;	-- Return if the attributes did not change
	#######################################################################
END	VSP
;
###############################################################################
END
//
DELIMITER ;
;

