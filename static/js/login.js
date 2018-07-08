$(function () {
    
    $('.captcha').css({
        'cursor': 'pointer'
    });
    // $('.captcha1 input').addClass("form-control");
    $('.captcha1 input').width(150);
    $('.captcha1 input').height(34);
    // 刷新验证码
    $(".captcha").click(function () {
        $.getJSON("/captcha/refresh/",
                  function(result){
             $('.captcha').attr('src', result['image_url']);
             $('#id_captcha_0').val(result['key'])
          });
    });


});