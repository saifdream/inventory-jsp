package com.example.customersOnSale;

import java.sql.Connection;
import java.sql.Statement;

import com.example.postgresDBConnection.DBConnection;

public class SalesLine extends Sales {
	private int line_id;
	private String productid;
	private int oldqty;
	private int qty;
	private int newqty;
	private float amount;
	
	public SalesLine() {}
	
	public String getProductid() {
		return productid;
	}
	public void setProductid(String productid) {
		this.productid = productid;
	}
	public int getLine_id() {
		return line_id;
	}
	public void setLine_id(int line_id) {
		this.line_id = line_id;
	}
	public int getOldqty() {
		return oldqty;
	}
	public void setOldqty(int oldqty) {
		this.oldqty = oldqty;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getNewqty() {
		return newqty;
	}

	public void setNewqty(int newqty) {
		this.newqty = newqty;
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
		    String sql = "insert into sales_line(order_id, line_id, product_id, qty, amount)" + 
			"VALUES ('"+getOrder_id()+"', '"+getLine_id()+"', '"+getProductid()+"', '"+getQty()+"', '"+getAmount()+"')";
		    stmt.executeUpdate(sql);
		    
		    String sql1 = "UPDATE products set qty = (qty - '"+getQty()+"') where product_id='"+getProductid()+"';";
	    	stmt.executeUpdate(sql1);
	    	
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
		    String sql = "Update sales_line set line_id = '" +getLine_id()+"', product_id = '" +getProductid()+"', qty = '" +getQty()+"'"
		    		+ ", amount = '" +getAmount()+"' where order_id = '" +getOrder_id()+"' AND line_id = '" +getLine_id()+"';";
		    stmt.executeUpdate(sql);
		    
		    if(getOldqty() > getQty()){
		    	setNewqty(getOldqty() - getQty());		    	
		    	String sql1 = "UPDATE products set qty = (qty + '"+getNewqty()+"') where product_id='"+getProductid()+"';";
		    	stmt.executeUpdate(sql1);
		    	}
		    else if(getOldqty() < getQty()){
		    	setNewqty(getQty() - getOldqty());		    	
			    String sql1 = "UPDATE products set qty = (qty - '"+getNewqty()+"') where product_id='"+getProductid()+"';";
			    stmt.executeUpdate(sql1);
			    }
		    else{
		    	String sql1 = "UPDATE products set qty = (qty + '0') where product_id='"+getProductid()+"';";
		    	stmt.executeUpdate(sql1);
		    }
		    		
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				}
	}
	
	public void DeleteItem(){
		Connection connection = null;
		Statement stmt = null;
		try {
			connection = DBConnection.getConnection();
			stmt = connection.createStatement();
			stmt = connection.createStatement();
		    String sql = "DELETE from sales_line where order_id='" +getOrder_id()+"';";
		    stmt.executeUpdate(sql);
		    
			String sql1 = "UPDATE products set qty = (qty + '"+getQty()+"') where product_id='"+getProductid()+"';";
			stmt.executeUpdate(sql1);
		    
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				}
	}
}
