<%--
  Created by IntelliJ IDEA.
  User: 17149
  Date: 2019/1/19
  Time: 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        }
        #mydiv{
            height: 0px;
            width: 0px;
            border-left: 15px solid #080000;
            border-right: 15px solid #080000;
            border-bottom:15px solid transparent;
            background: #2d2d2d;
            position: absolute;
            top: 105px;
            left: 290px;
            display: none;
        }
        font{
            font-size: 14px;
            color: white;
        }
        .font1{
            position: absolute;
            top:50px;
            left:580px;
            color: red;
        }
        .font11{
            position: absolute;
            top: 50px;
            left: 620px;
        }
        .font2{
            position: absolute;
            top:50px;
            left:900px;
            color: red;
        }
        .font22{
            position: absolute;
            top:50px;
            left:970px;
        }
        a{
            color: white;
        }
    </style>
</head>
<body style="background: url(../../../uploaddir/7852.gif);background-repeat:no-repeat;background-size:100% 100%;">
<div style="height: 100px;width: 100%;background: #222222;opacity:0.7;border-radius:50px; ">
    <img style="height: 80px;width: 80px;margin: 10px 10px;border-radius: 40px;" src="${pageContext.request.contextPath}/resource/image/${jsp.headfile}"/>
    <a id="in" onmouseover="a()" onmouseout="b()" style="position: absolute;top:50px;left:280px;font-size: 14px;color:red" href="#">商铺介绍</a>
    <font class="font1">店主：</font><font class="font11">${sessionScope.jsp.username}</font>
    <font class="font2">联系方式：</font><font class="font22">${sessionScope.jsp.phone}</font>
</div>
<div style="opacity:0.7;width: 100%;height: 20px;background: #080000;"></div>
<div style="opacity:0.7;height:600px;width: 100%;background: #222222;"></div>
<div id="mydiv"></div>
<div id="mydivv" style="display:none;height: 70px;width: 240px;background: #272727;position: absolute;top: 120px;left: 180px;">
    <br>${pageContext.request.contextPath}/resource/image/${jsp.headfile}
    <font style="opacity:0.9;font-size: 14px;color: #0b0b0b">此页面用于显示当前用户所上架的商品</font>
</div>
<div style="position: absolute;top: 200px;left: 40px;width: 300px;height: 300px;background: white;border: 2px solid #2b2b2b">
    <img width="300px" height="300px" src="${pageContext.request.contextPath}/resource/image/${jsp.headfile}">
</div>
<a href="/view/jsp/user.jsp" style="position: absolute;top: 530px;left:40px;color: red">返回上一页</a>
<div style="height: 400px;width: 900px;position: absolute;top: 160px;left:400px;border: 2px solid white;background: #222222">
    <c:forEach items="${p.getUserShops()}" var="user">
        <a href="/a/shopOperate?shopid=${user.shopid}"><div style="display:block;height: 190px;width: 140px;float: left;margin: 30px 40px;background: #4d4d4d;border: 2px solid whitesmoke">
            <img src="${pageContext.request.contextPath}/uploaddir/${user.shopFile}" width="140px" height="160px"/>
            <div align="center" style="font-size: 14px;color: wheat;font-weight: bolder">${user.shopName}</div>
        </div></a>
    </c:forEach>
    <c:if test="${p.getCurrentPage()==null}">
        <a href="/a/page?currentPage=0" style="position: absolute;top: 360px;left: 300px;">首页</a>
    </c:if>
    <c:if test="${p.getCurrentPage()!=0&&p.getCurrentPage()!=p.getTotalPage()}">
        <a href="/a/page?currentPage=0" style="position: absolute;top: 360px;left: 300px;">首页</a>
        <a href="/a/page?currentPage=${p.getCurrentPage()-1}" style="position: absolute;top: 360px;left: 350px;">上一页</a>
        <a href="/a/page?currentPage=${p.getCurrentPage()+1}" style="position: absolute;top: 360px;left: 420px;">下一页</a>
        <a href="/a/page?currentPage=${p.getTotalPage()}" style="position: absolute;top: 360px;left: 490px;">尾页</a>
    </c:if>
    <c:if test="${p.getCurrentPage() == 0&&p.getTotalPage() !=0}">
        <a href="/a/page?currentPage=${p.getCurrentPage()+1}" style="position: absolute;top: 360px;left: 420px;">下一页</a>
        <a href="/a/page?currentPage=${p.getTotalPage()}" style="position: absolute;top: 360px;left: 490px;">尾页</a>
    </c:if>

    <c:if test="${p.getTotalPage()!=0 && p.getCurrentPage() == p.getTotalPage()}">
        <a href="/a/page?currentPage=0" style="position: absolute;top: 360px;left: 300px;">首页</a>
        <a href="/a/page?currentPage=${p.getCurrentPage()-1}" style="position: absolute;top: 360px;left: 350px;">上一页</a>
    </c:if>
</div>
<script type="text/javascript">
    function a(){
        document.getElementById("mydiv").style.display="block";
        document.getElementById("mydivv").style.display="block";
    }
    function b() {
        document.getElementById("mydiv").style.display="none";
        document.getElementById("mydivv").style.display="none";
    }
</script>
</body>

</html>