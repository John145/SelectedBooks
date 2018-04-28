<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
		<title>注册界面</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link rel="stylesheet" href="../css/reset.css" />
		<link rel="stylesheet" href="../css/common.css" />
		<link rel="stylesheet" href="../css/font-awesome.min.css" />
	</head>
	<body>
		<div class="wrap login_wrap">
			<div class="content">
				
				<div class="logo"></div>
				
				<div class="login_box">	
					
					<div class="login_form">
						<div class="login_title">
							注册
						</div>
						<form action="user_register" method="post" id="from">
							<h3 style='color:red;text-align:center;'><s:actionerror /></h3>
							<div class="form_text_ipt">
								<s:textfield name="username" id="username" placeholder="账号"></s:textfield>
							</div>
							<div class="ececk_warning"><span>账号不能为空</span></div>
							<div class="form_text_ipt">
								<s:textfield name="nickname" placeholder="昵称"></s:textfield>
							</div>
							
							<div class="ececk_warning"><span>昵称不能为空</span></div>
							<div class="form_text_ipt">
								<input type="password" placeholder="密码" value='<s:property value="password"/>'>
							</div>
							<div class="ececk_warning"><span>密码不能为空</span></div>
							<div class="form_text_ipt">
								<s:textfield name="password" type="password" placeholder="重复密码"></s:textfield>
							</div>
							<div class="ececk_warning"><span>重复密码不能为空</span></div>
							<div class="form_text_yz">
								<s:textfield name="checkCode" placeholder="验证码"></s:textfield>
								<img class="yzm" onclick="change()" id="checkCodeImg" src="${pageContext.request.contextPath }/checkCode" />
							</div>
							<div class="ececk_warning"><span>验证码不能为空</span></div>
							<br />
							
							<div class="form_btn">
								<button type="button" onclick="validate()">注册</button>
							</div>
							<div class="form_reg_btn">
								<span>已有帐号？</span><a href="${pageContext.request.contextPath }/index.jsp">马上登录</a>
							</div>
						</form>
						<div class="bottom">
							</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="../scripts/jquery.min.js" ></script>
		<script type="text/javascript" src="../scripts/common.js" ></script>
		<script type="text/javascript">
			function change(){
				$('#checkCodeImg').attr("src","${pageContext.request.contextPath }/checkCode?d="+new Date().getTime());
			}
		</script>
		<div style="text-align:center;">
</div>
	</body>
</html>
