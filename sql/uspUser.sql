DROP PROCEDURE IF EXISTS	uspUser
;

DELIMITER //
CREATE PROCEDURE	uspUser
(
	User_id		INT SIGNED		-- PK1 
,	User_tp		VARCHAR(64)		-- PK2 AK1
,	User_nm		VARCHAR(256)		--  AK2
,	User_cd		VARCHAR(128)	
,	Hashed_cd	VARCHAR(128)
,	Email_nm	VARCHAR(256)
,	Challenge_cd	VARCHAR(128)
,	Response_cd	VARCHAR(128)
,	User_tx		MEDIUMTEXT	
,	UserADD_dm	DATETIME	
,	UserADD_nm	VARCHAR(256)	
,	UserUPD_dm	DATETIME	
,	UserUPD_nm	VARCHAR(256)	
,	UserDEL_dm	DATETIME	
,	UserDEL_nm	VARCHAR(256)	
,	ParentUser_tp	VARCHAR(64)	
,	UserType_tx	MEDIUMTEXT	
,	UserTypeLeft_id	INT SIGNED	
,	UserTypeRight_id	INT SIGNED	
,	UserTypeLevel_id	INT SIGNED	
,	UserTypeOrder_id	INT SIGNED	

,	CallingProc_nm	VARCHAR(128)	-- CallingProc	The sproc calling this proc
,	Source_nm	VARCHAR(128)	-- SourceSystem	System name
,	Token_cd	VARCHAR(64)	-- Token	Security Token
,	Mode_cd		VARCHAR(16)	-- Mode	Database cascade mode code
)
BEGIN
/*
**	Name:		uspUser
**	Type:		DB API procedure: Insert
**	Purpose:	To update User data in tblUser
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
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'UPDATE';
DECLARE	Proc_nm		VARCHAR(255) DEFAULT 'uspUser';
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

	IF User_id IS NULL OR User_id = 0 THEN SET User_id =  -2147483647;	END IF;
	IF User_tp IS NULL OR User_tp = '' THEN SET User_tp = '-2147483647';	END IF;
	IF User_nm IS NULL OR User_nm = '' THEN SET User_nm = '-2147483647';	END IF;
	IF User_cd IS NULL OR User_cd = '' THEN SET User_cd = '-2147483647';	END IF;
	IF Hashed_cd IS NULL OR Hashed_cd = '' THEN SET Hashed_cd = '-2147483647';	END IF;
	IF Email_nm IS NULL OR Email_nm = '' THEN SET User_cd = '-2147483647';	END IF;
	IF Challenge_cd IS NULL OR Challenge_cd = '' THEN SET Challenge_cd = '-2147483647';	END IF;
	IF Response_cd IS NULL OR Response_cd = '' THEN SET Response_cd = '-2147483647';	END IF;
	IF User_tx IS NULL OR User_tx = '' THEN SET User_tx = '-2147483647';	END IF;
	IF UserADD_dm IS NULL OR UserADD_dm = '' THEN SET UserADD_dm = '0000-00-00 00:00:00';	END IF;
	IF UserADD_nm IS NULL OR UserADD_nm = '' THEN SET UserADD_nm = '-2147483647';	END IF;
	IF UserUPD_dm IS NULL OR UserUPD_dm = '' THEN SET UserUPD_dm = '0000-00-00 00:00:00';	END IF;
	IF UserUPD_nm IS NULL OR UserUPD_nm = '' THEN SET UserUPD_nm = '-2147483647';	END IF;
	IF UserDEL_dm IS NULL OR UserDEL_dm = '' THEN SET UserDEL_dm = '0000-00-00 00:00:00';	END IF;
	IF UserDEL_nm IS NULL OR UserDEL_nm = '' THEN SET UserDEL_nm = '-2147483647';	END IF;
	IF ParentUser_tp IS NULL OR ParentUser_tp = '' THEN SET ParentUser_tp = '-2147483647';	END IF;
	IF UserType_tx IS NULL OR UserType_tx = '' THEN SET UserType_tx = '-2147483647';	END IF;
	IF UserTypeLeft_id IS NULL OR UserTypeLeft_id = 0 THEN SET UserTypeLeft_id =  -2147483647;	END IF;
	IF UserTypeRight_id IS NULL OR UserTypeRight_id = 0 THEN SET UserTypeRight_id =  -2147483647;	END IF;
	IF UserTypeLevel_id IS NULL OR UserTypeLevel_id = 0 THEN SET UserTypeLevel_id =  -2147483647;	END IF;
	IF UserTypeOrder_id IS NULL OR UserTypeOrder_id = 0 THEN SET UserTypeOrder_id =  -2147483647;	END IF;
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
	SET 	@PK1	= CONCAT(User_id,",",User_tp);
	-- --------------------------------------------------------------------
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
	--	Set the VSP INOUT parameters to the proc IN parameters
	-- --------------------------------------------------------------------
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
		LEAVE	USP;
	END IF;
	--	Set the proc IN parameters to the VSP INOUT parameters
	#######################################################################
	-- Check Referential Integerity
	#######################################################################
	SET 	@FK1	= CONCAT(User_tp);
	SET 	@FK2	= CONCAT(User_id,",",User_tp);
	-- --------------------------------------------------------------------
	IF
		Mode_cd	= 'R'
	THEN
		--
		--	RESTRICT MODE:	tblUserType
		--
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
			,	@Table_nm	:= 'tblUserType'
			,	@Action_nm	:= SYSRIGHT
			,	@Key_nm		:= @FK1
			);

			CALL 	errFailedMode
			(
				@Proc_nm	:= Proc_nm
			,	@Mode_cd	:= Mode_cd
			,	@Action_nm	:= SYSRIGHT
			,	@Table_nm	:= 'tblUserType'
			);
			LEAVE	USP;
		END IF;
		--
		--	RESTRICT MODE:	tblResource
		--
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
			@RowExists_fg	= 0   -- Foreign key in tblResource not found!
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
			LEAVE	USP;
		END IF;
	END IF;
	-- --------------------------------------------------------------------
	-- --------------------------------------------------------------------
	IF
		Mode_cd	= 'C'
	THEN
		--
		--	CASCADE MODE:	tblUserType
		--
		CALL	uspUserType
		(
			@User_tp		:= User_tp
		,	@ParentUser_tp	:= ParentUser_tp
		,	@UserType_tx		:= UserType_tx
		,	@UserTypeLeft_id	:= UserTypeLeft_id
		,	@UserTypeRight_id	:= UserTypeRight_id
		,	@UserTypeLevel_id	:= UserTypeLevel_id
		,	@UserTypeOrder_id	:= UserTypeOrder_id

		,	@CallingProc_nm	:= CallingProc_nm
		,	@Source_nm	:= Source_nm
		,	@Token_cd	:= Token_cd
		,	@Mode_cd	:= 'R'	-- This Table Is Restricted and Does Not Allow A Cascade From an FK Table.
		);
		--
		--	CASCADE MODE:	tblResource
		--
		CALL	uspResource
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
	END IF;
	#######################################################################
	-- Update NON-KEY values
	#######################################################################
	-- --------------------------------------------------------------------
	-- Invoke an UPDATE when a non-key attribute is actually modified.
	-- --------------------------------------------------------------------
	IF 	
		User_nm	= '-2147483647'
	AND 	User_cd	= '-2147483647'
	AND 	Hashed_cd	= '-2147483647'
	AND 	Email_nm	= '-2147483647'
	AND 	Challenge_cd	= '-2147483647'
	AND 	Response_cd	= '-2147483647'
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
		tblUser
	SET	
		tblUser.User_nm	=
		CASE
			WHEN	User_nm	= '-2147483647'
			THEN	tblUser.User_nm
			ELSE 	User_nm
		END
	,	tblUser.User_cd	=
		CASE
			WHEN	User_cd	= '-2147483647'
			THEN	tblUser.User_cd
			ELSE 	User_cd
		END
	,	tblUser.Hashed_cd	=
		CASE
			WHEN	Hashed_cd	= '-2147483647'
			THEN	tblUser.Hashed_cd
			ELSE 	Hashed_cd
		END
	,	tblUser.Email_nm	=
		CASE
			WHEN	Email_nm	= '-2147483647'
			THEN	tblUser.Email_nm
			ELSE 	Email_nm
		END
	,	tblUser.Challenge_cd	=
		CASE
			WHEN	Challenge_cd	= '-2147483647'
			THEN	tblUser.Challenge_cd
			ELSE 	Challenge_cd
		END
	,	tblUser.Response_cd	=
		CASE
			WHEN	Response_cd	= '-2147483647'
			THEN	tblUser.Response_cd
			ELSE 	Response_cd
		END
	WHERE
		tblUser.User_id	= User_id
	AND	tblUser.User_tp	= User_tp
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

