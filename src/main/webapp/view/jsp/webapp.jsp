<%--
  Created by IntelliJ IDEA.
  User: 17149
  Date: 2019/1/24
  Time: 20:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <style type="text/css">
        .body{
            width: 100%;
            height: 600px;
            background: url("../../uploaddir/timg0.gif");
            background-repeat:no-repeat;
            background-size:100% 100%;
        }
        .Intro{
            position: absolute;
            top: 100px;
            left: 150px;
            width: 340px;
            height: 440px;
            color: white;
            font-weight: bolder;
            font-size: 18px;
        }
        a{
            text-decoration: white;
            font-weight: bolder;
            color: white;
        }
        a:hover{
            cursor: pointer;
            color: red;
        }
    </style>
</head>
<body class="body">
<h1 style="color: white">欢迎来到<font size="20px" color="#ff8c00">万事屋</font></h1>
<div class="Intro">
    <br>
    <br>
    <br>
    <br>
    <font>在这里你可以对自己的商品进行管理，通过<font color="red">注册</font></font><br><br>
    <font><font color="red">登陆</font>激活账户权限，在这里您可以发布自己的商品，对您的</font><br><br>
    <font>商品进行管理，方便您处理自己的闲置物品</font><br><br>
    <font></font>
</div>
<a href="/view/jsp/load/register.jsp" style="position: absolute;top: 10px;right: 150px">注册</a>
<a href="/view/jsp/load/dologin.jsp" style="position: absolute;top: 10px;right: 100px">登陆</a>
</body>
</html>
