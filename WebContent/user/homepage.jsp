<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<script src="${pageContext.request.contextPath }/scripts/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	<style>
		.avg_show{
			width: 50%;
			float: left;
			padding-left: 15px;
			padding-right: 15px;
			margin-bottom: 20px;
		}
		.avg_show p{
			font-size: 0.9em;
		}
		@media (min-width: 768px){
			.avg_show{
				width: 25%;
			}
		}
		@media (min-width: 992px) {
			.avg_show{
				width: 20%;
			}
		}
	</style>
	<script>
		//记录当前窗口的区间
		//0代表<768
		//1代表768<r<992
		//2代表992<r<1200
		//3代表1200<r
		var range = 0;
		//由于实现的图书图片不一样大小，所以都按照第一张图片的大小进行调整
		$(document).ready(function(){
			var imgs = $(".avg_show img");
			var firstWidth = $(imgs[0]).css("width");
			var firstHeight = $(imgs[0]).css("height");
			console.log(firstWidth,firstHeight);
			//由于获取到的结果去掉了小数
			imgs.css("width",firstWidth);
			imgs.css("height",firstHeight);
			
			//设置文字大小超出隐藏
			$('.avg_show a').css("width",firstWidth);
			$('.avg_show p').css("width",firstWidth);
			
			var preWidth = $(window).width();
			if(preWidth < 768){
				range = 0;
			}else if(preWidth < 992){
				range = 1;
			}else if(preWidth < 1200){
				range = 2;
			}else{
				range = 3;
			}
		});
		$(window).resize(function(){
			var tmpWidth = $(window).width();
			var nowRange = 0;
			if(tmpWidth < 768){
				nowRange = 0;
			}else if(tmpWidth < 992){
				nowRange = 1;
			}else if(tmpWidth < 1200){
				nowRange = 2;
			}else{
				nowRange = 3;
			}
			if(range != nowRange){
				location.reload();
			}
		});
	</script>
	<script type="text/javascript">  
// 	 $(document).ready(function() {  
// 	    //获取Class为arcContent里面的所有img  
// 	    var imglist=$(".outterImg img");  
// 	    //或使用下面这句，获取ID为divArticle里面的所有img  
// 	    //var imglist=$("#divArticle img");  
// 	    for(var i=0;i<imglist.length;i++){   
// 	        if(imglist[i].getAttribute('src')){  
// 	            url = new URL(imglist[i].getAttribute('src'));   
// 	            var frameid = 'frameimg' + Math.random();  
// 	            window.img = '<img id="img" width="120" height="170" src=\''+url+''+Math.random()+'\' /><script>window.onload = function() { parent.document.getElementById(\''+frameid+'\').height = document.getElementById(\'img\').height+\'px\'; }<'+'/script>';  
// 	            $(imglist[i]).parent().empty().append('<iframe id="'+frameid+'" src="javascript:parent.img;" frameBorder="0" scrolling="no" width="120" height="170"></iframe>');  
// 	        }  
// 	    }  
// 	});   
	</script>  
</head>
<body>
	<s:include value="top.jsp"></s:include>
	<div class="container">
		<div class="row">
			<div class="col-md-9">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">图书推荐</h3>
					</div>
					<div class="panel-body">
			        	<div class="row">
			        		<s:iterator value="books" var="b">
			        			<div class="avg_show">
				        			<a href="book_detail?bid=<s:property value="#b.bid"/>">
				        				<img class="img-responsive" src='<s:property value="#b.picUrl"/>'>
				        			</a>
				        			<a style="overflow: hidden; white-space:nowrap; display: block; text-overflow: ellipsis; padding: 5px 0px;" href="book_detail?bid=<s:property value="#b.bid"/>"><s:property value="#b.bookName"/></a>
									<p style="overflow: hidden; white-space:nowrap; display: block; text-overflow: ellipsis;" class="bookinfo"><s:property value="#b.author"/></p>
				        		</div>
			        		</s:iterator>
			        	</div>
				    </div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">最热图书榜</h3>
					</div>
					<ul class="list-group">
						<s:iterator value="phb" var="b" status="st">
							<li class="list-group-item">
								<div class="phb">
									<s:property value="#st.index+1"/>.<a href="book_detail?bid=<s:property value="#b.bid"/>"><s:property value="#b.bookName"/></a>
				        			<span class="pull-right"><s:property value="#b.score"/></span>
									<p><s:property value="#b.author"/></p>
								</div>
							</li>
						</s:iterator>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>