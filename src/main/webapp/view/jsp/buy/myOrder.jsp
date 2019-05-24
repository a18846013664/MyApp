<%--
  Created by IntelliJ IDEA.
  User: 17149
  Date: 2019/2/25
  Time: 8:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
            color: red;
            font-size: 16px;
            text-decoration: white;
        }
        .username{
            position: absolute;
            top: 215px;
            left: 60px;
        }
        .sex{
            position: absolute;
            top: 285px;
            left: 60px;
        }
        .account{
            position: absolute;
            top: 355px;
            left: 60px;
        }
        .phone{
            position: absolute;
            top: 425px;
            left: 60px;
        }
    </style>
</head>
<body>
<div style="width: 100%;height: 70px;background: #1b1c1c">
    <div style="border-radius:25px;width: 300px;height: 50px;background:#383a3a;position: absolute;top: 10px;left: 10px">
        <font style="font-weight: bolder;font-size: 25px;color: white;position: relative;top: 8px;left: 55px">谢&nbsp;谢&nbsp;您&nbsp;的&nbsp;光&nbsp;临</font>
        <a href="*" style="position: absolute;top: 15px;left: 600px;width: 50px">首页</a>
        <a href="*" style="position: absolute;top: 15px;left: 700px;width: 50px">商城</a>
        <a href="*" style="position: absolute;top: 15px;left: 800px;width: 50px">领券</a>
        <a href="*" style="position: absolute;top: 15px;left: 900px;width: 100px">我的购物车</a>
        <a href="*" style="position: absolute;top: 15px;left: 1040px;width: 100px">加入我们</a>
        <a href="*" style="position: absolute;top: 15px;left: 1180px;width: 100px"><font color="white">${sessionScope.jsp.username}</font></a>
    </div>
</div>
<div style="width: 100%;height: 500px;background: #383a3a">
    <div style="position:absolute;height: 481px;width: 280px;top: 81px;left: 20px;background: #222222">
        <div style="position:relative;top: 20px;left: 20px;width: 240px;height:160px;background: white">
            <img src="${pageContext.request.contextPath}/resource/image/${jsp.headfile}" width="240px" height="160px">
        </div>
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
    </div>
    <div style="height: 480px;width: 1020px;position: absolute;top: 80px;left:310px;border: 2px solid #222222;background:#222222">
        <c:forEach items="${ps.getOrders()}" var="us">
            <a href="/a/shopOperate?shopid=${us.shopid}"><div style="display:block;height: 100px;width: 935px;float: left;margin: 5px 40px 0px 40px;background:#878787;border: 2px solid white">
                <img src="${pageContext.request.contextPath}/uploaddir/${us.shopfile}" width="120px" height="100px"/>
                <div style="font-size: 14px;color: white;font-weight: bolder;position: relative;top: -55px;left: 150px">商品:${us.shopname}</div>
                <div style="font-size: 14px;color: white;font-weight: bolder;position: relative;top: -73px;left: 340px">地址:${us.dress}</div>
                <div style="font-size: 14px;color: white;font-weight: bolder;position: relative;top: -93px;left: 710px">联系:${us.phone}</div>
            </div></a>

        </c:forEach>
        <c:if test="${ps.getCurrentPage()==null}">
            <a href="/a/Order?currentPage=0" style="position: absolute;top: 450px;left: 700px;color: red">首页</a>
        </c:if>
        <c:if test="${ps.getCurrentPage()!=0&&ps.getCurrentPage()!=ps.getTotalPage()}">
            <a href="/a/Order?currentPage=0" style="color:red;position: absolute;top: 450px;left: 700px;">首页</a>
            <a href="/a/Order?currentPage=${ps.getCurrentPage()-1}" style="color:red;position: absolute;top: 450px;left: 750px;">上一页</a>
            <a href="/a/Order?currentPage=${ps.getCurrentPage()+1}" style="color:red;position: absolute;top: 450px;left: 820px;">下一页</a>
            <a href="/a/Order?currentPage=${ps.getTotalPage()}" style="color:red;position: absolute;top: 450px;left: 890px;">尾页</a>
        </c:if>
        <c:if test="${ps.getCurrentPage() == 0&&ps.getTotalPage() !=0}">
            <a href="/a/Order?currentPage=${ps.getCurrentPage()+1}" style="color:red;position: absolute;top: 450px;left: 820px;">下一页</a>
            <a href="/a/Order?currentPage=${ps.getTotalPage()}" style="color:red;position: absolute;top: 450px;left: 890px;">尾页</a>
        </c:if>

        <c:if test="${ps.getTotalPage()!=0 && ps.getCurrentPage() == ps.getTotalPage()}">
            <a href="/a/Order?currentPage=0" style="color:red;position: absolute;top: 450px;left: 700px;">首页</a>
            <a href="/a/Order?currentPage=${ps.getCurrentPage()-1}" style="color:red;position: absolute;top: 450px;left: 750px;">上一页</a>
        </c:if>
    </div>


</div>
<div style="width: 100%;height: 200px;background:black;">
    <a href="#" style="float: left;margin: 30px 0px 0px 30px;color: white">友情链接：棚户区改造&nbsp;黑龙江宣传片拍摄&nbsp;桥梁设计</a>
    <div style="color: white">
        <font style="font-size:13px;float: left;margin: 100px 0px 0px 150px;">Copyright@淘乐乐购物车平台CNZZTD</font>
        <font style="font-size: 13px;float: left;margin: 120px 0px 0px -220px">客服电话：18846013664&nbsp;&nbsp;&nbsp;&nbsp;版权所有</font>
    </div>
</div>

</body>
</html>


