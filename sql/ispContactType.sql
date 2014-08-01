DROP PROCEDURE IF EXISTS	ispContactType
;

DELIMITER //
CREATE PROCEDURE	ispContactType
(
	Contact_tp		VARCHAR(64)		-- PK1 
,	ParentContact_tp		VARCHAR(64)	
,	ContactType_tx		MEDIUMTEXT	
,	ContactTypeLeft_id		INT SIGNED	
,	ContactTypeRight_id		INT SIGNED	
,	ContactTypeLevel_id		INT SIGNED	
,	ContactTypeOrder_id		INT SIGNED	

,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceContact	Contact name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		ispContactType
**	Type:		DB API procedure: Insert
**	Purpose:	To insert ContactType data into tblContactType
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	6/14/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblContactType';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'INSERT';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'ispContactType';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
DECLARE	FK1		VARCHAR(255) DEFAULT CONCAT(Contact_tp);
###############################################################################
ISP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;
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
	CALL	rspContactType
	(
		@Contact_tp	:= Contact_tp
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
				Contact_tp
			;
		END IF;
		LEAVE	ISP;
	END IF;
	IF
		CallingProc_nm	= "ispResource_Contact"
	THEN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFKNotExist
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		,	@Key_nm		:= FK1
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
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################

	#######################################################################
	-- Validate attributes
	#######################################################################

	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	--
	--	RESTRICT MODE:	tblResourceType
	--
	IF
		@Mode_cd	= 'R'
	THEN
		SET 	@TABLE	= "tblResourceType";
		CALL	rspResourceType
		(
			@Resrc_tp	:= Contact_tp
		,	@ParentResrc_tp	:= ParentContact_tp
		,	@ResrcType_tx	:= ContactType_tx
		,	@Left_id	:= ContactTypeLeft_id
		,	@Right_id	:= ContactTypeRight_id
		,	@Level_id	:= ContactTypeLevel_id
		,	@Order_id	:= ContactTypeOrder_id
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
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= FK1
			);

			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	ISP;
		END IF;
	END IF;
	--
	--	CASCADE MODE:	tblResourceType
	--
	IF
		@Mode_cd	= 'C'
	THEN
		CALL	ispResourceType
		(
			@Resrc_tp	:= Contact_tp
		,	@ParentResrc_tp	:= ParentContact_tp
		,	@ResrcType_tx	:= ContactType_tx
		,	@Left_id	:= ContactTypeLeft_id
		,	@Right_id	:= ContactTypeRight_id
		,	@Level_id	:= ContactTypeLevel_id
		,	@Order_id	:= ContactTypeOrder_id

		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= 'R'	-- This Table Is Restricted and Does Not Allow A Cascade From an FK Table.
		);
	END IF;
	#######################################################################
	-- Insert values
	#######################################################################
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedContact
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;

	INSERT
	INTO	tblContactType
	(
		Contact_tp

	)
	VALUES
	(
		Contact_tp

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
			@Contact_tp	AS Contact_tp
 		;
 	END IF;
	#######################################################################
END	ISP;
###############################################################################
END
//
DELIMITER ;
;
/*
CALL	ispContactType
(
	@Contact_tp	:= "Contact"
,	@ParentContact_tp	:= "RESOURCE"
,	@ContactType_tx	:= "Contact Types"	
,	@ContactTypeLeft_id	:= NULL
,	@ContactTypeRight_id	:= NULL
,	@ContactTypeLevel_id	:= NULL
,	@ContactTypeOrder_id	:= NULL

,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Mode_cd	:= "C"
)
;
CALL	ispContactType
(
	@Contact_tp	:= "ContactAddress"
,	@ParentContact_tp	:= "Contact"
,	@ContactType_tx	:= "Contact Types"	
,	@ContactTypeLeft_id	:= NULL
,	@ContactTypeRight_id	:= NULL
,	@ContactTypeLevel_id	:= NULL
,	@ContactTypeOrder_id	:= NULL

,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Mode_cd	:= "C"
)
;
CALL	ispContactType
(
	@Contact_tp	:= "ContactEmail"
,	@ParentContact_tp	:= "Contact"
,	@ContactType_tx	:= "Contact Types"	
,	@ContactTypeLeft_id	:= NULL
,	@ContactTypeRight_id	:= NULL
,	@ContactTypeLevel_id	:= NULL
,	@ContactTypeOrder_id	:= NULL

,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Mode_cd	:= "C"
)
;
*/
