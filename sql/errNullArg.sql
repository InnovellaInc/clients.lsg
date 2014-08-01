DROP PROCEDURE IF EXISTS `errNullArg`
;

DELIMITER //
CREATE PROCEDURE	errNullArg
(
	Proc_nm		VARCHAR(64)
,	Action_nm	VARCHAR(64)
)
BEGIN
/*
**	Name:		errNullArg
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
DECLARE NULL_ARG	CONDITION FOR SQLSTATE '99005';
DECLARE ERRORMSG	VARCHAR(1024) DEFAULT
	CONCAT
			(
				'Error: '
			,	IFNULL(Proc_nm, '<Unknown>')
			,	' - Argument(s) cannot be NULL for '
			,	IFNULL(Action_nm, '<Unknown>')
			,	' action. '
			);
###############################################################################
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	#######################################################################
-- 	SHOW ERRORS;
-- 	SHOW WARNINGS;
	SIGNAL NULL_ARG
	SET MESSAGE_TEXT	= ERRORMSG
	,	MYSQL_ERRNO	= 9005;
	#######################################################################
###############################################################################
 END;
###############################################################################
END
//
DELIMITER ;
;








