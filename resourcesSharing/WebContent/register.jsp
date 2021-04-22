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
</head>
<body>
<form action="/resourcesSharing/register" method="post" class="box">

	<div class="inputBox">
    	   <input type="text" name="username" placeholder="用户名" required=""><br>
    </div>
    <div class="inputBox">
    	   <input type="password" name="password" placeholder="密码" required=""><br>
    </div>
    <div class="inputBox" >
    	    <input type="submit"  value="注册">
    </div>
	
</form>
</body>
</html>