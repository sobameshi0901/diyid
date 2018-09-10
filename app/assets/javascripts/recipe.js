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

  // $('.amazonButton').on('click', function(){
  //   $('.affiLink').show();
  //   $(this).addClass('closeButton')
  //   $(this).text('閉じる')
  // });

  // $('.recipe').on('click', '.closeButton', function() {
  //   $('.affiLink').hide();
  //   $(this).removeClass('closeButton')
  //   $(this).text('Amazonで購入する')
  //   console.log('閉じたった')
  // });
})