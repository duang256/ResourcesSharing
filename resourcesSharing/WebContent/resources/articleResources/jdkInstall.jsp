<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>leetcode</title>
<style type="text/css">
.code{
	background-color: rgba(0,0,0,.75);
	color: #FFFFFF;
}
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
	padding-right: 50px;
}
P{
	font-size: 18px;
    color: #4d4d4d;
    font-weight: 400;
    line-height: 26px;
}
img{
	margin:20px;
}
</style>
</head>
<body>

<div class="box">
<br><br>

<p>
如果还未安装JDK，可以下我给的这个<br>
<a target="_blank" href="https://pan.baidu.com/s/1bnNcgJmsNr8TaCAEHR2ROA">JDK8 提取码：tt6h</a><br>
环境变量的配置：<br>
1.打开文件夹，在此电脑上单击右键，单击属性<br>
<br><br>
</p>

<img src="images/JDK1.png" >
<P>
2.点击高级系统设置
<br><br>
</P>

<img src="images/JDK2.png" >
<P>
3.点击环境变量
<br><br>
</P>

<img src="images/JDK3.png" >
<img src="images/JDK4.png" >
<P>
4.JAVA_HOME变量配置（找到c盘的java文件点击进入jdk，复制路径，图片里面是我的路径，每个人的可能不一样，一般都在Program Files里面找）
<br><br>
</P>

<img src="images/JDK5.png" >
<P>
5.path配置（点击path变量到里面新建）
<br><br>
</P>

<img src="images/JDK6.png" >
<P>
6.类似JAVA_HOME的建立，建立一个ClassPath变量（一定注意前面的 . 很重要 而且两个路径前面都有一个分号 ；）
下面可以直接copy（.;%JAVA_HOME%\lib;%JAVA_HOME%\lib\tools.jar）
<br><br>
</P>

<img src="images/JDK7.png" >
<p>
检验配置是否成功：
打开d盘，空白处单击右键新建一个记事本（txt）
在里面输入：
(ps)直接复制代码即可
</p>
<div class="code">
<pre>
	public class a{
public static void main(String []args){
		System.out.println("hello World");
}
}
</pre>
</div>
<p>
将txt文件后缀改成.java
桌面键+R 回车
(基础指令：cd…回到上层文件 cd\回到最高层 cd +文件名 打开文件 dir查看目录）
（输入 c: 打开c盘，其它盘类似 ）（tab键可以进行选择）
</p>

<img src="images/JDK8.png" >
<p>
在c盘下输入java -version (java后面加一个空格)
</p>

<img src="images/JDK9.png" >
<p>
(1)输入 d: 到d盘<br>
(2)输入javac a.java (a是之前建立的java文件名)<br>
(3)应该是这样的效果<br>
</p>

<img src="images/JDK10.png" >
<p>
java a 成功！
</p>

<img src="images/JDK11.png" >

</div>
	

	
</body>
</html>