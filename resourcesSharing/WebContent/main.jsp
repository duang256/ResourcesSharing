<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ResourcesSharing</title>
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
	 	      				result+="问题"+(i+1)+"："+data[i].question +"<br><br>";
	 	      				var comments=data[i].comment;
	 	      				for(var j=0;j<comments.length;j++){
	 	      					result+=(j+1)+"楼："+comments[j]+"<br>";
	 	      				}
	 	      				result+="<input  stype='text' id='comment' class=" + data[i].id +" placeholder='输入评论'>";
	 	      				result+="<a onclick='comment(this,"+data[i].id+");'><img src='images/comment.png'></a>";
	 	      				result+="<hr color='#000000'>";
	 	      				
	 	      			} 
	 	      			$("#articles").html(result);     
	            	}
	           }
	        }
	       
</script>

<script type="text/javascript">
//第一步，创建XMLHttpRequest对象
var xmlHttp = new XMLHttpRequest();

   function addQuestion() {
   	
   	var question=$("#question").val();
   	var url="/resourcesSharing/addQuestion?question="+question;
       //get请求
       xmlHttp.open("post",url, true);
       xmlHttp.send();
       
   	
       xmlHttp.onreadystatechange = function(){
       	if(xmlHttp.status == 200 && xmlHttp.readyState == 4){ 
       		var xmlDoc=xmlHttp.responseText;
       		var data=eval(xmlDoc);
       		var result="论坛<br><hr color='#000000'>";
       		for(var i=0;i<data.length;i++){
       				result+="问题"+(i+1)+"："+data[i].question +"<br><br>";
      				var comments=data[i].comment;
      				for(var j=0;j<comments.length;j++){
      					result+=(j+1)+"楼："+comments[j]+"<br>";
      				}
      				result+="<input  stype='text' id='comment' class=" + data[i].id +" placeholder='输入评论'>";
      				result+="<a onclick='comment(this,"+data[i].id+");'><img src='images/comment.png'></a>";
      				result+="<hr color='#000000'>";
      				
      		} 
      			$("#articles").html(result);     
      			
       	}
      }
      $("#question").attr("value","");   
   }

</script>





<style>
body{
    background-image: url("images/mainBackground.jpg");
    background-size: cover;
}
/* 标题 */
.header {
    padding: 30px;
    text-align: center;
    color: white;
    
}
.top{
	width:100%;
	height:40px;
	background-color: #E6E6E6;
	margin-bottom: 20px;
	border-radius: 5px;
}

/* 底部 */
.footer {
    padding: 10px;
    text-align: center;
    background: #FFFFFF;
    border-radius: 10px;
}


 .box{
 	padding:20px;
 }
 
.resource{
	
	margin-right:100px;
	display: flex;
	width:25%;
	position:fixed;
	margin-bottom: 20px;
	border-radius: 5px;

}
.staticResource{
	width:300px;
	margin-right: 15px;
	background-color: #FFFFFF;
	border-radius: 10px;
	height: 700px;
}
.content{
	display: flex;
}
.dynamicResource{
	background-color: #FFFFFF;
	width:300px;
	border-radius: 10px;
	height: 700px;
	
	
}
.article{
	width:1000px;
	background-color: #F2F2F2;
	border-radius: 5px;
	background-color: #FFFFFF;
	padding-left: 10px;
}
.navigator{
	margin-bottom: 20px;
	margin-right: 80px;
	float:right; 
	margin-top:20px;
}
#question{
	width: 990px;
	height: 100px;
	resize:none;
	border-radius: 5px;
	font-size: 16px;
	padding:5px;
	
}
#comment{
	width:200px;
	margin-bottom: 5px;
}
#posts{
	margin-left: 650px;
}
</style>
</head>
<body>


<div class="navigator">
	 <a  href="/resourcesSharing/userHome"><img  src="images/home.png"></a>
</div>
<div class="header">
  <h1>论坛</h1>
</div>

<div class="box">



<!-- 主要内容  -->
	<div class="content">
		<!--资源模块  -->
		<div class="resource">
			<!--静态资源  -->
			<div class="staticResource">
			<h3 align="center">静态资源</h3>
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
			<div class="dynamicResource">
				<h3 align="center">动态资源</h3>
			</div>
		</div>
		
		
		
		<div id="posts">
		
			<!--发表问题  -->
			<div>
				<textarea id="question" rows="" cols="" placeholder="发表一个提问"></textarea><br>
				<a  onclick="addQuestion(this);" style="margin-left: 10px"><img src="images/question.png"></a>
			</div>
			
			<!--论坛模块  -->
			<div class="article" id="articles"><br>
				 <hr color="#000000">
				 <c:forEach items="${posts}" var="post" varStatus="sta">
					问题${sta.index+1}：${post.question } <br><br>
					<c:forEach items="${post.comment }" var="comment" varStatus="status">
						       ${status.index+1}楼： ${comment}<br>
					</c:forEach><br>
					<input  type="text" id="comment" class="${post.id}" placeholder="输入评论">  
					<a  onclick="comment(this,${post.id});"><img src="images/comment.png"></a>
					<hr color="#000000">
				</c:forEach> 
			</div>
			
			<div class="footer">
			   <span>仅供学习交流，请勿用于任何商业用途</span>
			    <i>如果有任何问题，请联系管理员QQ:2608194130</i>
			</div>
		
		</div>
		 
		
	</div>
	

    
	
</div> 


</body>
</html>