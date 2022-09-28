<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Sign up page</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
  <script type="text/javaScript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/jquery-2.1.1.js"></script>
  <script src="js/bootstrap.min.js"></script>

  <style type="text/css">
      body {
        padding-top: 20px;
        padding-bottom: 40px;
        background-color: white;
      }
      .form-home {
        max-width:1000px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: white;
        border: 1px solid #c2d7ff;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }
  </style>
  <style>
table, th, td
{
border:0px solid black;
padding:10px;
}
table
{
border-spacing:20px;
}
</style>
<script language="javascript">
function fncSubmit()
{
if(document.signupform.newpassword.value != document.signupform.conpassword.value)
{
alert('Password Not Match');
document.signupform.conpassword.focus(); 
return false;
} 

document.ChangePasswordForm.submit();
}
</script>
<script type="text/javascript">
$(document).ready(function(){
	//called when key is pressed in textbox
	$("#inputString").keypress(function (e)
	{
	$("#error").hide();
	$("#autoSuggestionsList").hide();
	//if the letter is not digit then display error and don't type anything
	if( e.which!=8 && e.which!=0 && (e.which<48 || e.which>57)
	&& (e.which<65 || e.which>90)&& (e.which<97 || e.which>122))
	{
	//display error message
	$("#error").html("You Can't Use Special Characters.").show();
	return false;
	}
});});

function lookup(inputString) {
	if(inputString.length <6) {
	$('#suggestions').show();
	$('#autoSuggestionsList').hide();
	} else {
	$('#suggestions').hide();
	$.post("CheckUsername.jsp",{user: ""+inputString+""},function(data){
	$('#autoSuggestionsList').html(data).show();
	});
	}}
	
function strength(inputString) {
	if(inputString.length <10) {
	$('#suggestionsa').show();
	$('#autoSuggestionsLista').hide();
	} else {
	$('#suggestionsa').hide();
	$.post("CheckUsername.jsp",{user: ""+inputString+""},function(data){
	$('#autoSuggestionsLista').html(data).show();
	});
	}}
</script>
</head>
<body>
	<div class="container">
		<form name="signupform"  action="adduser.jsp" class="form-home" role="form" method="post" OnSubmit="return fncSubmit();">
			<div>
				<br/>
				<div style="background-color:#6395c9;height:80px;"><!--#093bc9--><br>
					<h3 style="color:white;font-family:Times New Roman;" align="center">Inventory Management System</h3>
				</div>
				<br/>
				<h4 style="color:#0b7f05;" align="center">Sign Up Here...</h4> <hr>
				<table align="center">
					<tr>
						<td align="right">
							Full Name :
						</td>
						<td>
							<input type="text" name="fullname" class="form-control" placeholder="Full Name" required size="35">
						</td>
						<td align="right">
							User Name :
						</td>
						<td align="left">
							<input type="text" name="username" class="form-control" id="inputString" placeholder="User Name" onkeyup="lookup(this.value);" required>
							<font color="red">
								<div id="suggestions" style="display: none;"> Value must be greater than 6 characters</div>
								<div style="display: none;" id="autoSuggestionsList"></div>
								<div style="display: none;" id="error"></div>
							</font>
						</td>			
					</tr>
					<tr>
						<td align="right">
							Password :
						</td>
						<td>
							<input type="password" id="newpassword" name="password" class="form-control" placeholder="Password" onkeyup="strength(this.value);" required>
							<font color="red">
								<div id="suggestionsa" style="display: none;"> Value must be greater than 10 characters</div>
							</font>
						</td>
						<td align="right">
							Confirm Password :
						</td>
						<td>
							<input type="password" id="conpassword" name="conpassword" class="form-control" placeholder="Confirm Password" required>
						</td>				
					</tr>
					<tr>
						<td align="right">
							Phone :
						</td>
						<td>
							<input type="text" name="phone" class="form-control" placeholder="Phone" required>
						</td>
						<td align="right">
							E-mail :
						</td>
						<td>
							<input type="email" name="email" class="form-control" placeholder="E-mail" required size="30">
						</td>		
					</tr>
					<tr>
						<td align="right">
							Position :
						</td>
						<td>
							<select name="position" class="form-control" required>
								<option>  </option>
								<option value="Owner">Owner</option>
								<option value="Manager">Manager</option>
								<option value="Accountant">Accountant</option>
								<option value="SalesPerson">Sales Person</option>
							</select>
						</td>
						<td align="right">
							Address :
						</td>
						<td>
							<textarea rows="1" cols="40" class="form-control" placeholder="Address" name="address" required></textarea>
						</td>				
					</tr>
					<tr>
										
					</tr>
			</table>
		<hr>
		<h6 align="center"><a href="Login.jsp"><i>Already You Have An Account &#33;</i></a></h6>
		<table align="center">
				<tr>
					<td>
						<button class="btn btn-large btn-primary" type="submit">Sign UP</button>
					</td>
					<td>&nbsp;</td><td>&nbsp;</td>
					<td>
						<button class="btn btn-large btn-primary" type="reset">Reset</button>
					</td>
				</tr>
			</table>
		</div>
		</form>
	</div>
</body>
</html>