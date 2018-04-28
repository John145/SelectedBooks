<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		#big{
			width:1260px;
			margin: auto;
		}
		#left{
			width: 160px;
			height: 500px;
			float: left;
			background: blue;
		}
		#right{
			width: 1100px;
			height:500px;
			float: left;
			position: relative;
		}
		.leftsidebar_box{
			width:160px;
			height:100% !important;
			background-color:black;
		}
		.line{height:2px;width:100%;background-image:url(images/left/line_bg.png);background-repeat:repeat-x;}
		.leftsidebar_box dt{padding-left:40px;padding-right:10px;background-repeat:no-repeat;background-position:10px center;color:#f5f5f5;font-size:14px;position:relative;line-height:48px;cursor:pointer;}
		.leftsidebar_box dd{background-color:black;padding-left:40px;}
		.leftsidebar_box dd a{color:#f5f5f5;line-height:20px;text-decoration: none;}
		.leftsidebar_box dt img{position:absolute;right:10px;top:20px;}
		.custom dt{background-image:url(images/left/custom.png)}
		.channel dt{background-image:url(images/left/channel.png)}
		.app dt{background-image:url(images/left/app.png)}
		.cloud dt{background-image:url(images/left/cloud.png)}
		.syetem_management dt{background-image:url(images/left/syetem_management.png)}
		.source dt{background-image:url(images/left/source.png)}
		.statistics dt{background-image:url(images/left/statistics.png)}
		.leftsidebar_box dl dd:last-child{padding-bottom:10px;}
	</style>
	<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('.delete').click(function(){
				var tag = confirm("是否删除"+$(this).parent().parent().find('.bookName').text());
				if(tag){
					return true;
				}
				return false;
			});
			$('.location').ready(function(){
				$(this).find('#weizhi').text("首页");			
			});
		});
	</script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery.js"></script>
	<script type="text/javascript">
	$(".leftsidebar_box dt").css({"background-color":"black"});
	$(".leftsidebar_box dt img").attr("src","images/left/select_xl01.png");
	$(function(){
		$(".leftsidebar_box dd").hide();
		$(".leftsidebar_box dt").click(function(){
			$(".leftsidebar_box dt").css({"background-color":"black"})
			$(this).css({"background-color": "black"});
			$(this).parent().find('dd').removeClass("menu_chioce");
			$(".leftsidebar_box dt img").attr("src","images/left/select_xl01.png");
			$(this).parent().find('img').attr("src","images/left/select_xl.png");
			$(".menu_chioce").slideUp(); 
			$(this).parent().find('dd').slideToggle();
			$(this).parent().find('dd').addClass("menu_chioce");
		});
	})
	</script>
</head>
<body>
	<div id="big">
		<jsp:include page="top.jsp"></jsp:include>
		<div id="left">
			<div class="leftsidebar_box">
			<div class="line"></div>

			<dl class="custom">
				<dt onClick="changeImage()">书籍管理<img src="images/left/select_xl01.png"></dt>
				<dd class="first_dd"><a href="${pageContext.request.contextPath }/book_Adminadd">增加书籍</a></dd>
				<dd><a href="#">删除书籍</a></dd>
				<dd><a href="#">修改书籍</a></dd>
				<dd><a href="#">查询书籍</a></dd>
			</dl>
			
			<dl class="channel">
				<dt>渠道管理<img src="images/left/select_xl01.png"></dt>
				<dd class="first_dd"><a href="#">渠道主页</a></dd>
				<dd><a href="#">渠道标准管理</a></dd>
				<dd><a href="#">系统通知</a></dd>
				<dd><a href="#">渠道商管理</a></dd>
				<dd><a href="#">渠道商链接</a></dd>
			</dl>
			
			<dl class="app">
				<dt onClick="changeImage()">APP管理<img src="images/left/select_xl01.png"></dt>
				<dd class="first_dd"><a href="#">App运营商管理</a></dd>
				<dd><a href="#">开放接口管理</a></dd>
				<dd><a href="#">接口类型管理</a></dd>
			</dl>
			
			<dl class="cloud">
				<dt>大数据云平台<img src="images/left/select_xl01.png"></dt>
				<dd class="first_dd"><a href="#">平台运营商管理</a></dd>
			</dl>
			
			<dl class="syetem_management">
				<dt>系统管理<img src="images/left/select_xl01.png"></dt>
				<dd class="first_dd"><a href="#">后台用户管理</a></dd>
				<dd><a href="#">角色管理</a></dd>
				<dd><a href="#">客户类型管理</a></dd>
				<dd><a href="#">栏目管理</a></dd>
				<dd><a href="#">微官网模板组管理</a></dd>
				<dd><a href="#">商城模板管理</a></dd>
				<dd><a href="#">微功能管理</a></dd>
				<dd><a href="#">修改用户密码</a></dd>
			</dl>
			
			<dl class="source">
				<dt>素材库管理<img src="images/left/select_xl01.png"></dt>
				<dd class="first_dd"><a href="#">图片库</a></dd>
				<dd><a href="#">链接库</a></dd>
				<dd><a href="#">推广管理</a></dd>
			</dl>
			
			<dl class="statistics">
				<dt>统计分析<img src="images/left/select_xl01.png"></dt>
				<dd class="first_dd"><a href="#">客户统计</a></dd>
			</dl>
			
			<!--  <a href="${pageContext.request.contextPath }/book_Adminadd">增加5</a><br />-->
			</div>
		</div>
		<div id="right">
			<form action="book_update">
			序号：<s:property value="bid"/><br>
			<input type="hidden" name="bid" value="<s:property value="bid"/>" />
			书名：<input name="bookName" value="<s:property value="bookName"/>"><br>
			作者：<input name="author" value="<s:property value="author"/>"><br>
			价格：<input name="price" value="<s:property value="price"/>"><br>
			出版社：<input name="publisher" value="<s:property value="publisher"/>"><br>
			出版时间：<input name="publishYear" value="<s:property value="publishYear"/>"><br>
			翻译人：<input name="translator" value="<s:property value="translator"/>"><br>
			全书页码：<input name="pages" value="<s:property value="pages"/>"><br>
			评分：<input name="score" value="<s:property value="score"/>"><br>
			评价人数：<input name="assessNumber" value="<s:property value="assessNumber"/>"><br>
			读书连接：<input name="readUrl" value="<s:property value="readUrl"/>"><br>
			内容介绍：<input name="contentIntroduce" value="<s:property value="contentIntroduce"/>"><br>
			作者介绍：<input name="authorIntroduce" value="<s:property value="authorIntroduce"/>"><br>
			分类：<input name="tags" value="<s:property value="tags"/>"><br>
			图片：<img alt='' height="100px" src="<s:property value="picUrl"/>"/><a href="#">修改</a><br>
			<input type="hidden" name="picUrl" value="<s:property value="picUrl"/>" />
			<input type="submit" value="修改"/>
		</form>
		</div>
	</div>
</body>
</html>
