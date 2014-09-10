<?php
// @LSG:START
require_once __DIR__ . "\class.Accessor.php";
require_once __DIR__ . "\class.DataAccessObject.php";
/** 
 * The Company class. The Company class maps the database Company object to the application Company object.  
 USE:
	require_once __DIR__ . "\lib\class.Company.php";
	$objCompany = null;
	$objCompany = new Company();
	$objCompany->Company_tp = "Company";
	$objCompanySet = Company::select( $objCompany );
 *  
 */ 
class Company
{
	private $_Company_id = 0;
	public function getCompany_id ()
	{ return $this->_Company_id; }
	public function setCompany_id ( $val )
	{ $this->_Company_id = $val; }

	private $_Company_tp = "";
	public function getCompany_tp ()
	{ return $this->_Company_tp; }
	public function setCompany_tp ( $val )
	{ $this->_Company_tp = $val; }

	private $_Company_nm = "";
	public function getCompany_nm ()
	{ return htmlspecialchars( $this->_Company_nm ); }
	public function setCompany_nm ( $val )
	{ $this->_Company_nm = $val; }

	private $_Company_cd = "";
	public function getCompany_cd ()
	{ return htmlspecialchars( $this->_Company_cd ); }
	public function setCompany_cd ( $val )
	{ $this->_Company_cd = $val; }

	private $_Company_tx = "";
	public function getCompany_tx ()
	{ return htmlspecialchars( $this->_Company_tx ); }
	public function setCompany_tx ( $val )
	{ $this->_Company_tx = $val; }

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
		$this->Company_id = null;
		$this->Company_tp = "";
		$this->Company_nm = "";
		$this->Company_cd = "";
		$this->Company_tx = "";
		$this->Key_cd = "AL";
		$this->Mode_cd = "C";
		$this->RowCount = 0;
	}
/**
*	SELECT
*	gfpCompany
*/
	public static function select( Company $obj )
	{
		$conn = DataAccessObject::connect();
		$sql = "
CALL gfpCompany
(
	@Company_id	:= :Company_id
,	@Company_tp	:= :Company_tp
,	@Company_nm	:= :Company_nm
,	@Company_cd	:= :Company_cd
,	@Company_tx	:= :Company_tx
,	@CompanyADD_dm	:= NULL
,	@CompanyADD_nm	:= NULL
,	@CompanyUPD_dm	:= NULL
,	@CompanyUPD_nm	:= NULL
,	@CompanyDEL_dm	:= NULL
,	@CompanyDEL_nm	:= NULL
,	@ParentCompany_tp	:= NULL
,	@CompanyType_tx	:= NULL
,	@CompanyTypeLeft_id	:= NULL
,	@CompanyTypeRight_id	:= NULL
,	@CompanyTypeLevel_id	:= NULL
,	@CompanyTypeOrder_id	:= NULL

,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Key_cd	:= :Key_cd
)"
;
		try
		{
			$st = $conn->prepare( $sql );
			$st->bindValue( ":Company_id", $obj->Company_id, PDO::PARAM_INT );
			$st->bindValue( ":Company_tp", $obj->Company_tp, PDO::PARAM_STR );
			$st->bindValue( ":Company_nm", $obj->Company_nm, PDO::PARAM_STR );
			$st->bindValue( ":Company_cd", $obj->Company_cd, PDO::PARAM_STR );
			$st->bindValue( ":Company_tx", $obj->Company_tx, PDO::PARAM_STR );
			$st->bindValue( ":Key_cd", $obj->Key_cd, PDO::PARAM_STR );
			$st->execute();

			$obj->RowCount = $st->rowCount();
			if ( $obj->RowCount <= 0 )
			{
				$st->closeCursor();
				exit();
			}

			$obj = $st->fetchALL( PDO::FETCH_OBJ );
			$st->closeCursor();
			DataAccessObject::disconnect( $conn );

			return (object)($obj);
		}
		catch( PDOException $e)
		{
			throw new PDOException ( __CLASS__ . " - Query failed " . $e->getMessage() );
			die( __CLASS__ . " - Query failed " . $e->getmessage() );
		}
	}	// END select

/**
*	INSERT
*	ispCompany
*/
	public static function insert( Company $obj )
	{
		$conn = DataAccessObject::connect();
		$sql = "
CALL ispCompany
(
	@Company_id
,	@Company_tp	:= :Company_tp
,	@Company_nm	:= :Company_nm
,	@Company_cd	:= :Company_cd
,	@Company_tx	:= :Company_tx
,	@CompanyADD_dm	:= NULL
,	@CompanyADD_nm	:= NULL
,	@CompanyUPD_dm	:= NULL
,	@CompanyUPD_nm	:= NULL
,	@CompanyDEL_dm	:= NULL
,	@CompanyDEL_nm	:= NULL
,	@ParentCompany_tp	:= NULL
,	@CompanyType_tx	:= NULL
,	@CompanyTypeLeft_id	:= NULL
,	@CompanyTypeRight_id	:= NULL
,	@CompanyTypeLevel_id	:= NULL
,	@CompanyTypeOrder_id	:= NULL

,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Mode_cd	:= :Mode_cd
)"
;
		try
		{
			$st = $conn->prepare( $sql );
//			$st->bindValue( ":Company_id", $obj->Company_id, PDO::PARAM_INT );
			$st->bindValue( ":Company_tp", $obj->Company_tp, PDO::PARAM_STR );
			$st->bindValue( ":Company_nm", $obj->Company_nm, PDO::PARAM_STR );
			$st->bindValue( ":Company_cd", $obj->Company_cd, PDO::PARAM_STR );
			$st->bindValue( ":Company_tx", $obj->Company_tx, PDO::PARAM_STR );
			$st->bindValue( ":Mode_cd", $obj->Mode_cd, PDO::PARAM_STR );
			$st->execute();

			$RowCount = $st->rowCount();
			if ( $RowCount <= 0 )
			{
				$st->closeCursor();
				exit();
			}

			$obj = $st->fetchALL( PDO::FETCH_OBJ );
			$st->closeCursor();
			DataAccessObject::disconnect( $conn );

			return (object)($obj);
		}
		catch( PDOException $e)
		{
			throw new PDOException ( __CLASS__ . " - Query failed " . $e->getMessage() );
			die( __CLASS__ . " - Query failed " . $e->getmessage() );
		}
	}	// END insert

/**
*	UPDATE
*	uspCompany
*/
	public static function update( Company $obj )
	{
		$conn = DataAccessObject::connect();
		$sql = "
CALL uspCompany
(
	@Company_id	:= :Company_id
,	@Company_tp	:= :Company_tp
,	@Company_nm	:= :Company_nm
,	@Company_cd	:= :Company_cd
,	@Company_tx	:= :Company_tx
,	@CompanyADD_dm	:= NULL
,	@CompanyADD_nm	:= NULL
,	@CompanyUPD_dm	:= NULL
,	@CompanyUPD_nm	:= NULL
,	@CompanyDEL_dm	:= NULL
,	@CompanyDEL_nm	:= NULL
,	@ParentCompany_tp	:= NULL
,	@CompanyType_tx	:= NULL
,	@CompanyTypeLeft_id	:= NULL
,	@CompanyTypeRight_id	:= NULL
,	@CompanyTypeLevel_id	:= NULL
,	@CompanyTypeOrder_id	:= NULL

,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Mode_cd	:= :Mode_cd
)"
;
		try
		{
			$st = $conn->prepare( $sql );
			$st->bindValue( ":Company_id", $obj->Company_id, PDO::PARAM_INT );
			$st->bindValue( ":Company_tp", $obj->Company_tp, PDO::PARAM_STR );
			$st->bindValue( ":Company_nm", $obj->Company_nm, PDO::PARAM_STR );
			$st->bindValue( ":Company_cd", $obj->Company_cd, PDO::PARAM_STR );
			$st->bindValue( ":Company_tx", $obj->Company_tx, PDO::PARAM_STR );
			$st->bindValue( ":Mode_cd", $obj->Mode_cd, PDO::PARAM_STR );
			$st->execute();

			$RowCount = $st->rowCount();
			$st->closeCursor();
			DataAccessObject::disconnect( $conn );

			return (object)($obj);
		}
		catch( PDOException $e)
		{
			DataAccessObject::disconnect( $conn );
			throw new PDOException ( __CLASS__ . " - Query failed " . $e->getMessage() );
			die( __CLASS__ . " - Query failed " . $e->getmessage() );
		}
	}	// END insert

/**
*	Check if row exists based on key code and property settings
*	gfpCompany
*/
	public function KeyRowExists()
	{
		self::select( $this );

        if( $this->RowCount > 0 )
        {
            return true;
        }

		return false;
	}

}
// @LSG:FINISH
?>

