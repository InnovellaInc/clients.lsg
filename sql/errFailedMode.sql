DROP PROCEDURE IF EXISTS `errFailedMode`
;

DELIMITER //
CREATE PROCEDURE	errFailedMode
(
	Proc_nm		VARCHAR(64)
,	Mode_cd		VARCHAR(48)
,	Action_nm	VARCHAR(64)
,	Table_nm	VARCHAR(64)
)
BEGIN
/*
**	Name:		errFailedMode
**	Type:		Special Procedure
**	Purpose:	To raise an error and print message based on arguments
**			passed to this procedure.
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**	Date:		03/15/03
**
**	Modified:	03/15/03
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE FAILED_MODE	CONDITION FOR SQLSTATE '99002'; -- '01099'
DECLARE ERRORMSG	VARCHAR(1024) DEFAULT
	CONCAT
			(
				'Error: '
			,	Proc_nm
			,	' - Database MODE is set to '
			,	Mode_cd
			,	'. '
			,	Action_nm
			,	' is not allowed on table '
			,	Table_nm
			,	' for this MODE setting.'
			);
###############################################################################
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
-- 	SHOW ERRORS;
-- 	SHOW WARNINGS;
	SIGNAL FAILED_MODE
	SET MESSAGE_TEXT	= ERRORMSG
	,	MYSQL_ERRNO	= 9002
	,	TABLE_NAME	= Table_nm;  
	#######################################################################
###############################################################################
END;
###############################################################################
END
//
DELIMITER ;
;


