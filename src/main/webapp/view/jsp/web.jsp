<%--
  Created by IntelliJ IDEA.
  User: 17149
  Date: 2019/1/13
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style type="text/css">
        .body{
            background: url("../../uploaddir/timg0.gif");
            background-repeat:no-repeat;
            background-size:100% 100%;
            width: 100%;
            height: 650px;
        }
        *{
            padding: 0;
            margin: 0;
        }
        #head{
            position: absolute;
            top: 50px;
            left: 50px;
            height: 100px;
            width: 100px;
            border:2px solid white;
            border-radius:50px;
        }
        .div{
            height: 650px;
            width: 200px;
            position: absolute;
            top: 0;
            left:20px;
            background: #2b2b2b;
            opacity: 0.7;
        }
        .divUp{
            position: absolute;
            top: 50px;
            right: 30px;
            height: 80px;
            width: 80px;
            border-radius:40px;
            background: #909091;
            font-size: 14px
        }
        a{
            color: black;
            text-decoration: white;
        }
        .update{
            position: absolute;
            top: 140px;
            right: 30px;
            height: 80px;
            width: 80px;
            border-radius:40px;
            background: #909091;
            font-size: 14px
        }
        .update:hover{
            cursor: pointer;
            background: #70a264;
            color: darkorange;
        }
        .divUp:hover{
            cursor: pointer;
            background: #70a264;
            color: darkorange;
        }
        .username{
            position: absolute;
            top: 220px;
            left: 30px;
        }
        .sex{
            position: absolute;
            top: 290px;
            left: 30px;
        }
        .account{
            position: absolute;
            top: 360px;
            left: 30px;
        }
        .phone{
            position: absolute;
            top: 430px;
            left: 30px;
        }
        .divAc{
            position: absolute;
            top: 80px;
            right:30px;
            width: 180px;
            height: 280px;
            border: 8px solid #8b7c21;
            background: #b4b4b4;
            opacity: 0.85;
        }
        .inputA{
            border: none;
            margin: 0px 0px 0px 40px;
        }
        .inputAA{
            width:100px;
            height: 25px;
            background: white;
            margin: 20px 10px 0px 20px;
        }
        .submitA{
            position: absolute;
            top: 40px;
            right: 20px;
            height: 27px;
        }
        .submitB{
            position: absolute;
            top: 85px;
            right: 20px;
            height: 27px;
        }
        .submitC{
            position: absolute;
            top: 130px;
            right: 20px;
            height: 27px;
        }
        .submitD{
            position: absolute;
            top: 175px;
            right: 20px;
            height: 27px;
        }
        .submitE{
            position: absolute;
            top: 220px;
            right: 20px;
            height: 27px;
        }
        .UpPass:hover{
            cursor: pointer;
            background: #70a264;
            color: darkorange;
        }
        .UpPass{
            position: absolute;
            top: 230px;
            right: 30px;
            height: 80px;
            width: 80px;
            border-radius:40px;
            background: #909091;
            font-size: 14px
        }
        .UpShop:hover{
            cursor: pointer;
            background: #70a264;
            color: darkorange;
        }
        .UpShop{
            position: absolute;
            top: 320px;
            right: 30px;
            height: 80px;
            width: 80px;
            border-radius:40px;
            background: #909091;
            font-size: 14px
        }
        .userShop:hover{
            cursor: pointer;
            background: #70a264;
            color: darkorange;
        }
        .userShop{
            position: absolute;
            top: 410px;
            right: 30px;
            height: 80px;
            width: 80px;
            border-radius:40px;
            background: #909091;
            font-size: 14px
        }
        .enterShop:hover{
            cursor: pointer;
            background: #70a264;
            color: darkorange;
        }
        .enterShop{
            position: absolute;
            top: 500px;
            right: 30px;
            height: 80px;
            width: 80px;
            border-radius:40px;
            background: #909091;
            font-size: 14px
        }
    </style>
    <link rel="stylesheet" type="text/css" href="../../resource/css/style00.css">
    <script src="../../resource/js/jquery-3.1.1.min0.js"></script>
    <script type="text/javascript" src="../../resource/js/carousel0.js"></script>
</head>
<body class="body">

<a href="/view/jsp/webapp.jsp" class="divUp">&nbsp;&nbsp;&nbsp;<font color="white" style="font-weight: bolder;position: relative;top: 30px">返回首页</font></a>
<a href="/view/jsp/user/updateUser.jsp" class="update">&nbsp;&nbsp;&nbsp;<font color="white" style="font-weight: bolder;position: relative;top: 30px">修改信息</font></a>
<a href="/view/jsp/user/password.jsp" class="UpPass">&nbsp;&nbsp;&nbsp;<font color="white" style="font-weight: bolder;position: relative;top: 30px">修改密码</font></a>
<a href="/view/jsp/user/upShop.jsp" class="UpShop">&nbsp;&nbsp;&nbsp;<font color="white" style="font-weight: bolder;position: relative;top: 30px">商品上架</font></a>
<a href="/a/page?currentPage=0" class="userShop">&nbsp;&nbsp;&nbsp;<font color="white" style="font-weight: bolder;position: relative;top: 30px">个人商铺</font></a>
<a href="/a/shopPage?currentPage=0" class="enterShop">&nbsp;&nbsp;&nbsp;<font color="white" style="font-weight: bolder;position: relative;top: 30px">进入商城</font></a>
<div>
    <div class="div">
        <img id="head" width="100px" height="100px" src="${pageContext.request.contextPath}/resource/image/${jsp.headfile}">
        <div class="username"><font style="color:white;font-weight: bolder ">用户：</font>
            <div style="color:white;font-weight:bolder;width: 140px;height: 20px;background: #e3e4e5;font-size: 14px;color: darkorange;border: 2px solid white">${sessionScope.jsp.username}</div>
        </div>
        <div class="sex"><font style="color:white;font-weight: bolder ">性别：</font>
            <div style="color:white;font-weight:bolder;width: 140px;height: 20px;background: #e3e4e5;font-size: 14px;color: darkorange;border: 2px solid white">${sessionScope.jsp.sex}</div>
        </div>
        <div class="account"><font style="color:white;font-weight: bolder ">账户：</font>
            <div style="color:white;font-weight:bolder;width: 140px;height: 20px;background: #e3e4e5;font-size: 14px;color: darkorange;border: 2px solid white">${sessionScope.jsp.account}</div>
        </div>
        <div class="phone"><font style="color:white;font-weight: bolder ">联系：</font>
            <div style="color:white;font-weight:bolder;width: 140px;height: 20px;background: #e3e4e5;font-size: 14px;color: darkorange;border: 2px solid white">${sessionScope.jsp.phone}</div>
        </div>
        <a style="color:white;font-weight:bolder;position: absolute;top:540px;left: 140px;font-size: 14px" href="/zx">注销</a>
    </div>
    <div class="content">
        <div class="carousel-content">
            <ul class="carousel">
                <li><img src="../../resource/image/slider1.jpg"></li>
                <li><img src="../../resource/image/slider2.jpg"></li>
                <li><img src="../../resource/image/slider3.jpg"></li>
                <li><img src="../../resource/image/slider4.jpg"></li>
                <li><img src="../../resource/image/slider5.jpg"></li>
            </ul>
            <ul class="img-index"></ul>
            <div class="carousel-prev"><img src="/resource/image//left1.png"></div>
            <div class="carousel-next"><img src="/resource/image//right1.png"></div>
        </div>
    </div>
    <div class="divAc" style="display: none;">
        <font style="margin:15px 0px 0px 55px;font-weight: bolder;color: white">账户充值</font>
        <form action="/a/updateAccount" method="post">
            <input type="hidden" name="id" value="${sessionScope.jsp.id}">
            <input type="hidden" name="username" value="${sessionScope.jsp.username}">
            <input type="hidden" name="password" value="${sessionScope.jsp.password}">
            <input type="hidden" name="sex" value="${sessionScope.jsp.sex}">
            <input type="hidden" name="headfile" value="${sessionScope.jsp.headfile}">
            <input type="hidden" name="phone" value="${sessionScope.jsp.phone}">
            <div class="inputAA">
                <input type="text" class="inputA" style="width: 20px" name="account" value="50">
            </div>
            <input class="submitA" type="submit" value="充值">
        </form>
        <form action="/a/updateAccount" method="post">
            <input type="hidden" name="id" value="${sessionScope.jsp.id}">
            <input type="hidden" name="username" value="${sessionScope.jsp.username}">
            <input type="hidden" name="password" value="${sessionScope.jsp.password}">
            <input type="hidden" name="sex" value="${sessionScope.jsp.sex}">
            <input type="hidden" name="headfile" value="${sessionScope.jsp.headfile}">
            <input type="hidden" name="phone" value="${sessionScope.jsp.phone}">
            <div class="inputAA">
                <input type="text" class="inputA" style="width: 25px" name="account" value="100">
            </div>
            <input class="submitB" type="submit" value="充值">
        </form>
        <form action="/a/updateAccount" method="post">
            <input type="hidden" name="id" value="${sessionScope.jsp.id}">
            <input type="hidden" name="username" value="${sessionScope.jsp.username}">
            <input type="hidden" name="password" value="${sessionScope.jsp.password}">
            <input type="hidden" name="sex" value="${sessionScope.jsp.sex}">
            <input type="hidden" name="headfile" value="${sessionScope.jsp.headfile}">
            <input type="hidden" name="phone" value="${sessionScope.jsp.phone}">
            <div class="inputAA">
                <input type="text" class="inputA" style="width: 25px" name="account" value="200">
            </div>
            <input class="submitC" type="submit" value="充值">
        </form>
        <form action="/a/updateAccount" method="post">
            <input type="hidden" name="id" value="${sessionScope.jsp.id}">
            <input type="hidden" name="username" value="${sessionScope.jsp.username}">
            <input type="hidden" name="password" value="${sessionScope.jsp.password}">
            <input type="hidden" name="sex" value="${sessionScope.jsp.sex}">
            <input type="hidden" name="headfile" value="${sessionScope.jsp.headfile}">
            <input type="hidden" name="phone" value="${sessionScope.jsp.phone}">
            <div class="inputAA">
                <input type="text" class="inputA" style="width: 25px" name="account" value="500">
            </div>
            <input class="submitD" type="submit" value="充值">
        </form>
        <form action="/a/updateAccount" method="post">
            <input type="hidden" name="id" value="${sessionScope.jsp.id}">
            <input type="hidden" name="username" value="${sessionScope.jsp.username}">
            <input type="hidden" name="password" value="${sessionScope.jsp.password}">
            <input type="hidden" name="sex" value="${sessionScope.jsp.sex}">
            <input type="hidden" name="headfile" value="${sessionScope.jsp.headfile}">
            <input type="hidden" name="phone" value="${sessionScope.jsp.phone}">
            <div class="inputAA">
                <input type="text" class="inputA" style="width: 25px" name="account" value="500">
            </div>
            <input class="submitE" type="submit" value="充值">
        </form>
    </div>
</div>
</body>
</html>
