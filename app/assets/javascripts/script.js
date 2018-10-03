$(document).on('turbolinks:load',function() {
  $('.bigThumRecipes').slick({
    infinite: true,
    slidesToShow: 4,
    centerMode: true, //要素を中央寄せ
    centerPadding:'50px', //両サイドの見えている部分のサイズ
    autoplay:true, //自動再生
    autoplaySpeed : 2000,
    dots: true,
  })
});