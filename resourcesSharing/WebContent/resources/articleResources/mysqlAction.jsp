<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="content_views" class="markdown_views prism-atom-one-dark">
                    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                        <path stroke-linecap="round" d="M5,0 0,2.5 5,5z" id="raphael-marker-block" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
                    </svg>
                    <p><strong>mySQL创建表</strong><br> 创建表和Oracle一样的格式，但字段类型和Oracle不同</p> 
<p><strong>数值类型：</strong><br> int（20），float（8，1），double（20，1）<br> <strong>字符类型：</strong><br> char(固定长度),varchar（动态分配长度）<br> <strong>日期类型：</strong><br> date：格式为yyyy-MM-dd<br> datetime:yyyy-MM-dd hh:mm:ss 8字节<br> timestamp: 自动进行时区的转换，4字节<br> time:时间<br> year:年份<br> <strong>其他类型：</strong><br> TEXT：字符数据<br> BLOB：二进制数据</p> 
<p>mysql是没有序列的，但是我们可以在创建表的时候设置序列自增<br> 参照下面<strong>sid用法加auto_increment</strong></p> 
<p>实例：</p> 
<pre class="prettyprint"><code class="prism language-sql has-numbering" onclick="mdcp.copyCode(event)" style="position: unset;"><span class="token keyword">create</span> <span class="token keyword">table</span> student<span class="token punctuation">(</span>
	sid <span class="token keyword">int</span> <span class="token punctuation">(</span><span class="token number">10</span><span class="token punctuation">)</span> <span class="token operator">not</span> <span class="token boolean">null</span>  <span class="token keyword">auto_increment</span> <span class="token keyword">primary</span> <span class="token keyword">KEY</span><span class="token punctuation">,</span>
  sname <span class="token keyword">varchar</span><span class="token punctuation">(</span><span class="token number">100</span><span class="token punctuation">)</span> <span class="token operator">not</span> <span class="token boolean">NULL</span><span class="token punctuation">,</span>
	sage <span class="token keyword">int</span><span class="token punctuation">(</span><span class="token number">3</span><span class="token punctuation">)</span> <span class="token punctuation">,</span>
	ssex <span class="token keyword">char</span><span class="token punctuation">(</span><span class="token number">4</span><span class="token punctuation">)</span> <span class="token punctuation">,</span>
	sbirth <span class="token keyword">date</span>
<span class="token punctuation">)</span>
<div class="hljs-button {2}" data-title="复制" data-report-click="{&quot;spm&quot;:&quot;1001.2101.3001.4259&quot;}"></div></code><ul class="pre-numbering" style=""><li style="color: rgb(153, 153, 153);">1</li><li style="color: rgb(153, 153, 153);">2</li><li style="color: rgb(153, 153, 153);">3</li><li style="color: rgb(153, 153, 153);">4</li><li style="color: rgb(153, 153, 153);">5</li><li style="color: rgb(153, 153, 153);">6</li><li style="color: rgb(153, 153, 153);">7</li></ul></pre> 
<p>加一条数据，<strong>在添加主键的自增字段时用default关键字</strong></p> 
<pre class="prettyprint"><code class="prism language-sql has-numbering" onclick="mdcp.copyCode(event)" style="position: unset;"><span class="token keyword">insert</span> <span class="token keyword">into</span> student <span class="token keyword">values</span><span class="token punctuation">(</span><span class="token keyword">default</span><span class="token punctuation">,</span><span class="token string">'张珊'</span><span class="token punctuation">,</span><span class="token number">18</span><span class="token punctuation">,</span><span class="token string">'男'</span><span class="token punctuation">,</span><span class="token string">'2018-02-28'</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<div class="hljs-button {2}" data-title="复制" data-report-click="{&quot;spm&quot;:&quot;1001.2101.3001.4259&quot;}"></div></code><ul class="pre-numbering" style=""><li style="color: rgb(153, 153, 153);">1</li></ul></pre> 
<p><img src="https://img-blog.csdnimg.cn/20200610100639434.png" alt="在这里插入图片描述"></p> 
<p><strong>mySQL的约束：</strong></p> 
<p><strong>类比Oracle第二种方式进行约束时constraint没有 s</strong></p> 
<p>主键约束 同Oracle</p> 
<p>非空约束 同Oracle<br> <strong>mySQL中可以存进去空字符</strong></p> 
<p>唯一约束 同Oracle</p> 
<p>外键约束 同Oracle</p> 
<p>主键约束同Oracle</p> 
<p>检查约束<br> mySQL没有检查约束<br> 解决：代码逻辑进行数据过滤</p> 
<p><strong>其他操作：</strong><br> 显示表信息–show tables<br> 显示创建表语句 show create table 表名<br> 显示库 show databases</p> 
<p><strong>mySQL的分页</strong></p> 
<p>下面例子的意思是从0开始查找5页</p> 
<pre class="prettyprint"><code class="prism language-sql has-numbering" onclick="mdcp.copyCode(event)" style="position: unset;"><span class="token keyword">select</span> <span class="token operator">*</span><span class="token keyword">from</span> student <span class="token keyword">limit</span> <span class="token number">0</span><span class="token punctuation">,</span><span class="token number">5</span>
<div class="hljs-button {2}" data-title="复制" data-report-click="{&quot;spm&quot;:&quot;1001.2101.3001.4259&quot;}"></div></code><ul class="pre-numbering" style=""><li style="color: rgb(153, 153, 153);">1</li></ul></pre> 
<p>想继续查找6-10就写成下面这样</p> 
<pre class="prettyprint"><code class="prism language-sql has-numbering" onclick="mdcp.copyCode(event)" style="position: unset;"><span class="token keyword">select</span> <span class="token operator">*</span><span class="token keyword">from</span> student <span class="token keyword">limit</span> <span class="token number">5</span><span class="token punctuation">,</span><span class="token number">5</span>
<div class="hljs-button {2}" data-title="复制" data-report-click="{&quot;spm&quot;:&quot;1001.2101.3001.4259&quot;}"></div></code><ul class="pre-numbering" style=""><li style="color: rgb(153, 153, 153);">1</li></ul></pre> 
<p><strong>mySQL的数据备份</strong></p> 
<p><strong>界面方式</strong><br> 导入<br> 右键数据库，execute SQL File（运行SQL文件）<br> 导出 Dump SQL File（转储SQL文件）</p>
                </div>
</body>
</html>