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
                    <p>如果还未安装JDK，可以下我给的这个<br> <a href="https://pan.baidu.com/s/1bnNcgJmsNr8TaCAEHR2ROA">JDK8 提取码：tt6h</a></p> 
<p>环境变量的配置：</p> 
<p>1.打开文件夹，在此电脑上单击右键，单击属性<img src="https://img-blog.csdnimg.cn/20200304132857513.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1dBX01D,size_16,color_FFFFFF,t_70" alt="1.打开文件夹，在此电脑上单击右键，单击属性"></p> 
<p>2.点击高级系统设置<img src="https://img-blog.csdnimg.cn/20200304132956919.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1dBX01D,size_16,color_FFFFFF,t_70" alt="2.点击高级系统设置"><br> 3.点击环境变量<br> <img src="https://img-blog.csdnimg.cn/202003041330484.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1dBX01D,size_16,color_FFFFFF,t_70" alt="3.点击环境变量"></p> 
<p><img src="https://img-blog.csdnimg.cn/20200304133120952.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1dBX01D,size_16,color_FFFFFF,t_70" alt="点击新建"><br> 4.JAVA_HOME变量配置（找到c盘的java文件点击进入jdk，复制路径，图片里面是我的路径，每个人的可能不一样，一般都在Program Files里面找）<br> <img src="https://img-blog.csdnimg.cn/20200304133141567.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1dBX01D,size_16,color_FFFFFF,t_70" alt="JAVA_HOME变量配置"></p> 
<p>5.path配置（点击path变量到里面新建）<br> <img src="https://img-blog.csdnimg.cn/20200304133155744.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1dBX01D,size_16,color_FFFFFF,t_70" alt="path配置"><br> 6.类似JAVA_HOME的建立，建立一个ClassPath变量（一定注意前面的 . 很重要 而且两个路径前面都有一个分号 ；）<br> 下面可以直接copy（.;%JAVA_HOME%\lib;%JAVA_HOME%\lib\tools.jar）<br> <img src="https://img-blog.csdnimg.cn/20200304133429116.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1dBX01D,size_16,color_FFFFFF,t_70" alt="类似JAVA_HOME的建立，建立一个ClassPath变量"></p> 
<p>检验配置是否成功：<br> 打开d盘，空白处单击右键新建一个记事本（txt）<br> 在里面输入：<br> (ps)直接复制代码即可</p> 
<pre class="prettyprint"><code class="prism language-java has-numbering" onclick="mdcp.signin(event)" style="position: unset;"><span class="token keyword">public</span> <span class="token keyword">class</span> <span class="token class-name">a</span><span class="token punctuation">{<!-- --></span>
<span class="token keyword">public</span> <span class="token keyword">static</span> <span class="token keyword">void</span> <span class="token function">main</span><span class="token punctuation">(</span>String <span class="token punctuation">[</span><span class="token punctuation">]</span>args<span class="token punctuation">)</span><span class="token punctuation">{<!-- --></span>
		System<span class="token punctuation">.</span>out<span class="token punctuation">.</span><span class="token function">println</span><span class="token punctuation">(</span><span class="token string">"hello World"</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span>
<span class="token punctuation">}</span>
<div class="hljs-button signin" data-title="登录后复制" data-report-click="{&quot;spm&quot;:&quot;1001.2101.3001.4259&quot;}"></div></code><ul class="pre-numbering" style=""><li style="color: rgb(153, 153, 153);">1</li><li style="color: rgb(153, 153, 153);">2</li><li style="color: rgb(153, 153, 153);">3</li><li style="color: rgb(153, 153, 153);">4</li><li style="color: rgb(153, 153, 153);">5</li></ul></pre> 
<p>将txt文件后缀改成.java<br> 桌面键+R 回车<br> (基础指令：cd…回到上层文件 cd\回到最高层 cd +文件名 打开文件 dir查看目录）<br> （输入 c: 打开c盘，其它盘类似 ）（tab键可以进行选择）<br> <img src="https://img-blog.csdnimg.cn/20200304134913447.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1dBX01D,size_16,color_FFFFFF,t_70" alt="a.java"><br> 在c盘下输入java -version (java后面加一个空格)<br> <img src="https://img-blog.csdnimg.cn/20200304135515584.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1dBX01D,size_16,color_FFFFFF,t_70" alt="显示如上则JAVA_HOME配置成功"><br> (1)输入 d: 到d盘<br> (2)输入javac a.java (a是之前建立的java文件名)<br> (3)应该是这样的效果<img src="https://img-blog.csdnimg.cn/20200304140901609.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1dBX01D,size_16,color_FFFFFF,t_70" alt="在这里插入图片描述">(4)输入java a 成功！<br> <img src="https://img-blog.csdnimg.cn/20200304141016983.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1dBX01D,size_16,color_FFFFFF,t_70" alt="成功！"></p>
                </div>

</body>
</html>




