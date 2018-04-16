<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:if test="null!=#session.curUser">
	<%response.sendRedirect("book_findAll?curPage=1"); %>
</s:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery.min.js"></script>
<script type="text/javascript">
	function change(){
		$('#checkCodeImg').attr("src","${pageContext.request.contextPath }/checkCode?d="+new Date().getTime());
	}
</script>
</head>
<body>
	<h1>登陆页面</h1>
	<a href="${pageContext.request.contextPath }/user/register.jsp">没有账号?现在注册</a>
	<h3 style='color:red;'><s:actionerror /></h3>
	<s:form action="user_login" method="post" theme="simple" namespace="/">
		账号：<s:textfield name="username"></s:textfield><br/>
		密码：<s:textfield name="password" type="password"></s:textfield><br/>
		验证码：<s:textfield name="checkCode"></s:textfield><img onclick="change()" id="checkCodeImg" src="${pageContext.request.contextPath }/checkCode" /><br />
		<input type="submit" value="登陆"/>
	</s:form>
</body>
</html>