$(document).ready(function(){
  $.getJSON('https://www.quandl.com/api/v1/datasets/BAVERAGE/BITFINEXUSD.json?auth_token=t5T8nLRsoMJYMnXzeASD', function (response) {

    // Create the chart
    var received_data = response.data.reverse();
    var parsed_data = [];

    received_data.forEach(function(item){
      var time = new Date(item[0]).getTime();
      var price = item[1];
      parsed_data.push([time, price]);

    });

    $('#priceChart').highcharts('StockChart', {
      chart: {
        backgroundColor: 'transparent',
        color: 'white'
      },
      rangeSelector : {
        selected: 1
      },
      title: {
        text: 'Bitcoin Price'
      },
      xAxis: {
        millisecond: '%H:%M:%S.%L',
        second: '%H:%M:%S',
        minute: '%H:%M',
        hour: '%H:%M',
        day: '%e. %b',
        week: '%e. %b',
        month: '%b \'%y',
        year: '%Y'
      },
      series: [{
        name: 'Bitcoin',
        data: parsed_data,
        tooltip: {
            valueDecimals: 2
        }
      }]
    });
  });
});