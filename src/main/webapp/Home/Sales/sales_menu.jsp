<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<div class="container">
	<br><br>
	<form name="newsale" action="" novalidate>
			<h4 style="color:#0b7f05;" align="center">New Sale Details</h4>
			<hr>
				<br>
				<table align="center">
					<tr>
						<td align="right">
							Bill To :
						</td>
						<td>
							<input type="text" name="BillTo" ng-model="sales.BillTo" class="form-control" placeholder="Bill To" required>
						</td>
						<td align="right">
							Payment Type :
						</td>
						<td>
							</select><select name="PaymentType" ng-model="sales.PaymentType" class="form-control" 
								data-ng-init="PaymentType=['Cash','VisaCard','MasterCard','Paypal','bKash']" 
								ng-options="type for type in PaymentType" required>
							</select>
							
						</td>
					</tr>
					<tr >
						<td align="right">
							E-mail :
						</td>
						<td>
							<input type="email" name="Email" ng-model="sales.Email" class="form-control" placeholder="E-mail" required>
						</td>
						<td align="right">
							Customer Type :
						</td>
						<td><!--  
							<select name="CustomerType" ng-model="sales.CustomerType" class="form-control" data-ng-init="CustomerType=['New','Regular','Weekend','Monthly','Sometimes']" required>
								<option></option>
								<option data-ng-repeat="x in CustomerType" value="{{ x }}">{{ x }}</option>
							</select>
							-->
							<select name="CustomerType" ng-model="sales.CustomerType" class="form-control" 
								data-ng-init="CustomerType=['New','Regular','Weekend','Monthly','Sometimes']" 
								ng-options="type for type in CustomerType" required>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right">
							Phone :
						</td>
						<td>
							<input type="text" name="Phone" ng-model="sales.Phone" class="form-control" placeholder="Phone" required>
						</td>
					</tr>
					<tr>
						<td align="right">
							Address :
						</td>
						<td align="right">
							<textarea rows="1" cols="45" name="Address" ng-model="sales.Address" class="form-control" placeholder="Address" required></textarea>
						</td>
					</tr>
			</table>
	</form>
</div>
<hr>
  <footer>
    <p align="center">Copyright by - saif-dream &copy; Inventory - 2014</p>
  </footer>