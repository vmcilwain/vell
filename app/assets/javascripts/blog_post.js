$(function(){
  $('#new_blog_comment').hide();
  
  $('#add_blog_comment_link').click(function(){
    $('#new_blog_comment').show();
  });
  
  $('#blog_comment_cancel_link').click(function(){
    $('#new_blog_comment').hide();
    $('#blog_comment_name').val('');
    $('#blog_comment_body').val('');
  });
});