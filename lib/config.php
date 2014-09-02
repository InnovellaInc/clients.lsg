<?php

//configure constants

$directory = realpath(dirname(__FILE__));
$document_root = realpath($_SERVER['DOCUMENT_ROOT']);
$base_url = ( isset($_SERVER['HTTPS']) && $_SERVER['HTTPS']=='on' ? 'https' : 'http' ) . '://' .
    $_SERVER['HTTP_HOST'];
if(strpos($directory, $document_root)===0) {
    $base_url .= str_replace(DIRECTORY_SEPARATOR, '/', substr($directory, strlen($document_root)));
}

defined("APP_URL") ? null : define("APP_URL", str_replace("/lib", "", $base_url));
//Assets URL, location of your css, img, js, etc. files
defined("ASSETS_URL") ? null : define("ASSETS_URL", APP_URL);

// @LSG:START
defined( "DB_HOST" ) ? null : define( "DB_HOST", "localhost" );
defined( "DB_DSN" ) ? null : define( "DB_DSN", "mysql:dbname=public_lsg" );
defined( "DB_USERNAME" ) ? null : define( "DB_USERNAME", "innovella" );
defined( "DB_PASSWORD" ) ? null : define( "DB_PASSWORD", "Innovella123" );
defined( "DB_NAME" ) ? null : define( "DB_NAME", "public_lsg" );

defined( "PAGE_SIZE" ) ? null : define( "PAGE_SIZE", 25 );
defined( "TBL_RESOURCETYPE" ) ? null : define( "TBL_RESOURCETYPE", "resourcetype" );
defined( "TBL_RESOURCE" ) ? null : define( "TBL_RESOURCE", "resource" );
defined( "TBL_COMPANYTYPE" ) ? null : define( "TBL_COMPANYTYPE", "companytype" );
defined( "TBL_USER" ) ? null : define( "TBL_USER", "user" );
defined( "TBL_USERTYPE" ) ? null : define( "TBL_USERTYPE", "usertype" );
defined( "TBL_CONTACT" ) ? null : define( "TBL_CONTACT", "contact" );
defined( "TBL_CONTACTTYPE" ) ? null : define( "TBL_CONTACTTYPE", "contacttype" );
defined( "TBL_RESOURCETYPE_COMPANYYPE" ) ? null : define( "TBL_RESOURCEYPE_COMPANYYPE", "resourcetype_companytype" );
defined( "TBL_RESOURCE_COMPANY" ) ? null : define( "TBL_RESOURCE_COMPANY", "resource_company" );
defined( "TBL_RESOURCE_LOCATION" ) ? null : define( "TBL_RESOURCE_LOCATION", "resource_location" );

define( "ROOT_PATH", dirname( __FILE__ ));

/**
 * I18n support
 */
define( "DEFAULT_LOCALE", "en_US" );
define( "DEFAULT_ENCODING", "UTF-8" );
define( "DEFAULT_DOMAIN", "default" );

putenv( "LC_ALL=" . DEFAULT_LOCALE );
setlocale( LC_ALL, DEFAULT_LOCALE );

bind_textdomain_codeset(DEFAULT_DOMAIN, DEFAULT_ENCODING);
textdomain(DEFAULT_DOMAIN);
// @LSG:FINISH
// @LSG:START
defined("SHORTCUT_URL") ? null : define("SHORTCUT_URL", str_replace("/lib", "/index.php#ajax", $base_url));

// set true if production environment else false for development
define ('IS_ENV_PRODUCTION', false);
// configure error reporting options
// error_reporting(E_ALL | E_STRICT);
error_reporting(E_ALL);
ini_set('display_errors', !IS_ENV_PRODUCTION);
ini_set('error_log', 'log/phperror.txt');

ini_set("xdebug.var_display_max_depth", -1);
ini_set("xdebug.var_display_max_children", -1);
ini_set("xdebug.var_display_max_data", -1);
ini_set("log_errors", 1);

// set time zone to use date/time functions without warnings
date_default_timezone_set('America/New_York');
// @LSG:FINISH


//require library files
//require_once("util.php");

require_once("func.global.php");

require_once("smartui/class.smartutil.php");
require_once("smartui/class.smartui.php");

// smart UI plugins
require_once("smartui/class.smartui-widget.php");
require_once("smartui/class.smartui-datatable.php");
require_once("smartui/class.smartui-button.php");
require_once("smartui/class.smartui-tab.php");
require_once("smartui/class.smartui-accordion.php");
require_once("smartui/class.smartui-carousel.php");
require_once("smartui/class.smartui-smartform.php");

// register our UI plugins
SmartUI::register('widget', 'Widget');
SmartUI::register('datatable', 'DataTable');
SmartUI::register('button', 'Button');
SmartUI::register('tab', 'Tab');
SmartUI::register('accordion', 'Accordion');
SmartUI::register('carousel', 'Carousel');
SmartUI::register('smartform', 'SmartForm');

require_once("class.html-indent.php");
require_once("class.parsedown.php");

?>