$(document).on "page:change", ->
  $('#comments-link').click (event) ->
    event.preventDefault()
    $('#comment-box').fadeToggle()
    $('#comment-name').focus()
