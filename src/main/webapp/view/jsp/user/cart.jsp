<%--
  Created by IntelliJ IDEA.
  User: 17149
  Date: 2019/1/24
  Time: 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style type="text/css">
        a:hover{
            color: #b5a792;
        }
        .th{
            color: #6d6d6d;
            background: #0b0b0b;
            width: 120px;
        }
        .delete{
            color: #999999;
        }
        a{
            text-decoration: white;
        }
        *{
            padding: 0;
            margin: 0;
        }

        .wq:hover{
            color: #070707;
        }
    </style>
</head>
<body style="width: 100%;height: 100%;background: url(../../../uploaddir/7852.gif);background-repeat:no-repeat;background-size:100% 100%;">
<div style="width: 100%;height: 100px;background: #1c1c1c;opacity: 0.7">
    <img src="${pageContext.request.contextPath}/resource/image/${jsp.headfile}" width="80px" height="80px" style="border-radius: 40px;background: white;border: 2px solid white">
    <a class="wq" href="/view/jsp/user/enterShop.jsp" style="position: absolute;top: 50px;left: 600px;color: white">首&nbsp;&nbsp;页</a>
    <a class="wq" href="#" style="position: absolute;top: 50px;left: 700px;color: white">账户信息</a>
    <a class="wq" href="/a/clearCart" style="position: absolute;top: 50px;left: 820px;color: white">清空购物车</a>
    <a class="wq" href="/a/Order?currentPage=0" style="position: absolute;top: 50px;left: 955px;color: white">我的订单</a>
    <div style="width:100%;height:510px;background: #222222">
        <div style="float: left;margin: 10px 30px 0px 200px;color: red;font-weight: bolder;">我的购物车</div>
        <c:if test="${empty carts}">
            <div style="float:right;margin: 150px 350px 0px 50px;border:2px solid white">
                <font color="red" style="font-size: 35px;font-weight: bolder">
                    您的购物车为空，快去选购商品吧！！
                </font>
            </div>
        </c:if>
        <c:if test="${not empty carts }">
            <div style="float:right;margin: 50px 280px 0px 50px">
                <table>
                    <tbody>
                    <tr>
                        <th class="th" style="font-weight: bolder;color:#9c9c9c">图片</th>
                        <th class="th" style="font-weight: bolder;color:#9c9c9c">商品</th>
                        <th class="th" style="font-weight: bolder;color:#9c9c9c">价格</th>
                        <th class="th" style="font-weight: bolder;color:#9c9c9c">数量</th>
                        <th class="th" style="font-weight: bolder;color:#9c9c9c">小计</th>
                        <th class="th" style="font-weight: bolder;color:#9c9c9c">操作</th>
                    </tr>
                    <c:forEach items="${carts.list}" var="items">
                        <tr>
                            <td class="th" align="center" style="font-weight: bolder;color:red">
                                <a href="/a/shopOperate?shopid=${items.userShop.shopid}">
                                    <input type="hidden" name="shopid" value="${items.userShop.shopid}">
                                    <img src="${pageContext.request.contextPath}/uploaddir/${items.userShop.shopFile}" width="120" height="70">
                                </a>
                            </td>
                            <td class="th" align="center" style="font-weight: bolder;color:red">
                                <a target="_blank">${items.userShop.shopName}</a>
                            </td>
                            <td class="th" align="center" style="font-weight: bolder;color:red">
                                ￥${items.userShop.shopPrice}
                            </td>
                            <td class="th" align="center" style="font-weight: bolder;color:red">
                                <input type="text" name="num" value="${items.num}" maxlength="4" size="10">
                            </td>
                            <td class="th" align="center" style="font-weight: bolder;color:red">
                                <span>￥${items.subTotal}</span>
                            </td>
                            <td class="th" align="center" style="font-weight: bolder;color:red">
                                <a href="#" id="${items.userShop.shopid}" class="delete" style="font-weight: bolder;color:red">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div style="float:right;margin: 20px 400px 0px 50px">
                <em style="color: white;font-weight: bolder">赠送积分:</em>&nbsp;&nbsp;&nbsp;<font color="#f5deb3">${carts.total}</font>&nbsp;&nbsp;&nbsp;
                <em style="color: white;font-weight: bolder">商品金额</em>&nbsp;&nbsp;&nbsp;<font color="#f5deb3">${carts.total}元</font>&nbsp;&nbsp;&nbsp;
                <a href="#" style="color: red;font-weight: bolder;font-size: 16px">提交订单</a>
            </div>
        </c:if>
        <div style="width: 100%;height: 200px;background:#070707;float: right;margin: 110px 0px 0px 0px">
            <a href="#" style="float: left;margin: 30px 0px 0px 30px;color: white">友情链接：棚户区改造&nbsp;黑龙江宣传片拍摄&nbsp;桥梁设计</a>
            <div style="color: white">
                <font style="font-size:13px;float: left;margin: 100px 0px 0px 150px;">Copyright@淘乐乐购物车平台CNZZTD</font>
                <font style="font-size: 13px;float: left;margin: 120px 0px 0px -220px">客服电话：18846013664&nbsp;&nbsp;&nbsp;&nbsp;版权所有</font>
            </div>
        </div>
    </div>
</div>
<script src="http://libs.baidu.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript">
    $(function () {
        $(".delete").click(function () {
            if(confirm("确认删除？")){
                //获取到删除商品的id
                var shopid = this.id;
                window.location.href="/a/removeCartItem?shopid="+shopid;
            }
        })
    })
</script>
</body>
</html>
