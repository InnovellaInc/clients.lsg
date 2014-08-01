DROP PROCEDURE IF EXISTS	uspResource
;

DELIMITER //
CREATE PROCEDURE	uspResource
(
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
END
//
DELIMITER ;
;

