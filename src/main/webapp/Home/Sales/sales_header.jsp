<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>                        
          </button>
          <a class="navbar-brand" href="#">Inventory Management System</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
          <ul class="nav navbar-nav">
            <li><a href="/Home/home.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp;Home</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;New Sales</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-save"></span>&nbsp;Save</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-edit"></span></span>&nbsp;Edit Sale</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;Existing Sale</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-print"></span>&nbsp;Invoice</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-search"></span>&nbsp;Find Customer</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-list"></span>&nbsp;Product list</a></li>
            <li><a class="btn btn-link" ng-click="resetAll()"><span class="glyphicon glyphicon-repeat"></span> Reset</a></li>
           </ul>
          <ul class="nav navbar-nav navbar-right">
			<li class="dropdown pull-right">
		    	<a href="#" data-toggle="dropdown" class="dropdown-toggle"><b class="glyphicon glyphicon-chevron-down"></b>
		    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
			  <ul class="dropdown-menu">
			    <li><a href="#"><span class="glyphicon glyphicon-user"></span> Current User</a></li>
			    <li class="divider"></li>
			    <li><a href="/Logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
	          </ul>
        	</li>
          </ul>
        </div>
      </div>
    </nav>
    <br><br>