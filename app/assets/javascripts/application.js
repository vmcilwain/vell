// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery.remotipart
//= require turbolinks
//= require_tree .

$(function(){
  $(".jqte-textarea").jqte({placeholder: "Please, write your post"});
  
  $('.search_form').hide();
  
  $('.search_form_link').click(function(){
    $('.search_form').slideDown('slow');
    $('.search_form_link').fadeOut('slow');
  });
  
  $('.cancel_search_form_link').click(function(){
    $('.search_form').slideUp('slow');
    $('.search_form_link').fadeIn('slow');
  });
  
  $('.alert-success').fadeOut(FADE_OUT_TIME);
})
