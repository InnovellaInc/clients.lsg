DROP PROCEDURE IF EXISTS	rspUser
;

DELIMITER //
CREATE PROCEDURE	rspUser
(
	User_id		INT SIGNED
,	User_tp		VARCHAR(64)
,	User_nm		VARCHAR(256)
,	User_cd		VARCHAR(128)
,	Hashed_cd	VARCHAR(128)
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
END
//
DELIMITER ;
;

