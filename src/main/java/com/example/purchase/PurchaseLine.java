package com.example.purchase;

import java.sql.Connection;
import java.sql.Statement;

import com.example.postgresDBConnection.DBConnection;

public class PurchaseLine extends Purchase{
	private int line_id;
	private String productid;
	private int qty;
	private float amount;

	public PurchaseLine() {}

	public int getLine_id() {
		return line_id;
	}

	public void setLine_id(int line_id) {
		this.line_id = line_id;
	}

	public String getProductid() {
		return productid;
	}

	public void setProductid(String productid) {
		this.productid = productid;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}
	
	public void addItem(){
		Connection connection = null;
		Statement stmt = null;
		try {
			connection = DBConnection.getConnection();
			stmt = connection.createStatement();
		    String sql = "insert into purchase_line (order_id, line_id, product_id, qty, amount)" + 
			"VALUES ('"+getOrder_id()+"', '"+getLine_id()+"', '"+getProductid()+"', '"+getQty()+"', '"+getAmount()+"')";
		    stmt.executeUpdate(sql);
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				}
	}
	
	public void updateItem(){
		Connection connection = null;
		Statement stmt = null;
		try {
			connection = DBConnection.getConnection();
			stmt = connection.createStatement();
		    String sql = "Update purchase_line set line_id = '" +getLine_id()+"', product_id = '" +getProductid()+"', qty = '" +getQty()+"'"
		    		+ ", amount = '" +getAmount()+"' where order_id = '" +getOrder_id()+"' AND line_id = '" +getLine_id()+"';";
		    stmt.executeUpdate(sql);
		    		
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				}
	}
	
	public void deleteItem(){
		Connection connection = null;
		Statement stmt = null;
		try {
			connection = DBConnection.getConnection();
			stmt = connection.createStatement();
			stmt = connection.createStatement();
		    String sql = "DELETE from purchase_line where order_id='" +getOrder_id()+"';";
		    stmt.executeUpdate(sql);
		    
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				}
	}
}
