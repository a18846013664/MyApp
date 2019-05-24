<%--
  Created by IntelliJ IDEA.
  User: 17149
  Date: 2019/1/17
  Time: 13:49
  To change this template use File | Settings | File Templates.
--%>
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

        #result{
            position:relative;
            top: 40px;left: 200px;
            border-radius:25px;
            width: 200px;
            height:140px;
            border:1px solid white;
            opacity: 0.5;
        }
        #result1{
            position:relative;
            top: -105px;left: 550px;
            border-radius:25px;
            width: 200px;
            height:140px;
            border:1px solid white;
            opacity: 0.5;
        }
        #result2{
            position:relative;
            top: -250px;left: 900px;
            border-radius:25px;
            width: 200px;
            height:140px;
            border:1px solid white;
            opacity: 0.5;
        }
        #result img{
            border-radius:25px;
            width: 200px;
            height:140px;
        }
        #result1 img{
            border-radius:25px;
            width: 200px;
            height:140px;
        }
        #result2 img{
            border-radius:25px;
            width: 200px;
            height:140px;
        }
        .input{
            position: relative;
            top: -40px;
            left: 40px;
            width: 70px;

        }
        .ca{
            position: absolute;
            top: 223px;
            left: 255px;
        }
        .cb{
            position: absolute;
            top: 223px;
            left: 615px;
        }
        .cc{
            position: absolute;
            top: 223px;
            left: 975px;
        }
    </style>
</head>
<body style="background: url(../../../uploaddir/timg0.gif);background-repeat:no-repeat;background-size:100% 100%;">
<div style="width: 100%;height: 220px;">
    <font style="position: absolute;top: 5px;left: 20px;font-weight: bolder;color: #ddf2f7">上架商品</font>
    <div id = "result"></div>
    <div id = "result1"></div>
    <div id = "result2"></div>
    <form action="/a/upShop" method="post" enctype="multipart/form-data">
        <input type="hidden" name="uid" value="${sessionScope.jsp.id}">
        <input id="pic" class="input ca" id="file" type="file" name="files" accept = "image/*" onchange = "selectFile()"/>
        <input id="pic1" class="input cb" id="file1" type="file" name="files" accept = "image/*" onchange = "selectFilea()"/>
        <input id="pic2" class="input cc" id="file2" type="file" name="files" accept = "image/*" onchange = "selectFileb()"/>
        <div style="width: 650px;height: 40px;background:#9faeb2;opacity:0.7;position: absolute;top: 300px;left: 325px">
            <label style="color:black;position: relative;top: 8px;left: 45px;font-size: 14px ;font-weight: bolder">商&nbsp;品&nbsp;名&nbsp;称</label>
            <input style="position: relative;top: 3px;left: 100px;height: 30px;width: 470px" type="text" name="shopName">
        </div>
        <div style="width: 650px;height: 40px;background:#9faeb2;opacity:0.7;position: absolute;top: 360px;left: 325px">
            <label style="color:black;position: relative;top: 8px;left: 45px;font-size: 14px ;font-weight: bolder">商&nbsp;品&nbsp;类&nbsp;型</label>
            <select name="shopSimple" style="position: relative;top: 3px;left: 100px;height: 30px;width: 474px;color:red;font-weight: bolder">
                <option value="宠物">宠物</option>
                <option value="电子">电子</option>
                <option value="农产品">农产品</option>
                <option value="衣服">衣服</option>
                <option value="电器">电器</option>
                <option value="文具">文具</option>
                <option value="体育">体育</option>
            </select>
            <%--<!--            <%&#45;&#45;<input style="position: relative;top: 3px;left: 100px;height: 30px;width: 280px" type="text" name="shopSimple">&#45;&#45;%>-->--%>
        </div>
        <div style="width: 650px;height: 40px;background:#9faeb2;opacity:0.7;position: absolute;top: 420px;left: 325px">
            <label style="color:black;position: relative;top: 8px;left: 45px;font-size: 14px ;font-weight: bolder">商&nbsp;品&nbsp;详&nbsp;述</label>
            <input style="position: relative;top: 3px;left: 100px;height: 30px;width: 470px" type="text" name="shopX">
        </div>
        <div style="width: 650px;height: 40px;background:#9faeb2;opacity:0.7;position: absolute;top: 480px;left: 325px">
            <label style="color:black;position: relative;top: 8px;left: 45px;font-size: 14px ;font-weight: bolder">商&nbsp;品&nbsp;价&nbsp;格</label>
            <input style="position: relative;top: 3px;left: 100px;height: 30px;width: 470px" type="text" name="shopPrice">
        </div>
        <div style="width: 650px;height: 40px;background:#9faeb2;opacity:0.7;position: absolute;top: 540px;left: 325px">
            <label style="color:black;position: relative;top: 8px;left: 45px;font-size: 14px ;font-weight: bolder">商&nbsp;品&nbsp;库&nbsp;存</label>
            <input style="position: relative;top: 3px;left: 100px;height: 30px;width: 470px" type="text" name="shopSize">
        </div>
        <input style="position: relative;top: -50px;left: 1080px;width: 160px;height: 120px;font-size: 30px;font-weight: bolder;color: red" type="submit" value="上传">
    </form>
</div>
<div style="width: 100%;height:30px;"></div>
<div style="width: 100%;height:400px;">
    <div style="position: relative;top: 40px;left:30px;width: 260px;height: 240px;">
        <p style="font-size: 14px;font-weight: bolder;width: 200px;position: relative;top: 100px;left: 30px;color: white">此页面仅用于商品的上传，简述只能上传十字以内</p>
    </div>
</div>
<a href="/view/jsp/user.jsp" style="position: absolute;top: 10px;right: 50px;text-decoration: white;color: white">返回上一页</a>
<script type="text/javascript">
    //var files = document.getElementById('pic').files;
    var form = new FormData();//通过HTML表单创建FormData对象
    var url = '127.0.0.1:8080/'
    function selectFile() {
        var files = document.getElementById('pic').files;
        console.log(files[0]);
        if (files.length == 0) {
            return;
        }
        var file = files[0];
        //把上传的图片显示出来
        var reader = new FileReader();
        // 将文件以Data URL形式进行读入页面
        console.log(reader);
        reader.readAsBinaryString(file);
        reader.onload = function (f) {
            var result = document.getElementById("result");
            var src = "data:" + file.type + ";base64," + window.btoa(this.result);
            result.innerHTML = '<img src ="' + src + '"/>';
        }
        console.log('file', file);
        ///////////////////
        form.append('file', file);
        console.log(form.get('file'));
    }
    var form = new FormData();//通过HTML表单创建FormData对象
    var url = '127.0.0.1:8080/'
    function selectFilea() {
        var files = document.getElementById('pic1').files;
        console.log(files[0]);
        if (files.length == 0) {
            return;
        }
        var file = files[0];
        //把上传的图片显示出来
        var reader = new FileReader();
        // 将文件以Data URL形式进行读入页面
        console.log(reader);
        reader.readAsBinaryString(file);
        reader.onload = function (f) {
            var result = document.getElementById("result1");
            var src = "data:" + file.type + ";base64," + window.btoa(this.result);
            result.innerHTML = '<img src ="' + src + '"/>';
        }
        console.log('file', file);
        ///////////////////
        form.append('file', file);
        console.log(form.get('file'));
    }
    var form = new FormData();//通过HTML表单创建FormData对象
    var url = '127.0.0.1:8080/'
    function selectFileb() {
        var files = document.getElementById('pic2').files;
        console.log(files[0]);
        if (files.length == 0) {
            return;
        }
        var file = files[0];
        //把上传的图片显示出来
        var reader = new FileReader();
        // 将文件以Data URL形式进行读入页面
        console.log(reader);
        reader.readAsBinaryString(file);
        reader.onload = function (f) {
            var result = document.getElementById("result2");
            var src = "data:" + file.type + ";base64," + window.btoa(this.result);
            result.innerHTML = '<img src ="' + src + '"/>';
        }
        console.log('file', file);
        ///////////////////
        form.append('file', file);
        console.log(form.get('file'));
    }
</script>
</body>
</html>