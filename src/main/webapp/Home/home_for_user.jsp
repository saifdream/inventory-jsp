<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="saif-dream">
<title>Home &#45; Inventory Management System</title>
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <script type="text/javaScript" src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>

  <style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #424242;
      }
      .form-home {
        max-width: 500px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #031434;
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
</head>
<body>
		<%
		String users = null;
		//String username = (String) session.getAttribute("users");
		//String Manager = (String) session.getAttribute("Manager");
		//System.out.println(username +" "+" "+Manager);
		//if(session.getAttribute("Manager") == null){
			//response.sendRedirect("Login.jsp");
		//}
		if(session.getAttribute("users")==null || session.getAttribute("Manager")==null){
		    response.sendRedirect("Login.jsp");
		}else users = (String) session.getAttribute("users");
		String userName = null;
		String sessionID = null;
		
		Cookie[] cookies = request.getCookies();
		if(cookies !=null){
		for(Cookie cookie : cookies){
		    if(cookie.getName().equals("users")) userName = cookie.getValue();
		    if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
		}
		}
		%>
	<div class="container">
    	<form class="form-home" method="post">
    	<h3 style="color:#ffffff;font-family:Times New Roman;">Welcome To Inventory Management System</h3>
    	<hr>
    	<a href="Logout.jsp" class="btn btn-primary">Logout</a>
    	<a href="currentuser.jsp" class="btn btn-primary">Current User</a>
    	<br><br>
    	<a href="sale.jsp" class="btn btn-primary btn-lg btn-block">New Sale</a>
    	<a href="productlist.jsp" class="btn btn-primary btn-lg btn-block">Product List</a>
    	<a href="shopcardhome.jsp" class="btn btn-primary btn-lg btn-block">New Shop Card</a>
    	<a href="customerdetails.jsp" class="btn btn-primary btn-lg btn-block">Customers Details</a>
    	<a href="suppliersdetails.jsp" class="btn btn-primary btn-lg btn-block">Suppliers Details</a>
    	<a href="purchase.jsp" class="btn btn-primary btn-lg btn-block">Purchase Order</a>
    	<a href="producthome.jsp" class="btn btn-primary btn-lg btn-block">New Product Entry</a>
    	<a href="inventorysalesreport.jsp" class="btn btn-primary btn-lg btn-block">Inventory Report</a>
   </form>
   </div>
</body>
</html>