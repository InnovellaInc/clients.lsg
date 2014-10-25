<?php

// namespace lib\DataAccessObject;

require_once __DIR__ . "/config.php";

abstract class DataAccessObject
{
	final public static function connect()
	{
		try
		{
			$conn = new PDO( DB_DSN, DB_USERNAME, DB_PASSWORD );
// PDO::MYSQL_ATTR_INIT_COMMAND    => "SET NAMES UTF8"
			$conn->setAttribute( PDO::ATTR_PERSISTENT, true );
			$conn->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
			$conn->setAttribute( PDO::ATTR_EMULATE_PREPARES, false );
			}
		catch ( PDOException $e )
		{
			die( __CLASS__ . " - SQL Connection failed: " . $e->getMessage() );
		}
		
	return $conn;
	}
	
	final public static function disconnect( $conn )
	{
		$conn = "";
	}

	function object_to_array($data)
	{
		if (is_array($data) || is_object($data))
		{
			$result = array();
			foreach ($data as $key => $value)
			{
				$result[$key] = object_to_array($value);
			}
			return $result;
		}
		return $data;
	}

	function array_to_object($data)
	{
		if (is_array($data) || is_object($data))
		{
			$result= new stdClass();
			foreach ($data as $key => $value)
			{
				$result->$key = array_to_object($value);
			}
			return $result;
		}
		return $data;
	}

}

?>
