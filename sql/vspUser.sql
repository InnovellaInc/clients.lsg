DROP PROCEDURE IF EXISTS	vspUser
;

DELIMITER //
CREATE PROCEDURE	vspUser
(
	User_id		INT SIGNED		
,	User_tp		VARCHAR(64)		
,	User_nm		VARCHAR(256)		
,	User_cd		VARCHAR(128)		
,	Hashed_cd	VARCHAR(128)
,	Person_nm	VARCHAR(256)
,	Email_nm	VARCHAR(256)
,	Challenge_cd	VARCHAR(128)
,	Response_cd	VARCHAR(128)

,	SYSRIGHT		VARCHAR(30)		-- Intended DML action
,	Mode_cd		VARCHAR(16)		-- Database cascade mode code
,	OUT 	IsValid_fg	BOOLEAN
)
BEGIN
/*
**	Name:		vspUser
**	Type:		Validation Stored Procedure
**	Purpose:	Validate a record in tblUser
**	Author:		Solomon S. Shacter
**	Organization:	Innovella, Inc.
**
**	Modified:	6/18/2013
**	Modnumber:
**	Modification:	
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblUser';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'vspUser';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
VSP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	DECLARE	AK1		VARCHAR(255) DEFAULT CONCAT(User_tp,",",User_nm);
	#######################################################################
	-- Validate:
	--
	--	Duplicate names within a type are not allowed
	--	Alternate (Candidate) Key Check
	#######################################################################
	IF
		SYSRIGHT	= 'INSERT'
	OR 	SYSRIGHT 	= 'UPDATE'
	THEN
		IF
		EXISTS
		(
			SELECT	1
			FROM
				tblUser
			WHERE
					tblUser.User_id	= User_id
				AND	tblUser.User_tp	= User_tp
				AND	tblUser.User_nm	= User_nm

		)
		THEN
			SET IsValid_fg	= TRUE;	-- Return if the attributes did not change
			LEAVE VSP;
		ELSE
			CALL	rspUser
			(
				@User_id	:= User_id
			,	@User_tp	:= User_tp
			,	@User_nm	:= User_nm
			,	@User_cd	:= User_cd
			,	@Hashed_cd	:= Hashed_cd
			,	@Person_nm	:= Person_nm
			,	@Email_nm	:= Email_nm
			,	@Challenge_cd	:= Challenge_cd
			,	@Response_cd	:= Response_cd

			,	@Key_cd		:= 'AK'
			,	@RowExists_fg
			);

			IF
				@RowExists_fg	= 1	-- AK exists and not for this PK
			THEN
				SET IsValid_fg	= FALSE;
				CALL 	errAKExist
				(
					@Proc_nm	:= Proc_nm
				,	@Table_nm	:= SYSTABLE
				,	@AK_nm		:= AK1
				);
				LEAVE VSP;
			END IF;
		END IF;
	END IF;

	IF
		SYSRIGHT	= 'DELETE'
	THEN
		IF
			Mode_cd	= 'H'
		THEN
			SET 	@DEL_dm	= UTC_TIMESTAMP();
			SET 	@DEL_nm	= CURRENT_USER();
		END IF;
	END IF;
	#######################################################################
END	VSP
;
###############################################################################
END
//
DELIMITER ;
;
