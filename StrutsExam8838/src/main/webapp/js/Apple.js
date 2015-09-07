/**
 * Created by Administrator on 2015/8/23.
 */
function goto() {
    window.location.href = "http://www.baidu.com";
}
function isexit() {
    if (confirm("确定退出？")) {
    }

}
/*function showlogindialog(){   //通过JS调用模态框
 $("#mymodal").modal("show");
 }*/

$("#mytab a").click(function (e) {
    e.preventDefault();
    $(this).tab("show");
});
$("#user_a").hover(function (e) {                     /* 鼠标划过用户头像显示下拉菜单*/
    $("#user_ul").slideDown(500);
}, function (e) {                                      /* 鼠标离开用户头像隐藏下拉菜单*/
    $("#user_ul").hide();
});
$("#user_ul").hover(function (e) {                    /* 鼠标悬停在下拉菜单时保持显示*/
    $(this).show();
}, function (e) {                                      /* 鼠标离开下拉菜单时隐藏*/
    $(this).hide();
});
