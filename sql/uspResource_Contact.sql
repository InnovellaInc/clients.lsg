DROP PROCEDURE IF EXISTS	uspResource_Contact
;

DELIMITER //
CREATE PROCEDURE	uspResource_Contact
(
	Resrc_id	INT SIGNED		-- PK1 
,	Resrc_tp	VARCHAR(64)		-- PK2 AK1
,	Contact_id	INT SIGNED		-- PK1 
,	Contact_tp	VARCHAR(64)		-- PK2 AK1
,	Contact_nm	VARCHAR(256)		--  AK2
,	Contact_cd	VARCHAR(128)	
,	Alias_nm	VARCHAR(256)
,	Address_nm	VARCHAR(256)
,	City_cd		VARCHAR(128)
,	State_cd	VARCHAR(128)
,	Zip_cd		VARCHAR(128)
,	Phone_cd	VARCHAR(128)
,	GPS_cd		VARCHAR(128)
,	Resrc_tx	MEDIUMTEXT	
,	Contact_tx	MEDIUMTEXT	
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
**	Name:		uspResource_Contact
**	Type:		DB API procedure: Insert
**	Purpose:	To insert Resource data into tblResource_Contact
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	4/12/2013
**	Modnumber:	00
**	Modification:	Original
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblResource_Contact';
DECLARE	SYSRIGHT	VARCHAR(40) DEFAULT 'UPDATE';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'uspResource_Contact';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
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
	IF Contact_id IS NULL OR Contact_id = 0 THEN SET Contact_id =  -2147483647;	END IF;
	IF Contact_tp IS NULL OR Contact_tp = '' THEN SET Contact_tp = '-2147483647';	END IF;
	IF Contact_nm IS NULL OR Contact_nm = '' THEN SET Contact_nm = '-2147483647';	END IF;
	IF Contact_cd IS NULL OR Contact_cd = '' THEN SET Contact_cd = '-2147483647';	END IF;
	IF Alias_nm IS NULL OR Alias_nm = '' THEN SET Alias_nm = '-2147483647';	END IF;
	IF Address_nm IS NULL OR Address_nm = '' THEN SET Address_nm = '-2147483647';	END IF;
	IF City_cd IS NULL OR City_cd = '' THEN SET City_cd = '-2147483647';	END IF;
	IF State_cd IS NULL OR State_cd = '' THEN SET State_cd = '-2147483647';	END IF;
	IF ZIP_cd IS NULL OR ZIP_cd = '' THEN SET ZIP_cd = '-2147483647';	END IF;
	IF Phone_cd IS NULL OR Phone_cd = '' THEN SET Phone_cd = '-2147483647';	END IF;
	IF GPS_cd IS NULL OR GPS_cd = '' THEN SET GPS_cd = '-2147483647';	END IF;
	IF Resrc_tx IS NULL OR Resrc_tx = '' THEN SET Resrc_tx = '-2147483647';	END IF;
	IF Contact_tx IS NULL OR Contact_tx = '' THEN SET Contact_tx = '-2147483647';	END IF;
	IF ADD_dm IS NULL THEN SET ADD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF ADD_nm IS NULL OR ADD_nm = '' THEN SET ADD_nm = '-2147483647';	END IF;
	IF UPD_dm IS NULL THEN SET UPD_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF UPD_nm IS NULL OR UPD_nm = '' THEN SET UPD_nm = '-2147483647';	END IF;
	IF DEL_dm IS NULL THEN SET DEL_dm = CAST('0000-00-00 00:00:00' AS DATETIME);	END IF;
	IF DEL_nm IS NULL OR DEL_nm = '' THEN SET DEL_nm = '-2147483647';	END IF;

	SET	@PK1	= CONCAT(IFNULL(Resrc_id,"(null)"),",",Resrc_tp,",",IFNULL(Contact_id,"(null)"),",",Contact_tp);
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
		,	@Table_nm	:= 'tblResource_Contact'
		);
		LEAVE	usp;
	END IF;
	#######################################################################
	-- Return if Primary Key TABLE record exists
	#######################################################################
	CALL	rspResource_Contact
	(
		@Resrc_id	:= Resrc_id
	,	@Resrc_tp	:= Resrc_tp
	,	@Contact_id	:= Contact_id
	,	@Contact_tp	:= Contact_tp
	,	@Contact_nm	:= NULL
	,	@Contact_cd	:= NULL
	,	@Alias_nm	:= NULL
	,	@Address_nm	:= Address_nm
	,	@City_cd	:= City_cd
	,	@State_cd	:= State_cd
	,	@Zip_cd		:= Zip_cd
	,	@Phone_cd	:= Phone_cd
	,	@GPS_cd		:= GPS_cd
	,	@ADD_dm	:= ADD_dm
	,	@ADD_nm	:= ADD_nm
	,	@UPD_dm	:= UPD_dm
	,	@UPD_nm	:= UPD_nm
	,	@DEL_dm	:= DEL_dm
	,	@DEL_nm	:= DEL_nm
	,	@Key_cd	:= Key_cd
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

	CALL	vspResource_Contact
	(
		@Resrc_id	:= Resrc_id
	,	@Resrc_tp	:= Resrc_tp
	,	@Contact_id	:= Contact_id
	,	@Contact_tp	:= Contact_tp
	,	@Contact_nm	:= Contact_nm
	,	@Contact_cd	:= Contact_cd
	,	@Alias_nm	:= Alias_nm
	,	@Address_nm	:= Address_nm
	,	@City_cd	:= City_cd
	,	@State_cd	:= State_cd
	,	@Zip_cd		:= Zip_cd
	,	@Phone_cd	:= Phone_cd
	,	@GPS_cd		:= GPS_cd
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
		,	@CallingProc_nm	:= 'vspResource_Contact'
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
	SET	@FK1	= CONCAT(Resrc_tp);
	SET	@FK2	= CONCAT(Contact_tp);
	SET	@FK3	= CONCAT(IFNULL(Resrc_id,"(null)"),",",Resrc_tp);
	SET	@FK4	= CONCAT(IFNULL(Contact_id,"(null)"),",",Contact_tp);
	SET	@AK1	= CONCAT(IFNULL(Resrc_id,"(null)"),",",Resrc_tp,",",Contact_tp);
	--
	--	RESTRICT MODE:
	--
	IF
		Mode_cd	= 'R'
	THEN
		SET 	@TABLE	= "tblResourceType";
		CALL	rspResourceType
		(
			@Resrc_tp	:= Resrc_tp
		,	@ParentResrc_tp	:= NULL
		,	@ResrcType_tx	:= NULL
		,	@Left_id	:= NULL
		,	@Right_id	:= NULL
		,	@Level_id	:= NULL
		,	@Order_id	:= NULL
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
		SET 	@TABLE	= "tblContactType";
		CALL	rspContactType
		(
			@Contact_tp	:= Contact_tp
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
		SET 	@TABLE	= "tblResource";	-- Contact
		CALL	rspResource
		(
			@Resrc_id	:= Contact_id
		,	@Resrc_tp	:= Contact_tp
		,	@Resrc_tx	:= Contact_tx
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
			,	@Key_nm		:= @FK4
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
		SET 	@TABLE	= "tblResource";	-- Contact
		--	-------------------------------------------------------
		CALL	uspResource
		(
			@Resrc_id	:= Contact_id
		,	@Resrc_tp	:= Contact_tp
		,	@Resrc_tx	:= Contact_tx
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
		Contact_nm	= '-2147483647'
	AND	Contact_cd	= '-2147483647'
	AND	Alias_nm	= '-2147483647'
	AND	Address_nm	= '-2147483647'
	AND	City_cd		= '-2147483647'
	AND	State_cd	= '-2147483647'
	AND	ZIP_cd		= '-2147483647'
	AND	Phone_cd	= '-2147483647'
	AND	GPS_cd	= '-2147483647'
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
		tblResource_Contact
	SET
		tblResource_Contact.Contact_nm	= 
		CASE
			WHEN	Contact_nm	= '-2147483647'
			THEN	tblResource_Contact.Contact_nm
			ELSE 	Contact_nm
		END
	,	tblResource_Contact.Contact_cd	= 
		CASE
			WHEN	Contact_cd	= '-2147483647'
			THEN	tblResource_Contact.Contact_cd
			ELSE 	Contact_cd
		END
	,	tblResource_Contact.Alias_nm	=
		CASE
			WHEN	Alias_nm	= '-2147483647'
			THEN	tblResource_Contact.Alias_nm
			ELSE 	Alias_nm
		END
	,	tblResource_Contact.Address_nm	=
		CASE
			WHEN	Address_nm	= '-2147483647'
			THEN	tblResource_Contact.Address_nm
			ELSE 	Address_nm
		END
	,	tblResource_Contact.City_cd	=
		CASE
			WHEN	City_cd	= '-2147483647'
			THEN	tblResource_Contact.City_cd
			ELSE 	City_cd
		END
	,	tblResource_Contact.State_cd	=
		CASE
			WHEN	State_cd	= '-2147483647'
			THEN	tblResource_Contact.State_cd
			ELSE 	State_cd
		END
	,	tblResource_Contact.ZIP_cd	=
		CASE
			WHEN	ZIP_cd	= '-2147483647'
			THEN	tblResource_Contact.ZIP_cd
			ELSE 	ZIP_cd
		END
	,	tblResource_Contact.Phone_cd	=
		CASE
			WHEN	Phone_cd	= '-2147483647'
			THEN	tblResource_Contact.Phone_cd
			ELSE 	Phone_cd
		END
	,	tblResource_Contact.GPS_cd	=
		CASE
			WHEN	GPS_cd	= '-2147483647'
			THEN	tblResource_Contact.GPS_cd
			ELSE 	GPS_cd
		END
	,	tblResource_Contact.UPD_dm	=
		CASE
			WHEN	UPD_dm	= '0000-00-00 00:00:00'
			THEN	tblResource_Contact.UPD_dm
			ELSE 	UPD_dm
		END
	,	tblResource_Contact.UPD_nm	=
		CASE
			WHEN	UPD_nm	= '-2147483647'
			THEN	tblResource_Contact.UPD_nm
			ELSE 	UPD_nm
		END
	,	tblResource_Contact.DEL_dm	=
		CASE
			WHEN	DEL_dm	= '0000-00-00 00:00:00'
			THEN	tblResource_Contact.DEL_dm
			ELSE 	DEL_dm
		END
	,	tblResource_Contact.DEL_nm	=
		CASE
			WHEN	DEL_nm	= '-2147483647'
			THEN	tblResource_Contact.DEL_nm
			ELSE 	DEL_nm
		END
	WHERE	1=1
	AND
		tblResource_Contact.Resrc_id	= Resrc_id
	AND	tblResource_Contact.Resrc_tp	= Resrc_tp
	AND	tblResource_Contact.Contact_id	= Contact_id
	AND	tblResource_Contact.Contact_tp	= Contact_tp
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
CALL	uspResource_Contact
(
	@Resrc_id	:= Resrc_id
,	@Resrc_tp	:= Resrc_tp
,	@Contact_id := Contact_id
,	@Contact_tp	:= Contact_tp
,	@Contact_nm	:= Contact_nm
,	@Contact_cd	:= Contact_cd
,	@Alias_nm	:= Alias_nm
,	@Address_nm	:= Address_nm
,	@City_cd	:= City_cd
,	@State_cd	:= State_cd
,	@Zip_cd		:= Zip_cd
,	@Phone_cd	:= Phone_cd
,	@GPS_cd		:= GPS_cd
,	@Resrc_tx   := Resrc_tx
,	@Contact_tx := Contact_tx
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
CALL	uspResource_Contact
(
	@Resrc_id	:= 65
,	@Resrc_tp	:= "User"
,	@Contact_id	:= 77
,	@Contact_tp	:= "ContactAddress"
,	@Contact_nm	:= "mpower@company2.com"
,	@Contact_cd	:= NULL
,	@Alias_nm	:= "Max Power Address"
,	@Address_nm	:= "400 Enclave Cir #203, Costa Mesa, CA 92626"
,	@City_cd	:= "400 Enclave Cir #203, Costa Mesa, CA 92626"
,	@State_cd	:= "CA"
,	@Zip_cd		:= "92626"
,	@Phone_cd	:= "1234567890"
,	@GPS_cd		:= NULL
,	@Resrc_tx   := NULL
,	@Contact_tx := NULL
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