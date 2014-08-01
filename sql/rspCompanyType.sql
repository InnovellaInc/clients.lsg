DROP PROCEDURE IF EXISTS	rspCompanyType
;

DELIMITER //
CREATE PROCEDURE	rspCompanyType
(
	Company_tp		VARCHAR(64)		

,	Key_cd		VARCHAR(16)		-- = 'PK'	-- Search key code
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
			FROM
				tblCompanyType
			WHERE	1=1
			AND	tblCompanyType.Company_tp	= Company_tp

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
				tblCompanyType
			WHERE	1=1
			AND	tblCompanyType.Company_tp	= Company_tp
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
				tblCompanyType
			WHERE	1=1
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
END
//
DELIMITER ;
;

