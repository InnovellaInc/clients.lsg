<?php

//initilize the page
require_once("inc/init.php");

//require UI configuration (nav, ribbon, etc.)
require_once("inc/config.ui.php");

/*---------------- PHP Custom Scripts ---------

YOU CAN SET CONFIGURATION VARIABLES HERE BEFORE IT GOES TO NAV, RIBBON, ETC.
E.G. $page_title = "Custom Title" */
$page_title = "Login";

//	@START:Innovella
require_once( "inc/config.SiteUtil.php" );

if( isset( $_POST['submitted'] ) )
{
   if( $siteutil->Login() )
   {
        $siteutil->RedirectToURL( "index.php" );
   }
}
//	@FINISH:Innovella

/* ---------------- END PHP Custom Scripts ------------- */

//include header
//you can add your custom css in $page_css array.
//Note: all css files are inside css/ folder
$page_css[] = "your_style.css";
$no_main_header = true;
$page_body_prop = array("id"=>"extr-page", "class"=>"animated fadeInDown");
include("inc/header.php");

?>
<!-- ==========================CONTENT STARTS HERE ========================== -->
<!-- possible classes: minified, no-right-panel, fixed-ribbon, fixed-header, fixed-width-->
<header id="header">
	<!--<span id="logo"></span>-->

	<div id="logo-group">
		<span id="logo"> <img src="<?php echo ASSETS_URL; ?>/img/logo.png" alt="Landscape Galleria"> </span>

		<!-- END AJAX-DROPDOWN -->
	</div>

	<span id="extr-page-header-space"> <span class="hidden-mobile">Need an account?</span> <a href="<?php echo APP_URL; ?>/register.php" class="btn btn-danger">Create account</a> </span>

</header>

<div id="main" role="main">

	<!-- MAIN CONTENT -->
	<div id="content" class="container">

		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-7 col-lg-8 hidden-xs hidden-sm">
				<h1 class="txt-color-red login-header-big">Landscape Galleria</h1>
				<div class="hero">

					<div class="pull-left login-desc-box-l">
						<h4 class="paragraph-header">It's Okay to be Smart. Experience the simplicity of Landscape Galleria, everywhere you go!</h4>
						<div class="login-app-icons">
							<a href="javascript:void(0);" class="btn btn-danger btn-sm">Frontend Template</a>
							<a href="javascript:void(0);" class="btn btn-danger btn-sm">Find out more</a>
						</div>
					</div>
					
					<img src="<?php echo ASSETS_URL; ?>/img/demo/iphoneview.png" class="pull-right display-image" alt="" style="width:210px">

				</div>

				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						<h5 class="about-heading">About Landscape Galleria - Are you up to date?</h5>
						<p>
							Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa.
						</p>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						<h5 class="about-heading">Not just your average template!</h5>
						<p>
							Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi voluptatem accusantium!
						</p>
					</div>
				</div>

			</div>
			<div class="col-xs-12 col-sm-12 col-md-5 col-lg-4">
				<div id="siteutil" class="well no-padding">
					<form id="login-form" class="smart-form client-form" action="<?php echo $siteutil->GetSelfScript(); ?>" method="post" accept-charset="UTF-8">
						<header>
							Sign In
						</header>

						<fieldset>
<!-- @START:Innovella -->
<input type='hidden' name='submitted' id='submitted' value='1'/>
<div id="login-error" class="alert" data-dismiss="alert"><?php echo $siteutil->GetErrorMessage(); ?>
</div>
<!-- @FINISH:Innovella -->
							<section>
								<label class="label">UserName</label>
								<label class="input"> <i class="icon-append fa fa-user"></i>
									<input type="text" name="User_nm" id="User_nm" value="<?php echo $siteutil->SafeDisplay('User_nm') ?>" maxlength="50">
									<b class="tooltip tooltip-top-right"><i class="fa fa-user txt-color-teal"></i> Please enter your UserName</b></label>
<span id='login_username_errorloc' class='error'></span>
							</section>

							<section>
								<label class="label">Password</label>
								<label class="input"> <i class="icon-append fa fa-lock"></i>
									<input type="password" name="User_cd" id="User_cd" maxlength="50">
									<b class="tooltip tooltip-top-right"><i class="fa fa-lock txt-color-teal"></i> Enter your password</b> </label>
<span id='login_password_errorloc' class='error'></span>
								<div class="note">
									<a href="<?php echo APP_URL; ?>/forgotpassword.php">Forgot password?</a>
								</div>
							</section>

							<section>
								<label class="checkbox">
									<input type="checkbox" name="remember" checked="">
									<i></i>Stay signed in</label>
							</section>
						</fieldset>
						<footer>
							<button type="submit" name="Submit" value="Submit" class="btn btn-primary">
								Sign in
							</button>
						</footer>
					</form>

				</div>
				
			</div>
		</div>
	</div>

</div>
<!-- END MAIN PANEL -->
<!-- ==========================CONTENT ENDS HERE ========================== -->

<?php 
	//include required scripts
	include("inc/scripts.php"); 
?>

<!-- PAGE RELATED PLUGIN(S) 
<script src="..."></script>-->

<script type="text/javascript">
	runAllForms();

	$(function() {
		// Validation
		$("#login-form").validate({
			// Rules for form validation
			rules : 
			{
				User_nm : {
					required : true,
					minlength : 3,
					maxlength : 50
				},
				User_cd : {
					required : true,
					minlength : 6,
					maxlength : 50
				}
			},

			// Messages for form validation
			messages : 
			{
				User_nm : {
					required : 'Please enter your username'
				},
				User_cd : {
					required : 'Please enter your password'
				}
			},

			// Do not change code below
			errorPlacement : function(error, element) {
				error.insertAfter(element.parent());
			}
		});
	});

// <![CDATA[

    var frmvalidator  = new Validator("login-form");
    frmvalidator.EnableOnPageErrorDisplay();
    frmvalidator.EnableMsgsTogether();

    frmvalidator.addValidation("User_nm","req","Please provide your username");
    
    frmvalidator.addValidation("User_cd","req","Please provide the password");

// ]]>


</script>

<?php 
	//include footer
	include("inc/google-analytics.php"); 
?>