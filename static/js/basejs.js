$(function () {
    var $person = $(".personspan,.personal");
    $person.mouseenter(function () {
        $(".personal").css("display", "block");
    });
    $person.mouseleave(function () {
        $(".personal").css("display", "none");
    });

    //跳转主页
    $("#indexJs").click(function () {
        window.location = "/";
    });

    //跳珠二手书籍列表页
    $("#bookJs").click(function () {
        window.location = "/goods/books/list";
    });

    //跳转二手机动类列表页
    $("#toolJs").click(function () {
        window.location = "/goods/tools/list";
    });

    //跳转二手电子产品列表页
    $("#eleproductJs").click(function () {
        window.location = "/goods/eleproducts/list";
    });

    //跳转其他二手列表页
    $("#otherJs").click(function () {
        window.location = "/goods/others/list";
    });

    //跳转学校商店列表页
    $("#schoolShop").click(function () {
        window.location.href = "schoolshop_list.html";
    });

    //跳转发布信息页面
    $("#jsRelease").click(function () {
        window.location = "/operation/pubinfo";
    });

    // 跳转搜索商品列表页
    $("#jsSearchBtn").click(function () {
        var name = $("#goodsname").val();
        window.location = "/operation/search/" + name;
    });

    //跳转到个人中心
    $("#jsPersonal").click(function () {
        window.location = "/users/personal";
    });
    // $(this).addClass("active").siblings().removeClass("active");

    //退出
    $("#jsLogoutBtn").click(function () {
        window.location = "/logout";
    });
});