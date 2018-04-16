<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#picUrl{
		width: 150px;
		height: 200px;
	}
</style>
</head>
<body>
	<s:include value="top.jsp"></s:include>
	
	<h3><s:property value="bookName"/></h3>
	<img id="picUrl" src='<s:property value="picUrl"/>'/>
</body>
</html>