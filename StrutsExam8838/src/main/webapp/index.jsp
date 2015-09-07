<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>电影租赁系统</title>
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/index.css" rel="stylesheet" type="text/css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/index.js"></script>
</head>
<body>

<%--导航条--%>
<nav class="navbar navbar-inverse" role="navigation" style="background-color: #31b0d5">
    <div style="margin-left: 50px;margin-right: 50px;">

        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#response-navbar-collapse">         <!--响应式导航栏-->
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp">
                <p style="font-size: xx-large;color:gray;margin: 10px auto;">8838林宇恒</p>
            </a>
        </div>
        <div class="collapse navbar-collapse" id="response-navbar-collapse">
            <ul class="nav navbar-nav navbar-right ">
                <li class="dropdown">
                    <a id="user_a" href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: white">
                        <span class="glyphicon glyphicon-user" style="color: #23527c"></span>
                        Admin
                    </a>
                    <ul id="user_ul" class="dropdown-menu dropdown-menu-left">
                        <li><a onclick="isexit()">退出</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<%--第一屏背景图片--%>

<div class="modal fade bs-example-modal-sm" role="dialog" id="mymodal">   <%--登录窗口--%>
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                信息修改窗口
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">    <%--登录窗口模块--%>
                <form role="form" class="form-horizontal ">
                    <div class="form-group">
                        <div class="col-md-10 has-success has-feedback col-md-offset-1">
                            Customer ID :<input id="Customerid" type="text" readOnly="true" style="border: 0px;width:100px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-10 has-feedback col-md-offset-1">
                            <input id="FirstName" placeholder="First Name" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-10 has-feedback col-md-offset-1">
                            <input id="LastName" placeholder="Last Name" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-10 has-feedback col-md-offset-1">
                            <select id="Address" class="form-control" ></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-10 has-feedback col-md-offset-1">
                            <input id="Email" placeholder="Email" class="form-control">
                        </div>
                    </div>
                </form>
            </div>
            <div id="loginmodal_btn" class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">Close</button>
                <button class="btn btn-primary" onclick="edit()">Finish</button>
            </div>
        </div>
    </div>
</div>
<%--<div class="container">--%>

<div class="row" style="margin: -15px 0px;">
    <div class="col-md-2">
        <div>
            <a class="btn btn-default" style="width: 100%;text-align: left" href="index.jsp">
                <span class="glyphicon glyphicon-stop"></span>
                Customer管理
                <span class="glyphicon glyphicon-chevron-right pull-right"></span>
            </a>
            <br>
            <a class="btn btn-default" style="width: 100%;text-align: left" onclick="tofilmindex()">
                <span class="glyphicon glyphicon-stop"></span>
                Film设置
                <span class="glyphicon glyphicon-chevron-right pull-right"></span>
            </a>
        </div>
        <%--<table><td colspan=""></td></table>--%>
    </div>
    <div class="col-md-10">
        <div style="background-color: #e7e7e7"><p style="font-size: x-large;font-family: '黑体'">客户管理</p>

            <div style="border-top: 2px solid blue;padding: 10px;">
                <label style="font-size: large;width: 300px;">客户列表</label>
                <a class="btn btn-primary" href="insert.jsp">新建</a>
            </div>
            <div style="margin-left: 20px;margin-right: 20px;">

                <table id="mytable" class="table table-bordered table-hover table-striped">
                    <tbody id="mytbody">
                    <tr style="border-bottom: 2px solid blue">
                        <td colspan="2">操作</td>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Address</th>
                        <th>Email</th>
                        <th>Customerid</th>
                        <th>LastUpdate</th>
                    </tr>
                    <div id="mydiv">
                        <%--<%
                            HashMap map = (HashMap) request.getAttribute("customerinfo");
                            if (map != null) {
                                for (int i = 0; i < map.size(); i++) {
                                    Customer customer = (Customer) map.get(i);
                                    out.print("<tr>");
                                    out.print("<td><a data-toggle='modal' data-target='#mymodal'>编辑</a></td>");
                                    out.print("<td><a onclick='showalert()'>删除</a></td>");
                                    out.print("<td>" + customer.getFirstName() + "</td>");
                                    out.print("<td>" + customer.getLastName() + "</td>");
                                    out.print("<td>" + customer.getAddress() + "</td>");
                                    out.print("<td>" + customer.getEmail() + "</td>");
                                    out.print("<td>" + customer.getCustomerid() + "</td>");
                                    out.print("<td>" + customer.getLastUpdate() + "</td>");
                                    out.print("</tr>");
                                }
                            }
                        %>--%></div>
                    </tbody>
                </table>
                <div id="selectdiv" style="text-align: right;padding-bottom: 20px;">
                </div>
            </div>
        </div>
    </div>
</div>
<%--</div>--%>
<script>
    //    alert(screen.availHeight+" "+screen.availWidth);
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
    function isexit() {
        if (confirm("确定退出？")) {
            location = "index_exit.do";
        }
    };
</script>
</body>
</html>
