$(document).on "page:change", ->
  # $('#comments-link').click (event) ->
  #   event.preventDefault()
  #   $('#comment-box').fadeToggle()
  #   $('#comment-name').focus()
  
  $('#blog_comment_cancel_link').click ->
      $('.comment_name').val('')
      $('.comment_body').val('')
      $('.comment_email').val('')