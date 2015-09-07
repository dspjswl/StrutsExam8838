<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/24
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.min.js"></script>

</head>

<body>

<button>获得 JSON 数据</button>
<p id="result"></p>

</body>
<script type="text/javascript">
    $(function() {
        $.ajax({
            type:"GET",
            url:"src/customer.json",
            dataType:"json",
            success:function(iJson){
                var test = eval(iJson);
                alert(test[0][0].TITLE);
            },
            error:function(){
                alert("error");
            }
        });
    });
</script>
</html>
