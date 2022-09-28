<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="header_1.jsp" %>
<br>
    <form name="userForm" novalidate class="form-signin" ng-controller="NewUserController">
    <h5 style="color:#0b7f05;" align="center">Sign Up Here...</h5> <hr>
      <div class="form-group" show-errors='{showSuccess: true}'>
		<div class="control-label">
			<label class="control-label">User Name</label>
			<input type="text" class="form-control" id="userid" name="username" ng-model="user.username" valid-username placeholder="User Name" required/>
			<p class="help-block" ng-if="userForm.username.$error.required">The user's username is required</p>
            <p class="help-block" ng-if="userForm.username.$error.invalidChars">Username must contain letters &amp; spaces only.</p>
            <p class="help-block" ng-if="userForm.username.$error.invalidLen">Username must be 5-20 characters.</p>
		</div>
	</div>
				    
      <div class="form-group" show-errors='{showSuccess: true}'>
        <label class="control-label">Name</label>
        <input type="text" class="form-control" name="fullname" ng-model="user.fullname" ng-minlength=5 ng-maxlength=25 required placeholder="Full Name" />
        <p class="help-block" ng-if="userForm.fullname.$error.required">The user's name is required</p>
      </div>
      
      <div class="form-group" show-errors='{showSuccess: true}'>
        <label class="control-label">Phone</label>
        <input type="text" class="form-control" name="phone" ng-model="user.phone" data-ng-minlength=8 data-ng-maxlength=15 required placeholder="Phone" />
        <p class="help-block" ng-if="userForm.phone.$error.required">The user's Phone is required</p>
      </div>
      
      <div class="form-group" show-errors='{showSuccess: true}'>
        <label class="control-label">Email</label>
        <input type="email" class="form-control" name="email" ng-model="user.email" required placeholder="Email" />
        <p class="help-block" ng-if="userForm.email.$error.required">The user's email is required</p>
        <p class="help-block" ng-if="userForm.email.$error.email">The email address is invalid</p>
      </div>
      
      <div class="form-group" show-errors='{showSuccess: true}'>
		<div class="control-label">
			<label class="control-label">Password</label>
			<input type="password" class="form-control" name="password" ng-model="user.password" valid-password placeholder="Password" required />
			<p class="help-block" ng-if="userForm.password.$error.required">The user's Password is required</p>
            <p class="help-block" ng-if="userForm.password.$error.isWeak">Must contain one upper &amp; lower case letter and a non-letter.</p>
            <p class="help-block" ng-if="userForm.password.$error.invalidLen">Must be 8-20 characters.</p>
		</div>
	  </div>
	  
	  <div class="form-group" show-errors='{showSuccess: true}'>
		<div class="control-label">
			<label class="control-label">Re-Password</label>
			<input type="password" class="form-control" name="password_c" ng-model="user.password_c" valid-password-c placeholder="Re-Password" required />
			<p class="help-block" ng-if="userForm.password_c.$error.required">Confirmation Required.</p>
            <p class="help-block" ng-if="userForm.password_c.$error.noMatch">Re-Password don't match.</p>
		</div>
	  </div>
	  
	  <div class="form-group" show-errors='{showSuccess: true}'>
        <label class="control-label">Position</label>
        	<select name="position" class="form-control" data-ng-init="position=['Owner','Manager','Accountant','Sales Person']" ng-model="user.position" required>
				<option></option>
				<option data-ng-repeat="x in position" value="{{ x }}">{{ x }}</option>
			</select>
      </div>
      
      <div class="form-group" show-errors='{showSuccess: true}'>
        <label class="control-label">Address</label>
        	<textarea rows="1" cols="40" class="form-control" name="address" ng-model="user.address" placeholder="Address" required></textarea>
      		<p class="help-block" ng-if="userForm.address.$error.required">The user's address is required</p>
      </div>
	  
      <button type="submit" class="btn btn-primary" ng-click="save()">Add User</button>
      <button class="btn btn-link" ng-click="reset()">Reset</button>
    </form>

