DROP PROCEDURE IF EXISTS	uspResource_Company
;

DELIMITER //
CREATE PROCEDURE	uspResource_Company
(
	Resrc_id	INT SIGNED		-- PK1 
,	Resrc_tp	VARCHAR(64)		-- PK2 AK1
,	Company_id	INT SIGNED		-- PK1 
,	Company_tp	VARCHAR(64)		-- PK2 AK1
,	Resrc_nm	VARCHAR(256)		--  AK2
,	Resrc_cd	VARCHAR(128)	
,	Alias_nm	VARCHAR(256)
,	Company_nm	VARCHAR(256)
,	Company_cd	VARCHAR(128)	
,	Resrc_tx	MEDIUMTEXT	
,	Company_tx	MEDIUMTEXT	
,	ADD_dm		DATETIME	
,	ADD_nm		VARCHAR(128)	
,	UPD_dm		DATETIME	
,	UPD_nm		VARCHAR(128)	
,	DEL_dm		DATETIME	
,	DEL_nm		VARCHAR(128)	

,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		uspResource_Company
**	Type:		DB API procedure: Insert
**	Purpose:	To insert Resource data into tblResource_Company
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	4/12/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResource_Company';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'UPDATE';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'uspResource_Company';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
DECLARE	PK1		VARCHAR(255) DEFAULT CONCAT(Resrc_id,",",Resrc_tp,",",Company_id,",",Company_tp);
DECLARE	FK1		VARCHAR(255) DEFAULT CONCAT(Resrc_tp,",",Company_tp);
DECLARE	FK2		VARCHAR(255) DEFAULT CONCAT(Resrc_id,",",Resrc_tp);
DECLARE	FK3		VARCHAR(255) DEFAULT CONCAT(Company_id,",",Company_tp);
DECLARE	AK1		VARCHAR(255) DEFAULT CONCAT(Resrc_tp,",",Company_id,",",Company_tp,",",Resrc_nm);
DECLARE	AK2		VARCHAR(255) DEFAULT CONCAT(Resrc_tp,",",Company_tp,",",Company_nm,",",Resrc_nm);
###############################################################################
usp:
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
	IF Company_id IS NULL OR Company_id = 0 THEN SET Company_id =  -2147483647;	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = '-2147483647';	END IF;
	IF Resrc_nm IS NULL OR Resrc_nm = '' THEN SET Resrc_nm = '-2147483647';	END IF;
	IF Resrc_cd IS NULL OR Resrc_cd = '' THEN SET Resrc_cd = '-2147483647';	END IF;
	IF Alias_nm IS NULL OR Alias_nm = '' THEN SET Alias_nm = '-2147483647';	END IF;
	IF Company_nm IS NULL OR Company_nm = '' THEN SET Company_nm = '-2147483647';	END IF;
	IF Company_cd IS NULL OR Company_cd = '' THEN SET Company_cd = '-2147483647';	END IF;
	IF Resrc_tx IS NULL OR Resrc_tx = '' THEN SET Resrc_tx = '-2147483647';	END IF;
	IF Company_tx IS NULL OR Company_tx = '' THEN SET Company_tx = '-2147483647';	END IF;
	IF ADD_dm IS NULL THEN SET ADD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = '-2147483647';	END IF;
	IF UPD_dm IS NULL THEN SET UPD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = '-2147483647';	END IF;
	IF DEL_dm IS NULL THEN SET DEL_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = '-2147483647';	END IF;
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
		,	@Table_nm	:= 'tblResource_Company'
		);
		LEAVE	usp;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
	CALL	rspResource_Company
	(
		@Resrc_id	:= Resrc_id
	,	@Resrc_tp	:= Resrc_tp
	,	@Company_id	:= Company_id
	,	@Company_tp	:= Company_tp
	,	@Resrc_nm	:= NULL
	,	@Resrc_cd	:= NULL
	,	@Alias_nm	:= NULL
	,	@ADD_dm	:= ADD_dm
	,	@ADD_nm	:= ADD_nm
	,	@UPD_dm	:= UPD_dm
	,	@UPD_nm	:= UPD_nm
	,	@DEL_dm	:= DEL_dm
	,	@DEL_nm	:= DEL_nm
	,	@Key_cd		:= Key_cd
	,	@RowExists_fg
	);
	IF
		@RowExists_fg	= 0	-- If PK row dows not exists then return with error
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

	CALL	vspResource_Company
	(
		@Resrc_id	:= Resrc_id
	,	@Resrc_tp	:= Resrc_tp
	,	@Company_id	:= Company_id
	,	@Company_tp	:= Company_tp
	,	@Resrc_nm	:= Resrc_nm
	,	@Resrc_cd	:= Resrc_cd
	,	@Alias_nm	:= Alias_nm	
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
		,	@CallingProc_nm	:= 'vspResource_Company'
		);
		LEAVE	usp;
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
	SET	@FK1	= CONCAT(Resrc_tp,",",Company_tp);
	SET	@FK2	= CONCAT(IFNULL(Resrc_id,"(null)"),",",Resrc_tp);
	SET 	@FK3	= CONCAT(IFNULL(Company_id,"(null)"),",",Company_tp);
	--
	--	RESTRICT MODE:
	--
	IF
		Mode_cd	= 'R'
	THEN
		SET 	@TABLE	= "tblResourceType_CompanyType";
		CALL	rspResourceType_CompanyType
		(
			@Resrc_tp	:= Resrc_tp
		,	@Company_tp	:= Company_tp
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);

			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	usp;
		END IF;
		SET 	@TABLE	= "tblCompany";
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
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK3
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	usp;
		END IF;
		SET 	@TABLE	= "tblResource";
		CALL	rspResource
		(
			@Resrc_id	:= Resrc_id
		,	@Resrc_tp	:= Resrc_tp
		,	@Resrc_tx	:= Resrc_tx
		,	@ADD_dm	:= ADD_dm
		,	@ADD_nm	:= ADD_nm
		,	@UPD_dm	:= UPD_dm
		,	@UPD_nm	:= UPD_nm
		,	@DEL_dm	:= DEL_dm
		,	@DEL_nm	:= DEL_nm
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in parent table not found!
		THEN
			SET ProcFailed_fg	= TRUE;
			CALL 	errFKNotExist
			(
				@Proc_nm	:= Proc_nm
			,	@Table_nm	:= @TABLE
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK2
			);
			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= @TABLE
			);
			LEAVE	usp;
		END IF;
	END IF;
	--
	--	CASCADE MODE:
	--
	IF
		Mode_cd	= 'C'
	THEN
		--	-------------------------------------------------------
		SET 	@TABLE	= "tblCompany";
		--	-------------------------------------------------------
		CALL	uspCompany
		(
			@Company_id		:= Company_id
		,	@Company_tp		:= Company_tp
		,	@Company_nm		:= Company_nm
		,	@Company_cd		:= Company_cd
		,	@Company_tx		:= Company_tx
		,	@CompanyADD_dm		:= ADD_dm
		,	@CompanyADD_nm		:= ADD_nm
		,	@CompanyUPD_dm		:= UPD_dm
		,	@CompanyUPD_nm		:= UPD_dm
		,	@CompanyDEL_dm		:= DEL_dm
		,	@CompanyDEL_nm		:= DEL_nm
		,	@ParentCompany_tp	:= NULL
		,	@CompanyType_tx		:= NULL
		,	@CompanyLeft_id		:= NULL
		,	@CompanyRight_id	:= NULL
		,	@CompanyLevel_id	:= NULL
		,	@CompanyOrder_id	:= NULL

		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		);
		--	-------------------------------------------------------
		SET 	@TABLE	= "tblResource";
		--	-------------------------------------------------------
		CALL	uspResource
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
		,	@ParentResrc_tp	:= NULL
		,	@ResrcType_tx	:= NULL
		,	@Left_id	:= NULL
		,	@Right_id	:= NULL
		,	@Level_id	:= NULL
		,	@Order_id	:= NULL
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		);
		--	-------------------------------------------------------
		--	-------------------------------------------------------
	END IF;
	#######################################################################
	-- Update NON-KEY values
	#######################################################################
	-- --------------------------------------------------------------------
	-- Invoke an UPDATE when a non-key attribute is actually modified.
	-- --------------------------------------------------------------------
	IF
		Resrc_nm	= '-2147483647'
	AND	Resrc_cd	= '-2147483647'
	AND	Alias_nm	= '-2147483647'
-- 	AND	ADD_dm	= '0000-00-00 00:00:00'
-- 	AND	ADD_nm	= '-2147483647'
	AND	UPD_dm	= '0000-00-00 00:00:00'
	AND	UPD_nm	= '-2147483647'
	AND	DEL_dm	= '0000-00-00 00:00:00'
	AND	DEL_nm	= '-2147483647'
	THEN
		LEAVE	USP;
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
		tblResource_Company
	SET
		tblResource_Company.Resrc_nm	= 
		CASE
			WHEN	Resrc_nm	= '-2147483647'
			THEN	tblResource_Company.Resrc_nm
			ELSE 	Resrc_nm
		END
	,	tblResource_Company.Resrc_cd	= 
		CASE
			WHEN	Resrc_cd	= '-2147483647'
			THEN	tblResource_Company.Resrc_cd
			ELSE 	Resrc_cd
		END
	,	tblResource_Company.Alias_nm	=
		CASE
			WHEN	Alias_nm	= '-2147483647'
			THEN	tblResource_Company.Alias_nm
			ELSE 	Alias_nm
		END
	,	tblResource_Company.UPD_dm	=
		CASE
			WHEN	UPD_dm	= '0000-00-00 00:00:00'
			THEN	tblResource_Company.UPD_dm
			ELSE 	UPD_dm
		END
	,	tblResource_Company.UPD_nm	=
		CASE
			WHEN	UPD_nm	= '-2147483647'
			THEN	tblResource_Company.UPD_nm
			ELSE 	UPD_nm
		END
	,	tblResource_Company.DEL_dm	=
		CASE
			WHEN	DEL_dm	= '0000-00-00 00:00:00'
			THEN	tblResource_Company.DEL_dm
			ELSE 	DEL_dm
		END
	,	tblResource_Company.DEL_nm	=
		CASE
			WHEN	DEL_nm	= '-2147483647'
			THEN	tblResource_Company.DEL_nm
			ELSE 	DEL_nm
		END
	WHERE	1=1
	AND
		tblResource_Company.Resrc_id	= Resrc_id
	AND	tblResource_Company.Resrc_tp	= Resrc_tp
	AND	tblResource_Company.Company_id	= Company_id
	AND	tblResource_Company.Company_tp	= Company_tp
	;
END;
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################

	#######################################################################
END usp;
###############################################################################
END
//
DELIMITER ;
;

/*
CALL	uspResource_Company
(
	@Resrc_id	:= Resrc_id
,	@Resrc_tp	:= Resrc_tp
,	@Company_id := Company_id
,	@Company_tp	:= Company_tp
,	@Resrc_nm	:= Resrc_nm
,	@Resrc_cd	:= Resrc_cd
,	@Alias_nm	:= Alias_nm
,	@Company_nm := Company_nm
,	@Company_cd := Company_cd
,	@Resrc_tx   := Resrc_tx
,	@Company_tx := Company_tx
,	@ADD_dm	:= NULL
,	@ADD_nm	:= NULL
,	@UPD_dm	:= NULL
,	@UPD_nm	:= NULL
,	@DEL_dm	:= NULL
,	@DEL_nm	:= NULL
,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Mode_cd	:= NULL
)
;
*/