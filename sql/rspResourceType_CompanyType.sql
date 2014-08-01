DROP PROCEDURE IF EXISTS	rspResourceType_CompanyType
;

DELIMITER //
CREATE PROCEDURE	rspResourceType_CompanyType
(
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
END
//
DELIMITER ;
;

