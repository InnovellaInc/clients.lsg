/*
SQLyog Enterprise v11.01 (64 bit)
MySQL - 5.6.10-log : Database - local_lsg
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/* Procedure structure for procedure errAKExist */

/*!50003 DROP PROCEDURE IF EXISTS  errAKExist */;

DELIMITER $$

/*!50003 CREATE PROCEDURE errAKExist(
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
END */$$
DELIMITER ;

/* Procedure structure for procedure errFailedCall */

/*!50003 DROP PROCEDURE IF EXISTS  errFailedCall */;

DELIMITER $$

/*!50003 CREATE PROCEDURE errFailedCall(
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
END */$$
DELIMITER ;

/* Procedure structure for procedure errFailedEvent */

/*!50003 DROP PROCEDURE IF EXISTS  errFailedEvent */;

DELIMITER $$

/*!50003 CREATE PROCEDURE errFailedEvent(
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
END */$$
DELIMITER ;

/* Procedure structure for procedure errFailedMode */

/*!50003 DROP PROCEDURE IF EXISTS  errFailedMode */;

DELIMITER $$

/*!50003 CREATE PROCEDURE errFailedMode(
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
END */$$
DELIMITER ;

/* Procedure structure for procedure errFKExist */

/*!50003 DROP PROCEDURE IF EXISTS  errFKExist */;

DELIMITER $$

/*!50003 CREATE PROCEDURE errFKExist(
	Proc_nm		VARCHAR(64)
,	Table_nm	VARCHAR(64)
,	Action_nm	VARCHAR(64)
,	Key_nm		VARCHAR(255)
)
BEGIN
/*
**	Name:		errFKExist
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
DECLARE FK_NOT_EXIST	CONDITION FOR SQLSTATE '99006';
DECLARE ERRORMSG	VARCHAR(1024) DEFAULT
	CONCAT
			(
				"Error: "
			,	IFNULL(Proc_nm, "<Unknown>")
			,	" - A matching Foreign Key row with value "
			,	"'",	IFNULL(Key_nm, "<Unknown>"),	"'"
			,	" already exists in "
			,	IFNULL(Table_nm, "<Unknown>")
			,	" for this "
			,	IFNULL(Action_nm, "<Unknown>")
			,	"."
			);
###############################################################################
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
-- 	SHOW ERRORS;
-- 	SHOW WARNINGS;
	SIGNAL FK_NOT_EXIST
	SET MESSAGE_TEXT	= ERRORMSG
	,	MYSQL_ERRNO	= 9006
	,	TABLE_NAME	= Table_nm;  
	#######################################################################
###############################################################################
END;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure errFKNotExist */

/*!50003 DROP PROCEDURE IF EXISTS  errFKNotExist */;

DELIMITER $$

/*!50003 CREATE PROCEDURE errFKNotExist(
	Proc_nm		VARCHAR(64)
,	Table_nm	VARCHAR(64)
,	Action_nm	VARCHAR(64)
,	Key_nm		VARCHAR(255)
)
BEGIN
/*
**	Name:		errFKNotExist
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
DECLARE FK_NOT_EXIST	CONDITION FOR SQLSTATE '99006';
DECLARE ERRORMSG	VARCHAR(1024) DEFAULT
	CONCAT
			(
				"Error: "
			,	IFNULL(Proc_nm, "<Unknown>")
			,	" - No matching Foreign Key row with value "
			,	"'",	IFNULL(Key_nm, "<Unknown>"),	"'"
			,	" was found in "
			,	IFNULL(Table_nm, "<Unknown>")
			,	" for this "
			,	IFNULL(Action_nm, "<Unknown>")
            ,   " action."
			);
###############################################################################
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
-- 	SHOW ERRORS;
-- 	SHOW WARNINGS;
	SIGNAL FK_NOT_EXIST
	SET MESSAGE_TEXT	= ERRORMSG
	,	MYSQL_ERRNO	= 9006
	,	TABLE_NAME	= Table_nm;  
	#######################################################################
###############################################################################
END;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure errNullArg */

/*!50003 DROP PROCEDURE IF EXISTS  errNullArg */;

DELIMITER $$

/*!50003 CREATE PROCEDURE errNullArg(
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
END */$$
DELIMITER ;

/* Procedure structure for procedure errPKExist */

/*!50003 DROP PROCEDURE IF EXISTS  errPKExist */;

DELIMITER $$

/*!50003 CREATE PROCEDURE errPKExist(
	Proc_nm		VARCHAR(64)
,	Table_nm	VARCHAR(64)
,	Action_nm	VARCHAR(64)
,	Key_nm		VARCHAR(255)
)
BEGIN
/*
**	Name:		errPKExist
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
DECLARE FK_NOT_EXIST	CONDITION FOR SQLSTATE '99006';
DECLARE ERRORMSG	VARCHAR(1024) DEFAULT
	CONCAT
			(
				"Error: "
			,	IFNULL(Proc_nm, "<Unknown>")
			,	" - A matching Primary Key row with value "
			,	"'",	IFNULL(Key_nm, "<Unknown>"),	"'"
			,	" already exists in "
			,	IFNULL(Table_nm, "<Unknown>")
			,	" for this "
			,	IFNULL(Action_nm, "<Unknown>")
			,	"."
			);
###############################################################################
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
-- 	SHOW ERRORS;
-- 	SHOW WARNINGS;
	SIGNAL FK_NOT_EXIST
	SET MESSAGE_TEXT	= ERRORMSG
	,	MYSQL_ERRNO	= 9006
	,	TABLE_NAME	= Table_nm;  
	#######################################################################
###############################################################################
END;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure errPKNotExist */

/*!50003 DROP PROCEDURE IF EXISTS  errPKNotExist */;

DELIMITER $$

/*!50003 CREATE PROCEDURE errPKNotExist(
	Proc_nm		VARCHAR(64)
,	Table_nm	VARCHAR(64)
,	Action_nm	VARCHAR(64)
,	Key_nm		VARCHAR(255)
)
BEGIN
/*
**	Name:		errPKNotExist
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
DECLARE FK_NOT_EXIST	CONDITION FOR SQLSTATE '99006';
DECLARE ERRORMSG	VARCHAR(1024) DEFAULT
	CONCAT
			(
				"Error: "
			,	IFNULL(Proc_nm, "<Unknown>")
			,	" - No matching Primary Key row with value "
			,	"'",	IFNULL(Key_nm, "<Unknown>"),	"'"
			,	" was found in "
			,	IFNULL(Table_nm, "<Unknown>")
			,	" for this "
			,	IFNULL(Action_nm, "<Unknown>")
			,	"."
			);
###############################################################################
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
-- 	SHOW ERRORS;
-- 	SHOW WARNINGS;
	SIGNAL FK_NOT_EXIST
	SET MESSAGE_TEXT	= ERRORMSG
	,	MYSQL_ERRNO	= 9006
	,	TABLE_NAME	= Table_nm;  
	#######################################################################
###############################################################################
END;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure gfpCompany */

/*!50003 DROP PROCEDURE IF EXISTS  gfpCompany */;

DELIMITER $$

/*!50003 CREATE PROCEDURE gfpCompany(
	Company_id		INT SIGNED		-- PK1 
,	Company_tp		VARCHAR(64)		-- PK2 AK1
,	Company_nm		VARCHAR(256)		--  AK2
,	Company_cd		VARCHAR(128)	
,	Company_tx		MEDIUMTEXT	
,	CompanyADD_dm		DATETIME	
,	CompanyADD_nm		VARCHAR(256)	
,	CompanyUPD_dm		DATETIME	
,	CompanyUPD_nm		VARCHAR(256)	
,	CompanyDEL_dm		DATETIME	
,	CompanyDEL_nm		VARCHAR(256)	
,	ParentCompany_tp		VARCHAR(64)	
,	CompanyType_tx		MEDIUMTEXT	
,	CompanyTypeLeft_id		INT SIGNED	
,	CompanyTypeRight_id		INT SIGNED	
,	CompanyTypeLevel_id		INT SIGNED	
,	CompanyTypeOrder_id		INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceCompany	Company name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Key_cd		VARCHAR(16)	-- Search key code
-- ,	RowSort_nm	varchar(256)
)
BEGIN
/*
**	Name:		gfpCompany
**	Type:		DB API Stored Procedure: Get Filtered
**	Purpose:	To Get an active record or set of active records
**			from tvwCompany
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tvwCompany';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'VIEW';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'gfpCompany';
DECLARE	SQL_tx	MEDIUMTEXT;
###############################################################################
GFP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'AL';	END IF;
--	IF RowSort_nm IS NULL OR RowSort_nm = '' THEN SET RowSort_nm = 'Company_id';	END IF;
	IF Company_id IS NULL OR Company_id = 0 THEN SET Company_id =  -2147483647;	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = '-2147483647';	END IF;
	IF Company_nm IS NULL OR Company_nm = '' THEN SET Company_nm = '-2147483647';	END IF;
	IF Company_cd IS NULL OR Company_cd = '' THEN SET Company_cd = '-2147483647';	END IF;
	IF Company_tx IS NULL OR Company_tx = '' THEN SET Company_tx = '-2147483647';	END IF;
	IF CompanyADD_dm IS NULL THEN SET CompanyADD_dm = '0000-00-00 00:00:00';	END IF;
	IF CompanyADD_nm IS NULL OR CompanyADD_nm = '' THEN SET CompanyADD_nm = '-2147483647';	END IF;
	IF CompanyUPD_dm IS NULL THEN SET CompanyUPD_dm = '0000-00-00 00:00:00';	END IF;
	IF CompanyUPD_nm IS NULL OR CompanyUPD_nm = '' THEN SET CompanyUPD_nm = '-2147483647';	END IF;
	IF CompanyDEL_dm IS NULL THEN SET CompanyDEL_dm = '0000-00-00 00:00:00';	END IF;
	IF CompanyDEL_nm IS NULL OR CompanyDEL_nm = '' THEN SET CompanyDEL_nm = '-2147483647';	END IF;
	IF ParentCompany_tp IS NULL OR ParentCompany_tp = '' THEN SET ParentCompany_tp = '-2147483647';	END IF;
	IF CompanyType_tx IS NULL OR CompanyType_tx = '' THEN SET CompanyType_tx = '-2147483647';	END IF;
	IF CompanyTypeLeft_id IS NULL OR CompanyTypeLeft_id = 0 THEN SET CompanyTypeLeft_id =  -2147483647;	END IF;
	IF CompanyTypeRight_id IS NULL OR CompanyTypeRight_id = 0 THEN SET CompanyTypeRight_id =  -2147483647;	END IF;
	IF CompanyTypeLevel_id IS NULL OR CompanyTypeLevel_id = 0 THEN SET CompanyTypeLevel_id =  -2147483647;	END IF;
	IF CompanyTypeOrder_id IS NULL OR CompanyTypeOrder_id = 0 THEN SET CompanyTypeOrder_id =  -2147483647;	END IF;
	#######################################################################
	-- Check Security
	#######################################################################
/*	EXECUTE	RETURN		= spSecurityCheck
		SYSTABLE	= SYSTABLE
	,	SYSRIGHT	= SYSRIGHT
	IF
	(
		RETURN	<> 0
	)
	BEGIN
		EXECUTE	STATUS		= errFailedSecurity
			Proc_nm	= Proc_nm
		,	Table_nm	= SYSTABLE
		,	Action_nm	= SYSRIGHT
		RETURN	STATUS
	END
*/
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF	Key_cd = 'PK'
	THEN
		SELECT	*
		FROM
			tvwCompany
		WHERE
			tvwCompany.Company_id	= Company_id
		AND	tvwCompany.Company_tp	= Company_tp
		AND	tvwCompany.CompanyDEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd	= 'FK1'
	THEN
		SELECT	*
		FROM
			tvwCompany
		WHERE
			tvwCompany.Company_tp	= Company_tp
		AND	tvwCompany.CompanyDEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	IF	Key_cd	= 'FK2'
	THEN
		SELECT	*
		FROM
			tvwCompany
		WHERE
			tvwCompany.Company_tp	= Company_tp
		AND	tvwCompany.Company_id	= Company_id
		AND	tvwCompany.CompanyDEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	IF	Key_cd = 'AK'
	THEN
		SELECT	*
		FROM
			tvwCompany
		WHERE
			tvwCompany.Company_tp	= Company_tp
		AND	tvwCompany.Company_nm	= Company_nm
		AND	tvwCompany.CompanyDEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Search Key lookup
	#######################################################################
	--   NO UI SEARCH KEY(S) DEFINED FOR THIS OBJECT
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd = 'AL'
	THEN
		SELECT	*
		FROM
			tvwCompany
		WHERE
			(
			tvwCompany.Company_id	=  Company_id
		OR	Company_id	=  -2147483647
			)
		AND	(
			tvwCompany.Company_tp	= Company_tp
		OR	Company_tp	= '-2147483647'
			)
		AND	(
			tvwCompany.Company_nm	LIKE CONCAT('%', Company_nm, '%')
		OR	Company_nm	= '-2147483647'
			)
		AND	(
			tvwCompany.Company_cd	LIKE CONCAT('%', Company_cd, '%')
		OR	Company_cd	= '-2147483647'
			)
		AND	(
			tvwCompany.Company_tx	LIKE CONCAT('%', Company_tx, '%')
		OR	Company_tx	LIKE '-2147483647'
			)
 		AND	(
 			tvwCompany.CompanyADD_dm	>= CompanyADD_dm
 		OR	CompanyADD_dm	= '0000-00-00 00:00:00'
 		OR	CompanyADD_dm	IS NULL
 			)
		AND	(
			tvwCompany.CompanyADD_nm	LIKE CONCAT('%', CompanyADD_nm, '%')
		OR	CompanyADD_nm	= '-2147483647'
			)
  		AND	(
  			tvwCompany.CompanyUPD_dm	>= CompanyUPD_dm
 		OR	CompanyUPD_dm	= '0000-00-00 00:00:00'
   		OR	CompanyUPD_dm	IS NULL
  			)
 		AND	(
 			tvwCompany.CompanyUPD_nm	LIKE CONCAT('%', CompanyUPD_nm, '%')
 		OR	CompanyUPD_nm	= '-2147483647'
 			)
  		AND	(
  			tvwCompany.CompanyDEL_dm	IS NULL
  			)
 		AND	(
 			tvwCompany.CompanyDEL_nm	IS NULL
 			)
 		AND	(
 			tvwCompany.ParentCompany_tp	= ParentCompany_tp
 		OR	ParentCompany_tp	= '-2147483647'
 			)
 		AND	(
 			tvwCompany.CompanyType_tx	LIKE CONCAT('%', CompanyType_tx, '%')
 		OR	CompanyType_tx	LIKE '-2147483647'
 			)
 		AND	(
 			tvwCompany.CompanyTypeLeft_id	= CompanyTypeLeft_id
 		OR	CompanyTypeLeft_id	=  -2147483647
 			)
 		AND	(
 			tvwCompany.CompanyTypeRight_id	= CompanyTypeRight_id
 		OR	CompanyTypeRight_id	=  -2147483647
 			)
 		AND	(
 			tvwCompany.CompanyTypeLevel_id	= CompanyTypeLevel_id
 		OR	CompanyTypeLevel_id	=  -2147483647
 			)
 		AND	(
 			tvwCompany.CompanyTypeOrder_id	= CompanyTypeOrder_id
 		OR	CompanyTypeOrder_id	=  -2147483647
 			)
;
		SET @SQL_tx := CONCAT
		("
		SELECT	*
		FROM
			tvwCompany
		WHERE
			(
			tvwCompany.Company_id	=  Company_id
		OR	Company_id	=  -2147483647
			)
		AND	(
			tvwCompany.Company_tp	= Company_tp
		OR	Company_tp	= '-2147483647'
			)
		AND	(
			tvwCompany.Company_nm	LIKE CONCAT('%', Company_nm, '%')
		OR	Company_nm	= '-2147483647'
			)
		AND	(
			tvwCompany.Company_cd	LIKE CONCAT('%', Company_cd, '%')
		OR	Company_cd	= '-2147483647'
			)
		AND	(
			tvwCompany.Company_tx	LIKE CONCAT('%', Company_tx, '%')
		OR	Company_tx	LIKE '-2147483647'
			)
 		AND	(
 			tvwCompany.CompanyADD_dm	>= CompanyADD_dm
 		OR	CompanyADD_dm	= '0000-00-00 00:00:00'
 		OR	CompanyADD_dm	IS NULL
 			)
		AND	(
			tvwCompany.CompanyADD_nm	LIKE CONCAT('%', CompanyADD_nm, '%')
		OR	CompanyADD_nm	= '-2147483647'
			)
  		AND	(
  			tvwCompany.CompanyUPD_dm	>= CompanyUPD_dm
 		OR	CompanyUPD_dm	= '0000-00-00 00:00:00'
   		OR	CompanyUPD_dm	IS NULL
  			)
 		AND	(
 			tvwCompany.CompanyUPD_nm	LIKE CONCAT('%', CompanyUPD_nm, '%')
 		OR	CompanyUPD_nm	= '-2147483647'
 			)
  		AND	(
  			tvwCompany.CompanyDEL_dm	IS NULL
  		OR	1=1
  			)
 		AND	(
 			tvwCompany.CompanyDEL_nm	IS NULL
 		OR	1=1
 			)
 		AND	(
 			tvwCompany.ParentCompany_tp	= ParentCompany_tp
 		OR	ParentCompany_tp	= '-2147483647'
 			)
 		AND	(
 			tvwCompany.CompanyType_tx	LIKE CONCAT('%', CompanyType_tx, '%')
 		OR	CompanyType_tx	LIKE '-2147483647'
 			)
 		AND	(
 			tvwCompany.CompanyTypeLeft_id	= CompanyTypeLeft_id
 		OR	CompanyTypeLeft_id	=  -2147483647
 			)
 		AND	(
 			tvwCompany.CompanyTypeRight_id	= CompanyTypeRight_id
 		OR	CompanyTypeRight_id	=  -2147483647
 			)
 		AND	(
 			tvwCompany.CompanyTypeLevel_id	= CompanyTypeLevel_id
 		OR	CompanyTypeLevel_id	=  -2147483647
 			)
 		AND	(
 			tvwCompany.CompanyTypeOrder_id	= CompanyTypeOrder_id
 		OR	CompanyTypeOrder_id	=  -2147483647
 			)
		ORDER BY
		"
--		,	RowSort_nm
		);
-- select @SQL_tx;
-- prepare stmt from @SQL_tx ;
-- execute stmt;
-- deallocate prepare stmt;
		LEAVE GFP;
	END IF;
	#######################################################################
END	GFP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure gfpCompanyType */

/*!50003 DROP PROCEDURE IF EXISTS  gfpCompanyType */;

DELIMITER $$

/*!50003 CREATE PROCEDURE gfpCompanyType(
	Company_tp		VARCHAR(64)		-- PK1 
,	ParentCompany_tp	VARCHAR(64)	
,	CompanyType_tx		MEDIUMTEXT	
,	CompanyTypeLeft_id	INT SIGNED	
,	CompanyTypeRight_id	INT SIGNED	
,	CompanyTypeLevel_id	INT SIGNED	
,	CompanyTypeOrder_id	INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceCompany	Company name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Key_cd		VARCHAR(16)	-- Search key code
)
BEGIN
/*
**	Name:		gfpCompanyType
**	Type:		DB API Stored Procedure: Get Filtered
**	Purpose:	To Get an active record or set of active records
**			from tvwCompanyType
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tvwCompanyType';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'VIEW';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'gfpCompanyType';
###############################################################################
GFP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'AL';	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = '-2147483647';	END IF;
	IF ParentCompany_tp IS NULL OR ParentCompany_tp = '' THEN SET ParentCompany_tp = '-2147483647';	END IF;
	IF CompanyType_tx IS NULL OR CompanyType_tx = '' THEN SET CompanyType_tx = '-2147483647';	END IF;
	IF CompanyTypeLeft_id IS NULL OR CompanyTypeLeft_id = 0 THEN SET CompanyTypeLeft_id =  -2147483647;	END IF;
	IF CompanyTypeRight_id IS NULL OR CompanyTypeRight_id = 0 THEN SET CompanyTypeRight_id =  -2147483647;	END IF;
	IF CompanyTypeLevel_id IS NULL OR CompanyTypeLevel_id = 0 THEN SET CompanyTypeLevel_id =  -2147483647;	END IF;
	IF CompanyTypeOrder_id IS NULL OR CompanyTypeOrder_id = 0 THEN SET CompanyTypeOrder_id =  -2147483647;	END IF;
	#######################################################################
	-- Check Security
	#######################################################################
/*	EXECUTE	RETURN		= spSecurityCheck
		SYSTABLE	= SYSTABLE
	,	SYSRIGHT	= SYSRIGHT
	IF
	(
		RETURN	<> 0
	)
	BEGIN
		EXECUTE	STATUS		= errFailedSecurity
			Proc_nm	= Proc_nm
		,	Table_nm	= SYSTABLE
		,	Action_nm	= SYSRIGHT
		RETURN	STATUS
	END
*/
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF	Key_cd = 'PK'
	THEN
		SELECT	*
		FROM
			tvwCompanyType
		WHERE
			tvwCompanyType.Company_tp	= Company_tp
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd	= 'FK1'
	THEN
		SELECT	*
		FROM
			tvwCompanyType
		WHERE
			tvwCompanyType.Company_tp	= Company_tp
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	-- NO ALTERNATE KEY DEFINED FOR THIS OBJECT
	#######################################################################
	-- Search Key lookup
	#######################################################################
	--   NO UI SEARCH KEY(S) DEFINED FOR THIS OBJECT
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd = 'AL'
	THEN
		SELECT	*
		FROM
			tvwCompanyType
		WHERE
			(
			tvwCompanyType.Company_tp	= Company_tp
		OR	Company_tp	= '-2147483647'
			)
		AND	(
			tvwCompanyType.ParentCompany_tp	= ParentCompany_tp
		OR	ParentCompany_tp	= '-2147483647'
			)
		AND	(
			tvwCompanyType.CompanyType_tx	LIKE CONCAT('%', CompanyType_tx, '%')
		OR	CompanyType_tx	LIKE '-2147483647'
			)
		AND	(
			tvwCompanyType.CompanyTypeLeft_id	= CompanyTypeLeft_id
		OR	CompanyTypeLeft_id	=  -2147483647
			)
		AND	(
			tvwCompanyType.CompanyTypeRight_id	= CompanyTypeRight_id
		OR	CompanyTypeRight_id	=  -2147483647
			)
		AND	(
			tvwCompanyType.CompanyTypeLevel_id	= CompanyTypeLevel_id
		OR	CompanyTypeLevel_id	=  -2147483647
			)
		AND	(
			tvwCompanyType.CompanyTypeOrder_id	= CompanyTypeOrder_id
		OR	CompanyTypeOrder_id	=  -2147483647
			)
		;
		LEAVE GFP;
	END IF;
	#######################################################################
END	GFP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure gfpContactType */

/*!50003 DROP PROCEDURE IF EXISTS  gfpContactType */;

DELIMITER $$

/*!50003 CREATE PROCEDURE gfpContactType(
	Contact_tp		VARCHAR(64)		-- PK1 
,	ParentContact_tp	VARCHAR(64)	
,	ContactType_tx		MEDIUMTEXT	
,	ContactTypeLeft_id	INT SIGNED	
,	ContactTypeRight_id	INT SIGNED	
,	ContactTypeLevel_id	INT SIGNED	
,	ContactTypeOrder_id	INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceContact	Contact name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Key_cd		VARCHAR(16)	-- Search key code
)
BEGIN
/*
**	Name:		gfpContactType
**	Type:		DB API Stored Procedure: Get Filtered
**	Purpose:	To Get an active record or set of active records
**			from tvwContactType
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tvwContactType';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'VIEW';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'gfpContactType';
###############################################################################
GFP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'AL';	END IF;
	IF Contact_tp IS NULL OR Contact_tp = '' THEN SET Contact_tp = '-2147483647';	END IF;
	IF ParentContact_tp IS NULL OR ParentContact_tp = '' THEN SET ParentContact_tp = '-2147483647';	END IF;
	IF ContactType_tx IS NULL OR ContactType_tx = '' THEN SET ContactType_tx = '-2147483647';	END IF;
	IF ContactTypeLeft_id IS NULL OR ContactTypeLeft_id = 0 THEN SET ContactTypeLeft_id =  -2147483647;	END IF;
	IF ContactTypeRight_id IS NULL OR ContactTypeRight_id = 0 THEN SET ContactTypeRight_id =  -2147483647;	END IF;
	IF ContactTypeLevel_id IS NULL OR ContactTypeLevel_id = 0 THEN SET ContactTypeLevel_id =  -2147483647;	END IF;
	IF ContactTypeOrder_id IS NULL OR ContactTypeOrder_id = 0 THEN SET ContactTypeOrder_id =  -2147483647;	END IF;
	#######################################################################
	-- Check Security
	#######################################################################
/*	EXECUTE	RETURN		= spSecurityCheck
		SYSTABLE	= SYSTABLE
	,	SYSRIGHT	= SYSRIGHT
	IF
	(
		RETURN	<> 0
	)
	BEGIN
		EXECUTE	STATUS		= errFailedSecurity
			Proc_nm	= Proc_nm
		,	Table_nm	= SYSTABLE
		,	Action_nm	= SYSRIGHT
		RETURN	STATUS
	END
*/
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF	Key_cd = 'PK'
	THEN
		SELECT	*
		FROM
			tvwContactType
		WHERE
			tvwContactType.Contact_tp	= Contact_tp
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd	= 'FK1'
	THEN
		SELECT	*
		FROM
			tvwContactType
		WHERE
			tvwContactType.Contact_tp	= Contact_tp
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	-- NO ALTERNATE KEY DEFINED FOR THIS OBJECT
	#######################################################################
	-- Search Key lookup
	#######################################################################
	--   NO UI SEARCH KEY(S) DEFINED FOR THIS OBJECT
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd = 'AL'
	THEN
		SELECT	*
		FROM
			tvwContactType
		WHERE
			(
			tvwContactType.Contact_tp	= Contact_tp
		OR	Contact_tp	= '-2147483647'
			)
		AND	(
			tvwContactType.ParentContact_tp	= ParentContact_tp
		OR	ParentContact_tp	= '-2147483647'
			)
		AND	(
			tvwContactType.ContactType_tx	LIKE CONCAT('%', ContactType_tx, '%')
		OR	ContactType_tx	LIKE '-2147483647'
			)
		AND	(
			tvwContactType.ContactTypeLeft_id	= ContactTypeLeft_id
		OR	ContactTypeLeft_id	=  -2147483647
			)
		AND	(
			tvwContactType.ContactTypeRight_id	= ContactTypeRight_id
		OR	ContactTypeRight_id	=  -2147483647
			)
		AND	(
			tvwContactType.ContactTypeLevel_id	= ContactTypeLevel_id
		OR	ContactTypeLevel_id	=  -2147483647
			)
		AND	(
			tvwContactType.ContactTypeOrder_id	= ContactTypeOrder_id
		OR	ContactTypeOrder_id	=  -2147483647
			)
		;
		LEAVE GFP;
	END IF;
	#######################################################################
END	GFP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure gfpResource */

/*!50003 DROP PROCEDURE IF EXISTS  gfpResource */;

DELIMITER $$

/*!50003 CREATE PROCEDURE gfpResource(
	Resrc_id	INT SIGNED		-- PK1 
,	Resrc_tp	VARCHAR(64)		-- PK2 AK1
,	Resrc_tx	MEDIUMTEXT
,	ADD_dm		DATETIME	
,	ADD_nm		VARCHAR(256)	
,	UPD_dm		DATETIME	
,	UPD_nm		VARCHAR(256)	
,	DEL_dm		DATETIME	
,	DEL_nm		VARCHAR(256)	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceCompany	Company name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Key_cd		VARCHAR(16)	-- Search key code
)
BEGIN
/*
**	Name:		gfpResource
**	Type:		DB API Stored Procedure: Get Filtered
**	Purpose:	To Get an active record or set of active records
**			from tvwResource
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tvwResource';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'VIEW';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'gfpResource';
DECLARE	SQL_tx	MEDIUMTEXT;
###############################################################################
GFP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'AL';	END IF;
	IF Resrc_id IS NULL OR Resrc_id = 0 THEN SET Resrc_id =  -2147483647;	END IF;
	IF Resrc_tp IS NULL OR Resrc_tp = '' THEN SET Resrc_tp = '-2147483647';	END IF;
	IF Resrc_tx IS NULL OR Resrc_tx = '' THEN SET Resrc_tx = '-2147483647';	END IF;
	IF ADD_dm IS NULL THEN SET ADD_dm = '0000-00-00 00:00:00';	END IF;
	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = '-2147483647';	END IF;
	IF UPD_dm IS NULL THEN SET UPD_dm = '0000-00-00 00:00:00';	END IF;
	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = '-2147483647';	END IF;
	IF DEL_dm IS NULL THEN SET DEL_dm = '0000-00-00 00:00:00';	END IF;
	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = '-2147483647';	END IF;
	#######################################################################
	-- Check Security
	#######################################################################
/*	EXECUTE	RETURN		= spSecurityCheck
		SYSTABLE	= SYSTABLE
	,	SYSRIGHT	= SYSRIGHT
	IF
	(
		RETURN	<> 0
	)
	BEGIN
		EXECUTE	STATUS		= errFailedSecurity
			Proc_nm	= Proc_nm
		,	Table_nm	= SYSTABLE
		,	Action_nm	= SYSRIGHT
		RETURN	STATUS
	END
*/
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF	Key_cd = 'PK'
	THEN
		SELECT	*
		FROM
			tvwResource
		WHERE	1=1
		AND	tvwResource.Resrc_id	= Resrc_id
		AND	tvwResource.Resrc_tp	= Resrc_tp
		AND	tvwResource.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd	= 'FK1'
	THEN
		SELECT	*
		FROM
			tvwResource
		WHERE	1=1
		AND	tvwResource.Resrc_tp	= Resrc_tp
		AND	tvwResource.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	#######################################################################
	-- Search Key lookup
	#######################################################################
	--   NO UI SEARCH KEY(S) DEFINED FOR THIS OBJECT
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd = 'AL'
	THEN
		SELECT	*
		FROM
			tvwResource
		WHERE	1=1
		AND	(
			tvwResource.Resrc_id	= Resrc_id
		OR	Resrc_id	=  -2147483647
			)
		AND	(
			tvwResource.Resrc_tp	= Resrc_tp
		OR	Resrc_tp	= '-2147483647'
			)
		AND	(
			tvwResource.Resrc_tx	LIKE CONCAT('%', Resrc_tx, '%')
		OR	Resrc_tx	= '-2147483647'
			)
 		AND	(
 			tvwResource.ADD_dm	>= ADD_dm
 		OR	ADD_dm	= '0000-00-00 00:00:00'
 		OR	ADD_dm	IS NULL
 			)
		AND	(
			tvwResource.ADD_nm	LIKE CONCAT('%', ADD_nm, '%')
		OR	ADD_nm	= '-2147483647'
			)
  		AND	(
  			tvwResource.UPD_dm	>= UPD_dm
 		OR	UPD_dm	= '0000-00-00 00:00:00'
   		OR	UPD_dm	IS NULL
  			)
 		AND	(
 			tvwResource.UPD_nm	LIKE CONCAT('%', UPD_nm, '%')
 		OR	UPD_nm	= '-2147483647'
 			)
  		AND	(
  			tvwResource.DEL_dm	IS NULL
  			)
 		AND	(
 			tvwResource.DEL_nm	IS NULL
 			)
		;
		LEAVE GFP;
	END IF;
	#######################################################################
END	GFP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure gfpResource_Company */

/*!50003 DROP PROCEDURE IF EXISTS  gfpResource_Company */;

DELIMITER $$

/*!50003 CREATE PROCEDURE gfpResource_Company(
	Resrc_id		INT SIGNED		-- PK1 
,	Resrc_tp		VARCHAR(64)		-- PK2 AK1
,	Company_id		INT SIGNED		-- PK1 
,	Company_tp		VARCHAR(64)		-- PK2 AK1
,	Resrc_nm		VARCHAR(256)		--  AK2
,	Resrc_cd		VARCHAR(128)	
,	Alias_nm		VARCHAR(256)		--  AK2
,	Company_nm		VARCHAR(256)		--  AK2
,	Company_cd		VARCHAR(128)	
,	Resrc_tx	MEDIUMTEXT
,	Company_tx		MEDIUMTEXT	
,	ADD_dm		DATETIME	
,	ADD_nm		VARCHAR(256)	
,	UPD_dm		DATETIME	
,	UPD_nm		VARCHAR(256)	
,	DEL_dm		DATETIME	
,	DEL_nm		VARCHAR(256)	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceCompany	Company name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Key_cd		VARCHAR(16)	-- Search key code
)
BEGIN
/*
**	Name:		gfpResource_Company
**	Type:		DB API Stored Procedure: Get Filtered
**	Purpose:	To Get an active record or set of active records
**			from tvwResource_Company
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tvwResource_Company';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'VIEW';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'gfpResource_Company';
DECLARE	SQL_tx	MEDIUMTEXT;
###############################################################################
GFP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'AL';	END IF;
	IF Resrc_id IS NULL OR Resrc_id = 0 THEN SET Resrc_id =  -2147483647;	END IF;
	IF Resrc_tp IS NULL OR Resrc_tp = '' THEN SET Resrc_tp = '-2147483647';	END IF;
	IF Company_id IS NULL OR Company_id = 0 THEN SET Company_id =  -2147483647;	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = '-2147483647';	END IF;
	IF Resrc_nm IS NULL OR Resrc_nm = '' THEN SET Resrc_nm = '-2147483647';	END IF;
	IF Resrc_cd IS NULL OR Resrc_cd = '' THEN SET Resrc_cd = '-2147483647';	END IF;
	IF Alias_nm IS NULL OR Alias_nm = '' THEN SET Alias_nm = '-2147483647';	END IF;
	IF Company_nm IS NULL OR Company_nm = '' THEN SET Company_nm = '-2147483647';	END IF;
	IF Company_cd IS NULL OR Company_cd = '' THEN SET Company_cd = '-2147483647';	END IF;
	IF Resrc_tx IS NULL OR Resrc_tx = '' THEN SET Resrc_tx = '-2147483647';	END IF;
	IF Company_tx IS NULL OR Company_tx = '' THEN SET Company_tx = '-2147483647';	END IF;
	IF ADD_dm IS NULL THEN SET ADD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = '-2147483647';	END IF;
	IF UPD_dm IS NULL THEN SET UPD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = '-2147483647';	END IF;
	IF DEL_dm IS NULL THEN SET DEL_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = '-2147483647';	END IF;
	#######################################################################
	-- Check Security
	#######################################################################
/*	EXECUTE	RETURN		= spSecurityCheck
		SYSTABLE	= SYSTABLE
	,	SYSRIGHT	= SYSRIGHT
	IF
	(
		RETURN	<> 0
	)
	BEGIN
		EXECUTE	STATUS		= errFailedSecurity
			Proc_nm	= Proc_nm
		,	Table_nm	= SYSTABLE
		,	Action_nm	= SYSRIGHT
		RETURN	STATUS
	END
*/
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF	Key_cd = 'PK'
	THEN
		SELECT	*
		FROM
			tvwResource_Company
		WHERE	1=1
		AND	tvwResource_Company.Resrc_id	= Resrc_id
		AND	tvwResource_Company.Resrc_tp	= Resrc_tp
		AND	tvwResource_Company.Company_id	= Company_id
		AND	tvwResource_Company.Company_tp	= Company_tp
		AND	tvwResource_Company.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd	= 'FK1'
	THEN
		SELECT	*
		FROM
			tvwResource_Company
		WHERE	1=1
		AND	tvwResource_Company.Resrc_tp	= Resrc_tp
		AND	tvwResource_Company.Company_tp	= Company_tp
		AND	tvwResource_Company.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	IF	Key_cd	= 'FK2'
	THEN
		SELECT	*
		FROM
			tvwResource_Company
		WHERE	1=1
		AND	tvwResource_Company.Resrc_id	= Resrc_id
		AND	tvwResource_Company.Resrc_tp	= Resrc_tp
		AND	tvwResource_Company.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	IF	Key_cd	= 'FK3'
	THEN
		SELECT	*
		FROM
			tvwResource_Company
		WHERE   1=1
		AND	tvwResource_Company.Company_id	= Company_id
		AND	tvwResource_Company.Company_tp	= Company_tp
		AND	tvwResource_Company.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	IF	Key_cd = 'AK'
	THEN
		SELECT	*
		FROM
			tvwResource_Company
		WHERE	1=1
		AND	tvwResource_Company.Resrc_tp	= Resrc_tp
		AND	tvwResource_Company.Company_id	= Company_id
		AND	tvwResource_Company.Company_tp	= Company_tp
		AND	tvwResource_Company.Resrc_nm	= Resrc_nm
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Search Key lookup
	#######################################################################
	--   NO UI SEARCH KEY(S) DEFINED FOR THIS OBJECT
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd = 'AL'
	THEN
		SELECT	*
		FROM
			tvwResource_Company
		WHERE	1=1
		AND	(
			tvwResource_Company.Resrc_id	= Resrc_id
		OR	Resrc_id	=  -2147483647
			)
		AND	(
			tvwResource_Company.Resrc_tp	= Resrc_tp
		OR	Resrc_tp	= '-2147483647'
			)
		AND	(
			tvwResource_Company.Company_id	=  Company_id
		OR	Company_id	=  -2147483647
			)
		AND	(
			tvwResource_Company.Company_tp	= Company_tp
		OR	Company_tp	= '-2147483647'
			)
		AND	(
			tvwResource_Company.Resrc_nm	LIKE CONCAT('%', Resrc_nm, '%')
		OR	Resrc_nm	= '-2147483647'
			)
		AND	(
			tvwResource_Company.Resrc_cd	LIKE CONCAT('%', Resrc_cd, '%')
		OR	Resrc_cd	= '-2147483647'
			)
		AND	(
			tvwResource_Company.Alias_nm	LIKE CONCAT('%', Alias_nm, '%')
		OR	Alias_nm	= '-2147483647'
			)
		AND	(
			tvwResource_Company.Company_nm	LIKE CONCAT('%', Company_nm, '%')
		OR	Company_nm	= '-2147483647'
			)
		AND	(
			tvwResource_Company.Company_cd	LIKE CONCAT('%', Company_cd, '%')
		OR	Company_cd	= '-2147483647'
			)
		AND	(
			tvwResource_Company.Resrc_tx	LIKE CONCAT('%', Resrc_tx, '%')
		OR	Resrc_tx	= '-2147483647'
			)
		AND	(
			tvwResource_Company.Company_tx	LIKE CONCAT('%', Company_tx, '%')
		OR	Company_tx	LIKE '-2147483647'
			)
 		AND	(
 			tvwResource_Company.ADD_dm	>= ADD_dm
 		OR	ADD_dm	= '0000-00-00 00:00:00'
 		OR	ADD_dm	IS NULL
 			)
		AND	(
			tvwResource_Company.ADD_nm	LIKE CONCAT('%', ADD_nm, '%')
		OR	ADD_nm	= '-2147483647'
			)
  		AND	(
  			tvwResource_Company.UPD_dm	>= UPD_dm
 		OR	UPD_dm	= '0000-00-00 00:00:00'
   		OR	UPD_dm	IS NULL
  			)
 		AND	(
 			tvwResource_Company.UPD_nm	LIKE CONCAT('%', UPD_nm, '%')
 		OR	UPD_nm	= '-2147483647'
 			)
  		AND	(
  			tvwResource_Company.DEL_dm	IS NULL
  			)
 		AND	(
 			tvwResource_Company.DEL_nm	IS NULL
 			)
		;
		LEAVE GFP;
	END IF;
	#######################################################################
END	GFP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure gfpResource_Contact */

/*!50003 DROP PROCEDURE IF EXISTS  gfpResource_Contact */;

DELIMITER $$

/*!50003 CREATE PROCEDURE gfpResource_Contact(
	Resrc_id	INT SIGNED		-- PK1 
,	Resrc_tp	VARCHAR(64)		-- PK2 AK1
,	Contact_id	INT SIGNED		-- PK1 
,	Contact_tp	VARCHAR(64)		-- PK2 AK1
,	Contact_nm	VARCHAR(256)		--  AK2
,	Contact_cd	VARCHAR(128)	
,	Alias_nm	VARCHAR(256)		--  AK2
,	Address_nm	VARCHAR(256)
,	City_cd		VARCHAR(128)
,	State_cd	VARCHAR(128)
,	Zip_cd		VARCHAR(128)
,	Phone_cd	VARCHAR(128)
,	GPS_cd		VARCHAR(128)
,	Resrc_tx	MEDIUMTEXT	
,	Contact_tx	MEDIUMTEXT	
,	ADD_dm		DATETIME	
,	ADD_nm		VARCHAR(256)	
,	UPD_dm		DATETIME	
,	UPD_nm		VARCHAR(256)	
,	DEL_dm		DATETIME	
,	DEL_nm		VARCHAR(256)	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceContact	Contact name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Key_cd		VARCHAR(16)	-- Search key code
)
BEGIN
/*
**	Name:		gfpResource_Contact
**	Type:		DB API Stored Procedure: Get Filtered
**	Purpose:	To Get an active record or set of active records
**			from tvwResource_Contact
**	Author:		Solomon S. Shacter
**	Contact:	Innovella, Inc.
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tvwResource_Contact';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'VIEW';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'gfpResource_Contact';
DECLARE	SQL_tx	MEDIUMTEXT;
###############################################################################
GFP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'AL';	END IF;
	IF Resrc_id IS NULL OR Resrc_id = 0 THEN SET Resrc_id =  -2147483647;	END IF;
	IF Resrc_tp IS NULL OR Resrc_tp = '' THEN SET Resrc_tp = '-2147483647';	END IF;
	IF Contact_id IS NULL OR Contact_id = 0 THEN SET Contact_id =  -2147483647;	END IF;
	IF Contact_tp IS NULL OR Contact_tp = '' THEN SET Contact_tp = '-2147483647';	END IF;
	IF Contact_nm IS NULL OR Contact_nm = '' THEN SET Contact_nm = '-2147483647';	END IF;
	IF Contact_cd IS NULL OR Contact_cd = '' THEN SET Contact_cd = '-2147483647';	END IF;
	IF Alias_nm IS NULL OR Alias_nm = '' THEN SET Alias_nm = '-2147483647';	END IF;
	IF Address_nm IS NULL OR Address_nm = '' THEN SET Address_nm = '-2147483647';	END IF;
	IF City_cd IS NULL OR City_cd = '' THEN SET City_cd = '-2147483647';	END IF;
	IF State_cd IS NULL OR State_cd = '' THEN SET State_cd = '-2147483647';	END IF;
	IF ZIP_cd IS NULL OR ZIP_cd = '' THEN SET ZIP_cd = '-2147483647';	END IF;
	IF Phone_cd IS NULL OR Phone_cd = '' THEN SET Phone_cd = '-2147483647';	END IF;
	IF GPS_cd IS NULL OR GPS_cd = '' THEN SET GPS_cd = '-2147483647';	END IF;
	IF Resrc_tx IS NULL OR Resrc_tx = '' THEN SET Resrc_tx = '-2147483647';	END IF;
	IF Contact_tx IS NULL OR Contact_tx = '' THEN SET Contact_tx = '-2147483647';	END IF;
	IF ADD_dm IS NULL THEN SET ADD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = '-2147483647';	END IF;
	IF UPD_dm IS NULL THEN SET UPD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = '-2147483647';	END IF;
	IF DEL_dm IS NULL THEN SET DEL_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = '-2147483647';	END IF;
	#######################################################################
	-- Check Security
	#######################################################################
/*	EXECUTE	RETURN		= spSecurityCheck
		SYSTABLE	= SYSTABLE
	,	SYSRIGHT	= SYSRIGHT
	IF
	(
		RETURN	<> 0
	)
	BEGIN
		EXECUTE	STATUS		= errFailedSecurity
			Proc_nm	= Proc_nm
		,	Table_nm	= SYSTABLE
		,	Action_nm	= SYSRIGHT
		RETURN	STATUS
	END
*/
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF	Key_cd = 'PK'
	THEN
		SELECT	*
		FROM
			tvwResource_Contact
		WHERE	1=1
		AND	tvwResource_Contact.Resrc_id	= Resrc_id
		AND	tvwResource_Contact.Resrc_tp	= Resrc_tp
		AND	tvwResource_Contact.Contact_id	= Contact_id
		AND	tvwResource_Contact.Contact_tp	= Contact_tp
		AND	tvwResource_Contact.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd	= 'FK1'
	THEN
		SELECT	*
		FROM
			tvwResource_Contact
		WHERE	1=1
		AND	tvwResource_Contact.Resrc_tp	= Resrc_tp
		AND	tvwResource_Contact.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	IF	Key_cd	= 'FK2'
	THEN
		SELECT	*
		FROM
			tvwResource_Contact
		WHERE	1=1
		AND	tvwResource_Contact.Contact_tp	= Contact_tp
		AND	tvwResource_Contact.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	IF	Key_cd	= 'FK3'
	THEN
		SELECT	*
		FROM
			tvwResource_Contact
		WHERE   1=1
		AND	tvwResource_Contact.Contact_id	= Resrc_id
		AND	tvwResource_Contact.Contact_tp	= Resrc_tp
		AND	tvwResource_Contact.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	IF	Key_cd	= 'FK4'
	THEN
		SELECT	*
		FROM
			tvwResource_Contact
		WHERE   1=1
		AND	tvwResource_Contact.Contact_id	= Contact_id
		AND	tvwResource_Contact.Contact_tp	= Contact_tp
		AND	tvwResource_Contact.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	IF	Key_cd = 'AK'
	THEN
		SELECT	*
		FROM
			tvwResource_Contact
		WHERE	1=1
		AND	tvwResource_Contact.Resrc_id	= Resrc_id
		AND	tvwResource_Contact.Resrc_tp	= Resrc_tp
		AND	tvwResource_Contact.Contact_tp	= Contact_tp
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Search Key lookup
	#######################################################################
	--   NO UI SEARCH KEY(S) DEFINED FOR THIS OBJECT
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd = 'AL'
	THEN
		SELECT	*
		FROM
			tvwResource_Contact
		WHERE	1=1
		AND	(
			tvwResource_Contact.Resrc_id	= Resrc_id
		OR	Resrc_id	=  -2147483647
			)
		AND	(
			tvwResource_Contact.Resrc_tp	= Resrc_tp
		OR	Resrc_tp	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.Contact_id	=  Contact_id
		OR	Contact_id	=  -2147483647
			)
		AND	(
			tvwResource_Contact.Contact_tp	= Contact_tp
		OR	Contact_tp	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.Contact_nm	LIKE CONCAT('%', Contact_nm, '%')
		OR	Contact_nm	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.Contact_cd	LIKE CONCAT('%', Contact_cd, '%')
		OR	Contact_cd	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.Alias_nm	LIKE CONCAT('%', Alias_nm, '%')
		OR	Alias_nm	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.Address_nm	LIKE CONCAT('%', Address_nm, '%')
		OR	Address_nm	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.City_cd	LIKE CONCAT('%', City_cd, '%')
		OR	City_cd	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.State_cd	LIKE CONCAT('%', State_cd, '%')
		OR	State_cd	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.ZIP_cd	LIKE CONCAT('%', ZIP_cd, '%')
		OR	ZIP_cd	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.Phone_cd	LIKE CONCAT('%', Phone_cd, '%')
		OR	Phone_cd	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.GPS_cd	LIKE CONCAT('%', GPS_cd, '%')
		OR	GPS_cd	= '-2147483647'
			)
		AND	(
			tvwResource_Contact.Contact_tx	LIKE CONCAT('%', Contact_tx, '%')
		OR	Contact_tx	LIKE '-2147483647'
			)
		AND	(
			tvwResource_Contact.Resrc_tx	LIKE CONCAT('%', Resrc_tx, '%')
		OR	Resrc_tx	LIKE '-2147483647'
			)
 		AND	(
 			tvwResource_Contact.ADD_dm	>= ADD_dm
 		OR	ADD_dm	= '0000-00-00 00:00:00'
 		OR	ADD_dm	IS NULL
 			)
		AND	(
			tvwResource_Contact.ADD_nm	LIKE CONCAT('%', ADD_nm, '%')
		OR	ADD_nm	= '-2147483647'
			)
  		AND	(
  			tvwResource_Contact.UPD_dm	>= UPD_dm
 		OR	UPD_dm	= '0000-00-00 00:00:00'
   		OR	UPD_dm	IS NULL
  			)
 		AND	(
 			tvwResource_Contact.UPD_nm	LIKE CONCAT('%', UPD_nm, '%')
 		OR	UPD_nm	= '-2147483647'
 			)
  		AND	(
  			tvwResource_Contact.DEL_dm	IS NULL
  			)
 		AND	(
 			tvwResource_Contact.DEL_nm	IS NULL
 			)
		;
		LEAVE GFP;
	END IF;
	#######################################################################
END	GFP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure gfpUser */

/*!50003 DROP PROCEDURE IF EXISTS  gfpUser */;

DELIMITER $$

/*!50003 CREATE PROCEDURE gfpUser(
	User_id		INT SIGNED		-- PK1 
,	User_tp		VARCHAR(64)		-- PK2 AK1
,	User_nm		VARCHAR(256)		--  AK2
,	User_cd		VARCHAR(128)	
,	Hashed_cd	VARCHAR(128)
,	Person_nm	VARCHAR(256)
,	Email_nm	VARCHAR(256)
,	Challenge_cd	VARCHAR(128)
,	Response_cd	VARCHAR(128)
,	User_tx		MEDIUMTEXT	
,	UserADD_dm		DATETIME	
,	UserADD_nm		VARCHAR(256)	
,	UserUPD_dm		DATETIME	
,	UserUPD_nm		VARCHAR(256)	
,	UserDEL_dm		DATETIME	
,	UserDEL_nm		VARCHAR(256)	
,	ParentUser_tp		VARCHAR(64)	
,	UserType_tx		MEDIUMTEXT	
,	UserTypeLeft_id		INT SIGNED	
,	UserTypeRight_id		INT SIGNED	
,	UserTypeLevel_id		INT SIGNED	
,	UserTypeOrder_id		INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceUser	User name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Key_cd		VARCHAR(16)	-- Search key code
)
BEGIN
/*
**	Name:		gfpUser
**	Type:		DB API Stored Procedure: Get Filtered
**	Purpose:	To Get an active record or set of active records
**			from tvwUser
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tvwUser';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'VIEW';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'gfpUser';
DECLARE	SQL_tx	MEDIUMTEXT;
###############################################################################
GFP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'AL';	END IF;
	IF User_id IS NULL OR User_id = 0 THEN SET User_id =  -2147483647;	END IF;
	IF User_tp IS NULL OR User_tp = '' THEN SET User_tp = '-2147483647';	END IF;
	IF User_nm IS NULL OR User_nm = '' THEN SET User_nm = '-2147483647';	END IF;
	IF User_cd IS NULL OR User_cd = '' THEN SET User_cd = '-2147483647';	END IF;
	IF Hashed_cd IS NULL OR Hashed_cd = '' THEN SET Hashed_cd = '-2147483647';	END IF;
	IF Person_nm IS NULL OR Person_nm = '' THEN SET Person_nm = '-2147483647';	END IF;
	IF Email_nm IS NULL OR Email_nm = '' THEN SET Email_nm = '-2147483647';	END IF;
	IF Challenge_cd IS NULL OR Challenge_cd = '' THEN SET Challenge_cd = '-2147483647';	END IF;
	IF Response_cd IS NULL OR Response_cd = '' THEN SET Response_cd = '-2147483647';	END IF;
	IF User_tx IS NULL OR User_tx = '' THEN SET User_tx = '-2147483647';	END IF;
	IF UserADD_dm IS NULL THEN SET UserADD_dm = '0000-00-00 00:00:00';	END IF;
	IF UserADD_nm IS NULL OR UserADD_nm = '' THEN SET UserADD_nm = '-2147483647';	END IF;
	IF UserUPD_dm IS NULL THEN SET UserUPD_dm = '0000-00-00 00:00:00';	END IF;
	IF UserUPD_nm IS NULL OR UserUPD_nm = '' THEN SET UserUPD_nm = '-2147483647';	END IF;
	IF UserDEL_dm IS NULL THEN SET UserDEL_dm = '0000-00-00 00:00:00';	END IF;
	IF UserDEL_nm IS NULL OR UserDEL_nm = '' THEN SET UserDEL_nm = '-2147483647';	END IF;
	IF ParentUser_tp IS NULL OR ParentUser_tp = '' THEN SET ParentUser_tp = '-2147483647';	END IF;
	IF UserType_tx IS NULL OR UserType_tx = '' THEN SET UserType_tx = '-2147483647';	END IF;
	IF UserTypeLeft_id IS NULL OR UserTypeLeft_id = 0 THEN SET UserTypeLeft_id =  -2147483647;	END IF;
	IF UserTypeRight_id IS NULL OR UserTypeRight_id = 0 THEN SET UserTypeRight_id =  -2147483647;	END IF;
	IF UserTypeLevel_id IS NULL OR UserTypeLevel_id = 0 THEN SET UserTypeLevel_id =  -2147483647;	END IF;
	IF UserTypeOrder_id IS NULL OR UserTypeOrder_id = 0 THEN SET UserTypeOrder_id =  -2147483647;	END IF;
	#######################################################################
	-- Check Security
	#######################################################################
/*	EXECUTE	RETURN		= spSecurityCheck
		SYSTABLE	= SYSTABLE
	,	SYSRIGHT	= SYSRIGHT
	IF
	(
		RETURN	<> 0
	)
	BEGIN
		EXECUTE	STATUS		= errFailedSecurity
			Proc_nm	= Proc_nm
		,	Table_nm	= SYSTABLE
		,	Action_nm	= SYSRIGHT
		RETURN	STATUS
	END
*/
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF	Key_cd = 'PK'
	THEN
		SELECT	*
		FROM
			tvwUser
		WHERE
			tvwUser.User_id	= User_id
		AND	tvwUser.User_tp	= User_tp
		AND	tvwUser.UserDEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd	= 'FK1'
	THEN
		SELECT	*
		FROM
			tvwUser
		WHERE
			tvwUser.User_tp	= User_tp
		AND	tvwUser.UserDEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	IF	Key_cd	= 'FK2'
	THEN
		SELECT	*
		FROM
			tvwUser
		WHERE
			tvwUser.User_tp	= User_tp
		AND	tvwUser.User_id	= User_id
		AND	tvwUser.UserDEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	IF	Key_cd = 'AK'
	THEN
		SELECT	*
		FROM
			tvwUser
		WHERE
			tvwUser.User_tp	= User_tp
		AND	tvwUser.User_nm	= User_nm
		AND	tvwUser.UserDEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Search Key lookup
	#######################################################################
	--   NO UI SEARCH KEY(S) DEFINED FOR THIS OBJECT
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd = 'AL'
	THEN
		SELECT	*
		FROM
			tvwUser
		WHERE
			(
			tvwUser.User_id	=  User_id
		OR	User_id	=  -2147483647
			)
		AND	(
			tvwUser.User_tp	= User_tp
		OR	User_tp	= '-2147483647'
			)
		AND	(
			tvwUser.User_nm	LIKE CONCAT('%', User_nm, '%')
		OR	User_nm	= '-2147483647'
			)
		AND	(
			tvwUser.User_cd	LIKE CONCAT('%', User_cd, '%')
		OR	User_cd	= '-2147483647'
			)
		AND	(
			tvwUser.Hashed_cd	LIKE CONCAT('%', Hashed_cd, '%')
		OR	Hashed_cd	= '-2147483647'
			)
		AND	(
			tvwUser.Person_nm	LIKE CONCAT('%', Person_nm, '%')
		OR	Person_nm	= '-2147483647'
			)
		AND	(
			tvwUser.Email_nm	LIKE CONCAT('%', Email_nm, '%')
		OR	Email_nm	= '-2147483647'
			)
		AND	(
			tvwUser.Challenge_cd	LIKE CONCAT('%', Challenge_cd, '%')
		OR	Challenge_cd	= '-2147483647'
			)
		AND	(
			tvwUser.Response_cd	LIKE CONCAT('%', Response_cd, '%')
		OR	Response_cd	= '-2147483647'
			)
		AND	(
			tvwUser.User_tx	LIKE CONCAT('%', User_tx, '%')
		OR	User_tx	LIKE '-2147483647'
			)
 		AND	(
 			tvwUser.UserADD_dm	>= UserADD_dm
 		OR	UserADD_dm	= '0000-00-00 00:00:00'
 		OR	UserADD_dm	IS NULL
 			)
		AND	(
			tvwUser.UserADD_nm	LIKE CONCAT('%', UserADD_nm, '%')
		OR	UserADD_nm	= '-2147483647'
			)
  		AND	(
  			tvwUser.UserUPD_dm	>= UserUPD_dm
 		OR	UserUPD_dm	= '0000-00-00 00:00:00'
   		OR	UserUPD_dm	IS NULL
  			)
 		AND	(
 			tvwUser.UserUPD_nm	LIKE CONCAT('%', UserUPD_nm, '%')
 		OR	UserUPD_nm	= '-2147483647'
 			)
  		AND	(
  			tvwUser.UserDEL_dm	IS NULL
  			)
 		AND	(
 			tvwUser.UserDEL_nm	IS NULL
 			)
 		AND	(
 			tvwUser.ParentUser_tp	= ParentUser_tp
 		OR	ParentUser_tp	= '-2147483647'
 			)
 		AND	(
 			tvwUser.UserType_tx	LIKE CONCAT('%', UserType_tx, '%')
 		OR	UserType_tx	LIKE '-2147483647'
 			)
 		AND	(
 			tvwUser.UserTypeLeft_id	= UserTypeLeft_id
 		OR	UserTypeLeft_id	=  -2147483647
 			)
 		AND	(
 			tvwUser.UserTypeRight_id	= UserTypeRight_id
 		OR	UserTypeRight_id	=  -2147483647
 			)
 		AND	(
 			tvwUser.UserTypeLevel_id	= UserTypeLevel_id
 		OR	UserTypeLevel_id	=  -2147483647
 			)
 		AND	(
 			tvwUser.UserTypeOrder_id	= UserTypeOrder_id
 		OR	UserTypeOrder_id	=  -2147483647
 			)
		;
		LEAVE GFP;
	END IF;
	#######################################################################
END	GFP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure gfpUserType */

/*!50003 DROP PROCEDURE IF EXISTS  gfpUserType */;

DELIMITER $$

/*!50003 CREATE PROCEDURE gfpUserType(
	User_tp		VARCHAR(64)		-- PK1 
,	ParentUser_tp	VARCHAR(64)	
,	UserType_tx		MEDIUMTEXT	
,	UserTypeLeft_id	INT SIGNED	
,	UserTypeRight_id	INT SIGNED	
,	UserTypeLevel_id	INT SIGNED	
,	UserTypeOrder_id	INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceUser	User name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Key_cd		VARCHAR(16)	-- Search key code
)
BEGIN
/*
**	Name:		gfpUserType
**	Type:		DB API Stored Procedure: Get Filtered
**	Purpose:	To Get an active record or set of active records
**			from tvwUserType
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tvwUserType';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'VIEW';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'gfpUserType';
###############################################################################
GFP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'AL';	END IF;
	IF User_tp IS NULL OR User_tp = '' THEN SET User_tp = '-2147483647';	END IF;
	IF ParentUser_tp IS NULL OR ParentUser_tp = '' THEN SET ParentUser_tp = '-2147483647';	END IF;
	IF UserType_tx IS NULL OR UserType_tx = '' THEN SET UserType_tx = '-2147483647';	END IF;
	IF UserTypeLeft_id IS NULL OR UserTypeLeft_id = 0 THEN SET UserTypeLeft_id =  -2147483647;	END IF;
	IF UserTypeRight_id IS NULL OR UserTypeRight_id = 0 THEN SET UserTypeRight_id =  -2147483647;	END IF;
	IF UserTypeLevel_id IS NULL OR UserTypeLevel_id = 0 THEN SET UserTypeLevel_id =  -2147483647;	END IF;
	IF UserTypeOrder_id IS NULL OR UserTypeOrder_id = 0 THEN SET UserTypeOrder_id =  -2147483647;	END IF;
	#######################################################################
	-- Check Security
	#######################################################################
/*	EXECUTE	RETURN		= spSecurityCheck
		SYSTABLE	= SYSTABLE
	,	SYSRIGHT	= SYSRIGHT
	IF
	(
		RETURN	<> 0
	)
	BEGIN
		EXECUTE	STATUS		= errFailedSecurity
			Proc_nm	= Proc_nm
		,	Table_nm	= SYSTABLE
		,	Action_nm	= SYSRIGHT
		RETURN	STATUS
	END
*/
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF	Key_cd = 'PK'
	THEN
		SELECT	*
		FROM
			tvwUserType
		WHERE
			tvwUserType.User_tp	= User_tp
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd	= 'FK1'
	THEN
		SELECT	*
		FROM
			tvwUserType
		WHERE
			tvwUserType.User_tp	= User_tp
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	-- NO ALTERNATE KEY DEFINED FOR THIS OBJECT
	#######################################################################
	-- Search Key lookup
	#######################################################################
	--   NO UI SEARCH KEY(S) DEFINED FOR THIS OBJECT
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd = 'AL'
	THEN
		SELECT	*
		FROM
			tvwUserType
		WHERE
			(
			tvwUserType.User_tp	= User_tp
		OR	User_tp	= '-2147483647'
			)
		AND	(
			tvwUserType.ParentUser_tp	= ParentUser_tp
		OR	ParentUser_tp	= '-2147483647'
			)
		AND	(
			tvwUserType.UserType_tx	LIKE CONCAT('%', UserType_tx, '%')
		OR	UserType_tx	LIKE '-2147483647'
			)
		AND	(
			tvwUserType.UserTypeLeft_id	= UserTypeLeft_id
		OR	UserTypeLeft_id	=  -2147483647
			)
		AND	(
			tvwUserType.UserTypeRight_id	= UserTypeRight_id
		OR	UserTypeRight_id	=  -2147483647
			)
		AND	(
			tvwUserType.UserTypeLevel_id	= UserTypeLevel_id
		OR	UserTypeLevel_id	=  -2147483647
			)
		AND	(
			tvwUserType.UserTypeOrder_id	= UserTypeOrder_id
		OR	UserTypeOrder_id	=  -2147483647
			)
		;
		LEAVE GFP;
	END IF;
	#######################################################################
END	GFP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure gfpUser_Company */

/*!50003 DROP PROCEDURE IF EXISTS  gfpUser_Company */;

DELIMITER $$

/*!50003 CREATE PROCEDURE gfpUser_Company(
	User_id		INT SIGNED		-- PK1 
,	User_tp		VARCHAR(64)		-- PK2 AK1
,	Company_id		INT SIGNED		-- PK1 
,	Company_tp		VARCHAR(64)		-- PK2 AK1
,	User_nm		VARCHAR(256)		--  AK2
,	User_cd		VARCHAR(128)	
,	Alias_nm		VARCHAR(256)		--  AK2
,	Hashed_cd	VARCHAR(128)
,	Person_nm	VARCHAR(256)
,	Email_nm	VARCHAR(256)
,	Challenge_cd	VARCHAR(128)
,	Response_cd	VARCHAR(128)
,	Company_nm		VARCHAR(256)		--  AK2
,	Company_cd		VARCHAR(128)	
,	User_tx	MEDIUMTEXT
,	Company_tx		MEDIUMTEXT	
,	ADD_dm		DATETIME	
,	ADD_nm		VARCHAR(256)	
,	UPD_dm		DATETIME	
,	UPD_nm		VARCHAR(256)	
,	DEL_dm		DATETIME	
,	DEL_nm		VARCHAR(256)	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceCompany	Company name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Key_cd		VARCHAR(16)	-- Search key code
)
BEGIN
/*
**	Name:		gfpUser_Company
**	Type:		DB API Stored Procedure: Get Filtered
**	Purpose:	To Get an active record or set of active records
**			from tvwUser_Company
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tvwUser_Company';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'VIEW';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'gfpUser_Company';
DECLARE	SQL_tx	MEDIUMTEXT;
###############################################################################
GFP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'AL';	END IF;
	IF User_id IS NULL OR User_id = 0 THEN SET User_id =  -2147483647;	END IF;
	IF User_tp IS NULL OR User_tp = '' THEN SET User_tp = '-2147483647';	END IF;
	IF Company_id IS NULL OR Company_id = 0 THEN SET Company_id =  -2147483647;	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = '-2147483647';	END IF;
	IF User_nm IS NULL OR User_nm = '' THEN SET User_nm = '-2147483647';	END IF;
	IF User_cd IS NULL OR User_cd = '' THEN SET User_cd = '-2147483647';	END IF;
	IF Hashed_cd IS NULL OR Hashed_cd = '' THEN SET Hashed_cd = '-2147483647';	END IF;
	IF Person_nm IS NULL OR Person_nm = '' THEN SET Person_nm = '-2147483647';	END IF;
	IF Alias_nm IS NULL OR Alias_nm = '' THEN SET Alias_nm = '-2147483647';	END IF;
	IF Email_nm IS NULL OR Email_nm = '' THEN SET User_cd = '-2147483647';	END IF;
	IF Challenge_cd IS NULL OR Challenge_cd = '' THEN SET Challenge_cd = '-2147483647';	END IF;
	IF Response_cd IS NULL OR Response_cd = '' THEN SET Response_cd = '-2147483647';	END IF;
	IF Company_nm IS NULL OR Company_nm = '' THEN SET Company_nm = '-2147483647';	END IF;
	IF Company_cd IS NULL OR Company_cd = '' THEN SET Company_cd = '-2147483647';	END IF;
	IF User_tx IS NULL OR User_tx = '' THEN SET User_tx = '-2147483647';	END IF;
	IF Company_tx IS NULL OR Company_tx = '' THEN SET Company_tx = '-2147483647';	END IF;
	IF ADD_dm IS NULL THEN SET ADD_dm = '0000-00-00 00:00:00';	END IF;
	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = '-2147483647';	END IF;
	IF UPD_dm IS NULL THEN SET UPD_dm = '0000-00-00 00:00:00';	END IF;
	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = '-2147483647';	END IF;
	IF DEL_dm IS NULL THEN SET DEL_dm = '0000-00-00 00:00:00';	END IF;
	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = '-2147483647';	END IF;
	#######################################################################
	-- Check Security
	#######################################################################
/*	EXECUTE	RETURN		= spSecurityCheck
		SYSTABLE	= SYSTABLE
	,	SYSRIGHT	= SYSRIGHT
	IF
	(
		RETURN	<> 0
	)
	BEGIN
		EXECUTE	STATUS		= errFailedSecurity
			Proc_nm	= Proc_nm
		,	Table_nm	= SYSTABLE
		,	Action_nm	= SYSRIGHT
		RETURN	STATUS
	END
*/
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF	Key_cd = 'PK'
	THEN
		SELECT	*
		FROM
			tvwUser_Company
		WHERE	1=1
		AND	tvwUser_Company.User_id	= User_id
		AND	tvwUser_Company.User_tp	= User_tp
		AND	tvwUser_Company.Company_id	= Company_id
		AND	tvwUser_Company.Company_tp	= Company_tp
		AND	tvwUser_Company.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd	= 'FK1'
	THEN
		SELECT	*
		FROM
			tvwUser_Company
		WHERE	1=1
		AND	tvwUser_Company.User_tp	= User_tp
		AND	tvwUser_Company.Company_tp	= Company_tp
		AND	tvwUser_Company.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	IF	Key_cd	= 'FK2'
	THEN
		SELECT	*
		FROM
			tvwUser_Company
		WHERE	1=1
		AND	tvwUser_Company.User_id	= User_id
		AND	tvwUser_Company.User_tp	= User_tp
		AND	tvwUser_Company.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	IF	Key_cd	= 'FK3'
	THEN
		SELECT	*
		FROM
			tvwUser_Company
		WHERE   1=1
		AND	tvwUser_Company.Company_id	= Company_id
		AND	tvwUser_Company.Company_tp	= Company_tp
		AND	tvwUser_Company.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	IF	Key_cd = 'AK'
	THEN
		SELECT	*
		FROM
			tvwUser_Company
		WHERE	1=1
		AND	tvwUser_Company.User_tp	= User_tp
		AND	tvwUser_Company.User_nm	= User_nm
		AND	tvwUser_Company.Company_tp	= Company_tp
		AND	tvwUser_Company.Company_nm	= Company_nm
		AND	tvwUser_Company.DEL_dm	IS NULL
		;
		LEAVE GFP;
	END IF;
	#######################################################################
	-- Search Key lookup
	#######################################################################
	--   NO UI SEARCH KEY(S) DEFINED FOR THIS OBJECT
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd = 'AL'
	THEN
		SELECT	*
		FROM
			tvwUser_Company
		WHERE	1=1
		AND	(
			tvwUser_Company.User_id	= User_id
		OR	User_id	=  -2147483647
			)
		AND	(
			tvwUser_Company.User_tp	= User_tp
		OR	User_tp	= '-2147483647'
			)
		AND	(
			tvwUser_Company.Company_id	=  Company_id
		OR	Company_id	=  -2147483647
			)
		AND	(
			tvwUser_Company.Company_tp	= Company_tp
		OR	Company_tp	= '-2147483647'
			)
		AND	(
			tvwUser_Company.User_nm	LIKE CONCAT('%', User_nm, '%')
		OR	User_nm	= '-2147483647'
			)
		AND	(
			tvwUser_Company.User_cd	LIKE CONCAT('%', User_cd, '%')
		OR	User_cd	= '-2147483647'
			)
		AND	(
			tvwUser_Company.Hashed_cd	= Hashed_cd
		OR	Hashed_cd	= '-2147483647'
			)
		AND	(
			tvwUser_Company.Person_nm	LIKE CONCAT('%', Person_nm, '%')
		OR	Person_nm	= '-2147483647'
			)
		AND	(
			tvwUser_Company.Email_nm	LIKE CONCAT('%', Email_nm, '%')
		OR	Email_nm	= '-2147483647'
			)
		AND	(
			tvwUser_Company.Challenge_cd	LIKE CONCAT('%', Challenge_cd, '%')
		OR	Challenge_cd	= '-2147483647'
			)
		AND	(
			tvwUser_Company.Response_cd	LIKE CONCAT('%', Response_cd, '%')
		OR	Response_cd	= '-2147483647'
			)
		AND	(
			tvwUser_Company.Alias_nm	LIKE CONCAT('%', Alias_nm, '%')
		OR	Alias_nm	= '-2147483647'
			)
		AND	(
			tvwUser_Company.Company_nm	LIKE CONCAT('%', Company_nm, '%')
		OR	Company_nm	= '-2147483647'
			)
		AND	(
			tvwUser_Company.Company_cd	LIKE CONCAT('%', Company_cd, '%')
		OR	Company_cd	= '-2147483647'
			)
		AND	(
			tvwUser_Company.User_tx	LIKE CONCAT('%', User_tx, '%')
		OR	User_tx	= '-2147483647'
			)
		AND	(
			tvwUser_Company.Company_tx	LIKE CONCAT('%', Company_tx, '%')
		OR	Company_tx	LIKE '-2147483647'
			)
 		AND	(
 			tvwUser_Company.ADD_dm	>= ADD_dm
 		OR	ADD_dm	= '0000-00-00 00:00:00'
 		OR	ADD_dm	IS NULL
 			)
		AND	(
			tvwUser_Company.ADD_nm	LIKE CONCAT('%', ADD_nm, '%')
		OR	ADD_nm	= '-2147483647'
			)
  		AND	(
  			tvwUser_Company.UPD_dm	>= UPD_dm
 		OR	UPD_dm	= '0000-00-00 00:00:00'
   		OR	UPD_dm	IS NULL
  			)
 		AND	(
 			tvwUser_Company.UPD_nm	LIKE CONCAT('%', UPD_nm, '%')
 		OR	UPD_nm	= '-2147483647'
 			)
 
 		AND	(
 			tvwUser_Company.DEL_nm	IS NULL
 			)
		;
		LEAVE GFP;
	END IF;
	#######################################################################
END	GFP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure ispCompany */

/*!50003 DROP PROCEDURE IF EXISTS  ispCompany */;

DELIMITER $$

/*!50003 CREATE PROCEDURE ispCompany(
INOUT	Company_id		INT SIGNED		-- PK1 
,	Company_tp		VARCHAR(64)		-- PK2 AK1
,	Company_nm		VARCHAR(256)		--  AK2
,	Company_cd		VARCHAR(128)	
,	Company_tx		MEDIUMTEXT	
,	CompanyADD_dm		DATETIME	
,	CompanyADD_nm		VARCHAR(256)	
,	CompanyUPD_dm		DATETIME	
,	CompanyUPD_nm		VARCHAR(256)	
,	CompanyDEL_dm		DATETIME	
,	CompanyDEL_nm		VARCHAR(256)	
,	ParentCompany_tp		VARCHAR(64)	
,	CompanyType_tx		MEDIUMTEXT	
,	CompanyTypeLeft_id		INT SIGNED	
,	CompanyTypeRight_id		INT SIGNED	
,	CompanyTypeLevel_id		INT SIGNED	
,	CompanyTypeOrder_id		INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceCompany	Company name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		ispCompany
**	Type:		DB API procedure: Insert
**	Purpose:	To insert Company data into tblCompany
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	6/14/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblCompany';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'INSERT';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'ispCompany';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
DECLARE	FK1		VARCHAR(255) DEFAULT CONCAT(Company_tp);
DECLARE	FK2		VARCHAR(255) DEFAULT CONCAT(Company_id,",",Company_tp);
###############################################################################
ISP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	IF Company_id = '0' OR Company_id = 0 THEN SET Company_id =  NULL;	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = NULL;	END IF;
	IF Company_nm IS NULL OR Company_nm = '' THEN SET Company_nm = NULL;	END IF;
	IF Company_cd IS NULL OR Company_cd = '' THEN SET Company_cd = NULL;	END IF;
	IF Company_tx IS NULL OR Company_tx = '' THEN SET Company_tx = NULL;	END IF;
	IF CompanyADD_dm IS NULL THEN SET CompanyADD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF CompanyADD_nm IS NULL OR CompanyADD_nm = '' THEN SET CompanyADD_nm = NULL;	END IF;
	IF CompanyUPD_dm IS NULL THEN SET CompanyUPD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF CompanyUPD_nm IS NULL OR CompanyUPD_nm = '' THEN SET CompanyUPD_nm = NULL;	END IF;
	IF CompanyDEL_dm IS NULL THEN SET CompanyDEL_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF CompanyDEL_nm IS NULL OR CompanyDEL_nm = '' THEN SET CompanyDEL_nm = NULL;	END IF;
	IF ParentCompany_tp IS NULL OR ParentCompany_tp = '' THEN SET ParentCompany_tp = NULL;	END IF;
	IF CompanyType_tx IS NULL OR CompanyType_tx = '' THEN SET CompanyType_tx = NULL;	END IF;
	IF CompanyTypeLeft_id = '0' OR CompanyTypeLeft_id = 0 THEN SET CompanyTypeLeft_id = NULL;	END IF;
	IF CompanyTypeRight_id = '0' OR CompanyTypeRight_id = 0 THEN SET CompanyTypeRight_id = NULL;	END IF;
	IF CompanyTypeLevel_id = '0' OR CompanyTypeLevel_id = 0 THEN SET CompanyTypeLevel_id = NULL;	END IF;
	IF CompanyTypeOrder_id = '0' OR CompanyTypeOrder_id = 0 THEN SET CompanyTypeOrder_id = NULL;	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
	CALL	rspCompany
	(
		@Company_id	:= Company_id
	,	@Company_tp	:= Company_tp
	,	@Company_nm	:= Company_nm
	,	@Company_cd	:= Company_cd
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 1	-- If PK exists then return without error
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				Company_id
			,	Company_tp
			,	Company_nm
			;
		END IF;
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################
	SELECT
		tvwCompany.Company_id
	,	tvwCompany.Company_tp
	INTO
		Company_id
	,	Company_tp
	FROM
		tvwCompany
	WHERE
		tvwCompany.Company_tp	= Company_tp
	AND	tvwCompany.Company_nm	= Company_nm
	;
	IF
		FOUND_ROWS()	> 0
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				Company_id
			,	Company_tp
			,	Company_nm
			;
		END IF;
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Validate attributes
	#######################################################################
	CALL	vspCompany
	(
		@Company_id	:= Company_id
	,	@Company_tp	:= Company_tp
	,	@Company_nm	:= Company_nm
	,	@Company_cd	:= Company_cd
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= Proc_nm
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET	@FK1	= CONCAT(Company_tp);
	SET	@FK2	= CONCAT(Company_id,",",Company_tp);
	-- --------------------------------------------------------------------
	IF
		Mode_cd	= 'R'
	THEN
		--
		--	RESTRICT MODE:	tblCompanyType
		--
		CALL	rspCompanyType
		(
			@Company_tp	:= Company_tp
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblCompanyType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= 'tblCompanyType'
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= 'tblCompanyType'
			);
			LEAVE	ISP;
		END IF;
		--
		--	RESTRICT MODE:	tblResource
		--
		CALL	rspResource
		(
			@Resrc_id	:= Company_id
		,	@Resrc_tp	:= Company_tp
		,	@Resrc_tx	:= Company_tx
		,	@ADD_dm		:= CompanyADD_dm
		,	@ADD_nm		:= CompanyADD_nm
		,	@UPD_dm		:= CompanyUPD_dm
		,	@UPD_nm		:= CompanyUPD_nm
		,	@DEL_dm		:= CompanyDEL_dm
		,	@DEL_nm		:= CompanyDEL_nm
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblCompanyType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= 'tblResource'
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK2
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= 'tblResource'
			);
			LEAVE	ISP;
		END IF;
	END IF;
	-- --------------------------------------------------------------------
	-- --------------------------------------------------------------------
	IF
		Mode_cd	= 'C'
	THEN
		--
		--	CASCADE MODE:	tblCompanyType
		--
		CALL	ispCompanyType
		(
			@Company_tp		:= Company_tp
		,	@ParentCompany_tp	:= ParentCompany_tp
		,	@CompanyType_tx		:= CompanyType_tx
		,	@CompanyTypeLeft_id	:= CompanyTypeLeft_id
		,	@CompanyTypeRight_id	:= CompanyTypeRight_id
		,	@CompanyTypeLevel_id	:= CompanyTypeLevel_id
		,	@CompanyTypeOrder_id	:= CompanyTypeOrder_id
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= 'R'	-- This Table Is Restricted and Does Not Allow A Cascade From an FK Table.
		);
		--
		--	CASCADE MODE:	tblResource
		--
		SET	@Resrc_id	= Company_id;
		CALL	ispResource
		(
			@Resrc_id
		,	@Resrc_tp	:= Company_tp
		,	@Resrc_tx	:= Company_tx
		,	@ADD_dm		:= CompanyADD_dm
		,	@ADD_nm		:= CompanyADD_nm
		,	@UPD_dm		:= CompanyUPD_dm
		,	@UPD_nm		:= CompanyUPD_nm
		,	@DEL_dm		:= CompanyDEL_dm
		,	@DEL_nm		:= CompanyDEL_nm
		,	@ParentResrc_tp	:= ParentCompany_tp
		,	@ResrcType_tx	:= CompanyType_tx
		,	@Left_id	:= CompanyTypeLeft_id
		,	@Right_id	:= CompanyTypeRight_id
		,	@Level_id	:= CompanyTypeLevel_id
		,	@Order_id	:= CompanyTypeOrder_id
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		);
	END IF;
	#######################################################################
	-- Insert values
	#######################################################################
	--	Set the proc IN parameters to the parent ISP INOUT parameters
	SET Company_id	= @Resrc_id;
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedEvent
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
	INSERT
	INTO	tblCompany
	(
		Company_id
	,	Company_tp
	,	Company_nm
	,	Company_cd
	)
	VALUES
	(
		Company_id
	,	Company_tp
	,	Company_nm
	,	Company_cd
	);
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
	-- Return the Primary Key to the front-end if this procedure
	-- was not called from another API stored procedure.
	#######################################################################
 	IF
 		CallingProc_nm	IS NULL OR CallingProc_nm = ''
 	THEN
		SELECT
			Company_id
		,	Company_tp
		,	Company_nm
 		;
 	END IF;
	#######################################################################
END ISP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure ispCompanyType */

/*!50003 DROP PROCEDURE IF EXISTS  ispCompanyType */;

DELIMITER $$

/*!50003 CREATE PROCEDURE ispCompanyType(
	Company_tp		VARCHAR(64)		-- PK1 
,	ParentCompany_tp		VARCHAR(64)	
,	CompanyType_tx		MEDIUMTEXT	
,	CompanyTypeLeft_id		INT SIGNED	
,	CompanyTypeRight_id		INT SIGNED	
,	CompanyTypeLevel_id		INT SIGNED	
,	CompanyTypeOrder_id		INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceCompany	Company name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		ispCompanyType
**	Type:		DB API procedure: Insert
**	Purpose:	To insert CompanyType data into tblCompanyType
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	6/14/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblCompanyType';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'INSERT';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'ispCompanyType';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
DECLARE	FK1		VARCHAR(255) DEFAULT CONCAT(Company_tp);
###############################################################################
ISP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
	CALL	rspCompanyType
	(
		@Company_tp	:= Company_tp
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 1	-- If PK exists then return without error
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				Company_tp
			;
		END IF;
		LEAVE	ISP;
	END IF;
	IF
		CallingProc_nm	= "ispCompany"
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFKNotExist
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		,	@Key_nm		:= FK1
		);
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################
	#######################################################################
	-- Validate attributes
	#######################################################################
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	--
	--	RESTRICT MODE:	tblResourceType
	--
	IF
		@Mode_cd	= 'R'
	THEN
		CALL	rspResourceType
		(
			@Resrc_tp	:= Company_tp
		,	@ParentResrc_tp	:= ParentCompany_tp
		,	@ResrcType_tx	:= CompanyType_tx
		,	@Left_id	:= CompanyTypeLeft_id
		,	@Right_id	:= CompanyTypeRight_id
		,	@Level_id	:= CompanyTypeLevel_id
		,	@Order_id	:= CompanyTypeOrder_id
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblResourceType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= 'tblResourceType'
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= 'tblResourceType'
			);
			LEAVE	ISP;
		END IF;
	END IF;
	--
	--	CASCADE MODE:	tblResourceType
	--
	IF
		@Mode_cd	= 'C'
	THEN
		CALL	ispResourceType
		(
			@Resrc_tp	:= Company_tp
		,	@ParentResrc_tp	:= ParentCompany_tp
		,	@ResrcType_tx	:= CompanyType_tx
		,	@Left_id	:= CompanyTypeLeft_id
		,	@Right_id	:= CompanyTypeRight_id
		,	@Level_id	:= CompanyTypeLevel_id
		,	@Order_id	:= CompanyTypeOrder_id
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= 'R'	-- This Table Is Restricted and Does Not Allow A Cascade From an FK Table.
		);
	END IF;
	#######################################################################
	-- Insert values
	#######################################################################
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCompany
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
	INSERT
	INTO	tblCompanyType
	(
		Company_tp
	)
	VALUES
	(
		Company_tp
	);
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
	-- Return the Primary Key to the front-end if this procedure
	-- was not called from another API stored procedure.
	#######################################################################
 	IF
 		CallingProc_nm	IS NULL OR CallingProc_nm = ''
 	THEN
		SELECT
			@Company_tp	AS Company_tp
 		;
 	END IF;
	#######################################################################
END	ISP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure ispContactType */

/*!50003 DROP PROCEDURE IF EXISTS  ispContactType */;

DELIMITER $$

/*!50003 CREATE PROCEDURE ispContactType(
	Contact_tp		VARCHAR(64)		-- PK1 
,	ParentContact_tp		VARCHAR(64)	
,	ContactType_tx		MEDIUMTEXT	
,	ContactTypeLeft_id		INT SIGNED	
,	ContactTypeRight_id		INT SIGNED	
,	ContactTypeLevel_id		INT SIGNED	
,	ContactTypeOrder_id		INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceContact	Contact name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		ispContactType
**	Type:		DB API procedure: Insert
**	Purpose:	To insert ContactType data into tblContactType
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	6/14/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblContactType';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'INSERT';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'ispContactType';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
DECLARE	FK1		VARCHAR(255) DEFAULT CONCAT(Contact_tp);
###############################################################################
ISP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
	CALL	rspContactType
	(
		@Contact_tp	:= Contact_tp
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 1	-- If PK exists then return without error
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				Contact_tp
			;
		END IF;
		LEAVE	ISP;
	END IF;
	IF
		CallingProc_nm	= "ispResource_Contact"
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFKNotExist
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		,	@Key_nm		:= FK1
		);
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################
	#######################################################################
	-- Validate attributes
	#######################################################################
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	--
	--	RESTRICT MODE:	tblResourceType
	--
	IF
		@Mode_cd	= 'R'
	THEN
		SET 	@TABLE	= "tblResourceType";
		CALL	rspResourceType
		(
			@Resrc_tp	:= Contact_tp
		,	@ParentResrc_tp	:= ParentContact_tp
		,	@ResrcType_tx	:= ContactType_tx
		,	@Left_id	:= ContactTypeLeft_id
		,	@Right_id	:= ContactTypeRight_id
		,	@Level_id	:= ContactTypeLevel_id
		,	@Order_id	:= ContactTypeOrder_id
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblResourceType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	ISP;
		END IF;
	END IF;
	--
	--	CASCADE MODE:	tblResourceType
	--
	IF
		@Mode_cd	= 'C'
	THEN
		CALL	ispResourceType
		(
			@Resrc_tp	:= Contact_tp
		,	@ParentResrc_tp	:= ParentContact_tp
		,	@ResrcType_tx	:= ContactType_tx
		,	@Left_id	:= ContactTypeLeft_id
		,	@Right_id	:= ContactTypeRight_id
		,	@Level_id	:= ContactTypeLevel_id
		,	@Order_id	:= ContactTypeOrder_id
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= 'R'	-- This Table Is Restricted and Does Not Allow A Cascade From an FK Table.
		);
	END IF;
	#######################################################################
	-- Insert values
	#######################################################################
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedContact
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
	INSERT
	INTO	tblContactType
	(
		Contact_tp
	)
	VALUES
	(
		Contact_tp
	);
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
	-- Return the Primary Key to the front-end if this procedure
	-- was not called from another API stored procedure.
	#######################################################################
 	IF
 		CallingProc_nm	IS NULL OR CallingProc_nm = ''
 	THEN
		SELECT
			@Contact_tp	AS Contact_tp
 		;
 	END IF;
	#######################################################################
END	ISP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure ispResource */

/*!50003 DROP PROCEDURE IF EXISTS  ispResource */;

DELIMITER $$

/*!50003 CREATE PROCEDURE ispResource(
INOUT	Resrc_id		INT SIGNED		-- PK1 
,	Resrc_tp		VARCHAR(64)		-- PK2 AK1
,	Resrc_tx		MEDIUMTEXT	
,	ADD_dm		DATETIME	
,	ADD_nm		VARCHAR(128)	
,	UPD_dm		DATETIME	
,	UPD_nm		VARCHAR(128)	
,	DEL_dm		DATETIME	
,	DEL_nm		VARCHAR(128)	
,	ParentResrc_tp		VARCHAR(64)	
,	ResrcType_tx		MEDIUMTEXT	
,	Left_id		INT SIGNED	
,	Right_id		INT SIGNED	
,	Level_id		INT SIGNED	
,	Order_id		INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		ispResource
**	Type:		DB API procedure: Insert
**	Purpose:	To insert Resource data into tblResource
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	4/12/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResource';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'INSERT';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'ispResource';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
ISP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF CallingProc_nm IS NULL OR CallingProc_nm = '' THEN SET CallingProc_nm = '';	END IF;
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= 'tblResource'
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
	CALL	rspResource
	(
		@Resrc_id	:= Resrc_id
	,	@Resrc_tp	:= Resrc_tp
	,	@Resrc_tx	:= Resrc_tx
	,	@ADD_dm	:= ADD_dm
	,	@ADD_nm	:= ADD_nm
	,	@UPD_dm	:= UPD_dm
	,	@UPD_nm	:= UPD_nm
	,	@DEL_dm	:= DEL_dm
	,	@DEL_nm	:= DEL_nm
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 1	-- If PK exists then return without error
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				Resrc_id
			,	Resrc_tp
			;
		END IF;
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################
	#######################################################################
	-- Validate attributes
	#######################################################################
	SET 	@ADD_dm	= ADD_dm;
	SET 	@ADD_nm	= ADD_nm;
	SET 	@UPD_dm	= UPD_dm;
	SET 	@UPD_nm	= UPD_nm;
	SET 	@DEL_dm	= DEL_dm;
	SET 	@DEL_nm	= DEL_nm;
	CALL	vspResource
	(
		@Resrc_id	:= Resrc_id
	,	@Resrc_tp	:= Resrc_tp
	,	@Resrc_tx	:= Resrc_tx
	,	@ADD_dm
	,	@ADD_nm
	,	@UPD_dm
	,	@UPD_nm
	,	@DEL_dm
	,	@DEL_nm
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= 'vspResource'
		);
		LEAVE	ISP;
	END IF;
	SET 	ADD_dm	= @ADD_dm;
	SET 	ADD_nm	= @ADD_nm;
	SET 	UPD_dm	= @UPD_dm;
	SET 	UPD_nm	= @UPD_nm;
	SET 	DEL_dm	= @DEL_dm;
	SET 	DEL_nm	= @DEL_nm;
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	--
	--	RESTRICT MODE:	tblResourceType
	--
	IF
		Mode_cd	= 'R'
	THEN
		CALL	rspResourceType
		(
			@Resrc_tp	:= Resrc_tp
		,	@ParentResrc_tp	:= ParentResrc_tp
		,	@ResrcType_tx	:= ResrcType_tx
		,	@Left_id	:= Left_id
		,	@Right_id	:= Right_id
		,	@Level_id	:= Level_id
		,	@Order_id	:= Order_id
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblResourceType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= SYSTABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= 'Resrc_tp'
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= 'tblResourceType'
			);
			LEAVE	ISP;
		END IF;
	END IF;
	--
	--	CASCADE MODE:	tblResourceType
	--
	IF
		Mode_cd	= 'C'
	THEN
		CALL	ispResourceType
		(
			@Resrc_tp	:= Resrc_tp
		,	@ParentResrc_tp	:= ParentResrc_tp
		,	@ResrcType_tx	:= ResrcType_tx
		,	@Left_id	:= Left_id
		,	@Right_id	:= Right_id
		,	@Level_id	:= Level_id
		,	@Order_id	:= Order_id
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= 'R'	-- This Table Is Restricted and Does Not Allow A Cascade From an FK Table.
		);
	END IF;
	#######################################################################
	-- Insert values
	#######################################################################
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedEvent
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
	INSERT
	INTO	tblResource
	(
		Resrc_tp
	,	Resrc_tx
	,	ADD_dm
	,	ADD_nm
	,	UPD_dm
	,	UPD_nm
	,	DEL_dm
	,	DEL_nm
	)
	VALUES
	(
		Resrc_tp
	,	Resrc_tx
	,	ADD_dm
	,	ADD_nm
	,	UPD_dm
	,	UPD_nm
	,	DEL_dm
	,	DEL_nm
	);
	SET Resrc_id	= LAST_INSERT_ID();
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
	-- Return the Primary Key to the front-end if this procedure
	-- was not called from another API stored procedure.
	#######################################################################
 	IF
 		CallingProc_nm	IS NULL OR CallingProc_nm = ''
 	THEN
		SELECT
			Resrc_id
		,	Resrc_tp
 		;
 	END IF;
	#######################################################################
END ISP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure ispResourceType */

/*!50003 DROP PROCEDURE IF EXISTS  ispResourceType */;

DELIMITER $$

/*!50003 CREATE PROCEDURE ispResourceType(
	Resrc_tp		VARCHAR(80)		-- PK1 AK1
,	ParentResrc_tp		VARCHAR(80)	
,	ResrcType_tx		MEDIUMTEXT	
,	Left_id		INT SIGNED	
,	Right_id		INT SIGNED	
,	Level_id		INT SIGNED	
,	Order_id		INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd	VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		ispResourceType
**	Type:		DB API procedure: Insert
**	Purpose:	To insert ResourceType data into tblResourceType
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	4/9/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResourceType';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'INSERT';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'ispResourceType';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
ISP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	IF ParentResrc_tp IS NULL OR ParentResrc_tp = '' THEN SET ParentResrc_tp = 'RESOURCE';	END IF;
	IF Left_id IS NULL OR Left_id = 0 THEN SET Left_id =  -1;	END IF;
	IF Right_id IS NULL OR Right_id = 0 THEN SET Right_id =  -1;	END IF;
	IF Level_id IS NULL OR Level_id = 0 THEN SET Level_id =  -1;	END IF;
	IF Order_id IS NULL OR Order_id = 0 THEN SET Order_id =  -1;	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
	CALL	rspResourceType
	(
		@Resrc_tp	:= Resrc_tp
	,	@ParentResrc_tp	:= ParentResrc_tp
	,	@ResrcType_tx	:= ResrcType_tx
	,	@Left_id	:= Left_id
	,	@Right_id	:= Right_id
	,	@Level_id	:= Level_id
	,	@Order_id	:= Order_id
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 1	-- If PK exists then return without error
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				Resrc_tp
			;
		END IF;
		LEAVE ISP;
	END IF;
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################
	SELECT
		tvwResourceType.Resrc_tp
	INTO
		Resrc_tp
	FROM
		tvwResourceType
	WHERE
		tvwResourceType.Resrc_tp	= Resrc_tp
	;
	IF
		FOUND_ROWS()	> 0
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				Resrc_tp
			;
		END IF;
		LEAVE ISP;
	END IF;
	#######################################################################
	-- Validate attributes
	#######################################################################
	CALL	vspResourceType
	(
		@Resrc_tp	:= Resrc_tp
	,	@ParentResrc_tp	:= ParentResrc_tp
	,	@ResrcType_tx	:= ResrcType_tx
	,	@Left_id	:= Left_id
	,	@Right_id	:= Right_id
	,	@Level_id	:= Level_id
	,	@Order_id	:= Order_id
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= 'vspResourceType'
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET	@FK1	= CONCAT(ParentResrc_tp);
	-- --------------------------------------------------------------------
	--
	--	RESTRICT MODE:	tblResourceType
	--
	IF
		Mode_cd	= 'R'
	THEN
		CALL	rspResourceType
		(
			@Resrc_tp	:= ParentResrc_tp
		,	@ParentResrc_tp	:= ParentResrc_tp
		,	@ResrcType_tx	:= ResrcType_tx
		,	@Left_id	:= Left_id
		,	@Right_id	:= Right_id
		,	@Level_id	:= Level_id
		,	@Order_id	:= Order_id
		,	@Key_cd		:= @Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblResourceType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= SYSTABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= SYSTABLE
			);
			LEAVE	ISP;
		END IF;
	END IF;
	--
	--	CASCADE MODE:	tblResourceType
	--
	IF
	(
		Mode_cd	= 'C'
	AND	ParentResrc_tp	IS NOT NULL
	)
	THEN
		CALL	rspResourceType
		(
			@Resrc_tp	:= ParentResrc_tp
		,	@ParentResrc_tp	:= ParentResrc_tp
		,	@ResrcType_tx	:= ResrcType_tx
		,	@Left_id	:= Left_id
		,	@Right_id	:= Right_id
		,	@Level_id	:= Level_id
		,	@Order_id	:= Order_id
		,	@Key_cd		:= @Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblResourceType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= SYSTABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= SYSTABLE
			);
			LEAVE	ISP;
		END IF;
	END IF;
	#######################################################################
	-- Insert values
	#######################################################################
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedEvent
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
	INSERT
	INTO	tblResourceType
	(
		Resrc_tp
	,	ParentResrc_tp
	,	ResrcType_tx
	,	Left_id
	,	Right_id
	,	Level_id
	,	Order_id
	)
	VALUES
	(
		Resrc_tp
	,	ParentResrc_tp
	,	ResrcType_tx
	,	Left_id
	,	Right_id
	,	Level_id
	,	Order_id
	);
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
	-- Return the Primary Key to the front-end if this procedure
	-- was not called from another API stored procedure.
	#######################################################################
 	IF
 		CallingProc_nm	IS NULL OR CallingProc_nm = ''
 	THEN
		SELECT
			@Resrc_tp	AS Resrc_tp
 		;
 	END IF;
	#######################################################################
END ISP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure ispResource_Company */

/*!50003 DROP PROCEDURE IF EXISTS  ispResource_Company */;

DELIMITER $$

/*!50003 CREATE PROCEDURE ispResource_Company(
INOUT	Resrc_id	INT SIGNED		-- PK1 
,	Resrc_tp	VARCHAR(64)		-- PK2 AK1
,INOUT	Company_id	INT SIGNED		-- PK1 
,	Company_tp	VARCHAR(64)		-- PK2 AK1
,	Resrc_nm	VARCHAR(256)		--  AK2
,	Resrc_cd	VARCHAR(128)	
,	Alias_nm	VARCHAR(256)
,	Company_nm	VARCHAR(256)
,	Company_cd	VARCHAR(128)	
,	Resrc_tx	MEDIUMTEXT	
,	Company_tx	MEDIUMTEXT	
,	ADD_dm		DATETIME	
,	ADD_nm		VARCHAR(128)	
,	UPD_dm		DATETIME	
,	UPD_nm		VARCHAR(128)	
,	DEL_dm		DATETIME	
,	DEL_nm		VARCHAR(128)	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		ispResource_Company
**	Type:		DB API procedure: Insert
**	Purpose:	To insert Resource data into tblResource_Company
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	4/12/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResource_Company';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'INSERT';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'ispResource_Company';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
DECLARE	FK1		VARCHAR(255) DEFAULT CONCAT(Resrc_tp,",",Company_tp);
DECLARE	FK2		VARCHAR(255) DEFAULT CONCAT(Resrc_id,",",Resrc_tp);
DECLARE	FK3		VARCHAR(255) DEFAULT CONCAT(Company_id,",",Company_tp);
DECLARE	AK1		VARCHAR(255) DEFAULT CONCAT(Resrc_tp,",",Company_id,",",Company_tp,",",Resrc_nm);
DECLARE	AK2		VARCHAR(255) DEFAULT CONCAT(Resrc_tp,",",Company_tp,",",Company_nm,",",Resrc_nm);
###############################################################################
ISP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF CallingProc_nm IS NULL OR CallingProc_nm = '' THEN SET CallingProc_nm = '';	END IF;
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	IF Resrc_id = '0' OR Resrc_id = 0 THEN SET Resrc_id =  NULL;	END IF;
	IF Resrc_tp IS NULL OR Resrc_tp = '' THEN SET Resrc_tp = NULL;	END IF;
	IF Company_id = '0' OR Company_id = 0 THEN SET Company_id =  NULL;	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = NULL;	END IF;
	IF Resrc_nm IS NULL OR Resrc_nm = '' THEN SET Resrc_nm = NULL;	END IF;
	IF Resrc_cd IS NULL OR Resrc_cd = '' THEN SET Resrc_cd = NULL;	END IF;
	IF Alias_nm IS NULL OR Alias_nm = '' THEN SET Alias_nm = NULL;	END IF;
	IF Company_nm IS NULL OR Company_nm = '' THEN SET Company_nm = NULL;	END IF;
	IF Company_cd IS NULL OR Company_cd = '' THEN SET Company_cd = NULL;	END IF;
	IF Resrc_tx IS NULL OR Resrc_tx = '' THEN SET Resrc_tx = NULL;	END IF;
	IF Company_tx IS NULL OR Company_tx = '' THEN SET Company_tx = NULL;	END IF;
-- 	IF ADD_dm IS NULL THEN SET ADD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
 	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = NULL;	END IF;
-- 	IF UPD_dm IS NULL THEN SET UPD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
 	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = NULL;	END IF;
-- 	IF DEL_dm IS NULL THEN SET DEL_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
 	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = NULL;	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= 'tblResource_Company'
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
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
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 1	-- If PK exists then return without error
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				Resrc_id
			,	Resrc_tp
			,	Company_id
			,	Company_tp
			,	Resrc_nm
			,	Company_nm
			;
		END IF;
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################
	SELECT
		tvwResource_Company.Resrc_id
	,	tvwResource_Company.Resrc_tp
	,	tvwResource_Company.Company_id
	,	tvwResource_Company.Company_tp
	,	tvwResource_Company.Company_nm
	INTO
		Resrc_id
	,	Resrc_tp
	,	Company_id
	,	Company_tp
	,	Company_nm
	FROM
		tvwResource_Company
	WHERE	1=1
	AND	tvwResource_Company.Resrc_tp	= Resrc_tp
	AND	tvwResource_Company.Company_id	= Company_id
	AND	tvwResource_Company.Company_tp	= Company_tp
	AND	tvwResource_Company.Resrc_nm	= Resrc_nm
	;
	IF
		FOUND_ROWS()	> 0
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				Resrc_id
			,	Resrc_tp
			,	Company_id
			,	Company_tp
			,	Resrc_nm
			,	Company_nm
			;
		END IF;
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Validate attributes
	#######################################################################
	SET 	@ADD_dm	= ADD_dm;
	SET 	@ADD_nm	= ADD_nm;
	SET 	@UPD_dm	= UPD_dm;
	SET 	@UPD_nm	= UPD_nm;
	SET 	@DEL_dm	= DEL_dm;
	SET 	@DEL_nm	= DEL_nm;
	CALL	vspResource_Company
	(
		@Resrc_id	:= Resrc_id
	,	@Resrc_tp	:= Resrc_tp
	,	@Company_id	:= Company_id
	,	@Company_tp	:= Company_tp
	,	@Resrc_nm	:= Resrc_nm
	,	@Resrc_cd	:= Resrc_cd
	,	@Alias_nm	:= Alias_nm	
	,	@ADD_dm
	,	@ADD_nm
	,	@UPD_dm
	,	@UPD_nm
	,	@DEL_dm
	,	@DEL_nm
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= 'vspResource_Company'
		);
		LEAVE	ISP;
	END IF;
	SET 	ADD_dm	= @ADD_dm;
	SET 	ADD_nm	= @ADD_nm;
	SET 	UPD_dm	= @UPD_dm;
	SET 	UPD_nm	= @UPD_nm;
	SET 	DEL_dm	= @DEL_dm;
	SET 	DEL_nm	= @DEL_nm;
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET	@FK1	= CONCAT(Resrc_tp,",",Company_tp);
	SET	@FK2	= CONCAT(IFNULL(Resrc_id,"(null)"),",",Resrc_tp);
	SET 	@FK3	= CONCAT(IFNULL(Company_id,"(null)"),",",Company_tp);
	--
	--	RESTRICT MODE:
	--
	IF
		Mode_cd	= 'R'
	THEN
		SET 	@TABLE	= "tblResourceType_CompanyType";
		CALL	rspResourceType_CompanyType
		(
			@Resrc_tp	:= Resrc_tp
		,	@Company_tp	:= Company_tp
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	ISP;
		END IF;
		SET 	@TABLE	= "tblCompany";
		CALL	rspCompany
		(
			@Company_id	:= Company_id
		,	@Company_tp	:= Company_tp
		,	@Company_nm	:= Company_nm
		,	@Company_cd	:= Company_cd
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK3
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	ISP;
		END IF;
		SET 	@TABLE	= "tblResource";
		CALL	rspResource
		(
			@Resrc_id	:= Resrc_id
		,	@Resrc_tp	:= Resrc_tp
		,	@Resrc_tx	:= Resrc_tx
		,	@ADD_dm	:= ADD_dm
		,	@ADD_nm	:= ADD_nm
		,	@UPD_dm	:= UPD_dm
		,	@UPD_nm	:= UPD_nm
		,	@DEL_dm	:= DEL_dm
		,	@DEL_nm	:= DEL_nm
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK2
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	ISP;
		END IF;
	END IF;
	--
	--	CASCADE MODE:
	--
	IF
		Mode_cd	= 'C'
	THEN
		--	-------------------------------------------------------
		SET 	@TABLE	= "tblCompany";
		SET	@Company_id	= Company_id;
		CALL	ispCompany
		(
			@Company_id
		,	@Company_tp		:= Company_tp
		,	@Company_nm		:= Company_nm
		,	@Company_cd		:= Company_cd
		,	@Company_tx		:= Company_tx
		,	@CompanyADD_dm		:= NULL
		,	@CompanyADD_nm		:= NULL
		,	@CompanyUPD_dm		:= NULL
		,	@CompanyUPD_nm		:= NULL
		,	@CompanyDEL_dm		:= NULL
		,	@CompanyDEL_nm		:= NULL
		,	@ParentCompany_tp	:= NULL
		,	@CompanyType_tx		:= NULL
		,	@CompanyLeft_id		:= NULL
		,	@CompanyRight_id	:= NULL
		,	@CompanyLevel_id	:= NULL
		,	@CompanyOrder_id	:= NULL
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		);
		--	Set the proc IN parameters to the parent ISP INOUT parameters
		SET	Company_id	= @Company_id;
		--	-------------------------------------------------------
		SET 	@TABLE	= "tblResource";
		SET	@Resrc_id	= Resrc_id;
		CALL	ispResource
		(
			@Resrc_id
		,	@Resrc_tp	:= Resrc_tp
		,	@Resrc_tx	:= Resrc_tx
		,	@ADD_dm		:= ADD_dm
		,	@ADD_nm		:= ADD_nm
		,	@UPD_dm		:= UPD_dm
		,	@UPD_nm		:= UPD_nm
		,	@DEL_dm		:= DEL_dm
		,	@DEL_nm		:= DEL_nm
		,	@ParentResrc_tp	:= NULL
		,	@ResrcType_tx	:= NULL
		,	@Left_id	:= NULL
		,	@Right_id	:= NULL
		,	@Level_id	:= NULL
		,	@Order_id	:= NULL
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		);
		--	Set the proc IN parameters to the parent ISP INOUT parameters
		SET	Resrc_id	= @Resrc_id;
		--	-------------------------------------------------------
		--	-------------------------------------------------------
	END IF;
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################
	SELECT
		tvwResource_Company.Resrc_id
	,	tvwResource_Company.Resrc_tp
	,	tvwResource_Company.Company_id
	,	tvwResource_Company.Company_tp
	,	tvwResource_Company.Company_nm
	INTO
		Resrc_id
	,	Resrc_tp
	,	Company_id
	,	Company_tp
	,	Company_nm
	FROM
		tvwResource_Company
	WHERE	1=1
	AND	tvwResource_Company.Resrc_tp	= Resrc_tp
	AND	tvwResource_Company.Company_id	= Company_id
	AND	tvwResource_Company.Company_tp	= Company_tp
	AND	tvwResource_Company.Resrc_nm	= Resrc_nm
	;
	IF
		FOUND_ROWS()	> 0
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				Resrc_id
			,	Resrc_tp
			,	Company_id
			,	Company_tp
			,	Resrc_nm
			,	Company_nm
			;
		END IF;
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Insert values
	#######################################################################
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedEvent
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
	INSERT
	INTO	tblResource_Company
	(
		Resrc_id
	,	Resrc_tp
	,	Company_id
	,	Company_tp
	,	Resrc_nm
	,	Resrc_cd
	,	Alias_nm
	,	ADD_dm
	,	ADD_nm
	,	UPD_dm
	,	UPD_nm
	,	DEL_dm
	,	DEL_nm
	)
	VALUES
	(
		Resrc_id
	,	Resrc_tp
	,	Company_id
	,	Company_tp
	,	Resrc_nm
	,	Resrc_cd
	,	Alias_nm
	,	ADD_dm
	,	ADD_nm
	,	UPD_dm
	,	UPD_nm
	,	DEL_dm
	,	DEL_nm
	);
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
	-- Return the Primary Key to the front-end if this procedure
	-- was not called from another API stored procedure.
	#######################################################################
 	IF
 		CallingProc_nm	IS NULL OR CallingProc_nm = ''
 	THEN
		SELECT
			Resrc_id
		,	Resrc_tp
		,	Company_id
		,	Company_tp
		,	Resrc_nm
		,	Company_nm
		;
 	END IF;
	#######################################################################
END ISP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure ispResource_Contact */

/*!50003 DROP PROCEDURE IF EXISTS  ispResource_Contact */;

DELIMITER $$

/*!50003 CREATE PROCEDURE ispResource_Contact(
INOUT	Resrc_id	INT SIGNED		-- PK1 
,	Resrc_tp	VARCHAR(64)		-- PK2 AK1
,INOUT	Contact_id	INT SIGNED		-- PK1 
,	Contact_tp	VARCHAR(64)		-- PK2 AK1
,	Contact_nm	VARCHAR(256)		--  AK2
,	Contact_cd	VARCHAR(128)	
,	Alias_nm	VARCHAR(256)
,	Address_nm	VARCHAR(256)
,	City_cd		VARCHAR(128)
,	State_cd	VARCHAR(128)
,	Zip_cd		VARCHAR(128)
,	Phone_cd	VARCHAR(128)
,	GPS_cd		VARCHAR(128)
,	Resrc_tx	MEDIUMTEXT	
,	Contact_tx	MEDIUMTEXT	
,	ADD_dm		DATETIME	
,	ADD_nm		VARCHAR(128)	
,	UPD_dm		DATETIME	
,	UPD_nm		VARCHAR(128)	
,	DEL_dm		DATETIME	
,	DEL_nm		VARCHAR(128)	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		ispResource_Contact
**	Type:		DB API procedure: Insert
**	Purpose:	To insert Resource data into tblResource_Contact
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	4/12/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResource_Contact';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'INSERT';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'ispResource_Contact';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
ISP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF CallingProc_nm IS NULL OR CallingProc_nm = '' THEN SET CallingProc_nm = '';	END IF;
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	IF Resrc_id = '0' OR Resrc_id = 0 THEN SET Resrc_id =  NULL;	END IF;
	IF Resrc_tp IS NULL OR Resrc_tp = '' THEN SET Resrc_tp = NULL;	END IF;
	IF Contact_id = '0' OR Contact_id = 0 THEN SET Contact_id =  NULL;	END IF;
	IF Contact_tp IS NULL OR Contact_tp = '' THEN SET Contact_tp = NULL;	END IF;
	IF Contact_nm IS NULL OR Contact_nm = '' THEN SET Contact_nm = NULL;	END IF;
	IF Contact_cd IS NULL OR Contact_cd = '' THEN SET Contact_cd = NULL;	END IF;
	IF Alias_nm IS NULL OR Alias_nm = '' THEN SET Alias_nm = NULL;	END IF;
	IF Address_nm IS NULL OR Address_nm = '' THEN SET Address_nm = NULL;	END IF;
	IF City_cd IS NULL OR City_cd = '' THEN SET City_cd = NULL;	END IF;
	IF State_cd IS NULL OR State_cd = '' THEN SET State_cd = NULL;	END IF;
	IF ZIP_cd IS NULL OR ZIP_cd = '' THEN SET ZIP_cd = NULL;	END IF;
	IF Phone_cd IS NULL OR Phone_cd = '' THEN SET Phone_cd = NULL;	END IF;
	IF GPS_cd IS NULL OR GPS_cd = '' THEN SET GPS_cd = NULL;	END IF;
	IF Resrc_tx IS NULL OR Resrc_tx = '' THEN SET Resrc_tx = NULL;	END IF;
	IF Contact_tx IS NULL OR Contact_tx = '' THEN SET Contact_tx = NULL;	END IF;
-- 	IF ADD_dm IS NULL THEN SET ADD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
 	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = NULL;	END IF;
-- 	IF UPD_dm IS NULL THEN SET UPD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
 	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = NULL;	END IF;
-- 	IF DEL_dm IS NULL THEN SET DEL_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
 	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = NULL;	END IF;
	SET	@PK1	= CONCAT(IFNULL(Resrc_id,"(null)"),",",Resrc_tp,",",IFNULL(Contact_id,"(null)"),",",Contact_tp);
	SET	@FK1	= CONCAT(Resrc_tp);
	SET	@FK2	= CONCAT(Contact_tp);
	SET	@FK3	= CONCAT(IFNULL(Resrc_id,"(null)"),",",Resrc_tp);
	SET	@FK4	= CONCAT(IFNULL(Contact_id,"(null)"),",",Contact_tp);
	SET	@AK1	= CONCAT(IFNULL(Resrc_id,"(null)"),",",Resrc_tp,",",Contact_tp);
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= 'tblResource_Contact'
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
	CALL	rspResource_Contact
	(
		@Resrc_id	:= Resrc_id
	,	@Resrc_tp	:= Resrc_tp
	,	@Contact_id	:= Contact_id
	,	@Contact_tp	:= Contact_tp
	,	@Contact_nm	:= Contact_nm
	,	@Contact_cd	:= Contact_cd
	,	@Alias_nm	:= Alias_nm
	,	@Address_nm	:= Address_nm
	,	@City_cd	:= City_cd
	,	@State_cd	:= State_cd
	,	@Zip_cd		:= Zip_cd
	,	@Phone_cd	:= Phone_cd
	,	@GPS_cd		:= GPS_cd
	,	@ADD_dm	:= ADD_dm
	,	@ADD_nm	:= ADD_nm
	,	@UPD_dm	:= UPD_dm
	,	@UPD_nm	:= UPD_nm
	,	@DEL_dm	:= DEL_dm
	,	@DEL_nm	:= DEL_nm
	,	@Key_cd	:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 1	-- If PK exists then return without error
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				Resrc_id
			,	Resrc_tp
			,	Contact_id
			,	Contact_tp
			,	Contact_nm
			;
		END IF;
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################
	SELECT
		tvwResource_Contact.Resrc_id
	,	tvwResource_Contact.Resrc_tp
	,	tvwResource_Contact.Contact_id
	,	tvwResource_Contact.Contact_tp
	,	tvwResource_Contact.Contact_nm
	INTO
		Resrc_id
	,	Resrc_tp
	,	Contact_id
	,	Contact_tp
	,	Contact_nm
	FROM
		tvwResource_Contact
	WHERE	1=1
	AND	tvwResource_Contact.Resrc_id	= Resrc_id
	AND	tvwResource_Contact.Resrc_tp	= Resrc_tp
	AND	tvwResource_Contact.Contact_tp	= Contact_tp
	;
	IF
		FOUND_ROWS()	> 0
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				Resrc_id
			,	Resrc_tp
			,	Contact_id
			,	Contact_tp
			,	Contact_nm
			;
		END IF;
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Validate attributes
	#######################################################################
	SET 	@ADD_dm	= ADD_dm;
	SET 	@ADD_nm	= ADD_nm;
	SET 	@UPD_dm	= UPD_dm;
	SET 	@UPD_nm	= UPD_nm;
	SET 	@DEL_dm	= DEL_dm;
	SET 	@DEL_nm	= DEL_nm;
	CALL	vspResource_Contact
	(
		@Resrc_id	:= Resrc_id
	,	@Resrc_tp	:= Resrc_tp
	,	@Contact_id	:= Contact_id
	,	@Contact_tp	:= Contact_tp
	,	@Contact_nm	:= Contact_nm
	,	@Contact_cd	:= Contact_cd
	,	@Alias_nm	:= Alias_nm	
	,	@Address_nm	:= Address_nm
	,	@City_cd	:= City_cd
	,	@State_cd	:= State_cd
	,	@Zip_cd		:= Zip_cd
	,	@Phone_cd	:= Phone_cd
	,	@GPS_cd		:= GPS_cd
	,	@ADD_dm
	,	@ADD_nm
	,	@UPD_dm
	,	@UPD_nm
	,	@DEL_dm
	,	@DEL_nm
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= 'vspResource_Contact'
		);
		LEAVE	ISP;
	END IF;
	SET 	ADD_dm	= @ADD_dm;
	SET 	ADD_nm	= @ADD_nm;
	SET 	UPD_dm	= @UPD_dm;
	SET 	UPD_nm	= @UPD_nm;
	SET 	DEL_dm	= @DEL_dm;
	SET 	DEL_nm	= @DEL_nm;
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET	@FK1	= CONCAT(Resrc_tp);
	SET	@FK2	= CONCAT(Contact_tp);
	SET	@FK3	= CONCAT(IFNULL(Resrc_id,"(null)"),",",Resrc_tp);
	SET	@FK4	= CONCAT(IFNULL(Contact_id,"(null)"),",",Contact_tp);
	SET	@AK1	= CONCAT(IFNULL(Resrc_id,"(null)"),",",Resrc_tp,",",Contact_tp);
	--
	--	RESTRICT MODE:
	--
	IF
		Mode_cd	= 'R'
	THEN
		SET 	@TABLE	= "tblResourceType";
		CALL	rspResourceType
		(
			@Resrc_tp	:= Resrc_tp
		,	@ParentResrc_tp	:= NULL
		,	@ResrcType_tx	:= NULL
		,	@Left_id	:= NULL
		,	@Right_id	:= NULL
		,	@Level_id	:= NULL
		,	@Order_id	:= NULL
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	ISP;
		END IF;
		SET 	@TABLE	= "tblContactType";
		CALL	rspContactType
		(
			@Contact_tp	:= Contact_tp
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK2
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	ISP;
		END IF;
		SET 	@TABLE	= "tblResource";	-- Contact
		CALL	rspResource
		(
			@Resrc_id	:= Contact_id
		,	@Resrc_tp	:= Contact_tp
		,	@Resrc_tx	:= Contact_tx
		,	@ADD_dm	:= ADD_dm
		,	@ADD_nm	:= ADD_nm
		,	@UPD_dm	:= UPD_dm
		,	@UPD_nm	:= UPD_nm
		,	@DEL_dm	:= DEL_dm
		,	@DEL_nm	:= DEL_nm
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK4
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	ISP;
		END IF;
		SET 	@TABLE	= "tblResource";	-- Resource
		CALL	rspResource
		(
			@Resrc_id	:= Resrc_id
		,	@Resrc_tp	:= Resrc_tp
		,	@Resrc_tx	:= Resrc_tx
		,	@ADD_dm	:= ADD_dm
		,	@ADD_nm	:= ADD_nm
		,	@UPD_dm	:= UPD_dm
		,	@UPD_nm	:= UPD_nm
		,	@DEL_dm	:= DEL_dm
		,	@DEL_nm	:= DEL_nm
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK3
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	ISP;
		END IF;
	END IF;
	--
	--	CASCADE MODE:
	--
	IF
		Mode_cd	= 'C'
	THEN
		--	-------------------------------------------------------
		SET 	@TABLE	= "tblResource";	-- Contact
		SET	@Resrc_id	= Contact_id;
		CALL	ispResource
		(
			@Resrc_id
		,	@Resrc_tp	:= Contact_tp
		,	@Resrc_tx	:= Contact_tx
		,	@ADD_dm		:= ADD_dm
		,	@ADD_nm		:= ADD_nm
		,	@UPD_dm		:= UPD_dm
		,	@UPD_nm		:= UPD_nm
		,	@DEL_dm		:= DEL_dm
		,	@DEL_nm		:= DEL_nm
		,	@ParentResrc_tp	:= NULL
		,	@ResrcType_tx	:= NULL
		,	@Left_id	:= NULL
		,	@Right_id	:= NULL
		,	@Level_id	:= NULL
		,	@Order_id	:= NULL
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		);
		--	Set the proc IN parameters to the parent ISP INOUT parameters
		SET	Contact_id	= @Resrc_id;
		--	-------------------------------------------------------
		SET 	@TABLE	= "tblResource";
		SET	@Resrc_id	= Resrc_id;
		CALL	ispResource
		(
			@Resrc_id
		,	@Resrc_tp	:= Resrc_tp
		,	@Resrc_tx	:= Resrc_tx
		,	@ADD_dm		:= ADD_dm
		,	@ADD_nm		:= ADD_nm
		,	@UPD_dm		:= UPD_dm
		,	@UPD_nm		:= UPD_nm
		,	@DEL_dm		:= DEL_dm
		,	@DEL_nm		:= DEL_nm
		,	@ParentResrc_tp	:= NULL
		,	@ResrcType_tx	:= NULL
		,	@Left_id	:= NULL
		,	@Right_id	:= NULL
		,	@Level_id	:= NULL
		,	@Order_id	:= NULL
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		);
		--	Set the proc IN parameters to the parent ISP INOUT parameters
		SET	Resrc_id	= @Resrc_id;
		--	-------------------------------------------------------
		--	-------------------------------------------------------
	END IF;
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################
	SELECT
		tvwResource_Contact.Resrc_id
	,	tvwResource_Contact.Resrc_tp
	,	tvwResource_Contact.Contact_id
	,	tvwResource_Contact.Contact_tp
	,	tvwResource_Contact.Contact_nm
	INTO
		Resrc_id
	,	Resrc_tp
	,	Contact_id
	,	Contact_tp
	,	Contact_nm
	FROM
		tvwResource_Contact
	WHERE	1=1
	AND	tvwResource_Contact.Resrc_tp	= Resrc_tp
	AND	tvwResource_Contact.Contact_tp	= Contact_tp
	AND	tvwResource_Contact.Contact_nm	= Contact_nm
	;
	IF
		FOUND_ROWS()	> 0
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				Resrc_id
			,	Resrc_tp
			,	Contact_id
			,	Contact_tp
			,	Contact_nm
			;
		END IF;
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Insert values
	#######################################################################
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedEvent
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
	INSERT
	INTO	tblResource_Contact
	(
		Resrc_id
	,	Resrc_tp
	,	Contact_id
	,	Contact_tp
	,	Contact_nm
	,	Contact_cd
	,	Alias_nm
	,	Address_nm
	,	City_cd
	,	State_cd
	,	Zip_cd
	,	Phone_cd
	,	GPS_cd
	,	ADD_dm
	,	ADD_nm
	,	UPD_dm
	,	UPD_nm
	,	DEL_dm
	,	DEL_nm
	)
	VALUES
	(
		Resrc_id
	,	Resrc_tp
	,	Contact_id
	,	Contact_tp
	,	Contact_nm
	,	Contact_cd
	,	Alias_nm
	,	Address_nm
	,	City_cd
	,	State_cd
	,	Zip_cd
	,	Phone_cd
	,	GPS_cd
	,	ADD_dm
	,	ADD_nm
	,	UPD_dm
	,	UPD_nm
	,	DEL_dm
	,	DEL_nm
	);
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
	-- Return the Primary Key to the front-end if this procedure
	-- was not called from another API stored procedure.
	#######################################################################
 	IF
 		CallingProc_nm	IS NULL OR CallingProc_nm = ''
 	THEN
		SELECT
			Resrc_id
		,	Resrc_tp
		,	Contact_id
		,	Contact_tp
		,	Contact_nm
		;
 	END IF;
	#######################################################################
END ISP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure ispUser */

/*!50003 DROP PROCEDURE IF EXISTS  ispUser */;

DELIMITER $$

/*!50003 CREATE PROCEDURE ispUser(
INOUT	User_id		INT SIGNED		-- PK1 
,	User_tp		VARCHAR(64)		-- PK2 AK1
,	User_nm		VARCHAR(256)		--  AK2
,	User_cd		VARCHAR(128)	
,	Hashed_cd	VARCHAR(128)
,	Person_nm	VARCHAR(256)
,	Email_nm	VARCHAR(256)
,	Challenge_cd	VARCHAR(128)
,	Response_cd	VARCHAR(128)
,	User_tx		MEDIUMTEXT	
,	UserADD_dm		DATETIME	
,	UserADD_nm		VARCHAR(256)	
,	UserUPD_dm		DATETIME	
,	UserUPD_nm		VARCHAR(256)	
,	UserDEL_dm		DATETIME	
,	UserDEL_nm		VARCHAR(256)	
,	ParentUser_tp		VARCHAR(64)	
,	UserType_tx		MEDIUMTEXT	
,	UserTypeLeft_id		INT SIGNED	
,	UserTypeRight_id		INT SIGNED	
,	UserTypeLevel_id		INT SIGNED	
,	UserTypeOrder_id		INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceUser	User name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		ispUser
**	Type:		DB API procedure: Insert
**	Purpose:	To insert User data into tblUser
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	6/14/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblUser';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'INSERT';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'ispUser';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
DECLARE	FK1		VARCHAR(255) DEFAULT CONCAT(User_tp);
DECLARE	FK2		VARCHAR(255) DEFAULT CONCAT(User_id,",",User_tp);
###############################################################################
ISP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	IF User_id = '0' OR User_id = 0 THEN SET User_id =  NULL;	END IF;
	IF User_tp IS NULL OR User_tp = '' THEN SET User_tp = NULL;	END IF;
	IF User_nm IS NULL OR User_nm = '' THEN SET User_nm = NULL;	END IF;
	IF User_cd IS NULL OR User_cd = '' THEN SET ProcFailed_fg = TRUE;
	ELSE
		SET @salt := LPAD(CONV(FLOOR(RAND() * 0x100000000), 10, 16), 8 ,'0');
		SET Hashed_cd = CONCAT(@salt, SHA(CONCAT(@salt, User_cd)));
	END IF;
	IF Email_nm IS NULL OR Email_nm = '' THEN SET ProcFailed_fg = TRUE;	END IF;
	IF Person_nm IS NULL OR Person_nm = '' THEN SET Person_nm = NULL;	END IF;
	IF Challenge_cd IS NULL OR Challenge_cd = '' THEN SET Challenge_cd = NULL;	END IF;
	IF Response_cd IS NULL OR Response_cd = '' THEN SET Response_cd = NULL;	END IF;
	IF User_tx IS NULL OR User_tx = '' THEN SET User_tx = NULL;	END IF;
	IF UserADD_nm IS NULL OR UserADD_nm = '' THEN SET UserADD_nm = NULL;	END IF;
	IF UserUPD_nm IS NULL OR UserUPD_nm = '' THEN SET UserUPD_nm = NULL;	END IF;
	IF UserDEL_nm IS NULL OR UserDEL_nm = '' THEN SET UserDEL_nm = NULL;	END IF;
	IF ParentUser_tp IS NULL OR ParentUser_tp = '' THEN SET ParentUser_tp = NULL;	END IF;
	IF UserType_tx IS NULL OR UserType_tx = '' THEN SET UserType_tx = NULL;	END IF;
	IF UserTypeLeft_id = '0' OR UserTypeLeft_id = 0 THEN SET UserTypeLeft_id = NULL;	END IF;
	IF UserTypeRight_id = '0' OR UserTypeRight_id = 0 THEN SET UserTypeRight_id = NULL;	END IF;
	IF UserTypeLevel_id = '0' OR UserTypeLevel_id = 0 THEN SET UserTypeLevel_id = NULL;	END IF;
	IF UserTypeOrder_id = '0' OR UserTypeOrder_id = 0 THEN SET UserTypeOrder_id = NULL;	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
	CALL	rspUser
	(
		@User_id	:= User_id
	,	@User_tp	:= User_tp
	,	@User_nm	:= User_nm
	,	@User_cd	:= User_cd
	,	@Hashed_cd	:= Hashed_cd
	,	@Person_nm	:= Person_nm
	,	@Email_nm	:= Email_nm
	,	@Challenge_cd	:= Challenge_cd
	,	@Response_cd	:= Response_cd
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 1	-- If PK exists then return without error
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				User_id
			,	User_tp
			,	User_nm
			;
		END IF;
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################
	SELECT
		tvwUser.User_id
	,	tvwUser.User_tp
	INTO
		User_id
	,	User_tp
	FROM
		tvwUser
	WHERE
		tvwUser.User_tp	= User_tp
	AND	tvwUser.User_nm	= User_nm
	;
	IF
		FOUND_ROWS()	> 0
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				User_id
			,	User_tp
			,	User_nm
			;
		END IF;
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Validate attributes
	#######################################################################
	CALL	vspUser
	(
		@User_id	:= User_id
	,	@User_tp	:= User_tp
	,	@User_nm	:= User_nm
	,	@User_cd	:= User_cd
	,	@Hashed_cd	:= Hashed_cd
	,	@Person_nm	:= Person_nm
	,	@Email_nm	:= Email_nm
	,	@Challenge_cd	:= Challenge_cd
	,	@Response_cd	:= Response_cd
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= Proc_nm
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET	@FK1	= CONCAT(User_tp);
	SET	@FK2	= CONCAT(IFNULL(User_id,"(null)"),",",User_tp);
	-- --------------------------------------------------------------------
	--
	--	RESTRICT MODE:
	--
	IF
		Mode_cd	= 'R'
	THEN
		SET 	@TABLE	= "tblUserType";
		CALL	rspUserType
		(
			@User_tp	:= User_tp
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblUserType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	ISP;
		END IF;
		SET 	@TABLE	= "tblResource";
		CALL	rspResource
		(
			@Resrc_id	:= User_id
		,	@Resrc_tp	:= User_tp
		,	@Resrc_tx	:= User_tx
		,	@ADD_dm		:= UserADD_dm
		,	@ADD_nm		:= UserADD_nm
		,	@UPD_dm		:= UserUPD_dm
		,	@UPD_nm		:= UserUPD_nm
		,	@DEL_dm		:= UserDEL_dm
		,	@DEL_nm		:= UserDEL_nm
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblUserType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK2
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	ISP;
		END IF;
	END IF;
	-- --------------------------------------------------------------------
	-- --------------------------------------------------------------------
	--
	--	CASCADE MODE:
	--
	IF
		Mode_cd	= 'C'
	THEN
		SET 	@TABLE	= "tblUserType";
		CALL	ispUserType
		(
			@User_tp		:= User_tp
		,	@ParentUser_tp	:= ParentUser_tp
		,	@UserType_tx		:= UserType_tx
		,	@UserTypeLeft_id	:= UserTypeLeft_id
		,	@UserTypeRight_id	:= UserTypeRight_id
		,	@UserTypeLevel_id	:= UserTypeLevel_id
		,	@UserTypeOrder_id	:= UserTypeOrder_id
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= 'R'	-- This Table Is Restricted and Does Not Allow A Cascade From an FK Table.
		);
		SET 	@TABLE	= "tblResource";
		SET	@Resrc_id	= User_id;
		CALL	ispResource
		(
			@Resrc_id
		,	@Resrc_tp	:= User_tp
		,	@Resrc_tx	:= User_tx
		,	@ADD_dm		:= UserADD_dm
		,	@ADD_nm		:= UserADD_nm
		,	@UPD_dm		:= UserUPD_dm
		,	@UPD_nm		:= UserUPD_nm
		,	@DEL_dm		:= UserDEL_dm
		,	@DEL_nm		:= UserDEL_nm
		,	@ParentResrc_tp	:= ParentUser_tp
		,	@ResrcType_tx	:= UserType_tx
		,	@Left_id	:= UserTypeLeft_id
		,	@Right_id	:= UserTypeRight_id
		,	@Level_id	:= UserTypeLevel_id
		,	@Order_id	:= UserTypeOrder_id
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		);
		--	Set the proc IN parameters to the parent ISP INOUT parameters
		SET	User_id	= @Resrc_id;
	END IF;
	#######################################################################
	-- Insert values
	#######################################################################
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedEvent
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
	INSERT
	INTO	tblUser
	(
		User_id
	,	User_tp
	,	User_nm
	,	User_cd
	,	Hashed_cd
	,	Person_nm
	,	Email_nm
	,	Challenge_cd
	,	Response_cd
	)
	VALUES
	(
		User_id
	,	User_tp
	,	User_nm
	,	User_cd
	,	Hashed_cd
	,	Person_nm
	,	Email_nm
	,	Challenge_cd
	,	Response_cd
	);
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
	-- Return the Primary Key to the front-end if this procedure
	-- was not called from another API stored procedure.
	#######################################################################
 	IF
 		CallingProc_nm	IS NULL OR CallingProc_nm = ''
 	THEN
		SELECT
			User_id
		,	User_tp
		,	User_nm
 		;
 	END IF;
	#######################################################################
END ISP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure ispUserType */

/*!50003 DROP PROCEDURE IF EXISTS  ispUserType */;

DELIMITER $$

/*!50003 CREATE PROCEDURE ispUserType(
	User_tp		VARCHAR(64)		-- PK1 
,	ParentUser_tp		VARCHAR(64)	
,	UserType_tx		MEDIUMTEXT	
,	UserTypeLeft_id		INT SIGNED	
,	UserTypeRight_id		INT SIGNED	
,	UserTypeLevel_id		INT SIGNED	
,	UserTypeOrder_id		INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceUser	User name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		ispUserType
**	Type:		DB API procedure: Insert
**	Purpose:	To insert UserType data into tblUserType
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	6/14/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblUserType';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'INSERT';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'ispUserType';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
DECLARE	FK1		VARCHAR(255) DEFAULT CONCAT(User_tp);
###############################################################################
ISP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
	CALL	rspUserType
	(
		@User_tp	:= User_tp
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 1	-- If PK exists then return without error
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				User_tp
			;
		END IF;
		LEAVE	ISP;
	END IF;
	IF
		CallingProc_nm	= "ispUser"
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFKNotExist
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		,	@Key_nm		:= FK1
		);
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################
	#######################################################################
	-- Validate attributes
	#######################################################################
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	--
	--	RESTRICT MODE:	tblResourceType
	--
	IF
		@Mode_cd	= 'R'
	THEN
		CALL	rspResourceType
		(
			@Resrc_tp	:= User_tp
		,	@ParentResrc_tp	:= ParentUser_tp
		,	@ResrcType_tx	:= UserType_tx
		,	@Left_id	:= UserTypeLeft_id
		,	@Right_id	:= UserTypeRight_id
		,	@Level_id	:= UserTypeLevel_id
		,	@Order_id	:= UserTypeOrder_id
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblResourceType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= 'tblResourceType'
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= 'tblResourceType'
			);
			LEAVE	ISP;
		END IF;
	END IF;
	--
	--	CASCADE MODE:	tblResourceType
	--
	IF
		@Mode_cd	= 'C'
	THEN
		CALL	ispResourceType
		(
			@Resrc_tp	:= User_tp
		,	@ParentResrc_tp	:= ParentUser_tp
		,	@ResrcType_tx	:= UserType_tx
		,	@Left_id	:= UserTypeLeft_id
		,	@Right_id	:= UserTypeRight_id
		,	@Level_id	:= UserTypeLevel_id
		,	@Order_id	:= UserTypeOrder_id
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= 'R'	-- This Table Is Restricted and Does Not Allow A Cascade From an FK Table.
		);
	END IF;
	#######################################################################
	-- Insert values
	#######################################################################
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedUser
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
	INSERT
	INTO	tblUserType
	(
		User_tp
	)
	VALUES
	(
		User_tp
	);
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
	-- Return the Primary Key to the front-end if this procedure
	-- was not called from another API stored procedure.
	#######################################################################
 	IF
 		CallingProc_nm	IS NULL OR CallingProc_nm = ''
 	THEN
		SELECT
			@User_tp	AS User_tp
 		;
 	END IF;
	#######################################################################
END	ISP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure ispUser_Company */

/*!50003 DROP PROCEDURE IF EXISTS  ispUser_Company */;

DELIMITER $$

/*!50003 CREATE PROCEDURE ispUser_Company(
INOUT	User_id		INT SIGNED		-- PK1 
,	User_tp		VARCHAR(64)		-- PK2 AK1
,INOUT	Company_id	INT SIGNED		-- PK1 
,	Company_tp	VARCHAR(64)		-- PK2 AK1
,	User_nm		VARCHAR(256)		--  AK2
,	User_cd		VARCHAR(128)	
,	Alias_nm	VARCHAR(256)		--  AK2
,	Hashed_cd	VARCHAR(128)
,	Person_nm	VARCHAR(256)
,	Email_nm	VARCHAR(256)
,	Challenge_cd	VARCHAR(128)
,	Response_cd	VARCHAR(128)
,	Company_nm	VARCHAR(256)
,	Company_cd	VARCHAR(128)	
,	User_tx		MEDIUMTEXT	
,	Company_tx	MEDIUMTEXT	
,	ADD_dm		DATETIME	
,	ADD_nm		VARCHAR(128)	
,	UPD_dm		DATETIME	
,	UPD_nm		VARCHAR(128)	
,	DEL_dm		DATETIME	
,	DEL_nm		VARCHAR(128)	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		ispUser_Company
**	Type:		DB API procedure: Insert
**	Purpose:	To insert Resource data into tblResource_Company
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	4/12/2013
**	Modnumber:	00
**	Modification:	Original
**	NOTE: Special Case
	AK in parent tblUser = User_tp, User_nm 
	AK in tblResource_Company = Resrc_tp, Company_id, Company_tp, Resrc_nm
	AK for "User_Company" = User_tp(tblResource_Company.Resrc_tp), Company_tp, Company_nm, User_nm(tblResource_Company.Resrc_nm)
**
	A user type and user name exists once in tblUser and once in tblCompany
	A user type and user name exists once in tblUser but may exist once or more in tblResource_Conatct, tblResource_Project
	A user may belong to more than one Group which may belong to one or more Companies
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResource_Company';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'INSERT';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'ispUser_Company';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
DECLARE	FK1		VARCHAR(255) DEFAULT CONCAT(User_id,",",User_tp);
DECLARE	FK2		VARCHAR(255) DEFAULT CONCAT(User_id,",",User_tp,",",Company_id,",",Company_tp);
###############################################################################
ISP:
BEGIN
DECLARE CONTINUE HANDLER FOR NOT FOUND SET ProcFailed_fg	= 0;
	#######################################################################
	-- Initialize
	#######################################################################
	IF CallingProc_nm IS NULL OR CallingProc_nm = '' THEN SET CallingProc_nm = '';	END IF;
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	IF User_id = '0' OR User_id = 0 THEN SET User_id =  NULL;	END IF;
	IF User_tp IS NULL OR User_tp = '' THEN SET User_tp = NULL;	END IF;
	IF Company_id = '0' OR Company_id = 0 THEN SET Company_id =  NULL;	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = NULL;	END IF;
	IF User_nm IS NULL OR User_nm = '' THEN SET User_nm = NULL;	END IF;
	IF User_cd IS NULL OR User_cd = '' THEN SET ProcFailed_fg = TRUE;	END IF;
	IF Alias_nm IS NULL OR Alias_nm = '' THEN SET Alias_nm = NULL;	END IF;
	IF Email_nm IS NULL OR Email_nm = '' THEN SET ProcFailed_fg = TRUE;	END IF;
	IF Person_nm IS NULL OR Person_nm = '' THEN SET Person_nm = NULL;	END IF;
	IF Challenge_cd IS NULL OR Challenge_cd = '' THEN SET Challenge_cd = NULL;	END IF;
	IF Response_cd IS NULL OR Response_cd = '' THEN SET Response_cd = NULL;	END IF;
	IF Company_nm IS NULL OR Company_nm = '' THEN SET Company_nm = NULL;	END IF;
	IF Company_cd IS NULL OR Company_cd = '' THEN SET Company_cd = NULL;	END IF;
	IF User_tx IS NULL OR User_tx = '' THEN SET User_tx = NULL;	END IF;
	IF Company_tx IS NULL OR Company_tx = '' THEN SET Company_tx = NULL;	END IF;
-- 	IF ADD_dm IS NULL THEN SET ADD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
 	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = NULL;	END IF;
-- 	IF UPD_dm IS NULL THEN SET UPD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
 	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = NULL;	END IF;
-- 	IF DEL_dm IS NULL THEN SET DEL_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
 	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = NULL;	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
	CALL	rspResource_Company
	(
		@Resrc_id	:= User_id
	,	@Resrc_tp	:= User_tp
	,	@Company_id	:= Company_id
	,	@Company_tp	:= Company_tp
	,	@Resrc_nm	:= NULL
	,	@Resrc_cd	:= NULL
	,	@Alias_nm	:= NULL
	,	@ADD_dm	:= ADD_dm
	,	@ADD_nm	:= ADD_nm
	,	@UPD_dm	:= UPD_dm
	,	@UPD_nm	:= UPD_nm
	,	@DEL_dm	:= DEL_dm
	,	@DEL_nm	:= DEL_nm
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 1	-- If PK exists then return without error
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				User_id
			,	User_tp
			,	Company_id
			,	Company_tp
			,	User_nm
			,	Company_nm
			;
		END IF;
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################
	SELECT
		tvwUser_Company.User_id
	,	tvwUser_Company.User_tp
	,	tvwUser_Company.Company_id
	,	tvwUser_Company.Company_tp
	,	tvwUser_Company.Company_nm
	INTO
		User_id
	,	User_tp
	,	Company_id
	,	Company_tp
	,	Company_nm
	FROM
		tvwUser_Company
	WHERE	1=1
	AND	tvwUser_Company.User_tp	= User_tp
	AND	tvwUser_Company.User_nm	= User_nm
--	AND	tvwUser_Company.Company_id	= Company_id
-- 	AND	tvwUser_Company.Company_tp	= Company_tp
-- 	AND	tvwUser_Company.Company_nm	= Company_nm
	;
	IF
		FOUND_ROWS()	> 0
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				User_id
			,	User_tp
			,	Company_id
			,	Company_tp
			,	User_nm
			,	Company_nm
			;
		END IF;
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Validate attributes
	#######################################################################
	SET 	@ADD_dm	= ADD_dm;
	SET 	@ADD_nm	= ADD_nm;
	SET 	@UPD_dm	= UPD_dm;
	SET 	@UPD_nm	= UPD_nm;
	SET 	@DEL_dm	= DEL_dm;
	SET 	@DEL_nm	= DEL_nm;
	CALL	vspUser_Company
	(
		@User_id	:= User_id
	,	@User_tp	:= User_tp
	,	@Company_id	:= Company_id
	,	@Company_tp	:= Company_tp
	,	@User_nm	:= User_nm
	,	@User_cd	:= User_cd
	,	@Company_nm	:= Company_nm
	,	@ADD_dm
	,	@ADD_nm
	,	@UPD_dm
	,	@UPD_nm
	,	@DEL_dm
	,	@DEL_nm
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= 'vspUser_Company'
		);
		LEAVE	ISP;
	END IF;
	-- --------------------------------------------------------------------
	SET 	ADD_dm	= @ADD_dm;
	SET 	ADD_nm	= @ADD_nm;
	SET 	UPD_dm	= @UPD_dm;
	SET 	UPD_nm	= @UPD_nm;
	SET 	DEL_dm	= @DEL_dm;
	SET 	DEL_nm	= @DEL_nm;
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET @FK1	= CONCAT(IFNULL(User_id,"(null)"),",",User_tp);
	SET @FK2	= CONCAT(IFNULL(User_id,"(null)"),",",User_tp,",",IFNULL(Company_id,"(null)"),",",Company_tp);
	-- --------------------------------------------------------------------
	--
	--	RESTRICT MODE:
	--
	IF
		Mode_cd	= 'R'
	THEN
		SET 	@TABLE	= "tblUser";
		CALL	rspUser
		(
			@User_id	:= User_id
		,	@User_tp	:= User_tp
		,	@User_nm	:= User_nm
		,	@User_cd	:= User_cd
		,	@Hashed_cd	:= Hashed_cd
		,	@Person_nm	:= Person_nm
		,	@Email_nm	:= Email_nm
		,	@Challenge_cd	:= Challenge_cd
		,	@Response_cd	:= Response_cd
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	ISP;
		END IF;
		SET 	@TABLE	= "tblResource_Company";
		CALL	rspResource_Company
		(
			@Resrc_id	:= User_id
		,	@Resrc_tp	:= User_tp
		,	@Company_id	:= Company_id
		,	@Company_tp	:= Company_tp
		,	@Resrc_nm	:= User_nm
		,	@Resrc_cd	:= User_cd
		,	@Alias_nm	:= Alias_nm
		,	@ADD_dm	:= ADD_dm
		,	@ADD_nm	:= ADD_nm
		,	@UPD_dm	:= UPD_dm
		,	@UPD_nm	:= UPD_nm
		,	@DEL_dm	:= DEL_dm
		,	@DEL_nm	:= DEL_nm
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK2
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	ISP;
		END IF;
	END IF;
	--
	--	CASCADE MODE:
	--
	IF
		Mode_cd	= 'C'
	THEN
		SET 	@TABLE	= "tblUser";
		SET	@User_id	= User_id;
		CALL	ispUser
		(
			@User_id
		,	@User_tp	:= User_tp
		,	@User_nm	:= User_nm
		,	@User_cd	:= User_cd
		,	@Hashed_cd	:= Hashed_cd
		,	@Person_nm	:= Person_nm
		,	@Email_nm	:= Email_nm
		,	@Challenge_cd	:= Challenge_cd
		,	@Response_cd	:= Response_cd
		,	@User_tx	:= User_tx
		,	@UserADD_dm	:= ADD_dm
		,	@UserADD_nm	:= ADD_nm
		,	@UserUPD_dm	:= UPD_dm
		,	@UserUPD_nm	:= UPD_nm
		,	@UserDEL_dm	:= DEL_dm
		,	@UserDEL_nm	:= DEL_nm
		,	@ParentUser_tp	:= NULL
		,	@UserType_tx	:= NULL
		,	@UserTypeLeft_id	:= NULL
		,	@UserTypeRight_id	:= NULL
		,	@UserTypeLevel_id	:= NULL
		,	@UserTypeOrder_id	:= NULL
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		)
		;
		--	Set the proc IN parameters to the parent ISP INOUT parameters
		SET	User_id	= @User_id;
		--	-------------------------------------------------------
		SET 	@TABLE	= "tblResource_Company";
		SET 	@Resrc_id	= User_id;
		SET 	@Company_id	= Company_id;
		CALL	ispResource_Company
		(
			@Resrc_id
		,	@Resrc_tp	:= User_tp
		,	@Company_id
		,	@Company_tp	:= Company_tp
		,	@Resrc_nm	:= User_nm
		,	@Resrc_cd	:= User_cd
		,	@Alias_nm	:= Alias_nm
		,	@Company_nm := Company_nm
		,	@Company_cd := Company_cd
		,	@Resrc_tx   := User_tx
		,	@Company_tx := Company_tx
		,	@ADD_dm	:= ADD_dm
		,	@ADD_nm	:= ADD_nm
		,	@UPD_dm	:= UPD_dm
		,	@UPD_nm	:= UPD_nm
		,	@DEL_dm	:= DEL_dm
		,	@DEL_nm	:= DEL_nm
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		)
		;
		--	Set the proc IN parameters to the parent ISP INOUT parameters
		SET 	Company_id	= @Company_id;
	END IF;
	#######################################################################
	-- Insert values
	#######################################################################
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
	-- Return the Primary Key to the front-end if this procedure
	-- was not called from another API stored procedure.
	#######################################################################
 	IF
 		CallingProc_nm	IS NULL OR CallingProc_nm = ''
 	THEN
		SELECT
			User_id
		,	User_tp
		,	Company_id
		,	Company_tp
		,	User_nm
		,	Company_nm
		;
 	END IF;
	#######################################################################
END ISP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure rspCompany */

/*!50003 DROP PROCEDURE IF EXISTS  rspCompany */;

DELIMITER $$

/*!50003 CREATE PROCEDURE rspCompany(
	Company_id		INT SIGNED		
,	Company_tp		VARCHAR(64)		
,	Company_nm		VARCHAR(256)		
,	Company_cd		VARCHAR(128)		
,		Key_cd		VARCHAR(16)		-- = 'PK'	-- Search key code
,	OUT 	RowExists_fg	TINYINT	
)
BEGIN
/*
**	Name:		rspCompany
**	Type:		DB API Procedure: Referential 
**	Purpose:	Check existence of a record in tblCompany
**	Author:		Solomon S. Shacter
**	Generated:	7/9/2013
**
**	Modified:	7/9/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
###############################################################################
RSP:
BEGIN
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'PK';	END IF;
	IF Company_id IS NULL OR Company_id = 0 THEN SET Company_id =  -2147483647;	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = '-2147483647';	END IF;
	IF Company_nm IS NULL OR Company_nm = '' THEN SET Company_nm = '-2147483647';	END IF;
	IF Company_cd IS NULL OR Company_cd = '' THEN SET Company_cd = '-2147483647';	END IF;
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF 	Key_cd	= 'PK'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblCompany
			WHERE
				tblCompany.Company_id	= Company_id
			AND	tblCompany.Company_tp	= Company_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd = 'FK1'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblCompany
			WHERE
				tblCompany.Company_tp	= Company_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd = 'FK2'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblCompany
			WHERE
				tblCompany.Company_id	= Company_id
			AND	tblCompany.Company_tp	= Company_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	IF	Key_cd = 'AK'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblCompany
			WHERE
				tblCompany.Company_tp	= Company_tp
			AND	tblCompany.Company_nm	= Company_nm
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd	= 'AL'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblCompany
			WHERE
				(
				Company_id	= Company_id
			OR	Company_id	=  -2147483647
				)
			AND	(
				Company_tp	= Company_tp
			OR	Company_tp	= '-2147483647'
				)
			AND	(
				Company_nm	= Company_nm
			OR	Company_nm	= '-2147483647'
				)
			AND	(
				Company_cd	= Company_cd
			OR	Company_cd	= '-2147483647'
				)
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
END	RSP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure rspCompanyType */

/*!50003 DROP PROCEDURE IF EXISTS  rspCompanyType */;

DELIMITER $$

/*!50003 CREATE PROCEDURE rspCompanyType(
	Company_tp		varchar(64)		
,		Key_cd		VARCHAR(16)		-- = 'PK'	-- Search key code
,	OUT 	RowExists_fg	TINYINT	
)
BEGIN
/*
**	Name:		rspCompanyType
**	Type:		DB API Procedure: Referential 
**	Purpose:	Check existence of a record in tblCompanyType
**	Author:		Solomon S. Shacter
**	Generated:	7/2/2013
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
###############################################################################
RSP:
BEGIN
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'PK';	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = '-2147483647';	END IF;
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF 	Key_cd	= 'PK'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblCompanyType
			WHERE
				tblCompanyType.Company_tp	= Company_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd = 'FK1'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblCompanyType
			WHERE
				tblCompanyType.Company_tp	= Company_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd	= 'AL'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblCompanyType
			WHERE
				(
				Company_tp	= Company_tp
			OR	Company_tp	= '-2147483647'
				)
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
END	RSP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure rspContactType */

/*!50003 DROP PROCEDURE IF EXISTS  rspContactType */;

DELIMITER $$

/*!50003 CREATE PROCEDURE rspContactType(
	Contact_tp		VARCHAR(64)		
,	Key_cd		VARCHAR(16)		-- = 'PK'	-- Search key code
,	OUT 	RowExists_fg	TINYINT	
)
BEGIN
/*
**	Name:		rspContactType
**	Type:		DB API Procedure: Referential 
**	Purpose:	Check existence of a record in tblContactType
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**	Generated:	7/2/2013
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
###############################################################################
RSP:
BEGIN
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'PK';	END IF;
	IF Contact_tp IS NULL OR Contact_tp = '' THEN SET Contact_tp = '-2147483647';	END IF;
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF 	Key_cd	= 'PK'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblContactType
			WHERE
				tblContactType.Contact_tp	= Contact_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd = 'FK1'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblContactType
			WHERE
				tblContactType.Contact_tp	= Contact_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd	= 'AL'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblContactType
			WHERE
				(
				Contact_tp	= Contact_tp
			OR	Contact_tp	= '-2147483647'
				)
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
END	RSP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure rspResource */

/*!50003 DROP PROCEDURE IF EXISTS  rspResource */;

DELIMITER $$

/*!50003 CREATE PROCEDURE rspResource(
	Resrc_id		int signed		
,	Resrc_tp		varchar(64)
,	Resrc_tx		mediumtext		
,	ADD_dm		datetime		
,	ADD_nm		varchar(256)		
,	UPD_dm		datetime		
,	UPD_nm		varchar(256)		
,	DEL_dm		datetime		
,	DEL_nm		varchar(256)		
,		Key_cd		VARCHAR(16)		-- = 'PK'	-- Search key code
,	OUT 	RowExists_fg	TINYINT	
)
BEGIN
/*
**	Name:		rspResource
**	Type:		DB API Procedure: Referential 
**	Purpose:	Check existence of a record in tblResource
**	Author:		Solomon S. Shacter
**	Generated:	7/2/2013
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
###############################################################################
RSP:
BEGIN
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'PK';	END IF;
	IF Resrc_id IS NULL OR Resrc_id = 0 THEN SET Resrc_id =  -2147483647;	END IF;
	IF Resrc_tp IS NULL OR Resrc_tp = '' THEN SET Resrc_tp = '-2147483647';	END IF;
	IF Resrc_tx IS NULL OR Resrc_tx = '' THEN SET Resrc_tx = '-2147483647';	END IF;
	IF ADD_dm IS NULL OR ADD_dm = '' THEN SET ADD_dm = '0000-00-00 00:00:00';	END IF;
	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = '-2147483647';	END IF;
	IF UPD_dm IS NULL OR UPD_dm = '' THEN SET UPD_dm = '0000-00-00 00:00:00';	END IF;
	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = '-2147483647';	END IF;
	IF DEL_dm IS NULL OR DEL_dm = '' THEN SET DEL_dm = '0000-00-00 00:00:00';	END IF;
	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = '-2147483647';	END IF;
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF 	Key_cd	= 'PK'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblResource
			WHERE
				tblResource.Resrc_id	= Resrc_id
			AND	tblResource.Resrc_tp	= Resrc_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd = 'FK1'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblResource
			WHERE
				tblResource.Resrc_tp	= Resrc_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd	= 'AL'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblResource
			WHERE
				(
				Resrc_id	= Resrc_id
			OR	Resrc_id	=  -2147483647
				)
			AND	(
				Resrc_tp	= Resrc_tp
			OR	Resrc_tp	= '-2147483647'
				)
			AND	(
				Resrc_tx	LIKE Resrc_tx
			OR	Resrc_tx	LIKE '-2147483647'
				)
			AND	(
				ADD_dm	= ADD_dm
			OR	ADD_dm	= '0000-00-00 00:00:00'
				)
			AND	(
				ADD_nm	= ADD_nm
			OR	ADD_nm	= '-2147483647'
				)
			AND	(
				UPD_dm	= UPD_dm
			OR	UPD_dm	= '0000-00-00 00:00:00'
				)
			AND	(
				UPD_nm	= UPD_nm
			OR	UPD_nm	= '-2147483647'
				)
			AND	(
				DEL_dm	= DEL_dm
			OR	DEL_dm	= '0000-00-00 00:00:00'
				)
			AND	(
				DEL_nm	= DEL_nm
			OR	DEL_nm	= '-2147483647'
				)
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
END	RSP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure rspResourceType */

/*!50003 DROP PROCEDURE IF EXISTS  rspResourceType */;

DELIMITER $$

/*!50003 CREATE PROCEDURE rspResourceType(
	Resrc_tp		VARCHAR(64)		
,	ParentResrc_tp		VARCHAR(64)		
,	ResrcType_tx		MEDIUMTEXT		
,	Left_id		INT SIGNED		
,	Right_id		INT SIGNED		
,	Level_id		INT SIGNED		
,	Order_id		INT SIGNED		
,	Key_cd		VARCHAR(16)		-- = 'PK'	-- Search key code
,	OUT 	RowExists_fg	TINYINT	
)
BEGIN
/*
**	Name:		rspResourceType
**	Type:		DB API Procedure: Referential 
**	Purpose:	Check existence of a record in tblResourceType
**	Author:		Solomon S. Shacter
**	Generated:	7/2/2013
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
###############################################################################
RSP:
BEGIN
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'PK';	END IF;
	IF Resrc_tp IS NULL OR Resrc_tp = '' THEN SET Resrc_tp = '-2147483647';	END IF;
	IF ParentResrc_tp IS NULL OR ParentResrc_tp = '' THEN SET ParentResrc_tp = '-2147483647';	END IF;
	IF ResrcType_tx IS NULL OR ResrcType_tx = '' THEN SET ResrcType_tx = '-2147483647';	END IF;
	IF Left_id IS NULL OR Left_id = 0 THEN SET Left_id =  -2147483647;	END IF;
	IF Right_id IS NULL OR Right_id = 0 THEN SET Right_id =  -2147483647;	END IF;
	IF Level_id IS NULL OR Level_id = 0 THEN SET Level_id =  -2147483647;	END IF;
	IF Order_id IS NULL OR Order_id = 0 THEN SET Order_id =  -2147483647;	END IF;
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF 	Key_cd	= 'PK'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tblResourceType
			WHERE	1=1
			AND	tblResourceType.Resrc_tp	= Resrc_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	IF	Key_cd = 'AK'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tblResourceType
			WHERE	1=1
			AND	tblResourceType.Resrc_tp	= Resrc_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd	= 'AL'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tblResourceType
			WHERE	1=1
			AND	(
				Resrc_tp	= Resrc_tp
			OR	Resrc_tp	= '-2147483647'
				)
			AND	(
				ParentResrc_tp	= ParentResrc_tp
			OR	ParentResrc_tp	= '-2147483647'
				)
			AND	(
				ResrcType_tx	LIKE ResrcType_tx
			OR	ResrcType_tx	LIKE '-2147483647'
				)
			AND	(
				Left_id	= Left_id
			OR	Left_id	=  -2147483647
				)
			AND	(
				Right_id	= Right_id
			OR	Right_id	=  -2147483647
				)
			AND	(
				Level_id	= Level_id
			OR	Level_id	=  -2147483647
				)
			AND	(
				Order_id	= Order_id
			OR	Order_id	=  -2147483647
				)
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
END	RSP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure rspResourceType_CompanyType */

/*!50003 DROP PROCEDURE IF EXISTS  rspResourceType_CompanyType */;

DELIMITER $$

/*!50003 CREATE PROCEDURE rspResourceType_CompanyType(
	Resrc_tp		VARCHAR(64)		
,	Company_tp		VARCHAR(64)		
,	Key_cd		VARCHAR(16)		-- = 'PK'	-- Search key code
,	OUT 	RowExists_fg	TINYINT	
)
BEGIN
/*
**	Name:		rspResourceType_CompanyType
**	Type:		DB API Procedure: Referential 
**	Purpose:	Check existence of a record in tblResourceType_CompanyType
**	Author:		Solomon S. Shacter
**	Generated:	7/2/2013
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
###############################################################################
RSP:
BEGIN
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'PK';	END IF;
	IF Resrc_tp IS NULL OR Resrc_tp = '' THEN SET Resrc_tp = '-2147483647';	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = '-2147483647';	END IF;
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF 	Key_cd	= 'PK'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tblResourceType_CompanyType
			WHERE	1=1
			AND	tblResourceType_CompanyType.Resrc_tp	= Resrc_tp
			AND	tblResourceType_CompanyType.Company_tp	= Company_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF 	Key_cd	= 'FK1'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tblResourceType_CompanyType
			WHERE	1=1
			AND	tblResourceType_CompanyType.Resrc_tp	= Resrc_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	IF 	Key_cd	= 'FK2'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tblResourceType_CompanyType
			WHERE	1=1
			AND	tblResourceType_CompanyType.Company_tp	= Company_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	IF	Key_cd = 'AK'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tblResourceType_CompanyType
			WHERE	1=1
			AND	tblResourceType_CompanyType.Resrc_tp	= Resrc_tp
			AND	tblResourceType_CompanyType.Company_tp	= Company_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd	= 'AL'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tblResourceType_CompanyType
			WHERE	1=1
			AND	(
				Resrc_tp	= Resrc_tp
			OR	Resrc_tp	= '-2147483647'
				)
			AND	(
				Company_tp	= Company_tp
			OR	Company_tp	= '-2147483647'
				)
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
END	RSP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure rspResource_Company */

/*!50003 DROP PROCEDURE IF EXISTS  rspResource_Company */;

DELIMITER $$

/*!50003 CREATE PROCEDURE rspResource_Company(
	Resrc_id		INT SIGNED
,	Resrc_tp		VARCHAR(64)
,	Company_id		INT SIGNED
,	Company_tp		VARCHAR(64)
,	Resrc_nm		VARCHAR(256)
,	Resrc_cd		VARCHAR(128)
,	Alias_nm		VARCHAR(256)
,	ADD_dm		DATETIME
,	ADD_nm		VARCHAR(256)
,	UPD_dm		DATETIME
,	UPD_nm		VARCHAR(256)
,	DEL_dm		DATETIME
,	DEL_nm		VARCHAR(256)
,		Key_cd		VARCHAR(16)		-- = 'PK'	-- Search key code
,	OUT 	RowExists_fg	TINYINT	
)
BEGIN
/*
**	Name:		rspResource_Company
**	Type:		DB API Procedure: Referential 
**	Purpose:	Check existence of a record in tblResource_Company
**	Author:		Solomon S. Shacter
**	Generated:	7/9/2013
**
**	Modified:	7/9/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
###############################################################################
RSP:
BEGIN
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'PK';	END IF;
	IF Resrc_id IS NULL OR Resrc_id = 0 THEN SET Resrc_id =  -2147483647;	END IF;
	IF Resrc_tp IS NULL OR Resrc_tp = '' THEN SET Resrc_tp = '-2147483647';	END IF;
	IF Company_id IS NULL OR Company_id = 0 THEN SET Company_id =  -2147483647;	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = '-2147483647';	END IF;
	IF Resrc_nm IS NULL OR Resrc_nm = '' THEN SET Resrc_nm = '-2147483647';	END IF;
	IF Resrc_cd IS NULL OR Resrc_cd = '' THEN SET Resrc_cd = '-2147483647';	END IF;
	IF Alias_nm IS NULL OR Alias_nm = '' THEN SET Alias_nm = '-2147483647';	END IF;
	IF ADD_dm IS NULL THEN SET ADD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = '-2147483647';	END IF;
	IF UPD_dm IS NULL THEN SET UPD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = '-2147483647';	END IF;
	IF DEL_dm IS NULL THEN SET DEL_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = '-2147483647';	END IF;
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF 	Key_cd	= 'PK'
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
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd = 'FK1'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
                tblResource_Company
			WHERE	1=1
			AND	tblResource_Company.Resrc_tp	= Resrc_tp
			AND	tblResource_Company.Company_tp	= Company_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd = 'FK2'
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
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd = 'FK3'
	THEN
		IF
		EXISTS
		(
			SELECT	1
		    FROM
			    tblResource_Company
		    WHERE   1=1
		    AND	tblResource_Company.Company_id	= Company_id
		    AND	tblResource_Company.Company_tp	= Company_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	IF	Key_cd = 'AK'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
                tblResource_Company
			WHERE	1=1
			AND	tblResource_Company.Resrc_tp	= Resrc_tp
			AND	tblResource_Company.Company_id	= Company_id
			AND	tblResource_Company.Company_tp	= Company_tp
			AND	tblResource_Company.Resrc_nm	= Resrc_nm
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd	= 'AL'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
                tblResource_Company
			WHERE	1=1
			AND	(
				tblResource_Company.Resrc_id	= Resrc_id
			OR	Resrc_id	=  -2147483647
				)
			AND	(
				tblResource_Company.Resrc_tp	= Resrc_tp
			OR	Resrc_tp	= '-2147483647'
				)
			AND	(
				tblResource_Company.Company_id	= Company_id
			OR	Company_id	=  -2147483647
				)
			AND	(
				tblResource_Company.Company_tp	= Company_tp
			OR	Company_tp	= '-2147483647'
				)
			AND	(
				tblResource_Company.Resrc_nm	= Resrc_nm
			OR	Resrc_nm	= '-2147483647'
				)
			AND	(
				tblResource_Company.Resrc_cd	= Resrc_cd
			OR	Resrc_cd	= '-2147483647'
				)
			AND	(
				tblResource_Company.Alias_nm	= Alias_nm
			OR	Alias_nm	= '-2147483647'
				)
			AND	(
				tblResource_Company.ADD_dm	= ADD_dm
			OR	ADD_dm	= '0000-00-00 00:00:00'
				)
			AND	(
				tblResource_Company.ADD_nm	= ADD_nm
			OR	ADD_nm	= '-2147483647'
				)
			AND	(
				tblResource_Company.UPD_dm	= UPD_dm
			OR	UPD_dm	= '0000-00-00 00:00:00'
				)
			AND	(
				tblResource_Company.UPD_nm	= UPD_nm
			OR	UPD_nm	= '-2147483647'
				)
			AND	(
				tblResource_Company.DEL_dm	= DEL_dm
			OR	DEL_dm	= '0000-00-00 00:00:00'
				)
			AND	(
				tblResource_Company.DEL_nm	= DEL_nm
			OR	DEL_nm	= '-2147483647'
				)
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
END	RSP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure rspResource_Contact */

/*!50003 DROP PROCEDURE IF EXISTS  rspResource_Contact */;

DELIMITER $$

/*!50003 CREATE PROCEDURE rspResource_Contact(
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
,	ADD_dm		DATETIME
,	ADD_nm		VARCHAR(256)
,	UPD_dm		DATETIME
,	UPD_nm		VARCHAR(256)
,	DEL_dm		DATETIME
,	DEL_nm		VARCHAR(256)
,		Key_cd		VARCHAR(16)		-- = 'PK'	-- Search key code
,	OUT 	RowExists_fg	TINYINT	
)
BEGIN
/*
**	Name:		rspResource_Contact
**	Type:		DB API Procedure: Referential 
**	Purpose:	Check existence of a record in tblResource_Contact
**	Author:		Solomon S. Shacter
**	Generated:	7/9/2013
**
**	Modified:	7/9/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
###############################################################################
RSP:
BEGIN
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'PK';	END IF;
	IF Resrc_id IS NULL OR Resrc_id = 0 THEN SET Resrc_id =  -2147483647;	END IF;
	IF Resrc_tp IS NULL OR Resrc_tp = '' THEN SET Resrc_tp = '-2147483647';	END IF;
	IF Contact_id IS NULL OR Contact_id = 0 THEN SET Contact_id =  -2147483647;	END IF;
	IF Contact_tp IS NULL OR Contact_tp = '' THEN SET Contact_tp = '-2147483647';	END IF;
	IF Contact_nm IS NULL OR Contact_nm = '' THEN SET Contact_nm = '-2147483647';	END IF;
	IF Contact_cd IS NULL OR Contact_cd = '' THEN SET Contact_cd = '-2147483647';	END IF;
	IF Alias_nm IS NULL OR Alias_nm = '' THEN SET Alias_nm = '-2147483647';	END IF;
	IF Address_nm IS NULL OR Address_nm = '' THEN SET Address_nm = '-2147483647';	END IF;
	IF City_cd IS NULL OR City_cd = '' THEN SET City_cd = '-2147483647';	END IF;
	IF State_cd IS NULL OR State_cd = '' THEN SET State_cd = '-2147483647';	END IF;
	IF ZIP_cd IS NULL OR ZIP_cd = '' THEN SET ZIP_cd = '-2147483647';	END IF;
	IF Phone_cd IS NULL OR Phone_cd = '' THEN SET Phone_cd = '-2147483647';	END IF;
	IF GPS_cd IS NULL OR GPS_cd = '' THEN SET GPS_cd = '-2147483647';	END IF;
	IF ADD_dm IS NULL THEN SET ADD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = '-2147483647';	END IF;
	IF UPD_dm IS NULL THEN SET UPD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = '-2147483647';	END IF;
	IF DEL_dm IS NULL THEN SET DEL_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = '-2147483647';	END IF;
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF 	Key_cd	= 'PK'
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
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd = 'FK1'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tblResource_Contact
			WHERE	1=1
			AND	tblResource_Contact.Resrc_tp	= Resrc_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	IF	Key_cd = 'FK2'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tblResource_Contact
			WHERE	1=1
			AND	tblResource_Contact.Contact_tp	= Contact_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	IF	Key_cd = 'FK3'
	THEN
		IF
		EXISTS
		(
			SELECT	1
		    FROM
			    tblResource_Contact
		    WHERE   1=1
		    AND	tblResource_Contact.Resrc_id	= Resrc_id
		    AND	tblResource_Contact.Resrc_tp	= Resrc_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	IF	Key_cd = 'FK4'
	THEN
		IF
		EXISTS
		(
			SELECT	1
		    FROM
			    tblResource_Contact
		    WHERE   1=1
		    AND	tblResource_Contact.Contact_id	= Contact_id
		    AND	tblResource_Contact.Contact_tp	= Contact_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	IF	Key_cd = 'AK'
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
			AND	tblResource_Contact.Contact_tp	= Contact_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd	= 'AL'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tblResource_Contact
			WHERE	1=1
			AND	(
				tblResource_Contact.Resrc_id	= Resrc_id
			OR	Resrc_id	=  -2147483647
				)
			AND	(
				tblResource_Contact.Resrc_tp	= Resrc_tp
			OR	Resrc_tp	= '-2147483647'
				)
			AND	(
				tblResource_Contact.Contact_id	= Contact_id
			OR	Contact_id	=  -2147483647
				)
			AND	(
				tblResource_Contact.Contact_tp	= Contact_tp
			OR	Contact_tp	= '-2147483647'
				)
			AND	(
				tblResource_Contact.Contact_nm	= Contact_nm
			OR	Contact_nm	= '-2147483647'
				)
			AND	(
				tblResource_Contact.Contact_cd	= Contact_cd
			OR	Contact_cd	= '-2147483647'
				)
			AND	(
				tblResource_Contact.Alias_nm	= Alias_nm
			OR	Alias_nm	= '-2147483647'
				)
			AND	(
				tblResource_Contact.Address_nm	LIKE CONCAT('%', Address_nm, '%')
			OR	Address_nm	= '-2147483647'
				)
			AND	(
				tblResource_Contact.City_cd	LIKE CONCAT('%', City_cd, '%')
			OR	City_cd	= '-2147483647'
				)
			AND	(
				tblResource_Contact.State_cd	LIKE CONCAT('%', State_cd, '%')
			OR	State_cd	= '-2147483647'
				)
			AND	(
				tblResource_Contact.ZIP_cd	LIKE CONCAT('%', ZIP_cd, '%')
			OR	ZIP_cd	= '-2147483647'
				)
			AND	(
				tblResource_Contact.Phone_cd	LIKE CONCAT('%', Phone_cd, '%')
			OR	Phone_cd	= '-2147483647'
				)
			AND	(
				tblResource_Contact.GPS_cd	LIKE CONCAT('%', GPS_cd, '%')
			OR	GPS_cd	= '-2147483647'
				)
			AND	(
				tblResource_Contact.ADD_dm	= ADD_dm
			OR	ADD_dm	= '0000-00-00 00:00:00'
				)
			AND	(
				tblResource_Contact.ADD_nm	= ADD_nm
			OR	ADD_nm	= '-2147483647'
				)
			AND	(
				tblResource_Contact.UPD_dm	= UPD_dm
			OR	UPD_dm	= '0000-00-00 00:00:00'
				)
			AND	(
				tblResource_Contact.UPD_nm	= UPD_nm
			OR	UPD_nm	= '-2147483647'
				)
			AND	(
				tblResource_Contact.DEL_dm	= DEL_dm
			OR	DEL_dm	= '0000-00-00 00:00:00'
				)
			AND	(
				tblResource_Contact.DEL_nm	= DEL_nm
			OR	DEL_nm	= '-2147483647'
				)
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
END	RSP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure rspUser */

/*!50003 DROP PROCEDURE IF EXISTS  rspUser */;

DELIMITER $$

/*!50003 CREATE PROCEDURE rspUser(
	User_id		INT SIGNED
,	User_tp		VARCHAR(64)
,	User_nm		VARCHAR(256)
,	User_cd		VARCHAR(128)
,	Hashed_cd	VARCHAR(128)
,	Person_nm	VARCHAR(256)
,	Email_nm	VARCHAR(256)
,	Challenge_cd	VARCHAR(128)
,	Response_cd	VARCHAR(128)
,		Key_cd		VARCHAR(16)		-- = 'PK'	-- Search key code
,	OUT 	RowExists_fg	TINYINT	
)
BEGIN
/*
**	Name:		rspUser
**	Type:		DB API Procedure: Referential 
**	Purpose:	Check existence of a record in tblUser
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**	Generated:	7/9/2013
**
**	Modified:	7/9/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
###############################################################################
RSP:
BEGIN
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'PK';	END IF;
	IF User_id IS NULL OR User_id = 0 THEN SET User_id =  -2147483647;	END IF;
	IF User_tp IS NULL OR User_tp = '' THEN SET User_tp = '-2147483647';	END IF;
	IF User_nm IS NULL OR User_nm = '' THEN SET User_nm = '-2147483647';	END IF;
	IF User_cd IS NULL OR User_cd = '' THEN SET User_cd = '-2147483647';	END IF;
	IF Hashed_cd IS NULL OR Hashed_cd = '' THEN SET Hashed_cd = '-2147483647';	END IF;
	IF Person_nm IS NULL OR Person_nm = '' THEN SET Person_nm = '-2147483647';	END IF;
	IF Email_nm IS NULL OR Email_nm = '' THEN SET Email_nm = '-2147483647';	END IF;
	IF Challenge_cd IS NULL OR Challenge_cd = '' THEN SET Challenge_cd = '-2147483647';	END IF;
	IF Response_cd IS NULL OR Response_cd = '' THEN SET Response_cd = '-2147483647';	END IF;
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF 	Key_cd	= 'PK'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblUser
			WHERE
				tblUser.User_id	= User_id
			AND	tblUser.User_tp	= User_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd = 'FK1'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblUser
			WHERE
				tblUser.User_tp	= User_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd = 'FK2'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblUser
			WHERE
				tblUser.User_id	= User_id
			AND	tblUser.User_tp	= User_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Alternate Key lookup
	#######################################################################
	IF	Key_cd = 'AK'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblUser
			WHERE
				tblUser.User_tp	= User_tp
			AND	tblUser.User_nm	= User_nm
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd	= 'AL'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblUser
			WHERE
				(
				User_id	= User_id
			OR	User_id	=  -2147483647
				)
			AND	(
				User_tp	= User_tp
			OR	User_tp	= '-2147483647'
				)
			AND	(
				User_nm	= User_nm
			OR	User_nm	= '-2147483647'
				)
			AND	(
				User_cd	= User_cd
			OR	User_cd	= '-2147483647'
				)
			AND	(
				Hashed_cd	= Hashed_cd
			OR	Hashed_cd	= '-2147483647'
				)
			AND	(
				Person_nm	LIKE CONCAT('%', Person_nm, '%')
			OR	Person_nm	= '-2147483647'
				)
			AND	(
				Email_nm	= Email_nm
			OR	Email_nm	= '-2147483647'
				)
			AND	(
				Challenge_cd	= Challenge_cd
			OR	Challenge_cd	= '-2147483647'
				)
			AND	(
				Response_cd	= Response_cd
			OR	Response_cd	= '-2147483647'
				)
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
END	RSP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure rspUserType */

/*!50003 DROP PROCEDURE IF EXISTS  rspUserType */;

DELIMITER $$

/*!50003 CREATE PROCEDURE rspUserType(
	User_tp		VARCHAR(64)		
,	Key_cd		VARCHAR(16)		-- = 'PK'	-- Search key code
,	OUT 	RowExists_fg	TINYINT	
)
BEGIN
/*
**	Name:		rspUserType
**	Type:		DB API Procedure: Referential 
**	Purpose:	Check existence of a record in tblUserType
**	Author:		Solomon S. Shacter
**	Generated:	7/2/2013
**
**	Modified:	7/2/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
###############################################################################
RSP:
BEGIN
	IF Key_cd IS NULL OR Key_cd = '' THEN SET Key_cd = 'PK';	END IF;
	IF User_tp IS NULL OR User_tp = '' THEN SET User_tp = '-2147483647';	END IF;
	#######################################################################
	-- Primary Key lookup
	#######################################################################
	IF 	Key_cd	= 'PK'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblUserType
			WHERE
				tblUserType.User_tp	= User_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Foreign Key lookup
	#######################################################################
	IF	Key_cd = 'FK1'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblUserType
			WHERE
				tblUserType.User_tp	= User_tp
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
	-- Attribute lookup
	#######################################################################
	IF	Key_cd	= 'AL'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM	tblUserType
			WHERE
				(
				User_tp	= User_tp
			OR	User_tp	= '-2147483647'
				)
		)
		THEN
			SET RowExists_fg	= 1;
		ELSE
			SET RowExists_fg	= 0;
		END IF;
		LEAVE RSP;
	END IF;
	#######################################################################
END	RSP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure uspCompany */

/*!50003 DROP PROCEDURE IF EXISTS  uspCompany */;

DELIMITER $$

/*!50003 CREATE PROCEDURE uspCompany(
	Company_id		INT SIGNED		-- PK1 
,	Company_tp		VARCHAR(64)		-- PK2 AK1
,	Company_nm		VARCHAR(256)		--  AK2
,	Company_cd		VARCHAR(128)	
,	Company_tx		MEDIUMTEXT	
,	CompanyADD_dm		DATETIME	
,	CompanyADD_nm		VARCHAR(256)	
,	CompanyUPD_dm		DATETIME	
,	CompanyUPD_nm		VARCHAR(256)	
,	CompanyDEL_dm		DATETIME	
,	CompanyDEL_nm		VARCHAR(256)	
,	ParentCompany_tp		VARCHAR(64)	
,	CompanyType_tx		MEDIUMTEXT	
,	CompanyTypeLeft_id		INT SIGNED	
,	CompanyTypeRight_id		INT SIGNED	
,	CompanyTypeLevel_id		INT SIGNED	
,	CompanyTypeOrder_id		INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		uspCompany
**	Type:		DB API procedure: Insert
**	Purpose:	To update Company data in tblCompany
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	6/14/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblCompany';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'UPDATE';
DECLARE	Proc_nm		VARCHAR(255) DEFAULT 'uspCompany';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
USP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	IF Company_id IS NULL OR Company_id = 0 THEN SET Company_id =  -2147483647;	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = '-2147483647';	END IF;
	IF Company_nm IS NULL OR Company_nm = '' THEN SET Company_nm = '-2147483647';	END IF;
	IF Company_cd IS NULL OR Company_cd = '' THEN SET Company_cd = '-2147483647';	END IF;
	IF Company_tx IS NULL OR Company_tx = '' THEN SET Company_tx = '-2147483647';	END IF;
	IF CompanyADD_dm IS NULL OR CompanyADD_dm = '' THEN SET CompanyADD_dm = '0000-00-00 00:00:00';	END IF;
	IF CompanyADD_nm IS NULL OR CompanyADD_nm = '' THEN SET CompanyADD_nm = '-2147483647';	END IF;
	IF CompanyUPD_dm IS NULL OR CompanyUPD_dm = '' THEN SET CompanyUPD_dm = '0000-00-00 00:00:00';	END IF;
	IF CompanyUPD_nm IS NULL OR CompanyUPD_nm = '' THEN SET CompanyUPD_nm = '-2147483647';	END IF;
	IF CompanyDEL_dm IS NULL OR CompanyDEL_dm = '' THEN SET CompanyDEL_dm = '0000-00-00 00:00:00';	END IF;
	IF CompanyDEL_nm IS NULL OR CompanyDEL_nm = '' THEN SET CompanyDEL_nm = '-2147483647';	END IF;
	IF ParentCompany_tp IS NULL OR ParentCompany_tp = '' THEN SET ParentCompany_tp = '-2147483647';	END IF;
	IF CompanyType_tx IS NULL OR CompanyType_tx = '' THEN SET CompanyType_tx = '-2147483647';	END IF;
	IF CompanyTypeLeft_id IS NULL OR CompanyTypeLeft_id = 0 THEN SET CompanyTypeLeft_id =  -2147483647;	END IF;
	IF CompanyTypeRight_id IS NULL OR CompanyTypeRight_id = 0 THEN SET CompanyTypeRight_id =  -2147483647;	END IF;
	IF CompanyTypeLevel_id IS NULL OR CompanyTypeLevel_id = 0 THEN SET CompanyTypeLevel_id =  -2147483647;	END IF;
	IF CompanyTypeOrder_id IS NULL OR CompanyTypeOrder_id = 0 THEN SET CompanyTypeOrder_id =  -2147483647;	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Return error if Primary Key TABLE record does NOT exist
	#######################################################################
	SET 	@PK1	= CONCAT(Company_id,",",Company_tp);
	-- --------------------------------------------------------------------
	CALL	rspCompany
	(
		@Company_id	:= Company_id
	,	@Company_tp	:= Company_tp
	,	@Company_nm	:= Company_nm
	,	@Company_cd	:= Company_cd
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 0	-- If PK row does not exist then return with error
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errPKNotExist
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		,	@Key_nm		:= @PK1
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Validate attributes
	#######################################################################
	--	Set the VSP INOUT parameters to the proc IN parameters
	-- --------------------------------------------------------------------
	CALL	vspCompany
	(
		@Company_id	:= Company_id
	,	@Company_tp	:= Company_tp
	,	@Company_nm	:= Company_nm
	,	@Company_cd	:= Company_cd
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= Proc_nm
		);
		LEAVE	USP;
	END IF;
	--	Set the proc IN parameters to the VSP INOUT parameters
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET 	@FK1	= CONCAT(Company_tp);
	SET 	@FK2	= CONCAT(Company_id,",",Company_tp);
	-- --------------------------------------------------------------------
	IF
		Mode_cd	= 'R'
	THEN
		--
		--	RESTRICT MODE:	tblCompanyType
		--
		CALL	rspCompanyType
		(
			@Company_tp	:= Company_tp
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblCompanyType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= 'tblCompanyType'
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= 'tblCompanyType'
			);
			LEAVE	USP;
		END IF;
		--
		--	RESTRICT MODE:	tblResource
		--
		CALL	rspResource
		(
			@Resrc_id	:= Company_id
		,	@Resrc_tp	:= Company_tp
		,	@Resrc_tx	:= Company_tx
		,	@ADD_dm		:= CompanyADD_dm
		,	@ADD_nm		:= CompanyADD_nm
		,	@UPD_dm		:= CompanyUPD_dm
		,	@UPD_nm		:= CompanyUPD_nm
		,	@DEL_dm		:= CompanyDEL_dm
		,	@DEL_nm		:= CompanyDEL_nm
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblResource not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= 'tblResource'
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK2
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= 'tblResource'
			);
			LEAVE	USP;
		END IF;
	END IF;
	-- --------------------------------------------------------------------
	-- --------------------------------------------------------------------
	IF
		Mode_cd	= 'C'
	THEN
		--
		--	CASCADE MODE:	tblCompanyType
		--
		CALL	uspCompanyType
		(
			@Company_tp		:= Company_tp
		,	@ParentCompany_tp	:= ParentCompany_tp
		,	@CompanyType_tx		:= CompanyType_tx
		,	@CompanyTypeLeft_id	:= CompanyTypeLeft_id
		,	@CompanyTypeRight_id	:= CompanyTypeRight_id
		,	@CompanyTypeLevel_id	:= CompanyTypeLevel_id
		,	@CompanyTypeOrder_id	:= CompanyTypeOrder_id
		,	@CallingProc_nm	:= CallingProc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= 'R'	-- This Table Is Restricted and Does Not Allow A Cascade From an FK Table.
		);
		--
		--	CASCADE MODE:	tblResource
		--
		CALL	uspResource
		(
			@Resrc_id	:= Company_id
		,	@Resrc_tp	:= Company_tp
		,	@Resrc_tx	:= Company_tx
		,	@ADD_dm		:= CompanyADD_dm
		,	@ADD_nm		:= CompanyADD_nm
		,	@UPD_dm		:= CompanyUPD_dm
		,	@UPD_nm		:= CompanyUPD_nm
		,	@DEL_dm		:= CompanyDEL_dm
		,	@DEL_nm		:= CompanyDEL_nm
		,	@ParentResrc_tp	:= ParentCompany_tp
		,	@ResrcType_tx	:= CompanyType_tx
		,	@Left_id	:= CompanyTypeLeft_id
		,	@Right_id	:= CompanyTypeRight_id
		,	@Level_id	:= CompanyTypeLevel_id
		,	@Order_id	:= CompanyTypeOrder_id
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		);
	END IF;
	#######################################################################
	-- Update NON-KEY values
	#######################################################################
	-- --------------------------------------------------------------------
	-- Invoke an UPDATE when a non-key attribute is actually modified.
	-- --------------------------------------------------------------------
	IF 	
		Company_nm	= '-2147483647'
	AND 	Company_cd	= '-2147483647'
	THEN
		LEAVE 	USP;
	END IF;
	-- --------------------------------------------------------------------
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedEvent
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
	UPDATE
		tblCompany
	SET	
		tblCompany.Company_nm	=
		CASE
			WHEN	Company_nm	= '-2147483647'
			THEN	tblCompany.Company_nm
			ELSE 	Company_nm
		END
	,	tblCompany.Company_cd	=
		CASE
			WHEN	Company_cd	= '-2147483647'
			THEN	tblCompany.Company_cd
			ELSE 	Company_cd
		END
	WHERE
		tblCompany.Company_id	= Company_id
	AND	tblCompany.Company_tp	= Company_tp
	;
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
END USP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure uspCompanyType */

/*!50003 DROP PROCEDURE IF EXISTS  uspCompanyType */;

DELIMITER $$

/*!50003 CREATE PROCEDURE uspCompanyType(
	Company_tp		VARCHAR(64)		-- PK1 
,	ParentCompany_tp		VARCHAR(64)	
,	CompanyType_tx		MEDIUMTEXT	
,	CompanyTypeLeft_id		INT SIGNED	
,	CompanyTypeRight_id		INT SIGNED	
,	CompanyTypeLevel_id		INT SIGNED	
,	CompanyTypeOrder_id		INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		uspCompanyType
**	Type:		DB API procedure: Insert
**	Purpose:	To insert CompanyType data into tblCompanyType
**	Author:		Solomon S. Shacter
**	Organiztion:	Innovella, Inc.
**
**	Modified:	6/14/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblCompanyType';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'UPDATE';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'uspCompanyType';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
USP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = '-2147483647';	END IF;
	IF ParentCompany_tp IS NULL OR ParentCompany_tp = '' THEN SET ParentCompany_tp = '-2147483647';	END IF;
	IF CompanyType_tx IS NULL OR CompanyType_tx = '' THEN SET CompanyType_tx = '-2147483647';	END IF;
	IF CompanyTypeLeft_id IS NULL OR CompanyTypeLeft_id = 0 THEN SET CompanyTypeLeft_id =  -2147483647;	END IF;
	IF CompanyTypeRight_id IS NULL OR CompanyTypeRight_id = 0 THEN SET CompanyTypeRight_id =  -2147483647;	END IF;
	IF CompanyTypeLevel_id IS NULL OR CompanyTypeLevel_id = 0 THEN SET CompanyTypeLevel_id =  -2147483647;	END IF;
	IF CompanyTypeOrder_id IS NULL OR CompanyTypeOrder_id = 0 THEN SET CompanyTypeOrder_id =  -2147483647;	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Return error if Primary Key TABLE record does NOT exist
	#######################################################################
	SET 	@PK1	= CONCAT(Company_tp);
	-- --------------------------------------------------------------------
	CALL	rspCompanyType
	(
		@Company_tp	:= Company_tp
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 0	-- If PK row does not exist then return with error
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errPKNotExist
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		,	@Key_nm		:= @PK1
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################
	#######################################################################
	-- Validate attributes
	#######################################################################
	CALL	vspCompanyType
	(
		@Company_tp	:= Company_tp
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= Proc_nm
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET	@FK1	= CONCAT(Company_tp);
	-- --------------------------------------------------------------------
	--
	--	RESTRICT MODE:	tblResourceType
	--
	IF
		Mode_cd	= 'R'
	THEN
		CALL	rspResourceType
		(
			@Resrc_tp	:= Company_tp
		,	@ParentResrc_tp	:= ParentCompany_tp
		,	@ResrcType_tx	:= CompanyType_tx
		,	@Left_id	:= CompanyTypeLeft_id
		,	@Right_id	:= CompanyTypeRight_id
		,	@Level_id	:= CompanyTypeLevel_id
		,	@Order_id	:= CompanyTypeOrder_id
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblResourceType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= 'tblResourceType'
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= 'tblResourceType'
			);
			LEAVE	USP;
		END IF;
	END IF;
	--
	--	CASCADE MODE:	tblResourceType
	--
	IF
		Mode_cd	= 'C'
	THEN
		CALL	uspResourceType
		(
			@Resrc_tp	:= Company_tp
		,	@ParentResrc_tp	:= ParentCompany_tp
		,	@ResrcType_tx	:= CompanyType_tx
		,	@Left_id	:= CompanyTypeLeft_id
		,	@Right_id	:= CompanyTypeRight_id
		,	@Level_id	:= CompanyTypeLevel_id
		,	@Order_id	:= CompanyTypeOrder_id
		,	@CallingProc_nm	:= CallingProc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= 'R'	-- This Table Is Restricted and Does Not Allow A Cascade From an FK Table.
		);
	END IF;
	#######################################################################
	-- Update NON-KEY values
	#######################################################################
	-- --------------------------------------------------------------------
	-- Invoke an UPDATE when a non-key attribute is actually modified.
	-- --------------------------------------------------------------------
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCompany
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
END	USP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure uspResource */

/*!50003 DROP PROCEDURE IF EXISTS  uspResource */;

DELIMITER $$

/*!50003 CREATE PROCEDURE uspResource(
	Resrc_id		INT SIGNED		-- PK1 
,	Resrc_tp		VARCHAR(64)		-- PK2 AK1
,	Resrc_tx		MEDIUMTEXT	
,	ADD_dm		DATETIME	
,	ADD_nm		VARCHAR(128)	
,	UPD_dm		DATETIME	
,	UPD_nm		VARCHAR(128)	
,	DEL_dm		DATETIME	
,	DEL_nm		VARCHAR(128)	
,	ParentResrc_tp		VARCHAR(64)	
,	ResrcType_tx		MEDIUMTEXT	
,	Left_id		INT SIGNED	
,	Right_id		INT SIGNED	
,	Level_id		INT SIGNED	
,	Order_id		INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		uspResource
**	Type:		DB API procedure: Insert
**	Purpose:	To insert Resource data into tblResource
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	4/12/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResource';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'UPDATE';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'uspResource';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
USP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF CallingProc_nm IS NULL OR CallingProc_nm = '' THEN SET CallingProc_nm = '';	END IF;
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	IF Resrc_id IS NULL OR Resrc_id = 0 THEN SET Resrc_id =  -2147483647;	END IF;
	IF Resrc_tp IS NULL OR Resrc_tp = '' THEN SET Resrc_tp = '-2147483647';	END IF;
	IF Resrc_tx IS NULL OR Resrc_tx = '' THEN SET Resrc_tx = '-2147483647';	END IF;
	IF ADD_dm IS NULL OR ADD_dm = CAST('' AS DATETIME) THEN SET ADD_dm = '0000-00-00 00:00:00';	END IF;
	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = '-2147483647';	END IF;
	IF UPD_dm IS NULL OR UPD_dm = CAST('' AS DATETIME) THEN SET UPD_dm = '0000-00-00 00:00:00';	END IF;
	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = '-2147483647';	END IF;
	IF DEL_dm IS NULL OR DEL_dm = CAST('' AS DATETIME) THEN SET DEL_dm = '0000-00-00 00:00:00';	END IF;
	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = '-2147483647';	END IF;
	IF ParentResrc_tp IS NULL OR ParentResrc_tp = '' THEN SET ParentResrc_tp = '-2147483647';	END IF;
	IF ResrcType_tx IS NULL OR ResrcType_tx = '' THEN SET ResrcType_tx = '-2147483647';	END IF;
	IF Left_id IS NULL OR Left_id = 0 THEN SET Left_id =  -2147483647;	END IF;
	IF Right_id IS NULL OR Right_id = 0 THEN SET Right_id =  -2147483647;	END IF;
	IF Level_id IS NULL OR Level_id = 0 THEN SET Level_id =  -2147483647;	END IF;
	IF Order_id IS NULL OR Order_id = 0 THEN SET Order_id =  -2147483647;	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Return error if Primary Key TABLE record does NOT exist
	#######################################################################
	SET 	@PK1	= CONCAT(Resrc_id,",",Resrc_tp);
	-- --------------------------------------------------------------------
	CALL	rspResource
	(
		@Resrc_id	:= Resrc_id
	,	@Resrc_tp	:= Resrc_tp
	,	@Resrc_tx	:= Resrc_tx
	,	@ADD_dm		:= ADD_dm
	,	@ADD_nm		:= ADD_nm
	,	@UPD_dm		:= UPD_dm
	,	@UPD_nm		:= UPD_nm
	,	@DEL_dm		:= DEL_dm
	,	@DEL_nm		:= DEL_nm
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 0	-- If PK row does not exist then return with error
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errPKNotExist
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		,	@Key_nm		:= @PK1
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Validate attributes
	#######################################################################
	SET 	@ADD_dm	= ADD_dm;
	SET 	@ADD_nm	= ADD_nm;
	SET 	@UPD_dm	= UPD_dm;
	SET 	@UPD_nm	= UPD_nm;
	SET 	@DEL_dm	= DEL_dm;
	SET 	@DEL_nm	= DEL_nm;
	CALL	vspResource
	(
		@Resrc_id	:= Resrc_id
	,	@Resrc_tp	:= Resrc_tp
	,	@Resrc_tx	:= Resrc_tx
	,	@ADD_dm
	,	@ADD_nm
	,	@UPD_dm
	,	@UPD_nm
	,	@DEL_dm
	,	@DEL_nm
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= 'vspResource'
		);
		LEAVE	USP;
	END IF;
	SET 	ADD_dm	= @ADD_dm;
	SET 	ADD_nm	= @ADD_nm;
	SET 	UPD_dm	= @UPD_dm;
	SET 	UPD_nm	= @UPD_nm;
	SET 	DEL_dm	= @DEL_dm;
	SET 	DEL_nm	= @DEL_nm;
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET 	@FK1	= CONCAT(Resrc_tp);
	-- --------------------------------------------------------------------
	--
	--	RESTRICT MODE:	tblResourceType
	--
	IF
		Mode_cd	= 'R'
	THEN
		CALL	rspResourceType
		(
			@Resrc_tp	:= Resrc_tp
		,	@ParentResrc_tp	:= ParentResrc_tp
		,	@ResrcType_tx	:= ResrcType_tx
		,	@Left_id	:= Left_id
		,	@Right_id	:= Right_id
		,	@Level_id	:= Level_id
		,	@Order_id	:= Order_id
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblResourceType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= 'tblResourceType'
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= 'tblResourceType'
			);
			LEAVE	USP;
		END IF;
	END IF;
	--
	--	CASCADE MODE:	tblResourceType
	--
	IF
		Mode_cd	= 'C'
	THEN
		CALL	uspResourceType
		(
			@Resrc_tp	:= Resrc_tp
		,	@ParentResrc_tp	:= ParentResrc_tp
		,	@ResrcType_tx	:= ResrcType_tx
		,	@Left_id	:= Left_id
		,	@Right_id	:= Right_id
		,	@Level_id	:= Level_id
		,	@Order_id	:= Order_id
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= 'R'	-- This Table Is Restricted and Does Not Allow A Cascade From an FK Table.
		);
	END IF;
	#######################################################################
	-- Update NON-KEY values
	#######################################################################
	-- --------------------------------------------------------------------
	-- Invoke an UPDATE when a non-key attribute is actually modified.
	-- --------------------------------------------------------------------
	IF 	
	(
	 	Resrc_tx	= '-2147483647'
	AND 	ADD_dm		= '0000-00-00 00:00:00'
	AND 	ADD_nm		= '-2147483647'
	AND 	UPD_dm		= '0000-00-00 00:00:00'
	AND 	UPD_nm		= '-2147483647'
 	AND 	DEL_dm		= '0000-00-00 00:00:00'
 	AND 	DEL_nm		= '-2147483647'
	)
	THEN
		LEAVE 	USP;
	END IF;
	-- --------------------------------------------------------------------
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedEvent
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
	UPDATE
		tblResource
	SET	
		tblResource.Resrc_tx	=
		CASE
			WHEN	Resrc_tx	= '-2147483647'
			THEN	tblResource.Resrc_tx
			ELSE 	Resrc_tx
		END
	,	tblResource.ADD_dm	=
		CASE
			WHEN	ADD_dm	= '0000-00-00 00:00:00'
			THEN	tblResource.ADD_dm
			ELSE 	ADD_dm
		END
	,	tblResource.ADD_nm	=
		CASE
			WHEN	ADD_nm	= '-2147483647'
			THEN	tblResource.ADD_nm
			ELSE 	ADD_nm
		END
	,	tblResource.UPD_dm	=
		CASE
			WHEN	UPD_dm	= '0000-00-00 00:00:00'
			THEN	tblResource.UPD_dm
			ELSE 	UPD_dm
		END
	,	tblResource.UPD_nm	=
		CASE
			WHEN	UPD_nm	= '-2147483647'
			THEN	tblResource.UPD_nm
			ELSE 	UPD_nm
		END
	,	tblResource.DEL_dm	=
		CASE
			WHEN	DEL_dm	= '0000-00-00 00:00:00'
			THEN	tblResource.DEL_dm
			ELSE 	DEL_dm
		END
	,	tblResource.DEL_nm	=
		CASE
			WHEN	DEL_nm	= '-2147483647'
			THEN	tblResource.DEL_nm
			ELSE 	DEL_nm
		END
	WHERE
		tblResource.Resrc_id	= Resrc_id
	AND	tblResource.Resrc_tp	= Resrc_tp
	;
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
END USP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure uspResourceType */

/*!50003 DROP PROCEDURE IF EXISTS  uspResourceType */;

DELIMITER $$

/*!50003 CREATE PROCEDURE uspResourceType(
	Resrc_tp		VARCHAR(64)		-- PK1 AK1
,	ParentResrc_tp		VARCHAR(64)	
,	ResrcType_tx		MEDIUMTEXT	
,	Left_id			INT SIGNED
,	Right_id		INT SIGNED	
,	Level_id		INT SIGNED	
,	Order_id		INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd	VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		uspResourceType
**	Type:		DB API procedure: Insert
**	Purpose:	To insert ResourceType data into tblResourceType
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	4/9/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResourceType';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'UPDATE';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'uspResourceType';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
USP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	IF Resrc_tp IS NULL OR Resrc_tp = '' THEN SET Resrc_tp = '-2147483647';	END IF;
	IF ParentResrc_tp IS NULL OR ParentResrc_tp = '' THEN SET ParentResrc_tp = '-2147483647';	END IF;
	IF ResrcType_tx IS NULL OR ResrcType_tx = '' THEN SET ResrcType_tx = '-2147483647';	END IF;
	IF Left_id IS NULL OR Left_id = 0 THEN SET Left_id =  -2147483647;	END IF;
	IF Right_id IS NULL OR Right_id = 0 THEN SET Right_id =  -2147483647;	END IF;
	IF Level_id IS NULL OR Level_id = 0 THEN SET Level_id =  -2147483647;	END IF;
	IF Order_id IS NULL OR Order_id = 0 THEN SET Order_id =  -2147483647;	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
	SET 	@PK1	= CONCAT(Resrc_tp);
	-- --------------------------------------------------------------------
	CALL	rspResourceType
	(
		@Resrc_tp	:= Resrc_tp
	,	@ParentResrc_tp	:= ParentResrc_tp
	,	@ResrcType_tx	:= ResrcType_tx
	,	@Left_id	:= Left_id
	,	@Right_id	:= Right_id
	,	@Level_id	:= Level_id
	,	@Order_id	:= Order_id
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 0	-- If PK row does not exist then return with error
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errPKNotExist
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		,	@Key_nm		:= @PK1
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Validate attributes
	#######################################################################
	CALL	vspResourceType
	(
		@Resrc_tp	:= Resrc_tp
	,	@ParentResrc_tp	:= ParentResrc_tp
	,	@ResrcType_tx	:= ResrcType_tx
	,	@Left_id	:= Left_id
	,	@Right_id	:= Right_id
	,	@Level_id	:= Level_id
	,	@Order_id	:= Order_id
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= Proc_nm
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET	@FK1	= CONCAT(ParentResrc_tp);
	-- --------------------------------------------------------------------
	--
	--	RESTRICT MODE:	tblResourceType
	--
	IF
		Mode_cd	= 'R'
	AND	ParentResrc_tp	<> '-2147483647'
	THEN
		CALL	rspResourceType
		(
			@Resrc_tp	:= ParentResrc_tp
		,	@ParentResrc_tp	:= ParentResrc_tp
		,	@ResrcType_tx	:= ResrcType_tx
		,	@Left_id	:= Left_id
		,	@Right_id	:= Right_id
		,	@Level_id	:= Level_id
		,	@Order_id	:= Order_id
		,	@Key_cd		:= @Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblResourceType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= SYSTABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= SYSTABLE
			);
			LEAVE	USP;
		END IF;
	END IF;
	--
	--	CASCADE MODE:	tblResourceType
	--
	IF
	(
		Mode_cd	= 'C'
	AND	ParentResrc_tp	<> '-2147483647'
	)
	THEN
		CALL	rspResourceType
		(
			@Resrc_tp	:= ParentResrc_tp
		,	@ParentResrc_tp	:= ParentResrc_tp
		,	@ResrcType_tx	:= ResrcType_tx
		,	@Left_id	:= Left_id
		,	@Right_id	:= Right_id
		,	@Level_id	:= Level_id
		,	@Order_id	:= Order_id
		,	@Key_cd		:= @Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblResourceType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= SYSTABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= SYSTABLE
			);
			LEAVE	USP;
		END IF;
	END IF;
	#######################################################################
	-- Update NON-KEY values
	#######################################################################
	-- --------------------------------------------------------------------
	-- Invoke an UPDATE when a non-key attribute is actually modified.
	-- --------------------------------------------------------------------
	IF 
	(
		ParentResrc_tp	= '-2147483647'
	AND	ResrcType_tx	= '-2147483647'
	AND	Left_id		= -2147483647
	AND	Right_id	= -2147483647
	AND	Level_id	= -2147483647
	AND	Order_id	= -2147483647
	)
	THEN
		LEAVE 	USP;
	END IF;
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedEvent
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
	UPDATE
		tblResourceType
	SET	
		tblResourceType.ParentResrc_tp	=
		CASE
			WHEN	ParentResrc_tp	= '-2147483647'
			THEN	tblResourceType.ParentResrc_tp
			ELSE 	ParentResrc_tp
		END
	,	tblResourceType.ResrcType_tx	=
		CASE
			WHEN	ResrcType_tx	= '-2147483647'
			THEN	tblResourceType.ResrcType_tx
			ELSE 	ResrcType_tx
		END
	,	tblResourceType.Left_id	=
		CASE
			WHEN	Left_id	= -2147483647
			THEN	tblResourceType.Left_id
			ELSE 	Left_id
		END
	,	tblResourceType.Right_id	=
		CASE
			WHEN	Right_id	= -2147483647
			THEN	tblResourceType.Right_id
			ELSE 	Right_id
		END
	,	tblResourceType.Level_id	=
		CASE
			WHEN	Level_id	= -2147483647
			THEN	tblResourceType.Level_id
			ELSE 	Level_id
		END
	,	tblResourceType.Order_id	=
		CASE
			WHEN	Order_id	= -2147483647
			THEN	tblResourceType.Order_id
			ELSE 	Order_id
		END
	WHERE
		tblResourceType.Resrc_tp	= Resrc_tp
	;
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
END USP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure uspResource_Company */

/*!50003 DROP PROCEDURE IF EXISTS  uspResource_Company */;

DELIMITER $$

/*!50003 CREATE PROCEDURE uspResource_Company(
	Resrc_id	INT SIGNED		-- PK1 
,	Resrc_tp	VARCHAR(64)		-- PK2 AK1
,	Company_id	INT SIGNED		-- PK1 
,	Company_tp	VARCHAR(64)		-- PK2 AK1
,	Resrc_nm	VARCHAR(256)		--  AK2
,	Resrc_cd	VARCHAR(128)	
,	Alias_nm	VARCHAR(256)
,	Company_nm	VARCHAR(256)
,	Company_cd	VARCHAR(128)	
,	Resrc_tx	MEDIUMTEXT	
,	Company_tx	MEDIUMTEXT	
,	ADD_dm		DATETIME	
,	ADD_nm		VARCHAR(128)	
,	UPD_dm		DATETIME	
,	UPD_nm		VARCHAR(128)	
,	DEL_dm		DATETIME	
,	DEL_nm		VARCHAR(128)	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		uspResource_Company
**	Type:		DB API procedure: Insert
**	Purpose:	To insert Resource data into tblResource_Company
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	4/12/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResource_Company';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'UPDATE';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'uspResource_Company';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
DECLARE	PK1		VARCHAR(255) DEFAULT CONCAT(Resrc_id,",",Resrc_tp,",",Company_id,",",Company_tp);
DECLARE	FK1		VARCHAR(255) DEFAULT CONCAT(Resrc_tp,",",Company_tp);
DECLARE	FK2		VARCHAR(255) DEFAULT CONCAT(Resrc_id,",",Resrc_tp);
DECLARE	FK3		VARCHAR(255) DEFAULT CONCAT(Company_id,",",Company_tp);
DECLARE	AK1		VARCHAR(255) DEFAULT CONCAT(Resrc_tp,",",Company_id,",",Company_tp,",",Resrc_nm);
DECLARE	AK2		VARCHAR(255) DEFAULT CONCAT(Resrc_tp,",",Company_tp,",",Company_nm,",",Resrc_nm);
###############################################################################
usp:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF CallingProc_nm IS NULL OR CallingProc_nm = '' THEN SET CallingProc_nm = '';	END IF;
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	IF Resrc_id IS NULL OR Resrc_id = 0 THEN SET Resrc_id =  -2147483647;	END IF;
	IF Resrc_tp IS NULL OR Resrc_tp = '' THEN SET Resrc_tp = '-2147483647';	END IF;
	IF Company_id IS NULL OR Company_id = 0 THEN SET Company_id =  -2147483647;	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = '-2147483647';	END IF;
	IF Resrc_nm IS NULL OR Resrc_nm = '' THEN SET Resrc_nm = '-2147483647';	END IF;
	IF Resrc_cd IS NULL OR Resrc_cd = '' THEN SET Resrc_cd = '-2147483647';	END IF;
	IF Alias_nm IS NULL OR Alias_nm = '' THEN SET Alias_nm = '-2147483647';	END IF;
	IF Company_nm IS NULL OR Company_nm = '' THEN SET Company_nm = '-2147483647';	END IF;
	IF Company_cd IS NULL OR Company_cd = '' THEN SET Company_cd = '-2147483647';	END IF;
	IF Resrc_tx IS NULL OR Resrc_tx = '' THEN SET Resrc_tx = '-2147483647';	END IF;
	IF Company_tx IS NULL OR Company_tx = '' THEN SET Company_tx = '-2147483647';	END IF;
	IF ADD_dm IS NULL THEN SET ADD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = '-2147483647';	END IF;
	IF UPD_dm IS NULL THEN SET UPD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = '-2147483647';	END IF;
	IF DEL_dm IS NULL THEN SET DEL_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = '-2147483647';	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= 'tblResource_Company'
		);
		LEAVE	usp;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
	CALL	rspResource_Company
	(
		@Resrc_id	:= Resrc_id
	,	@Resrc_tp	:= Resrc_tp
	,	@Company_id	:= Company_id
	,	@Company_tp	:= Company_tp
	,	@Resrc_nm	:= NULL
	,	@Resrc_cd	:= NULL
	,	@Alias_nm	:= NULL
	,	@ADD_dm	:= ADD_dm
	,	@ADD_nm	:= ADD_nm
	,	@UPD_dm	:= UPD_dm
	,	@UPD_nm	:= UPD_nm
	,	@DEL_dm	:= DEL_dm
	,	@DEL_nm	:= DEL_nm
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 0	-- If PK row dows not exists then return with error
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errPKNotExist
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		,	@Key_nm		:= @PK1
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Validate attributes
	#######################################################################
	SET 	@ADD_dm	= ADD_dm;
	SET 	@ADD_nm	= ADD_nm;
	SET 	@UPD_dm	= UPD_dm;
	SET 	@UPD_nm	= UPD_nm;
	SET 	@DEL_dm	= DEL_dm;
	SET 	@DEL_nm	= DEL_nm;
	CALL	vspResource_Company
	(
		@Resrc_id	:= Resrc_id
	,	@Resrc_tp	:= Resrc_tp
	,	@Company_id	:= Company_id
	,	@Company_tp	:= Company_tp
	,	@Resrc_nm	:= Resrc_nm
	,	@Resrc_cd	:= Resrc_cd
	,	@Alias_nm	:= Alias_nm	
	,	@ADD_dm
	,	@ADD_nm
	,	@UPD_dm
	,	@UPD_nm
	,	@DEL_dm
	,	@DEL_nm
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= 'vspResource_Company'
		);
		LEAVE	usp;
	END IF;
	SET 	ADD_dm	= @ADD_dm;
	SET 	ADD_nm	= @ADD_nm;
	SET 	UPD_dm	= @UPD_dm;
	SET 	UPD_nm	= @UPD_nm;
	SET 	DEL_dm	= @DEL_dm;
	SET 	DEL_nm	= @DEL_nm;
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET	@FK1	= CONCAT(Resrc_tp,",",Company_tp);
	SET	@FK2	= CONCAT(IFNULL(Resrc_id,"(null)"),",",Resrc_tp);
	SET 	@FK3	= CONCAT(IFNULL(Company_id,"(null)"),",",Company_tp);
	--
	--	RESTRICT MODE:
	--
	IF
		Mode_cd	= 'R'
	THEN
		SET 	@TABLE	= "tblResourceType_CompanyType";
		CALL	rspResourceType_CompanyType
		(
			@Resrc_tp	:= Resrc_tp
		,	@Company_tp	:= Company_tp
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	usp;
		END IF;
		SET 	@TABLE	= "tblCompany";
		CALL	rspCompany
		(
			@Company_id	:= Company_id
		,	@Company_tp	:= Company_tp
		,	@Company_nm	:= Company_nm
		,	@Company_cd	:= Company_cd
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK3
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	usp;
		END IF;
		SET 	@TABLE	= "tblResource";
		CALL	rspResource
		(
			@Resrc_id	:= Resrc_id
		,	@Resrc_tp	:= Resrc_tp
		,	@Resrc_tx	:= Resrc_tx
		,	@ADD_dm	:= ADD_dm
		,	@ADD_nm	:= ADD_nm
		,	@UPD_dm	:= UPD_dm
		,	@UPD_nm	:= UPD_nm
		,	@DEL_dm	:= DEL_dm
		,	@DEL_nm	:= DEL_nm
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK2
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	usp;
		END IF;
	END IF;
	--
	--	CASCADE MODE:
	--
	IF
		Mode_cd	= 'C'
	THEN
		--	-------------------------------------------------------
		SET 	@TABLE	= "tblCompany";
		--	-------------------------------------------------------
		CALL	uspCompany
		(
			@Company_id		:= Company_id
		,	@Company_tp		:= Company_tp
		,	@Company_nm		:= Company_nm
		,	@Company_cd		:= Company_cd
		,	@Company_tx		:= Company_tx
		,	@CompanyADD_dm		:= ADD_dm
		,	@CompanyADD_nm		:= ADD_nm
		,	@CompanyUPD_dm		:= UPD_dm
		,	@CompanyUPD_nm		:= UPD_dm
		,	@CompanyDEL_dm		:= DEL_dm
		,	@CompanyDEL_nm		:= DEL_nm
		,	@ParentCompany_tp	:= NULL
		,	@CompanyType_tx		:= NULL
		,	@CompanyLeft_id		:= NULL
		,	@CompanyRight_id	:= NULL
		,	@CompanyLevel_id	:= NULL
		,	@CompanyOrder_id	:= NULL
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		);
		--	-------------------------------------------------------
		SET 	@TABLE	= "tblResource";
		--	-------------------------------------------------------
		CALL	uspResource
		(
			@Resrc_id	:= Resrc_id
		,	@Resrc_tp	:= Resrc_tp
		,	@Resrc_tx	:= Resrc_tx
		,	@ADD_dm		:= ADD_dm
		,	@ADD_nm		:= ADD_nm
		,	@UPD_dm		:= UPD_dm
		,	@UPD_nm		:= UPD_nm
		,	@DEL_dm		:= DEL_dm
		,	@DEL_nm		:= DEL_nm
		,	@ParentResrc_tp	:= NULL
		,	@ResrcType_tx	:= NULL
		,	@Left_id	:= NULL
		,	@Right_id	:= NULL
		,	@Level_id	:= NULL
		,	@Order_id	:= NULL
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		);
		--	-------------------------------------------------------
		--	-------------------------------------------------------
	END IF;
	#######################################################################
	-- Update NON-KEY values
	#######################################################################
	-- --------------------------------------------------------------------
	-- Invoke an UPDATE when a non-key attribute if actually modified.
	-- --------------------------------------------------------------------
	IF
		Resrc_nm	= '-2147483647'
	AND	Resrc_cd	= '-2147483647'
	AND	Alias_nm	= '-2147483647'
-- 	AND	ADD_dm	= '0000-00-00 00:00:00'
-- 	AND	ADD_nm	= '-2147483647'
	AND	UPD_dm	= '0000-00-00 00:00:00'
	AND	UPD_nm	= '-2147483647'
	AND	DEL_dm	= '0000-00-00 00:00:00'
	AND	DEL_nm	= '-2147483647'
	THEN
		LEAVE	USP;
	END IF;
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedEvent
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
	UPDATE
		tblResource_Company
	SET
		tblResource_Company.Resrc_nm	= 
		CASE
			WHEN	Resrc_nm	= '-2147483647'
			THEN	tblResource_Company.Resrc_nm
			ELSE 	Resrc_nm
		END
	,	tblResource_Company.Resrc_cd	= 
		CASE
			WHEN	Resrc_cd	= '-2147483647'
			THEN	tblResource_Company.Resrc_cd
			ELSE 	Resrc_cd
		END
	,	tblResource_Company.Alias_nm	=
		CASE
			WHEN	Alias_nm	= '-2147483647'
			THEN	tblResource_Company.Alias_nm
			ELSE 	Alias_nm
		END
	,	tblResource_Company.UPD_dm	=
		CASE
			WHEN	UPD_dm	= '0000-00-00 00:00:00'
			THEN	tblResource_Company.UPD_dm
			ELSE 	UPD_dm
		END
	,	tblResource_Company.UPD_nm	=
		CASE
			WHEN	UPD_nm	= '-2147483647'
			THEN	tblResource_Company.UPD_nm
			ELSE 	UPD_nm
		END
	,	tblResource_Company.DEL_dm	=
		CASE
			WHEN	DEL_dm	= '0000-00-00 00:00:00'
			THEN	tblResource_Company.DEL_dm
			ELSE 	DEL_dm
		END
	,	tblResource_Company.DEL_nm	=
		CASE
			WHEN	DEL_nm	= '-2147483647'
			THEN	tblResource_Company.DEL_nm
			ELSE 	DEL_nm
		END
	WHERE	1=1
	AND
		tblResource_Company.Resrc_id	= Resrc_id
	AND	tblResource_Company.Resrc_tp	= Resrc_tp
	AND	tblResource_Company.Company_id	= Company_id
	AND	tblResource_Company.Company_tp	= Company_tp
	;
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
END usp;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure uspResource_Contact */

/*!50003 DROP PROCEDURE IF EXISTS  uspResource_Contact */;

DELIMITER $$

/*!50003 CREATE PROCEDURE uspResource_Contact(
	Resrc_id	INT SIGNED		-- PK1 
,	Resrc_tp	VARCHAR(64)		-- PK2 AK1
,	Contact_id	INT SIGNED		-- PK1 
,	Contact_tp	VARCHAR(64)		-- PK2 AK1
,	Contact_nm	VARCHAR(256)		--  AK2
,	Contact_cd	VARCHAR(128)	
,	Alias_nm	VARCHAR(256)
,	Address_nm	VARCHAR(256)
,	City_cd		VARCHAR(128)
,	State_cd	VARCHAR(128)
,	Zip_cd		VARCHAR(128)
,	Phone_cd	VARCHAR(128)
,	GPS_cd		VARCHAR(128)
,	Resrc_tx	MEDIUMTEXT	
,	Contact_tx	MEDIUMTEXT	
,	ADD_dm		DATETIME	
,	ADD_nm		VARCHAR(128)	
,	UPD_dm		DATETIME	
,	UPD_nm		VARCHAR(128)	
,	DEL_dm		DATETIME	
,	DEL_nm		VARCHAR(128)	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		uspResource_Contact
**	Type:		DB API procedure: Insert
**	Purpose:	To insert Resource data into tblResource_Contact
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	4/12/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResource_Contact';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'UPDATE';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'uspResource_Contact';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
usp:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF CallingProc_nm IS NULL OR CallingProc_nm = '' THEN SET CallingProc_nm = '';	END IF;
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	IF Resrc_id IS NULL OR Resrc_id = 0 THEN SET Resrc_id =  -2147483647;	END IF;
	IF Resrc_tp IS NULL OR Resrc_tp = '' THEN SET Resrc_tp = '-2147483647';	END IF;
	IF Contact_id IS NULL OR Contact_id = 0 THEN SET Contact_id =  -2147483647;	END IF;
	IF Contact_tp IS NULL OR Contact_tp = '' THEN SET Contact_tp = '-2147483647';	END IF;
	IF Contact_nm IS NULL OR Contact_nm = '' THEN SET Contact_nm = '-2147483647';	END IF;
	IF Contact_cd IS NULL OR Contact_cd = '' THEN SET Contact_cd = '-2147483647';	END IF;
	IF Alias_nm IS NULL OR Alias_nm = '' THEN SET Alias_nm = '-2147483647';	END IF;
	IF Address_nm IS NULL OR Address_nm = '' THEN SET Address_nm = '-2147483647';	END IF;
	IF City_cd IS NULL OR City_cd = '' THEN SET City_cd = '-2147483647';	END IF;
	IF State_cd IS NULL OR State_cd = '' THEN SET State_cd = '-2147483647';	END IF;
	IF ZIP_cd IS NULL OR ZIP_cd = '' THEN SET ZIP_cd = '-2147483647';	END IF;
	IF Phone_cd IS NULL OR Phone_cd = '' THEN SET Phone_cd = '-2147483647';	END IF;
	IF GPS_cd IS NULL OR GPS_cd = '' THEN SET GPS_cd = '-2147483647';	END IF;
	IF Resrc_tx IS NULL OR Resrc_tx = '' THEN SET Resrc_tx = '-2147483647';	END IF;
	IF Contact_tx IS NULL OR Contact_tx = '' THEN SET Contact_tx = '-2147483647';	END IF;
	IF ADD_dm IS NULL THEN SET ADD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = '-2147483647';	END IF;
	IF UPD_dm IS NULL THEN SET UPD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = '-2147483647';	END IF;
	IF DEL_dm IS NULL THEN SET DEL_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = '-2147483647';	END IF;
	SET	@PK1	= CONCAT(IFNULL(Resrc_id,"(null)"),",",Resrc_tp,",",IFNULL(Contact_id,"(null)"),",",Contact_tp);
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= 'tblResource_Contact'
		);
		LEAVE	usp;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
	CALL	rspResource_Contact
	(
		@Resrc_id	:= Resrc_id
	,	@Resrc_tp	:= Resrc_tp
	,	@Contact_id	:= Contact_id
	,	@Contact_tp	:= Contact_tp
	,	@Contact_nm	:= NULL
	,	@Contact_cd	:= NULL
	,	@Alias_nm	:= NULL
	,	@Address_nm	:= Address_nm
	,	@City_cd	:= City_cd
	,	@State_cd	:= State_cd
	,	@Zip_cd		:= Zip_cd
	,	@Phone_cd	:= Phone_cd
	,	@GPS_cd		:= GPS_cd
	,	@ADD_dm	:= ADD_dm
	,	@ADD_nm	:= ADD_nm
	,	@UPD_dm	:= UPD_dm
	,	@UPD_nm	:= UPD_nm
	,	@DEL_dm	:= DEL_dm
	,	@DEL_nm	:= DEL_nm
	,	@Key_cd	:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 0	-- If PK row dows not exists then return with error
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errPKNotExist
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		,	@Key_nm		:= @PK1
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Validate attributes
	#######################################################################
	SET 	@ADD_dm	= ADD_dm;
	SET 	@ADD_nm	= ADD_nm;
	SET 	@UPD_dm	= UPD_dm;
	SET 	@UPD_nm	= UPD_nm;
	SET 	@DEL_dm	= DEL_dm;
	SET 	@DEL_nm	= DEL_nm;
	CALL	vspResource_Contact
	(
		@Resrc_id	:= Resrc_id
	,	@Resrc_tp	:= Resrc_tp
	,	@Contact_id	:= Contact_id
	,	@Contact_tp	:= Contact_tp
	,	@Contact_nm	:= Contact_nm
	,	@Contact_cd	:= Contact_cd
	,	@Alias_nm	:= Alias_nm
	,	@Address_nm	:= Address_nm
	,	@City_cd	:= City_cd
	,	@State_cd	:= State_cd
	,	@Zip_cd		:= Zip_cd
	,	@Phone_cd	:= Phone_cd
	,	@GPS_cd		:= GPS_cd
	,	@ADD_dm
	,	@ADD_nm
	,	@UPD_dm
	,	@UPD_nm
	,	@DEL_dm
	,	@DEL_nm
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= 'vspResource_Contact'
		);
		LEAVE	usp;
	END IF;
	SET 	ADD_dm	= @ADD_dm;
	SET 	ADD_nm	= @ADD_nm;
	SET 	UPD_dm	= @UPD_dm;
	SET 	UPD_nm	= @UPD_nm;
	SET 	DEL_dm	= @DEL_dm;
	SET 	DEL_nm	= @DEL_nm;
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET	@FK1	= CONCAT(Resrc_tp);
	SET	@FK2	= CONCAT(Contact_tp);
	SET	@FK3	= CONCAT(IFNULL(Resrc_id,"(null)"),",",Resrc_tp);
	SET	@FK4	= CONCAT(IFNULL(Contact_id,"(null)"),",",Contact_tp);
	SET	@AK1	= CONCAT(IFNULL(Resrc_id,"(null)"),",",Resrc_tp,",",Contact_tp);
	--
	--	RESTRICT MODE:
	--
	IF
		Mode_cd	= 'R'
	THEN
		SET 	@TABLE	= "tblResourceType";
		CALL	rspResourceType
		(
			@Resrc_tp	:= Resrc_tp
		,	@ParentResrc_tp	:= NULL
		,	@ResrcType_tx	:= NULL
		,	@Left_id	:= NULL
		,	@Right_id	:= NULL
		,	@Level_id	:= NULL
		,	@Order_id	:= NULL
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	usp;
		END IF;
		SET 	@TABLE	= "tblContactType";
		CALL	rspContactType
		(
			@Contact_tp	:= Contact_tp
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK2
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	usp;
		END IF;
		SET 	@TABLE	= "tblResource";
		CALL	rspResource
		(
			@Resrc_id	:= Resrc_id
		,	@Resrc_tp	:= Resrc_tp
		,	@Resrc_tx	:= Resrc_tx
		,	@ADD_dm	:= ADD_dm
		,	@ADD_nm	:= ADD_nm
		,	@UPD_dm	:= UPD_dm
		,	@UPD_nm	:= UPD_nm
		,	@DEL_dm	:= DEL_dm
		,	@DEL_nm	:= DEL_nm
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK3
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	usp;
		END IF;
		SET 	@TABLE	= "tblResource";	-- Contact
		CALL	rspResource
		(
			@Resrc_id	:= Contact_id
		,	@Resrc_tp	:= Contact_tp
		,	@Resrc_tx	:= Contact_tx
		,	@ADD_dm	:= ADD_dm
		,	@ADD_nm	:= ADD_nm
		,	@UPD_dm	:= UPD_dm
		,	@UPD_nm	:= UPD_nm
		,	@DEL_dm	:= DEL_dm
		,	@DEL_nm	:= DEL_nm
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK4
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	usp;
		END IF;
	END IF;
	--
	--	CASCADE MODE:
	--
	IF
		Mode_cd	= 'C'
	THEN
		--	-------------------------------------------------------
		SET 	@TABLE	= "tblResource";	-- Contact
		--	-------------------------------------------------------
		CALL	uspResource
		(
			@Resrc_id	:= Contact_id
		,	@Resrc_tp	:= Contact_tp
		,	@Resrc_tx	:= Contact_tx
		,	@ADD_dm		:= ADD_dm
		,	@ADD_nm		:= ADD_nm
		,	@UPD_dm		:= UPD_dm
		,	@UPD_nm		:= UPD_nm
		,	@DEL_dm		:= DEL_dm
		,	@DEL_nm		:= DEL_nm
		,	@ParentResrc_tp	:= NULL
		,	@ResrcType_tx	:= NULL
		,	@Left_id	:= NULL
		,	@Right_id	:= NULL
		,	@Level_id	:= NULL
		,	@Order_id	:= NULL
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		);
		--	-------------------------------------------------------
		SET 	@TABLE	= "tblResource";
		--	-------------------------------------------------------
		CALL	uspResource
		(
			@Resrc_id	:= Resrc_id
		,	@Resrc_tp	:= Resrc_tp
		,	@Resrc_tx	:= Resrc_tx
		,	@ADD_dm		:= ADD_dm
		,	@ADD_nm		:= ADD_nm
		,	@UPD_dm		:= UPD_dm
		,	@UPD_nm		:= UPD_nm
		,	@DEL_dm		:= DEL_dm
		,	@DEL_nm		:= DEL_nm
		,	@ParentResrc_tp	:= NULL
		,	@ResrcType_tx	:= NULL
		,	@Left_id	:= NULL
		,	@Right_id	:= NULL
		,	@Level_id	:= NULL
		,	@Order_id	:= NULL
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		);
		--	-------------------------------------------------------
		--	-------------------------------------------------------
	END IF;
	#######################################################################
	-- Update NON-KEY values
	#######################################################################
	-- --------------------------------------------------------------------
	-- Invoke an UPDATE when a non-key attribute is actually modified.
	-- --------------------------------------------------------------------
	IF
		Contact_nm	= '-2147483647'
	AND	Contact_cd	= '-2147483647'
	AND	Alias_nm	= '-2147483647'
	AND	Address_nm	= '-2147483647'
	AND	City_cd		= '-2147483647'
	AND	State_cd	= '-2147483647'
	AND	ZIP_cd		= '-2147483647'
	AND	Phone_cd	= '-2147483647'
	AND	GPS_cd	= '-2147483647'
-- 	AND	ADD_dm	= '0000-00-00 00:00:00'
-- 	AND	ADD_nm	= '-2147483647'
	AND	UPD_dm	= '0000-00-00 00:00:00'
	AND	UPD_nm	= '-2147483647'
	AND	DEL_dm	= '0000-00-00 00:00:00'
	AND	DEL_nm	= '-2147483647'
	THEN
		LEAVE	USP;
	END IF;
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedEvent
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
	UPDATE
		tblResource_Contact
	SET
		tblResource_Contact.Contact_nm	= 
		CASE
			WHEN	Contact_nm	= '-2147483647'
			THEN	tblResource_Contact.Contact_nm
			ELSE 	Contact_nm
		END
	,	tblResource_Contact.Contact_cd	= 
		CASE
			WHEN	Contact_cd	= '-2147483647'
			THEN	tblResource_Contact.Contact_cd
			ELSE 	Contact_cd
		END
	,	tblResource_Contact.Alias_nm	=
		CASE
			WHEN	Alias_nm	= '-2147483647'
			THEN	tblResource_Contact.Alias_nm
			ELSE 	Alias_nm
		END
	,	tblResource_Contact.Address_nm	=
		CASE
			WHEN	Address_nm	= '-2147483647'
			THEN	tblResource_Contact.Address_nm
			ELSE 	Address_nm
		END
	,	tblResource_Contact.City_cd	=
		CASE
			WHEN	City_cd	= '-2147483647'
			THEN	tblResource_Contact.City_cd
			ELSE 	City_cd
		END
	,	tblResource_Contact.State_cd	=
		CASE
			WHEN	State_cd	= '-2147483647'
			THEN	tblResource_Contact.State_cd
			ELSE 	State_cd
		END
	,	tblResource_Contact.ZIP_cd	=
		CASE
			WHEN	ZIP_cd	= '-2147483647'
			THEN	tblResource_Contact.ZIP_cd
			ELSE 	ZIP_cd
		END
	,	tblResource_Contact.Phone_cd	=
		CASE
			WHEN	Phone_cd	= '-2147483647'
			THEN	tblResource_Contact.Phone_cd
			ELSE 	Phone_cd
		END
	,	tblResource_Contact.GPS_cd	=
		CASE
			WHEN	GPS_cd	= '-2147483647'
			THEN	tblResource_Contact.GPS_cd
			ELSE 	GPS_cd
		END
	,	tblResource_Contact.UPD_dm	=
		CASE
			WHEN	UPD_dm	= '0000-00-00 00:00:00'
			THEN	tblResource_Contact.UPD_dm
			ELSE 	UPD_dm
		END
	,	tblResource_Contact.UPD_nm	=
		CASE
			WHEN	UPD_nm	= '-2147483647'
			THEN	tblResource_Contact.UPD_nm
			ELSE 	UPD_nm
		END
	,	tblResource_Contact.DEL_dm	=
		CASE
			WHEN	DEL_dm	= '0000-00-00 00:00:00'
			THEN	tblResource_Contact.DEL_dm
			ELSE 	DEL_dm
		END
	,	tblResource_Contact.DEL_nm	=
		CASE
			WHEN	DEL_nm	= '-2147483647'
			THEN	tblResource_Contact.DEL_nm
			ELSE 	DEL_nm
		END
	WHERE	1=1
	AND
		tblResource_Contact.Resrc_id	= Resrc_id
	AND	tblResource_Contact.Resrc_tp	= Resrc_tp
	AND	tblResource_Contact.Contact_id	= Contact_id
	AND	tblResource_Contact.Contact_tp	= Contact_tp
	;
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
END usp;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure uspUser */

/*!50003 DROP PROCEDURE IF EXISTS  uspUser */;

DELIMITER $$

/*!50003 CREATE PROCEDURE uspUser(
	User_id		INT SIGNED		-- PK1 
,	User_tp		VARCHAR(64)		-- PK2 AK1
,	User_nm		VARCHAR(256)		--  AK2
,	User_cd		VARCHAR(128)	
,	Hashed_cd	VARCHAR(128)
,	Person_nm	VARCHAR(256)
,	Email_nm	VARCHAR(256)
,	Challenge_cd	VARCHAR(128)
,	Response_cd	VARCHAR(128)
,	User_tx		MEDIUMTEXT	
,	UserADD_dm	DATETIME	
,	UserADD_nm	VARCHAR(256)	
,	UserUPD_dm	DATETIME	
,	UserUPD_nm	VARCHAR(256)	
,	UserDEL_dm	DATETIME	
,	UserDEL_nm	VARCHAR(256)	
,	ParentUser_tp	VARCHAR(64)	
,	UserType_tx	MEDIUMTEXT	
,	UserTypeLeft_id	INT SIGNED	
,	UserTypeRight_id	INT SIGNED	
,	UserTypeLevel_id	INT SIGNED	
,	UserTypeOrder_id	INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		uspUser
**	Type:		DB API procedure: Insert
**	Purpose:	To update User data in tblUser
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	6/14/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblUser';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'UPDATE';
DECLARE	Proc_nm		VARCHAR(255) DEFAULT 'uspUser';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
USP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	IF User_id IS NULL OR User_id = 0 THEN SET User_id =  -2147483647;	END IF;
	IF User_tp IS NULL OR User_tp = '' THEN SET User_tp = '-2147483647';	END IF;
	IF User_nm IS NULL OR User_nm = '' THEN SET User_nm = '-2147483647';	END IF;
	IF User_cd IS NULL OR User_cd = '' THEN SET User_cd = '-2147483647';	END IF;
	IF Hashed_cd IS NULL OR Hashed_cd = '' THEN SET Hashed_cd = '-2147483647';	END IF;
	IF Person_nm IS NULL OR Person_nm = '' THEN SET Person_nm = '-2147483647';	END IF;
	IF Email_nm IS NULL OR Email_nm = '' THEN SET User_cd = '-2147483647';	END IF;
	IF Challenge_cd IS NULL OR Challenge_cd = '' THEN SET Challenge_cd = '-2147483647';	END IF;
	IF Response_cd IS NULL OR Response_cd = '' THEN SET Response_cd = '-2147483647';	END IF;
	IF User_tx IS NULL OR User_tx = '' THEN SET User_tx = '-2147483647';	END IF;
	IF UserADD_dm IS NULL OR UserADD_dm = '' THEN SET UserADD_dm = '0000-00-00 00:00:00';	END IF;
	IF UserADD_nm IS NULL OR UserADD_nm = '' THEN SET UserADD_nm = '-2147483647';	END IF;
	IF UserUPD_dm IS NULL OR UserUPD_dm = '' THEN SET UserUPD_dm = '0000-00-00 00:00:00';	END IF;
	IF UserUPD_nm IS NULL OR UserUPD_nm = '' THEN SET UserUPD_nm = '-2147483647';	END IF;
	IF UserDEL_dm IS NULL OR UserDEL_dm = '' THEN SET UserDEL_dm = '0000-00-00 00:00:00';	END IF;
	IF UserDEL_nm IS NULL OR UserDEL_nm = '' THEN SET UserDEL_nm = '-2147483647';	END IF;
	IF ParentUser_tp IS NULL OR ParentUser_tp = '' THEN SET ParentUser_tp = '-2147483647';	END IF;
	IF UserType_tx IS NULL OR UserType_tx = '' THEN SET UserType_tx = '-2147483647';	END IF;
	IF UserTypeLeft_id IS NULL OR UserTypeLeft_id = 0 THEN SET UserTypeLeft_id =  -2147483647;	END IF;
	IF UserTypeRight_id IS NULL OR UserTypeRight_id = 0 THEN SET UserTypeRight_id =  -2147483647;	END IF;
	IF UserTypeLevel_id IS NULL OR UserTypeLevel_id = 0 THEN SET UserTypeLevel_id =  -2147483647;	END IF;
	IF UserTypeOrder_id IS NULL OR UserTypeOrder_id = 0 THEN SET UserTypeOrder_id =  -2147483647;	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Return error if Primary Key TABLE record does NOT exist
	#######################################################################
	SET 	@PK1	= CONCAT(User_id,",",User_tp);
	-- --------------------------------------------------------------------
	CALL	rspUser
	(
		@User_id	:= User_id
	,	@User_tp	:= User_tp
	,	@User_nm	:= User_nm
	,	@User_cd	:= User_cd
	,	@Hashed_cd	:= Hashed_cd
	,	@Person_nm	:= Person_nm
	,	@Email_nm	:= Email_nm
	,	@Challenge_cd	:= Challenge_cd
	,	@Response_cd	:= Response_cd
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 0	-- If PK row does not exist then return with error
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errPKNotExist
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		,	@Key_nm		:= @PK1
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Validate attributes
	#######################################################################
	--	Set the VSP INOUT parameters to the proc IN parameters
	-- --------------------------------------------------------------------
	CALL	vspUser
	(
		@User_id	:= User_id
	,	@User_tp	:= User_tp
	,	@User_nm	:= User_nm
	,	@User_cd	:= User_cd
	,	@Hashed_cd	:= Hashed_cd
	,	@Person_nm	:= Person_nm
	,	@Email_nm	:= Email_nm
	,	@Challenge_cd	:= Challenge_cd
	,	@Response_cd	:= Response_cd
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= Proc_nm
		);
		LEAVE	USP;
	END IF;
	--	Set the proc IN parameters to the VSP INOUT parameters
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET 	@FK1	= CONCAT(User_tp);
	SET 	@FK2	= CONCAT(User_id,",",User_tp);
	-- --------------------------------------------------------------------
	IF
		Mode_cd	= 'R'
	THEN
		--
		--	RESTRICT MODE:	tblUserType
		--
		CALL	rspUserType
		(
			@User_tp	:= User_tp
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblUserType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= 'tblUserType'
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= 'tblUserType'
			);
			LEAVE	USP;
		END IF;
		--
		--	RESTRICT MODE:	tblResource
		--
		CALL	rspResource
		(
			@Resrc_id	:= User_id
		,	@Resrc_tp	:= User_tp
		,	@Resrc_tx	:= User_tx
		,	@ADD_dm		:= UserADD_dm
		,	@ADD_nm		:= UserADD_nm
		,	@UPD_dm		:= UserUPD_dm
		,	@UPD_nm		:= UserUPD_nm
		,	@DEL_dm		:= UserDEL_dm
		,	@DEL_nm		:= UserDEL_nm
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblResource not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= 'tblResource'
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK2
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= 'tblResource'
			);
			LEAVE	USP;
		END IF;
	END IF;
	-- --------------------------------------------------------------------
	-- --------------------------------------------------------------------
	IF
		Mode_cd	= 'C'
	THEN
		--
		--	CASCADE MODE:	tblUserType
		--
		CALL	uspUserType
		(
			@User_tp		:= User_tp
		,	@ParentUser_tp	:= ParentUser_tp
		,	@UserType_tx		:= UserType_tx
		,	@UserTypeLeft_id	:= UserTypeLeft_id
		,	@UserTypeRight_id	:= UserTypeRight_id
		,	@UserTypeLevel_id	:= UserTypeLevel_id
		,	@UserTypeOrder_id	:= UserTypeOrder_id
		,	@CallingProc_nm	:= CallingProc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= 'R'	-- This Table Is Restricted and Does Not Allow A Cascade From an FK Table.
		);
		--
		--	CASCADE MODE:	tblResource
		--
		CALL	uspResource
		(
			@Resrc_id	:= User_id
		,	@Resrc_tp	:= User_tp
		,	@Resrc_tx	:= User_tx
		,	@ADD_dm		:= UserADD_dm
		,	@ADD_nm		:= UserADD_nm
		,	@UPD_dm		:= UserUPD_dm
		,	@UPD_nm		:= UserUPD_nm
		,	@DEL_dm		:= UserDEL_dm
		,	@DEL_nm		:= UserDEL_nm
		,	@ParentResrc_tp	:= ParentUser_tp
		,	@ResrcType_tx	:= UserType_tx
		,	@Left_id	:= UserTypeLeft_id
		,	@Right_id	:= UserTypeRight_id
		,	@Level_id	:= UserTypeLevel_id
		,	@Order_id	:= UserTypeOrder_id
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		);
	END IF;
	#######################################################################
	-- Update NON-KEY values
	#######################################################################
	-- --------------------------------------------------------------------
	-- Invoke an UPDATE when a non-key attribute is actually modified.
	-- --------------------------------------------------------------------
	IF 	
		User_nm	= '-2147483647'
	AND 	User_cd	= '-2147483647'
	AND 	Hashed_cd	= '-2147483647'
	AND 	Person_nm	= '-2147483647'
	AND 	Email_nm	= '-2147483647'
	AND 	Challenge_cd	= '-2147483647'
	AND 	Response_cd	= '-2147483647'
	THEN
		LEAVE 	USP;
	END IF;
	-- --------------------------------------------------------------------
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedEvent
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
	UPDATE
		tblUser
	SET	
		tblUser.User_nm	=
		CASE
			WHEN	User_nm	= '-2147483647'
			THEN	tblUser.User_nm
			ELSE 	User_nm
		END
	,	tblUser.User_cd	=
		CASE
			WHEN	User_cd	= '-2147483647'
			THEN	tblUser.User_cd
			ELSE 	User_cd
		END
	,	tblUser.Hashed_cd	=
		CASE
			WHEN	Hashed_cd	= '-2147483647'
			THEN	tblUser.Hashed_cd
			ELSE 	Hashed_cd
		END
	,	tblUser.Person_nm	=
		CASE
			WHEN	Person_nm	= '-2147483647'
			THEN	tblUser.Person_nm
			ELSE 	Person_nm
		END
	,	tblUser.Email_nm	=
		CASE
			WHEN	Email_nm	= '-2147483647'
			THEN	tblUser.Email_nm
			ELSE 	Email_nm
		END
	,	tblUser.Challenge_cd	=
		CASE
			WHEN	Challenge_cd	= '-2147483647'
			THEN	tblUser.Challenge_cd
			ELSE 	Challenge_cd
		END
	,	tblUser.Response_cd	=
		CASE
			WHEN	Response_cd	= '-2147483647'
			THEN	tblUser.Response_cd
			ELSE 	Response_cd
		END
	WHERE
		tblUser.User_id	= User_id
	AND	tblUser.User_tp	= User_tp
	;
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
END USP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure uspUserType */

/*!50003 DROP PROCEDURE IF EXISTS  uspUserType */;

DELIMITER $$

/*!50003 CREATE PROCEDURE uspUserType(
	User_tp		VARCHAR(64)		-- PK1 
,	ParentUser_tp		VARCHAR(64)	
,	UserType_tx		MEDIUMTEXT	
,	UserTypeLeft_id		INT SIGNED	
,	UserTypeRight_id		INT SIGNED	
,	UserTypeLevel_id		INT SIGNED	
,	UserTypeOrder_id		INT SIGNED	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		uspUserType
**	Type:		DB API procedure: Insert
**	Purpose:	To insert UserType data into tblUserType
**	Author:		Solomon S. Shacter
**	Organiztion:	Innovella, Inc.
**
**	Modified:	6/14/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblUserType';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'UPDATE';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'uspUserType';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
USP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	IF User_tp IS NULL OR User_tp = '' THEN SET User_tp = '-2147483647';	END IF;
	IF ParentUser_tp IS NULL OR ParentUser_tp = '' THEN SET ParentUser_tp = '-2147483647';	END IF;
	IF UserType_tx IS NULL OR UserType_tx = '' THEN SET UserType_tx = '-2147483647';	END IF;
	IF UserTypeLeft_id IS NULL OR UserTypeLeft_id = 0 THEN SET UserTypeLeft_id =  -2147483647;	END IF;
	IF UserTypeRight_id IS NULL OR UserTypeRight_id = 0 THEN SET UserTypeRight_id =  -2147483647;	END IF;
	IF UserTypeLevel_id IS NULL OR UserTypeLevel_id = 0 THEN SET UserTypeLevel_id =  -2147483647;	END IF;
	IF UserTypeOrder_id IS NULL OR UserTypeOrder_id = 0 THEN SET UserTypeOrder_id =  -2147483647;	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Return error if Primary Key TABLE record does NOT exist
	#######################################################################
	SET 	@PK1	= CONCAT(User_tp);
	-- --------------------------------------------------------------------
	CALL	rspUserType
	(
		@User_tp	:= User_tp
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 0	-- If PK row does not exist then return with error
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errPKNotExist
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		,	@Key_nm		:= @PK1
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################
	#######################################################################
	-- Validate attributes
	#######################################################################
	CALL	vspUserType
	(
		@User_tp	:= User_tp
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= Proc_nm
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET	@FK1	= CONCAT(User_tp);
	-- --------------------------------------------------------------------
	--
	--	RESTRICT MODE:	tblResourceType
	--
	IF
		Mode_cd	= 'R'
	THEN
		CALL	rspResourceType
		(
			@Resrc_tp	:= User_tp
		,	@ParentResrc_tp	:= ParentUser_tp
		,	@ResrcType_tx	:= UserType_tx
		,	@Left_id	:= UserTypeLeft_id
		,	@Right_id	:= UserTypeRight_id
		,	@Level_id	:= UserTypeLevel_id
		,	@Order_id	:= UserTypeOrder_id
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblResourceType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= 'tblResourceType'
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= 'tblResourceType'
			);
			LEAVE	USP;
		END IF;
	END IF;
	--
	--	CASCADE MODE:	tblResourceType
	--
	IF
		Mode_cd	= 'C'
	THEN
		CALL	uspResourceType
		(
			@Resrc_tp	:= User_tp
		,	@ParentResrc_tp	:= ParentUser_tp
		,	@ResrcType_tx	:= UserType_tx
		,	@Left_id	:= UserTypeLeft_id
		,	@Right_id	:= UserTypeRight_id
		,	@Level_id	:= UserTypeLevel_id
		,	@Order_id	:= UserTypeOrder_id
		,	@CallingProc_nm	:= CallingProc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= 'R'	-- This Table Is Restricted and Does Not Allow A Cascade From an FK Table.
		);
	END IF;
	#######################################################################
	-- Update NON-KEY values
	#######################################################################
	-- --------------------------------------------------------------------
	-- Invoke an UPDATE when a non-key attribute is actually modified.
	-- --------------------------------------------------------------------
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedUser
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
END	USP;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure uspUser_Company */

/*!50003 DROP PROCEDURE IF EXISTS  uspUser_Company */;

DELIMITER $$

/*!50003 CREATE PROCEDURE uspUser_Company(
	User_id		INT SIGNED		-- PK1 
,	User_tp		VARCHAR(64)		-- PK2 AK1
,	Company_id	INT SIGNED		-- PK1 
,	Company_tp	VARCHAR(64)		-- PK2 AK1
,	User_nm		VARCHAR(256)		--  AK2
,	User_cd		VARCHAR(128)	
,	Alias_nm	VARCHAR(256)		--  AK2
,	Hashed_cd	VARCHAR(128)
,	Person_nm	VARCHAR(256)
,	Email_nm	VARCHAR(256)
,	Challenge_cd	VARCHAR(128)
,	Response_cd	VARCHAR(128)
,	Company_nm	VARCHAR(256)
,	Company_cd	VARCHAR(128)	
,	User_tx		MEDIUMTEXT	
,	Company_tx	MEDIUMTEXT	
,	ADD_dm		DATETIME	
,	ADD_nm		VARCHAR(128)	
,	UPD_dm		DATETIME	
,	UPD_nm		VARCHAR(128)	
,	DEL_dm		DATETIME	
,	DEL_nm		VARCHAR(128)	
,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		uspUser_Company
**	Type:		DB API procedure: Insert
**	Purpose:	To insert Resource data into tblResource_Company
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	4/12/2013
**	Modnumber:	00
**	Modification:	Original
**	NOTE: Special Case
	AK in parent tblUser = User_tp, User_nm 
	AK in tblResource_Company = Resrc_tp, Company_id, Company_tp, Resrc_nm
	AK for "User_Company" = User_tp(tblResource_Company.Resrc_tp), Company_tp, Company_nm, User_nm(tblResource_Company.Resrc_nm)
**
	A user type and user name exists once in tblUser and once in tblCompany
	A user type and user name exists once in tblUser but may exist once or more in tblResource_Conatct, tblResource_Project
	A user may belong to more than one Group which may belong to one or more Companies
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResource_Company';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'UPDATE';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'uspUser_Company';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
DECLARE	PK1		VARCHAR(255) DEFAULT CONCAT(User_id,",",User_tp,",",Company_id,",",Company_tp);
DECLARE	FK1		VARCHAR(255) DEFAULT CONCAT(User_id,",",User_tp);
DECLARE	FK2		VARCHAR(255) DEFAULT CONCAT(User_id,",",User_tp,",",Company_id,",",Company_tp);
###############################################################################
usp:
BEGIN
DECLARE CONTINUE HANDLER FOR NOT FOUND SET ProcFailed_fg	= 0;
	#######################################################################
	-- Initialize
	#######################################################################
	IF CallingProc_nm IS NULL OR CallingProc_nm = '' THEN SET CallingProc_nm = '';	END IF;
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
	IF User_id IS NULL OR User_id = 0 THEN SET User_id =  -2147483647;	END IF;
	IF User_tp IS NULL OR User_tp = '' THEN SET User_tp = '-2147483647';	END IF;
	IF Company_id IS NULL OR Company_id = 0 THEN SET Company_id =  -2147483647;	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = '-2147483647';	END IF;
	IF User_nm IS NULL OR User_nm = '' THEN SET User_nm = '-2147483647';	END IF;
	IF User_cd IS NULL OR User_cd = '' THEN SET User_cd = '-2147483647';	END IF;
	IF Hashed_cd IS NULL OR Hashed_cd = '' THEN SET Hashed_cd = '-2147483647';	END IF;
	IF Person_nm IS NULL OR Person_nm = '' THEN SET Person_nm = '-2147483647';	END IF;
	IF Alias_nm IS NULL OR Alias_nm = '' THEN SET Alias_nm = '-2147483647';	END IF;
	IF Email_nm IS NULL OR Email_nm = '' THEN SET User_cd = '-2147483647';	END IF;
	IF Challenge_cd IS NULL OR Challenge_cd = '' THEN SET Challenge_cd = '-2147483647';	END IF;
	IF Response_cd IS NULL OR Response_cd = '' THEN SET Response_cd = '-2147483647';	END IF;
	IF Company_nm IS NULL OR Company_nm = '' THEN SET Company_nm = '-2147483647';	END IF;
	IF Company_cd IS NULL OR Company_cd = '' THEN SET Company_cd = '-2147483647';	END IF;
	IF User_tx IS NULL OR User_tx = '' THEN SET User_tx = '-2147483647';	END IF;
	IF Company_tx IS NULL OR Company_tx = '' THEN SET Company_tx = '-2147483647';	END IF;
	IF ADD_dm IS NULL THEN SET ADD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = '-2147483647';	END IF;
	IF UPD_dm IS NULL THEN SET UPD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = '-2147483647';	END IF;
	IF DEL_dm IS NULL THEN SET DEL_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = '-2147483647';	END IF;
	#######################################################################
	-- Verify Correct Use of Database Mode
	#######################################################################
	IF	Mode_cd	= 'R'
	OR	Mode_cd	= 'C'
	OR	Mode_cd	= 'H'
	OR	Mode_cd	= 'N'
	THEN
		SET ProcFailed_fg	= FALSE;
	ELSE
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedMode
		(
			@Proc_nm	:= Proc_nm
		,	@Mode_cd	:= Mode_cd
		,	@Action_nm	:= SYSRIGHT
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	usp;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
	CALL	rspResource_Company
	(
		@Resrc_id	:= User_id
	,	@Resrc_tp	:= User_tp
	,	@Company_id	:= Company_id
	,	@Company_tp	:= Company_tp
	,	@Resrc_nm	:= NULL
	,	@Resrc_cd	:= NULL
	,	@Alias_nm	:= NULL
	,	@ADD_dm	:= ADD_dm
	,	@ADD_nm	:= ADD_nm
	,	@UPD_dm	:= UPD_dm
	,	@UPD_nm	:= UPD_nm
	,	@DEL_dm	:= DEL_dm
	,	@DEL_nm	:= DEL_nm
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 0	-- If PK row dows not exists then return with error
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errPKNotExist
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		,	@Key_nm		:= PK1
		);
		LEAVE	USP;
	END IF;
	#######################################################################
	-- Validate attributes
	#######################################################################
	SET 	@ADD_dm	= ADD_dm;
	SET 	@ADD_nm	= ADD_nm;
	SET 	@UPD_dm	= UPD_dm;
	SET 	@UPD_nm	= UPD_nm;
	SET 	@DEL_dm	= DEL_dm;
	SET 	@DEL_nm	= DEL_nm;
	CALL	vspUser_Company
	(
		@User_id	:= User_id
	,	@User_tp	:= User_tp
	,	@Company_id	:= Company_id
	,	@Company_tp	:= Company_tp
	,	@User_nm	:= User_nm
	,	@User_cd	:= User_cd
	,	@Company_nm	:= Company_nm
	,	@ADD_dm
	,	@ADD_nm
	,	@UPD_dm
	,	@UPD_nm
	,	@DEL_dm
	,	@DEL_nm
	,	@SYSRIGHT	:= SYSRIGHT
	,	@Mode_cd	:= Mode_cd
	,	@IsValid_fg
	);
	IF	@IsValid_fg	= FALSE
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCall
		(
			@Proc_nm	:= Proc_nm
		,	@CallingProc_nm	:= 'vspResource_Company'
		);
		LEAVE	usp;
	END IF;
	-- --------------------------------------------------------------------
	SET 	ADD_dm	= @ADD_dm;
	SET 	ADD_nm	= @ADD_nm;
	SET 	UPD_dm	= @UPD_dm;
	SET 	UPD_nm	= @UPD_nm;
	SET 	DEL_dm	= @DEL_dm;
	SET 	DEL_nm	= @DEL_nm;
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET @FK1	= CONCAT(IFNULL(User_id,"(null)"),",",User_tp);
	SET @FK2	= CONCAT(IFNULL(User_id,"(null)"),",",User_tp,",",IFNULL(Company_id,"(null)"),",",Company_tp);
	-- --------------------------------------------------------------------
	--
	--	RESTRICT MODE:
	--
	IF
		Mode_cd	= 'R'
	THEN
		SET 	@TABLE	= "tblUser";
		CALL	rspUser
		(
			@User_id	:= User_id
		,	@User_tp	:= User_tp
		,	@User_nm	:= User_nm
		,	@User_cd	:= User_cd
		,	@Hashed_cd	:= Hashed_cd
		,	@Person_nm	:= Person_nm
		,	@Email_nm	:= Email_nm
		,	@Challenge_cd	:= Challenge_cd
		,	@Response_cd	:= Response_cd
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= FK1
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	usp;
		END IF;
		SET 	@TABLE	= "tblResource_Company";
		CALL	rspResource_Company
		(
			@Resrc_id	:= User_id
		,	@Resrc_tp	:= User_tp
		,	@Company_id	:= Company_id
		,	@Company_tp	:= Company_tp
		,	@Resrc_nm	:= User_nm
		,	@Resrc_cd	:= User_cd
		,	@Alias_nm	:= Alias_nm
		,	@ADD_dm	:= ADD_dm
		,	@ADD_nm	:= ADD_nm
		,	@UPD_dm	:= UPD_dm
		,	@UPD_nm	:= UPD_nm
		,	@DEL_dm	:= DEL_dm
		,	@DEL_nm	:= DEL_nm
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= FK2
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	usp;
		END IF;
	END IF;
	--
	--	CASCADE MODE:
	--
	IF
		Mode_cd	= 'C'
	THEN
		--	-------------------------------------------------------
		SET 	@TABLE	= "tblUser";
		--	-------------------------------------------------------
		CALL	uspUser
		(
			@User_id	:= User_id
		,	@User_tp	:= User_tp
		,	@User_nm	:= User_nm
		,	@User_cd	:= User_cd
		,	@Hashed_cd	:= Hashed_cd
		,	@Person_nm	:= Person_nm
		,	@Email_nm	:= Email_nm
		,	@Challenge_cd	:= Challenge_cd
		,	@Response_cd	:= Response_cd
		,	@User_tx	:= User_tx
		,	@UserADD_dm	:= ADD_dm
		,	@UserADD_nm	:= ADD_nm
		,	@UserUPD_dm	:= UPD_dm
		,	@UserUPD_nm	:= UPD_nm
		,	@UserDEL_dm	:= DEL_dm
		,	@UserDEL_nm	:= DEL_nm
		,	@ParentUser_tp	:= NULL
		,	@UserType_tx	:= NULL
		,	@UserTypeLeft_id	:= NULL
		,	@UserTypeRight_id	:= NULL
		,	@UserTypeLevel_id	:= NULL
		,	@UserTypeOrder_id	:= NULL
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		)
		;
		--	-------------------------------------------------------
		SET 	@TABLE	= "tblResource_Company";
		--	-------------------------------------------------------
		CALL	uspResource_Company
		(
			@Resrc_id	:= User_id
		,	@Resrc_tp	:= User_tp
		,	@Company_id	:= Company_id
		,	@Company_tp	:= Company_tp
		,	@Resrc_nm	:= User_nm
		,	@Resrc_cd	:= User_cd
		,	@Alias_nm	:= Alias_nm
		,	@Company_nm := Company_nm
		,	@Company_cd := Company_cd
		,	@Resrc_tx   := User_tx
		,	@Company_tx := Company_tx
		,	@ADD_dm	:= ADD_dm
		,	@ADD_nm	:= ADD_nm
		,	@UPD_dm	:= UPD_dm
		,	@UPD_nm	:= UPD_nm
		,	@DEL_dm	:= DEL_dm
		,	@DEL_nm	:= DEL_nm
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		)
		;
		--	Set the proc IN parameters to the parent usp INOUT parameters
		SET 	Company_id	= @Company_id;
	END IF;
	#######################################################################
	-- Update NON-KEY values
	#######################################################################
	-- --------------------------------------------------------------------
	-- Invoke an UPDATE when a non-key attribute is actually modified.
	-- --------------------------------------------------------------------
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
END usp;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure vspCompany */

/*!50003 DROP PROCEDURE IF EXISTS  vspCompany */;

DELIMITER $$

/*!50003 CREATE PROCEDURE vspCompany(
	Company_id		INT SIGNED		
,	Company_tp		VARCHAR(64)		
,	Company_nm		VARCHAR(256)		
,	Company_cd		VARCHAR(128)		
,	SYSRIGHT		VARCHAR(30)		-- Intended DML action
,	Mode_cd		VARCHAR(16)		-- Database cascade mode code
,	OUT 	IsValid_fg	BOOLEAN
)
BEGIN
/*
**	Name:		vspCompany
**	Type:		Validation Stored Procedure
**	Purpose:	Validate a record in tblCompany
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	6/18/2013
**	Modnumber:
**	Modification:	
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblCompany';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'vspCompany';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
VSP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	DECLARE	AK1		VARCHAR(255) DEFAULT CONCAT(Company_tp,",",Company_nm);
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
				tblCompany
			WHERE
					tblCompany.Company_id	= Company_id
				AND	tblCompany.Company_tp	= Company_tp
				AND	tblCompany.Company_nm	= Company_nm
		)
		THEN
			SET IsValid_fg	= TRUE;	-- Return if the attributes did not change
			LEAVE VSP;
		ELSE
			CALL	rspCompany
			(
				@Company_id	:= Company_id
			,	@Company_tp	:= Company_tp
			,	@Company_nm	:= Company_nm
			,	@Company_cd	:= Company_cd
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
				LEAVE VSP;
			END IF;
		END IF;
	END IF;
	IF
		SYSRIGHT	= 'DELETE'
	THEN
		IF
			Mode_cd	= 'H'
		THEN
			SET 	@DEL_dm	= UTC_TIMESTAMP();
			SET 	@DEL_nm	= CURRENT_USER();
		END IF;
	END IF;
	#######################################################################
END	VSP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure vspCompanyType */

/*!50003 DROP PROCEDURE IF EXISTS  vspCompanyType */;

DELIMITER $$

/*!50003 CREATE PROCEDURE vspCompanyType(
	Company_tp		VARCHAR(64)		
,	SYSRIGHT		VARCHAR(30)		-- Intended DML action
,	Mode_cd		VARCHAR(16)		-- Database cascade mode code
,	OUT 	IsValid_fg	BOOLEAN
)
BEGIN
/*
**	Name:		vspCompanyType
**	Type:		Validation Stored Procedure
**	Purpose:	Validate a record in tblCompanyType
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	6/18/2013
**	Modnumber:
**	Modification:	
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblCompanyType';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'vspCompanyType';
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
END */$$
DELIMITER ;

/* Procedure structure for procedure vspResource */

/*!50003 DROP PROCEDURE IF EXISTS  vspResource */;

DELIMITER $$

/*!50003 CREATE PROCEDURE vspResource(
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
END */$$
DELIMITER ;

/* Procedure structure for procedure vspResourceType */

/*!50003 DROP PROCEDURE IF EXISTS  vspResourceType */;

DELIMITER $$

/*!50003 CREATE PROCEDURE vspResourceType(
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
END */$$
DELIMITER ;

/* Procedure structure for procedure vspResource_Company */

/*!50003 DROP PROCEDURE IF EXISTS  vspResource_Company */;

DELIMITER $$

/*!50003 CREATE PROCEDURE vspResource_Company(
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
END */$$
DELIMITER ;

/* Procedure structure for procedure vspResource_Contact */

/*!50003 DROP PROCEDURE IF EXISTS  vspResource_Contact */;

DELIMITER $$

/*!50003 CREATE PROCEDURE vspResource_Contact(
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
END */$$
DELIMITER ;

/* Procedure structure for procedure vspUser */

/*!50003 DROP PROCEDURE IF EXISTS  vspUser */;

DELIMITER $$

/*!50003 CREATE PROCEDURE vspUser(
	User_id		INT SIGNED		
,	User_tp		VARCHAR(64)		
,	User_nm		VARCHAR(256)		
,	User_cd		VARCHAR(128)		
,	Hashed_cd	VARCHAR(128)
,	Person_nm	VARCHAR(256)
,	Email_nm	VARCHAR(256)
,	Challenge_cd	VARCHAR(128)
,	Response_cd	VARCHAR(128)
,	SYSRIGHT		VARCHAR(30)		-- Intended DML action
,	Mode_cd		VARCHAR(16)		-- Database cascade mode code
,	OUT 	IsValid_fg	BOOLEAN
)
BEGIN
/*
**	Name:		vspUser
**	Type:		Validation Stored Procedure
**	Purpose:	Validate a record in tblUser
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	6/18/2013
**	Modnumber:
**	Modification:	
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblUser';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'vspUser';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
VSP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	DECLARE	AK1		VARCHAR(255) DEFAULT CONCAT(User_tp,",",User_nm);
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
				tblUser
			WHERE
					tblUser.User_id	= User_id
				AND	tblUser.User_tp	= User_tp
				AND	tblUser.User_nm	= User_nm
		)
		THEN
			SET IsValid_fg	= TRUE;	-- Return if the attributes did not change
			LEAVE VSP;
		ELSE
			CALL	rspUser
			(
				@User_id	:= User_id
			,	@User_tp	:= User_tp
			,	@User_nm	:= User_nm
			,	@User_cd	:= User_cd
			,	@Hashed_cd	:= Hashed_cd
			,	@Person_nm	:= Person_nm
			,	@Email_nm	:= Email_nm
			,	@Challenge_cd	:= Challenge_cd
			,	@Response_cd	:= Response_cd
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
				LEAVE VSP;
			END IF;
		END IF;
	END IF;
	IF
		SYSRIGHT	= 'DELETE'
	THEN
		IF
			Mode_cd	= 'H'
		THEN
			SET 	@DEL_dm	= UTC_TIMESTAMP();
			SET 	@DEL_nm	= CURRENT_USER();
		END IF;
	END IF;
	#######################################################################
END	VSP
;
###############################################################################
END */$$
DELIMITER ;

/* Procedure structure for procedure vspUserType */

/*!50003 DROP PROCEDURE IF EXISTS  vspUserType */;

DELIMITER $$

/*!50003 CREATE PROCEDURE vspUserType(
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
**	User:	Innovella, Inc.
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
END */$$
DELIMITER ;

/* Procedure structure for procedure vspUser_Company */

/*!50003 DROP PROCEDURE IF EXISTS  vspUser_Company */;

DELIMITER $$

/*!50003 CREATE PROCEDURE vspUser_Company(
	User_id		INT SIGNED
,	User_tp		VARCHAR(64)
,	Company_id	INT SIGNED
,	Company_tp	VARCHAR(64)
,	User_nm		VARCHAR(256)
,	User_cd		VARCHAR(128)
,	Company_nm	VARCHAR(256)
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
**	Name:		vspUser_Company
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
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'vspUser_Company';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
VSP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	DECLARE	AK1		VARCHAR(255) DEFAULT CONCAT(User_tp,",",Company_tp,",",Company_nm,",",User_nm);
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
				tvwUser_Company
			WHERE	1=1
			AND	tvwUser_Company.User_id	= User_id
			AND	tvwUser_Company.User_tp	= User_tp
			AND	tvwUser_Company.User_nm	= User_nm
			AND	tvwUser_Company.Company_id	= Company_id
			AND	tvwUser_Company.Company_tp	= Company_tp
			AND	tvwUser_Company.Company_nm	= Company_nm
		)
		THEN
			SET IsValid_fg	= TRUE;	-- Return if the attributes did not change
		ELSE
			IF
			EXISTS
			(
				SELECT	1
				FROM
					tvwUser_Company
				WHERE	1=1
				AND	tvwUser_Company.User_tp	= User_tp
				AND	tvwUser_Company.User_nm	= User_nm
				AND	tvwUser_Company.Company_tp	= Company_tp
				AND	tvwUser_Company.Company_nm	= Company_nm
			)	-- AK exists and not for this PK
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
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;