<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.book{
		width: 120px;
		height: 200px;
		float: left;
		overflow: hidden;
		margin-left: 20px;
		margin-top: 20px;
	}
	.book img{
		width: 120px;
		height: 180px;
	}
	#outer{
		width: 720px;
		height: 460px;
		background: #CCC;
		margin: 0 auto;
	}
</style>
</head>
<body>
	您好：<s:property value="#session.curUser.nickname"/><a href="user_logout">注销</a>
	-<s:property value="#session.curUser.role.rname"/>
	<s:debug></s:debug>
	<div id="container">
		<div id="outer">
			<s:iterator value="list" var="b">
				<div class="book">
					<img alt='' src="<s:property value="#b.picUrl"/>"/>
					<a href="#"><s:property value="#b.bookName"/></a>
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
				<s:if test="curPage != totalPage">
					<a href="${pageContext.request.contextPath }/book_findAll?curPage=<s:property value="curPage+1" />">[下一页]</a>
					<a href="${pageContext.request.contextPath }/book_findAll?curPage=<s:property value="totalPage" />">[尾页]</a>
				</s:if>
			</span>
		</div>
	</div>
</body>
</html>