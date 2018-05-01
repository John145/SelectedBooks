<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:iterator value="list">
	<div class="msg">
		<div><img src="${pageContext.request.contextPath }/<s:property value="headPic"/>"></div>
		<div style="margin-left: 8px;width: 280px;">
			<p><s:property value="nickName"/>-<span><s:property value="time"/></span></p>
			<div class="content"><s:property value="content"/></div>
		</div>
	</div>
</s:iterator>
