<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>这个.. 页面没有找到！！！_SJ5D.COM</title>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<style type="text/css">
			body{ margin:0; padding:0; background:#efefef; font-family:Georgia, Times, Verdana, Geneva, Arial, Helvetica, sans-serif; }
			div#mother{ margin:0 auto; width:943px; height:572px; position:relative; }
			div#errorBox{ background: url(img/404_bg.jpg) no-repeat top left; width:943px; height:572px; margin:auto; }
			div#errorText{ color:#39351e; padding:146px 0 0 446px }
			div#errorText p{ width:303px; font-size:14px; line-height:26px; }
			div.link{ /*background:#f90;*/ height:50px; width:145px; float:left; }
			div#home{ margin:20px 0 0 444px;}
			div#contact{ margin:20px 0 0 25px;}
			h1{ font-size:40px; margin-bottom:35px; }
		</style>
		

		
	</head>
	<body>
		<div id="mother">
			<div id="errorBox">
				<div id="errorText">
					<h1>404错误,Sorry..页面没有找到！</h1>
					<p>
						似乎你所寻找的网页已移动或丢失了。
						<p>或者也许你只是键入错误了一些东西。</p>
						请不要担心，这没事。如果该资源对你很重要，请与管理员联系。
					</p>

					 <p>
						火星不太安全，我可以免费送你回地球
					</p> 
					<a style="text-decoration: none;" href="${pageContext.request.contextPath}/Qlogin" title="返回apacheCN首页">
					<h1>
						
							返回登陆
						
					</h1> 
					</a>
					<a title="联系管理员" id="click-manager">
					<h1 style="float: right;margin-top: -85px;margin-right: 100px;">
						
							联系管理
					</h1>
					</a>
				</div>

			</div>
		</div>
		<div id="manager-connect" style="background-color:#fff;border-radius:30px; z-index: 99;display: none;margin-left:55%;margin-top:-350px; height: 150px;width: 300px;position: absolute;">
			<ul style="display: block; margin-top: 50px;">
				<li style="display: inline-block; ">QQ:xxxxxxxx</li>
				<li style="display: inline-block;margin-top: 5px;">email:xxxxxxxx@qq.com</li>
			</ul>
		</div>
		<script type="text/javascript">
		$("#click-manager").click(function () {
			if ($("#manager-connect").css("display") == "none") {
				$("#manager-connect").css("display","block");
			} else {
				$("#manager-connect").css("display","none");
			}
		});
		</script>
	</body>
</html>