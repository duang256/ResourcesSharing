<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ResourcesSharing</title>
<link rel="stylesheet" href="css/login.css">
<script type="text/javascript">
	function loginMouseOver(login){
		login.setAttribute('style', 'background-color:#2E9AFE');
	}
	function loginMouseOut(login){
		login.setAttribute('style', 'background-color:#D8D8D8');
	}
</script>
<style>
body{
    background-image: url("images/loginBackground.jpg");
    background-size: cover;
}
.header {
    padding-top: 150px;
    text-align: center;
    color: white;
}
.login{
	background-color: #D8D8D8;
	margin-bottom: 15px;
}



/* 标题 */
</style>
</head>
<body>
<div class="header">
  <h1>论坛</h1>
</div>
<div class="box">
 <form class="form-box" action="/resourcesSharing/login" method="post">
    <div class="inputBox">
        <input type="text" name="username" placeholder="用户名" required="">
    </div>
    <div class="inputBox">
        <input type="password" name="password" placeholder="密码" required="">
    </div>
    <div align="center"  class="login" onmouseover="loginMouseOver(this)" onmouseout="loginMouseOut(this)">
   		 <input type="submit" style="color: #000000" value="登录">
    </div>
    <div align="right">
	    <!--注册  -->
	 	<a href="/resourcesSharing/register.jsp" style="color: #FFFFFF">注册</a>
    </div>
 </form>
  </div>
</body>
</html>