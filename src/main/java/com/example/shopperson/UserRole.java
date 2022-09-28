package com.example.shopperson;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.example.postgresDBConnection.DBConnection;

public class UserRole {
	private int roleid;
	private String username;
	private User user;
	private String role;
	
	public UserRole() { }
	
	public int getRroleid() {
		return roleid;
	}
	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public void adduserrole(){
		try{
			//DBConnection dbconnection = new DBConnection(); 
			Connection connection;
			connection = DBConnection.getConnection();
			
			PreparedStatement statement = connection.prepareStatement("insert into user_role(user_name, role) VALUES (?,?)");
			statement.setString(1,getUsername());
			statement.setString(2,getRole());
			statement.executeUpdate();
			/* ResultSet result = statement.executeQuery();
			 if (result.next()) {
				setRoleid(result.getInt(1));
            } */
			}
			catch(Exception e){
			System.out.println(e);
			}
	}
	
	public int updateUserRole(){
		Connection connection = null;
		int result = 0;
		//Statement stmt = null;
		connection = DBConnection.getConnection();
		try {
			PreparedStatement statement = connection.prepareStatement("UPDATE user_role set role = ? where user_name = ?;");
			statement.setString(1,getRole());
			statement.setString(2,getUsername());
			result = statement.executeUpdate();
			//System.out.println("After : " + statement.toString());
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				}
		return result;
	}
	
	public int deleteUserRole(){
		Connection connection = null;
		int result = 0;
		connection = DBConnection.getConnection();
		try {
			PreparedStatement statement = connection.prepareStatement("DELETE from user_role where user_name = ?;");
			statement.setString(1,getUsername());
			result = statement.executeUpdate();
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				}
		return result;
	}
}
