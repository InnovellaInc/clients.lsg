<?php

// namespace lib\DataAccessArray;

require_once( "config.php" );

abstract class DataAccessArray
{
	protected $data = array();
	
	//override magic method to construct object
	public function __construct( $data = null )
	{
		if( isset( $data ) && is_array( $data ) )
		{
			foreach ( $data as $key => $value )
			{
				if ( array_key_exists( $key, $this->data ) ) $this->data[$key] = $value;
			}
		}
	}
	
	public function getValue( $field )
	{
		if ( array_key_exists( $field, $this->data ) )
		{
			return $this->data[$field];
		}
		else
		{
			die( "Data Field not found for this data array." );
		}
	}
	
	public function getValueEncoded( $field )
	{
		return htmlspecialchars( $this->getValue( $field ) );
	}
	
	protected static function connect()
	{
		try
		{
			$conn = new PDO( DB_DSN, DB_USERNAME, DB_PASSWORD );
			$conn->setAttribute( PDO::ATTR_PERSISTENT, true );
			$conn->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
			$conn->setAttribute( PDO::ATTR_EMULATE_PREPARES, false );
			}
		catch ( PDOException $e )
		{
			die( "class.DataObject - SQL Connection failed: " . $e->getMessage() );
		}
		
	return $conn;
	}
	
	protected static function disconnect( $conn )
	{
		$conn = "";
	}

	private $fieldnames;
	protected function __setFieldNames( array $fieldnames )
	{
		$this->fieldnames = $fieldnames;
		return $this;
	}

}

?>
