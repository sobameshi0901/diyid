$(document).on('turbolinks:load',function(){
  $('.categoryBlock').hover( function() {
    $(this).find('.smallCategory').slideDown();
  }, function() {
    $(this).find('.smallCategory').slideUp();
  });
})