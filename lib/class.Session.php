<?php
// http://www.wikihow.com/Create-a-Secure-Session-Managment-System-in-PHP-and-MySQL
class Session
{
	/**
	* Properties
	*/
	public function set( $name, $value)
	{
		$_SESSION[$name] = $value;
	}

	public function get( $name )
	{
		if ( isset( $_SESSION[$name] ) )
		{
			return $_SESSION[$name];
		}
		else
		{
			return FALSE;
		}
	}

	public function __construct()
	{
		session_start();
	}

	public function del( $name )
	{
		unset( $_SESSION[$name] );
	}

	public function destroy()
	{
		$_SESSION = array();
		session_destroy();
		session_regenerate_id();
	}
}
?>
