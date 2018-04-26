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
		#collection{
			cursor: pointer;
		}
	</style>
	<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#collection').click(function(){
				//判断现在是否收藏，然后发送相应的请求
				var $this = $(this);
				var isLike = $this.attr("isLike");
				if(isLike == "yes"){
					$.post("user_removeBook",{"bid":"<s:property value="book.bid" />"},function(result){
						console.log(result);
						if(result == "1"){
							$this.attr("isLike","no");
							$this.attr("src","${pageContext.request.contextPath }/img/no.png");
						}
					});
				}else if(isLike = "no"){
					$.post("user_addBook",{"bid":"<s:property value="book.bid" />"},function(result){
						console.log(result);
						if(result == "1"){
							$this.attr("isLike","yes");
							$this.attr("src","${pageContext.request.contextPath }/img/yes.png");
						}
					});
				}else{
					alert("刷新页面重试");
				}
			});
		});
	</script>
</head>
<body>
	<s:include value="top.jsp"></s:include>
	
	<div class="container">
		<h3><s:property value="bookName"/></h3>
		<s:if test="isLike == 'yes'">
			<img id="collection" src="${pageContext.request.contextPath }/img/yes.png" isLike="yes">
		</s:if>
		<s:else>
			<img id="collection" src="${pageContext.request.contextPath }/img/no.png" isLike="no">
		</s:else>
		<br/>
		<img id="picUrl" src='<s:property value="book.picUrl"/>'/>
		<div id="infor">
			作者:<s:property value="book.author"/><br />
			译者:<s:property value="book.translator"/><br />
			出版社:<s:property value="book.publisher"/><br />
			出版年:<s:property value="book.publishYear"/><br />
			页数:<s:property value="book.pages"/><br />
			价格:<s:property value="book.price"/><br />
			评分:<s:property value="book.score"/><br />
			评价人数:<s:property value="book.assessNumber"/><br />
			内容简介:<s:property value="book.contentIntroduce"/><br />
			作者简介:<s:property value="book.authorIntroduce"/><br />
		</div>
		
		<s:if test="book.readUrl == '无链接'">
			<span>不支持在线阅读</span>
		</s:if>
		<s:else>
			<a href="<s:property value="book.readUrl"/>">在线阅读</a>
		</s:else>
		<div id="tag">
			<p>相关标签</p>
			<s:iterator value="book.tags.split('#')" status="st" var="as">  
		       <a href="#"><s:property value="#as"/></a>
		    </s:iterator> 
		</div>
	</div>
</body>
</html>