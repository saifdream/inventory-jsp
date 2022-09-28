<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:8080/Project_1/Appcss/bootstrap.min.css" />
  <style>
	th {
	        border: 0px outset silver;
	        background-color: maroon;
	        color: white;
	      }
  </style>
</head>
<body>
<h4>Apply CRUD Operations in Dynamic Grid Using AngularJS</h4>
<div ng-app="" ng-controller="x" align="center">

            <label>Product ID</label>

            <input type="text" name="ProductID" ng-model="newSales.ProductID"/>

            <label>Product Name</label>

            <input type="text" name="ProductName" ng-model="newSales.ProductName"/>

            <label>Description</label>

            <input type="text" name="Description" ng-model="newSales.Description"/>
            
            <label>Quantity</label>
            
            <input type="text" name="Qty" ng-model="newSales.Qty"/>

            <label>Price</label>

            <input type="text" name="Price" ng-model="newSales.Price"/>
            
            <label>Amount</label>

            <input type="text" name="Amount" ng-model="newSales.Amount"/>

            <br/>

            <input type="hidden" ng-model="newSales.id" />

            <input type="button" value="Save" ng-click="saveRecord()" class="btn btn-success"/>

            <br />

            <br />

            <table class="gridStyle" border="1" bordercolor="black" style="padding:5px; border-spacing:30px;" id="tableId">

                <tr style="color:black" align="center">

                    <th style="width:100px" align="center">Product ID</th>

                    <th style="width:150px" align="center">Product Name</th>

                    <th style="width:150px" align="center">Description</th>
                    
                    <th style="width:150px" align="center">Quantity</th>

                    <th style="width:150px" align="center">Price Per Product</th>
                    
                    <th style="width:150px" align="center">Amount</th>

                    <th>Action</th>

                </tr>

                <tr style="color:black" ng-repeat="sale in sales">

                    <td>{{ sale.ProductID }}</td>
                    
                    <td>{{ sale.ProductName }}</td>

                    <td>{{ sale.Description }}</td>

                    <td>{{ sale.Qty }}</td>
                    
                    <td>{{ sale.Price }}</td>

                    <td>{{ sale.Amount }}</td>

                    <td>

                        <a  href="#" ng-click="edit(sale.id)">edit</a> | 

                        <a href="#" ng-click="delete1(sale.id)">delete</a>

                    </td>

                </tr>

            </table>

        </div>
<script src="http://localhost:8080/Project_1/AppJS/angular.min.js"></script>
<script src="http://localhost:8080/Project_1/AppJS/controller.js"></script>
</body>
</html>