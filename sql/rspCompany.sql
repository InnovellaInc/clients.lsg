DROP PROCEDURE IF EXISTS	rspCompany
;

DELIMITER //
CREATE PROCEDURE	rspCompany
(
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
END
//
DELIMITER ;
;

