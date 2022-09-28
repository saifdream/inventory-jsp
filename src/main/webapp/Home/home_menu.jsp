<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<nav class="navbar navbar-inverse">
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
            <li class="active"><a href="#"><span class="glyphicon glyphicon-home"></span>&nbsp;Home</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li class="dropdown pull-right">
		    	<a href="#" data-toggle="dropdown" class="dropdown-toggle"><b class="glyphicon glyphicon-chevron-down"></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
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
    <h3 style="color:#222222;font-family:Times New Roman;" align="center">Inventory Management System 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </h3><hr><br>
    <div class="container">
      <div class="row">
      <div class="col-md-3"> </div>
        <div class="col-md-5" align="center">
          <ul class="nav nav-pills nav-stacked">
            <li class="active"><a href="Sales/sales.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> Sales</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-tasks"></span> Product Information</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Purchase</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-user"></span>  Customers Information</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-user"></span>  Suppliers Information</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-credit-card"></span> Shop Cards</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-usd"></span> Inventory Report</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-lock"></span> Admin</a></li>
          </ul>
        </div>
        <div class="clearfix visible-lg"></div>
      </div>
    </div>
    <hr>
  <footer>
    <p align="center">Copyright by - saif-dream &copy; Inventory - 2014
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
  </footer>