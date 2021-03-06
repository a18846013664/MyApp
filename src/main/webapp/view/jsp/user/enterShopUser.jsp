<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 17149
  Date: 2019/1/22
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <style type="text/css">
        a{
            text-decoration: white;
            color: white;
        }
    </style>
</head>
<body style="background: url(../../../uploaddir/7852.gif);background-repeat:no-repeat;background-size:100% 100%;">
<div style="height: 600px;width: 100%;background: black;opacity: 0.7">
    <div style="position: absolute;top:50px;left: 50px">
        <p style="font-size: 16px;color: white">欢迎来到<font color="red">root</font>的店铺</p>
    </div>
    <a href="/a/shopPage?currentPage=0" style="position: absolute;top: 80px;left: 1100px;color: #fcfcfc">返回商城</a>
    <div style="position: absolute;top: 150px;left: 50px;background: #404040;width: 190px;height: 300px">
        <img id="head" width="100px" height="100px" style="border-radius: 50px;position: absolute;top: 30px;left: 45px;border: 2px solid #b50000" src="../../../uploaddir/asd.jpg">
        <p style="position: absolute;top: 160px;left: 50px;font-weight: bolder;color: white">店主：<font color="red">root</font></p>
        <p style="position: absolute;top: 200px;left: 50px;font-weight: bolder;color: white">联系：<font color="red">13351118790</font></p>
    </div>
    <div style="height: 400px;width: 900px;position: absolute;top: 150px;left:350px;border: 2px solid #222222;background:#222222">
        <c:forEach items="${p.getUserShops()}" var="user">
            <a href="/a/shopOperate?shopid=${user.shopid}"><div style="display:block;height: 200px;width: 140px;float: left;margin: 30px 40px;background:#878787;border: 2px solid white">
                <img src="${pageContext.request.contextPath}/uploaddir/${user.shopFile}" width="140px" height="160px"/>
                <div align="center" style="font-size: 14px;color: white;font-weight: bolder">${user.shopName}</div>
                <div align="center" style="font-size: 14px;color: white;font-weight: bolder">￥${user.shopPrice}</div>
            </div></a>
        </c:forEach>
        <c:if test="${p.getCurrentPage()==null}">
            <a href="/a/shopEnter?currentPage=0" style="position: absolute;top: 360px;left: 300px;color: #fcfcfc">首页</a>
        </c:if>
        <c:if test="${p.getCurrentPage()!=0&&p.getCurrentPage()!=p.getTotalPage()}">
            <a href="/a/shopEnter?currentPage=0" style="color:#fcfcfc;position: absolute;top: 360px;left: 300px;">首页</a>
            <a href="/a/shopEnter?currentPage=${p.getCurrentPage()-1}" style="color:#fcfcfc;position: absolute;top: 360px;left: 350px;">上一页</a>
            <a href="/a/shopEnter?currentPage=${p.getCurrentPage()+1}" style="color:#fcfcfc;position: absolute;top: 360px;left: 420px;">下一页</a>
            <a href="/a/shopEnter?currentPage=${p.getTotalPage()}" style="color:#fcfcfc;position: absolute;top: 360px;left: 490px;">尾页</a>
        </c:if>
        <c:if test="${p.getCurrentPage() == 0&&p.getTotalPage() !=0}">
            <a href="/a/shopEnter?currentPage=${p.getCurrentPage()+1}" style="color:#fcfcfc;position: absolute;top: 360px;left: 420px;">下一页</a>
            <a href="/a/shopEnter?currentPage=${p.getTotalPage()}" style="color:#fcfcfc;position: absolute;top: 360px;left: 490px;">尾页</a>
        </c:if>

        <c:if test="${p.getTotalPage()!=0 && p.getCurrentPage() == p.getTotalPage()}">
            <a href="/a/shopEnter?currentPage=0" style="color:#fcfcfc;position: absolute;top: 360px;left: 300px;">首页</a>
            <a href="/a/shopEnter?currentPage=${p.getCurrentPage()-1}" style="color:#fcfcfc;position: absolute;top: 360px;left: 350px;">上一页</a>
        </c:if>
    </div>
</div>

</body>
</html>

