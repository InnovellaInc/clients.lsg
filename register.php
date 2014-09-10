<?php

//initilize the page
require_once("inc/init.php");

//require UI configuration (nav, ribbon, etc.)
require_once("inc/config.ui.php");

/*---------------- PHP Custom Scripts ---------

YOU CAN SET CONFIGURATION VARIABLES HERE BEFORE IT GOES TO NAV, RIBBON, ETC.
E.G. $page_title = "Custom Title" */

$page_title = "Register";

//	@START:Innovella
require_once( "inc/config.SiteUtil.php" );

if( isset( $_POST["submitted"] ) )
{
   if( $siteutil->RegisterUser() )
   {
        $siteutil->RedirectToURL( "thank-you.html" );
   }
}
//	@FINISH:Innovella

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

			<span id="extr-page-header-space"> <span class="hidden-mobile">Already registered?</span> <a href="<?php echo APP_URL; ?>/login.php" class="btn btn-danger">Sign In</a> </span>

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

						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
								<h5 class="about-heading">About Landscape Galleria - Are you up to date?</h5>
								<p>
									Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa.
								</p>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
								<h5 class="about-heading">Not just your average project site!</h5>
								<p>
									Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi voluptatem accusantium!
								</p>
							</div>
						</div>

					</div>
					<div class="col-xs-12 col-sm-12 col-md-5 col-lg-5">
						<div id="siteutil" class="well no-padding">

							<form id="register" action="<?php echo $siteutil->GetSelfScript(); ?>"  class="smart-form client-form" method="post" accept-charset="UTF-8">
								<header>
									Registration is FREE*
								</header>

								<fieldset>
<!-- @START:Innovella -->
<input type="hidden" name="submitted" id="submitted" value="1"/>
<input type="text"  class="spmhidip" name="<?php echo $siteutil->GetSpamTrapInputName(); ?>" />
<div>
 <span class="dropzone.dz-clickable .dz-message span"><?php echo $siteutil->GetErrorMessage(); ?></span>
</div>
<!-- @FINISH:Innovella -->
									<section>
										<label class="input"> <i class="icon-append fa fa-user"></i>
											<input type="text" id="Person_nm" name="Person_nm" placeholder="Your first and last name" value="<?php echo $siteutil->SafeDisplay("Person_nm") ?>">
											<b class="tooltip tooltip-bottom-right">Needed to enter the website</b> </label>
									</section>

									<section>
										<label class="input"> <i class="icon-append fa fa-envelope"></i>
											<input type="email" id="Email_nm" name="Email_nm" placeholder="Email address" value="<?php echo $siteutil->SafeDisplay("Email_nm") ?>">
											<b class="tooltip tooltip-bottom-right">Needed to verify your account</b> </label>
									</section>

									<section>
										<label class="input"> <i class="icon-append fa fa-user"></i>
											<input type="text" id="User_nm" name="User_nm" placeholder="Username" value="<?php echo $siteutil->SafeDisplay("User_nm") ?>">
											<b class="tooltip tooltip-bottom-right">Needed to enter the website</b> </label>
									</section>

									<section>
										<label class="input"> <i class="icon-append fa fa-lock"></i>
											<input type="password" id="User_cd" name="User_cd" placeholder="Password" id="User_cd">
											<b class="tooltip tooltip-bottom-right">Don't forget your password</b> </label>
<div class="pwdwidgetdiv" id="thepwddiv" ></div>
									</section>

									<section>
										<label class="input"> <i class="icon-append fa fa-building"></i>
											<input type="text" id="Company_nm" name="Company_nm" placeholder="Company Name" value="<?php echo $siteutil->SafeDisplay("Company_nm") ?>">
											<b class="tooltip tooltip-bottom-right">Register the Company you work for here</b> </label>
									</section>
								</fieldset>

								<fieldset>
									<div class="row">
										<section class="col col-6">
											<label class="input">
												<input type="text" id="Position_nm" name="Position_nm" placeholder="Job Title" value="<?php echo $siteutil->SafeDisplay("Position_nm") ?>">
											</label>
										</section>
										<section class="col col-6">
											<label class="input">
												<input type="text" id="Phone_cd" name="Phone_cd" placeholder="Phone number" value="<?php echo $siteutil->SafeDisplay("Phone_cd") ?>">
											</label>
										</section>
									</div>

									<div class="row">
										<section class="col col-6">
											<label class="select">
												<select id="Class_tp" name="Class_tp">
													<option value="" selected="">Company Class</option>
													<option value="home owner">Home Owner</option>
													<option value="home builder">Home Builder</option>
													<option value="architect">Architect</option>
													<option value="landscape architect">Landscape Architect</option>
													<option value="supplier">Supplier</option>
													<option value="garden designer">Garden Designer</option>
													<option value="general contractor">General Contractor</option>
													<option value="a-general-engineering">A-General Engineering Contractor</option>
													<option value="b-general-building">B-General Building Contractor</option>
													<option value="c2-insulation-and-acoustical">C2-Insulation and Acoustical Contractor</option>
													<option value="c4-boiler-hot-water-heating">C4-Boiler, Hot Water Heating and Steam Fitting Contractor</option>
													<option value="c5-framing-rough-carpentry">C5-Framing and Rough Carpentry Contractor</option>
													<option value="c6-cabinet-millwork-finish-carpentry">C6-Cabinet, Millwork and Finish Carpentry Contractor</option>
													<option value="c7-low-voltage-systems">C7-Low Voltage Systems Contractor</option>
													<option value="c8-concrete">C8-Concrete Contractor</option>
													<option value="c9-drywall">C9-Drywall Contractor</option>
													<option value="c10-electrical">C10-Electrical Contractor</option>
													<option value="c11-elevator">C11-Elevator Contractor</option>
													<option value="c12-earthwork-paving">C12-Earthwork and Paving Contractors</option>
													<option value="c13-fencing">C13-Fencing Contractor</option>
													<option value="c14-metal-roofing">C14-Metal Roofing Contractor</option>
													<option value="c15-flooring-and-floor-covering">C15-Flooring and Floor Covering Contractors</option>
													<option value="c16-fire-protection">C16-Fire Protection Contractor</option>
													<option value="c17-glazing">C17-Glazing Contractor</option>
													<option value="c20-warm-air-heating-ventilating-and-air-conditioning">C20-Warm-Air Heating, Ventilating and Air-Conditioning Contractor</option>
													<option value="c21-building-moving-demolition">C21-Building Moving/Demolition Contractor</option>
													<option value="c23-ornamental-metal">C23-Ornamental Metal Contractor</option>
													<option value="c26-lathing-contractor">C26-Lathing Contractor</option>
													<option value="c27-landscaping">C27-Landscaping Contractor</option>
													<option value="c28-lock-and-security-equipment">C28-Lock and Security Equipment Contractor</option>
													<option value="c29-masonry">C29-Masonry Contractor</option>
													<option value="c31-construction-zone-traffic-control">C31-Construction Zone Traffic Control Contractor</option>
													<option value="c32-parking and-highway-improvement">C32-Parking and Highway Improvement Contractor</option>
													<option value="c33-painting-and-decorating">C33-Painting and Decorating Contractor</option>
													<option value="c34-pipeline">C34-Pipeline Contractor</option>
													<option value="c35-lathing-and-plastering">C35-Lathing and Plastering Contractor</option>
													<option value="c36-plumbing">C36-Plumbing Contractor</option>
													<option value="c38-refrigeration">C38-Refrigeration Contractor</option>
													<option value="c39-roofing">C39-Roofing Contractor</option>
													<option value="c42-sanitation-system">C42-Sanitation System Contractor</option>
													<option value="c43-sheet-metal">C43-Sheet Metal Contractor</option>
													<option value="c45-electrical-sign">C45-Electrical Sign Contractor</option>
													<option value="c46-solar">C46-Solar Contractor</option>
													<option value="c47-manufactured-housing">C47-Manufactured Housing Contractor</option>
													<option value="c50-reinforcing-steel">C50-Reinforcing Steel Contractor</option>
													<option value="c51-structural-steel">C51-Structural Steel Contractor</option>
													<option value="c53-swimming-pool">C53-Swimming Pool Contractor</option>
													<option value="c54-ceramic-and-mosaic-tile">C54-Ceramic and Mosaic Tile Contractor</option>
													<option value="c55-water-conditioning">C55-Water Conditioning Contractor</option>
													<option value="c57-water-well-drilling">C57-Water Well Drilling Contractor</option>
													<option value="c60-welding">C60-Welding Contractor</option>
												</select> <i></i> </label>
										</section>
										<section class="col col-6">
											<label class="input">
												<input type="text" id="Company_cd" name="Company_cd" placeholder="License number" value="<?php echo $siteutil->SafeDisplay("Company_cd") ?>">
											</label>
										</section>
									</div>

									<section>
										<label class="checkbox">
											<input type="checkbox" name="terms" id="terms">
											<i></i>I agree with the <a href="#" data-toggle="modal" data-target="#myModal"> Terms and Conditions </a></label>
									</section>
								</fieldset>
								<footer>
									<button type="submit" name="Submit" class="btn btn-primary" value="Submit">
										Register
									</button>
								</footer>

								<div class="message">
									<i class="fa fa-check"></i>
									<p>
										Thank you for your registration!
									</p>
								</div>
							</form>

						</div>
					</div>
				</div>
			</div>

		</div>

		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">Terms & Conditions</h4>
					</div>
					<div class="modal-body custom-scroll terms-body">
						
 <div id="left">



            <h1>SMARTADMIN TERMS & CONDITIONS TEMPLATE</h1>



            <h2>Introduction</h2>

            <p>These terms and conditions govern your use of this website; by using this website, you accept these terms and conditions in full.   If you disagree with these terms and conditions or any part of these terms and conditions, you must not use this website.</p>

            <p>[You must be at least [18] years of age to use this website.  By using this website [and by agreeing to these terms and conditions] you warrant and represent that you are at least [18] years of age.]</p>


            <h2>License to use website</h2>
            <p>Unless otherwise stated, [NAME] and/or its licensors own the intellectual property rights in the website and material on the website.  Subject to the license below, all these intellectual property rights are reserved.</p>

            <p>You may view, download for caching purposes only, and print pages [or [OTHER CONTENT]] from the website for your own personal use, subject to the restrictions set out below and elsewhere in these terms and conditions.</p>

            <p>You must not:</p>
            <ul>
                <li>republish material from this website (including republication on another website);</li>
                <li>sell, rent or sub-license material from the website;</li>
                <li>show any material from the website in public;</li>
                <li>reproduce, duplicate, copy or otherwise exploit material on this website for a commercial purpose;]</li>
                <li>[edit or otherwise modify any material on the website; or]</li>
                <li>[redistribute material from this website [except for content specifically and expressly made available for redistribution].]</li>
            </ul>
            <p>[Where content is specifically made available for redistribution, it may only be redistributed [within your organisation].]</p>

            <h2>Acceptable use</h2>

            <p>You must not use this website in any way that causes, or may cause, damage to the website or impairment of the availability or accessibility of the website; or in any way which is unlawful, illegal, fraudulent or harmful, or in connection with any unlawful, illegal, fraudulent or harmful purpose or activity.</p>

            <p>You must not use this website to copy, store, host, transmit, send, use, publish or distribute any material which consists of (or is linked to) any spyware, computer virus, Trojan horse, worm, keystroke logger, rootkit or other malicious computer software.</p>

            <p>You must not conduct any systematic or automated data collection activities (including without limitation scraping, data mining, data extraction and data harvesting) on or in relation to this website without [NAME'S] express written consent.</p>

            <p>[You must not use this website to transmit or send unsolicited commercial communications.]</p>

            <p>[You must not use this website for any purposes related to marketing without [NAME'S] express written consent.]</p>

            <h2>[Restricted access</h2>

            <p>[Access to certain areas of this website is restricted.]  [NAME] reserves the right to restrict access to [other] areas of this website, or indeed this entire website, at [NAME'S] discretion.</p>

            <p>If [NAME] provides you with a user ID and password to enable you to access restricted areas of this website or other content or services, you must ensure that the user ID and password are kept confidential.</p>

            <p>[[NAME] may disable your user ID and password in [NAME'S] sole discretion without notice or explanation.]</p>

            <h2>[User content</h2>

            <p>In these terms and conditions, “your user content” means material (including without limitation text, images, audio material, video material and audio-visual material) that you submit to this website, for whatever purpose.</p>

            <p>You grant to [NAME] a worldwide, irrevocable, non-exclusive, royalty-free license to use, reproduce, adapt, publish, translate and distribute your user content in any existing or future media.  You also grant to [NAME] the right to sub-license these rights, and the right to bring an action for infringement of these rights.</p>

            <p>Your user content must not be illegal or unlawful, must not infringe any third party's legal rights, and must not be capable of giving rise to legal action whether against you or [NAME] or a third party (in each case under any applicable law).</p>

            <p>You must not submit any user content to the website that is or has ever been the subject of any threatened or actual legal proceedings or other similar complaint.</p>

            <p>[NAME] reserves the right to edit or remove any material submitted to this website, or stored on [NAME'S] servers, or hosted or published upon this website.</p>

            <p>[Notwithstanding [NAME'S] rights under these terms and conditions in relation to user content, [NAME] does not undertake to monitor the submission of such content to, or the publication of such content on, this website.]</p>

            <h2>No warranties</h2>

            <p>This website is provided “as is” without any representations or warranties, express or implied.  [NAME] makes no representations or warranties in relation to this website or the information and materials provided on this website.</p>

            <p>Without prejudice to the generality of the foregoing paragraph, [NAME] does not warrant that:</p>
            <ul>
                <li>this website will be constantly available, or available at all; or</li>
                <li>the information on this website is complete, true, accurate or non-misleading.</li>
            </ul>
            <p>Nothing on this website constitutes, or is meant to constitute, advice of any kind.  [If you require advice in relation to any [legal, financial or medical] matter you should consult an appropriate professional.]</p>

            <h2>Limitations of liability</h2>

            <p>[NAME] will not be liable to you (whether under the law of contact, the law of torts or otherwise) in relation to the contents of, or use of, or otherwise in connection with, this website:</p>
            <ul>
                <li>[to the extent that the website is provided free-of-charge, for any direct loss;]</li>
                <li>for any indirect, special or consequential loss; or</li>
                <li>for any business losses, loss of revenue, income, profits or anticipated savings, loss of contracts or business relationships, loss of reputation or goodwill, or loss or corruption of information or data.</li>
            </ul>
            <p>These limitations of liability apply even if [NAME] has been expressly advised of the potential loss.</p>

            <h2>Exceptions</h2>

            <p>Nothing in this website disclaimer will exclude or limit any warranty implied by law that it would be unlawful to exclude or limit; and nothing in this website disclaimer will exclude or limit [NAME'S] liability in respect of any:</p>
            <ul>
                <li>death or personal injury caused by [NAME'S] negligence;</li>
                <li>fraud or fraudulent misrepresentation on the part of [NAME]; or</li>
                <li>matter which it would be illegal or unlawful for [NAME] to exclude or limit, or to attempt or purport to exclude or limit, its liability.</li>
            </ul>
            <h2>Reasonableness</h2>

            <p>By using this website, you agree that the exclusions and limitations of liability set out in this website disclaimer are reasonable.</p>

            <p>If you do not think they are reasonable, you must not use this website.</p>

            <h2>Other parties</h2>

            <p>[You accept that, as a limited liability entity, [NAME] has an interest in limiting the personal liability of its officers and employees.  You agree that you will not bring any claim personally against [NAME'S] officers or employees in respect of any losses you suffer in connection with the website.]</p>

            <p>[Without prejudice to the foregoing paragraph,] you agree that the limitations of warranties and liability set out in this website disclaimer will protect [NAME'S] officers, employees, agents, subsidiaries, successors, assigns and sub-contractors as well as [NAME].</p>

            <h2>Unenforceable provisions</h2>

            <p>If any provision of this website disclaimer is, or is found to be, unenforceable under applicable law, that will not affect the enforceability of the other provisions of this website disclaimer.</p>

            <h2>Indemnity</h2>

            <p>You hereby indemnify [NAME] and undertake to keep [NAME] indemnified against any losses, damages, costs, liabilities and expenses (including without limitation legal expenses and any amounts paid by [NAME] to a third party in settlement of a claim or dispute on the advice of [NAME'S] legal advisers) incurred or suffered by [NAME] arising out of any breach by you of any provision of these terms and conditions[, or arising out of any claim that you have breached any provision of these terms and conditions].</p>

            <h2>Breaches of these terms and conditions</h2>

            <p>Without prejudice to [NAME'S] other rights under these terms and conditions, if you breach these terms and conditions in any way, [NAME] may take such action as [NAME] deems appropriate to deal with the breach, including suspending your access to the website, prohibiting you from accessing the website, blocking computers using your IP address from accessing the website, contacting your internet service provider to request that they block your access to the website and/or bringing court proceedings against you.</p>

            <h2>Variation</h2>

            <p>[NAME] may revise these terms and conditions from time-to-time.  Revised terms and conditions will apply to the use of this website from the date of the publication of the revised terms and conditions on this website.  Please check this page regularly to ensure you are familiar with the current version.</p>

            <h2>Assignment</h2>

            <p>[NAME] may transfer, sub-contract or otherwise deal with [NAME'S] rights and/or obligations under these terms and conditions without notifying you or obtaining your consent.</p>

            <p>You may not transfer, sub-contract or otherwise deal with your rights and/or obligations under these terms and conditions.</p>

            <h2>Severability</h2>

            <p>If a provision of these terms and conditions is determined by any court or other competent authority to be unlawful and/or unenforceable, the other provisions will continue in effect.  If any unlawful and/or unenforceable provision would be lawful or enforceable if part of it were deleted, that part will be deemed to be deleted, and the rest of the provision will continue in effect.</p>

            <h2>Entire agreement</h2>

            <p>These terms and conditions [, together with [DOCUMENTS],] constitute the entire agreement between you and [NAME] in relation to your use of this website, and supersede all previous agreements in respect of your use of this website.</p>

            <h2>Law and jurisdiction</h2>

            <p>These terms and conditions will be governed by and construed in accordance with [GOVERNING LAW], and any disputes relating to these terms and conditions will be subject to the [non-]exclusive jurisdiction of the courts of [JURISDICTION].</p>

<h2>About these website terms and conditions</h2><p>We created these website terms and conditions with the help of a free website terms and conditions form developed by Contractology and available at <a href="http://www.SmartAdmin.com">www.SmartAdmin.com</a>.
Contractology supply a wide variety of commercial legal documents, such as <a href="#">template data protection statements</a>.
</p>
            <h2>[Registrations and authorisations</h2>

            <p>[[NAME] is registered with [TRADE REGISTER].  You can find the online version of the register at [URL].  [NAME'S] registration number is [NUMBER].]</p>

            <p>[[NAME] is subject to [AUTHORISATION SCHEME], which is supervised by [SUPERVISORY AUTHORITY].]</p>

            <p>[[NAME] is registered with [PROFESSIONAL BODY].  [NAME'S] professional title is [TITLE] and it has been granted in [JURISDICTION].  [NAME] is subject to the [RULES] which can be found at [URL].]</p>

            <p>[[NAME] subscribes to the following code[s] of conduct: [CODE(S) OF CONDUCT].  [These codes/this code] can be consulted electronically at [URL(S)].</p>

            <p>[[NAME'S] [TAX] number is [NUMBER].]]</p>

            <h2>[NAME'S] details</h2>

            <p>The full name of [NAME] is [FULL NAME].</p>

            <p>[[NAME] is registered in [JURISDICTION] under registration number [NUMBER].]</p>

            <p>[NAME'S] [registered] address is [ADDRESS].</p>

            <p>You can contact [NAME] by email to [EMAIL].</p>

           

            </div>
			
			<br><br>

            <p><strong>By using this  WEBSITE TERMS AND CONDITIONS template document, you agree to the 
	 <a href="#">terms and conditions</a> set out on 
	 <a href="#">SmartAdmin.com</a>.  You must retain the credit 
	 set out in the section headed "ABOUT THESE WEBSITE TERMS AND CONDITIONS".  Subject to the licensing restrictions, you should 
	 edit the document, adapting it to the requirements of your jurisdiction, your business and your 
	 website.  If you are not a lawyer, we recommend that you take professional legal advice in relation to the editing and 
	 use of the template.</strong></p>


					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							Cancel
						</button>
						<button type="button" class="btn btn-primary" id="i-agree">
							<i class="fa fa-check"></i> I Agree
						</button>
						
						<button type="button" class="btn btn-danger pull-left" id="print">
							<i class="fa fa-print"></i> Print
						</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->

<!-- ==========================CONTENT ENDS HERE ========================== -->
<?php 
	//include required scripts
	include("inc/scripts.php"); 
?>

<!-- PAGE RELATED PLUGIN(S) 
<script src="..."></script>-->

<script type="text/javascript">
	runAllForms();

	// Model i agree button
	$("#i-agree").click(function()
	{
		$this=$("#terms");
		if($this.checked) {
			$('#myModal').modal('toggle');
		} else {
			$this.prop('checked', true);
			$('#myModal').modal('toggle');
		}
	});
	
	// Validation
	$(function()
	{
		// Validation
		$("#register").validate(
		{
			// Rules for form validation
			rules :
			{
				Person_nm :
				{
					required : true
				},
				User_nm :
				{
					required : true
				},
				Email_nm :
				{
					required : true,
					email : true
				},
				User_cd :
				{
					required : true,
					minlength : 6,
					maxlength : 20
				},
				Company_nm :
				{
					required : true
				},
				Position_nm :
				{
					required : true
				},
				Phone_cd :
				{
					required : true
				},
				Class_tp :
				{
					required : true
				},
				terms :
				{
					required : true
				}
			},

			// Messages for form validation
			messages : 
			{
				Person_nm : 
				{
					required : 'Please enter your full name (first and last)'
				},
				User_nm : 
				{
					required : 'Please enter a user name for account login'
				},
				Email_nm : 
				{
					required : 'Please enter your email address',
					email : 'Please enter a VALID email address'
				},
				User_cd : 
				{
					required : 'Please enter your password'
				},
				Company_nm : 
				{
					required : 'Please enter the name of your company'
				},
				Position_nm : 
				{
					required : 'Please enter your job title at this company'
				},
				Phone_cd : 
				{
					required : 'Please enter a phone number we can reach you at'
				},
				Class_tp : 
				{
					required : 'Please select your company classification'
				},
				terms : 
				{
					required : 'You must agree with Terms and Conditions'
				}
			},

			// Ajax form submition
			submitHandler : function(form) 
			{
				$(form).ajaxSubmit(
				{
					success : function() 
					{
						$("#smart-form-register").addClass('submited');
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

	var pwdwidget = new PasswordWidget('thepwddiv','password');
    pwdwidget.MakePWDWidget();

    var frmvalidator  = new Validator("register");
    frmvalidator.EnableOnPageErrorDisplaySingleBox();
    frmvalidator.EnableMsgsTogether();

</script>

<?php 
	//include footer
	include("inc/google-analytics.php"); 
?>