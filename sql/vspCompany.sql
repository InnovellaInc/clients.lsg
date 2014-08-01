DROP PROCEDURE IF EXISTS	vspCompany
;

DELIMITER //
CREATE PROCEDURE	vspCompany
(
	Company_id		INT SIGNED		
,	Company_tp		VARCHAR(64)		
,	Company_nm		VARCHAR(256)		
,	Company_cd		VARCHAR(128)		

,	SYSRIGHT		VARCHAR(30)		-- Intended DML action
,	Mode_cd		VARCHAR(16)		-- Database cascade mode code
,	OUT 	IsValid_fg	BOOLEAN
)
BEGIN
/*
**	Name:		vspCompany
**	Type:		Validation Stored Procedure
**	Purpose:	Validate a record in tblCompany
**	Author:		Solomon S. Shacter
**	Company:	Innovella, Inc.
**
**	Modified:	6/18/2013
**	Modnumber:
**	Modification:	
**
*/
###############################################################################
DECLARE	SYSTABLE	VARCHAR(255) DEFAULT 'tblCompany';
DECLARE	Proc_nm	VARCHAR(255) DEFAULT 'vspCompany';
DECLARE	Key_cd		VARCHAR(16) DEFAULT 'PK';
DECLARE RowExists_fg	TINYINT	DEFAULT 0;
DECLARE ProcFailed_fg	BOOLEAN DEFAULT FALSE;
###############################################################################
VSP:
BEGIN
	#######################################################################
	-- Initialize
	#######################################################################
	DECLARE	AK1		VARCHAR(255) DEFAULT CONCAT(Company_tp,",",Company_nm);
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
				tblCompany
			WHERE
					tblCompany.Company_id	= Company_id
				AND	tblCompany.Company_tp	= Company_tp
				AND	tblCompany.Company_nm	= Company_nm

		)
		THEN
			SET IsValid_fg	= TRUE;	-- Return if the attributes did not change
			LEAVE VSP;
		ELSE
			CALL	rspCompany
			(
				@Company_id	:= Company_id
			,	@Company_tp	:= Company_tp
			,	@Company_nm	:= Company_nm
			,	@Company_cd	:= Company_cd

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
