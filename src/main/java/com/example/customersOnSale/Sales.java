package com.example.customersOnSale;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import com.example.postgresDBConnection.DBConnection;

public class Sales extends Customers{
	private int order_id;
	private Date sales_date = new Date();
	private String payment_type;
	private float tax;
	private double total_amount;
	
	public Sales() {}
	
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public Date getSales_date() {
		return sales_date;
	}
	public void setSales_date() {
		this.sales_date = new Date();
	}
	public String getPayment_type() {
		return payment_type;
	}
	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
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
	
	public void addSale(){
		Connection connection = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			connection = DBConnection.getConnection();
			stmt = connection.createStatement();
		    String sql = "insert into sales(customer_id, sales_date, payment_type, tax, total_amount)" + 
			"VALUES ('"+getCustomer_id()+"','"+getSales_date()+"','"+getPayment_type()+"','"+getTax()+"','"+getTotal_amount()+"')returning order_id";
		    stmt.execute(sql);
		    rs = stmt.getResultSet();
		    //ResultSet rs = stmt.executeQuery( "SELECT currval('sales_order_id_seq')");
		    if ( rs.next() ) {
		        // Retrieve the auto generated key(s).
		    	setOrder_id(rs.getInt(1));
		    }
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				}
	}
	
	public void updateSale(){
		Connection connection = null;
		Statement stmt = null;
		try {
			connection = DBConnection.getConnection();
			stmt = connection.createStatement();
		    String sql = "Update sales set payment_type = '" +getPayment_type()+"', "
		    		+ "tax = '" +getTax()+"', total_amount = '" +getTotal_amount()+"' where customer_id = '" +getCustomer_id()+"'"
		    				+ "AND order_id = '" +getOrder_id()+"';";
		    stmt.executeUpdate(sql);
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				}
	}
	
	public void deleteSale(){
		Connection connection = null;
		Statement stmt = null;
		try {
			connection = DBConnection.getConnection();
			stmt = connection.createStatement();
			stmt = connection.createStatement();
		    String sql = "DELETE from sales where order_id='" +getOrder_id()+"' And customer_id ='"+getCustomer_id()+"';";
		    stmt.executeUpdate(sql);
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				}
	}
}
