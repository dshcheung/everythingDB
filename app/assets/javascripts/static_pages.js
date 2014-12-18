var dimSumApp = angular.module('dimSumApp', []);

dimSumApp.controller('NameCtrl', function($scope, $http){
  $scope.names = ['harry', 'victor'];

  $scope.addName = function(){
    $scope.names.push($scope.enteredName);
    $scope.enteredName = '';
  };

  $scope.removeName = function(){

  };
});