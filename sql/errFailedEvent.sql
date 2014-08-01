DROP PROCEDURE IF EXISTS `errFailedEvent`
;

DELIMITER //
CREATE PROCEDURE	errFailedEvent
(
	Proc_nm		VARCHAR(64)
,	Table_nm		VARCHAR(64)
,	Action_nm		VARCHAR(64)
)
BEGIN
/*
**	Name:		errFailedEvent
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
DECLARE FAILED_EVENT	CONDITION FOR SQLSTATE '99001';
DECLARE ERRORMSG	VARCHAR(1024) DEFAULT
	CONCAT
			(
				'Error: '
			,	Proc_nm
			,	' - Failed to '
			,	Action_nm
			,	' record(s) for table '
			,	Table_nm
			);
###############################################################################
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
 	SHOW ERRORS;
-- 	SHOW WARNINGS;
	SIGNAL FAILED_EVENT
	SET MESSAGE_TEXT	= ERRORMSG
	,	MYSQL_ERRNO	= 9001
	,	TABLE_NAME	= Table_nm;  
	#######################################################################
###############################################################################
 END;
###############################################################################
END
//
DELIMITER ;
;


