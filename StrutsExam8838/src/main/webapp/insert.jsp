<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>

<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>新增界面</title>
    <title>电影租赁系统</title>
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/index.css" rel="stylesheet" type="text/css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/insert.js"></script>
</head>
<body>
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
                        <li><a href="#">退出</a></li>
                    </ul>
                </li>
            </ul>

        </div>
    </div>
</nav>
<div class="row" style="margin: -15px 0px;">
    <div class="col-md-2">
        <div>
            <a class="btn btn-default" style="width: 100%;text-align: left" href="#">
                <span class="glyphicon glyphicon-stop"></span>
                Dashboard
                <span class="glyphicon glyphicon-chevron-right pull-right"></span>
            </a>
            <br>
            <a class="btn btn-default" style="width: 100%;text-align: left" href="#">
                <span class="glyphicon glyphicon-stop"></span>
                应用设置
                <span class="glyphicon glyphicon-chevron-right pull-right"></span>
            </a><br>
            <a class="btn btn-default" style="width: 100%;text-align: left" href="#">
                <span class="glyphicon glyphicon-stop"></span>
                管理设置
                <span class="glyphicon glyphicon-chevron-right pull-right"></span>
            </a><br>
            <a class="btn btn-default" style="width: 100%;text-align: left" href="#">
                <span class="glyphicon glyphicon-stop"></span>
                数据配置
                <span class="glyphicon glyphicon-chevron-right pull-right"></span>
            </a><br>
            <a class="btn btn-default" style="width: 100%;text-align: left" href="#">
                <span class="glyphicon glyphicon-stop"></span>
                主数据管理
                <span class="glyphicon glyphicon-chevron-right pull-right"></span>
            </a><br>
            <a class="btn btn-default" style="width: 100%;text-align: left" href="#">
                <span class="glyphicon glyphicon-stop"></span>
                客户订单管理
                <span class="glyphicon glyphicon-chevron-right pull-right"></span>
            </a><br>
            <a class="btn btn-default" style="width: 100%;text-align: left" href="#">
                <span class="glyphicon glyphicon-stop"></span>
                发货单管理
                <span class="glyphicon glyphicon-chevron-right pull-right"></span>
            </a>
        </div>
        <%--<table><td colspan=""></td></table>--%>
    </div>
    <div class="col-md-10">
        <div style="background-color: #e7e7e7"><p style="font-size: x-large;font-family: '黑体'">创建Customer</p>

            <div style="border-top: 3px solid blue;padding: 10px;">
                <label style="font-size: large;width: 300px;">基本信息</label>
            </div>

        </div>
        <div style="margin-left: 40px;margin-top: 10px;width: 400px;">
            <form action="" class="form-group" >
                <div class="col-md-4">
                    <label>First Name</label> <h7 style="color: red">*</h7>
                </div>
                <div class="col-md-8">
                    <input type="text" id="FirstName" class="form-control">
                </div>

                <div class="col-md-4">
                    <label>Last Name</label> <h7 style="color: red">*</h7>
                </div>
                <div class="col-md-8">
                    <input type="text" id="LastName" class="form-control">
                </div><br>

                <div class="col-md-4">
                    <label>Email</label>
                </div>
                <div class="col-md-8">
                    <input type="text" id="Email" class="form-control">
                </div><br>

                <div class="col-md-4">
                    <label>Address</label> <h7 style="color: red">*</h7>
                </div>

                <div class="col-md-8">
                    <select id="Address" class="form-control"></select>
                </div><br>

                <div class="col-md-4  col-lg-offset-4">
                    <button  type="but" class="btn btn-primary" onclick="doinsert()">新建</button>
                    <button  class="btn btn-default">取消</button>
                </div>

            </form>
        </div>
    </div>
</div>

</body>
</html>