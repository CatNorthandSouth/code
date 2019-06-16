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
<link rel="stylesheet" href="js/layui/css/layui.css"  media="all">
</head>
<body style="min-height: 900px;min-width: 1350px;">
	<div class="main-heade" id="main-heade">

		<div class="header-zhanwei">
		</div>
	</div>

	<!-- 主体内容 -->	
	<div class="main-body" >
		<div class="main-left-body" >
			<div class="left-body-nav">
				<ul class="layui-nav layui-nav-tree layui-inline" lay-filter="demo"
					style="margin-right: 0px; margin-left: 20px;" id="leftListUl">
<!--  					<li class="layui-nav-item layui-nav-itemed"><a
						href="javascript:;">默认展开</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">选项一</a>
							</dd>
							<dd>
								<a href="javascript:;">选项二</a>
							</dd>
							<dd>
								<a href="javascript:;">选项三</a>
							</dd>
							<dd>
								<a href="">跳转项</a>
							</dd>
						</dl></li>  -->
<!-- 					<li class="layui-nav-item"><a href="javascript:;">解决方案</a>
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
						</dl></li> -->
<!-- 					<li class="layui-nav-item"><a href="javascript:;">解决方案</a>
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
						</dl></li> -->
		<!-- 			<li class="layui-nav-item"><a href="javascript:;">解决方案</a>
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
						</dl></li> -->
		<!-- 			<li class="layui-nav-item"><a href="javascript:;">解决方案</a>
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
						</dl></li> -->
				<!-- 	<li class="layui-nav-item"><a href="">云市场</a></li>
					<li class="layui-nav-item"><a href="">社区</a></li> -->
				</ul>
			</div>
		</div>
		<div id="main-bankuai" class="main-bankuai" name="main-bankuai">
		</div>
		<div class="main-center-body" id="main-center-body">
			<!-- 轮播图 -->
			<div id="main-lunbo-div" style="margin-bottom: 10px;">
				<div class="layui-carousel" id="test10" style="width: 100%;">
  					<div carousel-item="" style="width: 100%;" id="mainlunbo" >
  					  <div><img style="width: 100%;" src="img/main/lunbo/1.png"></div>
  					  <div><img style="width: 100%;" src="img/main/lunbo/1.png"></div>
   					  <div><img style="width: 100%;" src="img/main/lunbo/1.png"></div>
    				  <div><img style="width: 100%;" src="img/main/lunbo/1.png"></div>
   					  <div><img style="width: 100%;" src="img/main/lunbo/1.png"></div>
    				  <div><img style="width: 100%;" src="img/main/lunbo/1.png"></div>
    				  <div><img style="width: 100%;" src="img/main/lunbo/1.png"></div>
  					</div>
				</div>
 		
			</div>


			<!-- 技术区 -->
			<div class="main-center-box">
				<h3 class="main-center-box-title">
					<span>热帖·技术区</span> <a id="hotPostMore" href="${pageContext.request.contextPath}/togoHotPostList?pageid=1"  target="_blank"
						class="box-title-more" >更多</a>
				</h3>
				<div class="hotTopic_title">
					<span class="topic0">标题</span> <span class="topic1">提问</span> <span
						class="topic2">回复</span> <span class="topic3">人气</span>
				</div>
<%-- 				<c:forEach begin="0" step="1" end="6">
					<ul class="topTopic_content">
						<li><label class="hotTop_title"> <a href=""
								class="topic_title" target="_blank" title="">MVVM的疑惑</a>
						</label> <a href="//my.csdn.net/sr32r345" class="questioner"
							rel="nofollow" target="_blank" title="">货郎大叔</a> <span
							class="reply_num">19</span> <span class="view_num">112</span></li>
					</ul>
				</c:forEach> --%>
				<div id="hotpostscontent">
				</div>
			</div>

			<div class="main-center-box">
				<h3 class="main-center-box-title">
					<span>版主推荐·技术区</span> <a href="${pageContext.request.contextPath}/togoHotPostList?pageid=2" target="_blank"
						class="box-title-more">更多</a>
				</h3>
				<div class="hotTopic_title">
					<span class="topic0">标题</span> <span class="topic1">推荐人</span> <span
						class="topic2">回复</span> <span class="topic3">人气</span>
				</div>
<%-- 				<c:forEach begin="0" step="1" end="6">
					<ul class="topTopic_content">
						<li><label class="hotTop_title"> <a href=""
								class="topic_title" target="_blank" title="">MVVM的疑惑</a>
						</label> <a href="//my.csdn.net/sr32r345" class="questioner"
							rel="nofollow" target="_blank" title="">货郎大叔</a> <span
							class="reply_num">19</span> <span class="view_num">112</span></li>
					</ul>
				</c:forEach>  --%>
				<div id="hotpostscommend">
				</div> 
			</div>
		</div>
		<!--  
			主体右边内容
		-->
		<div class="main-right-body" id="main-right-body">
	     	<!--主页个人论坛信息展示 -->
			<div class="right-body-box">
				<div class="right-body-personshow">
					<dl class="per_box clearfix">
						<input type="hidden" id="hiddenbsusername" value="${ByUser.userName}">
						<input type="hidden" id="hiddenbsuserphoto" value="${ByUser.userPhoto}">
						<input type="hidden" id="hiddenbsusermark" value="${ByUser.userAllmarks}">
						<dt>
							<a href="${pageContext.request.contextPath}/gotoMyInformation" rel="nofollow"
								target="_blank"><img alt="qq_34268459" class="avatar"
								src="img/main/3_qq_34268459.jpg" id="hiddenbsuserphoto1" style=""></a>
						</dt>
						<dd id="current_user_info">
							<h4>
								<a href="${pageContext.request.contextPath}/gotoMyInformation" target="_blank"
									class="user_name" id="hiddenbsusername1">xxxxxx</a>
							</h4>
							<p class="per_intro"></p>
							<div class="bbs_grade">
								<img src="img/main/bbs1.png"
									alt="img">
							</div>
						</dd>
					</dl>
					<div class="bbs_per_b">
						<ul class="bbs_per_b_list clearfix">
							<li><span>剩余可用分</span><em id="hiddenbsusermark1">${ByUser.userAllmarks}</em><img
								src="img/main/score.gif"
								alt="img"></li>
						<!-- 	<li><span>总技术积分</span><em>0</em><img
								src="img/main/score.gif"
								alt="img"></li>
							<li><span>总非技术分</span><em>0</em><img
								src="img/main/score.gif"
								alt="img"></li> -->
							<li><span>上次排名</span><br><em class="bbs_rank" style="width: 55px;text-align: center;">${BybsRank.preRank}</em></li>
							<li ><span>现在排名</span><br><em class="bbs_rank" style="width: 55px;text-align: center;">${BybsRank.nowRank}</em> </li>
							
						</ul>
					</div>
				</div>
			</div>
			<!-- 今日要闻 -->
			<div class="right-body-box">
				<div class="right-body-todaynews">
					<h3 class="today-news-title">
						<span class="news-line"></span> <span class="news-title">论坛治安条例</span>
					</h3>
					
					<div class="tribune-notice-content">
							<ul class="tribune-notice-list">
								<li>
									<div class="content-box">
										<h3 class="content_name">
											<a href="#" target="">一.禁止发表反人类，反社会言语。</a>
										</h3>
									</div>
								</li>
							</ul>
						</div>
					<div class="tribune-notice-content">
							<ul class="tribune-notice-list">
								<li>
									<div class="content-box">
										<h3 class="content_name">
											<a href="#" target="">二.禁止发表辱骂性质言语。</a>
										</h3>
									</div>
								</li>
							</ul>
						</div>
					<div class="tribune-notice-content">
							<ul class="tribune-notice-list">
								<li>
									<div class="content-box">
										<h3 class="content_name">
											<a href="#" target="">三.本站不以任何名义收取费用。</a>
										</h3>
									</div>
								</li>
							</ul>
						</div>						
					<div class="tribune-notice-content">
							<ul class="tribune-notice-list">
								<li>
									<div class="content-box">
										<h3 class="content_name">
											<a href="#" target="">四.用户的各种言论不代表本站立场。</a>
										</h3>
									</div>
								</li>
							</ul>
						</div>						
					<div class="tribune-notice-content">
							<ul class="tribune-notice-list">
								<li>
									<div class="content-box">
										<h3 class="content_name">
											<a href="#" target="">五.禁止发表攻击本站言论</a>
										</h3>
									</div>
								</li>
							</ul>
						</div>						
					<div class="tribune-notice-content">
							<ul class="tribune-notice-list">
								<li>
									<div class="content-box">
										<h3 class="content_name">
											<a href="#" target="">六.禁止发表台独等分裂祖国言论。</a>
										</h3>
									</div>
								</li>
							</ul>
						</div>						
					<div class="tribune-notice-content">
							<ul class="tribune-notice-list">
								<li>
									<div class="content-box">
										<h3 class="content_name">
											<a href="#" target="">七.禁止发表与本论坛文化无关言语。</a>
										</h3>
									</div>
								</li>
							</ul>
						</div>
					<div class="tribune-notice-content">
							<ul class="tribune-notice-list">
								<li>
									<div class="content-box">
										<h3 class="content_name">
											<a href="#" target="">八.禁止歧视他人。</a>
										</h3>
									</div>
								</li>
							</ul>
						</div>
					<div class="tribune-notice-content">
							<ul class="tribune-notice-list">
								<li>
									<div class="content-box">
										<h3 class="content_name">
											<a href="#" target="">九.本站热爱祖国，坚定跟随党的领导。</a>
										</h3>
									</div>
								</li>
							</ul>
						</div>
					<div class="tribune-notice-content">
							<ul class="tribune-notice-list">
								<li>
									<div class="content-box">
										<h3 class="content_name">
											<a href="#" target="">十.本站热爱祖国，坚定跟随党的领导。</a>
										</h3>
									</div>
								</li>
							</ul>
						</div>
					<div class="tribune-notice-content">
							<ul class="tribune-notice-list">
								<li>
									<div class="content-box">
										<h3 class="content_name">
											<a href="#" target="">十一.本站热爱祖国，坚定跟随党的领导。</a>
										</h3>
									</div>
								</li>
							</ul>
						</div>																																			
				</div>
			</div>
			<!-- 论坛公告 -->
			<div class="right-body-box">
				<div class="right-body-notice">
					<h3 class="tribune-notice-title">
						<span class="notice-title">论坛公告</span>
					</h3>
					<hr>
					<div id="tribune-notice-content-div">
					</div>
<%-- 					<c:forEach begin="0" step="1" end="4">
						<div class="tribune-notice-content">
							<ul class="tribune-notice-list">
								<li>
									<div class="content-box">
										<h3 class="content_name">
											<a href="" target="">免费报名区块链设计与智能合约开发</a>
										</h3>
									</div>
								</li>
							</ul>
						</div>
					</c:forEach> --%>
				</div>
			</div>
			<!-- 论坛公告结束 -->
		</div>
	</div>
	<div id="main-foot-page" style="width: 100%;height: 100px;margin-top: 10px; float: left;">
	</div>
<script src="js/layui/layui.js" charset="utf-8"></script>
<script src="js/jquery.min.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
$("#main-heade").load("mainHeader.jsp");
$("#main-foot-page").load("mainfoot.jsp");

$(document).ready(function() {
	var str0=Math.floor(Math.random()*10)+""+Math.floor(Math.random()*10)+""+Math.floor(Math.random()*10)+""+Math.floor(Math.random()*10);
	if ($("#hiddenbsusername").val() == "" || $("#hiddenbsusername").val() == null) {
		$("#hiddenbsusername1").text("QQ_4545"+str0);
	} else {
		$("#hiddenbsusername1").text($("#hiddenbsusername").val());
	}
	if ($("#hiddenbsuserphoto").val() == "" || $("#hiddenbsuserphoto").val() == null) {
		//$("#hiddenbsusername").text("QQ_4545"+str0);
	} else {
		$("#hiddenbsuserphoto1").attr("src",$("#hiddenbsuserphoto").val());
	}
	if ($("#hiddenbsusermark").val() == "" || $("#hiddenbsusermark").val() == null) {
		$("#hiddenbsusermark1").text(0);
	} else {
		$("#hiddenbsusermark1").text($("#hiddenbsusermark").val());
	}	
});
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
		url:"selectHotPost",
		data:{},
		type:"post",
		dataType:"JSON",
		success:function(data){
			var str='';
			
			for (var i = 0; i < 7; i++) {
				str=str+'<ul class="topTopic_content"><li><label class="hotTop_title"> <a href="${pageContext.request.contextPath}/togoPostDetails?id='+data[i].postId+'" class="topic_title" target="_blank" title="">'+
				data[i].postTitle+'</a></label> <a  class="questioner" rel="nofollow" target="_blank" title="">'+
				data[i].postAdmin+'</a> <span class="reply_num">'+getReplySum(data[i].postId)+'</span> <span class="view_num">'+
				data[i].postReward+'</span></li></ul>';
				
			}
			$("#hotpostscontent").html(str);		
		},
		error:function(){
			
		}
	});
	
	function getReplySum(id) {
		var sum;
		$.ajax({
			url:"getreplysum",
			data:{
				id:id
			},
			async:false,
			type:"post",
			dataType:"json",
			success:function(data){
				sum=data;
			}
		});
		return sum;
	}
	
	$.ajax({
		url:"selectPostCommend",
		data:{},
		type:"post",
		dataType:"JSON",
		success:function(data){
			var str='';
			
			for (var i = 0; i < 7; i++) {
				str=str+'<ul class="topTopic_content"><li><label class="hotTop_title"> <a href="${pageContext.request.contextPath}/togoPostDetails?id='+data.list[i].postId+'" class="topic_title" target="_blank" title="">'+
				data.list[i].postTitle+'</a></label> <a  class="questioner" rel="nofollow" target="_blank" title="">'+
				data.list[i].postAdmin+'</a> <span class="reply_num">'+getReplySum(data.list[i].postId)+'</span> <span class="view_num">'+
				data.list[i].postReward+'</span></li></ul>';
				
			}
			$("#hotpostscommend").html(str);		
		},
		error:function(){
			
		}
	});
	$.ajax({
		url:"selectboardList",
		data:{},
		type:"post",
		dataType:"JSON",
		success:function(data){
		var str='';
		for (var i = 0; i < data[0].length; i++) {
			str=str+' <li class="layui-nav-item layui-nav-itemed" ><a href="javascript:;">'+
			(data[0])[i].biboTitle+'</a><dl class="layui-nav-child">';
			for (var j = 0; j < (data[1])[i].length; j++) {
				str=str+'<dd value=""><a target="main-bankuai" class="click-a" id="'+(data[0])[i].biboId+'and'+((data[1])[i])[j].smboId+'">'+((data[1])[i])[j].smboTitle+'</a></dd>';	
			
			}
		
			str=str+'</dl></li>';
			}
		$("#leftListUl").html(str);
		},
		error:function(){
			
		}	
	});

	$.ajax({
		url:"selectBsTribuneNotice",
		data:{},
		type:"post",
		dataType:"JSON",
		success:function(data){
			str='';
			if (data.length < 6) {
				var sum=data.length;
			} else {
				var sum=6;
			}
			for (var i = 0; i < 6; i++) {
				str=str+'<div class="tribune-notice-content"><ul class="tribune-notice-list"><li><div class="content-box">'+
				'<h3 class="content_name"><a href="${pageContext.request.contextPath}/togoPostDetails?id='+data[i].postId+'" target="">'+data[i].postTitle+'</a></h3></div></li></ul></div>';
			}
			$("#tribune-notice-content-div").html(str);
		},
		error:function(){
			
		}	
	});

	$.ajax({
		url:"selectlunbo",
		data:{},
		type:"post",
		dataType:"JSON",
		success:function(data){
			str='';
			for (var i = 0; i < 6; i++) {
				str=str+'<div><img style="width: 100%;" src="'+data[i].lunboPath+'"></div>'
			}
			$("#mainlunbo").html(str);
		},
		error:function(){
			
		}	
	});	
	
	$("#leftListUl").on("click","dd",function(){
		var smallboardtext=$(this).find("a").text();
		$("#main-center-body").css("display","none");
		$("#main-right-body").css("display","none");
		$("#main-bankuai").load("togosmalltribune?id="+$(this).find("a").attr("id"));
		$("#main-bankuai").css("display","block");
		$("#main-foot-page").css("margin-top","610px");
		$("#main-foot-page").css("position","absolute");
		//$("#main-bankuai").load("togosmalltribune");	
	});
	var cctt="aa";
	var timett=0;
	var request=true;

	function findFlagId() {
		
		window.clearInterval(cl);
		$.ajax({
			url:"findFlagId",
			dataType:"JSON",
			data:{},
			async:false,
			type:"post",
			success:function(data){
				if (cctt == data) {
					console.log("..");
				} else {
					if (timett != 0) {
						cctt=data;
						
						jingxuan(data);	
					}		
					timett+=0.1;
				}
			},
			error:function(){}
		});	
		console.log("cc:"+cctt);
		cl=setInterval(findFlagId,500);
	}
	cl=setInterval("",500);
	c2=setInterval(initTimerzz,1000);
	function initTimerzz() {
		
		window.clearInterval(c2);
		$.ajax({
			url:"initmainTimer",
			dataType:"JSON",
			data:{},
			async:false,
			type:"post",
			success:function(data){
				//alert(JSON.stringify(data));
				if (data == "1") {
					window.clearInterval(cl);
					//alert("44");
				} else {
					cl=setInterval(findFlagId,500);
					
				}
			},
			error:function(){}
		});	
		c2=setInterval(initTimerzz,1000);
	}
	function jingxuan(id){
		
		$("#main-center-body").css("display","none");
		$("#main-right-body").css("display","none");
		if (id == "1") {
			//$("#main-bankuai").load("goSearchList");
		} else {
			$("#main-bankuai").load("togosmalltribune?id="+id);
		}
		
		$("#main-bankuai").css("display","block");		
	}
</script>
<script>
layui.use(['carousel', 'form'], function(){
  var carousel = layui.carousel
  ,form = layui.form;
  
  //常规轮播
  carousel.render({
    elem: '#test1'
    ,arrow: 'always'
  });
  
  //改变下时间间隔、动画类型、高度
  carousel.render({
    elem: '#test2'
    ,interval: 1800
    ,anim: 'fade'
    ,height: '120px'
  });
  
 
  //图片轮播
  carousel.render({
    elem: '#test10'
    ,width: '898px'
    ,height: '440px'
    ,interval: 5000
  });
  
  //事件
  carousel.on('change(test4)', function(res){
    console.log(res)
  });
  
  var $ = layui.$, active = {
    set: function(othis){
      var THIS = 'layui-bg-normal'
      ,key = othis.data('key')
      ,options = {};
      
      othis.css('background-color', '#5FB878').siblings().removeAttr('style'); 
      options[key] = othis.data('value');
      ins3.reload(options);
    }
  };

  
  //其它示例
  $('.demoTest .layui-btn').on('click', function(){
    var othis = $(this), type = othis.data('type');
    active[type] ? active[type].call(this, othis) : '';
  });
});
</script>
</body>
</html>