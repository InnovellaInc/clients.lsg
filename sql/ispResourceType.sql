DROP PROCEDURE IF EXISTS	ispResourceType
;

DELIMITER //
CREATE PROCEDURE	ispResourceType
(
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
END
//
DELIMITER ;
;

