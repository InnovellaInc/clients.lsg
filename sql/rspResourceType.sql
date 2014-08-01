DROP PROCEDURE IF EXISTS	rspResourceType
;

DELIMITER //
CREATE PROCEDURE	rspResourceType
(
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
END
//
DELIMITER ;
;

