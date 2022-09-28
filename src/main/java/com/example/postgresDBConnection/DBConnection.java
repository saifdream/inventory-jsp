package com.example.postgresDBConnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	private static Connection connection = null;
	 public static Connection getConnection(){
		 if (connection != null)
	            return connection;
	     else {
	    	 try {
	    		 Class.forName("org.postgresql.Driver");
	    		 connection = DriverManager.getConnection("jdbc:postgresql://ec2-54-83-5-151.compute-1.amazonaws.com:5432/d5eenothnu9dig","hnkqkzupgixekr", "5cKabktnTp9DiJZ-KaYgt7fZ9X");
	    		 System.out.println("Opened database successfully");
	    		 } catch (Exception e) {
	    			 e.printStackTrace();
	    			 System.err.println(e.getClass().getName()+": "+e.getMessage());
	    			 }
	    	 return connection;
	    	 }
		 }
	 }
