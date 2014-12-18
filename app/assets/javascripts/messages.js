function scrollToBottomOfMessages(){
  $('#messages_box').animate({ scrollTop: $('#messages_box').prop("scrollHeight") }, 'slow');
}

$(document).ready(function(){
  scrollToBottomOfMessages();
});