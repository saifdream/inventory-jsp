var module = angular.module('app', ['ngRoute']);

module.config(['$routeProvider',
               function($routeProvider) {
                   $routeProvider.
	                   when('/', {
	                       templateUrl: 'welcome.jsp',
	                       controller: 'RouteController'
	                   }).
                       when('/login', {
                           templateUrl: 'Login/loginpage.jsp',
                           controller: 'RouteController'
                       }).
                       when('/signup', {
                           templateUrl: 'Login/signup.jsp',
                           controller: 'RouteController'
                       }).
                       when('/forget', {
                           templateUrl: 'Login/forgetpassword.jsp',
                           controller: 'RouteController'
                       }).
                       when('/route4', {
                           templateUrl: '/Logout.jsp',
                           controller: 'RouteController'
                       }).
                       otherwise({
                           redirectTo: 'welcome.jsp'
                       });
               }]);

           module.controller("RouteController", function($scope) {
        	   $scope.message = 'Forget Password Page Under Construction...';
           });

module.directive('validUsername', function ($timeout) {
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
});

module.directive('validPassword', function () {
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
});
module.directive('validPasswordC', function () {
    return {
        require: 'ngModel',
        link: function (scope, elm, attrs, ctrl) {
            ctrl.$parsers.unshift(function (viewValue, $scope) {
                var isBlank = viewValue === '';
                var noMatch = viewValue != scope.userForm.password.$viewValue;
                ctrl.$setValidity('isBlank', !isBlank);
                ctrl.$setValidity('noMatch', !noMatch);
                scope.passwordCGood = !isBlank && !noMatch;
            });
        }
    };
});

module.directive('showErrors', function ($timeout, showErrorsConfig) {
    var getShowSuccess, linkFn;
    getShowSuccess = function (options) {
      var showSuccess;
      showSuccess = showErrorsConfig.showSuccess;
      if (options && options.showSuccess != null) {
        showSuccess = options.showSuccess;
      }
      return showSuccess;
    };
    linkFn = function (scope, el, attrs, formCtrl) {
      var blurred, inputEl, inputName, inputNgEl, options, showSuccess, toggleClasses;
      blurred = false;
      options = scope.$eval(attrs.showErrors);
      showSuccess = getShowSuccess(options);
      inputEl = el[0].querySelector('[name]');
      inputNgEl = angular.element(inputEl);
      inputName = inputNgEl.attr('name');
      if (!inputName) {
        throw 'show-errors element has no child input elements with a \'name\' attribute';
      }
      inputNgEl.bind('blur', function () {
        blurred = true;
        return toggleClasses(formCtrl[inputName].$invalid);
      });
      scope.$watch(function () {
        return formCtrl[inputName] && formCtrl[inputName].$invalid;
      }, function (invalid) {
        if (!blurred) {
          return;
        }
        return toggleClasses(invalid);
      });
      scope.$on('show-errors-check-validity', function () {
        return toggleClasses(formCtrl[inputName].$invalid);
      });
      scope.$on('show-errors-reset', function () {
        return $timeout(function () {
          el.removeClass('has-error');
          el.removeClass('has-success');
          return blurred = false;
        }, 0, false);
      });
      return toggleClasses = function (invalid) {
        el.toggleClass('has-error', invalid);
        if (showSuccess) {
          return el.toggleClass('has-success', !invalid);
        }
      };
    };
    return {
      restrict: 'A',
      require: '^form',
      compile: function (elem, attrs) {
        if (!elem.hasClass('form-group')) {
          throw 'show-errors element does not have the \'form-group\' class';
        }
        return linkFn;
      }
    };
  }
);

module.provider('showErrorsConfig', function () {
  //var _showSuccess;
  _showSuccess = false;
  this.showSuccess = function (showSuccess) {
    return _showSuccess = showSuccess;
  };
  this.$get = function () {
    return { showSuccess: _showSuccess };
  };
});
