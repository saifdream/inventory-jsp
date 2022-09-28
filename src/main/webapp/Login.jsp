<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<title>Inventory</title>
	<link data-require="bootstrap-css@3.0.1" data-semver="3.0.1" rel="stylesheet" href="Bootstrapcss/bootstrap.min.css" />
	<link data-require="bootstrap-css@3.0.1" data-semver="3.0.1" rel="stylesheet" href="css/bootstrap-responsive.min.css" />
	<link rel="stylesheet" href="Bootstrap3.3.0/bootstrap.min.css">
	<link rel="stylesheet" href="css/full-slider.css" />
    <link rel="stylesheet" href="Appcss/login.css" />
    <link rel="stylesheet" href="Appcss/style.css" />
</head>
<body ng-app="app">

  <div ng-view></div>
  
  <hr>
  <div align="center">
  	<h5> User's Creation  -- <a target="_blank" href="create.html"> Click here..</a></h5>
    <h5> User's List  -- <a target="_blank" href="list.html"> Click here..</a></h5>
    <h5> User's Sort able List  -- <a target="_blank" href="sortable_table.html"> Click here..</a></h5>
    <h5> User's Confirmation  -- <a target="_blank" href="confirmation.html"> Click here..</a></h5>
    <h5> User's Editing  -- <a target="_blank" href="edit.html"> Click here..</a></h5>
    <h5> User's Sales Entry  -- <a target="_blank" href="onetomany.html"> Click here..</a></h5>
  </div>
  
  <footer>
    <p align="center"> Copyright by - saif-dream &copy; Inventory - 2014 </p>
  </footer>
  
    <script data-require="jquery@*" data-semver="2.0.3" src="jquery/jquery-2.0.3.min.js"></script>
    <script src="AngularJS v1.2.5/angular.min.js"></script>
    <script src="AngularJS v1.2.5/angular-route.min.js"></script>
    <script src="AppJS/script.js"></script>
    <script src="AppJS/app-signup.js"></script>
    <script src="jQuery1.11.1/jquery.min.js"></script>
    <script src="Bootstrap3.2.0/bootstrap.min.js"></script>
    <script src="BootstrapJS/ui-bootstrap-tpls.min.js"></script>
</body>
</html>