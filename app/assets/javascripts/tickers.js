$('#priceChart').ready(function(){
  PrivatePub.subscribe("/tickers/new", function(data, channel) {
    // console.log(data);
    $('#priceChart').highcharts().series[0].addPoint([data.message.timestamp, data.message.last_price],true, true);
    $('#priceChart').highcharts().series[1].addPoint([data.message.timestamp, data.message.mid],true, true);
    $('#priceChart').highcharts().series[2].addPoint([data.message.timestamp, data.message.bid],true, true);
    $('#priceChart').highcharts().series[3].addPoint([data.message.timestamp, data.message.ask],true, true);
    
    $('#last_price').text(data.message.last_price);
    $('#mid_price').text(data.message.mid);
    $('#bid_price').text(data.message.bid);
    $('#ask_price').text(data.message.ask);
  });
})
