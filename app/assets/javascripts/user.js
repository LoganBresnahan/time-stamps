$(document).ready(function(){
  $("input[id='user-username']").focus();
  var username = $("input[id='user-username']").val();
  $("input[id='user-username']").val('');
  $("input[id='user-username']").val(username);
})
