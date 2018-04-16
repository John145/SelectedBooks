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
			width:1000px;
			margin: auto;
		}
		#left{
			width: 200px;
			height: 500px;
			background: yellow;
			float: left;
		}
		#right{
			width: 800px;
			height: 500px;
			background: lime;
			float: left;
		}
	</style>
</head>
<body>
	<div id="big">
		<jsp:include page="top.jsp"></jsp:include>
		<div id="left">
			<a href="#">切换1</a><br />
			<a href="#">切换2</a><br />
			<a href="#">切换3</a><br />
			<a href="#">切换4</a><br />
			<a href="#">切换5</a><br />
		</div>
		<div id="right">
			<div id="outer">
				<s:iterator value="list" var="b">
					<div class="book">
						<s:property value="#b.bid"/>
						<s:property value="#b.price"/>
						<a href="#"><s:property value="#b.bookName"/></a>
						<a href="/SelectedBooks/book_delete?bid=<s:property value="#b.bid" />&curPage=<s:property value="curPage" />">删除</a>
						<a href="">修改</a>
						<a href="">查看</a>
					</div>
				</s:iterator>
			</div>
			<div id="showPage">
				<span>第<s:property value="curPage"/>/<s:property value="totalPage"/>页</span>
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