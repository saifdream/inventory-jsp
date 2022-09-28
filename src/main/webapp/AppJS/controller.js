var saleid = 0;

        function x($scope) {
            $scope.sales = [{ id: 0,'ProductID': 'dfg','ProductName': 'dfgfdf','Description': 'dfgd','Qty': 'dsfg','Price': 'sdg','Amount': 'dfgsd'}];
            
            $scope.saveRecord = function () {
            	
                if ($scope.newSales.id == null) {

                    $scope.newSales.id = saleid++;

                    $scope.sales.push($scope.newSales);

                } else {
                	
                    for (i in $scope.sales) {

                        if ($scope.sales[i].id == $scope.newSales.id) {

                            $scope.sales[i] = $scope.newSales;
                        }
                    }
                }
                $scope.newSales = {};
            };

            $scope.delete1 = function (id) {

                for (i in $scope.sales) {

                    if ($scope.sales[i].id == id) {

                        $scope.sales.splice(i, 1);

                        $scope.newSales = {};
                    };
                };
            };
            $scope.edit = function (id) {

                for (i in $scope.sales) {

                    if ($scope.sales[i].id == id) {

                        $scope.newSales = angular.copy($scope.sales[i]);
                    }
                }
            };
        };