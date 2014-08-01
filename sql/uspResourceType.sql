DROP PROCEDURE IF EXISTS	uspResourceType
;

DELIMITER //
CREATE PROCEDURE	uspResourceType
(
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
END
//
DELIMITER ;
;

