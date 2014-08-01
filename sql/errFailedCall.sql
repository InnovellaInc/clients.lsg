DROP PROCEDURE IF EXISTS `errFailedCall`
;

DELIMITER //
CREATE PROCEDURE	errFailedCall
(
	Proc_nm		VARCHAR(64)
,	CallingProc_nm		VARCHAR(64)
)
BEGIN
/*
**	Name:		errFailedCall
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
DECLARE FAILED_CALL	CONDITION FOR SQLSTATE '99004';
DECLARE ERRORMSG	VARCHAR(1024) DEFAULT
	CONCAT
			(
				'Error: '
			,	IFNULL(Proc_nm, '<Unknown>')
			,	' - Failed on call to '
			,	IFNULL(CallingProc_nm, '<Unknown>')
			);
###############################################################################
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
-- 	SHOW ERRORS;
-- 	SHOW WARNINGS;
	#######################################################################
	SIGNAL FAILED_CALL
	SET MESSAGE_TEXT	= ERRORMSG
	,	MYSQL_ERRNO	= 9004
	,	TABLE_NAME	= Table_nm;  
	#######################################################################
###############################################################################
 END;
###############################################################################
END
//
DELIMITER ;
;


