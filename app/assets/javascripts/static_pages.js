var dimSumApp = angular.module('dimSumApp', []);

dimSumApp.controller('NameCtrl', function($scope, $http){
  $scope.names = ['harry', 'victor'];

  // $scope.prices = [
  //   {'price': 360, 'time': '2014-12-10'},
  //   {'price': 350, 'time': '2014-12-11'},
  //   {'price': 340, 'time': '2014-12-12'}
  // ];

  $http.get('https://www.quandl.com/api/v1/datasets/BITCOIN/MTGOXUSD.json?auth_token=t5T8nLRsoMJYMnXzeASD').success(function(response){
    
    $scope.prices = [];
    priceData = response.data.reverse();

    for (index in priceData){
      $scope.prices.push([
        new Date(priceData[index][0]).getTime(), 
        priceData[index][1]
      ]);
    }

    console.log($scope.prices);

    plotChart();
  })

  function plotChart(){
    $('#priceChart').highcharts({
      title: {
        text: 'BTC',
        x: -20 //center
      },
      subtitle: {
        text: 'BTC',
        x: -20
      },
      xAxis: {
        type: 'datetime'
      },
      yAxis: {
        title: {
            text: 'Price ($ USD)'
        },
        plotLines: [{
          value: 0,
          width: 1,
          color: '#808080'
        }]
      },
      legend: {
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'middle',
        borderWidth: 0
      },
      series: [{
        name: 'Price',
        data: $scope.prices
      }]
    });
  }

  $scope.addName = function(){
    $scope.names.push($scope.enteredName);
    $scope.enteredName = '';
  };

  $scope.removeName = function(){

  };
});