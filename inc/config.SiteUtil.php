<!-- @START:Innovella -->
<?PHP
/*
*	config.SiteUtil.php
*
*/
require_once $document_root . "/lib/class.SiteUtil.php";

$siteutil = new SiteUtil();

//Provide your site name here
$siteutil->SetWebsiteName("LandscapeGalleria.com");

//Provide the email address where you want to get notifications
$siteutil->SetAdminEmail("info@LandscapeGalleria.com");

//Provide your database login details here:
//hostname, user name, password, database name and table name
//note that the script will create the table (for example, fgusers in this case)
//by itself on submitting register.php for the first time
$siteutil->InitDB(/*hostname*/'localhost',
                      /*username*/'innovella',
                      /*password*/'Innovella123',
                      /*database name*/'public_lsg',
                      /*table name*/'fgusers3');

//For better security. Get a random string from this link: http://tinyurl.com/randstr
// and put it here
$siteutil->SetRandomKey('qSRcVS6DrTzrPvr');

?>
<!-- @FINISH:Innovella -->
