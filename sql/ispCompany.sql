DROP PROCEDURE IF EXISTS	ispCompany
;

DELIMITER //
CREATE PROCEDURE	ispCompany
(
INOUT	Company_id		INT SIGNED		-- PK1 
,	Company_tp		VARCHAR(64)		-- PK2 AK1
,	Company_nm		VARCHAR(256)		--  AK2
,	Company_cd		VARCHAR(128)	
,	Company_tx		MEDIUMTEXT	
,	CompanyADD_dm		DATETIME	
,	CompanyADD_nm		VARCHAR(256)	
,	CompanyUPD_dm		DATETIME	
,	CompanyUPD_nm		VARCHAR(256)	
,	CompanyDEL_dm		DATETIME	
,	CompanyDEL_nm		VARCHAR(256)	
,	ParentCompany_tp		VARCHAR(64)	
,	CompanyType_tx		MEDIUMTEXT	
,	CompanyTypeLeft_id		INT SIGNED	
,	CompanyTypeRight_id		INT SIGNED	
,	CompanyTypeLevel_id		INT SIGNED	
,	CompanyTypeOrder_id		INT SIGNED	

,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceCompany	Company name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		ispCompany
**	Type:		DB API procedure: Insert
**	Purpose:	To insert Company data into tblCompany
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	6/14/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblCompany';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'INSERT';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'ispCompany';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
DECLARE	FK1		VARCHAR(255) DEFAULT CONCAT(Company_tp);
DECLARE	FK2		VARCHAR(255) DEFAULT CONCAT(Company_id,",",Company_tp);
###############################################################################
ISP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;

	IF Company_id = '0' OR Company_id = 0 THEN SET Company_id =  NULL;	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = NULL;	END IF;
	IF Company_nm IS NULL OR Company_nm = '' THEN SET Company_nm = NULL;	END IF;
	IF Company_cd IS NULL OR Company_cd = '' THEN SET Company_cd = NULL;	END IF;
	IF Company_tx IS NULL OR Company_tx = '' THEN SET Company_tx = NULL;	END IF;
	IF CompanyADD_dm IS NULL THEN SET CompanyADD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF CompanyADD_nm IS NULL OR CompanyADD_nm = '' THEN SET CompanyADD_nm = NULL;	END IF;
	IF CompanyUPD_dm IS NULL THEN SET CompanyUPD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF CompanyUPD_nm IS NULL OR CompanyUPD_nm = '' THEN SET CompanyUPD_nm = NULL;	END IF;
	IF CompanyDEL_dm IS NULL THEN SET CompanyDEL_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF CompanyDEL_nm IS NULL OR CompanyDEL_nm = '' THEN SET CompanyDEL_nm = NULL;	END IF;
	IF ParentCompany_tp IS NULL OR ParentCompany_tp = '' THEN SET ParentCompany_tp = NULL;	END IF;
	IF CompanyType_tx IS NULL OR CompanyType_tx = '' THEN SET CompanyType_tx = NULL;	END IF;
	IF CompanyTypeLeft_id = '0' OR CompanyTypeLeft_id = 0 THEN SET CompanyTypeLeft_id = NULL;	END IF;
	IF CompanyTypeRight_id = '0' OR CompanyTypeRight_id = 0 THEN SET CompanyTypeRight_id = NULL;	END IF;
	IF CompanyTypeLevel_id = '0' OR CompanyTypeLevel_id = 0 THEN SET CompanyTypeLevel_id = NULL;	END IF;
	IF CompanyTypeOrder_id = '0' OR CompanyTypeOrder_id = 0 THEN SET CompanyTypeOrder_id = NULL;	END IF;
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
	CALL	rspCompany
	(
		@Company_id	:= Company_id
	,	@Company_tp	:= Company_tp
	,	@Company_nm	:= Company_nm
	,	@Company_cd	:= Company_cd

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
				Company_id
			,	Company_tp
			,	Company_nm
			;
		END IF;
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################
	SELECT
		tvwCompany.Company_id
	,	tvwCompany.Company_tp
	INTO
		Company_id
	,	Company_tp
	FROM
		tvwCompany
	WHERE
		tvwCompany.Company_tp	= Company_tp
	AND	tvwCompany.Company_nm	= Company_nm
	;
	IF
		FOUND_ROWS()	> 0
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				Company_id
			,	Company_tp
			,	Company_nm
			;
		END IF;
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Validate attributes
	#######################################################################
	CALL	vspCompany
	(
		@Company_id	:= Company_id
	,	@Company_tp	:= Company_tp
	,	@Company_nm	:= Company_nm
	,	@Company_cd	:= Company_cd

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
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET	@FK1	= CONCAT(Company_tp);
	SET	@FK2	= CONCAT(Company_id,",",Company_tp);
	-- --------------------------------------------------------------------
	IF
		Mode_cd	= 'R'
	THEN
		--
		--	RESTRICT MODE:	tblCompanyType
		--
		CALL	rspCompanyType
		(
			@Company_tp	:= Company_tp
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);

		IF
			@RowExists_fg	= 0   -- Foreign key in tblCompanyType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= 'tblCompanyType'
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);

			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= 'tblCompanyType'
			);
			LEAVE	ISP;
		END IF;
		--
		--	RESTRICT MODE:	tblResource
		--
		CALL	rspResource
		(
			@Resrc_id	:= Company_id
		,	@Resrc_tp	:= Company_tp
		,	@Resrc_tx	:= Company_tx
		,	@ADD_dm		:= CompanyADD_dm
		,	@ADD_nm		:= CompanyADD_nm
		,	@UPD_dm		:= CompanyUPD_dm
		,	@UPD_nm		:= CompanyUPD_nm
		,	@DEL_dm		:= CompanyDEL_dm
		,	@DEL_nm		:= CompanyDEL_nm

		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);

		IF
			@RowExists_fg	= 0   -- Foreign key in tblCompanyType not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= 'tblResource'
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK2
			);

			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= 'tblResource'
			);
			LEAVE	ISP;
		END IF;
	END IF;
	-- --------------------------------------------------------------------
	-- --------------------------------------------------------------------
	IF
		Mode_cd	= 'C'
	THEN
		--
		--	CASCADE MODE:	tblCompanyType
		--
		CALL	ispCompanyType
		(
			@Company_tp		:= Company_tp
		,	@ParentCompany_tp	:= ParentCompany_tp
		,	@CompanyType_tx		:= CompanyType_tx
		,	@CompanyTypeLeft_id	:= CompanyTypeLeft_id
		,	@CompanyTypeRight_id	:= CompanyTypeRight_id
		,	@CompanyTypeLevel_id	:= CompanyTypeLevel_id
		,	@CompanyTypeOrder_id	:= CompanyTypeOrder_id

		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= 'R'	-- This Table Is Restricted and Does Not Allow A Cascade From an FK Table.
		);
		--
		--	CASCADE MODE:	tblResource
		--
		SET	@Resrc_id	= Company_id;
		CALL	ispResource
		(
			@Resrc_id
		,	@Resrc_tp	:= Company_tp
		,	@Resrc_tx	:= Company_tx
		,	@ADD_dm		:= CompanyADD_dm
		,	@ADD_nm		:= CompanyADD_nm
		,	@UPD_dm		:= CompanyUPD_dm
		,	@UPD_nm		:= CompanyUPD_nm
		,	@DEL_dm		:= CompanyDEL_dm
		,	@DEL_nm		:= CompanyDEL_nm
		,	@ParentResrc_tp	:= ParentCompany_tp
		,	@ResrcType_tx	:= CompanyType_tx
		,	@Left_id	:= CompanyTypeLeft_id
		,	@Right_id	:= CompanyTypeRight_id
		,	@Level_id	:= CompanyTypeLevel_id
		,	@Order_id	:= CompanyTypeOrder_id

		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		);
	END IF;
	#######################################################################
	-- Insert values
	#######################################################################
	--	Set the proc IN parameters to the parent ISP INOUT parameters
	SET Company_id	= @Resrc_id;
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
	INTO	tblCompany
	(
		Company_id
	,	Company_tp
	,	Company_nm
	,	Company_cd
	)
	VALUES
	(
		Company_id
	,	Company_tp
	,	Company_nm
	,	Company_cd
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
			Company_id
		,	Company_tp
		,	Company_nm
 		;
 	END IF;
	#######################################################################
END ISP;
###############################################################################
END
//
DELIMITER ;
;

/*
		CALL	ispCompany
		(
			@Company_id
		,	@Company_tp		:= Company_tp
		,	@Company_nm		:= Company_nm
		,	@Company_cd		:= Company_cd
		,	@Company_tx		:= Company_tx
		,	@CompanyADD_dm		:= CompanyADD_dm
		,	@CompanyADD_nm		:= CompanyADD_nm
		,	@CompanyUPD_dm		:= CompanyUPD_dm
		,	@CompanyUPD_nm		:= CompanyUPD_nm
		,	@CompanyDEL_dm		:= CompanyDEL_dm
		,	@CompanyDEL_nm		:= CompanyDEL_nm
		,	@ParentCompany_tp	:= ParentCompany_tp
		,	@CompanyType_tx		:= CompanyType_tx
		,	@CompanyLeft_id		:= CompanyTypeLeft_id
		,	@CompanyRight_id	:= CompanyTypeRight_id
		,	@CompanyLevel_id	:= CompanyTypeLevel_id
		,	@CompanyOrder_id	:= CompanyTypeOrder_id

		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		);

*/