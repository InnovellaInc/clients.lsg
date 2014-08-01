DROP PROCEDURE IF EXISTS	uspCompanyType
;

DELIMITER //
CREATE PROCEDURE	uspCompanyType
(
	Company_tp		VARCHAR(64)		-- PK1 
,	ParentCompany_tp		VARCHAR(64)	
,	CompanyType_tx		MEDIUMTEXT	
,	CompanyTypeLeft_id		INT SIGNED	
,	CompanyTypeRight_id		INT SIGNED	
,	CompanyTypeLevel_id		INT SIGNED	
,	CompanyTypeOrder_id		INT SIGNED	

,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		uspCompanyType
**	Type:		DB API procedure: Insert
**	Purpose:	To insert CompanyType data into tblCompanyType
**	Author:		Solomon S. Shacter
**	Organiztion:	Innovella, Inc.
**
**	Modified:	6/14/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblCompanyType';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'UPDATE';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'uspCompanyType';
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

	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = '-2147483647';	END IF;
	IF ParentCompany_tp IS NULL OR ParentCompany_tp = '' THEN SET ParentCompany_tp = '-2147483647';	END IF;
	IF CompanyType_tx IS NULL OR CompanyType_tx = '' THEN SET CompanyType_tx = '-2147483647';	END IF;
	IF CompanyTypeLeft_id IS NULL OR CompanyTypeLeft_id = 0 THEN SET CompanyTypeLeft_id =  -2147483647;	END IF;
	IF CompanyTypeRight_id IS NULL OR CompanyTypeRight_id = 0 THEN SET CompanyTypeRight_id =  -2147483647;	END IF;
	IF CompanyTypeLevel_id IS NULL OR CompanyTypeLevel_id = 0 THEN SET CompanyTypeLevel_id =  -2147483647;	END IF;
	IF CompanyTypeOrder_id IS NULL OR CompanyTypeOrder_id = 0 THEN SET CompanyTypeOrder_id =  -2147483647;	END IF;
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
	SET 	@PK1	= CONCAT(Company_tp);
	-- --------------------------------------------------------------------
	CALL	rspCompanyType
	(
		@Company_tp	:= Company_tp
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
	-- Return if Alternate Key VIEW record exists
	#######################################################################

	#######################################################################
	-- Validate attributes
	#######################################################################
	CALL	vspCompanyType
	(
		@Company_tp	:= Company_tp

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
	SET	@FK1	= CONCAT(Company_tp);
	-- --------------------------------------------------------------------
	--
	--	RESTRICT MODE:	tblResourceType
	--
	IF
		Mode_cd	= 'R'
	THEN
		CALL	rspResourceType
		(
			@Resrc_tp	:= Company_tp
		,	@ParentResrc_tp	:= ParentCompany_tp
		,	@ResrcType_tx	:= CompanyType_tx
		,	@Left_id	:= CompanyTypeLeft_id
		,	@Right_id	:= CompanyTypeRight_id
		,	@Level_id	:= CompanyTypeLevel_id
		,	@Order_id	:= CompanyTypeOrder_id
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
			@Resrc_tp	:= Company_tp
		,	@ParentResrc_tp	:= ParentCompany_tp
		,	@ResrcType_tx	:= CompanyType_tx
		,	@Left_id	:= CompanyTypeLeft_id
		,	@Right_id	:= CompanyTypeRight_id
		,	@Level_id	:= CompanyTypeLevel_id
		,	@Order_id	:= CompanyTypeOrder_id

		,	@CallingProc_nm	:= CallingProc_nm
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
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		SET ProcFailed_fg	= TRUE;
		CALL 	errFailedCompany
		(
			@Proc_nm	:= Proc_nm
		,	@Table_nm	:= SYSTABLE
		,	@Action_nm	:= SYSRIGHT
		);
	END;

END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
	#######################################################################
END	USP;
###############################################################################
END
//
DELIMITER ;
;

