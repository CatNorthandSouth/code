<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/jq22.css" rel="stylesheet" type="text/css" />
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/jq22.js"></script>

<title>找回密码</title>
</head>
<body>
<div class='body_main'> 
  <!-- start main content -->
  <div class='index_box' style='margin-top:20px;'>
    <div style="position:fixed;color:red;margin:70px 0 0 450px;font-size:16px;Z-index:100;display:block;" id="hint"></div>
    <div class='box_title'>
      <div class='text_content'>
        <h1>找回密码</h1>
      </div>
    </div>
    <div class='box_main'>
      <div id="register" class="register">
        <form id="form" action="" method="post" >
          <div id="form_submit" class="form_submit">
            <div class="fieldset">
              <div class="field-group">
                <label class="required title">用户名</label>
                <span class="control-group" id="login_input">
                <div class="input_add_long_background">
                  <input class="register_input" type="text" id="username" name="username" maxLength="11" value="" onblur="changeUserName(this.value);">
                </div>
                </span>
                <label class="tips">请正确输入您的用户名</label>
              </div>
              <div class="field-group">
                <label class="required title">邮箱</label>
                <span class="control-group" id="email_input">
                <div class="input_add_long_background">
                  <input class="register_input" type="text" id="email" name="email" maxLength="50" value="" onblur="checkEmail(this.value);">
                </div>
                </span>
                <label class="tips">请输入您注册时所填写的邮箱</label>
              </div>
              <div class="field-group">
                <label class="required title">验证码</label>
                <span class="control-group" id="code_input">
                <div class="input_add_background" style="margin-right:15px;">
                  <input class="register_input_ot" type="text" id="code" name="code"  max_length="6"  onblur="checkCode()">
                  <img id="imgCode" class="register_img_code" style="float: right; left: 10px" alt="验证码" src="${pageContext.request.contextPath}/getCode">
                </div>
                </span>
                <label class="tips">请您输入图片上的验证码，点击”图片“刷新验证码</label>
              </div>
              <div class="field-group">
                <label class="required title"></label>
                <span class="control-group" style="line-height:28px;" id="checkbox_input">
                <input id="way_user_agreement" type="checkbox"  name="username">
                <span style="color: #000000;cursor: pointer;">
                	<a target="_blank" href="http://localhost:8080/bs/yonghushouze.jsp">《用户手册》</a>
                </span>
                </span>
                <label class="tips" style="margin-bottom:5px;" id="tooltext1">请您认真查看保密协议</label>
              </div>

            </div>
          </div>
          <div id="div_submit" class="div_submit">
            <div class='div_submit_button' id="div_submit_button1" style="display:none;">
            <a href="${pageContext.request.contextPath}/bs/revisepassword"> <input id="submit1" type="button"  value="修改密码" class='button_button '></a> 
            </div>
            <div class='div_submit_button'>
              <input id="submit" type="submit" value="提交" class='button_button disabled' onclick="check()">
            </div>
          </div>
        </form>
      </div>

  </div>
    <div class='box_bottom'></div>
  </div>
</div>
<script type="text/javascript">
/*
 *为了使每次生生的图片不一样，就是不让浏览器缓存，需要加上时间戳 
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
	imgCode=$("#code").val();
	var checkCodeFlag;
	$.ajax({
		url:"checkCode",
		data:{
			"code":imgCode
		},
		async:false,
		type:"post",
		datatype:"json",
		success:function(data){
			if (data == "success") {
				hideTooltips("code_input");
				checkCodeFlag=true;
				//alert(checkCodeFlag);
			} else {
				showTooltips("code_input","验证码不正确,请重新输入");
				checkCodeFlag=false;
			}
		},
		error:function(){
			alert("网络异常！！！");
			checkCodeFlag=false;
		}	
	})
	//alert(checkCodeFlag+" ..");
	return checkCodeFlag;
}
$("#imgCode").click(function(){
	$(this).attr("src",chgUrl($("#imgCode").attr("src")));
})
function changeUserName(value){
	if (value.search(/^[a-z0-9_-]{6,16}$/) == -1) {
		if(value.search(/^[\w\.+-]+@[\w\.+-]+$/) == -1){
			showTooltips('login_input','请输入正确的邮箱或用户名');
			return false;
		}
	} else {
        hideTooltips('login_input');
        return true;
	}
}

function checkEmail(email) {
	if (email.search(/^.+@.+$/) == -1) {
		showTooltips('email_input','邮箱格式不正确');
		return false;
	}else {
		hideTooltips('email_input');
		return true;
	}
}
function checkUserAgreement() {
	if($('#way_user_agreement').prop("checked")){
		hideTooltips();
		return true;
	}else{
		showTooltips('checkbox_input','对不起，您不同意本站的《用户协议》，无法进行下一步操作');
		return false;
	}
}
function check() {
	//hideAllTooltips();
	var username_flag=changeUserName($("#username").val());
	var email_flag=checkEmail($("#email").val());
	var useragreement_flag=checkUserAgreement();
	var code_flag=checkCode();
	
	if(username_flag == true && email_flag == true && useragreement_flag == true &&code_flag == true){
		//alert(username_flag+" "+email_flag+" "+useragreement_flag+" "+code_flag);
		$.ajax({
			url:"sendemail",
			type:"post",
			datatype:"json",
			async:false,
			data:{
				receivedEmail:$("#email").val(),
				receiveder:$("#username").val()
			},
			success:function(data){
				//alert(data);
				if (data == "success") {
					alert("邮件已发送");
					//window.location.href="revisepassword";
				
				} else {
					alert("邮件发送失败");
					
				}
			},
			error:function(){
				alert("邮件发送失败！！！");
			}
		})
		
	}else{
		console.info("default");
	}
}
</script> 
</body>
</html>