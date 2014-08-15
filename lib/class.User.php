<?php

require_once __DIR__ . "\class.Accessor.php";
require_once __DIR__ . "\class.DataAccessObject.php";

require __DIR__ . "\class.PDODebugger.php";

/** 
 * The Company class. The Company class maps the database Company object to the application Company object.  
 USE:
	require_once __DIR__ . "\lib\class.Company.php";
	$objCompany = null;
	$objCompany = new Company();
	$objCompany->User_tp = "Company";
	$objCompanySet = Company::select( $objCompany );
 *  
 */ 
class User
{
	/**
	* Properties
	*/
	private $_User_id  = 0;
	public function getUser_id  ()
	{ return $this->_User_id; }
	public function setUser_id  ( $val )
	{ $this->_User_id = $val; }

	private $_User_tp = "";
	public function getUser_tp ()
	{ return $this->_User_tp; }
	public function setUser_tp ( $val )
	{ $this->_User_tp = $val; }

	private $_User_nm = "";
	public function getUser_nm ()
	{ return htmlspecialchars( $this->_User_nm ); }
	public function setUser_nm ( $val )
	{ $this->_User_nm = mysql_real_escape_string ( $val ); }

	private $_User_cd = "";
	public function getUser_cd ()
	{ return htmlspecialchars( $this->_User_cd ); }
	public function setUser_cd ( $val )
	{ $this->_User_cd = mysql_real_escape_string ( $val ); }

	private $_Hashed_cd = "";
	public function getHashed_cd ()
	{ return htmlspecialchars( $this->_Hashed_cd ); }
	public function setHashed_cd ( $val )
	{ $this->_Hashed_cd = $val; }

	private $_Email_nm = "";
	public function getEmail_nm ()
	{ return htmlspecialchars( $this->_Email_nm ); }
	public function setEmail_nm ( $val )
	{ $this->_Email_nm = mysql_real_escape_string ( $val ); }

	private $_Challenge_cd = "";
	public function getChallenge_cd ()
	{ return htmlspecialchars( $this->_Challenge_cd ); }
	public function setChallenge_cd ( $val )
	{ $this->_Challenge_cd = mysql_real_escape_string ( $val ); }

	private $_Response_cd = "";
	public function getResponse_cd ()
	{ return htmlspecialchars( $this->_Response_cd ); }
	public function setResponse_cd ( $val )
	{ $this->_Response_cd = mysql_real_escape_string ( $val ); }

	private $_User_tx = "";
	public function getUser_tx ()
	{ return htmlspecialchars( $this->_User_tx ); }
	public function setUser_tx ( $val )
	{ $this->_User_tx = $val; }

	private $_Key_cd = "";
	public function getKey_cd ()
	{ return $this->_Key_cd; }
	public function setKey_cd ( $val )
	{ $this->_Key_cd = $val; }

	private $_Mode_cd = "";
	public function getMode_cd ()
	{ return $this->_Mode_cd; }
	public function setMode_cd ( $val )
	{ $this->_Mode_cd = $val; }

	private static $_RowCount = 0;
	public function getRowCount ()
	{ return $this->_RowCount; }
	public function setRowCount ( $val )
	{ $this->_RowCount = $val; }

	private static $_Rows = NULL;
	public function getRows ()
	{ return $this->_Rows; }
	public function setRows ( $val )
	{
		$this->_Rows = clone( (object) $val);
	}

	private static $_instance = NULL;
	public static function getInstance()
	{
		if ( !isset( self::$_instance) )
		{
			self::$_instance = new self();
		}
		return self::$_instance;
	}

/**
/*	METHODS
*/
	public function __construct()
	{

		$this->User_id  = 0;
		$this->User_tp = "";
		$this->User_nm = "";
		$this->User_cd = "";
		$this->Hashed_cd = "";
		$this->Email_nm = "";
		$this->Challenge_cd = "";
		$this->Response_cd = "";
		$this->User_tx = "";
		$this->Key_cd = "AL";
		$this->Mode_cd = "C";
		$this->RowCount = 0;
		$this->Rows = NULL;
	}
/**
*	SELECT
*	gfpUser
*/
	public static function select( User $obj )
	{
		$conn = DataAccessObject::connect();
		$sql = "
CALL gfpUser
(
	@User_id	:= :User_id
,	@User_tp	:= :User_tp
,	@User_nm	:= :User_nm
,	@User_cd	:= :User_cd
,	@Hashed_cd	:= :Hashed_cd
,	@Email_nm	:= :Email_nm
,	@Challenge_cd	:= :Challenge_cd
,	@Response_cd	:= :Response_cd
,	@User_tx	:= :User_tx
,	@UserADD_dm	:= NULL
,	@UserADD_nm	:= NULL
,	@UserUPD_dm	:= NULL
,	@UserUPD_nm	:= NULL
,	@UserDEL_dm	:= NULL
,	@UserDEL_nm	:= NULL
,	@ParentUser_tp	:= NULL
,	@UserType_tx	:= NULL
,	@UserTypeLeft_id	:= NULL
,	@UserTypeRight_id	:= NULL
,	@UserTypeLevel_id	:= NULL
,	@UserTypeOrder_id	:= NULL
,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Key_cd	:= :Key_cd
)"
;
		try
		{
			$st = $conn->prepare( $sql );
			$st->bindValue( ":User_id", $obj->User_id, PDO::PARAM_INT );
			$st->bindValue( ":User_tp", $obj->User_tp, PDO::PARAM_STR );
			$st->bindValue( ":User_nm", $obj->User_nm, PDO::PARAM_STR );
			$st->bindValue( ":User_cd", $obj->User_cd, PDO::PARAM_STR );
			$st->bindValue( ":Hashed_cd", $obj->Hashed_cd, PDO::PARAM_STR );
			$st->bindValue( ":Email_nm", $obj->Email_nm, PDO::PARAM_STR );
			$st->bindValue( ":Challenge_cd", $obj->Challenge_cd, PDO::PARAM_STR );
			$st->bindValue( ":Response_cd", $obj->Response_cd, PDO::PARAM_STR );
			$st->bindValue( ":User_tx", $obj->User_tx, PDO::PARAM_STR );
			$st->bindValue( ":Key_cd", $obj->Key_cd, PDO::PARAM_STR );
			$st->execute();

			$obj->RowCount = $st->rowCount();
			if ( $obj->RowCount <= 0 )
			{
				$st->closeCursor();
				exit();
			}
			$obj->Rows = $st->fetchALL( PDO::FETCH_OBJ );
			$st->closeCursor();
			DataAccessObject::disconnect( $conn );

			return ($obj->Rows);
		}
		catch( PDOException $e)
		{
			throw new PDOException ( __CLASS__ . " - Query failed " . $e->getMessage() );
			die( __CLASS__ . " - Query failed " . $e->getmessage() );
		}
	}	// END select

/**
*	INSERT
*	ispUser
*/
	public static function insert( User $obj )
	{
		$conn = DataAccessObject::connect();
        $sqlSet = "SET @User_id  = :User_id;";
		$sql = "
CALL ispUser
(
	@User_id
,	@User_tp	:= :User_tp
,	@User_nm	:= :User_nm
,	@User_cd	:= :User_cd
,	@Hashed_cd	:= :Hashed_cd
,	@Email_nm	:= :Email_nm
,	@Challenge_cd	:= :Challenge_cd
,	@Response_cd	:= :Response_cd
,	@User_tx	:= :User_tx
,	@UserADD_dm	:= NULL
,	@UserADD_nm	:= NULL
,	@UserUPD_dm	:= NULL
,	@UserUPD_nm	:= NULL
,	@UserDEL_dm	:= NULL
,	@UserDEL_nm	:= NULL
,	@ParentUser_tp	:= NULL
,	@UserType_tx	:= NULL
,	@UserTypeLeft_id	:= NULL
,	@UserTypeRight_id	:= NULL
,	@UserTypeLevel_id	:= NULL
,	@UserTypeOrder_id	:= NULL

,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Mode_cd	:= :Mode_cd
)"
;
		try
		{
			$st = $conn->prepare( $sqlSet );
            $st->bindParam( ":User_id", $obj->User_id, PDO::PARAM_INT | PDO::PARAM_NULL, 16 );
            $st->execute();

			$st = $conn->prepare( $sql );
			$st->bindParam( ":User_tp", $obj->User_tp, PDO::PARAM_STR );
			$st->bindParam( ":User_nm", $obj->User_nm, PDO::PARAM_STR );
			$st->bindParam( ":User_cd", $obj->User_cd, PDO::PARAM_STR );
			$st->bindParam( ":Hashed_cd", $obj->Hashed_cd, PDO::PARAM_STR );
			$st->bindParam( ":Email_nm", $obj->Email_nm, PDO::PARAM_STR );
			$st->bindParam( ":Challenge_cd", $obj->Challenge_cd, PDO::PARAM_STR );
			$st->bindParam( ":Response_cd", $obj->Response_cd, PDO::PARAM_STR );
			$st->bindParam( ":User_tx", $obj->User_tx, PDO::PARAM_STR );
			$st->bindParam( ":Mode_cd", $obj->Mode_cd, PDO::PARAM_STR );
			$st->execute();

			$RowCount = $st->rowCount();
			if ( $RowCount <= 0 )
			{
				$st->closeCursor();
				exit();
			}

			$objSet = $st->fetchALL( PDO::FETCH_OBJ );
			$st->closeCursor();
			DataAccessObject::disconnect( $conn );
			return $objSet;
		}
		catch( PDOException $e )
		{
			throw new PDOException ( __CLASS__ . " - Query failed " . $e->getMessage() );
			die( __CLASS__ . " - Query failed " . $e->getmessage() );
		}
	}	// END insert

/**
*	UPDATE
*	uspUser
*/
	public static function update( User $obj )
	{
		$conn = DataAccessObject::connect();
		$sql = "
CALL uspUser
(
	@User_id	:= :User_id
,	@User_tp	:= :User_tp
,	@User_nm	:= :User_nm
,	@User_cd	:= :User_cd
,	@Hashed_cd	:= :Hashed_cd
,	@Email_nm	:= :Email_nm
,	@Challenge_cd	:= :Challenge_cd
,	@Response_cd	:= :Response_cd
,	@User_tx	:= :User_tx
,	@UserADD_dm	:= NULL
,	@UserADD_nm	:= NULL
,	@UserUPD_dm	:= NULL
,	@UserUPD_nm	:= NULL
,	@UserDEL_dm	:= NULL
,	@UserDEL_nm	:= NULL
,	@ParentUser_tp	:= NULL
,	@UserType_tx	:= NULL
,	@UserTypeLeft_id	:= NULL
,	@UserTypeRight_id	:= NULL
,	@UserTypeLevel_id	:= NULL
,	@UserTypeOrder_id	:= NULL
,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Mode_cd	:= :Mode_cd
)"
;
		try
		{
			$st = $conn->prepare( $sql );
			$st->bindParam( ":User_id ", $obj->User_id , PDO::PARAM_INT );
			$st->bindParam( ":User_tp", $obj->User_tp, PDO::PARAM_STR );
			$st->bindParam( ":User_nm", $obj->User_nm, PDO::PARAM_STR );
			$st->bindParam( ":User_cd", $obj->User_cd, PDO::PARAM_STR );
			$st->bindParam( ":Hashed_cd", $obj->Hashed_cd, PDO::PARAM_STR );
			$st->bindParam( ":Email_nm", $obj->Email_nm, PDO::PARAM_STR );
			$st->bindParam( ":Challenge_cd", $obj->Challenge_cd, PDO::PARAM_STR );
			$st->bindParam( ":Response_cd", $obj->Response_cd, PDO::PARAM_STR );
			$st->bindParam( ":User_tx", $obj->User_tx, PDO::PARAM_STR );
			$st->bindParam( ":Mode_cd", $obj->Mode_cd, PDO::PARAM_STR );
			$st->execute();

			$RowCount = $st->rowCount();
			$st->closeCursor();
			DataAccessObject::disconnect( $conn );

			return ($obj);
		}
		catch( PDOException $e)
		{
			DataAccessObject::disconnect( $conn );
			throw new PDOException ( __CLASS__ . " - Query failed " . $e->getMessage() );
			die( __CLASS__ . " - Query failed " . $e->getmessage() );
		}
	}	// END update
}
?>

