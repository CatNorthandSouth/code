<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <title>layui</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/tribuneniuren/mainpage.css">
  <link rel="stylesheet" href="css/mobileheadercss.css">
  <link rel="stylesheet" href="css/mainpageright.css">
  <link rel="stylesheet" href="css/tribuneniuren/sort_center.css">
  <link rel="stylesheet" href="css/tribuneniuren/sort_right.css">
</head>
<body>
	<div class="main-header" >
		<!-- PC端头 -->
		<ul class="layui-nav" id="pc-header-nav">
		<div class="main-nav-left">
			<li class="layui-nav-item"><a href="">论坛首页</a></li>
			<li class="layui-nav-item layui-this"><a href="javascript:;">精选板块</a>
				<dl class="layui-nav-child">
					<dd>
						<a href="">选项1</a>
					</dd>
					<dd>
						<a href="">选项2</a>
					</dd>
					<dd>
						<a href="">选项3</a>
					</dd>
				</dl></li>
			<li class="layui-nav-item"><a href="">论坛牛人</a></li>
			<li class="layui-nav-item"><a href="javascript:;">论坛问问</a>
				<dl class="layui-nav-child">
					<dd>
						<a href="">移动模块</a>
					</dd>
					<dd>
						<a href="">后台模版</a>
					</dd>
					<dd class="layui-this">
						<a href="">选中项</a>
					</dd>
					<dd>
						<a href="">电商平台</a>
					</dd>
				</dl></li>
			<li class="layui-nav-item"><a href="">我要发帖</a></li>
			<li class="layui-nav-item" id="main-nav-login"><a href="">登陆</a></li>
			<div class="main-nav-right">
				<li class="layui-nav-item"  ><input type="text" name="username"  placeholder="请输入"  autocomplete="off" class="layui-input">
				 </li>
				<li class="layui-nav-item"><a href=""><img
						id="nav-message-icon" alt="您的消息" src="img/message-icon.png">消息
						<span class="layui-badge" id="nav-message-count">9</span></a></li>
				<li class="layui-nav-item"><a href="">个人中心<span
						class="layui-badge-dot"></span></a></li>
				<li class="layui-nav-item" lay-unselect=""><a
					href="javascript:;"><img src="//t.cn/RCzsdCq"
						class="layui-nav-img">我</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="javascript:;">修改信息</a>
						</dd>
						<dd>
							<a href="javascript:;">安全管理</a>
						</dd>
						<dd>
							<a href="javascript:;">退了</a>
						</dd>
					</dl></li>
			</div>
		</ul>
		<!-- 移动端头 -->
		<div class="mobile-header-nav">
			<div class="header-nav-btn">
				<button type="button" id="nav-button" class="btn btn-default"
					aria-label="Left Align" style="background-color: #393D49;height: 35px;margin-left: 10%">
					<span class="glyphicon glyphicon-align-justify" aria-hidden="true" style="background-color: white;"></span>
				</button>
			</div>
			<div class="header-nav-content">
				<h3 class="header-nav-title">IT交流论坛</h3>
			</div>
			<div class="header-nav-search">
				<button type="button" id="header-nav-search-btn" class="btn btn-default"
					aria-label="Left Align" style="background-color: #393D49;height: 35px;float: right; margin-right: 10%">
					<span class="glyphicon glyphicon-search" aria-hidden="true" style="background-color: #393D49;"></span>
				</button>
			</div>
		</div>
		<div class="header-zhanwei">
		</div>
	</div>
	<!-- 搜索栏 -->
	<div class="mobile-nav-search" id="mobile-nav-search-input">
		<input type="text" class="search-input" >
	</div>
	<!-- 移动端导航 -->
	<div class="mobile-list" id="mobile-list">
		<ul class="layui-nav layui-nav-tree layui-inline" lay-filter="demo"
			style="margin-right: 10px;">
			<li class="layui-nav-item "><a
				href="javascript:;">登录</a></li>
			<li class="layui-nav-item"><a href="">论坛首页</a></li>
			<li class="layui-nav-item"><a href="javascript:;">精选板块</a>
				<dl class="layui-nav-child">
					<dd>
						<a href="">移动模块</a>
					</dd>
					<dd>
						<a href="">后台模版</a>
					</dd>
					<dd>
						<a href="">电商平台</a>
					</dd>
				</dl></li>
			<li class="layui-nav-item"><a href="">论坛牛人</a></li>
			<li class="layui-nav-item"><a href="">论坛问问</a></li>
			<li class="layui-nav-item"><a href="">我要发帖</a></li>
		</ul>
	</div>


			<script src="js/layui/layui.js" charset="utf-8"></script>
			<script src="js/jquery.min.js" charset="utf-8"></script>
			<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
			<script>
	layui.use('element', function() {
		var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

		//监听导航点击
		element.on('nav(demo)', function(elem) {
			//console.log(elem)
		//	layer.msg(elem.text());
		});
	});
	$("#nav-button").click(function () {
		if ($("#mobile-list").css("display") == "none") {
			$("#mobile-list").css("display","block");
		}else {
			$("#mobile-list").css("display","none");
		}
		
	});
	$("#header-nav-search-btn").click(function () {
		if ($("#mobile-nav-search-input").css("display") == "none") {
			$("#mobile-nav-search-input").css("display","block");
		}else {
			$("#mobile-nav-search-input").css("display","none");
		}
	});
	
	

</script></body>
</html>