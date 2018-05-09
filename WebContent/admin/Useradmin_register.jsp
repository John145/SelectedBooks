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
		#search{
			height: 25px;
			position:absolute;
			float:left;
			top: 20px;
			left:30px;
		}
		#outer{
			width: 1100px;
			height:450px;
			float:left;
			padding-top:25px;
			background-image:url(images/content/dotted.png);
		}
		.TABLE{
			float: left;
			border: 1px solid gray;
			margin-left: 30px;
			margin-top: 30px;
		}
		.TABLE p{
			padding:0px;
			margin:0px;
			height: 15px;
			font-size: 15px;
		}
		.UID{
			height:30px;
			width: 50px;
		}
		.USERNAME{
			height: 30px;
			width: 100px;
		}
		
		.SEX{
			height: 30px;
			width: 100px;
		}
		
		.NICKNAME{
			height: 30px;
			width: 150px;
		}
		
		.EMAIL{
			height: 30px;
			width: 150px;
		}
		.ADDRESS{
			height: 30px;
			width:150px;
		}
		.RID{
			height: 30px;
			width: 30px;
		}
		.INTERESTS{
			height: 30px;
			width: 100px;
		}
		#showPage{
			width:1100px;
			height: 25px;
			float:left;
			background-image:url(images/content/dotted.png);
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
		<jsp:include page="Useradmintop.jsp"></jsp:include>
		<div id="left">
			<div class="leftsidebar_box">
			<div class="line"></div>

			<dl class="custom">
				<dt onClick="changeImage()">用户管理<img src="images/left/select_xl01.png"></dt>
				<dd class="first_dd"><a href="${pageContext.request.contextPath }/user_findAll_register?curPage=1">注册用户</a></dd>
				<dd><a href="${pageContext.request.contextPath }/user_findAll_bookadmin?curPage=1">书籍管理员</a></dd>
				<dd><a href="${pageContext.request.contextPath }/user_findAll?curPage=1">全部用户</a></dd>
			</dl>
			<dl class="channel">
				<dt onClick="changeImage()">权限管理<img src="images/left/select_xl01.png"></dt>
				<dd class="first_dd"><a href="${pageContext.request.contextPath }/user_personalinformation">个人信息</a></dd>
				<dd><a href="#">渠道标准管理</a></dd>
				<dd><a href="#">系统通知</a></dd>
				<dd><a href="#">渠道商管理</a></dd>
				<dd><a href="#">渠道商链接</a></dd>
			</dl>
			</div>
		</div>
		<div id="right">
			<div id="search">
				<s:form action="book_search" method="get" theme="simple">
					
					<input name="curPage" type="hidden" value="1">
					<s:textfield name="keyword" placeholder="书名/作者/类型" style="height: 20px;  border: 1px soile black;"></s:textfield>
					<input type="submit" value="搜索"  style="height: 25px;">
				</s:form>
			</div>
			<div id="outer">
				<table border="1" cellspacing="0" class="TABLE">
					<tr>
						<td class="UID" align="center">用户ID</td>
						<td class="USERNAME" align="center" >用户名</td>
						<td class="SEX" align="center" >用户性别</td>
						<td class="NICKNAME" align="center" >昵称</td>
						<td class="EMAIL" align="center" >电子邮箱</td>
						<td class="ADDRESS" align="center" >地址</td>
						<td class="RID" align="center">权限</td>
						<td class="INTERESTS" align="center">兴趣</td>
					</tr>
					<s:iterator value="list" var="u">
						<tr bgcolor="white">
							<td align="center" class="UID">
								<s:property value="#u.uid"/>
							</td>
							<td align="center" class="USERNAME">
								<p style="width:100px; white-space:nowrap; text-overflow:ellipsis; overflow:hidden;">
								<s:property value="#u.username"/>
								</p>
							</td>
							<td align="center" class="SEX">
								<p style="width:100px; white-space:nowrap; text-overflow:ellipsis; overflow:hidden;">
								<s:property value="#u.sex"/>
								</p>
							</td>
							<td align="center" class="NICKNAME">
								<p style="width:150px; white-space:nowrap; text-overflow:ellipsis; overflow:hidden;">
								<s:property value="#u.nickname"/>
								</p>
							</td>
							<td align="center" class="EMAIL">
								<p style="width:100px; white-space:nowrap; text-overflow:ellipsis; overflow:hidden;">
								<s:property value="#u.email"/>
								</p>
							</td>
							<td align="center" class="ADDRESS">
								<s:property value="#u.address"/>
							</td>
							<td align="center" class="RID">
								<p style="width:100px; white-space:nowrap; text-overflow:ellipsis; overflow:hidden;">
								<s:property value="#u.role.rname"/>
								</p>
							</td>
							<td align="center"  class="INTERESTS">
								<p style="width:20px; white-space:nowrap; text-overflow:ellipsis; overflow:hidden;">
								<s:property value="#u.interests"/>
								</p>
							</td>
							
						</tr>
					</s:iterator>	
				</table>
			</div>
			<div id="showPage">
				<span>&nbsp;&nbsp;第<s:property value="curPage"/>/<s:property value="totalPage"/>页</span>
				<span>总记录数：<s:property value="totalCount"/></span>
				<span>
					<s:if test="curPage != 1">
						<a href="${pageContext.request.contextPath }/user_findAll_register?curPage=1">[首页]</a>
						<a href="${pageContext.request.contextPath }/user_findAll_register?curPage=<s:property value="curPage-1" />">[上一页]</a>
					</s:if>
					<s:if test="curPage != totalPage && totalPage != 0">
						<a href="${pageContext.request.contextPath }/user_findAll_register?curPage=<s:property value="curPage+1" />">[下一页]</a>
						<a href="${pageContext.request.contextPath }/user_findAll_register?curPage=<s:property value="totalPage" />">[尾页]</a>
					</s:if>
				</span>
			</div>
		</div>
	</div>
</body>
</html>