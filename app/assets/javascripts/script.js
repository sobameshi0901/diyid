$(function() {
  $('.bigRecipes').slick({
    infinite: true,
    slidesToShow: 2,
    centerMode: true, //要素を中央寄せ
    centerPadding:'50px', //両サイドの見えている部分のサイズ
    autoplay:true, //自動再生
    autoplaySpeed : 2200,
    dots: true,
  })
});