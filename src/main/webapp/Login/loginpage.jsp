<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="header_1.jsp" %>
<br>
<form class="form-signin" name='loginForm' align="center" novalidate action="Login/LoginCheck.jsp" method="post" ng-controller="reset">
<div align="center">
	<h5 style="color:#0b7f05" class="form-signin-heading">Please Sign In Here...</h5><hr><br/>
		<div id="div" class="form-group" show-errors='{showSuccess: true}'>
		    <input type="text" name="counterno" ng-model="user.counterno" class="form-control" placeholder="Counter No" required size="10"/>
		</div>
		<div class="form-group" show-errors='{showSuccess: true}'>
			<div class="control-label">
				<label class="control-label"></label>
				<input type="text" class="form-control" id="userid" name="username" ng-model="user.username" valid-username placeholder="User Name" required/>
			</div>
		</div>
		<div class="form-group" show-errors='{showSuccess: true}'>
			<div class="control-label">
				<label class="control-label"></label>
				<input type="password" class="form-control" name="password" ng-model="user.password" valid-password placeholder="Password" required />
			</div>
	  	</div>
	  	<button type="submit" class="btn btn-primary" ng-disabled="loginForm.$invalid">Add User</button>
        <a class="btn btn-link" ng-click="resetAll()">Reset</a>
</div>

		<!-- 
		<div class="control-group" ng-class="{error:!loginForm.username.$valid}">
		    <label for="inputUsername" class="control-label"></label>
			<div class="controls">
			    <input type="text" id="inputUsername" name="username" ng-model="login.username" valid-username placeholder="User Name" />
			    <br/>
			    	<div class="help-inline">
			          	<span ng-show="!!loginForm.username.$error.isBlank">Username Required.</span>
			        </div>
			</div>
		</div>
		<div class="control-group" ng-class="{error:!loginForm.password.$valid}">
		     <label for="inputPassword" class="control-label"></label>
		        <div class="controls">
		            <input type="password" id="inputPassword" name="password" ng-model="login.password" valid-password placeholder="Password" /><br/>
		        <div class="help-inline">
		            <span ng-show="!!loginForm.password.$error.isBlank">Password Required.</span>
		        </div>
		    	</div>
		</div>
		<div class="form-actions" ng-show="formAllGood()">
        	<input type="submit" class="btn btn-primary" value="Submit" />
    	</div>
		 -->
</form>
