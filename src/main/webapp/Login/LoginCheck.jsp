<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*, com.example.postgresDBConnection.*,java.security.*, org.apache.commons.codec.digest.DigestUtils, com.example.shopperson.*"%>

<%	User user = new User();

	user.setUsername(request.getParameter("username"));
	user.setPassword(request.getParameter("password"));
	String Counterno = request.getParameter("counterno");
	
	java.util.Date javaDate = new java.util.Date();
    long javaTime = javaDate.getTime();
    java.sql.Timestamp logintime = new java.sql.Timestamp(javaTime);
	
	user.setUsername( DigestUtils.md5Hex( user.getUsername()));
	user.setPassword( DigestUtils.md5Hex( user.getPassword()));

	try{
		String role = "";
		DBConnection dbconnection = new DBConnection(); 
		Connection connection;
		connection = DBConnection.getConnection();
		PreparedStatement statement = connection.prepareStatement("select * from users where user_name = ? and password = ? and enabled = ?");
		statement.setString(1,user.getUsername());
		statement.setString(2,user.getPassword());
		statement.setBoolean(3,true);
		ResultSet result = statement.executeQuery();
		
		int count=0;
		while(result.next()){
		count++;
		}
		
		if(count>0){
			
			PreparedStatement statement1 = connection.prepareStatement("insert into activity_log (user_name, login_time, counter_no) VALUES (?,?,?)");
					statement1.setString(1,user.getUsername());
					statement1.setTimestamp(2,logintime);
					statement1.setString(3,Counterno);
					statement1.executeUpdate();
					session.setAttribute("logintime", logintime.toString());
			
			PreparedStatement statement2 = connection.prepareStatement("select role from user_role where user_name = ?");
					statement2.setString(1,user.getUsername());
					ResultSet result2 = statement2.executeQuery();
					if(result2.next()){
						role = result2.getString("role");
					}
					//System.out.println(role);
					if(role.equals("Admin")){
						session.setAttribute("users", user.getUsername());
						session.setAttribute("Admin", role);
				        //setting session to expiry in 30 mins
			            session.setMaxInactiveInterval(10*60);
				        
			            Cookie users = new Cookie("user", user.getUsername());
			            users.setMaxAge(10*60);
			            response.addCookie(users);
						response.sendRedirect("/Home/home.jsp");
					}
					else if(role.equals("Manager")){
						session.setAttribute("users", user.getUsername());
						session.setAttribute("Manager", role);
				        //setting session to expiry in 30 mins
			            session.setMaxInactiveInterval(10*60);
				        
			            Cookie users = new Cookie("users", user.getUsername());
			            users.setMaxAge(10*60);
			            response.addCookie(users);
						response.sendRedirect("/Home/home_for_user.jsp");
					}
					else{
						RequestDispatcher rd = getServletContext().getRequestDispatcher("/Login.jsp");
						out.println("<center><font color=red>You have no permission.</font></center>");
			            rd.include(request, response);
					}
		}
		else{
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/Login.jsp");
			out.println("<center><font color=red>Either user name or password is wrong.</font></center>");
            rd.include(request, response);
		}
		}
		catch(Exception e){
		System.out.println(e);
		RequestDispatcher rd = request.getRequestDispatcher("/Login.jsp");
		out.println("<center><font color=red>Either user name or password is wrong...</font></center>");
        rd.include(request, response);
		}
%>