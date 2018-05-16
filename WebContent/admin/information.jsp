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
		input{
			width: 200px;
			height: 20px;
		}
	</style>
	<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
		});
		function validate(){
			$('form').submit();
		}
		//菜单动画
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
		<s:include value="bookAdminLeft.jsp"></s:include>
		<div id="right">
			<h3 style="text-align: center; margin-top: 20px;">基本信息修改</h3>
			<form action="user_informationupdate" method="post">
				<table style="margin-top: 50px;">
					<tr>
						<td>用户名：</td>
						<td><input name="username" value="<s:property value="username"/>"></td>
					</tr>
					<tr>
						<td>性别：</td>
						<td><input name="sex" value="<s:property value="sex"/>"></td>
					</tr>
					<tr>
						<td>昵称：</td>
						<td><input name="nickname" value="<s:property value="nickname"/>"></td>
					</tr>
					<tr>
						<td>邮箱：</td>
						<td><input name="email" value="<s:property value="email"/>"></td>
					</tr>
					<tr>
						<td>地址：</td>
						<td><input name="address" value="<s:property value="address"/>"></td>
					</tr>
					<tr>
						<td colspan="2">
							<div onclick="validate()" style="background: #3fa156; text-align:center; line-height: 35px; width: 85px;height: 35px;border-radius: 5px;color: white;">修改</div>
						</td>
					</tr>
				</table>
				
		</form>
		</div>
	</div>
</body>
</html>
