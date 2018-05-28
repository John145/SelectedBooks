<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
		<title></title>
		<style type="text/css">
			.a {
				text-align: center;
			}
			
			a:hover {
				text-decoration: none;
			}
			
			a:focus {
				text-decoration: none;
			}
			
			.row {
				margin-bottom: 20px;
			}
			#myul li {
				display: inline-block;
			}
			.bookInfo p{
				margin-bottom: 8px;
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
	</head>

	<body>
		<s:include value="top.jsp"></s:include>

		<div class="container">
			<div class="row">
				<div class="col-md-9 col-lg-9">
					<!--面板组件-->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">搜索结果</h3>
						</div>
						<nav class="navbar navbar-default">
							<ul class="nav navbar-nav">
								<li>
									<a href="${pageContext.request.contextPath }/book_search?curPage=<s:property value="curPage" />&keyword=<s:property value="keyword" />">综合</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath }/book_searchByNew?curPage=<s:property value="curPage" />&keyword=<s:property value="keyword" />">最新</a>
								</li>
								<li class="active" >
									<a href="${pageContext.request.contextPath }/book_searchByScore?curPage=<s:property value="curPage" />&keyword=<s:property value="keyword" />">评分</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath }/book_searchByPrice?curPage=<s:property value="curPage" />&keyword=<s:property value="keyword" />">价格</a>
								</li>
							</ul>
						</nav>
						<div class="panel-body">
							<s:iterator value="list" var="b">
								<div class="row">
									<div class="col-md-2 col-xs-6">
										<a href="book_detail?bid=<s:property value="#b.bid" />">
											<img style="width: 100%; height: auto;" src="<s:property value="#b.picUrl"/>" />
										</a>
									</div>
									<div class="col-md-10">
										<div class="bookInfo">
											<p>
												<a href="book_detail?bid=<s:property value="#b.bid" />"><span><s:property value="#b.bookName"/></span></a>
											</p>
											<p><span style="color: #e09015;"><s:property value="#b.score" /></span><span style="color: #666666;">(<s:property value="#b.assessNumber" />人评价)</span></p>
											<p style="color: #666666;">
												<span class="author"><s:property value="#b.author" />/</span>
												<span class="publisher"><s:property value="#b.publisher" />/</span>
												<span class="year"><s:property value="#b.publishYear" />/</span>
												<span class="price"><s:property value="#b.price" /></span>
											</p>
											<s:if test="#b.contentIntroduce.length() > 140">
												<p class="hidden-xs" style="text-indent: 2em; text-overflow: ellipsis;overflow: hidden;"><s:property value="#b.contentIntroduce.substring(0,135)" />...</p>
											</s:if>
											<s:elseif test="#b.contentIntroduce.length() == 1">
												
											</s:elseif>
											<s:else>
												<p class="hidden-xs" style="text-indent: 2em; text-overflow: ellipsis;overflow: hidden;"><s:property value="#b.contentIntroduce" /></p>
											</s:else>
										</div>
									</div>
								</div>
							</s:iterator>
						</div>
						<div class="row">
							<div class="col-md-12" style="margin: auto;">
									
								<ul class="pagination" id="myul" style="display: block; text-align: center;">
									<s:if test="curPage != 1">
										<li>
											<a href="${pageContext.request.contextPath }/book_searchByScore?curPage=1&keyword=<s:property value="keyword"/>">首页</a>
										</li>
										<li>
											<a href="${pageContext.request.contextPath }/book_searchByScore?curPage=<s:property value="curPage-1" />&keyword=<s:property value="keyword"/>">上一页</a>
										</li>
									</s:if>
										<li class="active">
											<a href="javascript:;"><s:property value="curPage" /></a>
										</li>
									<s:if test="curPage != totalPage && totalPage != 0">
										<li>
											<a href="${pageContext.request.contextPath }/book_searchByScore?curPage=<s:property value="curPage+1" />&keyword=<s:property value="keyword"/>">下一页</a>
										</li>
										<li>
											<a href="${pageContext.request.contextPath }/book_searchByScore?curPage=<s:property value="totalPage" />&keyword=<s:property value="keyword"/>">尾页</a>
										</li>
									</s:if>
								</ul>
							</div>
						</div>
						<div style="margin: 8px;">共搜索到<s:property value="totalCount"/>条记录</div>
					</div>
				</div>
				<!--end row -->
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
				<!--end右边部分 -->
			</div>
		</div>
		<script type="text/javascript">
			$(document).ready(function(){
				var types = ['小说', '外国文学', '文学', '随笔', '中国文学', '经典', '日本文学', '散文', '村上春树', '诗歌', '童话', '儿童文学', '古典文学', '王小波', '杂文', '名著', '余华', '张爱玲', '当代文学', '钱钟书', '外国名著', '鲁迅', '诗词', '茨威格', '米兰·昆德拉', '杜拉斯', '港台', '漫画', '推理', '绘本', '青春', '东野圭吾', '科幻', '言情', '悬疑', '奇幻', '武侠', '日本漫画', '韩寒', '耽美', '推理小说', '亦舒', '网络小说', '三毛', '安妮宝贝', '郭敬明', '穿越', '阿加莎·克里斯蒂', '金庸', '轻小说', '科幻小说', '青春文学', '几米', '魔幻', '幾米', '张小娴', 'J.K.罗琳', '古龙', '高木直子', '沧月', '校园', '落落', '张悦然', '历史', '心理学', '哲学', '传记', '文化', '社会学', '艺术', '设计', '社会', '政治', '建筑', '宗教', '电影', '数学', '政治学', '回忆录', '中国历史', '思想', '国学', '人文', '音乐', '人物传记', '艺术史', '绘画', '戏剧', '军事', '佛教', '二战', '西方哲学', '近代史', '考古', '自由主义', '美术', '爱情', '旅行', '生活', '成长', '励志', '心理', '女性', '摄影', '职场', '教育', '美食', '游记', '灵修', '健康', '情感', '两性', '手工', '人际关系', '养生', '家居', '自助游', '经济学', '管理', '经济', '商业', '金融', '投资', '营销', '创业', '理财', '广告', '股票', '企业史', '策划', '科普', '互联网', '编程', '科学', '交互设计', '用户体验', '算法', '科技', 'web', 'UE', '交互', '通信', 'UCD', '神经网络', '程序'];
				for(var i = 0; i < types.length;i++){
					/*var tmp = types[Math.ceil(Math.random()*types.length)];
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
					}*/
					add(types[i]);
				}
			});
			function add(type){
				var node = $('<a href="${pageContext.request.contextPath}/book_searchBySort.action?curPage=1&sort='+type+'" class="interest">'+type+'</a>');
				if(node[0].innerHTML.length > 5){
					node.css("width","150px");
				}
				$('#container').append(node);
			}
		</script>
	</body>
</html>