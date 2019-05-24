<%--
  Created by IntelliJ IDEA.
  User: 17149
  Date: 2019/1/17
  Time: 8:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style type="text/css">
        *{
            padding: 0;
            margin: 0;
        }
        a{
            text-decoration: white;
            color: white;
        }
        a:hover{
            color: #70a264;
            font-size: 16px;
        }
        .fonter{
            font-weight: bolder;
        }
        .fonter:hover{
            color: #70a264;
        }
        .bac{
            width: 100%;
            height: 800px;
            background: url(../../../uploaddir/7852.gif);background-repeat:no-repeat;background-size:100% 100%;
        }
    </style>
</head>
<body class="bac">
<div style="width: 100%;height: 100px;background:black;opacity:0.7;border-radius:50px ">
    <div style="height: 80px;width: 80px;border-radius: 40px;border:1px solid white;position: absolute;top: 10px;left: 10px;">
        <img width="80px" height="80px" style="border-radius: 40px" src="${pageContext.request.contextPath}/resource/image/${jsp.headfile}">
    </div>
    <div style="height: 40px;width: 1160px;position: absolute;top: 30px;left: 120px;background: #2f2f2f;border-radius: 20px">
        <font style="position: absolute;top: 10px;left: 180px;color: white">查询</font>
        <input type="text" value="" style="height: 28px;width: 350px;position: absolute;top: 5px;left: 230px;border-radius: 18px;border: 0px" >
        <a class="fonter" href="/view/jsp/user.jsp" style="position: absolute;top: 10px;left: 10px;color: #ddf2f7">用户:${sessionScope.jsp.username}</a>
        <a class="fonter" href="/a/Order?currentPage=0" style="position: absolute;top: 10px;left: 610px;color: #ddf2f7">商品分类</a>
        <a class="fonter" href="/a/Order?currentPage=0" style="position: absolute;top: 10px;left: 720px;color: #ddf2f7">我的订单</a>
        <a class="fonter" href="/view/jsp/user/cart.jsp" style="position: absolute;top: 10px;left: 830px;color: #ddf2f7">我的购物车</a>
        <a class="fonter" href="#" style="position: absolute;top: 10px;left: 950px;color: #ddf2f7">领取优惠券</a>
        <a class="fonter" href="#" style="position: absolute;top: 10px;left: 1070px;color: #ddf2f7">会员办理</a>
    </div>
</div>
<div style="width: 100%;height: 22px;background: #222222;position: absolute;top:600px;"></div>
<div style="height: 530px;width: 100%;position: absolute;top: 120px">
    <c:forEach items="${pp.getUserShops()}" var="user">
        <a href="/a/shopOperate?shopid=${user.shopid}"><div style="display:block;height: 205px;width: 140px;float: left;margin: 15px 38px;background:#414141;opacity:0.7;border: 2px solid #040404">
            <img src="${pageContext.request.contextPath}/uploaddir/${user.shopFile}" width="140px" style="opacity: 0.9" height="160px"/>
            <div align="center" style="font-size: 14px;color: #bc9826;font-weight: bolder">${user.shopName}</div>
            <div align="center" style="font-size: 14px;color: #e0e0e0;font-weight: bolder">￥${user.shopPrice}</div>
        </div></a>
    </c:forEach>
    <c:if test="${pp.getCurrentPage()==null}">
        <a href="/a/shopPage?currentPage=0" style="position: absolute;top: 480px;left:530px">首页</a>
    </c:if>
    <c:if test="${pp.getCurrentPage()!=0&&pp.getCurrentPage()!=pp.getTotalPage()}">
        <a href="/a/shopPage?currentPage=0" style="position: absolute;top: 480px;left:530px">首页</a>
        <a href="/a/shopPage?currentPage=${pp.getCurrentPage()-1}" style="position: absolute;top: 480px;left: 580px">上一页</a>
        <a href="/a/shopPage?currentPage=${pp.getCurrentPage()+1}" style="position: absolute;top: 480px;left: 680px">下一页</a>
        <a href="/a/ShopPage?currentPage=${pp.getTotalPage()}" style="position: absolute;top: 480px;left: 750px">尾页</a>
    </c:if>
    <c:if test="${pp.getCurrentPage() == 0&&pp.getTotalPage() !=0}">
        <a href="/a/shopPage?currentPage=${pp.getCurrentPage()+1}" style="position: absolute;top: 480px;left: 680px">下一页</a>
        <a href="/a/shopPage?currentPage=${pp.getTotalPage()}" style="position: absolute;top: 480px;left: 750px">尾页</a>
    </c:if>

    <c:if test="${pp.getTotalPage()!=0 && pp.getCurrentPage() == pp.getTotalPage()}">
        <a href="/a/shopPage?currentPage=0" style="position: absolute;top: 480px;left: 580px;">首页</a>
        <a href="/a/shopPage?currentPage=${pp.getCurrentPage()-1}" style="position: absolute;top: 480px;left: 680px">上一页</a>
    </c:if>
</div>
</body>
