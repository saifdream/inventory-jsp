(function( ng, app ){
	"use strict";
	app.controller('reset', function($scope) {
		$scope.resetAll = function() {
		    $scope.$broadcast('show-errors-reset');
		    $scope.user = {counterno: '', username: '', password: ''};
		  };
	});
})( angular, module );

(function( ng, app ){
	"use strict";
	app.controller('NewUserController', function($scope) {
		  $scope.save = function() {
		    $scope.$broadcast('show-errors-check-validity');
		    alert('Confirm saved ?');
		    if ($scope.userForm.$valid) {
		    	$scope.submit();
		    	alert('User saved');
		      $scope.reset();
		    };
		  };
		  
		  $scope.submit = function() {
					$.ajax(
					{
					   	type: "post",
					   	url: "adduser.jsp",
					   	data: {
					   		username: $('input[name=username]').val(), 
					   		fullname: $('input[name=fullname]').val(),
					   		phone: $('input[name=username]').val(), 
					   		email: $('input[name=fullname]').val(),
					   		password: $('input[name=username]').val(), 
					   		position: $('input[name=fullname]').val(),
					   		address: $('input[name=username]').val(),
				   	},
				   	success: function(data, textStatus, jqXHR) {
				    	  alert('User saved. You are waiting for customer response.');
				        window.location.replace('./confirm.html');
				      },
				      error: function(jqXHR, textStatus, errorThrown) {
				        if(jqXHR.status == 400) {
				          var messages = JSON.parse(jqXHR.responseText);
				          $('#messages').empty();
				          $.each(messages, function(i, v) {
				            var item = $('<li>').append(v);
				            $('#messages').append(item);
				          });
				        } else {
				          alert('Unexpected server error.');
				        }
				      }
					    }
				  );
		  };  
		  $scope.reset = function() {
		    $scope.$broadcast('show-errors-reset');
		    $scope.user = {username: '', name: '', phone: '', email: '', password: '', password_c: '', position:'' };
		  };
		});

})( angular, module );