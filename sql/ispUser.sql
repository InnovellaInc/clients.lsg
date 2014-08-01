DROP PROCEDURE IF EXISTS	ispUser
;

DELIMITER //
CREATE PROCEDURE	ispUser
(
INOUT	User_id		INT SIGNED		-- PK1 
,	User_tp		VARCHAR(64)		-- PK2 AK1
,	User_nm		VARCHAR(256)		--  AK2
,	User_cd		VARCHAR(128)	
,	Hashed_cd	VARCHAR(128)
,	Email_nm	VARCHAR(256)
,	Challenge_cd	VARCHAR(128)
,	Response_cd	VARCHAR(128)
,	User_tx		MEDIUMTEXT	
,	UserADD_dm		DATETIME	
,	UserADD_nm		VARCHAR(256)	
,	UserUPD_dm		DATETIME	
,	UserUPD_nm		VARCHAR(256)	
,	UserDEL_dm		DATETIME	
,	UserDEL_nm		VARCHAR(256)	
,	ParentUser_tp		VARCHAR(64)	
,	UserType_tx		MEDIUMTEXT	
,	UserTypeLeft_id		INT SIGNED	
,	UserTypeRight_id		INT SIGNED	
,	UserTypeLevel_id		INT SIGNED	
,	UserTypeOrder_id		INT SIGNED	

,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceUser	User name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		ispUser
**	Type:		DB API procedure: Insert
**	Purpose:	To insert User data into tblUser
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	6/14/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblUser';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'INSERT';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'ispUser';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
DECLARE	FK1		VARCHAR(255) DEFAULT CONCAT(User_tp);
DECLARE	FK2		VARCHAR(255) DEFAULT CONCAT(User_id,",",User_tp);
###############################################################################
ISP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	IF Source_nm IS NULL OR Source_nm = '' THEN SET Source_nm = '';	END IF;
	IF Token_cd IS NULL OR Token_cd = '' THEN SET Token_cd = '';	END IF;
	IF Mode_cd IS NULL OR Mode_cd = '' THEN SET Mode_cd = 'R';	END IF;

	IF User_id = '0' OR User_id = 0 THEN SET User_id =  NULL;	END IF;
	IF User_tp IS NULL OR User_tp = '' THEN SET User_tp = NULL;	END IF;
	IF User_nm IS NULL OR User_nm = '' THEN SET User_nm = NULL;	END IF;
	IF User_cd IS NULL OR User_cd = '' THEN SET ProcFailed_fg = TRUE;
	ELSE
		SET @salt := LPAD(CONV(FLOOR(RAND() * 0x100000000), 10, 16), 8 ,'0');
		SET Hashed_cd = CONCAT(@salt, SHA(CONCAT(@salt, User_cd)));
	END IF;
	IF Email_nm IS NULL OR Email_nm = '' THEN SET ProcFailed_fg = TRUE;	END IF;
	IF Challenge_cd IS NULL OR Challenge_cd = '' THEN SET Challenge_cd = NULL;	END IF;
	IF Response_cd IS NULL OR Response_cd = '' THEN SET Response_cd = NULL;	END IF;
	IF User_tx IS NULL OR User_tx = '' THEN SET User_tx = NULL;	END IF;
	IF UserADD_nm IS NULL OR UserADD_nm = '' THEN SET UserADD_nm = NULL;	END IF;
	IF UserUPD_nm IS NULL OR UserUPD_nm = '' THEN SET UserUPD_nm = NULL;	END IF;
	IF UserDEL_nm IS NULL OR UserDEL_nm = '' THEN SET UserDEL_nm = NULL;	END IF;
	IF ParentUser_tp IS NULL OR ParentUser_tp = '' THEN SET ParentUser_tp = NULL;	END IF;
	IF UserType_tx IS NULL OR UserType_tx = '' THEN SET UserType_tx = NULL;	END IF;
	IF UserTypeLeft_id = '0' OR UserTypeLeft_id = 0 THEN SET UserTypeLeft_id = NULL;	END IF;
	IF UserTypeRight_id = '0' OR UserTypeRight_id = 0 THEN SET UserTypeRight_id = NULL;	END IF;
	IF UserTypeLevel_id = '0' OR UserTypeLevel_id = 0 THEN SET UserTypeLevel_id = NULL;	END IF;
	IF UserTypeOrder_id = '0' OR UserTypeOrder_id = 0 THEN SET UserTypeOrder_id = NULL;	END IF;
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
		@RowExists_fg	= 1	-- If PK exists then return without error
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				User_id
			,	User_tp
			,	User_nm
			;
		END IF;
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Return if Alternate Key VIEW record exists
	#######################################################################
	SELECT
		tvwUser.User_id
	,	tvwUser.User_tp
	INTO
		User_id
	,	User_tp
	FROM
		tvwUser
	WHERE
		tvwUser.User_tp	= User_tp
	AND	tvwUser.User_nm	= User_nm
	;
	IF
		FOUND_ROWS()	> 0
	THEN
		IF
			CallingProc_nm	IS NULL OR CallingProc_nm = ''
		THEN
			SELECT
				User_id
			,	User_tp
			,	User_nm
			;
		END IF;
		LEAVE	ISP;
	END IF;
	#######################################################################
	-- Validate attributes
	#######################################################################
	CALL	vspUser
	(
		@User_id	:= User_id
	,	@User_tp	:= User_tp
	,	@User_nm	:= User_nm
	,	@User_cd	:= User_cd
	,	@Hashed_cd	:= Hashed_cd
	,	@Email_nm	:= Email_nm
	,	@Challenge_cd	:= Challenge_cd
	,	@Response_cd	:= Response_cd
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
	SET	@FK1	= CONCAT(User_tp);
	SET	@FK2	= CONCAT(IFNULL(User_id,"(null)"),",",User_tp);
	-- --------------------------------------------------------------------
	--
	--	RESTRICT MODE:
	--
	IF
		Mode_cd	= 'R'
	THEN
		SET 	@TABLE	= "tblUserType";
		CALL	rspUserType
		(
			@User_tp	:= User_tp
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblUserType not found!
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
			LEAVE	ISP;
		END IF;
		SET 	@TABLE	= "tblResource";
		CALL	rspResource
		(
			@Resrc_id	:= User_id
		,	@Resrc_tp	:= User_tp
		,	@Resrc_tx	:= User_tx
		,	@ADD_dm		:= UserADD_dm
		,	@ADD_nm		:= UserADD_nm
		,	@UPD_dm		:= UserUPD_dm
		,	@UPD_nm		:= UserUPD_nm
		,	@DEL_dm		:= UserDEL_dm
		,	@DEL_nm		:= UserDEL_nm
		,	@Key_cd		:= Key_cd
		,	@RowExists_fg
		);
		IF
			@RowExists_fg	= 0   -- Foreign key in tblUserType not found!
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
			LEAVE	ISP;
		END IF;
	END IF;
	-- --------------------------------------------------------------------
	-- --------------------------------------------------------------------
	--
	--	CASCADE MODE:
	--
	IF
		Mode_cd	= 'C'
	THEN
		SET 	@TABLE	= "tblUserType";
		CALL	ispUserType
		(
			@User_tp		:= User_tp
		,	@ParentUser_tp	:= ParentUser_tp
		,	@UserType_tx		:= UserType_tx
		,	@UserTypeLeft_id	:= UserTypeLeft_id
		,	@UserTypeRight_id	:= UserTypeRight_id
		,	@UserTypeLevel_id	:= UserTypeLevel_id
		,	@UserTypeOrder_id	:= UserTypeOrder_id
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= 'R'	-- This Table Is Restricted and Does Not Allow A Cascade From an FK Table.
		);
		SET 	@TABLE	= "tblResource";
		SET	@Resrc_id	= User_id;
		CALL	ispResource
		(
			@Resrc_id
		,	@Resrc_tp	:= User_tp
		,	@Resrc_tx	:= User_tx
		,	@ADD_dm		:= UserADD_dm
		,	@ADD_nm		:= UserADD_nm
		,	@UPD_dm		:= UserUPD_dm
		,	@UPD_nm		:= UserUPD_nm
		,	@DEL_dm		:= UserDEL_dm
		,	@DEL_nm		:= UserDEL_nm
		,	@ParentResrc_tp	:= ParentUser_tp
		,	@ResrcType_tx	:= UserType_tx
		,	@Left_id	:= UserTypeLeft_id
		,	@Right_id	:= UserTypeRight_id
		,	@Level_id	:= UserTypeLevel_id
		,	@Order_id	:= UserTypeOrder_id
		,	@CallingProc_nm	:= Proc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= Mode_cd
		);
		--	Set the proc IN parameters to the parent ISP INOUT parameters
		SET	User_id	= @Resrc_id;
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
	INTO	tblUser
	(
		User_id
	,	User_tp
	,	User_nm
	,	User_cd
	,	Hashed_cd
	,	Email_nm
	,	Challenge_cd
	,	Response_cd
	)
	VALUES
	(
		User_id
	,	User_tp
	,	User_nm
	,	User_cd
	,	Hashed_cd
	,	Email_nm
	,	Challenge_cd
	,	Response_cd
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
			User_id
		,	User_tp
		,	User_nm
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
SET @User_id = NULL;
CALL	ispUser
(
	@User_id
,	@User_tp	:= "User"
,	@User_nm	:= "user1"
,	@User_cd	:= "password"
,	@Hashed_cd	:= NULL
,	@Email_nm	:= "tu1@vt.com"
,	@Challenge_cd	:= "pet name"
,	@Response_cd	:= "Bentley"
,	@User_tx	:= "test user 1"
,	@UserADD_dm	:= NULL
,	@UserADD_nm	:= NULL
,	@UserUPD_dm	:= NULL
,	@UserUPD_nm	:= NULL
,	@UserDEL_dm	:= NULL
,	@UserDEL_nm	:= NULL
,	@ParentUser_tp	:= NULL
,	@UserType_tx		:= NULL
,	@UserTypeLeft_id	:= NULL
,	@UserTypeRight_id	:= NULL
,	@UserTypeLevel_id	:= NULL
,	@UserTypeOrder_id	:= NULL
,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Mode_cd	:= "C"
)
;
*/
