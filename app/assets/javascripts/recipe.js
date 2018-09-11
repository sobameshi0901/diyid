$(function(){
  $('.affiTitle').hover( function() {
    $(this).find('.affiLink').show();
  }, function() {
    $(this).find('.affiLink').hide();
  });

  $('.amazonButton').each(function() {
      var elements = $(this);
      var count = 0;
      var defaultText = elements.text();
      elements.click(function() {
        if ( count === 0 ){
          elements.text('閉じる');
          $('.affiLink').show();
          count = 1;
        } else{
          elements.text(defaultText);
          $('.affiLink').hide();
          count = 0;
        }
      });
    });

  $('.recipeBoardButton').each(function() {
      var elements = $(this);
      var defaultText = elements.text();
      var count = 0;
      elements.click(function() {
        if ( count === 0 ){
          $('.posts').slideDown();
          elements.text('閉じる')
          count = 1;
        } else{
          elements.text(defaultText);
          $('.posts').slideUp();
          elements.text(defaultText)
          count = 0;
        }
      });
    });


})