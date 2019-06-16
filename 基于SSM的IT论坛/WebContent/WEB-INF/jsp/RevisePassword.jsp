<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/tooltips.css" />
<link rel="stylesheet" href="css/revisePassword.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript"  src="js/bootstrap.min.js"></script>
<script type="text/javascript"  src="js/jq22.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div id="revise_body">
		<a href="${pageContext.request.contextPath}/findmainpage">返回首页</a>
		<div id='revise_container'>
			<div id="form_container2" style="padding-top: 25px;">
				<input type="hidden" id="username" value="${username}">
				<span class="control-group" id="username_input"> <label
					class="title">原密码</label> <input type="text" class="form-control"
					 placeholder="原密码" id="old_password" disabled="disabled" value="${oldpassword}"/>				
				</span> <span class="control-group" id="password1_input"> <label
					class="title">新密码</label> <input type="password"
					class="form-control" placeholder="新密码" id="new_password1"
					maxLength="20" value="" onblur="checkPwd1(this.value);" />
				</span> <span class="control-group" id="password2_input"> <label
					class="title">新密码</label> <input type="password"
					class="form-control" placeholder="新密码" id="new_password2"
					maxLength="20" value="" onblur="checkPwd2(this.value);" />
				</span> <input type="button" value="提交" class="btn btn-success"
					id="regist_btn" onclick="submitPassword()"/>
					
			</div>
		</div>
	</div>
<script type="text/javascript">

	/*
	 checkPwd1验证注册时第一次输入密码/验证登陆时输入密码
	 */
	function checkPwd1(pwd1) {
		if (pwd1.search(/^.{6,20}$/) == -1) {
			showTooltips('password1_input', '密码为空或位数太少');
			
			return false;
		} else {
			hideTooltips('password1_input');
			return true;
		}
	}
	/*
	 验证注册时第二次输入密码
	 */
	function checkPwd2(pwd2) {
		if (pwd2.search(/^.{6,20}$/) == -1) {
			showTooltips('password2_input', '密码为空或位数太少');

		} else {
			var pwd1 = $("#new_password1").val();
			if (pwd2 == pwd1) {
				hideTooltips('password2_input');
				return true;
			}
			showTooltips('password2_input', '两次输入密码必须相同');
		}
		return false;
	}
	function submitPassword() {
		var pwd1_flag=checkPwd1($("#new_password1").val());
		var pwd2_flag=checkPwd2($("#new_password2").val());
		//alert("1");
		if (pwd1_flag == true && pwd2_flag == true) {
			//alert("2");
			$.ajax({
				url:"updatepassword",
				data:{
					username:$("#username").val(),
					newpassword:$("#new_password1").val()
				},
				type:"post",
				datatype:"json",
				async:false,
				success:function(data){
					if (data == true) {
						alert("修改成功");
					} else {
						alert("修改失败");
					}
				}
				
			})
			
		} else {
		//	alert("3");
		}
	} 
</script>
</body>
</html>