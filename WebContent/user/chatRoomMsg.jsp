<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:iterator value="list">
	<s:if test='#session.curUser.uid == user.uid'>
		<div class="ownMsg">
	   		<div><img src="${pageContext.request.contextPath }/<s:property value="user.headPic"/>"></div>
			<div style="margin-right: 8px;width: 280px;">
				<p><s:property value="user.nickname"/>-<span><s:property value="time"/></span></p>
				<div class="content"><s:property value="content"/></div>
			</div>
	   </div>
	</s:if>
	<s:else>
		<div class="msg">
			<div><img src="${pageContext.request.contextPath }/<s:property value="user.headPic"/>"></div>
			<div style="margin-left: 8px;width: 280px;">
				<p><s:property value="user.nickname"/>-<span><s:property value="time"/></span></p>
				<div class="content"><s:property value="content"/></div>
			</div>
		</div>
	</s:else>
</s:iterator>
