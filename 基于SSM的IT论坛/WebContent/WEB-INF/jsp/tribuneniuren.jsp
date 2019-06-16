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
  <link rel="stylesheet" href="css/mainpage.css">
  <link rel="stylesheet" href="css/mainpageright.css">
  <link rel="stylesheet" href="css/tribuneniuren/sort_center.css">
  <link rel="stylesheet" href="css/tribuneniuren/sort_right.css">
</head>
<body>
	<div class="main-heade" >
		<!-- PC端头 -->
		<div id="load-main-header"></div>
		<!-- 移动端头 -->

		
	</div>
	<!-- 搜索栏 -->


	<!-- 主体内容 -->	
	<div class="main-body" >
		<div class="main-left-body" style="background-color: red;">

		</div>
		<!-- 排行榜 -->
		<div class="main-center-body" style="margin-left: 16%">
			<!-- 排行榜开始 -->
			<!-- 周 -->
			<div class="center-body-content">		
				<div id="week" class="sort-content-box">
					<h3 class="sort-top">
						<label>本周牛人</label>
						<div class="sort-top-right">
							<a href="javascript:;" id="click-week-score" class="change_group" data-group="weeks">换一组</a>
							<a href="javascript:;" class="attention_all" id="attention_all_week">一键关注所有</a>
						</div>
					</h3>
					<div class="sort-bottom-content" id="sort-bottom-content-week" name="0">

					</div>
				</div>					
			</div>
			<!-- 周结束-->
			<!-- 月 -->
			<div class="center-body-content">		
				<div id="week" class="sort-content-box">
					<h3 class="sort-top">
						<label>本月牛人</label>
						<div class="sort-top-right">
							<a href="javascript:;" id="click-month-score" class="change_group" data-group="weeks">换一组</a>
							<a href="javascript:;" class="attention_all" id="attention_all_month">一键关注所有</a>
						</div>
					</h3>
					<div class="sort-bottom-content" id="sort-bottom-content-month" name="0">
					
					</div>
				</div>					
			</div>
			<!-- 月结束-->
			<!--年-->
			<div class="center-body-content">		
				<div id="week" class="sort-content-box">
					<h3 class="sort-top">
						<label>本年牛人</label>
						<div class="sort-top-right">
							<a href="javascript:;" id="click-year-score" class="change_group" data-group="weeks">换一组</a>
							<a href="javascript:;" class="attention_all" id="attention_all_year">一键关注所有</a>
						</div>
					</h3>
					<div class="sort-bottom-content" id="sort-bottom-content-year" name="0">
					</div>
				</div>					
			</div>			
			<!--年开始-->	
			<!-- 排行榜结束-->
		</div>
		<!--  
			主体右边内容
		-->
		<div class="main-right-body" >
		<!-- 热帖开始 -->
			<div class="tribune-hot-content">
				<h3 class="hot-content-title">
					<span>论坛热帖</span>
					<!-- <a href="" class="hot-content-more">更多</a> -->
				</h3>
				<ul class="hot-content-list" id="hot-content-list1">
				
					<li>
						<em>·</em>
						<a href=""  target="_blank" title="请问springboot的资源文件向类中传参，然后如果有时间参数怎么办">
							请问springboot的资源文件向类中传参，然后如果有时间参数怎么办
						</a>
					</li>
				
				</ul>
			</div>
			<!-- 热贴结束 -->
			<!-- 社区推荐开始 -->
<%-- 			<div class="tribune-hot-content">
				<h3 class="hot-content-title">
					<span>社区推荐</span>
					<a href="" class="hot-content-more">更多</a>
				</h3>
				<ul class="hot-content-list">
				<c:forEach begin="1" step="1" end="8">
					<li>
						<em>·</em>
						<a href=""  target="_blank" title="bing倒下了，只能用百度了">
							bing倒下了，只能用百度了
						</a>
					</li>
				</c:forEach>
				</ul>
			</div>	 --%>		
			<!-- 社区推荐结束 -->
		</div>
	</div>
	<div id="main-foot-page" style="width: 100%;height: 100px;margin-top: 10px; float: left;">
	</div>
<script src="js/layui/layui.js" charset="utf-8"></script>
<script src="js/jquery.min.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
	$("#load-main-header").load("mainHeader.jsp");
	$("#main-foot-page").load("mainfoot.jsp");
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
	$.ajax({
		url:"selectNiuRenHotPost",
		data:{},
		dataType:"JSON",
		type:"post",
		success:function(data){
		
			var str='';
			for (var i = 0; i < 8; i++) {
				str=str+'<li><em>·</em><a  target="_blank" '+
				'href="${pageContext.request.contextPath}/togoPostDetails?id='+data[i].postId+'">'+
					data[i].postTitle+'</a></li>';
			}
			$("#hot-content-list1").html(str);
		},
		error:function(){
			
		}
	});
	var dataWeek;
	function initweek(initstart) {
		$.ajax({
			url:"selectNiuRenWeekScore",
			data:{},
			dataType:"JSON",
			type:"post",
			success:function(data){
				str='';
				
				for (var i = initstart; i < initstart+5; i++) {
					str=str+'<dl class="sort-content-list"><dt>'+
					'<a href="" target="_blank"> <img id="img-niurenPhoto-week"  class="img-niurenPhoto" alt="" src="'
					+data[i].niurenPhoto+'"></a></dt><dd>'+
						'<a href="" id="user_nick_name_week" class="user_nick_name" rel="nofollow" target="_blank" title="'+data[i].niurenAdmin+'">'
						+data[i].niurenAdmin+'</a><p class="genius_p"><b>&nbsp;</b> <span> <img title="专家分：5129" alt="专家分：5129"'
						+'src="img/tribuneniuren/2.png"></span> <b>&nbsp;</b></p>'+
						'<a href="javascript:;" data-username="nayi_224" class="genius_att" id="'+data[i].userId+'" >关注</a></dd></dl>';
									
				}
				$("#sort-bottom-content-week").html(str);
				dataWeek=data;
			},
			error:function(){
				
			}
		});		
	}

	var dataMonth;
	function initmonth(initstart) {
		$.ajax({
			url:"selectNiuRenMonthScore",
			data:{},
			dataType:"JSON",
			type:"post",
			success:function(data){
				str='';
				
				for (var i = initstart; i < initstart+5; i++) {
					str=str+'<dl class="sort-content-list"><dt>'+
					'<a href="" target="_blank"> <img id="img-niurenPhoto-month" class="img-niurenPhoto" alt="" src="'+
					data[i].niurenPhoto+'"></a></dt><dd>'+
						'<a href="" id="user_nick_name_month" class="user_nick_name" rel="nofollow" target="_blank" title="'+data[i].niurenAdmin+'">'
						+data[i].niurenAdmin+'</a><p class="genius_p"><b>&nbsp;</b> <span> <img title="专家分：5129" alt="专家分：5129"'
						+'src="img/tribuneniuren/2.png"></span> <b>&nbsp;</b></p>'+
						'<a href="javascript:;" data-username="nayi_224" class="genius_att" id="'+data[i].userId+'">关注</a></dd></dl>';
									
				}
				$("#sort-bottom-content-month").html(str);
				dataMonth=data;
			},
			error:function(){
				
			}
		});		
	}
	var dataYear;
	function inityear(initstart) {
		$.ajax({
			url:"selectNiuRenYearScore",
			data:{},
			dataType:"JSON",
			type:"post",
			success:function(data){
				str='';
				
				for (var i = initstart; i < initstart+5; i++) {
					str=str+'<dl class="sort-content-list"><dt>'+
					'<a href="" target="_blank"> <img id="img-niurenPhoto-year" alt="" class="img-niurenPhoto" src="'
					+data[i].niurenPhoto+'"></a></dt><dd>'+
						'<a href="" id="user_nick_name_year" class="user_nick_name" rel="nofollow" target="_blank" title="'+data[i].niurenAdmin+'">'
						+data[i].niurenAdmin+'</a><p class="genius_p"><b>&nbsp;</b> <span> <img title="专家分：5129" alt="专家分：5129"'
						+'src="img/tribuneniuren/2.png"></span> <b>&nbsp;</b></p>'+
						'<a href="javascript:;" data-username="nayi_224" class="genius_att" id="'+data[i].userId+'">关注</a></dd></dl>';
									
				}
				
				$("#sort-bottom-content-year").html(str);
				dataYear=data;
			},
			error:function(){
				
			}
		});		
	}
	$(document).ready(function () {
		initweek(0);
		initmonth(0);
		inityear(0);
	});
	$("#click-week-score").click(function () {
		
		var initi=$("#sort-bottom-content-week").attr("name");
		initi=initi-0;
		initi=initi+5;
		console.log(initi+"...");
		if(initi == dataWeek.length){
			initi = 0;
			console.log(initi+"...");
		}else {
			if (initi+5 > dataWeek.length) {
				initi=dataWeek.length-5;
			} else {
				initi=initi+5;
			}
		}
	
		$("#sort-bottom-content-week").attr("name",initi);
		initweek(initi);
		
	});
 	$("#click-month-score").click(function () {
		var initi=$("#sort-bottom-content-month").attr("name");
		initi=initi-0;
		initi=initi+5;
		if(initi == dataMonth.length){
			initi = 0;
		}else {
			if (initi+5 > dataMonth.length) {
				initi=dataMonth.length-5;
			} else {
				initi=initi+5;
			}
		}
	
		$("#sort-bottom-content-month").attr("name",initi);
		initmonth(initi);
	}); 
	$("#click-year-score").click(function () {
		
		var initi=$("#sort-bottom-content-year").attr("name");
		initi=initi-0;
		initi=initi+5;
		if(initi == dataYear.length){
			initi = 0;
		}else {
			if (initi+5 > dataYear.length) {
				initi=dataYear.length-5;
			} else {
				initi=initi+5;
			}
		}
	
		$("#sort-bottom-content-year").attr("name",initi);
		inityear(initi);
	});
	function focusMyfans(myFansId,photoSrc,nickName) {
		//alert(myFansId);
		$.ajax({
			url:"insertMyfans",
			data:{
				myFansId:myFansId,
				photoSrc:photoSrc,
				nickName:nickName
			},
			dataType:"JSON",
			type:"post",
			success:function(data){
				if (data ==true) {
					alert("关注成功");
				}else{
					alert("关注失败");
				}
			},
			error:function(){
				
			}
		});		
	}
	$("#sort-bottom-content-month").on("click",".genius_att",function(){
		var myFansId=$(this).attr("id");
		var photoSrc=$("#img-niurenPhoto-month").attr("src");
		var nickName=$("#user_nick_name_month").text();
		focusMyfans(myFansId,photoSrc,nickName);
	});
	$("#sort-bottom-content-year").on("click",".genius_att",function(){
		var myFansId=$(this).attr("id");
		var photoSrc=$("#img-niurenPhoto-year").attr("src");
		var nickName=$("#user_nick_name_year").text();
		focusMyfans(myFansId,photoSrc,nickName);
	});
	$("#sort-bottom-content-week").on("click",".genius_att",function(){
		var myFansId=$(this).attr("id");
		var photoSrc=$("#img-niurenPhoto-week").attr("src");
		var nickName=$("#user_nick_name_week").text();
		focusMyfans(myFansId,photoSrc,nickName);
	});
	function focusAll(initi,data) {
		$.ajax({
			url:"insertAllMyfans",
			data:{
				initi:initi,
				data:data
			},
			dataType:"JSON",
			type:"post",
			success:function(data){
				if (data == true) {
					alert("关注成功");
				}else{
					alert("关注失败");
				}
			},
			error:function(){
				
			}
		});			
	}
	$("#attention_all_year").click(function () {
		var initi=$("#sort-bottom-content-year").attr("name");
		focusAll(initi,JSON.stringify(dataYear));
	});
	$("#attention_all_month").click(function () {
		var initi=$("#sort-bottom-content-month").attr("name");
		focusAll(initi,JSON.stringify(dataMonth));
	});
	$("#attention_all_week").click(function () {
		var initi=$("#sort-bottom-content-week").attr("name");
		focusAll(initi,JSON.stringify(dataWeek));
	});
</script></body>
</html>