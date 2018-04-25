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
	<div id="infor">
		作者:<s:property value="author"/><br />
		译者:<s:property value="translator"/><br />
		出版社:<s:property value="publisher"/><br />
		出版年:<s:property value="publishYear"/><br />
		页数:<s:property value="pages"/><br />
		价格:<s:property value="price"/><br />
		评分:<s:property value="score"/><br />
		评价人数:<s:property value="assessNumber"/><br />
		内容简介:<s:property value="contentIntroduce"/><br />
		作者简介:<s:property value="authorIntroduce"/><br />
	</div>
	
	<s:if test="readUrl == '无链接'">
		<span>不支持在线阅读</span>
	</s:if>
	<s:else>
		<a href="<s:property value="readUrl"/>">在线阅读</a>
	</s:else>
	<div id="tag">
		<p>相关标签</p>
		<s:iterator value="tags.split('#')" status="st" var="as">  
	       <a href="#"><s:property value="#as"/></a>
	    </s:iterator> 
	</div>
</body>
</html>