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
		border: 1px solid black;
		height: 180px;
	}
	.book div{
		float: left;
	}
	.book img{
		width: 120px;
		height: 180px;
		float: left;
	}
	#outer{
		width: 80%;
		background: #CCC;
		margin: 0 auto;
	}
</style>
</head>
<body>
	<s:include value="top.jsp"></s:include>
	
	<div id="container">
		<div id="outer">
			<s:iterator value="list" var="b">
				<div class="book">
					<img alt='' src="<s:property value="#b.picUrl"/>"/>
					<div>
						<a href="book_detail?bid=<s:property value="#b.bid" />"><s:property value="#b.bookName"/></a>
						<div></div>
					</div>
				</div>
			</s:iterator>
		</div>
		<div id="showPage">
			<span>第<s:property value="curPage"/>/<s:property value="totalPage"/>页</span>
			<span>总记录数：<s:property value="totalCount"/></span>
			<span>
				<s:if test="curPage != 1">
					<a href="${pageContext.request.contextPath }/book_search?curPage=1&keyword=<s:property value="keyword"/>">[首页]</a>
					<a href="${pageContext.request.contextPath }/book_search?curPage=<s:property value="curPage-1" />&keyword=<s:property value="keyword"/>">[上一页]</a>
				</s:if>
				<s:if test="curPage != totalPage && totalPage != 0">
					<a href="${pageContext.request.contextPath }/book_search?curPage=<s:property value="curPage+1" />&keyword=<s:property value="keyword"/>">[下一页]</a>
					<a href="${pageContext.request.contextPath }/book_search?curPage=<s:property value="totalPage" />&keyword=<s:property value="keyword"/>">[尾页]</a>
				</s:if>
			</span>
		</div>
	</div>
	
	
</body>
</html>