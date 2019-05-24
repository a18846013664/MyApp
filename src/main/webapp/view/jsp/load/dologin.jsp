<%--
  Created by IntelliJ IDEA.
  User: 17149
  Date: 2018/10/24
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style type="text/css">
        label{
            font-size: 18px;
            color: whitesmoke;
            font-weight: lighter;
        }
        a{
            text-decoration: white;
        }
        a:hover{
            color: red;
        }
    </style>
</head>
<body>
<h1 style="color: white;position: absolute;top: 20px;left: 20px">欢迎登陆万事屋</h1>
<div style="width: 100%;height: 300px">
    <img src="../../../uploaddir/timg0.gif" width="100%" height="600px">

</div>
<div style="width: 100%;height: 300px;background: burlywood">
    <form action="/loginSuccess" method="post">
        <label style="position: absolute;top: 280px;left: 550px">用户：</label>
        <input style="position: absolute;top: 280px;left: 590px;" type="text" name="username" value=""/>
        <div style="position: absolute;top: 280px;left: 780px;color: white">${errUser}</div>
        <label style="position: absolute;top: 330px;left: 550px">密码：</label>
        <input style="position: absolute;top: 330px;left: 590px;" type="password" name="password" value=""/>
        <div style="position: absolute;top: 330px;left: 780px;color: white">${errPass}</div><br>
        <input style="position: absolute;top: 453px;left: 1000px;"type="submit" value="登陆"/>
    </form>
    <a style="color:white;position: absolute;top: 453px;left: 920px;font-size: 14px;" href="/view/jsp/webapp.jsp">返回首页</a>
</div>
</body>
</html>