<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
a{
	text-decoration:none;
	color: #000000;
	cursor: pointer;
}	
</style>
</head>

<!-- editormd start -->
    <link href="editormd/css/editormd.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="editormd/editormd.min.js"></script>
    <script type="text/javascript">
  var testEditor;

  testEditor=$(function() {
      editormd("test-editormd", {
           width   : "90%",
           height  : 640,
           //markdown : md,
           codeFold : true,
           syncScrolling : "single",
           //你的lib目录的路径
           path    : "<%=request.getContextPath()%>/editormd/lib/",
           imageUpload: false,//关闭图片上传功能
          /*  theme: "dark",//工具栏主题
           previewTheme: "dark",//预览主题
           editorTheme: "pastel-on-dark",//编辑主题 */
           emoji: false,
           taskList: true, 
           tocm: true,         // Using [TOCM]
           tex: true,                   // 开启科学公式TeX语言支持，默认关闭
           flowChart: true,             // 开启流程图支持，默认关闭
           sequenceDiagram: true,       // 开启时序/序列图支持，默认关闭,
          //这个配置在simple.html中并没有，但是为了能够提交表单，使用这个配置可以让构造出来的HTML代码直接在第二个隐藏的textarea域中，方便post提交表单。
           saveHTMLToTextarea : true            
      });

  });

</script>

<script type="text/javascript">
	function commit(){
		var html=$("#editorhtml").attr("value");
		html=decodeURI(html);
		var name=$("#title").val();
		var type=$("#type").val();
		var url="/resourcesSharing/writeArticle";  
		document.write("<form action='"+url+"' method='post' name='form1' style='display:none'>");  
		document.write("<input type='hidden' name='name' value='" + name+ "'>");  
		document.write("<input type='hidden' name='type' value='" + type+ "'>");  
		document.write("<input type='hidden' name='html' value='" + html+ "'>");  
		document.write("</form>");  
		document.form1.submit();  

		
		
	}

</script>

<body>
	<input id="title" type="text" placeholder="文章标题" style="width:500px;height:50px;margin-left: 35%;padding: 5px;font-size: 20px;">
	
	<select id="type">
	  <option value ="Java">Java</option>
	  <option value ="Android">Android</option>
	  <option value="Database">Database</option>
	  <option value="Algorithm">Algorithm</option>
	</select>
	
    <!-- editormd start -->
    <div class="editormd" id="test-editormd" style="margin-top:50px">
    <textarea class="editormd-markdown-textarea" name="test-editormd-markdown-doc" id="editormd"></textarea>
    <!-- 第二个隐藏文本域，用来构造生成的HTML代码，方便表单POST提交，这里的name可以任意取，后台接受时以这个name键为准 -->
    <!-- html textarea 需要开启配置项 saveHTMLToTextarea == true -->
    <textarea class="editormd-html-textarea" name="editorhtml" id="editorhtml"></textarea>       
    </div>
    
    
     <button onclick="commit()" style="display:block;margin:0 auto;">发表文章</button>
   
    <!-- editormd end --> 
	
</body>
</html>