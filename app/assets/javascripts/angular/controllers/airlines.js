app.controller('AirlineListCtrl', ['$scope', '$http', function($scope, $http){
  $http.get('api/v1/airlines.json').success(function(data) {
    $scope.airlines = data.airlines;
  });
}]);

app.controller('AirlineItemCtrl', ['$scope', '$http', '$routeParams', function($scope, $http, $routeParams){
  $http.get('api/v1/airlines/' + $routeParams.icao + '.json').success(function(data) {
    $scope.airline = data.airlines[0];
  });
}]);


app.controller('AirplaneListCtrl', ['$scope', '$http', '$routeParams', function($scope, $http){
  console.log('hello from AirplaneListCtrl');
  $http.get('api/v1/airplanes.json').success(function(data) {
    $scope.airplanes = data.airplanes;
  });
}]);

app.controller('AirplaneItemCtrl', ['$scope', '$http', '$routeParams', function($scope, $http, $routeParams){
  $http.get('api/v1/airplanes/' + $routeParams.registration_code + '.json').success(function(data) {
    $scope.airplane = data.airplanes[0];
  });
}]);
