<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		*{
			margin: auto;
		}
		#top{
			width: 1000px;
			height: 80px;
		}
		#logo{
			width: 700px;
			height: 80px;
			float: left;
			background: orange;
		}
		#operation{
			width: 300px;
			height: 80px;
			float: left;
			background: white;
		}		
		#Username{
			width:98px;
			height:48px;
			float: left; 
			border: 1px solid black; 
			padding-top: 30px;
		}
		#refresh{
				width:98px;
			height:48px;
			float: left; 
			border: 1px solid black; 
			padding-top: 30px;
		}
		#logout{
			width:98px;
			height:48px;
			float: left; 
			border: 1px solid black; 
			padding-top: 30px;
		}
		p{
			padding-top:20px;
			font-size: 20px;
			font-style: italic;
			color: black;
			padding-left: 40px;
		}
	</style>
</head>
<body>
	<div id="top">
	
		<div id="logo">	
			<p>书籍后台管理系统</p>
		</div>
		<div id="operation">
			<div id="Username">
				您好：<s:property value="#session.curUser.nickname"/>		
			</div>
			
			<div id="refresh">
				刷新
			</div>
			
			<div id="logout">
				<a href="${pageContext.request.contextPath }/user/user_logout">注销</a>
			</div>
		</div>
		
		
	</div>	
</body>
</html>