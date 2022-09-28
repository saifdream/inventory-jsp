package com.example.customersOnSale;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import com.example.postgresDBConnection.DBConnection;

public class ShopCard extends Customers{
	private int card_number;
	private Date issue_date = new Date();
	private Date replace_date = new Date();
	
	public ShopCard() {}
	
	public int getCard_number() {
		return card_number;
	}
	public void setCard_number(int card_number) {
		this.card_number = card_number;
	}
	public Date getIssue_date() {
		return issue_date;
	}
	public void setIssue_date() {
		this.issue_date =  new Date();
	}
	public Date getReplace_date() {
		return replace_date;
	}
	public void setReplace_date(Date replace_date) {
		this.replace_date = replace_date;
	}
	
	public void addShopCard(){
		Connection connection = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			connection = DBConnection.getConnection();
			stmt = connection.createStatement();
		    String sql = "insert into shop_card(customer_id,  issue_date) VALUES ('"+getCustomer_id()+"', '"+getIssue_date()+"')returning card_number";
		    stmt.execute(sql);
		    rs = stmt.getResultSet();
		    if ( rs.next() ) {
		        // Retrieve the auto generated key(s).
		    	setCard_number(rs.getInt(1));
		    }
		    String sql1 = "Update customers set customer_type ='" +getCustomer_type()+"' where customer_id ='" +getCustomer_id()+"';";
		    stmt.executeUpdate(sql1);
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				}
	}
	
	public void updateShopCard(){
		Connection connection = null;
		Statement stmt = null;
		try {
			connection = DBConnection.getConnection();
			stmt = connection.createStatement();
		    String sql = "Update customers set customer_type ='" +getCustomer_type()+"' where customer_id ='" +getCustomer_id()+"';";
		    stmt.executeUpdate(sql);
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				}
	}
	
	public void replace_updateShopCard(){
		Connection connection = null;
		Statement stmt = null;
		try {
			connection = DBConnection.getConnection();
			stmt = connection.createStatement();
		    //String sql = "Update shop_card set customer_id = '"+getCustomer_id()+"' where customer_id = '"+getCustomer_id()+"';";
		    //stmt.executeUpdate(sql);
			String sql = "Update shop_card set replace_date = '" +getReplace_date()+"' where card_number = '"+getCard_number()+"';";
		    stmt.executeUpdate(sql);
		    
		    String sql1 = "Update customers set name = '" +getName()+"', phone = '" +getPhone()+"'"
		    		+ ", email = '" +getEmail()+"', customer_type = '" +getCustomer_type()+"' where customer_id = '" +getCustomer_id()+"';";
		    stmt.executeUpdate(sql1);
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				}
	}
	
	public void removeShopCard(){
		Connection connection = null;
		Statement stmt = null;
		try {
			connection = DBConnection.getConnection();
			stmt = connection.createStatement();
			stmt = connection.createStatement();
		    String sql = "DELETE from shop_card where card_number='" +getCard_number()+"';";
		    stmt.executeUpdate(sql);
		} catch (Exception e) {
				e.printStackTrace();
				System.err.println(e.getClass().getName()+": "+e.getMessage());
				}
	}
}
