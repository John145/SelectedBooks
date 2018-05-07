<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery.min.js"></script>
</head>
<body>
	<h3>完善兴趣爱好成功</h3>
	<p>页面即将在<span>3</span>秒后跳转到主界面，如果没有正常跳转请点击下面</p>
	<a href="${pageContext.request.contextPath }/index.jsp">登陆账号</a>
	<script type="text/javascript">
		$(document).ready(function(){
			setInterval(function(){
				var text = $('span').text();
				if(text > 0){
					text = text - 1;
					$('span').text(text);
				}
			},1000);
			setInterval(function(){
				location.href = "${pageContext.request.contextPath}/index.jsp";
			},3000);
		});
	</script>
</body>
</html>