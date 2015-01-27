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
