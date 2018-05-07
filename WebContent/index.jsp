<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:if test="'注册用户'==#session.curUser.role.rname">
	<%response.sendRedirect("book_findAll?curPage=1"); %>
</s:if>
<s:elseif test="'用户管理员'==#session.curUser.role.rname">
	<%response.sendRedirect("user_findAll?curPage=1"); %>
</s:elseif>
<s:elseif test="'书籍管理员'==#session.curUser.role.rname">
	<%response.sendRedirect("book_findAll?curPage=1"); %>
</s:elseif>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>登录界面</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link rel="stylesheet" href="css/reset.css" />
		<link rel="stylesheet" href="css/common.css" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
	</head>

	<body>
		<div class="wrap login_wrap">
			<div class="content">
				<div class="logo"></div>
				<div class="login_box">

					<div class="login_form">
						<div class="login_title">
							登录
						</div>
						<s:form action="user_login" method="post" id="form" theme="simple" namespace="/">
							<h3 style='color:red;text-align:center;'><s:actionerror /></h3>
							<div class="form_text_ipt">
									<s:textfield id="username" placeholder="用户名" name="username"></s:textfield>
							</div>
							<div class="ececk_warning"><span>用户名不能为空</span></div>
							<div class="form_text_ipt">
								<s:textfield name="password" type="password" placeholder="密码"></s:textfield>
							</div>
							<div class="ececk_warning"><span>密码不能为空</span></div>
							<div class="form_text_yz">
								<s:textfield name="checkCode" placeholder="验证码"></s:textfield>
								<img class="yzm" onclick="change()" id="checkCodeImg" src="${pageContext.request.contextPath }/checkCode" />
							</div>
							<div class="ececk_warning"><span>验证码不能为空</span></div>
							<br />
							<div class="form_check_ipt">
								<div class="left check_left">
									<label><input name="" type="checkbox"> 下次自动登录</label>
								</div>
								<div class="right check_right">
									<a href="#">忘记密码</a>
								</div>
							</div>
							<div class="form_btn">
								<button type="button" id="btn" onclick="validate()">登录</button>
							</div>
							<div class="form_reg_btn">
								<span>还没有帐号？</span>
								<a href="${pageContext.request.contextPath }/user/register.jsp">马上注册</a>
							</div>
							<div class="bottom">

							</div>
						</s:form>

					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="scripts/jquery.min.js"></script>
		<script type="text/javascript">
			function change(){
				$('#checkCodeImg').attr("src","${pageContext.request.contextPath }/checkCode?d="+new Date().getTime());
			}
			function validate(){
				var inputs = $('.form_text_ipt input,.form_text_yz input');
				if(inputs[0].value == ''){
					$(inputs[0]).css({
						'color':'red',
					});
					$(inputs[0]).parent().css({
						'border':'solid 1px red',
					});
					$(inputs[0]).parent().next().show();
				}else if(inputs[1].value == ''){
					$(inputs[1]).css({
						'color':'red',
					});
					$(inputs[1]).parent().css({
						'border':'solid 1px red',
					});
					$(inputs[1]).parent().next().show();
				}else if(inputs[2].value == ''){
					$(inputs[2]).css({
						'color':'red',
						'border':'solid 1px red'
					});
					$(inputs[2]).parent().next().show();
				}else{
					$('#form').submit();
				}
			}
			$(document).ready(function(){
				//登录输入框效果
				$('.form_text_ipt input').focus(function(){
					$(this).parent().css({
						'box-shadow':'0 0 3px #bbb',
					});
				});
				$('.form_text_ipt input').blur(function(){
					$(this).parent().css({
						'box-shadow':'none',
					});
				});
				$('.form_text_ipt input').bind('input propertychange',function(){
					if($(this).val()==""){
						$(this).css({
							'color':'red',
						});
						$(this).parent().css({
							'border':'solid 1px red',
						});
						$(this).parent().next().show();
					}else{
						$(this).css({
							'color':'black',
						});
						$(this).parent().css({
							'border':'solid 1px #ccc',
						});
						$(this).parent().next().hide();
					}
				});
				$('.form_text_yz input').bind('input propertychange',function(){
					if($(this).val()==""){
						$(this).css({
							'color':'red',
							'border':'solid 1px red'
						});
						$(this).parent().next().show();
					}else{
						$(this).css({
							'color':'black',
							'border':'solid 1px #CCC'
						});
						$(this).parent().next().hide();
					}
				});
			});
		</script>
	</body>
</html>