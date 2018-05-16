<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name=referrer content="never">
	<title>Insert title here</title>
	<style type="text/css">
		#big{
			width:1260px;
			margin: auto;
		}
		#left{
			width: 160px;
			height: 800px;
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
		table{
			display: inline-block;
			margin-left: 80px;
		}
		#img_full{
			width: 300px;
			height: 385px;
			cursor: pointer;
		}
		form{
			padding-top: 30px;
			padding-left: 200px;
		}
		textarea{
			width: 640px;
			height: 100px;
			font-size: 1.2em;
			resize: none;
		}
	</style>
	<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery.min.js"></script>
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
		//提交表单
		function validate(){
			$('form').submit();
		}
	</script>
</head>
<body>
	<div id="big">
		<jsp:include page="top.jsp"></jsp:include>
		<s:include value="bookAdminLeft.jsp"></s:include>
		<div id="right">
			<form action="book_update" method="post">
				<input type="hidden" name="bid" value="<s:property value="bid"/>" />
				<div style="display: inline-block; float:left;"><img id="img_full" height="100px" src="<s:property value="picUrl"/>"/></div>
				<table>
					<tr>
						<td>序号：</td>
						<td><s:property value="bid"/></td>
					</tr>
					<tr>
						<td>书名：</td>
						<td><input name="bookName" value="<s:property value="bookName"/>"></td>
					</tr>
					<tr>
						<td>作者：</td>
						<td><input name="author" value="<s:property value="author"/>"></td>
					</tr>
					<tr>
						<td>翻译人：</td>
						<td><input name="translator" value="<s:property value="translator"/>"></td>
					</tr>
					<tr>
						<td>价格：</td>
						<td><input name="price" value="<s:property value="price"/>"></td>
					</tr>
					<tr>
						<td>出版社：</td>
						<td><input name="publisher" value="<s:property value="publisher"/>"></td>
					</tr>
					<tr>
						<td>出版时间：</td>
						<td><input name="publishYear" value="<s:property value="publishYear"/>"></td>
					</tr>
					<tr>
						<td>全书页码：</td>
						<td><input name="pages" value="<s:property value="pages"/>"></td>
					</tr>
					<tr>
						<td>评分：</td>
						<td><input name="score" value="<s:property value="score"/>"></td>
					</tr>
					<tr>
						<td>评价人数：</td>
						<td><input name="assessNumber" value="<s:property value="assessNumber"/>"></td>
					</tr>
					
					<tr>
						<td>读书连接：</td>
						<td><input name="readUrl" value="<s:property value="readUrl"/>"></td>
					</tr>
					<tr>
						<td>分类：</td>
						<td><input name="sort" value="<s:property value="sort"/>"></td>
					</tr>
					<tr>
						<td>标签：</td>
						<td><input name="tags" value="<s:property value="tags"/>"></td>
					</tr>
					<tr>
						<td>图片：</td>
						<td><input type="text" name="picUrl" value="<s:property value="picUrl"/>" /></td>
					</tr>
					<tr>
						<td>点击量：</td>
						<td><input name="clickNumber" value="<s:property value="clickNumber"/>"></td>
					</tr>
				</table>
				<div>
					<p style="padding-left: 0px;">内容介绍：</p>
					<textarea name="contentIntroduce"><s:property value="contentIntroduce"/></textarea>
				</div>
				<div>
					<p style="padding-left: 0px;">作者介绍：</p>
					<textarea name="authorIntroduce"><s:property value="authorIntroduce"/></textarea>
				</div>
				<br>
				<div onclick="validate()" style="background: #3fa156; text-align:center; line-height: 35px; width: 85px;height: 35px;border-radius: 5px;color: white;">修改</div>
		</form>
		</div>
	</div>
</body>
</html>
