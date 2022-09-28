package com.example.customersOnSale;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import com.example.postgresDBConnection.DBConnection;

public class Customers {
	private int customer_id;
	private String name;
	private String address;
	private String phone;
	private String email;
	private Date first_date = new Date();
	private String customer_type;
	
	public Customers() {}
	
	public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public Date getFirst_date() {
		return first_date;
	}
	public void setFirst_date(Date first_date) {
		this.first_date = first_date;
	}
	public String getCustomer_type() {
		return customer_type;
	}
	public void setCustomer_type(String customer_type) {
		this.customer_type = customer_type;
	}
	
	public void addCustomer(){
		Connection connection = null;
		ResultSet rs = null;
		Statement stmt = null;
		try {
			connection = DBConnection.getConnection();
			stmt = connection.createStatement();
			String sql = "insert into customers(name, address, phone, email, first_date,customer_type)" + 
			//"VALUES ('"+getName()+"', '"+getAddress()+"', '"+getPhone()+"','"+getEmail()+"', '"+getFirst_date()+"')"+Statement.RETURN_GENERATED_KEYS;
			"VALUES ('"+getName()+"', '"+getAddress()+"', '"+getPhone()+"','"+getEmail()+"','"+getFirst_date()+"','"+getCustomer_type()+"')returning customer_id";
		    stmt.execute(sql);
		    rs = stmt.getResultSet();
		    //PreparedStatement pstmt = connection.prepareStatement(sql);
		    //rs = stmt.getGeneratedKeys();
		    //rs = stmt.executeQuery( "SELECT currval('customers_customer_id_seq')");
            if (rs.next()) {
            	setCustomer_id(rs.getInt(1));
            }
		    /*ResultSet rs = stmt.executeQuery( "SELECT currval('customers_customer_id_seq')");
		    if ( rs.next() ) {
		        // Retrieve the auto generated key(s).
		    	setCustomer_id(rs.getInt(1));
		    	System.out.println(getCustomer_id());
		    }
		    String sql1 = "SELECT currval('customers_customer_id_seq')";
		    stmt.executeUpdate(sql1);
		    ResultSet rs = stmt.executeQuery( "SELECT currval((pg_get_serial_sequence('customers','customer_id'))");
		    while ( rs.next() ) {
		    	setCustomer_id(rs.getInt("customer_id"));
		    	System.out.println(rs.getInt("customer_id"));
	        	 }*/
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				System.out.print("Customer Adding Problem");
				}
	}
	
	public void updateCustomer(){
		Connection connection = null;
		Statement stmt = null;
		try {
			connection = DBConnection.getConnection();
			stmt = connection.createStatement();
		    String sql = "Update customers set name = '" +getName()+"', address = '" +getAddress()+"', phone = '" +getPhone()+"'"
		    		+ ", email = '" +getEmail()+"', customer_type = '" +getCustomer_type()+"' where customer_id = '" +getCustomer_id()+"';";
		    stmt.executeUpdate(sql);
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				}
	}
	
	public void deleteCustomer(){
		Connection connection = null;
		Statement stmt = null;
		try {
			connection = DBConnection.getConnection();
			stmt = connection.createStatement();
			stmt = connection.createStatement();
		    String sql = "DELETE from customers where customer_id='" +getCustomer_id()+"';";
		    stmt.executeUpdate(sql);
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				}
	}
}
