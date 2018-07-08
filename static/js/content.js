$(function () {
    $(window).scroll(function () {
        if($(window).scrollTop() >= 200){
            $(".totop").fadeIn();
        }else{
            $(".totop").fadeOut();
        }
    });

    $(".totop").click(function () {
        $("html,body").animate({scrollTop:0}, 2000);
    });
});