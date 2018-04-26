<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
		<script src="${pageContext.request.contextPath }/scripts/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/scripts/bootstrap.min.js" type="text/javascript"></script>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	</head>
	<body>
		<nav class="navbar navbar-default navbar-fixed">
			<div class="container">
				<div class="navbar-header">
					<!--png图片logo-->
					<a href="${pageContext.request.contextPath }/book_findAll.action?curPage=1" class="navbar-brand" style="font-size: 2.1em;">精选图书</a>
				</div>
				<div class="collapse navbar-collapse" id="navbar-collapse">
					<ul class="nav navbar-nav navbar-right" style="margin-top: 0;">
						<li>
							<a href="#"><span class="glyphicon glyphicon-user"></span> <s:property value="#session.curUser.nickname"/></a>
						</li>
						<li>
							<a href="#"><span class="glyphicon glyphicon-star"></span> 我的收藏</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath }/user_logout"><span class="glyphicon glyphicon-log-out"></span> 注销</a>
						</li>
						<li>
							<a href="#"><span class="glyphicon glyphicon-question-sign"></span> 关于</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	
		<div class="container">
			<div class="row">
				<div class="col-md-5 ">
					<h4 class="">热门推荐
					<a href="#"><span class="label label-default"><s:property value="#session.curUser.interests.split('#')[0]"/></span></a>
					<a href="#"><span class="label label-info"><s:property value="#session.curUser.interests.split('#')[1]"/></span></a>
					<a href="#"><span class="label label-success"><s:property value="#session.curUser.interests.split('#')[2]"/></span></a>
					<a href="#"><span class="label label-danger"><s:property value="#session.curUser.interests.split('#')[3]"/></span></a>
					<a href="#"><span class="label label-primary"><s:property value="#session.curUser.interests.split('#')[4]"/></span></a>
					</h4>
				</div>
	
				<div class="col-md-4">
					<s:form action="book_search" method="get" theme="simple" namespace="/" id="form">
						<!--表单合组-->
						<input name="curPage" type="hidden" value="1">
						<div class="input-group">
							<s:textfield name="keyword" cssClass="form-control" placeholder="书名/作者/类型"></s:textfield>
							<span class="input-group-btn">
								<button class="btn btn-group-justified" type="button" onclick="$('form').submit()">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</span>
						</div>
					</s:form>
				</div>
				<div class="col-md-3"></div>
			
			</div>
			<hr style="border: 1px solid #ccc;" />
		</div>
<%-- 		<s:debug></s:debug> --%>
	</body>
</html>