<?php

require_once __DIR__ . "/class.Accessor.php";
require_once __DIR__ . "/class.DataAccessObject.php";

// require __DIR__ . "/class.PDODebugger.php";

/** 
 * The Company class. The Company class maps the database Company object to the application Company object.  
 USE:
	require_once __DIR__ . "/lib/class.Company.php";
	$objCompany = null;
	$objCompany = new Company();
	$objCompany->Resrc_tp = "Company";
	$objCompanySet = Company::select( $objCompany );
 *  
 */ 
class Resource_Company
{
	private $_Resrc_id = 0;
	public function getResrc_id ()
	{ return $this->_Resrc_id; }
	public function setResrc_id ( $val )
	{ $this->_Resrc_id = $val; }

	private $_Resrc_tp = "";
	public function getResrc_tp ()
	{ return $this->_Resrc_tp; }
	public function setResrc_tp ( $val )
	{ $this->_Resrc_tp = $val; }

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

	private $_Resrc_nm = "";
	public function getResrc_nm ()
	{ return htmlspecialchars( $this->_Resrc_nm ); }
	public function setResrc_nm ( $val )
	{ $this->_Resrc_nm = $val; }

	private $_Resrc_cd = "";
	public function getResrc_cd ()
	{ return htmlspecialchars( $this->_Resrc_cd ); }
	public function setResrc_cd ( $val )
	{ $this->_Resrc_cd = $val; }

	private $_Alias_nm = "";
	public function getAlias_nm ()
	{ return htmlspecialchars( $this->_Alias_nm ); }
	public function setAlias_nm ( $val )
	{ $this->_Alias_nm = $val; }

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

	private $_Resrc_tx = "";
	public function getResrc_tx ()
	{ return htmlspecialchars( $this->_Resrc_tx ); }
	public function setResrc_tx ( $val )
	{ $this->_Resrc_tx = $val; }

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

		$this->Resrc_id = 0;
		$this->Resrc_tp = "";
		$this->Company_id = 0;
		$this->Company_tp = "";
		$this->Resrc_nm = "";
		$this->Resrc_cd = "";
		$this->Alias_nm = "";
		$this->Company_nm = "";
		$this->Company_cd = "";
		$this->Company_tx = "";
		$this->Resrc_tx = "";
		$this->Key_cd = "AL";
		$this->Mode_cd = "C";
		$this->RowCount = 0;
	}
/**
*	SELECT
*	gfpResource_Company
*/
	public static function select( Resource_Company $obj )
	{
		$conn = DataAccessObject::connect();
		$sql = "
CALL gfpResource_Company
(
	@Resrc_id	:= :Resrc_id
,	@Resrc_tp	:= :Resrc_tp
,	@Company_id	:= :Company_id
,	@Company_tp	:= :Company_tp
,	@Resrc_nm	:= :Resrc_nm
,	@Resrc_cd	:= :Resrc_cd
,	@Alias_nm	:= :Alias_nm
,	@Company_nm	:= :Company_nm
,	@Company_cd	:= :Company_cd
,   @Resrc_tx   := :Resrc_tx
,	@Company_tx	:= :Company_tx
,	@ADD_dm	:= NULL
,	@ADD_nm	:= NULL
,	@UPD_dm	:= NULL
,	@UPD_nm	:= NULL
,	@DEL_dm	:= NULL
,	@DEL_nm	:= NULL
,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Key_cd	:= :Key_cd
)"
;
		try
		{
			$st = $conn->prepare( $sql );
			$st->bindValue( ":Resrc_id", $obj->Resrc_id, PDO::PARAM_INT );
			$st->bindValue( ":Resrc_tp", $obj->Resrc_tp, PDO::PARAM_STR );
			$st->bindValue( ":Company_id", $obj->Company_id, PDO::PARAM_INT );
			$st->bindValue( ":Company_tp", $obj->Company_tp, PDO::PARAM_STR );
			$st->bindValue( ":Resrc_nm", $obj->Resrc_nm, PDO::PARAM_STR );
			$st->bindValue( ":Resrc_cd", $obj->Resrc_cd, PDO::PARAM_STR );
			$st->bindValue( ":Alias_nm", $obj->Alias_nm, PDO::PARAM_STR );
			$st->bindValue( ":Company_nm", $obj->Company_nm, PDO::PARAM_STR );
			$st->bindValue( ":Company_cd", $obj->Company_cd, PDO::PARAM_STR );
			$st->bindValue( ":Resrc_tx", $obj->Resrc_tx, PDO::PARAM_STR );
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
*	ispResource_Company
*/
	public static function insert( Resource_Company $obj )
	{
		$conn = DataAccessObject::connect();
        $sqlSet = "SET @Resrc_id = :Resrc_id, @Company_id = :Company_id;";
		$sql = "
CALL ispResource_Company
(
	@Resrc_id
,	@Resrc_tp	:= :Resrc_tp
,	@Company_id
,	@Company_tp	:= :Company_tp
,	@Resrc_nm	:= :Resrc_nm
,	@Resrc_cd	:= :Resrc_cd
,	@Alias_nm	:= :Alias_nm
,	@Company_nm	:= :Company_nm
,	@Company_cd	:= :Company_cd
,   @Resrc_tx   := :Resrc_tx
,	@Company_tx	:= :Company_tx
,	@ADD_dm	:= NULL
,	@ADD_nm	:= NULL
,	@UPD_dm	:= NULL
,	@UPD_nm	:= NULL
,	@DEL_dm	:= NULL
,	@DEL_nm	:= NULL
,	@CallingProc_nm	:= NULL
,	@Source_nm	:= NULL
,	@Token_cd	:= NULL
,	@Mode_cd	:= :Mode_cd
)"
;
		try
		{
// $pdo = new PDODebugger(DB_DSN, DB_USERNAME, DB_PASSWORD);
// $st = $pdo->prepare( $sql1 );
			$st = $conn->prepare( $sqlSet );
            $st->bindParam( ":Resrc_id", $obj->Resrc_id, PDO::PARAM_INT | PDO::PARAM_NULL, 16 );
            $st->bindParam( ":Company_id", $obj->Company_id, PDO::PARAM_INT, 16 );
            $st->execute();
// echo $st->getSQL() . PHP_EOL;
// $st = $pdo->prepare( $sql );

			$st = $conn->prepare( $sql );
			$st->bindParam( ":Resrc_tp", $obj->Resrc_tp, PDO::PARAM_STR );
			$st->bindParam( ":Company_tp", $obj->Company_tp, PDO::PARAM_STR );
			$st->bindParam( ":Resrc_nm", $obj->Resrc_nm, PDO::PARAM_STR );
			$st->bindParam( ":Resrc_cd", $obj->Resrc_cd, PDO::PARAM_STR );
			$st->bindParam( ":Alias_nm", $obj->Alias_nm, PDO::PARAM_STR );
			$st->bindParam( ":Company_nm", $obj->Company_nm, PDO::PARAM_STR );
			$st->bindParam( ":Company_cd", $obj->Company_cd, PDO::PARAM_STR );
			$st->bindParam( ":Resrc_tx", $obj->Resrc_tx, PDO::PARAM_STR );
			$st->bindParam( ":Company_tx", $obj->Company_tx, PDO::PARAM_STR );
			$st->bindParam( ":Mode_cd", $obj->Mode_cd, PDO::PARAM_STR );
			$st->execute();

// echo $st->getSQL() . PHP_EOL;

			$RowCount = $st->rowCount();
			if ( $RowCount <= 0 )
			{
				$st->closeCursor();
				exit();
			}

			$objSet = $st->fetchALL( PDO::FETCH_OBJ );
			$st->closeCursor();
			DataAccessObject::disconnect( $conn );
			return (object)$objSet;
		}
		catch( PDOException $e )
		{
			throw new PDOException ( __CLASS__ . " - Query failed " . $e->getMessage() );
			die( __CLASS__ . " - Query failed " . $e->getmessage() );
		}
	}	// END insert

/**
*	UPDATE
*	uspResource_Company
*/
	public static function update( Resource_Company $obj )
	{
		$conn = DataAccessObject::connect();
		$sql = "
CALL uspResource_Company
(
	@Resrc_id	:= :Resrc_id
,	@Resrc_tp	:= :Resrc_tp
,	@Resrc_nm	:= :Resrc_nm
,	@Resrc_cd	:= :Resrc_cd
,	@Resrc_tx	:= :Resrc_tx
,	@CompanyADD_dm	:= NULL
,	@CompanyADD_nm	:= NULL
,	@CompanyUPD_dm	:= NULL
,	@CompanyUPD_nm	:= NULL
,	@CompanyDEL_dm	:= NULL
,	@CompanyDEL_nm	:= NULL
,	@ParentResrc_tp	:= NULL
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
			$st->bindValue( ":Resrc_id", $obj->Resrc_id, PDO::PARAM_INT );
			$st->bindValue( ":Resrc_tp", $obj->Resrc_tp, PDO::PARAM_STR );
			$st->bindValue( ":Resrc_nm", $obj->Resrc_nm, PDO::PARAM_STR );
			$st->bindValue( ":Resrc_cd", $obj->Resrc_cd, PDO::PARAM_STR );
			$st->bindValue( ":Resrc_tx", $obj->Resrc_tx, PDO::PARAM_STR );
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
}
?>

