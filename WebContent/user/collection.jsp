<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/scripts/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<style>
	.img-full{
		width: 100%;
		height: auto;
		cursor: pointer;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		var imgs = $(".row img");
		var firstWidth = $(imgs[0]).css("width");
		var firstHeight = $(imgs[0]).css("height");
		console.log(firstWidth,firstHeight);
		//由于获取到的结果去掉了小数
		imgs.css("width",firstWidth);
		imgs.css("height",firstHeight);
		
		$('.row a').css("width",firstWidth);
		$('.row p').css("width",firstWidth);
		
		//设置删除收藏
		$('.deleteImg').click(function(){
			var $this = $(this);
			var bid = $this.next().text();
			var tag = confirm("是否删除"+$this.next().next().text());
			if(tag){
				$.post("user_removeBook",{"bid":bid},function(result){
					console.log(result);
					if(result == "1"){
						//删除成功
						console.log("删除成功");
						$this.parent().remove();
						//判断是否为空
						if($('#myrow').children().length == 0){
							$('#myrow').append('<h3 style="text-align: center;">您的收藏表为空！！！</h3>');
						}
					}
				});
			}
		});
	});
</script>
</head>
<body>
	<s:include value="top.jsp"></s:include>
	<div class="container">
		<div class="row" id="myrow">
			<s:if test="list.size() == 0">
				<h3 style="text-align: center;">您的收藏表为空！！！</h3>
			</s:if>
			<s:else>
				<s:iterator value="list">
					<div class="col-md-2 col-xs-6">
						<img class="img-full deleteImg" alt="" src="<s:property value="picUrl"/>">
						<div style="display:none;"><s:property value="bid"/></div>
						<a style="overflow: hidden; white-space:nowrap; display: block; text-overflow: ellipsis;" href="book_detail?bid=<s:property value="bid"/>"><s:property value="bookName"/></a>
						<p style="overflow: hidden; white-space:nowrap; display: block; text-overflow: ellipsis;" class="bookinfo"><s:property value="author"/></p>
					</div>
				</s:iterator>
			</s:else>
		</div>
	</div>
</body>
</html>