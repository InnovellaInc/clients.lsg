<?php 
/** 
 * The Accessor class. The Accessor class provides a form to access the properties of a class.  
 * As Microsoft .NET, We don't need call its methods using the pattern of nomenclature known as Beans (see Java Beans). 
 * For example, if I have a property named "name", its access methods are named of "getName" and "setName".  
 * We then write these methods and too write its to call in our code. Such as "$ourObject->getName()" or "$ourObject->setName('Olavo')". 
 * With the Accessor class we don't need write in this form. We only write "$ourObject->Name" or "$ourObject->Name = 'Olavo'". 
 *  
 */ 
abstract class Accessor 
{ 
	/** 
		* @var constant named SET, for only set methods 
		*/     
	const SET = "SET"; 
     
	/** 
		* @var constant named GET, for only get methods 
		*/     
	const GET = "GET"; 

	/** 
		* @var array beans to get's methods 
		* @static 
		*/ 
	private static $arrGet_Beans = array("get", "is"); 
     
	/** 
		* @var array beans to set's methods 
		* @static  
		*/ 
	private static $arrSet_Beans = array("set");     
     
	/** 
		* Make the search to verify if the method name informed exists in class definition 
		* @access private  
		* @final 
		* @param string method name to search 
		* @param string const that is the kind of access: GET or SET 
		* @param object an instance of current object analyzed  
		* @return string method name  
		*/ 
	final private static function searchMethod( $name, $type, $object ) 
	{ 
		// 
		// The method's name that will be retrieved 
		// 
		$methodName = ""; 
         
		// 
		// Reflecion class of current object 
		// 
		$objReflectionClass       = new ReflectionClass ( get_class($object) ); 
         
		// 
		// get the properties of current object 
		// 
		$objReflectionProperties = $objReflectionClass->getProperties();   
         
		$arrBeans = ($type == self::SET) ? Accessor::$arrSet_Beans : Accessor::$arrGet_Beans; 
         
		// 
		// Loop in its properties 
		// 
		for( $i = 0 ; $i < count( $objReflectionProperties ); $i++ ) 
		{ 
			// 
			// test all rules based on static property named "arrSet_Beans" 
			// 
			for( $j = 0 ; $j < count( $arrBeans ); $j++ ) 
			{             
				// 
				// test each rule 
				// 
				if ( $objReflectionClass->hasMethod( $arrBeans[$j] . $name )) 
				{ 
					// 
					// Retrieve the method selected 
					// 
					$currentMethod = $objReflectionClass->getMethod( $arrBeans[$j] . $name ); 
                     
					// 
					// test its access' level 
					// 
					if ( $currentMethod->isPublic() ) 
					{ 
						// 
						// If the method has public modifier, then keeps its name 
						//                     
						$methodName = $arrBeans[$j] . $name; 
					} 
					else 
					{ 
						// 
						// the client atemps access a private set method 
						// 
						throw new Exception("Can't call private method named \"". $arrBeans[$j] . $name. "()\" in \"" .get_class($object) . "\" class. Access's Level denied"); 
					} 

					// 
					// break the two loops 
					// 
					$j = count( $arrBeans ); 
					$i = count( $objReflectionProperties ); 
				}                 
			} 
             
		}     
         
		return $methodName;     
	} 
     
	/** 
		* Retrieves the value of property  
		* @access public  
		* @final 
		* @param string property name 
		* @param object an instance of current object analyzed  
		* @return variant the value of property  
		*/     
	final public static function get($name, $object) 
	{
		$methodName = self::searchMethod($name, self::GET, $object); 

		if( !empty($methodName) ) 
		{ 
			return $object->$methodName(); 
		} 
		else 
		{ 
			throw new Exception("Property named $name doesn't exist in \"" .get_class($object) . "\" class."); 
		} 
	} 

	/** 
		* Sets the value of property  
		* @access public  
		* @final 
		* @param string property name 
		* @param variant property's value  
		* @param object an instance of current object analyzed  
		* @return void  
		*/     
	final public static function set($name, $value , $object) 
	{ 
		$methodName = self::searchMethod($name, self::SET, $object); 
         
		if( !empty($methodName) ) 
		{ 
			$object->$methodName($value); 
		}
		else 
		{ 
			throw new Exception("Could not set the property named \"". $name . "\" of an instance of \"". get_class($object) . "\" class.");
		} 
	}     
} 
?>