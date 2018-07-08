$(function () {
    $(".showImg").mouseenter(function () {
        $(this).children(".hiddenImg").css("display","block")
            .parent().siblings(".showImg")
            .children(".hiddenImg").css("display","none");
    });
    $(".showImg").mouseleave(function () {
        $(".hiddenImg").css("display","none");
    });
});