<%--
  Created by IntelliJ IDEA.
  User: 17149
  Date: 2019/1/17
  Time: 8:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style type="text/css">
        .div{
            width: 600px;
            height: 300px;
            margin: 200px auto;
        }
        a{
            text-decoration: white;
        }
    </style>
</head>
<body style="width: 1366px;height:650px;background: url(../../../uploaddir/timg0.gif);background-repeat:no-repeat;background-size:100% 100%;">
<div class="div">
    <input id="username" type="hidden" name="id" value="${sessionScope.jsp.id}">
    <label id="A" style="color:white;position: absolute;top: 400px;left: 500px;font-weight: bolder">旧密码：</label>
    <input style="position: absolute;top: 400px;left: 600px" id="password" name="password" type="password">
    <div id="div" style="display:block;position: absolute;top: 150px;left: 800px;font-weight: bolder"></div>
    <div onclick="f()" id="divv" style="color:white;position: relative;top:200px;left: 420px">下一步</div>
    <div style="display: none" id="newPass">
        <form action="/a/password" method="post">
            <input name="id" type="hidden" value="${sessionScope.jsp.id}">
            <label style="color:white;position: absolute;top: 400px;left: 500px;font-weight: bolder">新密码：</label>
            <input style="position: absolute;top: 400px;left: 600px"  name="password" type="password">
            <input type="submit" style="position: absolute;top: 200px;left: 800px;font-weight: bolder" value="修改">
        </form>
    </div>
</div>
<a href="/view/jsp/user.jsp" style="color:white;position: absolute;top:20px;right: 50px">返回上一页</a>
<script src="http://libs.baidu.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript">
    function f(){
        var me = document.getElementById("div").innerHTML;
        if (me=='密码正确'){
            document.getElementById("div").style.display="none";
            document.getElementById("newPass").style.display="block";
            document.getElementById("A").style.display="none";
            document.getElementById("password").style.display="none";
            document.getElementById("divv").style.display="none";
        }
    }
    $(function () {
        $("/*:input[name='username']*/#password").change(function () {
            /*var val = $(this).val();*/


            /*val = $.trim(val);*/
            //这里传的是id
            var username = $("#username").val();
            var password = $("#password").val();
            var id = $.trim(username);
            var Password = $.trim(password);


            if(Password != ""){
                var url = "/password";
                var args = {"id":id,"passWord":Password,"time":new Date()};
                $.post(url,args,function (data) {
                    $("#div").html(data);
                });
            }
        });
    })
</script>
</body>
</html>
