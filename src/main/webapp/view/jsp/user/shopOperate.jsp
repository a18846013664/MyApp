<%--
  Created by IntelliJ IDEA.
  User: 17149
  Date: 2019/1/22
  Time: 8:35
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <style type="text/css">

        *{
            padding: 0;
            margin: 0;
        }
        a:hover{
            font-size: 16px;
            color: brown;
        }
        a{
            text-decoration: white;
        }
    </style>
</head>
<body style="background: url(../../../uploaddir/7852.gif);background-repeat:no-repeat;background-size:100% 100%;">
<div style="width: 100%;height: 50px;background: #000000;opacity: 0.7">
    <a href="" style="color: black;font-weight: bolder;position: absolute;top: 20px;right: 50px">商城首页</a>
    <a href="" style="color: black;font-weight: bolder;position: absolute;top: 20px;right: 180px">个人主页</a>
</div>
<div style="height: 600px;width: 100%;background: black;opacity: 0.7">
    <div style="width: 150px;height: 550px;background: #000000;border-radius: 45px;float: left;margin: -30px 10px">
        <img id="head" width="120px" height="120px" src="${pageContext.request.contextPath}/resource/image/${jsp.headfile}"style="border-radius: 60px;float: left;margin: 10px 13px;border: 2px solid white">
        <div style="height: 380px;width: 50px;background: #202020;float: left;margin: 10px 50px;border-radius: 25px">
            <div style="width: 40px;height: 40px;border-radius: 20px;background: white;margin: 30px 5px">
                <a href="/view/jsp/user/cart.jsp"><img src="../../../uploaddir/414.jpg" width="40px" height="40px" style="border-radius: 20px"></a>
            </div>
            <div style="width: 40px;height: 40px;border-radius: 20px;background: white;margin: 100px 5px">
                <a href="/view/jsp/user/cart.jsp"><img src="../../../uploaddir/414.jpg" width="40px" height="40px" style="border-radius: 20px"></a>
            </div>
            <div style="width: 40px;height: 40px;border-radius: 20px;background: white;margin: 100px 5px">
                <a href="/view/jsp/user/cart.jsp"><img src="../../../uploaddir/414.jpg" width="40px" height="40px" style="border-radius: 20px"></a>
            </div>
        </div>
    </div>

    <div style="width: 800px;height: 500px;background: #040604;position: absolute;top: 100px;left: 200px">
        <div style="width: 800px;height: 500px;background: #222222">
            <c:forEach items="${shopSrcs}" var="s">
                <img src="${pageContext.request.contextPath}/uploaddir/${s}" width="200px" height="160px" style="border: 4px solid #020000;float: left;margin: 10px 23px"/>
            </c:forEach>
        </div>
        <div style="height: 280px;width: 370px;position: absolute;top: 210px;left: 70px;background: #020202">
            <div style="font-size: 15px;font-weight: bolder;margin: 50px 0px 0px 60px;color: red">产品名称：${shop.shopName}</div>
            <div style="font-size: 15px;font-weight: bolder;margin: 20px 0px 0px 60px;color: red">产品类型：${shop.shopSimple}</div>
            <div style="font-size: 15px;font-weight: bolder;margin: 20px 0px 0px 60px;color: red">产品价格：${shop.shopPrice}</div>
            <div style="font-size: 15px;font-weight: bolder;margin: 20px 0px 0px 60px;color: red">产品描述：${shop.shopX}</div>
            <div style="font-size: 15px;font-weight: bolder;margin: 20px 0px 0px 60px;color: red">
                <form id="myForm" action="/a/addShopCart" method="post">
                    <input id="shopid" type="hidden" name="shopid" value="${shop.shopid}">
                    <label>购买数量:</label>
                    <input id="num" type="text" name="num" value="1" style="width: 100px;">
                    <div style="position: absolute;top: 116px;left: 460px;width: 180px;height: 40px;background: white">
                        <input id="btn" type="button" value="加&nbsp;&nbsp;入&nbsp;&nbsp;购&nbsp;&nbsp;物&nbsp;&nbsp;车" style="position: relative;top:0px;left: 0px;color: red;font-weight: bolder;font-size:16px;width: 180px;height: 40px">
                    </div>
                </form>
            </div>

        </div>
        <div style="position: absolute;top: 260px;left: 530px;width: 180px;height: 40px;background: white">
            <input id="btb" type="button" value="购&nbsp;买" style="position: relative;top:0px;left: 0px;color: red;font-weight: bolder;font-size:16px;width: 180px;height: 40px">
        </div>
        <div style="position: absolute;top: 390px;left: 530px;width: 180px;height: 40px;background: white">
            <a href="/a/shopEnterss?currentPage=0" style="position: relative;top:10px;left: 45px;color: red;font-weight: bolder">商&nbsp;&nbsp;家&nbsp;&nbsp;店&nbsp;&nbsp;铺</a>
        </div>
    </div>
    <a href="/view/jsp/user/enterShop.jsp" style="position: absolute;top: 540px;left: 880px;font-weight:bolder;color: white">返回商城</a>
</div>
<div style="position: absolute;top: 60px;right: 30px;width: 300px;height: 560px;background: #353535;opacity: 0.7">
    <div style="width: 250px;height: 24px;background: #030402;border-radius: 12px;margin: 20px auto">
        <img src="../../../uploaddir/2.jpg" style="width: 24px;height: 24px;border-radius: 12px">
        <font style="position: relative;top:-5px;left:30px;font-size: 14px;color: white">物美价廉，真心不错！</font>
    </div>
    <div style="width: 250px;height: 24px;background: #030402;border-radius: 12px;margin: 20px auto">
        <img src="../../../uploaddir/2.jpg" style="width: 24px;height: 24px;border-radius: 12px">
        <font style="position: relative;top:-5px;left:30px;font-size: 14px;color: white">物美价廉，真心不错！</font>
    </div>
    <div style="width: 250px;height: 24px;background: #030402;border-radius: 12px;margin: 20px auto">
        <img src="../../../uploaddir/2.jpg" style="width: 24px;height: 24px;border-radius: 12px">
        <font style="position: relative;top:-5px;left:30px;font-size: 14px;color: white">物美价廉，真心不错！</font>
    </div>
    <div style="width: 250px;height: 24px;background: #030402;border-radius: 12px;margin: 20px auto">
        <img src="../../../uploaddir/2.jpg" style="width: 24px;height: 24px;border-radius: 12px">
        <font style="position: relative;top:-5px;left:30px;font-size: 14px;color: white">物美价廉，真心不错！</font>
    </div>
    <div style="width: 250px;height: 24px;background: #030402;border-radius: 12px;margin: 20px auto">
        <img src="../../../uploaddir/2.jpg" style="width: 24px;height: 24px;border-radius: 12px">
        <font style="position: relative;top:-5px;left:30px;font-size: 14px;color: white">物美价廉，真心不错！</font>
    </div>
    <div style="width: 250px;height: 24px;background: #030402;border-radius: 12px;margin: 20px auto">
        <img src="../../../uploaddir/2.jpg" style="width: 24px;height: 24px;border-radius: 12px">
        <font style="position: relative;top:-5px;left:30px;font-size: 14px;color: white">物美价廉，真心不错！</font>
    </div>
    <div style="width: 250px;height: 24px;background: #030402;border-radius: 12px;margin: 20px auto">
        <img src="../../../uploaddir/2.jpg" style="width: 24px;height: 24px;border-radius: 12px">
        <font style="position: relative;top:-5px;left:30px;font-size: 14px;color: white">物美价廉，真心不错！</font>
    </div>

</div>
<a href="/view/jsp/user.jsp" style="position: absolute;top:10px;right: 50px;color: white">返回上一页</a>
<script src="http://libs.baidu.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#btn").click(function () {
            var formObj = document.getElementById("myForm");
            formObj.action="/a/addCart";
            formObj.method="get";
            formObj.submit();
        });
        $("#btb").click(function () {
            var formObj = document.getElementById("myForm");
            formObj.action="/a/buy";
            formObj.method="get";
            formObj.submit();
        })
    })
</script>
</body>
</html>
