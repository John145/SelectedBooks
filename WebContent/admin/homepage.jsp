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
			font-size: 15px;
		}
		.ID{
			height:30px;
			width: 100px;
		}
		.BOOKNAME{
			height: 30px;
			width: 150px;
		}
		
		.AUTHOR{
			height: 30px;
			width: 100px;
		}
		
		.PUBLISHER{
			height: 30px;
			width: 150px;
		}
		
		.PUBLISHYEAR{
			height: 30px;
			width: 150px;
		}
		.SCORE{
			height: 30px;
			width:50px;
		}
		.PRICE{
			height: 30px;
			width: 100px;
		}
		.TAGS{
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
		<jsp:include page="top.jsp"></jsp:include>
		<s:include value="bookAdminLeft.jsp"></s:include>
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
						<td class="ID" align="center">书本序号</td>
						<td class="BOOKNAME" align="center" >书本名字</td>
						<td class="AUTHOR" align="center" >作者</td>
						<td class="PUBLISHER" align="center" >出版社</td>
						<td class="PUBLISHYEAR" align="center" >出版时间</td>
						<td class="SCORE" align="center" >评分</td>
						<td class="PRICE" align="center">价钱</td>
						<td class="TAGS" align="center">标签</td>
						<td class="DELETE" align="center" colspan="3">操作</td>
					</tr>
					<s:iterator value="list" var="b">
						<tr bgcolor="white">
							<td align="center" class="ID"><s:property value="#b.bid"/></td>
							<td align="center" class="BOOKNAME">
								<p style="width:150px; white-space:nowrap; text-overflow:ellipsis; overflow:hidden;">
								<s:property value="#b.bookName"/>
								</p>
							</td>
							<td align="center" class="AUTHOR">
								<p style="width:100px; white-space:nowrap; text-overflow:ellipsis; overflow:hidden;">
								<s:property value="#b.author"/>
								</p>
							</td>
							<td align="center" class="PUBLISHER">
								<p style="width:150px; white-space:nowrap; text-overflow:ellipsis; overflow:hidden;">
								<s:property value="#b.publisher"/>
								</p>
							</td>
							<td align="center" class="PUBLISHYEAR">
								<p style="width:100px; white-space:nowrap; text-overflow:ellipsis; overflow:hidden;">
								<s:property value="#b.publishYear"/>
								</p>
							</td>
							<td align="center" class="SCORE">
								<s:property value="#b.score"/>
							</td>
							<td align="center" class="PRICE">
								<p style="width:100px; white-space:nowrap; text-overflow:ellipsis; overflow:hidden;">
								<s:property value="#b.price"/>
								</p>
							</td>
							<td align="center"  class="TAGS">
								<p style="width:100px; white-space:nowrap; text-overflow:ellipsis; overflow:hidden;">
								<s:property value="#b.tags"/>
								</p>
							</td>
							<td align="center" class="DELETE">
							<a class="delete" href="${pageContext.request.contextPath }/book_delete?bid=<s:property value="#b.bid" />&curPage=<s:property value="curPage" />">删除</a>
							<a href="${pageContext.request.contextPath }/book_AdminUpdate?bid=<s:property value="#b.bid" />">修改</a>
						</tr>
					</s:iterator>
				</table>
			</div>
			<div id="showPage">
				<span>&nbsp;&nbsp;第<s:property value="curPage"/>/<s:property value="totalPage"/>页</span>
				<span>总记录数：<s:property value="totalCount"/></span>
				<span>
					<s:if test="curPage != 1">
						<a href="${pageContext.request.contextPath }/book_findAll?curPage=1">[首页]</a>
						<a href="${pageContext.request.contextPath }/book_findAll?curPage=<s:property value="curPage-1" />">[上一页]</a>
					</s:if>
					<s:if test="curPage != totalPage && totalPage != 0">
						<a href="${pageContext.request.contextPath }/book_findAll?curPage=<s:property value="curPage+1" />">[下一页]</a>
						<a href="${pageContext.request.contextPath }/book_findAll?curPage=<s:property value="totalPage" />">[尾页]</a>
					</s:if>
				</span>
			</div>
		</div>
	</div>
</body>
</html>