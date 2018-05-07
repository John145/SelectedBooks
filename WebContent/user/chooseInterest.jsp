<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>选择您喜欢的书籍类型</title>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery.min.js"></script>
	<style>
		#container{
			width: 80%;
			margin: 0px auto;
		}
		#container:after{
			content:""; 
			display:block; 
			clear:both;
		}
		.interest{
			width: 65px;
			height: 30px;
			text-align: center;
			line-height: 30px;
			border: 1px solid #CCC;
			cursor: pointer;
			border-radius: 5px;
			float: left;
			margin: 2px;
		}
		.active{
			background-color: #3066d6;
			color: white;
		}
		.ordinary{
			background-color: white;
			color: black;
		}
		#nv{
			width: 150px;
			height: 150px;
			background-image: url(${pageContext.request.contextPath}/img/sex.jpg);
			background-size: 150px 300px;
			background-position: 0 0;
			float: left;
		}
		#nan{
			width: 150px;
			height: 150px;
			background-image: url(${pageContext.request.contextPath}/img/sex.jpg);
			background-size: 150px 300px;
			background-position: 0 150px;
			float: left;
		}
		#selectSex{
			width: 300px;
			margin: 0 auto;
		}
		#selectSex:after{
			content:""; 
			display:block; 
			clear:both;
		}
		#ok{
			width: 100px;
			height: 30px;
			background: #CCC;
			text-align: center;
			line-height: 30px;
			margin: 10px auto 10px auto;
			border-radius: 10px;
			cursor: pointer;
		}
	</style>
</head>
<body>
	<form action="user_chooseInterest" method="post">
		<h4 style="text-align: center;font-weight: bold;">让我们更懂你</h4>
		<div id="selectSex">
			<div id="nv">
				<input type="radio" name="sex" value="女"  checked="true" />
			</div>
			<div id="nan">
				<input type="radio" name="sex" value="男" />
			</div>
		</div>
		<h5 style="text-align: center;">请选择您喜欢的书籍类型<span style="color: red;">(选择五项)</span></h5>
		<div id="container"></div>
		<div id="ok" onclick="validate()">我选好了>></div>
	</form>
	<script type="text/javascript">
		$(document).ready(function(){
			var types = ['小说', '外国文学', '文学', '随笔', '中国文学', '经典', '日本文学', '散文', '村上春树', '诗歌', '童话', '儿童文学', '古典文学', '王小波', '杂文', '名著', '余华', '张爱玲', '当代文学', '钱钟书', '外国名著', '鲁迅', '诗词', '茨威格', '米兰·昆德拉', '杜拉斯', '港台', '漫画', '推理', '绘本', '青春', '东野圭吾', '科幻', '言情', '悬疑', '奇幻', '武侠', '日本漫画', '韩寒', '耽美', '推理小说', '亦舒', '网络小说', '三毛', '安妮宝贝', '郭敬明', '穿越', '阿加莎·克里斯蒂', '金庸', '轻小说', '科幻小说', '青春文学', '几米', '魔幻', '幾米', '张小娴', 'J.K.罗琳', '古龙', '高木直子', '沧月', '校园', '落落', '张悦然', '历史', '心理学', '哲学', '传记', '文化', '社会学', '艺术', '设计', '社会', '政治', '建筑', '宗教', '电影', '数学', '政治学', '回忆录', '中国历史', '思想', '国学', '人文', '音乐', '人物传记', '艺术史', '绘画', '戏剧', '军事', '佛教', '二战', '西方哲学', '近代史', '考古', '自由主义', '美术', '爱情', '旅行', '生活', '成长', '励志', '心理', '女性', '摄影', '职场', '教育', '美食', '游记', '灵修', '健康', '情感', '两性', '手工', '人际关系', '养生', '家居', '自助游', '经济学', '管理', '经济', '商业', '金融', '投资', '营销', '创业', '理财', '广告', '股票', '企业史', '策划', '科普', '互联网', '编程', '科学', '交互设计', '用户体验', '算法', '科技', 'web', 'UE', '交互', '通信', 'UCD', '神经网络', '程序'];
				for(var i = 0; i < types.length;i++){
					var node = $('<div class="interest ordinary">'+types[i]+'</div>');
					if(node[0].innerHTML.length > 5){
						node.css("width","150px");
					}
					$('#container').append(node);
				}
			$('.interest').click(function(){
				var beforeCount = countOfSelected();
				if(beforeCount == 5 && this.className == 'interest ordinary'){
					alert("最多只能选择5项");
					return;
				}
				if(this.className == 'interest ordinary'){
					this.className = 'interest active';
				}else{
					this.className = 'interest ordinary';
				}
				var afterCount = countOfSelected();
				if(afterCount == 5){
					$('#ok').css("background","#5cb85c");
					$('#ok').css("color","white");
				}else if(afterCount < 5){
					$('#ok').css("background","#CCC");
					$('#ok').css("color","black");
				}
			});
		});
		function countOfSelected(){
			var interests = $('.interest');
			var count = 0;
			for(var i = 0; i < interests.length; i++){
				if(interests[i].className == 'interest active'){
					count++;
				}
			}
			return count;
		}
		function validate(){
			//先判断数据是否有5条
			var count = countOfSelected();
			if(count < 5){
				alert("请选择五个标签！！！");
				return ;
			}
			//先将数据进行封装
			var interests = $('.interest');
			var str = "";
			for(var i = 0; i < interests.length; i++){
				if(interests[i].className == 'interest active'){
					str = str + interests[i].innerHTML+'#';
				}
			}
			$('#container').append('<input type="hidden" name="interests" value="'+str+'" />');
			$('form').submit();
		}
	</script>
</body>
</html>