<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="scripts/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#username").change(function(){
			var value = $(this).val();
			var $this = $(this);
			if(value != ""){
				$this.nextAll("span").remove();
				$.post("user_validateUsername",{"username":value},function(result){
					if(result == "1"){
						$this.after("<span style='color:green;'>账号可用</span>");
					}else if(result == "0"){
						$this.after("<span style='color:red;'>账号不可用</span>");
					}
				});
			}else{
				$this.after("<span style='color:red;'>账号不可以为空</span>");
			}
		});
	});
</script>
</head>
<body>
	<h1>注册页面</h1>
	<h3 style='color:red;'><s:actionerror /></h3>
	<s:form action="user_register" method="post" theme="simple">
		账号：<s:textfield name="username" id="username"></s:textfield><br />
		密码：<s:textfield name="password" type="password"></s:textfield><br />
		昵称：<s:textfield name="nickname"></s:textfield><br />
		性别：<s:radio  list="#{'男':'男','女':'女'}" name="sex"></s:radio><br />
		邮箱：<s:textfield name="email"></s:textfield><br />
		现居地：<s:textfield name="address"></s:textfield><br />
		
		<input type="submit" value="注册"/>
	</s:form>
</body>
</html>