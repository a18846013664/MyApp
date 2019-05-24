<%--
  Created by IntelliJ IDEA.
  User: 17149
  Date: 2019/1/13
  Time: 20:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style type="text/css">
        .background{
            width: 100%;
            height: 600px;
            background: url("../../../uploaddir/timg0.gif");
            background-repeat:no-repeat;
            background-size:100% 100%;
        }
        .a{

            border:1px solid red;
            height: 100px;
            width: 100px;

        }
        #result{
            position:relative;
            top: 50px;left: 130px;
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
        .input{
            position: relative;
            top: -40px;
            left: 40px;
            width: 70px;
        }
        label{
            font-size: 16px;
            font-weight: bolder;
            color: #1b1c1c;
        }
        @-moz-document url-prefix() { input { width:65px; } }/*单独对火狐进行设置*/
    </style>
</head>
<body>
<div class="background">
    <div style="width: 400px;height: 500px;position: absolute;top: 50px;left: 450px;border: 1px solid black">
        <form action="/registerSuccess" method="post" enctype="multipart/form-data">
            <div id = "result"></div>
            <input id="pic" class="input" id="file" type="file" name="file" accept = "image/*" onchange = "selectFile()"/>
            <label style="position: absolute;top: 240px;right: 300px;color: white;">用&nbsp;&nbsp;&nbsp;&nbsp;户:</label>
            <input style="color:black;position: absolute;top: 240px;right: 110px" id="username" type="text" name="username"><div style="position: absolute;top: 240px;right: 10px" id="message"></div>
            <label style="color:white;position: absolute;top: 270px;right: 300px">密&nbsp;&nbsp;&nbsp;&nbsp;码:</label>
            <input style="color:black;position: absolute;top: 270px;right: 110px" id="password" type="password" name="password">
            <label style="color:white;position: absolute;top: 300px;right: 300px">确认密码:</label>
            <input style="color:black;position: absolute;top: 300px;right: 110px" id="rpassword" onchange="f1()" type="password" name="Rpassword"><div id="again" style="position: absolute;top: 300px;right: 20px;color: green"></div>
            <label style="color:white;position: absolute;top: 330px;right: 300px">性&nbsp;&nbsp;&nbsp;&nbsp;别:</label>
            <label style="color:white;position: absolute;top: 330px;right: 250px">男</label>
            <input style="color:black;position: absolute;top: 330px;right: 230px" id="male" type="radio" name="sex" value="0">
            <label style="color:white;position: absolute;top: 330px;right: 190px">女</label>
            <input style="color:black;position: absolute;top: 330px;right: 170px" id="female" type="radio" name="sex" value="1">
            <label style="color:white;position: absolute;top: 360px;right: 300px">电&nbsp;&nbsp;&nbsp;&nbsp;话:</label>
            <input style="color:black;position: absolute;top: 360px;right: 110px" onchange="f()" id="phone" type="text" name="phone">
            <input style="color:brown;position: absolute;top: 450px;right: 30px" disabled="disabled" id="submit" type="submit" value="注册">
        </form>
    </div>
</div>
<!-- <button onclick = "handIn()">提交</button> -->
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
</script>
<script src="http://libs.baidu.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript">
    function f1() {
        if ($("#password").val()!=$("#rpassword").val()){
            document.getElementById("again").innerHTML="密码不一致";
        }else {
            document.getElementById("again").innerHTML="密码一致！";
        }
    }
    function f() {
        var file = document.getElementById('file');
        var username = document.getElementById('username');
        var password = document.getElementById('password');
        var rpassword = document.getElementById('rpassword');
        var male = document.getElementById('male');
        var female = document.getElementById('female');
        var phone = document.getElementById('phone');
        var submit = document.getElementById('submit');
        if (($("#username").val()!="")&&($("#file").val()!="")&&($("#password").val()!="")
            &&($("#male").val()!=""||($("#female").val()!=""))&&($("#phone").val()!="")){
            if ($("#password").val()!=$("#rpassword").val()) {
                document.getElementById("phone").value="";
                submit.disabled = true;
            }else {
                submit.disabled = false;
            }
        }

        /*if (password.innerHTML==""){
            rpassword.disabled="disabled";
        }*/
        /*if(file.innerHTML!=""&&username.innerHTML!=""&&password.innerHTML!=""&&(male.innerHTML!=""||female.innerHTML!="")||phone.innerHTML!=""){
            submit.disabled=false;
        }*/
    }
    $(function () {
        $("/*:input[name='username']*/#username").change(function () {
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
