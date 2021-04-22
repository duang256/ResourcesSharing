<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>leetcode135</title>
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
	<img src="images/leetcode.png" >
<br><br>

<p class="content">
题目的要求是每个孩子至少一个糖果，对于一个孩子的左边孩子或右边孩子，评分高则糖果必须多<br>
从左边到右开始遍历，可以实现 右边评分高的孩子的糖果 始终多于 左边孩子的<br>
同理，从右到左开始遍历，可以实现 左边评分高的孩子 糖果多余右边孩子的<br>
从上边两条就实现了对于单个孩子来说 评分大于左边 糖果多余左边，评分大于右边 糖果大于右边，而且是最少糖果的情况，所以对每个孩子都做到了最优分配，此所谓贪心<br>

当从左到右时，初始值都为1，直接右边=左边+1<br>
但是当从右到左时，左边=右边+1不一定成立，因为我们的要求的大于，但是右边+1&lt;左边原值时，可能对从左到右的操作产生影响，所以如果原先值大，延续原来的值<br>
<br><br>
</p>
<div class="code">
<pre>
	class Solution {
	   public int candy(int[] ratings) {
	         int size=ratings.length;
	        //当只有一个孩子，一个糖果就够
	        if(size&lt;2){
	            return size;
	        }
	
	        int num[]=new int[size];
	        //因为每人至少一个糖果，设置初值每人一个糖果
	        for(int i=0;i&lt;size;i++){
	            num[i]=1;
	        }
	
	        //从左到右遍历，只要右边评分大于等于左边
	        //就让右边的糖果大于左边糖果个数（大最小的个数即1）
	        //num和ratings对应每个孩子
	        for(int i=0;i&lt;size-1;i++){
	            if(ratings[i+1]&gt;ratings[i]){
	                num[i+1]=num[i]+1;
	            }
	        }
	        //从右到左遍历，只要左边糖果评分大于右边
	        //左边=max（右边+1，num[i]原值）
	        //num和ratings对应每个孩子
	        for(int i=size-1;i&gt;0;i--){
	            if(ratings[i]&lt;ratings[i-1]){
	                num[i-1]=Math.max(num[i-1],num[i]+1);
	            }
	        }
	        int sum=0;
	        for (int i:num
	             ) {
	            sum+=i;
	        }
	        return sum;
	    }
	}
</pre>
</div>
	
</div>

	
</body>
</html>