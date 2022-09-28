package com.example.customersOnSale;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;
import java.sql.*;

import javax.servlet.*;

import com.example.postgresDBConnection.DBConnection;

/**
 * Servlet implementation class DataServlet
 */
@WebServlet("/DataServlet")

public class DataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@SuppressWarnings("unused")
	private ServletConfig config;
	//Setting JSP page
	String page="saletest.jsp";
	
	public void init(ServletConfig config) throws ServletException{
		this.config=config;
		}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		@SuppressWarnings("unused")
		PrintWriter out = response.getWriter();
		Connection connection=null;ResultSet rs;
		response.setContentType("text/html");
		@SuppressWarnings("rawtypes")
		List<Comparable> dataList=new ArrayList<Comparable>();
		try {
			connection = DBConnection.getConnection();
			//Select the data from the database
			String sql = "SELECT * FROM products";
			Statement s = connection.createStatement();
			s.executeQuery (sql);
			rs = s.getResultSet();
			while (rs.next ()){
				//Add records into data list
				dataList.add(rs.getString("product_name"));
				dataList.add(rs.getFloat("sales_price"));
				}
			rs.close ();
			s.close ();
			}catch(Exception e){
				System.out.println("Exception is ;"+e);
				}
		request.setAttribute("data",dataList);
		//Dispatching request
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		if (dispatcher != null){
			
			dispatcher.forward(request, response);
			}
		}
	}