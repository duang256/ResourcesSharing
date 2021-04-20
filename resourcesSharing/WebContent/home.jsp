<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心</title>
</head>
<body>

<form action="/resourcesSharing/updateUserInfo" method="get">
	用户名：<input type="text" name="username" value="${user.username}"><br>
	注册时间<input type="text" name="registerTime" value="${user.registerTime}"><br>
	擅长领域<input type="text" name="centainFields" value="${user.centainFields}"><br>
	
	性别<input type="text" name="sex" value="${user.sex}"><br>
	生日<input type="text" name="birthday" value="${user.birthday}"><br>
	
	<input type="submit" value="提交">
</form>

<br><br>
修改密码：
<form action="/resourcesSharing/updatepassword" method="post">
	原密码：<input name="oldPassword" type="Password"><br>
	新密码：<input name="newPassword" type="password"><br>
	<input type="submit" value="提交">
</form>

</body>
</html>