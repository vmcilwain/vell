$(function(){
  $('#new_photo').hide();
  $('#cancel_photo_form').hide();
  
  $('#add_photo_form').click(function(){
    $('#new_photo').slideDown();
    $('#cancel_photo_form').show();
    $('#add_photo_form').hide();
  });
  
  $('#cancel_photo_form').click(function(){
    $("#new_photo").slideUp();
    $('#add_photo_form').show();
    $('#cancel_photo_form').hide();
  });
})