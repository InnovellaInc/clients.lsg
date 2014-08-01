DROP PROCEDURE IF EXISTS	rspResource_Company
;

DELIMITER //
CREATE PROCEDURE	rspResource_Company
(
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
END
//
DELIMITER ;
;
