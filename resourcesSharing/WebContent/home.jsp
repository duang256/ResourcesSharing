<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心</title>
<style type="text/css">
body {
    background-image: url("images/mainBackground.jpg");
    background-size: cover;
}
.basic-grey {
    margin-left:auto;
    margin-right:auto;
    margin-top:70px;
    max-width: 500px;
    background: #F7F7F7;
    padding: 25px 15px 25px 10px;
    font: 12px Georgia, "Times New Roman", Times, serif;
    color: #888;
    text-shadow: 1px 1px 1px #FFF;
    border:1px solid #E4E4E4;
}
.basic-grey h1 {
    font-size: 25px;
    padding: 0px 0px 10px 40px;
    display: block;
    border-bottom:1px solid #E4E4E4;
    margin: -10px -15px 30px -10px;;
    color: #888;
}
.basic-grey h1>span {
    display: block;
    font-size: 11px;
}
.basic-grey label {
    display: block;
    margin: 0px;
}
.basic-grey label>span {
    float: left;
    width: 20%;
    text-align: right;
    padding-right: 10px;
    margin-top: 10px;
    color: #888;
}
.basic-grey input[type="text"], .basic-grey input[type="password"], .basic-grey textarea, .basic-grey select {
    border: 1px solid #DADADA;
    color: #888;
    height: 30px;
    margin-bottom: 16px;
    margin-right: 6px;
    margin-top: 2px;
    outline: 0 none;
    padding: 3px 3px 3px 5px;
    width: 70%;
    font-size: 12px;
    line-height:15px;
    box-shadow: inset 0px 1px 4px #ECECEC;
    -moz-box-shadow: inset 0px 1px 4px #ECECEC;
    -webkit-box-shadow: inset 0px 1px 4px #ECECEC;
}
.basic-grey textarea{
    padding: 5px 3px 3px 5px;
}
.basic-grey select {
    background: #FFF url('down-arrow.png') no-repeat right;
    background: #FFF url('down-arrow.png') no-repeat right);
    appearance:none;
    -webkit-appearance:none;
    -moz-appearance: none;
    text-indent: 0.01px;
    text-overflow: '';
    width: 70%;
    height: 35px;
    line-height: 25px;
}
.basic-grey textarea{
    height:100px;
}
.basic-grey .button {
    background: #E27575;
    border: none;
    padding: 10px 25px 10px 25px;
    color: #FFF;
    box-shadow: 1px 1px 5px #B6B6B6;
    border-radius: 3px;
    text-shadow: 1px 1px 1px #9E3F3F;
    cursor: pointer;
}
.basic-grey .button:hover {
    background: #CF7A7A
}


</style>
</head>
<body>




<form action="/resourcesSharing/updateUserInfo" method="get" class="basic-grey">
    <h1>个人信息
        <span>Please fill all the texts in the fields.</span>
    </h1>
    <label>
        <span>用户名 :</span>
        <input type="text" placeholder="用户名" name="username" id="username" value="${user.username}"><br>
    </label>
    <label>
        <span>注册时间 :</span>
        <input type="text" readonly="readonly"  style="background-color: #E6E6E6" name="registerTime"  id="registerTime" value="${user.registerTime}"><br>
    </label>
    <label>
        <span>擅长领域 :</span>
       <input type="text" placeholder="擅长领域" name="centainFields"  id="centainFields"value="${user.centainFields}"><br>
    </label>
    <label>
        <span>性别 :</span>
       <input type="text" placeholder="性别" name="sex" id="sex" value="${user.sex}"><br>
    </label>
    <label>
        <span>生日 :</span>
       <input type="text" placeholder="生日" name="birthday" id="birthday"value="${user.birthday}"><br>
    </label>
    <label>
        <span>&nbsp;</span>
        <input type="submit" class="button" value="Send" />
    </label>
</form>



<br><br>


	<form action="/resourcesSharing/updatepassword" method="post" class="basic-grey">
		<h1>修改密码
	        <span>Please fill all the texts in the fields.</span>
	    </h1>
		<label>
	        <span>旧密码 :</span>
	        <input name="oldPassword" placeholder="原密码" id="oldPassword" type="password"><br>
	    </label>
	    <label>
	        <span>旧密码 :</span>
	        <input name="newPassword" placeholder="新密码" id="newPassword" type="password"><br>
	    </label>
		<label>
	        <span>&nbsp;</span>
	        <input type="submit" class="button" value="Send" />
	    </label>
	</form>

</body>
</html>