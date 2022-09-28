var confirmation = angular.module('confirmation', []);

confirmation.controller('confirmationController', function($scope, $window, $location,$filter, $log) {

  $scope.fname = 'Md Saiful';
  $scope.lname = 'Islam';
  $scope.username = 'saif89';
  $scope.date = '01-January-1989';
  $scope.jdate = '01-January-2015';
  $scope.password = '1111Aa';
  $scope.address = '56/1, Baitul View Trade, Purana Paltan, Dhaka - 1000, Bangladesh';
  $scope.email = 'saif89@gmail.com';
  $scope.contactno = '0555-8765';
  $scope.age = 28;
  $scope.gender = 'Male';
  $scope.usertype = ['Administrator'];
  $scope.comments = '';
  
  $scope.submitForm = function () {

      // Set the 'submitted' flag to true
      $scope.submitted = true;

      if ($scope.users.$valid) {
      	alert("User Successfully Created !");
      }
      else {
          alert("Please correct errors!");
      }
  };
  
  $scope.confirm = function () {
	  
	  alert("Sending Ok !");
  };

  $scope.usertypeList = [
                         { usertypeId: 0, Name: 'All' },
                         { usertypeId: 1, Name: 'Administrator' },
                         { usertypeId: 2, Name: 'Manager' },
                         { usertypeId: 3, Name: 'Accountant' },
                         { usertypeId: 4, Name: 'Executive' }
                         ];
  
});