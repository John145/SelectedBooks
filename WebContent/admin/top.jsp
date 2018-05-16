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
			margin-top:50px;
			width: 1260px;
			height: 60px;
			background: rgb(8,162,186);
		}
		#logo{
			width: 900px;
			height: 60px;
			float: left;
		}
		#operation{
			width: 300px;
			height: 60px;
			float: left;

		}
		#operation div{
			text-align: center;
			line-height: 60px;
		}	
		#Username{
			height:28px;
			float: left; 
		}
		#refresh{
			width:98px;
			height:28px;
			float: left; 
		}
		#logout{
			width:98px;
			height:28px;
			float: left; 
		}
		p{
			padding-top:20px;
			font-size: 20px;
			font-style: italic;
			padding-left: 40px;
		}
	</style>
</head>
<body>
	<div id="top">
	
		<div id="logo">	
			<p style="color: white;"><a href="${pageContext.request.contextPath }/book_findAll?curPage=1">书籍后台管理系统</a></p>
		</div>
		<div id="operation">
			<div id="Username">
				您好：<a href="${pageContext.request.contextPath }/user_personalinformation"><s:property value="#session.curUser.nickname"/></a>		
			</div>
			<div id="logout">
				<a href="${pageContext.request.contextPath }/user/user_logout">注销</a>
			</div>
		</div>
		
		
	</div>	
</body>
</html>