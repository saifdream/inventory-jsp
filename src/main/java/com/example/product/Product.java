package com.example.product;

import java.sql.Connection;
import java.sql.Statement;
import java.util.Date;

import com.example.postgresDBConnection.*;

public class Product {
	private String productid = "";
	private String productname = "";
	private String description = "";
	private String brand = "";
	private float pur$price = 0;
	private  float salse$price = 0;
	private int quantity = 0;
	private Date entry = new Date();
	private  Boolean available = false;
	
	public Product() {}
	
	public String getProductid() {
		return productid;
	}
	public void setProductid(String productid) {
		this.productid = productid;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public float getPur$price() {
		return pur$price;
	}
	public void setPur$price(float pur$price) {
		this.pur$price = pur$price;
	}
	public float getSalse$price() {
		return salse$price;
	}
	public void setSalse$price(float salse$price) {
		this.salse$price = salse$price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Date getEntry() {
		return entry;
	}
	public Boolean getAvailable() {
		return available;
	}
	public void setAvailable(Boolean available) {
		this.available = available;
	}
	
	public void addProduct(){
		Connection connection = null;
		Statement stmt = null;
		try {
			connection = DBConnection.getConnection();
			stmt = connection.createStatement();
		    String sql = "INSERT INTO products (product_id, product_name, decription, brand, "
		    		+ "purchase_price, sales_price, qty, enrty, available)" + 
			"VALUES ('"+getProductid()+"', '"+getProductname()+"', '"+getDescription()+"','"+getBrand()+"','"+
		    	getPur$price()+"','"+getSalse$price()+"','"+getQuantity()+"','"+entry+"','"+getAvailable()+"')";
		    stmt.executeUpdate(sql);
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				}
	}
	
	public void findProduct(){
		Connection connection = null;
		Statement stmt = null;
		try {
			connection = DBConnection.getConnection();
			stmt = connection.createStatement();
			stmt = connection.createStatement();
		    String sql = "SELECT * FROM products where product_id = '"+productid+"'";
		    stmt.executeUpdate(sql);
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				}
	}
	
	public void deleteProduct(){
		Connection connection = null;
		Statement stmt = null;
		try {
			connection = DBConnection.getConnection();
			stmt = connection.createStatement();
		    String sql = "DELETE from products where product_id='" +getProductid()+"';";
		    stmt.executeUpdate(sql);
		    connection.commit();
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				}
	}
	
	public void updateProduct(){
		Connection connection = null;
		Statement stmt = null;
		try {
			connection = DBConnection.getConnection();
			stmt = connection.createStatement();
		    String sql = "UPDATE products set product_name = '"+getProductname()+"', "
		    		+ "decription = '"+getDescription()+"', brand = '"+getBrand()+"', "
		    				+ "purchase_price = '"+getPur$price()+"', sales_price = '"+getSalse$price()+"', "
		    						+ "qty = '"+getQuantity()+"', enrty = '"+entry+"', "
		    								+ "available = '"+getAvailable()+"'"
		    								+ " where product_id='"+getProductid()+"';";
		    stmt.executeUpdate(sql);
		    connection.commit();
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				}
	}
}
