$(function() {
  $(".tabLabel").on("click",function(){
    var $th = $(this).index();
    $(".tabLabel").removeClass("active");
    $(".tabPanel").removeClass("active");
    $(this).addClass("active");
    $(".tabPanel").eq($th).addClass("active");
  });
});
