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
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/writeposts/mainpage.css">
<link rel="stylesheet" href="css/writeposts/writepost.css">
<link rel="stylesheet" href="css/mobileheadercss.css">
<link rel="stylesheet" href="css/mainpageright.css">
<link rel="stylesheet" href="css/myinformation/myInformation.css">
<link href='https://fonts.googleapis.com/css?family=Architects+Daughter'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css"
	href="css/datestylesheets/stylesheet.css" media="screen">
<!-- <link rel="stylesheet" type="text/css" href="stylesheets/github-light.css" media="screen"> -->
<link rel="stylesheet" type="text/css"
	href="css/datestylesheets/print.css" media="print">
<link rel="stylesheet" type="text/css"
	href="css/datestylesheets/simple-calendar.css">
<script src="js/layui/layui.js" charset="utf-8"></script>
<script src="js/jquery.min.js" charset="utf-8"></script>
<script type="text/javascript" src="js/jquery.calendar.js"></script>
<style type="text/css">
body{
min-height: 700px;
min-width: 1200px;
}
.pageUtils{
	width: 70%;
	margin-left: 30%;
	
}
.pageUtils .pageUtils-li{
	text-decoration: none;
	padding: 3px 7px;
	border-radius:3px;
	border-color: #bfcfe1;
	border:solid 1px #d7e2ee;
	float: left;
	display: inline-block;
	cursor: pointer;
}

.pageUtils .pageUtils-ulli{
	text-decoration: none;
	padding: 3px 7px;
	border-radius:3px;
	border-color: #bfcfe1;
	border:solid 1px #d7e2ee;
	float: left;
	display: inline-block;
	cursor: pointer;
}
.pageUtils-ulli-flag{
	background-color: #006699;
	color: #fff;
	text-decoration: none;
	padding: 3px 7px;
	border-radius:3px;
	border-color: #bfcfe1;
	border:solid 1px #d7e2ee;
	float: left;
	display: inline-block;
	cursor: pointer;	
}
.pageUtils-li-flag{
	background-color: #006699;
	color: #fff;
	padding: 3px 7px;
	border-radius:3px;
	border-color: #bfcfe1;
	border:solid 1px #d7e2ee;
	float: left;
	display: inline-block;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="main-heade" id="main-heade">


		<div class="header-zhanwei"></div>
	</div>

	<!-- 主体内容 -->
	<div class="main-body">
		<div class="main-left-body" >
		<input type="hidden" value="1" >
		</div>
		<!-- 排行榜 -->
		<div class="main-center-body" style="margin-top: 5px">
			<div class="center-body-left" id="center-body-left">
				<ul>
					<li id="my-informaton" class="nocolor">
						<span >
							<a>个人资料</a>
						</span>
					</li>
					<li id="my-collect" class="nocolor">
						<span>
							<a>我的收藏</a>
						</span>
					</li>
					<li id="my-focus" class="nocolor">
						<span>
							<a>我的关注</a>
						</span>
					</li>
					<li id="my-fans" class="nocolor">
						<span>
							<a>我的粉丝</a>
						</span>
					</li>
				</ul>
			</div>
			
			<div class="center-body-right" id="center-body-right">
				<!--上传头像  -->
					<div class="image-upload-div" id="image-upload-div">
						<span class="image-upload-close" id="image-upload-close">X</span>
						<div id="image-upload" class="image-upload">
							
						</div>
					</div>
			<!--  个人资料开始-->
				<div class="personaldata" id="personaldata">
					<span class="personaldata-title">
						个人资料					
					</span>
					<div class="img-div">	
						<img class="img" alt="" src="${bsUser.userPhoto}">
						<span class="img-div-title" id="img-div-title"><a>修改头像</a></span>
					</div>

					<div class="personal-imformation">
						<div class="information-top">
							<span class="myid">ID：QQ_3425${bsUser.userId}</span>
						</div>
						<div class="information-center">
							<span class="myfocus">关注：${bsUser.userMyfocus}</span>
							<span class="myfans">粉丝：${bsUser.userMyfans}</span>
							<span class="mycollect">收藏：${bsUser.userMycollect}</span>
						</div>
						<div class="information-bottom">
							<span class="my-username">昵称：${bsUser.userName}</span>
							<span class="update-information" id="update-information"><a>修改资料</a></span>
							<span class="my-realname">实名：${bsUser.userRealName}</span>
						</div>
						<ul class="imformation-list">
							<li><span class="common">邮箱：${bsUser.userEmail}</span></li>
							<li><span class="common">性别：${bsUser.userSex}</span></li>
							<li><span class="common">生日：${bsUser.userMybirthday}</span></li>
							<li><span class="common">地区：${bsUser.userProvince}-${bsUser.userCity}-${bsUser.userArea}</span></li>
							<li><span class="common">住址：${bsUser.userAddress}</span></li>
							<!-- <li><span class="common">职位：实习生</span></li> -->
							<li class="intro">
								<span class="intro-title">简介：</span>
								<span class="intro-content">${bsUser.userShow}</span>
							</li>
						</ul>
					</div>
				</div>
				<!--  个人资料结束-->
				<!-- 我的收藏开始 -->
				<div class="collect" id="collect">
					<span class="collect-title">
						我的收藏					
					</span>
					<div class="collect-content">
						<ul class="collect-list" id="collect-list-mycollect">
<%-- 						<c:forEach begin="0" end="5">
							<li>
								<a>java线程gdfgfdgdf</a>
								<label>
									<span class="collect-time">2018-06-03</span>
									<span class="collect-cancel">取消</span>
								</label>
							</li>
						</c:forEach> --%>
						</ul>
					
					</div>
				</div>				
				<!-- 我的收藏结束 -->
				<!-- 我的关注 开始-->
				<div class="focus" id="focus">
					<span class="focus-title">
						我的关注			
					</span>
					<span class="focus-count-myfocus" id="focus-count-myfocus"></span>
					<div class="focus-content">
						<ul class="focus-list" id="focus-list-myfocus">
				 	<%-- 	<c:forEach begin="0" end="2"> 
							<li>
								<a>
									<img alt="" src="img/main/3_qq_34268459.jpg">
								</a>
								<a>
									<span class="focus-username">会飞的猪仔</span>
								</a>
								<a href="" class="focus-cancel">取消关注</a>
							</li>
						 </c:forEach>  --%>
						</ul>
						
					</div>
				</div>
								
				<!-- 我的关注 结束-->
				<!-- 我的粉丝 -->
				<div class="fans" id="fans">
					<span class="focus-title">
						我的粉丝		
					</span>
					<span class="focus-count" id="focus-count-myfans">共4人</span>
					<div class="focus-content">
						<ul class="focus-list" id="focus-list-myfans">
<%-- 				 		<c:forEach begin="0" end="2"> 
							<li>
								<a>
									<img alt="" src="img/main/3_qq_34268459.jpg">
								</a>
								<a>
									<span class="focus-username">会飞的猪仔</span>
								</a>
								<a href="" class="focus-cancel">取消关注</a>
							</li>
						 </c:forEach>  --%>
						</ul>
					</div>
				</div>	
				<!-- 我的粉丝结束 -->
			</div>
			<div id="pageUtils" value="2" name="2" class="pageUtils">
				</div>
			
		</div>
		<!-- 修改资料 -->
		<div class="update-my-information">
			 <div class="baohuzhao" id="baohuzhao"></div>
			<div class="information-div" id="information-div">
				<div class="header-div">
					<h3 class="title">修改资料</h3>
					<span class="close" id="close-informaion">x</span>
				</div>
				<div class="main-div">
				<form action="${pageContext.request.contextPath}/updateMyInformation" method="post" accept-charset="utf-8">
					<input type="hidden" name="userId" value="${bsUser.userId}">
					<div class="box-div">
						<span>昵称：</span>
						<input type="text" minlength="2" maxlength="20" name="userName" value="${bsUser.userName}">
					</div>
					<div class="box-div">
						<span>实名：</span>
						<input type="text" minlength="0" maxlength="50" name="userRealName" value="${bsUser.userRealName}">
					</div>

					<div class="box-div">
						<span>性别：</span>
						<input type="text" minlength="0" maxlength="20" name="userSex" value="${bsUser.userSex}">
					</div>
					<div class="box-div">
						<span>生日：</span>
						<input type="text" minlength="0" maxlength="20" class="birthday-date" name="userMybirthday" value="${bsUser.userMybirthday}">
						
					</div>
					<div class="box-div">
						<span>电话：</span>
						<input type="text" minlength="0" maxlength="20" name="userTel" value="${bsUser.userTel}">
					</div>
					<div class="box-div">
						<span class="area-title">地区：</span>
						<div class="info">
							<div>
							    <select id="s_province"  name="s_province" value="${bsUser.userProvince}"></select>
							    <select id="s_city" name="s_city" value="${bsUser.userCity}"></select>
							    <select id="s_county" name="s_county" value="${bsUser.userArea}"></select>
							    <script class="resources library" src="js/area.js"	type="text/javascript"></script>
								<script type="text/javascript">
								var opt2 = ["省份","地级市","市、县级市"];//初始值
								var opt3 = ["省份","地级市","市、县级市"];
								var opt4 = ["省份","地级市","市、县级市"];
								var opt1=[];
								var jsonopt={};
 					/* 			$("#s_province").mouseout(function(){
									var s1=$("#s_province").val();
									if (s1 == opt1[0]) {
										
									} else {
										opt3[0]=s1;
										//$("#s_city").text("地级市");
										 opt1[1]="地级市";
										opt1[2]="市、县级市"; 
										
									}
									 $.ajax({
										url:"selectMyInformation",
										type:"post",
										dataType:"json",
										data:{
											
										},
										success:function(data){
											_init_area(opt3);
											
										},
										error:function(){
											alert("系统错误");
										}
			
									}); 
									
								});  */
								$(document).ready(function () {
									$.ajax({
										url:"selectMyInformation",
										type:"post",
										dataType:"json",
										data:{
											
										},
										success:function(data){
											//jsonopt=JSON.stringify(data);
											
											if (data.userProvince == null || data.userProvince == "") {
												
												_init_area(opt2);
											} else {
												opt1[0]=data.userProvince;
												opt1[1]=data.userCity;
												opt1[2]=data.userArea;
												
												_init_area(opt1);
											}
											
										},
										error:function(){
											alert("系统错误");
										}
									});			
								});
									
								</script>
							</div>

							<div id="show"></div>

						</div>
					<div class="box-div">
						<span>住址：</span>
						<input type="text" minlength="0" maxlength="150" name="userAddress" value="${bsUser.userAddress}">
					</div>
						<div class="box-div">
						<span class="area-title">简介：</span>
						<div class="area-div">
							<textarea maxlength="300" class="area" name="userShow"  id="textarea-usershow">${bsUser.userShow}</textarea>
							<p class="limit" id="textarea-limit">300</p>
						</div>
					</div>
					<div class="btn-group">
						<input type="reset" class="cancel" id="cancel-submit-information" value="取消">
						<input type="submit" class="confirm" id="confirm-submit-information" value="确定">	
					</div>

				</div>
				</form>
			</div>
		</div>
		
		<!--  
			主体右边内容
		-->
		<div class="main-right-body" style="background-color: #f0f0f5;"></div>
	</div>
	<div id="main-foot-page" style="width: 100%;height: 100px;margin-top: 10px; float: left;">
	</div>

	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
		<script>
		$("#main-foot-page").load("mainfoot.jsp");
		$("#main-heade").load("mainHeader.jsp");
		var datamyfacus;
	$("#img-div-title").click(function () {
		
		$("#image-upload-div").css("display","block");
		$("#image-upload").load("imageUpload");
	});
	$("#image-upload-close").click(function () {
		$("#image-upload-div").css("display","none");
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
	$("#textarea-usershow").on('keyup',function(){
		var len=$("#textarea-usershow").val().length;
		var length=300-len;
		if (length == 0) {
			$("#textarea-limit").text("最多只能输入300个字符，不要贪心哦！");
		}else{
			$("#textarea-limit").text(length);
		}
		
	});
	$(document).ready(function () {
		var len=$("#textarea-usershow").val().length;
		var length=300-len;
		
		$("#textarea-limit").text(length);		
	});
	
	$("#update-information").click(function () {
		$("#baohuzhao").css("display","block");
		$("#information-div").css("display","block");
	});
	$("#close-informaion").click(function () {
		$("#baohuzhao").css("display","none");
		$("#information-div").css("display","none");
	});
/* 	$("#my-informaton").click(function () {
		$("#fans").css("display","none");
		$("#personaldata").css("display","block");
		$("#my-informaton").css("background-color","red");
	});
	$("#my-informaton").hover(function () {
		if ($("#my-informaton").css("background-color") =="red") {
			alert("1");
			$("#my-informaton span a").css("color","white");
			
		}
	}); */
	var URL;
	var flag;
 	$("#center-body-left ul li").click(function (){
		$(this).siblings("li").css("background-color","white");
		$(this).css("background-color","red");
		$(this).attr("class","flagcolor");
		$(this).find("a").css("color","white");
		$(this).siblings("li").find("a").css("color","black");
		$(this).siblings("li").attr("class","nocolor");		
		
		if ($(this).attr("id") == "my-fans") {
			$("#fans").css("display","block");
			$("#fans").siblings("div").css("display","none");
			//selectMyfans
			URL="selectMyfans";
			flag=3;
			$("#pageUtils").css("display","");
			querydata("selectMyfans",3);
		} else if($(this).attr("id") == "my-collect"){
			$("#collect").css("display","block");
			$("#collect").siblings("div").css("display","none");
			//selectMycollect
			URL="selectMycollect";
			flag=1;
			$("#pageUtils").css("display","");
			querydata("selectMycollect",1);
		}else if($(this).attr("id") == "my-focus"){
			$("#focus").css("display","block");
			$("#focus").siblings("div").css("display","none");
			//selectMyfocus
			flag=2;
			$("#pageUtils").css("display","");
			URL="selectMyfocus";
			querydata("selectMyfocus",2);
		}else if($(this).attr("id") == "my-informaton"){
			$("#personaldata").siblings("div").css("display","none");
			$("#pageUtils").css("display","none");
			$("#personaldata").css("display","block");
		}
	}); 
	$("#center-body-left ul li").mouseenter(function (){
		
		if ($(this).attr("class") == "flagcolor") {
			console.log($(this).attr("class")+"222");
			//alert("1");
			$(this).find("a").css("color","white");
		}else{
			console.log($(this).attr("class"));
			$(this).siblings("li").not(".flagcolor").css("background-color","white");
			$(this).siblings("li").not(".flagcolor").find("a").css("color","black");
			$(this).css("background-color","#f5dcdc");
			$(this).find("a").css("color","red");
		}
	});
	$('#cancel-submit-information').click(function () {
		$("#baohuzhao").css("display","none");
		$("#information-div").css("display","none");
		
	});

	var pageNumber1;
	function querydata(URL,flag) {
		
		$.ajax({
			url:URL,
			data:{},
			type:"post",
			dataType:"JSON",
			success:function(data){
				//console.log(data.pageSize);
				if (data.pageNumber < 8) {
					initPageUtils(data.pageIndex,data.pageNumber,1);
				} else {
					initPageUtils(data.pageIndex,8,1);
				}
						
				initList(1,flag);
			},
			error:function(){
				
			}
		});			
	}
	
	function initPageUtils(initi,sum,clicki) {
		var pageList='<ul>';
		initList(clicki,flag);	
		$.ajax({
			url:URL,
			data:{},
			dataType:"JSON",
			type:"post",
			success:function(data){
				//console.log(data);
				//pageUtilsData=data;
			//	console.log(pageUtilsData);
				if (clicki == 1) {
					pageList=pageList+'<li class="pageUtils-ulli-flag" id="head" value="1">首页</li>';
				} else {
					pageList=pageList+'<li class="pageUtils-ulli" id="head" value="1">首页</li>'+'<li class="pageUtils-ulli" id="up">上一页</li>';
				}
				if(clicki-6 > 2){
					pageList=pageList+'<span class="pageUtils-ulli">...</span>';
				}
				for (i = initi; i <=sum; i++) {
					
					if (i == clicki) {
						pageList=pageList+'<li class="pageUtils-li-flag" value="'+i+'">'+i+'</li>';
					} else {
						pageList=pageList+'<li class="pageUtils-li" value="'+i+'">'+i+'</li>';
					}
				}
				if(clicki < data.pageNumber-7){
					pageList=pageList+'<span class="pageUtils-ulli">...</span>'+'<li class="pageUtils-ulli" id="down">下一页</li>'+
					'<li class="pageUtils-ulli" id="foot" value="'+data.pageNumber+'">尾页</li><li><span class="pageUtils-ulli">总数:'+data.pageCount+',共'+data.pageNumber+'页</span></li></ul>';
				}else if(clicki >= data.pageNumber-7 &&clicki != data.pageNumber ) {
					pageList=pageList+'<li class="pageUtils-ulli" id="down">下一页</li>'+
					'<li class="pageUtils-ulli" id="foot" value="'+data.pageNumber+'">尾页</li><li><span class="pageUtils-ulli">总数:'+data.pageCount+',共'+data.pageNumber+'页</span></li></ul>';						
				}else{
					pageList=pageList+
					'<li class="pageUtils-ulli-flag" id="foot" value="'+data.pageNumber+'">尾页</li><li><span class="pageUtils-ulli">总数:'+data.pageCount+',共'+data.pageNumber+'页</span></li></ul>';										
				}
				pageNumber1=data.pageNumber;
			
				$("#pageUtils").html(pageList);
			
			},
			error:function(){
				
			}
		});		
	}
	$("#pageUtils").on("click",'.pageUtils-li',function(){
		var pageNumber=$(this).val();
		var pagesum=$("#foot").val();
		var clickNumber=pageNumber;
		var pageD;
		if (pageNumber+7 > pagesum) {
			pageD=pagesum;
		} else {
			pageD=pageNumber+7;
		}
		if (pagesum < 8) {
			initPageUtils(1,pagesum,clickNumber);
		} else {
			if(pageNumber == 1){				
				initPageUtils(1,8,clickNumber);				
				console.log(1);
			}else if(pageNumber > 1 && pageNumber <= 8 ){
				if (pageNumber-6 > 2) {
					initPageUtils(pageNumber-6,pageD,clickNumber);
				} else {
					initPageUtils(1,pageD,clickNumber);
				}
				
			}else if(pageNumber > 8){
				if (pageNumber+7 >= pageNumber1) {
					initPageUtils(pageNumber-7,pageNumber1,clickNumber);
				} else {
					initPageUtils(pageNumber-7,pageD,clickNumber);
				}
				
			} 
		}

		
	});
	$("#pageUtils").on("click",'#foot',function(){
		var pageNumber=$(this).val();
		var pagesum=$("#foot").val();
		var clickNumber=pageNumber;
		if (pagesum < 8) {
			initPageUtils(1,pageNumber1,clickNumber);
		} else {
			initPageUtils(pageNumber-7,pageNumber1,clickNumber);
		}
				
	});
	$("#pageUtils").on("click",'#head',function(){
		var pageNumber=$(this).val();				
		var pagesum=$("#foot").val();
		var clickNumber=pageNumber;
		if (pagesum < 8) {
			initPageUtils(1,pageNumber1,clickNumber);
		} else {
			initPageUtils(1,8,clickNumber);
		}
	});				
	$("#pageUtils").on("click",'#up',function(){
		var pageNumber=$("li").filter(".pageUtils-li-flag").val()-1;
		var pagesum=$("#foot").val();
		var clickNumber=pageNumber;
		var pageD;
		if (pageNumber+7 > pagesum) {
			pageD=pagesum;
		} else {
			pageD=pageNumber+7;
		}
		if (pagesum < 8) {
			initPageUtils(1,pagesum,clickNumber);
		} else {
			if(pageNumber == 1){				
				initPageUtils(1,8,clickNumber);				
				console.log(1);
			}else if(pageNumber > 1 && pageNumber <= 8 ){
				if (pageNumber-6 > 2) {
					initPageUtils(pageNumber-6,pageD,clickNumber);
				} else {
					initPageUtils(1,pageD,clickNumber);
				}
				
			}else if(pageNumber > 8){
				if (pageNumber+7 >= pageNumber1) {
					initPageUtils(pageNumber-7,pageNumber1,clickNumber);
				} else {
					initPageUtils(pageNumber-7,pageD,clickNumber);
				}
				
			} 
		}		
	});
	$("#pageUtils").on("click",'#down',function(){
		var pageNumber=$("li").filter(".pageUtils-li-flag").val()+1;
		var pagesum=$("#foot").val();
		var clickNumber=pageNumber;
		var pageD;
		if (pageNumber+7 > pagesum) {
			pageD=pagesum;
		} else {
			pageD=pageNumber+7;
		}
		if (pagesum < 8) {
			initPageUtils(1,pagesum,clickNumber);
		} else {
			if(pageNumber == 1){				
				initPageUtils(1,8,clickNumber);				
				console.log(1);
			}else if(pageNumber > 1 && pageNumber <= 8 ){
				if (pageNumber-6 > 2) {
					initPageUtils(pageNumber-6,pageD,clickNumber);
				} else {
					initPageUtils(1,pageD,clickNumber);
				}
				
			}else if(pageNumber > 8){
				if (pageNumber+7 >= pageNumber1) {
					initPageUtils(pageNumber-7,pageNumber1,clickNumber);
				} else {
					initPageUtils(pageNumber-7,pageD,clickNumber);
				}
				
			} 
		}	
	});		
	function timestampToTime(timestamp) {
		var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
		Y = date.getFullYear() + '-';
		M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date
				.getMonth() + 1)
				+ '-';
		D = (date.getDate()<10?'0'+date.getDate():date.getDate()) + ' ';
		h = date.getHours() + ':';
		m = (date.getMinutes()<10?'0'+date.getMinutes():date.getMinutes())+ ':';
		s = date.getSeconds()<10?'0'+date.getSeconds():date.getSeconds();
		return Y + M + D + h + m + s;
	}


	function initList(pageindex,flag) {
		
		var strList='';
		$.ajax({
			url:URL,
			data:{},
			type:"post",
			dataType:"JSON",
			success:function(data){
				console.log(data.list+"...");
				var initstart=(pageindex-1)*data.pageSize
				var initcount=initstart+data.pageSize;
				if (initcount >= data.pageCount) {
					initcount=data.pageCount;
				} 
				str='';
				//alert();
				if (data.pageCount == 0) {
					str=str+'<img id="kongkongid" alt="" src="img/kongkong.jpg" style="width: 600px;height: 400px;margin-left: 6%;margin-top: 20px;">';
				}
				if (data.pageCount <= 4) {
					$("#pageUtils").css("display","none");
				}
				if (flag == 1) {
					for(var i= initstart;i < initcount; i++){
						str=str+'<li><a>'+data.list[i].collectPostTitle+'</a><label><span class="collect-time">'+timestampToTime(data.list[i].collectPostTime)+'</span><span class="collect-cancel" id="'+data.list[i].collectId+'">取消</span></label></li>';		
					}
					$("#collect-list-mycollect").html(str);						
				} else if(flag ==2){
					for(var i=initstart;i < initcount; i++){
						str=str+'<li><a><img alt="" src="'+data.list[i].userPhoto+'"></a><a><span class="focus-username">'+
						data.list[i].userName+'</span></a><a href="" class="focus-cancel" id="'+data.list[i].userId+'">取消关注</a></li>';
					}
					$("#focus-list-myfocus").html(str);	
					$("#focus-count-myfocus").text("共"+data.list.length+"人");	
				} else{
						for(var i= initstart;i < initcount; i++){
							str=str+'<li><a><img alt="" src="'+data.list[i].userPhoto+'"></a><a><span class="focus-username">'+
							data.list[i].userName+'</span></a><a href="" class="focus-cancel">忠实粉丝</a></li>';
							
						}
						
						$("#focus-list-myfans").html(str);	
						$("#focus-count-myfans").text("共"+data.list.length+"人");								
				}
				
				
			},
			error:function(){
				
			}
		});			
	}


	
	$("#center-body-left ul li").mouseout(function (){
		
		if ($(this).attr("class") == "flagcolor") {
			//console.log($(this).attr("class")+"222");
			//alert("1");
			$(this).find("a").css("color","white");
		}else{
			//console.log($(this).attr("class"));
/* 			$(this).siblings("li").not(".flagcolor").css("background-color","white");
			$(this).siblings("li").not(".flagcolor").find("a").css("color","black"); */
			$(this).css("background-color","white");
		   	$(this).find("a").css("color","black");
		}
	});
	$("#focus-list-myfocus").on("click",".focus-cancel",function(){
		
		$.ajax({
			url:"deletemyfocus",
			data:{
				fansid:$(this).attr("id")		
			},
			async:false,
			dataType:"JSON",
			type:"post",
			success:function(data){
				if (data == true) {
					//parent.location.reload();
					window.location.href="gotoMyInformation";
				}
			},
			error:function(){
				
			}
		});
	});
	
	$("#collect-list-mycollect").on("click",".collect-cancel",function(){
		
		$.ajax({
			url:"deletepostcollect",
			data:{
				collectpostid:$(this).attr("id")		
			},
			async:false,
			dataType:"JSON",
			type:"post",
			success:function(data){
				if (data == true) {
					//parent.location.reload();
					window.location.href="gotoMyInformation";
				}
			},
			error:function(){
				
			}
		});
	});

	
	
	//生日	$(".birthday-date").showCalendar();
    //地区   
	var Gid = document.getElementById;
    var showArea = function() {
				Gid('show').innerHTML = "<h3>省" + Gid('s_province').value
						+ " - 市" +
						Gid('s_city').value + " - 县/区" +
						Gid('s_county').value + "</h3>"
	}
	Gid('s_county').setAttribute('onchange', 'showArea()');

	</script>
</body>
</html>