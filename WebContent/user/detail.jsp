<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title></title>
		<style type="text/css">
			#myCarousel {
				margin: 50px 0 0 0;
			}
			
			#myCarousel img {}
			
			.carousel-control {
				font-size: 100px;
				line-height: 500px;
			}
			
			.navbar-brand {
				font-size: 30px;
			}
			
			.navbar {
				border-top: none;
			}
			
			.a {
				text-align: center;
			}
			
			a:hover {
				text-decoration: none;
			}
			
			a:focus {
				text-decoration: none;
			}
			img {
				width: 180px;
				height: 230px;
				display: block;
			}
			.bookdetails p span:first-child{
				color: #666666;
			}
			#msgBoard{
				width: 100%;
				height: 100px;
				vertical-align: top;
				resize: none;
			}
			#collection{
				cursor: pointer;
			}
			.interest{
				width: 66px;
				height: 30px;
				text-align: center;
				line-height: 30px;
				border: 1px solid #CCC;
				cursor: pointer;
				border-radius: 5px;
				float: left;
				margin: 3px;
			}
			.interest:hover{
				background-color: #3066d6;
				color: white;
			}
		</style>
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
								$this.attr("class","glyphicon glyphicon-star-empty pull-right");
							}
						});
					}else if(isLike = "no"){
						$.post("user_addBook",{"bid":"<s:property value="book.bid" />"},function(result){
							console.log(result);
							if(result == "1"){
								$this.attr("isLike","yes");
								$this.attr("class","glyphicon glyphicon-star pull-right");
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
			<div class="row">
				<div class="col-md-9 col-lg-9"  >
			
					<div class="panel panel-info">
						<div class="panel-heading">
							<h3 class="panel-title"><s:property value="book.bookName"/>
								<s:if test="isLike == 'yes'">
									<span id="collection" class="glyphicon glyphicon-star pull-right" isLike="yes"></span>
								</s:if>
								<s:else>
									<span id="collection" class="glyphicon glyphicon-star-empty pull-right" isLike="no"></span>
								</s:else>
							</h3>
						</div>
								<div class="panel-body">
									
										<div class="row" >
											<div class="col-md-3">
												<img class="img-responsive" src="<s:property value="book.picUrl"/>"/>
											</div>
											<div class="col-md-4">
												<div class="bookdetails">
													<p><span>作者:</span><a><s:property value="book.author"/></a></p>
													<p><span>译者:</span><a><s:property value="book.translator"/></a></p>
													<p><span>出版社:</span><span><s:property value="book.publisher"/></span></a></p>
													<p><span>出版年:</span><span><s:property value="book.publishYear"/></span></a></p>
													<p><span>页数:</span><span><s:property value="book.pages"/></span></p>
													<p><span>定价:</span><span><s:property value="book.price"/></span></p>
													<p><span>评分:</span><span><s:property value="book.score"/></span></p>
													<p><span>评价人数:</span><span><s:property value="book.assessNumber"/></span></p>
												</div>
											</div>
											<div class="col-md-5">
											</div>
										</div>
										<div class="row" >
											<div class="col-md-12">
												<h4 class="alert-info">内容简介</h4>
												<p style="text-indent: 2em;"><s:property value="book.contentIntroduce"/></p>
												<span class="glyphicon glyphicon-paperclip alert-info">
													<s:if test="book.readUrl == '无链接'">
														不支持在线阅读
													</s:if>
													<s:else>
														<a href="<s:property value="book.readUrl"/>">在线阅读</a>
													</s:else>
												</span>
												<h4 class="alert-info">作者简介</h4>
												<p style="text-indent: 2em;"><s:property value="book.authorIntroduce"/></p>
												<h4 class="alert-info">相关标签</h4>
												<div>
													<s:iterator value="book.tags.split('@')" status="st" var="as">  
												       <a href="#" style=""><s:property value="#as"/></a>
												    </s:iterator>
												</div>
												<h4 class="alert-info">留言板</h4>
												<textarea id='msgBoard'></textarea>
												<button style="margin-top: 5px;" type="button" class="btn-info">发表</button>
												<hr style="border: 1px solid #ccc;" />
												<ul class="list-group">
													<li class="list-group-item">
														<div class="user">
															<span class="alert-info">酷肖2016</span><span class="pull-right" style="color: #666666;">2018.5.6</span>
														</div>
														<p class="comment" style="text-indent: 2em;">
															痴情的德国特工… 从充满灰尘和危险的煤矿到闪闪发光的皇室宫殿，从代
															表着权力的走廊到爱恨纠缠的卧室，五个家族迥然不同又纠葛不断的命运逐渐揭晓，波澜
															壮阔地展现了一个我们自认为了解，但从未如此真切感受过.
														</p>
													</li>
													<li class="list-group-item">
														<div class="user">
															<span class="alert-info">陈翔六点半</span><span class="pull-right" style="color: #666666;">2018.5.6</span>
														</div>
														<p class="comment" style="text-indent: 2em;">
															痴情的德国特工… 从充满灰尘和危险的煤矿到闪闪发光的皇室宫殿，从代
															表着权力的走廊到爱恨纠缠的卧室，五个家族迥然不同又纠葛不断的命运逐渐揭晓，波澜
															壮阔地展现了一个我们自认为了解，但从未如此真切感受过.
														</p>
													</li>
													<li class="list-group-item">
														<div class="user">
															<span class="alert-info">天天</span><span class="pull-right" style="color: #666666;">2018.5.6</span>
														</div>
														<p class="comment" style="text-indent: 2em;">
															痴情的德国特工… 从充满灰尘和危险的煤矿到闪闪发光的皇室宫殿，从代
															表着权力的走廊到爱恨纠缠的卧室，五个家族迥然不同又纠葛不断的命运逐渐揭晓，波澜
															壮阔地展现了一个我们自认为了解，但从未如此真切感受过.
														</p>
													</li>
													<li class="list-group-item">
														<div class="user">
															<span class="alert-info">斗地主</span><span class="pull-right" style="color: #666666;">2018.5.6</span>
														</div>
														<p class="comment" style="text-indent: 2em;">
															痴情的德国特工… 从充满灰尘和危险的煤矿到闪闪发光的皇室宫殿，从代
															表着权力的走廊到爱恨纠缠的卧室，五个家族迥然不同又纠葛不断的命运逐渐揭晓，波澜
															壮阔地展现了一个我们自认为了解，但从未如此真切感受过.
														</p>
													</li>
												</ul>
											</div>
											
										</div>
									
								</div>
								
						
					</div>	
				</div>	
				<div class="col-md-3 col-lg-3">
					
					<div class="panel panel-info">
						<div class="panel-heading">
							<h3 class="panel-title">图书分类</h3>
						</div>
						<div class="panel-body">
							<div id="container"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
		$(document).ready(function(){
			var types = ['小说', '外国文学', '文学', '随笔', '中国文学', '经典', '日本文学', '散文', '村上春树', '诗歌', '童话', '儿童文学', '古典文学', '王小波', '杂文', '名著', '余华', '张爱玲', '当代文学', '钱钟书', '外国名著', '鲁迅', '诗词', '茨威格', '米兰·昆德拉', '杜拉斯', '港台', '漫画', '推理', '绘本', '青春', '东野圭吾', '科幻', '言情', '悬疑', '奇幻', '武侠', '日本漫画', '韩寒', '耽美', '推理小说', '亦舒', '网络小说', '三毛', '安妮宝贝', '郭敬明', '穿越', '阿加莎·克里斯蒂', '金庸', '轻小说', '科幻小说', '青春文学', '几米', '魔幻', '幾米', '张小娴', 'J.K.罗琳', '古龙', '高木直子', '沧月', '校园', '落落', '张悦然', '历史', '心理学', '哲学', '传记', '文化', '社会学', '艺术', '设计', '社会', '政治', '建筑', '宗教', '电影', '数学', '政治学', '回忆录', '中国历史', '思想', '国学', '人文', '音乐', '人物传记', '艺术史', '绘画', '戏剧', '军事', '佛教', '二战', '西方哲学', '近代史', '考古', '自由主义', '美术', '爱情', '旅行', '生活', '成长', '励志', '心理', '女性', '摄影', '职场', '教育', '美食', '游记', '灵修', '健康', '情感', '两性', '手工', '人际关系', '养生', '家居', '自助游', '经济学', '管理', '经济', '商业', '金融', '投资', '营销', '创业', '理财', '广告', '股票', '企业史', '策划', '科普', '互联网', '编程', '科学', '交互设计', '用户体验', '算法', '科技', 'web', 'UE', '交互', '通信', 'UCD', '神经网络', '程序'];
			for(var i = 0; i < 60;i++){
				var tmp = types[Math.ceil(Math.random()*types.length)];
				if(tmp != null){
					add(tmp);
					tmp = null;
				}else{
					while(true){
						var tmp = types[Math.ceil(Math.random()*types.length)];
						if(tmp != null){
							add(tmp);
							break;
						}
					}
				}
			}
		});
		function add(type){
			var node = $('<a href="#" class="interest">'+type+'</a>');
			if(node[0].innerHTML.length > 5){
				node.css("width","150px");
			}
			$('#container').append(node);
		}
	</script>
	</body>
</html>
