<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
		margin:0px; 
	}
	#main{
		margin: 0 auto;
		width: 80%;
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
	.interest:hover{
		background-color: #3066d6;
		color: white;
	}
	#container{
		height: 300px;
		overflow: scroll;
	}
	#result{
		height: 72px;
		border: 1px solid #CCC;
	}
	#filea{
		position: relative;
		display: block;
		width: 120px;
		height: 170px;
	}
	#file{
		width: 120px;
		height: 170px;
		opacity: 0;
		position: absolute;
	}
	#model{
		width: 50%;
		height: 200px;
		border-radius: 1px solid #CCC;
		position: fixed;
		top: -240px;
		left: 25%;
		background: #CCC;
		transition: 1s;
		padding: 20px;
	}
	#model img{
		width: 120px;
		height: 170px;
	}
</style>
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
</head>
<body>
	<div id="main">
		<h4>修改个人信息</h4>
		<s:actionmessage/>
		<s:form action="user_update" method="post" id="form" theme="simple" namespace="/">
			<a id="filea" href="javascript:;" style="background: url('${pageContext.request.contextPath }/<s:property value="%{#session.curUser.headPic}"/>');
		background-size: 100% 100%;">
				<input type="file" id="file" name="file"/>
			</a>
			性别：<s:radio  list="#{'男':'男','女':'女'}" name="sex" value="%{#session.curUser.sex}"></s:radio><br />
			昵称：<s:textfield name="nickname" value="%{#session.curUser.nickname}"></s:textfield><br />
			Email：<s:textfield name="email" value="%{#session.curUser.email}"></s:textfield><br />
			地址：<s:textfield name="address" value="%{#session.curUser.address}"></s:textfield><br />
			喜欢的书籍类型：
			<div id="result"></div>
			<div id="container"></div>
			<s:textfield type="hidden" id="interests" name="interests" value="%{#session.curUser.interests}"></s:textfield>
			<button type="button" onclick="validate()">提交</button>
		</s:form>
		<div id="model">
			<img id="getImg" />
			<button onclick="cancel()">取消</button>
			<button onclick="upload()">修改</button>
		</div>
		<script src="${pageContext.request.contextPath }/scripts/ajaxFileUpload.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				var types = ['小说', '外国文学', '文学', '随笔', '中国文学', '经典', '日本文学', '散文', '村上春树', '诗歌', '童话', '儿童文学', '古典文学', '王小波', '杂文', '名著', '余华', '张爱玲', '当代文学', '钱钟书', '外国名著', '鲁迅', '诗词', '茨威格', '米兰·昆德拉', '杜拉斯', '港台', '漫画', '推理', '绘本', '青春', '东野圭吾', '科幻', '言情', '悬疑', '奇幻', '武侠', '日本漫画', '韩寒', '耽美', '推理小说', '亦舒', '网络小说', '三毛', '安妮宝贝', '郭敬明', '穿越', '阿加莎·克里斯蒂', '金庸', '轻小说', '科幻小说', '青春文学', '几米', '魔幻', '幾米', '张小娴', 'J.K.罗琳', '古龙', '高木直子', '沧月', '校园', '落落', '张悦然', '历史', '心理学', '哲学', '传记', '文化', '社会学', '艺术', '设计', '社会', '政治', '建筑', '宗教', '电影', '数学', '政治学', '回忆录', '中国历史', '思想', '国学', '人文', '音乐', '人物传记', '艺术史', '绘画', '戏剧', '军事', '佛教', '二战', '西方哲学', '近代史', '考古', '自由主义', '美术', '爱情', '旅行', '生活', '成长', '励志', '心理', '女性', '摄影', '职场', '教育', '美食', '游记', '灵修', '健康', '情感', '两性', '手工', '人际关系', '养生', '家居', '自助游', '经济学', '管理', '经济', '商业', '金融', '投资', '营销', '创业', '理财', '广告', '股票', '企业史', '策划', '科普', '互联网', '编程', '科学', '交互设计', '用户体验', '算法', '科技', 'web', 'UE', '交互', '通信', 'UCD', '神经网络', '程序'];
				for(var i = 0; i < types.length;i++){
					var node = $('<div class="interest ordinary">'+types[i]+'</div>');
					if(node[0].innerHTML.length > 5){
						node.css("width","150px");
					}
					$('#container').append(node);
					node.click(function(){
						//先判断result中有几个
						if($("#result").children().length >= 5 && $(this).parent()[0] == $('#container')[0]){
							alert("最多只能选择五个!!!");
							return ;
						}
						if($(this).parent()[0] == $('#container')[0]){
							$('#result').append($(this));
						}else{
							$('#container').prepend($(this));
						}
					});
				}
				
				//当标签创建完成后将interets数据显示到result中
				var interests = $('#interests').val().split('#');
				var containerChildren = $('#container').children();
				for(var i=0;i < interests.length;i++){
					for(var j = 0; j < containerChildren.length;j++){
						if($(containerChildren[j]).text() == interests[i]){
							$('#result').append(containerChildren[j]);
						}
					}
				}
				
				//头像上传处理
				$('#file').change(function(){
					var file = this.files[0];
					if(file){
						var reader = new FileReader();
		                reader.onload = function (event) {
		                    var txt = event.target.result;
		                    $('#model').css("top","50%");
		                    $('#model').css("transform","translateY(-50%)");
		                    $('#model img').attr("src",txt);
		                };
						reader.readAsDataURL(file);
					}
				});
			});
	
			function validate(){
				console.log($('#result').children().length);
				if($('#result').children().length < 5){
					alert("不能少于5个标签");
				}else if($('#result').children().length > 5){
					alert("不能多于5个标签");
				}else{
					//将数据封装到隐藏的input标签中
					var interestsInput = $('#interests');
					var interests = $('#result div');
					var str = "";
					for(var i = 0; i< interests.length;i++){
						str = str + interests[i].innerHTML + "#";
					}
					console.log(str);
					interestsInput.val(str);
					$('#form').submit();
				}
			}
			function cancel(){
				$('#model').css("top","-240px");
			}
			function upload(){
				if($('#file').val() == ""){
					alert("请选择上传的文件!!!");
					return ;
				}
				$.ajaxFileUpload({
				   url: 'user_upload',             //用于文件上传的服务器端请求地址
				   type: 'post',
				   secureuri: false,                   //是否需要安全协议，一般设置为false
				   fileElementId: 'file',        //文件上传域的ID 在这里设置要上传的多个input的ID
				   dataType: 'json',                   //返回值类型 一般设置为json
				   success: function (data)    //服务器成功响应处理函数
				   {
				       if(data == 1){
				    	   $('#model').css("top","-240px");
				    	   location.reload();
				       }
				   }
				});
			}
		</script>
	</div>
</body>
</html>