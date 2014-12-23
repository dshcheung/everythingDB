$(document).ready(function(){

  var data;

  function graphChart(data){
    Highcharts.setOptions({
        global: {
            useUTC : false
        }
    });

    // Create the chart
    $('#priceChart').highcharts('StockChart', {
      chart: {
        backgroundColor: 'transparent'
      },

      rangeSelector: {
        buttons: [{
          count: 4,
          type: 'minute',
          text: '1M'
        }, {
          count: 20,
          type: 'minute',
          text: '5M'
        }, {
          type: 'all',
          text: 'All'
        }],
        inputEnabled: false,
        selected: 0
      },

      xAxis: {
        type: {
          millisecond: '%H:%M:%S.%L',
          second: '%H:%M:%S',
          minute: '%H:%M',
          hour: '%H:%M',
          day: '%e. %b',
          week: '%e. %b',
          month: '%b \'%y',
          year: '%Y'
        }
      },

      title: {
        text: 'Bitfinex Live Data'
      },

      exporting: {
        enabled: false
      },

      series: [{
        name: 'Bitfinex',
        data: data
      }]
    });
  }

  $.getJSON('/tickers.json', function(data){
    graphChart(data);
  })

});