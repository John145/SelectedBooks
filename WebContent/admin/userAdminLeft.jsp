<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="left">
		<div class="leftsidebar_box">
			<div class="line"></div>

			<dl class="custom">
				<dt>用户管理<img src="images/left/select_xl01.png"></dt>
<%-- 				<dd class="first_dd"><a href="${pageContext.request.contextPath }/user_findAll_register?curPage=1">注册用户</a></dd> --%>
<%-- 				<dd><a href="${pageContext.request.contextPath }/user_findAll_bookadmin?curPage=1">书籍管理员</a></dd> --%>
				<dd><a href="${pageContext.request.contextPath }/user_findAll?curPage=1">全部用户</a></dd>
<!-- 				<dd class="first_dd"><a href="#">个人信息</a></dd> -->
			</dl>
		</div>
	</div>
</body>
</html>