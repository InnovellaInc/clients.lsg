<?php

require_once __DIR__ . "\class.Accessor.php";
require_once __DIR__ . "\class.DataAccessObject.php";
/** 
 * The Resource class. The Resource class maps the database Resource object to the application Resource object.  
 USE:
	require_once __DIR__ . "\lib\class.Resource.php";
	$objResource = null;
	$objResource = new Resource();
	$objResource->Resrc_tp = "Resource";
	$objResourceSet = Resource::select( $objResource );
 *  
 */ 
class Resource
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

	private $_Resrc_tx = "";
	public function getResrc_tx ()
	{ return htmlspecialchars( $this->_Resrc_tx ); }
	public function setResrc_tx ( $val )
	{ $this->_Resrc_tx = $val; }

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

	private static $_Instance = NULL;
	public static function getInstance()
	{
		if ( !isset( self::$_Instance) )
		{
			self::$_Instance = new self();
		}
		return self::$_Instance;
	}
/**
/*	METHODS
*/
	public function __construct()
	{
		$this->Resrc_id = null;
		$this->Resrc_tp = "";
		$this->Resrc_tx = "";
		$this->Key_cd = "AL";
		$this->Mode_cd = "C";
		$this->RowCount = 0;
	}
/**
*	SELECT
*	gfpResource
*/
	public static function select( Resource $obj )
	{
		$conn = DataAccessObject::connect();
		$sql = "
CALL gfpResource
(
	@Resrc_id	:= :Resrc_id
,	@Resrc_tp	:= :Resrc_tp
,	@Resrc_tx	:= :Resrc_tx
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
			$st->bindValue( ":Resrc_tx", $obj->Resrc_tx, PDO::PARAM_STR );
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
*	ispResource
*/
	public static function insert( Resource $obj )
	{
		$conn = DataAccessObject::connect();
		$sql = "
CALL ispResource
(
	@Resrc_id
,	@Resrc_tp	:= :Resrc_tp
,	@Resrc_tx	:= :Resrc_tx
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
//			$st->bindValue( ":Resrc_id", $obj->Resrc_id, PDO::PARAM_INT );
			$st->bindValue( ":Resrc_tp", $obj->Resrc_tp, PDO::PARAM_STR );
			$st->bindValue( ":Resrc_tx", $obj->Resrc_tx, PDO::PARAM_STR );
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
*	uspResource
*/
	public static function update( Resource $obj )
	{
		$conn = DataAccessObject::connect();
		$sql = "
CALL uspResource
(
	@Resrc_id	:= :Resrc_id
,	@Resrc_tp	:= :Resrc_tp
,	@Resrc_tx	:= :Resrc_tx
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
			$st->bindValue( ":Resrc_id", $obj->Resrc_id, PDO::PARAM_INT );
			$st->bindValue( ":Resrc_tp", $obj->Resrc_tp, PDO::PARAM_STR );
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

