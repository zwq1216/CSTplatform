
function retconfirm()
{
    if(confirm('你确定要发布吗？')){
        return true;
    }else{
        return false;
    }
}

function filesup(a, s, p) {
    //获取图片信息
    var ofile = document.getElementById(s).files[0];
    //上传图片格式判定
    var rfile = /^(image\/jpeg|image\/png|image\/jpg)$/i;
    if (!rfile.test(ofile.type)) {
        if(a === 1) {
            document.getElementById("imgresult1").innerHTML = "上传格式不支持请修改否则不会发布该商品信息";
        } else if(a === 2) {
            document.getElementById("imgresult2").innerHTML = "上传格式不支持请修改否则不会发布该商品信息";
        }
        else if(a === 3) {
            document.getElementById("imgresult3").innerHTML = "上传格式不支持请修改否则不会发布该商品信息";
        }
        else if(a === 4) {
            document.getElementById("imgresult4").innerHTML = "上传格式不支持请修改否则不会发布该商品信息";
        }
        return 0;
    }
    var oReader = new FileReader();
    oReader.readAsDataURL(ofile);
    oReader.onload = function(e) {
        var imgInfo = document.getElementById(p);
        imgInfo.innerHTML = '<img src="' + this.result + '" alt="图片" />';
    };

}
