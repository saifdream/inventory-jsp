package com.example.purchase;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import com.example.postgresDBConnection.DBConnection;

public class Supplier {
	private int supplier_id;
	private String name;
	private String address;
	private String phone;
	private String email;
	private Date first_date = new Date();
	
	public Supplier() {}

	public int getSupplier_id() {
		return supplier_id;
	}

	public void setSupplier_id(int supplier_id) {
		this.supplier_id = supplier_id;
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
	
	public void addSupplier(){
		Connection connection = null;
		ResultSet rs = null;
		Statement stmt = null;
		try {
			connection = DBConnection.getConnection();
			stmt = connection.createStatement();
			String sql = "insert into suppliers(name, address, phone, email, first_date)" + 
			"VALUES ('"+getName()+"', '"+getAddress()+"', '"+getPhone()+"','"+getEmail()+"','"+getFirst_date()+"')returning supplier_id";
		    stmt.execute(sql);
		    rs = stmt.getResultSet();
            if (rs.next()) {
            	setSupplier_id(rs.getInt(1));
            }
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				System.out.print("Supplier Adding Problem");
				}
	}
	
	public void updateSupplier(){
		Connection connection = null;
		Statement stmt = null;
		try {
			connection = DBConnection.getConnection();
			stmt = connection.createStatement();
		    String sql = "Update suppliers set name = '" +getName()+"', address = '" +getAddress()+"', phone = '" +getPhone()+"' "
		    		+ ",email = '" +getEmail()+"' where supplier_id = '" +getSupplier_id()+"';";
		    stmt.executeUpdate(sql);
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				System.out.print("Supplier Updating Problem");
				}
	}
	
	public void deleteSupplier(){
		Connection connection = null;
		Statement stmt = null;
		try {
			connection = DBConnection.getConnection();
			stmt = connection.createStatement();
			stmt = connection.createStatement();
		    String sql = "DELETE from suppliers where supplier_id='" +getSupplier_id()+"';";
		    stmt.executeUpdate(sql);
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				System.out.print("Supplier Deleting Problem");
				}
	}
}
