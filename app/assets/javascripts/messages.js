function scrollToBottomOfMessages(){
  $('#messages_box').animate({ scrollTop: $('#messages_box').prop('scrollHeight') }, 'slow');
}

function screenTextAnimation(content){
  var element = '<div class="screen_text not_done">'+content+'</div>'

  $('#screen_texts').append($(element));

  $('.screen_text.not_done').show().css({'left': '0px', 'top': '0px'});

  $('.screen_text.not_done').animate({
      left:'30%', top:'30%'
    },
    {
      duration: 5000,
      complete: function(){
        $('.screen_text').removeClass("not_done")
      }
    }
  ).fadeOut('slow');
}

$(document).ready(function(){
  scrollToBottomOfMessages();
});