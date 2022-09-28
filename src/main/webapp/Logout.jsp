<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*, com.example.postgresDBConnection.*,java.security.*, org.apache.commons.codec.digest.DigestUtils, com.example.shopperson.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
</head>
<body>
<%
try{
	if(session.getAttribute("users") == null || session.getAttribute("logintime") == null){
	    response.sendRedirect("Login.jsp");
	}else{
		String user = (String) session.getAttribute("users");
		String time = (String) session.getAttribute("logintime");

	java.sql.Timestamp login = java.sql.Timestamp.valueOf(time);
	
	java.util.Date javaDate = new java.util.Date();
	long javaT = javaDate.getTime();
	java.sql.Timestamp logout = new java.sql.Timestamp(javaT);
	
	Connection connection = null;
	connection = DBConnection.getConnection();
	PreparedStatement statement = connection.prepareStatement("UPDATE activity_log set logout_time = ? where user_name = ? AND login_time = ?;");
	statement.setTimestamp(1,logout);
	statement.setString(2,user);
	statement.setTimestamp(3,login);
	statement.executeUpdate();
	//System.out.println("Logout update success !");
	}
}catch(Exception e){
	System.out.println(e);
	RequestDispatcher rd = request.getRequestDispatcher("/Login.jsp");
    rd.include(request, response);
	}

Cookie[] cookies = request.getCookies();
if(cookies != null){
for(Cookie cookie : cookies){
    if(cookie.getName().equals("JSESSIONID")){
        break;
    }
}
}
//invalidate the session if exists
if(session != null){
    session.invalidate();
}else
response.sendRedirect("Login.jsp");
%>
<nav class="navbar navbar-inverse">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>                        
          </button>
          <a class="navbar-brand" href="Login.jsp">Inventory Management System</a>
        </div>
      </div>
    </nav><br/><br/>
    <div align="center">
		You have logged out. Please
		<a href="Login.jsp"><b>Login</b></a>
	</div>
</body>
</html>