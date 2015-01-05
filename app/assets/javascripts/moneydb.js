var moneyDb = angular.module('moneyDB', ['ng-polymer-elements']);

// moneyDb.controller('NameCtrl', function($scope, $http){
//   $scope.names = ['harry', 'victor'];

//   $scope.addName = function(){
//     $scope.names.push($scope.enteredName);
//     $scope.enteredName = '';
//   };

//   $scope.removeName = function(){

//   };
// });

moneyDb.controller('CompanyCtrl', function($scope, $http){
  // $scope.companies = ['harry', 'victor'];

  $http.get('companies.json').success(function(data) {
    $scope.companies = data;
  });
});