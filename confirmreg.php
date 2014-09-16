<?php
//initilize the page
require_once("inc/init.php");

//require UI configuration (nav, ribbon, etc.)
require_once("inc/config.ui.php");

/*---------------- PHP Custom Scripts ---------

YOU CAN SET CONFIGURATION VARIABLES HERE BEFORE IT GOES TO NAV, RIBBON, ETC.
E.G. $page_title = "Custom Title" */

$page_title = "Confirm Registration";

require_once( "inc/config.SiteUtil.php" );

if( isset( $_GET["code"] ) )
{
   if( $siteutil->ConfirmUser() )
   {
        $siteutil->RedirectToURL( "thank-you-reg.html" );
   }
}
/* ---------------- END PHP Custom Scripts ------------- */

//include header
//you can add your custom css in $page_css array.
//Note: all css files are inside css/ folder
$page_css[] = "your_style.css";
$no_main_header = true;
$page_body_prop = array("id"=>"extr-page");
include("inc/header.php");

?>
<!-- ==========================CONTENT STARTS HERE ========================== -->
		<!-- possible classes: minified, no-right-panel, fixed-ribbon, fixed-header, fixed-width-->
		<header id="header">
			<!--<span id="logo"></span>-->

			<div id="logo-group">
				<span id="logo"> <img src="<?php echo ASSETS_URL; ?>/img/logo.png" alt="SmartAdmin"> </span>

				<!-- END AJAX-DROPDOWN -->
			</div>
		</header>
		<div id="main" role="main">
			<!-- MAIN CONTENT -->
			<div id="content" class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-7 col-lg-7 hidden-xs hidden-sm">
					<h1 class="txt-color-red login-header-big">Landscape Galleria</h1>
					<div class="hero">
						<div class="pull-left login-desc-box-l">
							<h4 class="paragraph-header">It's Okay to be Smart. Experience the simplicity of the Landscape Galleria, everywhere you go!</h4>
						</div>
					</div>
				</div>

<!-- Form Code Start -->
				<div class="col-sm-12 col-sm-12 col-md-5 col-lg-5">
					<div id="siteutil" class="well no-padding">
						<form id="confirm" action="<?php echo $siteutil->GetSelfScript(); ?>" class="smart-form client-form" method="get" accept-charset="UTF-8">
							<header>Registration Confirmation</header>
							<div>
<div class=".alert alert-danger alert-heading">
<span><?php echo $siteutil->GetErrorMessage(); ?></span>
</div>
<!--<strong>Error! </strong>-->
							</div>	<!-- error message END -->

							<fieldset>
								<section>
									<label class="input"> <i class="icon-append fa fa-building"></i>
										<input type="text" id="code" name="code" placeholder="Confirmation Code" value="<?php echo $siteutil->SafeDisplay("code") ?>">
										<b class="tooltip tooltip-bottom-right">Copy and paste the confirmation code from the registration email here</b> </label>
								</section>
							</fieldset>
							<footer>
								<button type="submit" name="Submit" class="btn btn-primary" value="Submit">
									Confirm
								</button>
							</footer>

			<div class="message">
				<i class="fa fa-check"></i>
				<p>
					Thank you for confirming your registration!
				</p>
			</div>

						</form>	<!-- form END-->
					</div><!-- siteutil END -->
				</div>
			</div>
		</div><!-- content END -->

<!-- client-side Form Validations:
Uses the excellent form validation script from JavaScript-coder.com-->
<script type="text/javascript">
	runAllForms();

	// Validation
	$(function()
	{
		// Validation
		$("#confirm").validate(
		{
			// Rules for form validation
			rules :
			{
				code :
				{
					required : true
				}
			},

			// Messages for form validation
			messages : 
			{
				code : 
				{
					required : 'Please enter the confirmation code from the registration email'
				}
			},

			// Ajax form submition
			submitHandler : function(form) 
			{
				$(form).ajaxSubmit(
				{
					success : function() 
					{
						$("#confirm").addClass('submited');
					}
				});
			},

			// Do not change code below
			errorPlacement : function(error, element)
			{
				error.insertAfter(element.parent());
			}
		});

	});


// <![CDATA[

    var frmvalidator  = new Validator("confirm");
    frmvalidator.EnableOnPageErrorDisplay();
    frmvalidator.EnableMsgsTogether();
//    frmvalidator.addValidation("code","req","Please enter the confirmation code");

// ]]>
</script>
</div><!-- main END -->
<!--
Form Code End (see html-form-guide.com for more info.)
-->

</body>
</html>