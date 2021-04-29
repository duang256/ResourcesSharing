<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body {
    background-image: url("images/mainBackground.jpg");
    background-size: cover;
}
.box{
	background-color: white;
	margin-left:100px;
	margin-right:100px;
	margin-top:50px;
	padding:30px;
}
pre{
	background-color: rgba(0,0,0,.75);
	color: #FFFFFF;
}
p{
	font-size: 18px;
    color: #4d4d4d;
    font-weight: 400;
    line-height: 26px;
    }
img{
	margin:20px;
	width: 800px;
}
.content{
font-size: 18px;
color: #4d4d4d;
font-weight: 400;
line-height: 26px;}
</style>
</head>
<body>
	<div class="box">
		<div class="content" id="content">${html}</div>
	</div>
</body>
</html>