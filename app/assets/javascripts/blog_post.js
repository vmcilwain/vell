$(function(){
  // $('#new_blog_comment').hide();
  
  $('#add_blog_comment_link').click(function(){
    $('#new_blog_comment').show();
    $('#add_blog_comment_link').hide();
  });
  
  $('#blog_comment_cancel_link').click(function(){
    $('#new_blog_comment').hide();
    $('#blog_comment_name').val('');
    $('#blog_comment_body').val('');
    $('#add_blog_comment_link').show();
  });
});