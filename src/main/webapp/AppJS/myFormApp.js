var app = angular.module('myapp', ['UserValidation']);

myappCtrl = function($scope) {
	$scope.formAllGood = function () {
        return ($scope.usernameGood && $scope.passwordGood);
    };
};

myappCtrl2 = function($scope) {
	$scope.formAllGood = function () {
		return ($scope.usernameGood && $scope.passwordGood && $scope.passwordCGood);
    };
};

angular.module('myapp').controller('CollapseDemoCtrl', function ($scope) {
  $scope.isCollapsed = true;
});

angular.module('UserValidation', []).directive('validUsername', function () {
    return {
        require: 'ngModel',
        link: function (scope, elm, attrs, ctrl) {
            ctrl.$parsers.unshift(function (viewValue) {
                // Any way to read the results of a "required" angular validator here?
                var isBlank = viewValue === '';
                var invalidChars = !isBlank && !/^[A-z0-9]+$/.test(viewValue);
                var invalidLen = !isBlank && !invalidChars && (viewValue.length < 5 || viewValue.length > 20);
                ctrl.$setValidity('isBlank', !isBlank);
                ctrl.$setValidity('invalidChars', !invalidChars);
                ctrl.$setValidity('invalidLen', !invalidLen);
                scope.usernameGood = !isBlank && !invalidChars && !invalidLen;

            });
        }
    };
}).directive('validPassword', function () {
    return {
        require: 'ngModel',
        link: function (scope, elm, attrs, ctrl) {
            ctrl.$parsers.unshift(function (viewValue) {
                var isBlank = viewValue === '';
                var invalidLen = !isBlank && (viewValue.length < 8 || viewValue.length > 20);
                var isWeak = !isBlank && !invalidLen && !/(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z])/.test(viewValue);
                ctrl.$setValidity('isBlank', !isBlank);
                ctrl.$setValidity('isWeak', !isWeak);
                ctrl.$setValidity('invalidLen', !invalidLen);
                scope.passwordGood = !isBlank && !isWeak && !invalidLen;

            });
        }
    };
}).directive('validPasswordC', function () {
    return {
        require: 'ngModel',
        link: function (scope, elm, attrs, ctrl) {
            ctrl.$parsers.unshift(function (viewValue, $scope) {
                var isBlank = viewValue === '';
                var noMatch = viewValue != scope.signupform.password.$viewValue;
                ctrl.$setValidity('isBlank', !isBlank);
                ctrl.$setValidity('noMatch', !noMatch);
                scope.passwordCGood = !isBlank && !noMatch;
            });
        }
    };
});

angular.module('Validation', []).directive('valid', function () {
    return {
        require: 'ngModel',
        link: function (scope, elm, attrs, ctrl) {
            ctrl.$parsers.unshift(function (viewValue) {
                // Any way to read the results of a "required" angular validator here?
                var isBlank = viewValue === '';
                ctrl.$setValidity('isBlank', !isBlank);
                scope.usernameGood = !isBlank;

            });
        }
    };
    
});

var PositionController = function($scope) {

    $scope.activities =
    [
        "Owner",
        "Manager",
        "Accountant",
        "SalesPerson"
    ];       
};

app.config(['$routeProvider',
                  function($routeProvider) {
                    $routeProvider.when('/Login', {
                        templateUrl: 'Login/loginpage.jsp',
                        controller: ''
                    }).
                      when('/CreateNewAccount', {
                        templateUrl: 'Login/signuptest.jsp',
                        controller: ''
                    }).
                      when('/ForgetPassword', {
                        templateUrl: 'Login/forgetpassword.jsp',
                        controller: 'ForgetPasswordController'
                      }).
                      otherwise({
                        redirectTo: '/Login'
                      });
                }]);

app.controller('ForgetPasswordController', function($scope) {
	 
    $scope.message = 'Forget Password Page Under Construction...';
 
});