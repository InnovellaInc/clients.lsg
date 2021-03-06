DROP PROCEDURE IF EXISTS	uspUser_Company
;

DELIMITER //
CREATE PROCEDURE	uspUser_Company
(
	User_id		INT SIGNED		-- PK1 
,	User_tp		VARCHAR(64)		-- PK2 AK1
,	Company_id	INT SIGNED		-- PK1 
,	Company_tp	VARCHAR(64)		-- PK2 AK1
,	User_nm		VARCHAR(256)		--  AK2
,	User_cd		VARCHAR(128)	
,	Alias_nm	VARCHAR(256)		--  AK2
,	Hashed_cd	VARCHAR(128)
,	Email_nm	VARCHAR(256)
,	Challenge_cd	VARCHAR(128)
,	Response_cd	VARCHAR(128)
,	Company_nm	VARCHAR(256)
,	Company_cd	VARCHAR(128)	
,	User_tx		MEDIUMTEXT	
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
**	Name:		uspUser_Company
**	Type:		DB API procedure: Insert
**	Purpose:	To insert Resource data into tblResource_Company
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	4/12/2013
**	Modnumber:	00
**	Modification:	Original
**	NOTE: Special Case
	AK in parent tblUser = User_tp, User_nm 
	AK in tblResource_Company = Resrc_tp, Company_id, Company_tp, Resrc_nm
	AK for "User_Company" = User_tp(tblResource_Company.Resrc_tp), Company_tp, Company_nm, User_nm(tblResource_Company.Resrc_nm)
**
	A user type and user name exists once in tblUser and once in tblCompany
	A user type and user name exists once in tblUser but may exist once or more in tblResource_Conatct, tblResource_Project
	A user may belong to more than one Group which may belong to one or more Companies
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResource_Company';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'UPDATE';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'uspUser_Company';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
DECLARE	PK1		VARCHAR(255) DEFAULT CONCAT(User_id,",",User_tp,",",Company_id,",",Company_tp);
DECLARE	FK1		VARCHAR(255) DEFAULT CONCAT(User_id,",",User_tp);
DECLARE	FK2		VARCHAR(255) DEFAULT CONCAT(User_id,",",User_tp,",",Company_id,",",Company_tp);
###############################################################################
usp:
BEGIN
DECLARE CONTINUE HANDLER FOR NOT FOUND SET ProcFailed_fg	= 0;
	#######################################################################
	-- Initialize
	#######################################################################
	IF CallingProc_nm IS NULL OR CallingProc_nm = '' THEN SET CallingProc_nm = '';	END IF;
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;

	IF User_id IS NULL OR User_id = 0 THEN SET User_id =  -2147483647;	END IF;
	IF User_tp IS NULL OR User_tp = '' THEN SET User_tp = '-2147483647';	END IF;
	IF Company_id IS NULL OR Company_id = 0 THEN SET Company_id =  -2147483647;	END IF;
	IF Company_tp IS NULL OR Company_tp = '' THEN SET Company_tp = '-2147483647';	END IF;
	IF User_nm IS NULL OR User_nm = '' THEN SET User_nm = '-2147483647';	END IF;
	IF User_cd IS NULL OR User_cd = '' THEN SET User_cd = '-2147483647';	END IF;
	IF Hashed_cd IS NULL OR Hashed_cd = '' THEN SET Hashed_cd = '-2147483647';	END IF;
	IF Alias_nm IS NULL OR Alias_nm = '' THEN SET Alias_nm = '-2147483647';	END IF;
	IF Email_nm IS NULL OR Email_nm = '' THEN SET User_cd = '-2147483647';	END IF;
	IF Challenge_cd IS NULL OR Challenge_cd = '' THEN SET Challenge_cd = '-2147483647';	END IF;
	IF Response_cd IS NULL OR Response_cd = '' THEN SET Response_cd = '-2147483647';	END IF;
	IF Company_nm IS NULL OR Company_nm = '' THEN SET Company_nm = '-2147483647';	END IF;
	IF Company_cd IS NULL OR Company_cd = '' THEN SET Company_cd = '-2147483647';	END IF;
	IF User_tx IS NULL OR User_tx = '' THEN SET User_tx = '-2147483647';	END IF;
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
		,	@Table_nm	:= SYSTABLE
		);
		LEAVE	usp;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
	CALL	rspResource_Company
	(
		@Resrc_id	:= User_id
	,	@Resrc_tp	:= User_tp
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
		,	@Key_nm		:= PK1
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

	CALL	vspUser_Company
	(
		@User_id	:= User_id
	,	@User_tp	:= User_tp
	,	@Company_id	:= Company_id
	,	@Company_tp	:= Company_tp
	,	@User_nm	:= User_nm
	,	@User_cd	:= User_cd
	,	@Company_nm	:= Company_nm
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
	-- --------------------------------------------------------------------
	SET 	ADD_dm	= @ADD_dm;
	SET 	ADD_nm	= @ADD_nm;
	SET 	UPD_dm	= @UPD_dm;
	SET 	UPD_nm	= @UPD_nm;
	SET 	DEL_dm	= @DEL_dm;
	SET 	DEL_nm	= @DEL_nm;
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET @FK1	= CONCAT(IFNULL(User_id,"(null)"),",",User_tp);
	SET @FK2	= CONCAT(IFNULL(User_id,"(null)"),",",User_tp,",",IFNULL(Company_id,"(null)"),",",Company_tp);
	-- --------------------------------------------------------------------
	--
	--	RESTRICT MODE:
	--
	IF
		Mode_cd	= 'R'
	THEN
		SET 	@TABLE	= "tblUser";
		CALL	rspUser
		(
			@User_id	:= User_id
		,	@User_tp	:= User_tp
		,	@User_nm	:= User_nm
		,	@User_cd	:= User_cd
		,	@Hashed_cd	:= Hashed_cd
		,	@Email_nm	:= Email_nm
		,	@Challenge_cd	:= Challenge_cd
		,	@Response_cd	:= Response_cd
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
			,	@Key_nm		:= FK1
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
		SET 	@TABLE	= "tblResource_Company";
		CALL	rspResource_Company
		(
			@Resrc_id	:= User_id
		,	@Resrc_tp	:= User_tp
		,	@Company_id	:= Company_id
		,	@Company_tp	:= Company_tp
		,	@Resrc_nm	:= User_nm
		,	@Resrc_cd	:= User_cd
		,	@Alias_nm	:= Alias_nm
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
			,	@Key_nm		:= FK2
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
		SET 	@TABLE	= "tblUser";
		--	-------------------------------------------------------
		CALL	uspUser
		(
			@User_id	:= User_id
		,	@User_tp	:= User_tp
		,	@User_nm	:= User_nm
		,	@User_cd	:= User_cd
		,	@Hashed_cd	:= Hashed_cd
		,	@Email_nm	:= Email_nm
		,	@Challenge_cd	:= Challenge_cd
		,	@Response_cd	:= Response_cd
		,	@User_tx	:= User_tx
		,	@UserADD_dm	:= ADD_dm
		,	@UserADD_nm	:= ADD_nm
		,	@UserUPD_dm	:= UPD_dm
		,	@UserUPD_nm	:= UPD_nm
		,	@UserDEL_dm	:= DEL_dm
		,	@UserDEL_nm	:= DEL_nm
		,	@ParentUser_tp	:= NULL
		,	@UserType_tx	:= NULL
		,	@UserTypeLeft_id	:= NULL
		,	@UserTypeRight_id	:= NULL
		,	@UserTypeLevel_id	:= NULL
		,	@UserTypeOrder_id	:= NULL
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		)
		;
		--	-------------------------------------------------------
		SET 	@TABLE	= "tblResource_Company";
		--	-------------------------------------------------------
		CALL	uspResource_Company
		(
			@Resrc_id	:= User_id
		,	@Resrc_tp	:= User_tp
		,	@Company_id	:= Company_id
		,	@Company_tp	:= Company_tp
		,	@Resrc_nm	:= User_nm
		,	@Resrc_cd	:= User_cd
		,	@Alias_nm	:= Alias_nm
		,	@Company_nm := Company_nm
		,	@Company_cd := Company_cd
		,	@Resrc_tx   := User_tx
		,	@Company_tx := Company_tx
		,	@ADD_dm	:= ADD_dm
		,	@ADD_nm	:= ADD_nm
		,	@UPD_dm	:= UPD_dm
		,	@UPD_nm	:= UPD_nm
		,	@DEL_dm	:= DEL_dm
		,	@DEL_nm	:= DEL_nm
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		)
		;
		--	Set the proc IN parameters to the parent usp INOUT parameters
		SET 	Company_id	= @Company_id;
	END IF;
	#######################################################################
	-- Update NON-KEY values
	#######################################################################
	-- --------------------------------------------------------------------
	-- Invoke an UPDATE when a non-key attribute is actually modified.
	-- --------------------------------------------------------------------
	#######################################################################
	-- Insert this transaction in the transaction history log
	#######################################################################
END usp;
###############################################################################
END
//
DELIMITER ;
;

/*
SET @User_id = NULL; SET @Company_id = NULL;
CALL	uspUser_Company
(
	@User_id
,	@User_tp	:= "User"
,	@Company_id
,	@Company_tp	:= "Company"
,	@User_nm	:= "user1"
,	@User_cd	:= "password"
,	@Alias_nm	:= "test user1"
,	@Hashed_cd	:= NULL
,	@Email_nm	:= "tu1@vt.com"
,	@Challenge_cd	:= "pet name"
,	@Response_cd	:= "Bentley"
,	@Company_nm := "PHP Company-1"
,	@Company_cd := NULL
,	@User_tx	:= "test user 1"
,	@Company_tx := NULL
,	@ADD_dm	:= NULL
,	@ADD_nm	:= NULL
,	@UPD_dm	:= NULL
,	@UPD_nm	:= NULL
,	@DEL_dm	:= NULL
,	@DEL_nm	:= NULL
,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Mode_cd	:= "C"
)
;
*/