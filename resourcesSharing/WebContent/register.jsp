<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/login.css">
<style type="text/css">
body{
    background-image: url("images/loginBackground.jpg");
    background-size: cover;
}

	
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script>

        function check() {
            var yn = true;
            /*第一点，获取登录页面传进来的参数。特别注意的get到以后一定要.value获取他的value值
            * 注意区别与valueof()的区别。字符串与object对象，属性与方法
            * */
            //var aa=frm.name.value;  通过表单中的id获取value值;
            // 或者 var aa=frm.name.value;通过name获取也可以
            var name = document.getElementById("username").value;
            var pwd = document.getElementById("password").value;

            /*正则表达式
            * 命名为/^   $/
            * 其中^为开始，$为结束符号
            * */
            var names = /^[0-9a-zA-Z]{3,10}$/;  //账号由3-10位数字或字母组成
            var pwds = /^[0-9]{3,10}$/;               //密码仅仅由数字组成

            /*test()方法判断是否符合条件
            *这里要去反!，方便操作，范围大的在前面，范围小的在后面
            *
            * */
            if (!names.test(name)) {
                yn = false;
                /*
                * 根据id找到这个容器，讲内容以html的格式传入到这个容器里面
                * 顺便将他的class值改变，随之而来的就是颜色的改变，
                * 错误显示红色，正确为绿色
                * */
                document.getElementById("nameerror").innerHTML = "<div class='error2' style='color: #FF0000'>*账号由3-10位数字或字母组成</div>";
            }
            else{
            	document.getElementById("nameerror").innerHTML ="";
            }
            /*
            * 同上
            * */
            if (!pwds.test(pwd)) {
                yn = false;
                /*
                * 这里是前面账号已经可以了，只是密码不正确
                * 就重置账号的错误提示
                * */
                document.getElementById("pwderror").innerHTML = "<div class='error2' style='color: #FF0000'>*密码由3-10位数字组成</div>";
            }else{
            	document.getElementById("pwderror").innerHTML ="";
            }
            /*
            * 返回这个boolean代表的值
            * 为true的话就跳转
            * 为false的话就不跳转
            * */
            return yn;
        }
    </script>


</head>
<body>
<form action="/resourcesSharing/register" method="post" class="box">

	<div class="inputBox">
    	   <input type="text" name="username" id="username" placeholder="用户名" required=""><br>
    	   <span id="nameerror"></span>
    </div>
    <div class="inputBox">
    	   <input type="password" name="password"  id="password" placeholder="密码" required=""><br>
    	   <span id="pwderror"></span>
    </div>
    <div class="inputBox" >
    	    <input type="submit"  value="注册" onclick="return check();">
    </div>
	
</form>
</body>
</html>