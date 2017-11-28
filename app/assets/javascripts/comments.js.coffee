$(document).on "page:change", ->
  $('#blog_comment_cancel_link').click ->
      $('.comment_name').val('')
      $('.comment_body').val('')
      $('.comment_email').val('')