<%--
  Created by IntelliJ IDEA.
  User: 17149
  Date: 2019/1/16
  Time: 8:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <style type="text/css">
        .div{
            margin: 0px auto;
            width: 500px;
            height: 500px;

        }
        #result{
            position:relative;
            top: 50px;left: 180px;
            border-radius: 50%;
            width: 150px;
            height:150px;
            border:1px solid #eee;
        }
        #result img{
            border-radius: 50%;
            width: 150px;
            height:150px;
        }
    </style>
</head>
<body style="width: 100%;height: 100%;background: url(../../../uploaddir/timg0.gif);background-repeat:no-repeat;background-size:100% 100%;">
<a href="/view/jsp/user.jsp" style="color: white;position: absolute;top: 20px;right: 50px;text-decoration: white">返回上一页</a>
<div class="div">
    <div id = "result" class="head"></div>
    <form action="/a/updateUser" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${sessionScope.jsp.id}">
        <input id="pic" class="input" style="color:white;position: absolute;top: 230px;left: 500px;font-size: 14px" id="file" type="file" name="file" accept = "image/*" onchange = "selectFile()"/>
        <label style="color:white;position: absolute;top: 290px;left: 500px;font-size: 18px">用户:</label>
        <input style="position: absolute;top: 290px;left: 570px;font-size: 18px" id="username" type="text" name="username" value="${sessionScope.jsp.username}"><div style="position: absolute;top: 290px;left: 800px;font-size: 18px" id="message"></div>
        <label style="color:white;position: absolute;top: 370px;left: 500px;font-size: 18px">性别:</label>
        <input style="position: absolute;top: 370px;left: 570px;font-size: 18px" type="text" name="sex" value="${sessionScope.jsp.sex}">
        <label style="color:white;position: absolute;top: 450px;left: 500px;font-size: 18px">电话:</label>
        <input style="position: absolute;top: 450px;left: 570px;font-size: 18px" type="text" name="phone" value="${sessionScope.jsp.phone}">
        <input style="position: absolute;top: 550px;left: 850px;font-size: 18px" type="submit" value="修改">
    </form>
</div>
<script type="text/javascript">
    //var files = document.getElementById('pic').files;
    var form = new FormData();//通过HTML表单创建FormData对象
    var url = '127.0.0.1:8080/'
    function selectFile() {var files = document.getElementById('pic').files;
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
</script>
<script src="http://libs.baidu.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript">
    $(function () {$("/*:input[name='username']*/#username").change(function () {
        /*var val = $(this).val();*/
        /*val = $.trim(val);*/
        var username = $("#username").val();
        /*var password = $("#password").val();*/
        var Username = $.trim(username);
        /*var Password = $.trim(password);*/
        if(Username != ""){
            var url = "/load";
            var args = {"userName":Username,"time":new Date()};
            $.post(url,args,function (data) {
                $("#message").html(data);
            });
        }
    });
    })
</script>
</body>
</html>
