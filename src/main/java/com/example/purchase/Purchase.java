package com.example.purchase;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import com.example.postgresDBConnection.DBConnection;

public class Purchase extends Supplier {
	private int order_id;
	private Date order_date = new Date();
	private Date delivery_date;
	private float tax;
	private double total_amount;
	
	public Purchase() { }
	
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date() {
		this.order_date = new Date();
	}
	public Date getDelivery_date() {
		return delivery_date;
	}
	public void setDelivery_date(Date delivery_date) {
		this.delivery_date = delivery_date;
	}
	public float getTax() {
		return tax;
	}
	public void setTax(float tax) {
		this.tax = tax;
	}
	public double getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(double total_amount) {
		this.total_amount = total_amount;
	}
	
	public void addPurchase(){
		Connection connection = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			connection = DBConnection.getConnection();
			stmt = connection.createStatement();
		    String sql = "insert into purchase(supplier_id, order_date, delivery_date, tax, total_amount)" + 
			"VALUES ('"+getSupplier_id()+"','"+getOrder_date()+"','"+getDelivery_date()+"','"+getTax()+"','"+getTotal_amount()+"')returning order_id";
		    stmt.execute(sql);
		    rs = stmt.getResultSet();
		    if ( rs.next() ) {
		    	setOrder_id(rs.getInt(1));
		    }
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				}
	}
	
	public void updatePurchase(){
		Connection connection = null;
		Statement stmt = null;
		try {
			connection = DBConnection.getConnection();
			stmt = connection.createStatement();
		    String sql = "Update purchase set delivery_date = '" +getDelivery_date()+"', tax = '" +getTax()+"', "
		    		+ "total_amount = '" +getTotal_amount()+"' "
		    		+ "where supplier_id = '" +getSupplier_id()+"' AND order_id = '" +getOrder_id()+"';";
		    stmt.executeUpdate(sql);
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				}
	}
	
	public void deletePurchase(){
		Connection connection = null;
		Statement stmt = null;
		try {
			connection = DBConnection.getConnection();
			stmt = connection.createStatement();
			stmt = connection.createStatement();
		    String sql = "DELETE from purchase where order_id='" +getOrder_id()+"';";
		    stmt.executeUpdate(sql);
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				}
	}
}
