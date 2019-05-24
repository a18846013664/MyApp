<%--
Created by IntelliJ IDEA.
User: 17149
Date: 2019/2/21
Time: 14:37
To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    </style>

</head>
<body>
<div style="width: 100%;height: 70px;background: #1b1c1c">
    <div style="border-radius:25px;width: 300px;height: 50px;background:#383a3a;position: absolute;top: 10px;left: 10px">
        <font style="font-weight: bolder;font-size: 25px;color: white;position: relative;top: 8px;left: 55px">谢&nbsp;谢&nbsp;您&nbsp;的&nbsp;光&nbsp;临</font>
        <a href="/view/jsp/user/enterShop.jsp" style="position: absolute;top: 15px;left: 500px;width: 50px">首页</a>
        <a href="/a/shopPage?currentPage=0" style="position: absolute;top: 15px;left: 600px;width: 50px">商城</a>
        <a href="/a/Order?currentPage=0" style="position: absolute;top: 15px;left: 700px;width: 50px">订单</a>
        <a href="*" style="position: absolute;top: 15px;left: 800px;width: 50px">领券</a>
        <a href="/view/jsp/user/cart.jsp" style="position: absolute;top: 15px;left: 900px;width: 100px">我的购物车</a>
        <a href="*" style="position: absolute;top: 15px;left: 1040px;width: 100px">加入我们</a>
        <a href="/view/jsp/user.jsp" style="position: absolute;top: 15px;left: 1180px;width: 100px"><font color="white">${sessionScope.jsp.username}</font></a>
    </div>
</div>
<div style="width: 100%;height: 500px;background: #383a3a">
    <div style="width: 780px;height: 500px;background: #222222">
        <c:forEach items="${shopSrcs}" var="s">
            <img src="${pageContext.request.contextPath}/uploaddir/${s}" width="200px" height="160px" style="border: 4px solid #020000;float: left;margin: 10px 23px"/>
        </c:forEach>
    </div>
    <div style="height: 280px;width: 740px;position: absolute;top: 260px;left: 20px;background: #383a3a">
        <div style="font-size: 15px;font-weight: bolder;margin: 50px 0px 0px 60px;color: red">产品名称：${shop.shopName}</div>
        <div style="font-size: 15px;font-weight: bolder;margin: 20px 0px 0px 60px;color: red">产品类型：${shop.shopSimple}</div>
        <div style="font-size: 15px;font-weight: bolder;margin: 20px 0px 0px 60px;color: red">产品价格：${shop.shopPrice}</div>
        <div style="font-size: 15px;font-weight: bolder;margin: 20px 0px 0px 60px;color: red">产品描述：${shop.shopX}</div>
        <div style="font-size: 15px;font-weight: bolder;margin: 20px 0px 0px 60px;color: red">
            <div style="position: absolute;top: 20px;left: 380px;width: 340px;height: 250px;background: #2d2f2f">
                <img src="${pageContext.request.contextPath}/resource/image/${jsp.headfile}" width="340px" height="250px">
            </div>
        </div>
    </div>
    <div style="width: 500px;height: 500px;position: absolute;top: 70px;left: 800px;background: #222222">
        <form action="/a/ding" method="post">
        <font color="white" style="position:absolute;top: 10px;left: 20px">我的地址：</font>
            <input type="hidden" name="shopid" value="${shop.shopid}">
            <div style="position: absolute;top: 400px;right: 1022px;width:200px">
                <label style="color: red">购买数量:</label>
                <input id="num" type="text" name="num" value="1" style="width: 100px;">
            </div>

        <div style="position: absolute;top: 60px;left: 10px"><font color="white">省：</font>
            <select id="apple" name="province">
                <option value="">请选择...</option>
                <c:forEach items="${locations}" var="location">
                    <option value="${location.id}">${location.city}</option>
                </c:forEach>
            </select>
        </div>
        <div  style="position: absolute;top: 60px;left: 170px"><font color="white">市：</font>
            <select id="department" name="dept">
                <option value="">请选择...</option>
            </select>
        </div>
        <div style="position: absolute;top: 60px;left: 330px"><font color="white">区：</font>
            <select id="parten" name="parten">
                <option value="">请选择...</option>
            </select>
        </div>
        <div style="position: absolute;top: 130px;left: 10px">
            <font color="white">详细地址：</font><input name="address" type="text">
        </div>
        <div style="position: absolute;top: 200px;left: 10px">
            <font color="white">联系电话：</font><input name="phone" type="number" max="90000000000">
        </div>
        <input style="position: absolute;top: 270px;left: 380px" type="submit" value="确认下单">
        </form>
    </div>

</div>
<div style="width: 100%;height: 200px;background:black;">
    <a href="#" style="float: left;margin: 30px 0px 0px 30px;color: white">友情链接：棚户区改造&nbsp;黑龙江宣传片拍摄&nbsp;桥梁设计</a>
    <div style="color: white">
        <font style="font-size:13px;float: left;margin: 100px 0px 0px 150px;">Copyright@淘乐乐购物车平台CNZZTD</font>
        <font style="font-size: 13px;float: left;margin: 120px 0px 0px -220px">客服电话：18846013664&nbsp;&nbsp;&nbsp;&nbsp;版权所有</font>
    </div>
</div>
<script src="http://libs.baidu.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#apple").change(function () {
            $("#department option:not(:first)").remove();
            var app = $(this).val();

            /*var password = $("#password").val();*/
            if (app != ""){
                var url = "/apple";
                var args = {"locationId":app,"time":new Date()};
                $.getJSON(url,args,function (data) {
                    if (data.length == 0){
                        alert("该省份不配送")
                    } else{
                        for(var i = 0 ; i < data.length ; i++){
                            var depId = data[i].id;
                            var deptName = data[i].name;
                            $("#department").append("<option value='"+depId+"'>"+deptName+"</option>");
                        }
                    }
                });
            }


        });
    });
    $(function () {
        $("#department").change(function () {
            $("#parten option:not(:first)").remove();
            var aqq = $(this).val();
            if (aqq != ""){
                var url = "/pear";
                var args = {"depid":aqq,"time":new Date()};
                $.getJSON(url,args,function (data) {
                    if (data.length==0){
                        alert("该区域不配送")
                    } else{
                        for(var i = 0 ; i < data.length ; i++){
                            var partId = data[i].id;
                            var partName = data[i].name;
                            $("#parten").append("<option value='"+partId+"'>"+partName+"</option>");
                        }
                    }
                });
            }

        })
    })
</script>
</body>
</html>


