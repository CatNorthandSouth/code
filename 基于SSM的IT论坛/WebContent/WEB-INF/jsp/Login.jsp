<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/login.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript"  src="js/bootstrap.min.js"></script>
<script type="text/javascript"  src="js/jq22.js"></script>
<title>前台登录/注册</title>
</head>
	<body style="background-color: #000000;">
		<input type="hidden" id="hidden_flag" value="${userNameAndPasswordError}">
		<a id="Login_start_" class="btn btn-danger" style="width:100px;height:40px;border-radius: 0;">登陆</a>
		<a id="Regist_start_" class="btn btn-success" style="width:100px;height:40px;border-radius: 0;">注册</a>

		<!-- 会员登录  -->
		<!--<div id='Login_start' style="position: absolute;" >-->
		<div id='_start'>
			<div id='_close' style="display: none;">
				<span class="glyphicon glyphicon-remove"></span>
			</div>
			<br /> 
			<!--登录框-->
			<div id="login_container">
				<div id="lab1">
					<span id="lab_login">会员登录</span>
					<span id="lab_toRegist">
						&emsp;还没有账号&nbsp;
						<span id='toRegist' style="color: #EB9316;cursor: pointer;">立即注册</span>
					</span>
				</div>
				<div style="width:330px;">
					<span id="lab_type1">邮箱/账号登陆</span>
				</div>
				
				<div id="form_container1">
				 <form action="togomainpage" method="post" id="login_form" > 
					<br /> <span class="control-group" id="login_input"> <input
						type="text" class="form-control" placeholder="邮箱/用户名"
						id="login_number" name="login_number"
						onblur="checkEmailUserName(this.value)" />
					</span> <span class="control-group" id="password_input"> <input
						type="password" class="form-control" placeholder="密码"
						id="login_password" maxLength="20" name="login_password"
						onblur="checkPwd(this.value)" />
					</span> <input type="button" value="登录" class="btn btn-success"
						id="login_btn" onclick="loginUser()"/>
				</form>
				<span id="rememberOrfindPwd">
						<span>
							<input id="remember" type="checkbox" style="margin-bottom: -1.5px;"/>
						</span>
					    <span style="color:#000000">
							记住密码&emsp;&emsp;&emsp;&emsp;
						</span>
					    <span style="color:#000000;cursor: pointer;" id="forgetPassword">
							忘记密码
						</span>
					</span>
				</div>
				
				<div style="display:block;width:330px;height：40px;">
					<span id="lab_type2">使用第三方直接登陆</span>
				</div>
				<div style="width:330px;height:100px;border-bottom: 1px solid #FFFFFF;">
					<br />
					<button id="login_QQ" type="button" class="btn btn-info">
						<img src="img/qq32.png" style="width:20px;margin-top:-4px;" />&emsp;QQ登录
					</button>
					<button id="login_WB" type="button" class="btn btn-danger">
						<img src="img/sina32.png" style="width:20px;margin-top:-4px;" />&emsp;微博登录
					</button>
				</div>
			</div>
			<!-- 会员注册 -->
			<div id='regist_container' style="display: none;">
				<div id="lab1">
					<span id="lab_login">会员注册</span>
					<span id="lab_toLogin">
						&emsp;已有账号&nbsp;
						<span id='toLogin' style="color: #EB9316;cursor: pointer;">立即登录</span>
					</span>
				</div>
			<form action="register" method="post">
				<div id="form_container2" style="padding-top: 25px;">
					<span class="control-group" id="username_input"> <input
						type="text" class="form-control" placeholder="用户名"
						id="regist_account" name="regist_account"
						onblur="checkUserName(this.value)" />
					</span> <span class="control-group" id="password1_input"> <input
						type="password" class="form-control" placeholder="密码"
						id="regist_password1" name="regist_password1" maxLength="20"
						onblur="checkPwd1(this.value)" />
					</span> <span class="control-group" id="password2_input"> <input
						type="password" class="form-control" placeholder="确认密码"
						id="regist_password2" name="regist_password2" maxLength="20"
						onblur="checkPwd2(this.value)" />
					</span> <span class="control-group" id="email_input"> <input
						type="text" class="form-control" placeholder="邮箱"
						id="regist_email" name="regist_email" value=""
						onblur="checkEmail(this.value)" />
					</span> <span class="control-group" id="code_input"> <input
						type="text" class="form-control" placeholder="验证码"
						id="regist_vcode" onblur="checkCode()" /> <img id="imgCode"
						class="register_img_code" style="height: 35px; margin-top: 10px"
						alt="验证码" src="${pageContext.request.contextPath}/getCode">
					</span>
				</div>
				<input type="button" value="注册" class="btn btn-success"
					id="regist_btn" />
			</form>
		</div>
		</div>
	</body>
	<script type="text/javascript">
		var clock = '';
		var nums = 30;
		var btn;
		$(document).ready(function() {
			//打开会员登录 
			$("#Login_start_").click(function() {
				$("#regist_container").hide();
				$("#_close").show();
				$("#_start").animate({
					left: '350px',
					height: '520px',
					width: '400px'
				}, 500, function() {
					$("#login_container").show(500);
					$("#_close").animate({
						height: '40px',
						width: '40px'
					}, 500);
				});
			});
			//打开会员注册
			$("#Regist_start_").click(function() {
				$("#login_container").hide();
				$("#_close").show();
				$("#_start").animate({
					left: '350px',
					height: '520px',
					width: '400px'
				}, 500, function() {
					$("#regist_container").show(500);
					$("#_close").animate({
						height: '40px',
						width: '40px'
					}, 500);
				});
			});
			//关闭
			$("#_close").click(function() {
				
				$("#_close").animate({
					height: '0px',
					width: '0px'
				}, 500, function() {
					$("#_close").hide(500);
					$("#login_container").hide(500);
					$("#regist_container").hide(500);
					$("#_start").animate({
						left: '0px',
						height: '0px',
						width: '0px'
					}, 500);
				});
			});
			//去 注册
			$("#toRegist").click(function(){
				$("#login_container").hide(500);
				$("#regist_container").show(500);
			});
			//去 登录
			$("#toLogin").click(function(){
				$("#regist_container").hide(500);
				$("#login_container").show(500);
			});
		});
/* 		function sendCode(thisBtn) {
			btn = thisBtn;
			btn.disabled = true; //将按钮置为不可点击
			btn.value = '重新获取（'+nums+'）';
			clock = setInterval(doLoop, 1000); //一秒执行一次
		} */
/* 
		function doLoop() {
			nums--;
			if (nums > 0) {
				btn.value = '重新获取（'+nums+'）';
			} else {
				clearInterval(clock); //清除js定时器
				btn.disabled = false;
				btn.value = '点击发送验证码';
				nums = 10; //重置时间
			}
		} */
		/*
			找回密码
		*/
		function chgUrl(url){
			var timestamp=(new Date()).valueOf();
			url=url.substring(0,20);
			if (url.indexOf("&") >= 0) {
				url=url+"×tamp=" + timestamp;
			}else{
				url=url+"?timestamp=" + timestamp;
			}
			return url;
		}
		function checkCode(){
			imgCode=$("#regist_vcode").val();
			
			$.ajax({
				url:"checkCode",
				data:{
					"code":imgCode
				},
				type:"post",
				datatype:"json",
				success:function(data){
					if (data == "success") {
						hideTooltips("code_input");
					} else {
						showTooltips("code_input","验证码不正确,请重新输入");
					}
				},
				error:function(){
					alert("数据加载不出来");
				}	
			})
		}
		$("#imgCode").click(function(){
			$(this).attr("src",chgUrl($("#imgCode").attr("src")));
		})	
		$("#forgetPassword").click(function(){
			window.location.href="findpassword";
		})
		
		/*
		验证登陆时的邮箱/用户名
		*/
		function checkEmailUserName(value) {
			if (value.search(/^[a-z0-9_-]{6,16}$/) == -1) {
				if(value.search(/^[\w\.+-]+@[\w\.+-]+$/) == -1){
					showTooltips('login_input','请输入正确的邮箱或用户名');
					return false;
				} else{
					return true;
				}
			} else {
                hideTooltips('login_input');
                return true;
			}
		}
		/*
			checkUserName验证注册时输入用户名
		*/
		function checkUserName(username) {
			if (username.search(/^[a-z0-9_-]{6,16}$/) == -1) {
				showTooltips('username_input','用户名只能包含字母和数字且不为空');
				return false;
			} else {
                hideTooltips('username_input');
                $.ajax({
                	url:"checkRegisterAccount",
                	type:"post",
                	data:{
                		account:username
                	},
                	dataType:"json",
                	success:function(data){
                		if (data == true) {
                			showTooltips('username_input','用户名已存在');
						} else {
							hideTooltips('username_input');
						}
                	},
                	error:function(){
                		alert("用户名检测失败！！！");
                	}
                });
                return true;
			}
		}

		/*
			checkEmail验证注册时输入email
		*/
		function checkEmail(email){
			if (email.search(/^[\w\.+-]+@[\w\.+-]+$/) == -1) {
				showTooltips('email_input','请输入正确的Email地址');
				return false;
			}else{
				hideTooltips('email_input');
				$.ajax({
					url:"checkRegisterEmail",
					type:"post",
					dataType:"json",
					data:{
						email:email
					},
					success:function(data){
						if (data == true) {
							showTooltips('email_input','邮箱已被注册');
						} else {
							hideTooltips('email_input');
						}
					}
				});
				return true;
			}				
		}
		/*
			checkPwd1验证注册时第一次输入密码/验证登陆时输入密码
		*/
		function checkPwd(pwd1) {
			if (pwd1.search(/^.{6,20}$/) == -1) {
				
				showTooltips('password_input','密码为空或位数太少');
				return false;
			}else {
				hideTooltips('password_input');
				return true;
			}
		}
		function checkPwd1(pwd1) {
			if (pwd1.search(/^.{6,20}$/) == -1) {
				
				showTooltips('password1_input','密码为空或位数太少');
				return false;
			}else {
				hideTooltips('password1_input');
				return true;
			}
		}
		/*
			验证注册时第二次输入密码
		*/
		function checkPwd2(pwd2) {
			if (pwd2.search(/^.{6,20}$/) == -1) {
				showTooltips('password2_input','密码为空或位数太少');
				
			}else {
				var pwd1=$("#regist_password1").val();			
				if (pwd2 == pwd1) {
					hideTooltips('password2_input');
					return true;
				}			
				showTooltips('password2_input','两次输入密码必须相同');
			}
			return false;
		}	
		/*
			注册提交
		*/
		$("#regist_btn").click(function() {
			var username_flag=checkUserName($("#regist_account").val());
			var password1_flag=checkPwd1($("#regist_password1").val());
			var password2_flag=checkPwd2($("#regist_password2").val());
			var email_flag=checkEmail($("#regist_email").val());
			if(username_flag == true && password1_flag == true && password2_flag == true && email_flag == true){
				hideAllTooltips();
				$.ajax({
					url:"register",
					type:"post",
					dataType:"json",
					data:{
						account:$("#regist_account").val(),
						password:$("#regist_password1").val(),
						email:$("#regist_email").val()
					},
					success:function(data){
						if (data == true) {
							alert("注册成功");
						} else {
							alert("注册失败");
						}
					},
					error:function(){
						alert("系统错误");
					}
				});
			}else{
				alert("注册失败！！");
			}
		})
		$(document).ready(function(){
			$("#login_QQ").click(function(){
				alert("暂停使用！");
			});
			$("#login_WB").click(function(){
				alert("暂停使用！");
			});
		});
		/*
		登陆验证
	*/

	
	function loginUser() {
		var login_username_flag=checkEmailUserName($("#login_number").val());
		var login_password_flag=checkPwd1($("#login_password").val());
		var flag=$("#hidden_flag").val();
		//alert(login_username_flag+"  "+login_password_flag);
		if(login_username_flag == true && login_password_flag == true){
			$.ajax({
				url:"checkUser",
				type:"post",
				dataType:"json",
				data:{
					account:$("#login_number").val(),
					password:$("#login_password").val()
				},
				success:function(data){
					if(data == true){
						//window.location.href="login";
						//$("#login_form").submit();
						$.ajax({
							url:"login",
							type:"post",
							dataType:"json",
							data:{
								account:$("#login_number").val(),
								password:$("#login_password").val()
							},
							success:function(data){
								if (data == true) {
									//window.location.href="${pageContext.request.contextPath}/togomainpage";
									$("#login_form").submit();
								} else {
								//	alert("..");
									alert("用户不存在或该用户已被禁用！");
								}
							},
							error:function(){
								alert("网络错误");
							}
						});
						return true;
					}else{
						alert("账号密码错误");
						return false;
					}
				},
				error:function(){
					alert("网络错误");
				}
			});
		}else{
			//alert(flag);
		}			
	}
	
/* 		$("#login_btn").click(function () {
		var login_username_flag=checkEmailUserName($("#login_number").val());
		var login_password_flag=checkPwd1($("#login_password").val());
		var flag=$("#hidden_flag").val();
		if(login_username_flag == true && login_password_flag == true){
			$.ajax({
				url:"checkUser",
				type:"post",
				dataType:"json",
				data:{
					account:$("#login_number").val(),
					password:$("#login_password").val()
				},
				success:function(data){
					if(data == true){
						window.location.href="login";
					}else{
						alert("账号密码错误");
					}
				},
				error:function(){
					alert("网络错误");
				}
			});
		}else{
			alert(flag);
		}
	}) */
	</script>
</html>