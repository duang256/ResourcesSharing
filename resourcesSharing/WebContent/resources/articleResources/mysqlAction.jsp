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

</style>
</head>
<body>

<div class="box">
<br><br>

<p>
<b>mySQL创建表</b><br>
创建表和Oracle一样的格式，但字段类型和Oracle不同<br>
<b>数值类型：</b><br>
int（20），float（8，1），double（20，1）<br>
<b>字符类型：</b><br>
char(固定长度),varchar（动态分配长度）<br>
<b>日期类型：</b><br>
date：格式为yyyy-MM-dd<br>
datetime:yyyy-MM-dd hh:mm:ss 8字节<br>
timestamp: 自动进行时区的转换，4字节<br>
time:时间<br>
year:年份<br>
<b>其他类型：</b><br>
TEXT：字符数据<br>
BLOB：二进制数据<br>

mysql是没有序列的，但是我们可以在创建表的时候设置序列自增<br>
参照下面<b>sid用法加auto_increment</b><br>
<br><br>
实例：
</p>


<div class="code">
<pre>
create table student(
	sid int (10) not null  auto_increment primary KEY,
  	sname varchar(100) not NULL,
	sage int(3) ,
	ssex char(4) ,
	sbirth date
)
</pre>
</div>

<p>
	加一条数据，<br>
	<b>在添加主键的自增字段时用default关键字</b>
</p>

<div class="code">
<pre>
insert into student values(default,'张珊',18,'男','2018-02-28');
</pre>
</div>

<p>
	<b>mySQL的约束：</b><br>
	<b>类比Oracle第二种方式进行约束时constraint没有 s</b><br>
	主键约束 同Oracle<br>
	非空约束 同Oracle<br>
	
	<b>mySQL中可以存进去空字符</b><br>
	唯一约束 同Oracle<br>
	外键约束 同Oracle<br>
	主键约束同Oracle<br>
	检查约束<br>
	mySQL没有检查约束<br>
	解决：代码逻辑进行数据过滤<br>
	
	<b>其他操作：</b><br>
	显示表信息–show tables<br>
	显示创建表语句 show create table 表名<br>
	显示库 show databases<br>
	
	<b>mySQL的分页：</b><br>
	下面例子的意思是从0开始查找5页<br>
	
</p>

<div class="code">
	<pre>
	select *from student limit 0,5
	</pre>
</div>
<p>想继续查找6-10就写成下面这样<br></p>
<div class="code">
	<pre>
	select *from student limit 5,5
	</pre>
</div>
	
<p>
	<b>mySQL的数据备份</b><br><br>
	<b>界面方式</b>
	导入<br>
	右键数据库，execute SQL File（运行SQL文件）<br>
	导出 Dump SQL File（转储SQL文件）<br>
</p>
	
	
	
</div>

	
</body>
</html>