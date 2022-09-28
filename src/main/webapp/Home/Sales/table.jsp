<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body ng-app="testApp">
<form name="CostItemsForm" ng-controller="CostItemsCtrl">
<table>
<tr><th>Assets</th><th>Type</th><th>Amount</th><th>Calculation</th><th>Total</th></tr>
<tr><td colspan="5"><button ng-click="addRow()">Add Row</button></td></tr>
<tr ng-repeat="item in items">
  <td><input required ng-model="item.assets"></td>
  <td><select ng-model="item.type" ng-options="type for type in assetTypes"></select></td>
  <td><input required ng-model="item.amount"></td>
  <td><select ng-model="item.calculation_type" ng-options="type for type in calcTypes"></td>
  <td><input required ng-model="item.total"></td>
</tr>
<tr><td colspan="5"><button ng-click="save()">Save Data</button></tr>
</table>
</form>
    <script src="http://localhost:8080/Project_1/AppJS/angular.min.js"></script>
<script src="http://localhost:8080/Project_1/AppJS/table.js"></script>
</body>
</html>