$(function(){
	
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
		//$(this).parent().next().hide();
	});
	
	//表单验证
	var isCanCheckTheUserName = false;
	$($('.form_text_ipt input')[0]).bind('input propertychange',function(){
		if($(this).val()==""){
			$(this).css({
				'color':'red',
			});
			$(this).parent().css({
				'border':'solid 1px red',
			});
			//$(this).parent().next().find('span').html('helow');
			$(this).parent().next().find('span').text("不能为空");
			$(this).parent().next().css("color","red");
			$(this).parent().next().show();
			isCanCheckTheUserName = false;
		}else if($(this).val().length < 6){
			$(this).css({
				'color':'red',
			});
			$(this).parent().css({
				'border':'solid 1px red',
			});
			$(this).parent().next().find('span').text("不能少于6个字符");
			$(this).parent().next().css("color","red");
			$(this).parent().next().show();
			isCanCheckTheUserName = false;
		}else{
			$(this).css({
				'color':'black',
			});
			$(this).parent().css({
				'border':'solid 1px #ccc',
			});
			$(this).parent().next().hide();
			isCanCheckTheUserName = true;
		}
	});
	$($('.form_text_ipt input')[2]).bind('input propertychange',function(){
		if($(this).val()==""){
			$(this).css({
				'color':'red',
			});
			$(this).parent().css({
				'border':'solid 1px red',
			});
			//$(this).parent().next().find('span').html('helow');
			$(this).parent().next().find('span').text("不能为空");
			$(this).parent().next().show();
		}else if($(this).val().length < 6){
			$(this).css({
				'color':'red',
			});
			$(this).parent().css({
				'border':'solid 1px red',
			});
			$(this).parent().next().find('span').text("不能少于6个字符");
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
	var $nickName = $($('.form_text_ipt input')[1]);
	$nickName.bind('input propertychange',function(){
		if($(this).val()==""){
			$(this).css({
				'color':'red',
			});
			$(this).parent().css({
				'border':'solid 1px red',
			});
			//$(this).parent().next().find('span').html('helow');
			$(this).parent().next().find('span').text("不能为空");
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
	var $checkPwd = $($('.form_text_ipt input')[3]);
	$checkPwd.bind('input propertychange',function(){
		if($(this).val()==""){
			$(this).css({
				'color':'red',
			});
			$(this).parent().css({
				'border':'solid 1px red',
			});
			//$(this).parent().next().find('span').html('helow');
			$(this).parent().next().find('span').text("不能为空");
			$(this).parent().next().show();
		}else if($(this).val().length < 6){
			$(this).css({
				'color':'red',
			});
			$(this).parent().css({
				'border':'solid 1px red',
			});
			$(this).parent().next().find('span').text("不能少于6个字符");
			$(this).parent().next().show();
		}else if($('.form_text_ipt input')[2].value != $('.form_text_ipt input')[3].value){
			$(this).css({
				'color':'red',
			});
			$(this).parent().css({
				'border':'solid 1px red',
			});
			$(this).parent().next().find('span').text("两次密码不相同");
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
	$("#username").change(function(){
		var value = $(this).val();
		var $this = $(this);
		if(isCanCheckTheUserName){
			$.post("user_validateUsername",{"username":value},function(result){
				if(result == "1"){
					var check = $this.parent().next();
					console.log(check);
					check.css("color","green");
					check.find('span').text('账号可用');
					check.show();
				}else if(result == "0"){
					var check = $this.parent().next();
					check.css("color","red");
					check.find('span').text('账号不可用');
					check.show();
				}
			});
		}
	});
});
function validate(){
	var inputs = $('.form_text_ipt input,.form_text_yz input');
	if(inputs[0].value == ""){
		$(inputs[0]).css({
			'color':'red',
		});
		$(inputs[0]).parent().css({
			'border':'solid 1px red',
		});
		$(inputs[0]).parent().next().find('span').text("不能为空");
		$(inputs[0]).parent().next().show();
	}else if(inputs[0].value.length < 6){
		$(inputs[0]).css({
			'color':'red',
		});
		$(inputs[0]).parent().css({
			'border':'solid 1px red',
		});
		$(inputs[0]).parent().next().find('span').text("不能少于6个字符");
		$(inputs[0]).parent().next().show();
	}else if(inputs[1].value == ""){
		$(inputs[1]).css({
			'color':'red',
		});
		$(inputs[1]).parent().css({
			'border':'solid 1px red',
		});
		$(inputs[1]).parent().next().find('span').text("不能为空");
		$(inputs[1]).parent().next().show();
	}else if(inputs[2].value == ""){
		$(inputs[2]).css({
			'color':'red',
		});
		$(inputs[2]).parent().css({
			'border':'solid 1px red',
		});
		$(inputs[2]).parent().next().find('span').text("不能为空");
		$(inputs[2]).parent().next().show();
	}else if(inputs[2].value.length < 6){
		$(inputs[2]).css({
			'color':'red',
		});
		$(inputs[2]).parent().css({
			'border':'solid 1px red',
		});
		$(inputs[2]).parent().next().find('span').text("不能少于6个字符");
		$(inputs[2]).parent().next().show();
	}else if(inputs[3].value==""){
		$(inputs[3]).css({
			'color':'red',
		});
		$(inputs[3]).parent().css({
			'border':'solid 1px red',
		});
		$(inputs[3]).parent().next().find('span').text("不能为空");
		$(inputs[3]).parent().next().show();
	}else if(inputs[3].value.length < 6){
		$(inputs[3]).css({
			'color':'red',
		});
		$(inputs[3]).parent().css({
			'border':'solid 1px red',
		});
		$(inputs[3]).parent().next().find('span').text("不能少于6个字符");
		$(inputs[3]).parent().next().show();
	}else if(inputs[3].value != inputs[2].value){
		$(inputs[3]).css({
			'color':'red',
		});
		$(inputs[3]).parent().css({
			'border':'solid 1px red',
		});
		$(inputs[3]).parent().next().find('span').text("两次密码不相同");
		$(inputs[3]).parent().next().show();
	}else if(inputs[4].value == ""){
		$(inputs[4]).css({
			'color':'red',
			'border':'solid 1px red'
		});
		$(inputs[4]).parent().next().show();
	}else{		
		$('form').submit();
	}
}