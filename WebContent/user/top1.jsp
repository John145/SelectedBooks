<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<s:form action="book_search" method="get" theme="simple">
	您好：<s:property value="#session.curUser.nickname"/><a href="${pageContext.request.contextPath }/user_logout">注销</a>
	-<s:property value="#session.curUser.role.rname"/> 
	<s:debug></s:debug>
	<input name="curPage" type="hidden" value="1">
	搜索： 
	<s:textfield name="keyword"></s:textfield>
	<input type="submit" value="提交">
</s:form>
