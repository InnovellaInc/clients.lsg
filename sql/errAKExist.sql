DROP PROCEDURE IF EXISTS `errAKExist`
;

DELIMITER //
CREATE PROCEDURE	errAKExist
(
	Proc_nm		VARCHAR(64)
,	Table_nm	VARCHAR(64)
,	Key_nm		VARCHAR(255)
)
BEGIN
/*
**	Name:		errAKExist
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
DECLARE AK_EXIST	CONDITION FOR SQLSTATE '99003';
DECLARE ERRORMSG	VARCHAR(1024) DEFAULT
	CONCAT
			(
				'Error: '
			,	IFNULL(Proc_nm, '<Unknown>')
			,	' - A duplicate row in '
			,	IFNULL(Table_nm, '<Unknown>')
			,	' exists for AK - '
			,	IFNULL(Key_nm, '<Unknown>')
			);
###############################################################################
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
-- 	SHOW ERRORS;
-- 	SHOW WARNINGS;
	SIGNAL AK_EXIST
	SET MESSAGE_TEXT	= ERRORMSG
	,	MYSQL_ERRNO	= 9003
	,	TABLE_NAME	= Table_nm;  
	#######################################################################
###############################################################################
END;
###############################################################################
END
//
DELIMITER ;
;

