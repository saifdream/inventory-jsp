package com.example.shopperson;

import java.sql.Connection;
import java.sql.Date;
import java.sql.Statement;

import com.example.postgresDBConnection.*;

public class ShopPerson {
	private Integer userid;
	private Integer roleid;
	private String username;
	private String password;
	private String fullname;
	private String address;
	private String position;
	private String phone;
	private String email;
	private Date userfrom;
	private String role;
	private boolean enabled = true;
	public ShopPerson() {}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getRoleid() {
		return roleid;
	}
	public void setRoleid(Integer roleid) {
		this.roleid = roleid;
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
	public void setUserfrom(Date userfrom) {
		this.userfrom = userfrom;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	
	public void addUser(){
		Connection connection = null;
		Statement stmt = null;
		try {
			connection = DBConnection.getConnection();
			stmt = connection.createStatement();
		    String sql1 = "insert into users(user_name, password, enabled)" + 
			"VALUES ('"+username+"', '"+password+"', '"+enabled+"')";
		    stmt.executeUpdate(sql1);
		    
			stmt = connection.createStatement();
		    String sql2 = "insert into user_role(user_name, role)" + 
			"VALUES ('"+username+"', '"+role+"')";
		    stmt.executeUpdate(sql2);
		    
			stmt = connection.createStatement();
		    String sql3 = "INSERT INTO user_info (user_name, fullname, address, position, phone, email, user_from)" + 
			"VALUES ('"+username+"', '"+fullname+"', '"+address+"','"+position+"','"+phone+"','"+email+"','"+userfrom+"')";
		    stmt.executeUpdate(sql3);
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				}
	}
	
	public void deleteUser(){
		Connection connection = null;
		Statement stmt = null;
		try {
			connection = DBConnection.getConnection();
			stmt = connection.createStatement();
			
			String sql2 = "DELETE from user_role where user_name='" +getUsername()+"';";
		    stmt.executeUpdate(sql2);
		    connection.commit();
		    
			String sql3 = "DELETE from user_info where user_name='" +getUsername()+"';";
		    stmt.executeUpdate(sql3);
		    connection.commit();
		    
		    String sql1 = "DELETE from users where user_name='" +getUsername()+"';";
		    stmt.executeUpdate(sql1);
		    connection.commit();
		    
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				}
	}
	
	public void updateUser(){
		Connection connection = null;
		Statement stmt = null;
		try {
			connection = DBConnection.getConnection();
			stmt = connection.createStatement();
		    String sql = "UPDATE user_info set fullname = '"+getFullname()+"', "
		    		+ "address = '"+getAddress()+"', position = '"+getPosition()+"', "
		    				+ "phone = '"+getPhone()+"', email = '"+getEmail()+"';";
		    stmt.executeUpdate(sql);
		    connection.commit();
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				}
	}

}
