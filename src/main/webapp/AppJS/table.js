var app = angular.module("testApp", []);

app.controller('CostItemsCtrl', [ '$scope', function($scope) {
	  // the items you are managing - filled with one item just as an example of data involved
	  $scope.items = [ { assets: '', type: '', amount: '', 'calculation_type': '', total: ''} ];
	  // also drive options from here
	  $scope.assetTypes = [ 'Rent', 'Mortgage' ];
	  $scope.calcTypes = [ 'Daily', 'Monthly', 'Yearly' ];

	  // expose a function to add new (blank) rows to the model/table
	  $scope.addRow = function() { 
	    // push a new object with some defaults
	    $scope.items.push({ type: $scope.assetTypes[0], calculation_type: $scope.calcTypes[0] }); 
	  };

	  // save all the rows (alternatively make a function to save each row by itself)
	  $scope.save = function() {
	    // your $scope.items now contain the current working values for every field shown and can be parse, submitted over http, anything else you want to do with an array (like pass them to a service responsible for persistance)
	    if ($scope.CostItemsForm.$valid) { console.log("it's valid"); }
	  };
}]);