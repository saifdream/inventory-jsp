<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.example.postgresDBConnection.*, java.sql.*,java.util.Date,java.text.*, java.security.*,org.apache.commons.codec.digest.DigestUtils, com.example.shopperson.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add User here</title>
</head>
<body>
<%
		String users = null;
		if(session.getAttribute("users")==null || session.getAttribute("Admin")==null){
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
<%
	User user = new User();

	user.setUsername(request.getParameter("username"));
	user.setPassword(request.getParameter("password"));
	//String conpassword= request.getParameter("conpassword");
	boolean enabled = true;
	user.setUsername( DigestUtils.md5Hex( user.getUsername()));
	user.setPassword( DigestUtils.md5Hex( user.getPassword()));
	/*
	MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
	mdAlgorithm.update(password.getBytes());

	byte[] digest = mdAlgorithm.digest();
	StringBuffer hexString = new StringBuffer();

	for (int i = 0; i < digest.length; i++) {
		password = Integer.toHexString(0xFF & digest[i]);

	    if (password.length() < 2) {
	    	password = "0" + password;
	    }
	    hexString.append(password);
	}
	password = hexString.toString();
	*/
	String role = "user";
	
	String fullname= request.getParameter("fullname");
	String position= request.getParameter("position");
	String address= request.getParameter("address");
	String phone= request.getParameter("phone");
	String email= request.getParameter("email");
	Date userfrom = new Date();

	DBConnection dbconnection = new DBConnection(); 
	Connection connection = null;
	Statement stmt = null;
	try {
		connection = DBConnection.getConnection();
		
		stmt = connection.createStatement();
	    String sql1 = "insert into users(user_name, password, enabled) VALUES ('"+user.getUsername()+"', '"+user.getPassword()+"', '"+enabled+"')";
	    stmt.executeUpdate(sql1);
	    
		stmt = connection.createStatement();
	    String sql2 = "insert into user_role(user_name, role) VALUES ('"+user.getUsername()+"', '"+role+"')";
	    stmt.executeUpdate(sql2);
	    
		stmt = connection.createStatement();
	    String sql3 = "INSERT INTO user_info (user_name, fullname, address, position, phone, email, user_from)" + 
		"VALUES ('"+user.getUsername()+"', '"+fullname+"', '"+address+"','"+position+"','"+phone+"','"+email+"','"+userfrom+"')";
	    stmt.executeUpdate(sql3);
	} catch (Exception e) {
			e.printStackTrace();
			System.err.println(e.getClass().getName()+": "+e.getMessage());
			}
	response.sendRedirect("http://localhost:8080/Project_1/Login.jsp");
%>
</body>
</html>