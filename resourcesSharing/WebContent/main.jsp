<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ResourcesSharing</title>
<link rel="stylesheet" href="css/main.css">
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<script type="text/javascript">
//对所有父菜单添加点击事件
//live("事件名，多个事件使用空格分隔")
 $("dt").live("click",function(){
	$(this).siblings().slideToggle();
}) 
</script>




<script>
		//第一步，创建XMLHttpRequest对象
		 var xmlHttp = new XMLHttpRequest();
		
	        function comment(deliver,pid) {
	        	
	        	var comment=$("."+pid).val();
	        	var url="/resourcesSharing/comment?pid="+pid+"&comment="+comment;
	            //get请求
	            xmlHttp.open("post",url, true);
	            xmlHttp.send();
	            
	        	
	            xmlHttp.onreadystatechange = function(){
	            	if(xmlHttp.status == 200 && xmlHttp.readyState == 4){ 
	            		var xmlDoc=xmlHttp.responseText;
	            		var data=eval(xmlDoc);
	            		var result="论坛<br><hr color='#000000'>";
	            		for(var i=0;i<data.length;i++){
	 	      				result+="问题："+data[i].question +"<br><br>评论：<br>";
	 	      				var comments=data[i].comment;
	 	      				for(var j=0;j<comments.length;j++){
	 	      					result+=comments[j]+"<br>";
	 	      				}
	 	      				result+="<input  stype='text' id='comment' class=" + data[i].id +" placeholder='输入评论'>";
	 	      				result+="<button onclick='comment(this,"+data[i].id+");'>发表</button>";
	 	      				result+="<hr color='#000000'>";
	 	      				
	 	      			} 
	 	      			$("#articles").html(result);     
	            	}
	           }
	        }
	       
</script>






<style>
body{
    background-image: url("images/mainBackground.jpg");
    background-size: cover;
}
</style>
</head>
<body>

<div class="box">
<!-- 头部 --> 
	<div class="top">
		<a href="/resourcesSharing/userHome">个人中心</a>
	</div>

<!-- 主要内容  -->
	<div class="content">
		<!--资源模块  -->
		<div class="resource">
			<!--静态资源  -->
			<div class="staticResource">静态资源
				<dl>
					<dt style="cursor:pointer">Java</dt>
					<c:forEach items="${javaResource}" var="java">
						<dd>  <a href="/resourcesSharing/jdkInstall">${java.name}</a>  </dd>
					</c:forEach>
				</dl>
			
				<dl>
					<dt style="cursor:pointer">Android</dt>
					<c:forEach items="${androidResource}" var="android">
						<dd>  <a href="/resourcesSharing/androidInstall">${android.name}</a>  </dd>
					</c:forEach>
				</dl>
				<dl>
					<dt style="cursor:pointer">Database</dt>
					<c:forEach items="${databaseResource}" var="database">
						<dd>  <a href="/resourcesSharing/mysqlAction">${database.name}</a>  </dd>
					</c:forEach>
				</dl>
				<dl>
					<dt style="cursor:pointer">Algorithm</dt>
					<c:forEach items="${algorithmResource}" var="algorithm">
						<dd>  <a href="/resourcesSharing/leetcode">${algorithm.name}</a>  </dd>
					</c:forEach>
				</dl>
			</div>
			
			<!--动态资源  -->
			<div class="dynamicResource">动态资源</div>
		</div>
		
		
		 
		
		
		<!--论坛模块  -->
		<div class="article" id="articles">论坛<br>
		<hr color="#000000">
			 <c:forEach items="${posts}" var="post">
				问题${post.id }：${post.question } <br><br>
				评论：<br>
				<c:forEach items="${post.comment }" var="comment">
					${comment}<br>
				</c:forEach><br>
				<input  type="text" id="comment" class="${post.id}" placeholder="输入评论">  
				<button onclick="comment(this,${post.id});">发表</button>
				<hr color="#000000">
			</c:forEach> 
		</div>
		
		
	</div>
<!-- 尾部  -->
	<div class="footer">
    <span>仅供学习交流，请勿用于任何商业用途</span>
    <i>如果有任何问题，请联系管理员QQ:2608194130</i>    
    </div> 
	
</div> 


</body>
</html>