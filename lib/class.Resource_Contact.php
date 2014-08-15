<?php

require_once __DIR__ . "\class.Accessor.php";
require_once __DIR__ . "\class.DataAccessObject.php";

require __DIR__ . "\class.PDODebugger.php";

/** 
 * The Contact class. The Contact class maps the database Contact object to the application Contact object.  
 USE:
	require_once __DIR__ . "\lib\class.Contact.php";
	$objContact = null;
	$objContact = new Contact();
	$objContact->Resrc_tp = "Contact";
	$objContactSet = Contact::select( $objContact );
 *  
 */ 
class Resource_Contact
{
	/**
	* Properties
	*/
	private $_Resrc_id  = 0;
	public function getResrc_id  ()
	{ return $this->_Resrc_id; }
	public function setResrc_id  ( $val )
	{ $this->_Resrc_id = $val; }

	private $_Resrc_tp = "";
	public function getResrc_tp ()
	{ return $this->_Resrc_tp; }
	public function setResrc_tp ( $val )
	{ $this->_Resrc_tp = $val; }

	private $_Contact_id = 0;
	public function getContact_id ()
	{ return $this->_Contact_id; }
	public function setContact_id ( $val )
	{ $this->_Contact_id = $val; }

	private $_Contact_tp = "";
	public function getContact_tp ()
	{ return $this->_Contact_tp; }
	public function setContact_tp ( $val )
	{ $this->_Contact_tp = $val; }

	private $_Contact_nm = "";
	public function getContact_nm ()
	{ return htmlspecialchars( $this->_Contact_nm ); }
	public function setContact_nm ( $val )
	{ $this->_Contact_nm = mysql_real_escape_string ( $val ); }

	private $_Contact_cd = "";
	public function getContact_cd ()
	{ return htmlspecialchars( $this->_Contact_cd ); }
	public function setContact_cd ( $val )
	{ $this->_Contact_cd = mysql_real_escape_string ( $val ); }

	private $_Alias_nm = "";
	public function getAlias_nm ()
	{ return htmlspecialchars( $this->_Alias_nm ); }
	public function setAlias_nm ( $val )
	{ $this->_Alias_nm = mysql_real_escape_string ( $val ); }

	private $_Address_nm = "";
	public function getAddress_nm ()
	{ return htmlspecialchars( $this->_Address_nm ); }
	public function setAddress_nm ( $val )
	{ $this->_Address_nm = $val; }

	private $_City_cd = "";
	public function getCity_cd ()
	{ return htmlspecialchars( $this->_City_cd ); }
	public function setCity_cd ( $val )
	{ $this->_City_cd = mysql_real_escape_string ( $val ); }

	private $_State_cd = "";
	public function getState_cd ()
	{ return htmlspecialchars( $this->_State_cd ); }
	public function setState_cd ( $val )
	{ $this->_State_cd = mysql_real_escape_string ( $val ); }

	private $_ZIP_cd = "";
	public function getZIP_cd ()
	{ return htmlspecialchars( $this->_ZIP_cd ); }
	public function setZIP_cd ( $val )
	{ $this->_ZIP_cd = mysql_real_escape_string ( $val ); }

	private $_Phone_cd = "";
	public function getPhone_cd ()
	{ return htmlspecialchars( $this->_Phone_cd ); }
	public function setPhone_cd ( $val )
	{ $this->_Phone_cd = mysql_real_escape_string ( $val ); }

	private $_GPS_cd = "";
	public function getGPS_cd ()
	{ return htmlspecialchars( $this->_GPS_cd ); }
	public function setGPS_cd ( $val )
	{ $this->_GPS_cd = $val; }

	private $_Resrc_tx = "";
	public function getResrc_tx ()
	{ return htmlspecialchars( $this->_Resrc_tx ); }
	public function setResrc_tx ( $val )
	{ $this->_Resrc_tx = $val; }

	private $_Contact_tx = "";
	public function getContact_tx ()
	{ return htmlspecialchars( $this->_Contact_tx ); }
	public function setContact_tx ( $val )
	{ $this->_Contact_tx = $val; }

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

		$this->Resrc_id  = 0;
		$this->Resrc_tp = "";
		$this->Contact_id = 0;
		$this->Contact_tp = "";
		$this->Contact_nm = "";
		$this->Contact_cd = "";
		$this->Alias_nm = "";
		$this->Address_nm = "";
		$this->City_cd = "";
		$this->State_cd = "";
		$this->ZIP_cd = "";
		$this->Phone_cd = "";
		$this->GPS_cd = "";
		$this->Contact_tx = "";
		$this->Resrc_tx = "";
		$this->Key_cd = "AL";
		$this->Mode_cd = "C";
		$this->RowCount = 0;
		$this->Rows = NULL;
	}
/**
*	SELECT
*	gfpResource_Contact
*/
	public static function select( Resource_Contact $obj )
	{
		$conn = DataAccessObject::connect();
		$sql = "
CALL gfpResource_Contact
(
	@Resrc_id 	:= :Resrc_id 
,	@Resrc_tp	:= :Resrc_tp
,	@Contact_id	:= :Contact_id
,	@Contact_tp	:= :Contact_tp
,	@Contact_nm	:= :Contact_nm
,	@Contact_cd	:= :Contact_cd
,	@Alias_nm	:= :Alias_nm
,	@Address_nm	:= :Address_nm
,	@City_cd	:= :City_cd
,	@State_cd	:= :State_cd
,	@ZIP_cd	:= :ZIP_cd
,	@Phone_cd	:= :Phone_cd
,	@GPS_cd	:= :GPS_cd
,   @Resrc_tx   := :Resrc_tx
,	@Contact_tx	:= :Contact_tx
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
			$st->bindValue( ":Contact_id", $obj->Contact_id, PDO::PARAM_INT );
			$st->bindValue( ":Contact_tp", $obj->Contact_tp, PDO::PARAM_STR );
			$st->bindValue( ":Contact_nm", $obj->Contact_nm, PDO::PARAM_STR );
			$st->bindValue( ":Contact_cd", $obj->Contact_cd, PDO::PARAM_STR );
			$st->bindValue( ":Alias_nm", $obj->Alias_nm, PDO::PARAM_STR );
			$st->bindValue( ":Address_nm", $obj->Address_nm, PDO::PARAM_STR );
			$st->bindValue( ":City_cd", $obj->Alias_nm, PDO::PARAM_STR );
			$st->bindValue( ":State_cd", $obj->State_cd, PDO::PARAM_STR );
			$st->bindValue( ":ZIP_cd", $obj->ZIP_cd, PDO::PARAM_STR );
			$st->bindValue( ":Phone_cd", $obj->Phone_cd, PDO::PARAM_STR );
			$st->bindValue( ":GPS_cd", $obj->GPS_cd, PDO::PARAM_STR );
			$st->bindValue( ":Resrc_tx", $obj->Resrc_tx, PDO::PARAM_STR );
			$st->bindValue( ":Contact_tx", $obj->Contact_tx, PDO::PARAM_STR );
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
*	ispResource_Contact
*/
	public static function insert( Resource_Contact $obj )
	{
		$conn = DataAccessObject::connect();
        $sqlSet = "SET @Resrc_id  = :Resrc_id , @Contact_id = :Contact_id;";
		$sql = "
CALL ispResource_Contact
(
	@Resrc_id 
,	@Resrc_tp	:= :Resrc_tp
,	@Contact_id
,	@Contact_tp	:= :Contact_tp
,	@Contact_nm	:= :Contact_nm
,	@Contact_cd	:= :Contact_cd
,	@Alias_nm	:= :Alias_nm
,	@Address_nm	:= :Address_nm
,	@City_cd	:= :City_cd
,	@State_cd	:= :State_cd
,	@ZIP_cd	:= :ZIP_cd
,	@Phone_cd	:= :Phone_cd
,	@GPS_cd	:= :GPS_cd
,   @Resrc_tx   := :Resrc_tx
,	@Contact_tx	:= :Contact_tx
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
// $st = $pdo->prepare( $sqlSet );
			$st = $conn->prepare( $sqlSet );
            $st->bindParam( ":Resrc_id", $obj->Resrc_id, PDO::PARAM_INT | PDO::PARAM_NULL, 16 );
            $st->bindParam( ":Contact_id", $obj->Contact_id, PDO::PARAM_INT, 16 );
            $st->execute();
 // echo $st->getSQL() . PHP_EOL;
// $st = $pdo->prepare( $sql );

			$st = $conn->prepare( $sql );
			$st->bindParam( ":Resrc_tp", $obj->Resrc_tp, PDO::PARAM_STR );
			$st->bindParam( ":Contact_tp", $obj->Contact_tp, PDO::PARAM_STR );
			$st->bindParam( ":Contact_nm", $obj->Contact_nm, PDO::PARAM_STR );
			$st->bindParam( ":Contact_cd", $obj->Contact_cd, PDO::PARAM_STR );
			$st->bindParam( ":Alias_nm", $obj->Alias_nm, PDO::PARAM_STR );
			$st->bindParam( ":Address_nm", $obj->Address_nm, PDO::PARAM_STR );
			$st->bindParam( ":City_cd", $obj->Alias_nm, PDO::PARAM_STR );
			$st->bindParam( ":State_cd", $obj->State_cd, PDO::PARAM_STR );
			$st->bindParam( ":ZIP_cd", $obj->ZIP_cd, PDO::PARAM_STR );
			$st->bindParam( ":Phone_cd", $obj->Phone_cd, PDO::PARAM_STR );
			$st->bindParam( ":GPS_cd", $obj->GPS_cd, PDO::PARAM_STR );
			$st->bindParam( ":Resrc_tx", $obj->Resrc_tx, PDO::PARAM_STR );
			$st->bindParam( ":Contact_tx", $obj->Contact_tx, PDO::PARAM_STR );
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
*	uspResource_Contact
*/
	public static function update( Resource_Contact $obj )
	{
		$conn = DataAccessObject::connect();
		$sql = "
CALL uspResource_Contact
(
	@Resrc_id	:= :Resrc_id
,	@Resrc_tp	:= :Resrc_tp
,	@Contact_id	:= :Contact_id
,	@Contact_tp	:= :Contact_tp
,	@Contact_nm	:= :Contact_nm
,	@Contact_cd	:= :Contact_cd
,	@Alias_nm	:= :Alias_nm
,	@Address_nm	:= :Address_nm
,	@City_cd	:= :City_cd
,	@State_cd	:= :State_cd
,	@ZIP_cd	:= :ZIP_cd
,	@Phone_cd	:= :Phone_cd
,	@GPS_cd	:= :GPS_cd
,   @Resrc_tx   := :Resrc_tx
,	@Contact_tx	:= :Contact_tx
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
			$st = $conn->prepare( $sql );
			$st->bindValue( ":Resrc_id ", $obj->Resrc_id , PDO::PARAM_INT );
			$st->bindParam( ":Resrc_tp", $obj->Resrc_tp, PDO::PARAM_STR );
			$st->bindParam( ":Contact_id", $obj->Contact_id, PDO::PARAM_INT );
			$st->bindParam( ":Contact_tp", $obj->Contact_tp, PDO::PARAM_STR );
			$st->bindParam( ":Contact_nm", $obj->Contact_nm, PDO::PARAM_STR );
			$st->bindParam( ":Contact_cd", $obj->Contact_cd, PDO::PARAM_STR );
			$st->bindParam( ":Alias_nm", $obj->Alias_nm, PDO::PARAM_STR );
			$st->bindParam( ":Address_nm", $obj->Address_nm, PDO::PARAM_STR );
			$st->bindParam( ":City_cd", $obj->Alias_nm, PDO::PARAM_STR );
			$st->bindParam( ":State_cd", $obj->State_cd, PDO::PARAM_STR );
			$st->bindParam( ":ZIP_cd", $obj->ZIP_cd, PDO::PARAM_STR );
			$st->bindParam( ":Phone_cd", $obj->Phone_cd, PDO::PARAM_STR );
			$st->bindParam( ":GPS_cd", $obj->GPS_cd, PDO::PARAM_STR );
			$st->bindParam( ":Resrc_tx", $obj->Resrc_tx, PDO::PARAM_STR );
			$st->bindParam( ":Contact_tx", $obj->Contact_tx, PDO::PARAM_STR );
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

