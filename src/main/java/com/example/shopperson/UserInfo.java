package com.example.shopperson;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;

import com.example.postgresDBConnection.DBConnection;

public class UserInfo {
	private int user_id;
	private String user_name;
	private String fullname;
	private String address;
	private String position;
	private String phone;
	private String email;
	private Date userfrom = new Date();
	
	public UserInfo() { }
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getUserfrom() {
		return userfrom;
	}
	public void setUserfrom() {
		this.userfrom = new Date();
	}
	
	public void adduserinfo(){
		try{
			//DBConnection dbconnection = new DBConnection(); 
			Connection connection;
			connection = DBConnection.getConnection();
			
			PreparedStatement statement = connection.prepareStatement("INSERT INTO user_info (user_name, fullname, address, position, phone, email, user_from) VALUES (?,?,?,?,?,?,?)");
			statement.setString(1,getUser_name());
			statement.setString(2,getFullname());
			statement.setString(3,getAddress());
			statement.setString(4,getPosition());
			statement.setString(5,getPhone());
			statement.setString(6,getEmail());
			java.sql.Date sqlDate = new java.sql.Date(getUserfrom().getTime());
			statement.setDate(7,sqlDate);
			statement.executeUpdate();
			/*ResultSet result = statement.executeQuery();
			if (result.next()) {
				setUser_id(result.getInt(1));
            }*/
			}
			catch(Exception e){
			System.out.println(e);
			}
	}
	
	public int updateUserinfo(){
		Connection connection = null;
		int result = 0;
		//Statement stmt = null;
		connection = DBConnection.getConnection();
		try {
			PreparedStatement statement = connection.prepareStatement("UPDATE user_info set fullname = ?, address = ?, position = ?, phone = ?, email = ? where user_name = ?;");
			statement.setString(1,getFullname());
			statement.setString(2,getAddress());
			statement.setString(3,getPosition());
			statement.setString(4,getPhone());
			statement.setString(5,getEmail());
			statement.setString(6,getUser_name());
			result = statement.executeUpdate();
			//System.out.println("After : " + statement.toString());
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				}
		return result;
	}
	
	public int deleteUserinfo(){
		Connection connection = null;
		int result = 0;
		connection = DBConnection.getConnection();
		try {
			PreparedStatement statement = connection.prepareStatement("DELETE from user_info where user_name = ?;");
			statement.setString(1,getUser_name());
			result = statement.executeUpdate();
			//System.out.println("After : " + statement.toString());
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				}
		return result;
	}
}
