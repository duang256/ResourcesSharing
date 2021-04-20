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
                    <p><img src="https://img-blog.csdnimg.cn/20210412165919544.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1dBX01D,size_16,color_FFFFFF,t_70" alt="在这里插入图片描述"></p> 
<p>对于这题，结论：<br> 快指针走2步，慢指针走一步，第一次相遇时，将fast重置为head处，然后fast改为走1步，相遇处即为环的开始处<br> （关于这个结论可以通过讨论整条链路部署的即奇偶性来用数学方法证明，这里不予讨论）</p> 
<p>所以根据上面的结论，我们有这样思路：</p> 
<ul><li>当没有环的时候，fast最终会为null，所以只要fast为空，就返回null</li><li>当有环的时候，fast和low第一次相遇后，将fast=head，然后fast速率改为1步，返回相遇时的fast或者low都行</li></ul> 
<p>具体实现：</p> 
<ul><li>初始将low和fast都置于head处</li><li>如果head为null用== 会空指针，所以循环前进行一个判断</li><li>第一个循环使用do while， 循环条件是fast和low相遇就停止，因为开始时fast和low都在head处所以使用do while跳过这次检查，如果fast.next为空进一步fast.next.next为空（前者是防止fast.next.next报错，后者是防止下次循环！=报错）都返回null，low跳到下一个就行了（如果没环，fast先比low为null，如果有环，low‘更加不会为null）</li><li>将fast=head （到达这的肯定是有环的）</li><li>第二次循环条件为low！=fast 相遇停止返回low</li></ul> 
<pre class="prettyprint"><code class="prism language-java has-numbering" onclick="mdcp.copyCode(event)" style="position: unset;"><span class="token keyword">class</span> <span class="token class-name">ListNode</span> <span class="token punctuation">{<!-- --></span>
    <span class="token keyword">int</span> val<span class="token punctuation">;</span>
    ListNode next<span class="token punctuation">;</span>
    <span class="token function">ListNode</span><span class="token punctuation">(</span><span class="token keyword">int</span> x<span class="token punctuation">)</span> <span class="token punctuation">{<!-- --></span>
        val <span class="token operator">=</span> x<span class="token punctuation">;</span>
        next <span class="token operator">=</span> null<span class="token punctuation">;</span>
    <span class="token punctuation">}</span>
<span class="token punctuation">}</span>
<div class="hljs-button {2}" data-title="复制" data-report-click="{&quot;spm&quot;:&quot;1001.2101.3001.4259&quot;}"></div></code><ul class="pre-numbering" style=""><li style="color: rgb(153, 153, 153);">1</li><li style="color: rgb(153, 153, 153);">2</li><li style="color: rgb(153, 153, 153);">3</li><li style="color: rgb(153, 153, 153);">4</li><li style="color: rgb(153, 153, 153);">5</li><li style="color: rgb(153, 153, 153);">6</li><li style="color: rgb(153, 153, 153);">7</li><li style="color: rgb(153, 153, 153);">8</li></ul></pre> 
<pre class="prettyprint"><code class="prism language-java has-numbering" onclick="mdcp.copyCode(event)" style="position: unset;"><span class="token keyword">public</span> ListNode <span class="token function">detectCycle</span><span class="token punctuation">(</span>ListNode head<span class="token punctuation">)</span> <span class="token punctuation">{<!-- --></span>
        <span class="token comment">//快慢指针  low和fast</span>
        ListNode low<span class="token operator">=</span>head<span class="token punctuation">,</span>fast<span class="token operator">=</span>head<span class="token punctuation">;</span>
        <span class="token keyword">if</span><span class="token punctuation">(</span>head<span class="token operator">==</span>null<span class="token punctuation">)</span><span class="token punctuation">{<!-- --></span>
            <span class="token keyword">return</span> null<span class="token punctuation">;</span>
        <span class="token punctuation">}</span>
        <span class="token keyword">do</span><span class="token punctuation">{<!-- --></span>  <span class="token comment">//是否成环---下一个为空或者下下个为空</span>
            <span class="token keyword">if</span><span class="token punctuation">(</span>fast<span class="token punctuation">.</span>next<span class="token operator">!=</span>null<span class="token punctuation">)</span> <span class="token punctuation">{<!-- --></span>
                fast <span class="token operator">=</span> fast<span class="token punctuation">.</span>next<span class="token punctuation">.</span>next<span class="token punctuation">;</span>
                <span class="token keyword">if</span><span class="token punctuation">(</span>fast<span class="token operator">==</span>null<span class="token punctuation">)</span><span class="token punctuation">{<!-- --></span>
                    <span class="token keyword">return</span> null<span class="token punctuation">;</span>
                <span class="token punctuation">}</span>
            <span class="token punctuation">}</span><span class="token keyword">else</span><span class="token punctuation">{<!-- --></span>
                <span class="token keyword">return</span> null<span class="token punctuation">;</span>
            <span class="token punctuation">}</span>
            low<span class="token operator">=</span>low<span class="token punctuation">.</span>next<span class="token punctuation">;</span>

        <span class="token punctuation">}</span><span class="token keyword">while</span><span class="token punctuation">(</span>fast<span class="token operator">!=</span>low<span class="token punctuation">)</span><span class="token punctuation">;</span>

        fast<span class="token operator">=</span>head<span class="token punctuation">;</span>
        <span class="token keyword">while</span><span class="token punctuation">(</span>low<span class="token operator">!=</span>fast<span class="token punctuation">)</span><span class="token punctuation">{<!-- --></span>
            low<span class="token operator">=</span>low<span class="token punctuation">.</span>next<span class="token punctuation">;</span>
            fast<span class="token operator">=</span>fast<span class="token punctuation">.</span>next<span class="token punctuation">;</span>
        <span class="token punctuation">}</span>
        <span class="token keyword">return</span> low<span class="token punctuation">;</span>
    <span class="token punctuation">}</span>
<div class="hljs-button {2}" data-title="复制" data-report-click="{&quot;spm&quot;:&quot;1001.2101.3001.4259&quot;}"></div></code><ul class="pre-numbering" style=""><li style="color: rgb(153, 153, 153);">1</li><li style="color: rgb(153, 153, 153);">2</li><li style="color: rgb(153, 153, 153);">3</li><li style="color: rgb(153, 153, 153);">4</li><li style="color: rgb(153, 153, 153);">5</li><li style="color: rgb(153, 153, 153);">6</li><li style="color: rgb(153, 153, 153);">7</li><li style="color: rgb(153, 153, 153);">8</li><li style="color: rgb(153, 153, 153);">9</li><li style="color: rgb(153, 153, 153);">10</li><li style="color: rgb(153, 153, 153);">11</li><li style="color: rgb(153, 153, 153);">12</li><li style="color: rgb(153, 153, 153);">13</li><li style="color: rgb(153, 153, 153);">14</li><li style="color: rgb(153, 153, 153);">15</li><li style="color: rgb(153, 153, 153);">16</li><li style="color: rgb(153, 153, 153);">17</li><li style="color: rgb(153, 153, 153);">18</li><li style="color: rgb(153, 153, 153);">19</li><li style="color: rgb(153, 153, 153);">20</li><li style="color: rgb(153, 153, 153);">21</li><li style="color: rgb(153, 153, 153);">22</li><li style="color: rgb(153, 153, 153);">23</li><li style="color: rgb(153, 153, 153);">24</li><li style="color: rgb(153, 153, 153);">25</li><li style="color: rgb(153, 153, 153);">26</li></ul></pre>
                </div>
</body>
</html>