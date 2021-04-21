<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ResourcesSharing</title>
<link rel="stylesheet" href="css/login.css">
<style>
body{
    background-image: url("images/loginBackground.jpg");
    background-size: cover;
}
/* 标题 */
.header {
    padding-top: 150px;
    text-align: center;
    color: white;
}
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
    <input type="submit"  value="提交">
    <!--注册  -->
 	<a href="/resourcesSharing/register.jsp" >注册</a>
 </form>
  </div>
</body>
</html>