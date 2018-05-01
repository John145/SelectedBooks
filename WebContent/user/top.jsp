<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>精选图书</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
		<script src="${pageContext.request.contextPath }/scripts/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/scripts/bootstrap.min.js" type="text/javascript"></script>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<style>
			#showChat{
				width: 20px;
				height: 50px;
				background: #1F8CEB;
				color: white;
				text-align: center;
				line-height: 50px;
				position: fixed;
				bottom: 50px;
				right: 0px;
				cursor: pointer;
				z-index: 10;
			}
			#chatRoom{
				box-shadow: rgba(0, 0, 0, 0.16) 0px 5px 40px !important;
				width: 360px;
				height: 400px;
				background: #CCC;
				position: fixed;
				bottom: 0px;
				right: 0px;
				transition: 0.5s;
				transform: translateX(100%);
				z-index: 10;
			}
			#chatRoom h3{
				margin: 0;
				font-size: 18px;
				background: #1F8CEB;
				height: 36px;
				color: white;
				line-height: 36px;
				text-indent: 1em;
			}
			#msgBox{
				width: 360px;
				height: 270px;
				background: white;
				overflow: auto;
				padding-left: 10px;
				padding-right: 10px;
				padding-top: 10px;
			}
			#input{
				width: 360px;
				height: 94px;
				background: white;
				border-top: 1px solid #CCC;
			}
			textarea{
				width: 100%;
				height: 55px;
				border: none;
				text-indent: 0.5em;
				outline:none;
			}
			#sendMsg{
				float: right;
				width: 50px;
				height: 30px;
				line-height: 30px;
				text-align: center;
				background: #1F8CEB;
				color: white;
				border-radius: 2px;
				cursor: pointer;
			}
			.msg{
				margin-bottom: 15px;	
			}
			.msg::after{
				content: "";  
		        display: block;  
		        clear: both; 
			}
			.msg img{
				width: 30px;
				height: 30px;
				border-radius: 20px;
			}
			.msg div{
				float: left;
				color: #B1BAC4;
				font-size: 0.9em;
			}
			.msg div .content{
				background: rgb(239, 243, 246);
				font-size: 1.1em;
				color: black;
				padding: 5px;
				border-radius: 5px;
			}
			.msgBox p{
				margin: 0;
			}
		</style>
	</head>
	<body>
		<nav class="navbar navbar-default navbar-fixed">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#example-navbar-collapse">
						<span class="sr-only">切换导航</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<!--png图片logo-->
					<a href="${pageContext.request.contextPath }/book_selected" class="navbar-brand" style="font-size: 2.1em;">精选图书</a>
				</div>
				<div class="collapse navbar-collapse" id="example-navbar-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li>
							<a href="${pageContext.request.contextPath }/user/updateUser.jsp"><span class="glyphicon glyphicon-user"></span> <s:property value="#session.curUser.nickname"/></a>
						</li>
						<li>
							<a href="#"><span class="glyphicon glyphicon-star"></span> 我的收藏</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath }/user_logout"><span class="glyphicon glyphicon-log-out"></span> 注销</a>
						</li>
						<li>
							<a href="#"><span class="glyphicon glyphicon-question-sign"></span> 关于</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	
		<div class="container">
			<div class="row">
				<div class="col-md-5 ">
					<h4 class="">热门推荐
					<a href="#"><span class="label label-default"><s:property value="#session.curUser.interests.split('#')[0]"/></span></a>
					<a href="#"><span class="label label-info"><s:property value="#session.curUser.interests.split('#')[1]"/></span></a>
					<a href="#"><span class="label label-success"><s:property value="#session.curUser.interests.split('#')[2]"/></span></a>
					<a href="#"><span class="label label-danger"><s:property value="#session.curUser.interests.split('#')[3]"/></span></a>
					<a href="#"><span class="label label-primary"><s:property value="#session.curUser.interests.split('#')[4]"/></span></a>
					</h4>
				</div>
	
				<div class="col-md-4">
					<s:form action="book_search" method="get" theme="simple" namespace="/" id="form">
						<!--表单合组-->
						<input name="curPage" type="hidden" value="1">
						<div class="input-group">
							<s:textfield name="keyword" cssClass="form-control" placeholder="书名/作者/类型"></s:textfield>
							<span class="input-group-btn">
								<button class="btn btn-group-justified glyphicon glyphicon-search" type="button" onclick="$('form').submit()">
								</button>
							</span>
						</div>
					</s:form>
				</div>
				<div class="col-md-3"></div>
			
			</div>
			<hr style="border: 1px solid #ccc;" />
		</div>
<%-- 		<s:debug></s:debug> --%>
		<!-- chatroom -->
		<div id="chatRoom">
			<h3>聊天室<span id="closeChat" style="float: right; margin-right: 10px;cursor: pointer;">></span></h3>
			<div id="msgBox">
				
			</div>
			<div id="input">
				<textarea id="myMsg"></textarea>
				<div id="sendMsg">发送</div>
			</div>
		</div>
	
		<div id="showChat"><</div>
		<script>
			var timer = null;
			var isOpen = false;
			$(document).ready(function(){
				$('#showChat').click(function(){
					//显示聊天室
					$('#chatRoom').css("transform","translateX(0)");
					$('#showChat').hide();
					//开始发送心跳包
					//每隔一段时间去获取所有消息
					findAll();
					timer = setInterval(findAll,3000);
				});
				$('#closeChat').click(function(){
					$('#chatRoom').css("transform","translateX(100%)");
					$('#showChat').show();
					//结束心跳包
					clearInterval(timer);
				});
				//给textarea添加回车事件
				$('#myMsg').keydown(function(event){
					if(event.which == 13){
						return sendMsg();
					}
				});
				//给发送按钮添加发送功能
				$("#sendMsg").click(sendMsg);
			});
			function sendMsg(){
				var date = new Date();
				var dateStr = date.getFullYear()+"年"+(date.getMonth()+1)+"月"+
					date.getDate()+"日 "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
				//console.log(dateStr);
	
				var val = $('#myMsg').val();
				if(val == ""){
					alert("不能发送空消息!!!");
					return false;
				}
				console.log("send ...",val);
				$('#myMsg').val(""); //清空输入栏
				//发送消息
				$.post("chatRoomMsg_save",{"time":dateStr,"content":val},function(result){
					if(result == 1){
						console.log("发送成功!!!");
						//查询一次数据
						findAll();
					}
				});
				return false; //取消默认事件
			}
			function findAll(){
				$.post("chatRoomMsg_findAll",{"s":new Date()},function(result){
					$('#msgBox').html(result);
					//将滚动条滚到底部
					$('#msgBox')[0].scrollTop = $('#msgBox')[0].scrollHeight;
				});
			}
		</script>
	</body>
</html>