package com.example.shopperson;

import java.sql.Connection;
import java.sql.PreparedStatement;
import org.apache.commons.codec.digest.DigestUtils;

import com.example.postgresDBConnection.DBConnection;

public class User {
	private String username;
	private String password;
	private boolean enabled;
	//private Set<UserRole> userRole = new HashSet<UserRole>(0);
	
	public User() { }
	
	public User(String username, String password, boolean enabled) {
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		//this.userRole = userRole;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	/* public Set<UserRole> getUserRole() {
		return userRole;
	}
	public void setUserRole(Set<UserRole> userRole) {
		this.userRole = userRole;
	} */
	
	public void useradd(){
		try{
			Connection connection;
			connection = DBConnection.getConnection();
			
			//System.out.println( getUsername());
			//System.out.println( getPassword());
			
			setUsername( DigestUtils.md5Hex( getUsername()));
			setPassword( DigestUtils.md5Hex( getPassword()));
			
			//System.out.println( getUsername());
			//System.out.println( getPassword());
			
			PreparedStatement statement = connection.prepareStatement("insert into users (user_name, password, enabled) VALUES (?,?,?)");
			statement.setString(1,getUsername());
			statement.setString(2,getPassword());
			statement.setBoolean(3,isEnabled());
			statement.executeUpdate();
			}
			catch(Exception e){
			System.out.println(e);
			}
	}
	
	public int updateUser(){
		Connection connection = null;
		int result = 0;
		//Statement stmt = null;
		//PreparedStatement st = null;
		connection = DBConnection.getConnection();
		try {
			PreparedStatement statement = connection.prepareStatement("UPDATE users set enabled = ? where user_name = ?;");
			statement.setBoolean(1,isEnabled());
			statement.setString(2,getUsername());
			result = statement.executeUpdate();
		    //System.out.println("After : " + statement.toString());
			/*
			System.out.println(isEnabled());
			stmt = connection.createStatement();
		    String sql = "UPDATE users set enabled = '"+isEnabled()+"'  where user_name = '"+getUsername()+"';";
		    int rowsAffected = stmt.executeUpdate(sql);
			if(rowsAffected > 0){
				//connection.commit();
				System.out.println("User update ok.");
			}else{
				System.out.println("Wrong.");
			}
		    */
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				}
		return result;
	}
	
	public int deleteUser(){
		Connection connection = null;
		int result = 0;
		connection = DBConnection.getConnection();
		try {
			PreparedStatement statement = connection.prepareStatement("DELETE from users where user_name=?;");
			statement.setString(1,getUsername());
			result = statement.executeUpdate();
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				}
		return result;
	}

}
