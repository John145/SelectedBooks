<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>精选图书</title>
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
	}
</style>
</head>
<body>

	<s:include value="top.jsp"></s:include>
	
	<div class="container">
		<div class="row">
			<div class="col-md-9">
				<div id="outer">
					<s:iterator value="list" var="b">
						<div class="book">
							<img alt='' src="<s:property value="#b.picUrl"/>"/>
							<a href="book_detail?bid=<s:property value="#b.bid"/>"><s:property value="#b.bookName"/></a>
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
			<div class="col-md-3">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">最热图书榜</h3>
					</div>
					<ul class="list-group">
						<li class="list-group-item"><div class="phb">1.<a href="#">急急急</a><p>作者</p></div></li>
						<li class="list-group-item"><div class="phb">2.<a href="#">急急急</a><p>作者</p></div></li>
						<li class="list-group-item"><div class="phb">3.<a href="#">急急急</a><p>作者</p></div></li>
						<li class="list-group-item"><div class="phb">4.<a href="#">急急急</a><p>作者</p></div></li>
						<li class="list-group-item"><div class="phb">5.<a href="#">急急急</a><p>作者</p></div></li>
						<li class="list-group-item"><div class="phb">6.<a href="#">急急急</a><p>作者</p></div></li>
						<li class="list-group-item"><div class="phb">7.<a href="#">急急急</a><p>作者</p></div></li>
						<li class="list-group-item"><div class="phb">8.<a href="#">急急急</a><p>作者</p></div></li>
						<li class="list-group-item"><div class="phb">9.<a href="#">急急急</a><p>作者</p></div></li>
						<li class="list-group-item"><div class="phb">10.<a href="#">急急急</a><p>作者</p></div></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>