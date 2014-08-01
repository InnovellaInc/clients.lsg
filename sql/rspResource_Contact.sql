DROP PROCEDURE IF EXISTS	rspResource_Contact
;

DELIMITER //
CREATE PROCEDURE	rspResource_Contact
(
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
END
//
DELIMITER ;
;
