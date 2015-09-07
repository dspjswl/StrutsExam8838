<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>客户登录界面</title>
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/index.css" rel="stylesheet" type="text/css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function showeditdialog() {   //通过JS调用模态框
            $("#mymodal").modal({backdrop:'static'},"show");
        });
    </script>
</head>
<body>
<div style="margin-left: 20px;">
    <h1 style="position: absolute;font-family: '黑体'">8838林宇恒</h1>
</div>
<div id="backimg">
    <img src="image/background.jpg" alt="" style="width: 100%;height: auto;">
</div>
<div class="modal  bs-example-modal-md" role="dialog" id="mymodal"  style="margin-top: 100px">   <%--登录窗口--%>
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                电影租赁管理系统
            </div>

            <div class="modal-body">    <%--登录窗口模块--%>
                <form role="form" class="form-horizontal " action="login_login.do">
                    <div class="form-group">
                        <div class="col-md-8 has-feedback col-md-offset-2">
                            <input name="username" type="text" placeholder="用户名" class="form-control">
                            <span class="glyphicon glyphicon-user form-control-feedback"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-8 has-feedback col-md-offset-2">
                            <input name="password" type="password" placeholder="密码" class="form-control">
                            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                        </div>
                    </div>
                    <%--<div class="col-md-4 has-feedback col-md-offset-2">--%>
                        <button class="btn btn-primary" type="submit" style="margin-left: 90px;margin-bottom: 10px;">登陆</button>
                    <%--</div>--%>
                </form>
            </div>
            <%--<div id="loginmodal_btn" class="modal-footer">
                >
            </div>--%>
        </div>
    </div>
</div>

</body>
</html>