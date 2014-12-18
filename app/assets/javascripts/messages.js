function scrollToBottomOfMessages(){
  $('#messages_box').animate({ scrollTop: $('#messages_box').prop('scrollHeight') }, 'slow');
}

function randomNumGen(lower, upper){
  return Math.floor(lower + (upper-lower) * Math.random())
}

function screenTextAnimation(content){
  var top = randomNumGen(15, 40) + '%';
  var duration = randomNumGen(6500, 8500);
  var font_size = randomNumGen(14, 24) + 'px';

  var element = '<div class="screen_text not_done" style="font-size: '+font_size+'">'+content+'</div>';

  $('#screen_texts').append($(element));

  $('.screen_text.not_done').show().css({ top: top });

  $('.screen_text.not_done').animate({
      left:'5%', top: top
    },
    {
      duration: duration,
      complete: function(){
        $('.screen_text').removeClass("not_done")
      }
    }).fadeOut('slow');
}

$(document).ready(function(){
  scrollToBottomOfMessages();
});