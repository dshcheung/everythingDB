function scrollToBottomOfMessages(){
  $('#messages_box').animate({ scrollTop: $('#messages_box').prop("scrollHeight") }, 'slow');
}

function screenTextAnimation(content){
  console.log(content);
  $('#screen_text').text(content);
  
  $('#screen_text').show().css({'left': '0px', 'top': '0px'});
  $('#screen_text').animate({left:'30%', top:'30%'}).fadeOut();
}

$(document).ready(function(){
  scrollToBottomOfMessages();
});