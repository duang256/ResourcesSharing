<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<script type="text/javascript">
$("dt").live("click",function(){
	$(this).siblings().slideToggle();
}) 
	//第一步，创建XMLHttpRequest对象
	var xmlHttp = new XMLHttpRequest();
	
	/*ajax删除并更新帖子  */
	function delPost(id){
		var url="/resourcesSharing/delPost?id="+id;
		//get请求
        xmlHttp.open("get",url, true);
        xmlHttp.send();
        
        xmlHttp.onreadystatechange = function(){
        	if(xmlHttp.status == 200 && xmlHttp.readyState == 4){ 
        		var xmlDoc=xmlHttp.responseText;
        		var data=eval(xmlDoc);
        		var result="<hr color='#000000'>";
        		for(var i=0;i<data.length;i++){
	      				result+="问题"+(i+1)+"："+data[i].question+"&nbsp&nbsp"+"<a  onclick=\"delPost('"+data[i].id+"');\"> <img  onmouseover='deleteMouseOver(this)' onmouseout='deleteMouseOut(this)' src='images/delete1.png'></a><br><br>";
	      				var comments=data[i].comment;
	      				for(var j=0;j<comments.length;j++){
	      					result+=(j+1) + "楼：" + comments[j] + "<a  onclick=\"delComment('"+comments[j]+"');\"> <img  onmouseover='deleteMouseOver(this)' onmouseout='deleteMouseOut(this)' src='images/delete1.png'></a><br><br>";;
	      				}
	      				result+="<hr color='#000000'>";
	      				
	      			} 
	      			$("#articles").html(result);     
        	}
       }
	}
	/*ajax删除并更新评论  */
	function delComment(comment){
		var url="/resourcesSharing/delComment?comment="+comment;
		//get请求
        xmlHttp.open("get",url, true);
        xmlHttp.send();
        
        xmlHttp.onreadystatechange = function(){
        	if(xmlHttp.status == 200 && xmlHttp.readyState == 4){ 
        		var xmlDoc=xmlHttp.responseText;
        		var data=eval(xmlDoc);
        		var result="<hr color='#000000'>";
        		for(var i=0;i<data.length;i++){
	      				result+="问题"+(i+1)+"："+data[i].question+"&nbsp&nbsp"+"<a  onclick=\"delPost('"+data[i].id+"');\"> <img  onmouseover='deleteMouseOver(this)' onmouseout='deleteMouseOut(this)' src='images/delete1.png'></a><br><br>";
	      				var comments=data[i].comment;
	      				for(var j=0;j<comments.length;j++){
	      					result+=(j+1) + "楼：" + comments[j] + "<a  onclick=\"delComment('"+comments[j]+"');\"> <img  onmouseover='deleteMouseOver(this)' onmouseout='deleteMouseOut(this)' src='images/delete1.png'></a><br><br>";;
	      				}
	      				result+="<hr color='#000000'>";
	      				
	      			} 
	      			$("#articles").html(result);     
        	}
       }
	}
	
	/*ajax删除并更新静态文件 
	更新整个静态区传参不方便，所以对每个块刷新
	*/
	function delJava(name,type){
		var url="/resourcesSharing/delStaticFile?name="+name+"&type="+type;
		//get请求
        xmlHttp.open("get",url, true);
        xmlHttp.send();
        xmlHttp.onreadystatechange = function(){
        	if(xmlHttp.status == 200 && xmlHttp.readyState == 4){ 
        		var xmlDoc=xmlHttp.responseText;
        		var data=eval(xmlDoc);
        		var result="<dt style='cursor:pointer'>Java</dt>";
        		for(var i=0;i<data.length;i++){
        			result+="<dd>  <a href='/resourcesSharing/staticResource?name="+data[i].name+"'>"+data[i].name+"</a>";
        			result+= "<a  onclick=\"delJava('"+data[i].name +"','Java');\">"+"<img  onmouseover='deleteMouseOver(this)' onmouseout='deleteMouseOut(this)' src='images/delete1.png'></a></dd>";
        		}
	      		$("#java").html(result);     
        	}
       }
        
	}
	
	function delAndroid(name,type){
		var url="/resourcesSharing/delStaticFile?name="+name+"&type="+type;
		//get请求
        xmlHttp.open("get",url, true);
        xmlHttp.send();
        xmlHttp.onreadystatechange = function(){
        	if(xmlHttp.status == 200 && xmlHttp.readyState == 4){ 
        		var xmlDoc=xmlHttp.responseText;
        		var data=eval(xmlDoc);
        		var result="<dt style='cursor:pointer'>Android</dt>";
        		for(var i=0;i<data.length;i++){
        			result+="<dd>  <a href='/resourcesSharing/staticResource?name="+data[i].name+"'>"+data[i].name+"</a>";
        			result+= "<a  onclick=\"delAndroid('"+data[i].name +"','Android');\">"+"<img  onmouseover='deleteMouseOver(this)' onmouseout='deleteMouseOut(this)' src='images/delete1.png'></a></dd>";
        		}
	      		$("#android").html(result);     
        	}
       }
        
	}
	function delDatabase(name,type){
		var url="/resourcesSharing/delStaticFile?name="+name+"&type="+type;
		//get请求
        xmlHttp.open("get",url, true);
        xmlHttp.send();
        xmlHttp.onreadystatechange = function(){
        	if(xmlHttp.status == 200 && xmlHttp.readyState == 4){ 
        		var xmlDoc=xmlHttp.responseText;
        		var data=eval(xmlDoc);
        		var result="<dt style='cursor:pointer'>Java</dt>";
        		for(var i=0;i<data.length;i++){
        			result+="<dd>  <a href='/resourcesSharing/staticResource?name="+data[i].name+"'>"+data[i].name+"</a> ";
        			result+= "<a  onclick=\"delDatabase('"+data[i].name +"','Database');\">"+"<img  onmouseover='deleteMouseOver(this)' onmouseout='deleteMouseOut(this)' src='images/delete1.png'></a></dd>";
        		}
	      		$("#database").html(result);     
        	}
       }
        
	}
	function delAlgorithm(name,type){
		var url="/resourcesSharing/delStaticFile?name="+name+"&type="+type;
		//get请求
        xmlHttp.open("get",url, true);
        xmlHttp.send();
        xmlHttp.onreadystatechange = function(){
        	if(xmlHttp.status == 200 && xmlHttp.readyState == 4){ 
        		var xmlDoc=xmlHttp.responseText;
        		var data=eval(xmlDoc);
        		var result="<dt style='cursor:pointer'>Java</dt>";
        		for(var i=0;i<data.length;i++){
        			result+="<dd>  <a href='/resourcesSharing/staticResource?name="+data[i].name+"'>"+data[i].name+"</a> ";
        			result+= "<a  onclick=\"delAlgorithm('"+data[i].name +"','Algorithm');\">"+"<img  onmouseover='deleteMouseOver(this)' onmouseout='deleteMouseOut(this)' src='images/delete1.png'></a></dd>";
        		}
	      		$("#algorithm").html(result);     
        	}
       }
        
	}

	
	function deleteMouseOver(del){
		del.setAttribute("src", "images/delete2.png");
	}
	function deleteMouseOut(del){
		del.setAttribute("src", "images/delete1.png");
	}
</script>

<style type="text/css">
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

#editor{
	background: #E27575;
    border: none;
    padding: 10px 25px 10px 25px;
    color: #FFF;
    box-shadow: 1px 1px 5px #B6B6B6;
    border-radius: 3px;
    text-shadow: 1px 1px 1px #9E3F3F;
    cursor: pointer;
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

	position:fixed;
	right:50px;
	margin-bottom: 20px;
	margin-right: 80px;
	margin-top:20px;
}
#question{
	width: 990px;
	height: 100px;
	resize:none;
	border-radius: 5px;
	font-size: 16px;
	padding:5px;
	margin-bottom: 50px;
	
}
#comment{
	width:300px;
	border-radius: 5px;
	margin-bottom: 5px;
}
#posts{
	margin-left: 650px;
}
a{
	text-decoration:none;
	color: #000000;
	cursor: pointer;
}
.questionImg{
	position:absolute;
	top:290px;
	left:1600px;
}
dt{
	background-color:#D8D8D8;
	font-size: 25px;
	padding-left: 5px;
}
dd{
	font-size: 20px;
}

</style>

</head>
<body>
<div class="box">




<!-- 主要内容  -->
	<div class="content">
		<!--资源模块  -->
		<div class="resource">
			<!--静态资源  -->
			<div class="staticResource">
			<h3 align="center">静态资源</h3>
				<dl id="java">
					<dt style="cursor:pointer">Java</dt>
					<c:forEach items="${javaResource}" var="java">
						<dd>  <a href="/resourcesSharing/staticResource?name=${java.name }">${java.name}</a>
						 <a  onclick="delJava('${java.name}','Java');">
									<img  onmouseover="deleteMouseOver(this)" onmouseout="deleteMouseOut(this)" src="images/delete1.png">
						 </a>
						 </dd>
						
					</c:forEach>
				</dl>
			
				<dl id="android"> 
					<dt style="cursor:pointer">Android</dt>
					<c:forEach items="${androidResource}" var="android">
						<dd>  <a href="/resourcesSharing/staticResource?name=${android.name }">${android.name}</a> 
						<a  onclick="delAndroid('${android.name}','Android');">
									<img  onmouseover="deleteMouseOver(this)" onmouseout="deleteMouseOut(this)" src="images/delete1.png">
						 </a>
						 </dd>
					</c:forEach>
				</dl>
				<dl id="database">
					<dt style="cursor:pointer">Database</dt>
					<c:forEach items="${databaseResource}" var="database">
						<dd>  <a href="/resourcesSharing/staticResource?name=${database.name }">${database.name}</a>
						<a  onclick="delDatabase('${database.name}','Database');">
									<img  onmouseover="deleteMouseOver(this)" onmouseout="deleteMouseOut(this)" src="images/delete1.png">
						</a>
						</dd>
					</c:forEach>
				</dl>
				<dl id="algorithm">
					<dt style="cursor:pointer">算法</dt>
					<c:forEach items="${algorithmResource}" var="algorithm">
						<dd>  <a href="/resourcesSharing/staticResource?name=${algorithm.name }">${algorithm.name}</a> 
						<a  onclick="Algorithm'${algorithm.name}','Algorithm');">
									<img  onmouseover="deleteMouseOver(this)" onmouseout="deleteMouseOut(this)" src="images/delete1.png">
						</a>
						</dd>
					</c:forEach>
				</dl>
				<br><br><br>
				<a href="editor.jsp"><button id="editor" style="display:block;margin:0 auto;">写文章</button></a>
				
			</div>
			
			
		</div>
		
		
		
		<div id="posts">
			<!--论坛模块  -->
			<div class="article" id="articles"><br>
				 <hr color="#000000">
				 <c:forEach items="${posts}" var="post" varStatus="sta">
					问题${sta.index+1}：${post.question } &nbsp&nbsp
					 <a  onclick="delPost(${post.id });">
									<img  onmouseover="deleteMouseOver(this)" onmouseout="deleteMouseOut(this)" src="images/delete1.png">
					 </a><br><br>
					<c:forEach items="${post.comment }" var="comment" varStatus="status">
						       ${status.index+1}楼： ${comment} &nbsp&nbsp
						       <a  onclick="delComment('${comment}')">
									<img  onmouseover="deleteMouseOver(this)" onmouseout="deleteMouseOut(this)" src="images/delete1.png">
							   </a>
							   <br><br>
					</c:forEach><br>
					<hr color="#000000">
				</c:forEach> 
			</div>
		</div>
		 
		
	</div>
	

    
	
</div> 
</body>
</html>