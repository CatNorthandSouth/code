<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/mainHeader/mainHeader.css">
<script src="js/jquery.min.js" charset="utf-8"></script>
</head>
<body>

<div class="mainHeader-div" >
	<ul id="ttt-ul">
		<li class="mainHeader-li" value="1"><span style="color: #fff;"><a style="color: #fff;" href="${pageContext.request.contextPath}/findmainpage">论坛主页</a></span> </li>
		<li class="mainHeader-li" id="jingxuan-li" value="1"><span><a style="color: #fff;">精选板块</a><label id="jingxuan-li-lable">▼</label></span> </li>
		<li class="mainHeader-li" value="1"><span><a style="color: #fff;" href="${pageContext.request.contextPath}/findniuren">牛人排行</a></span> </li>
		<li class="mainHeader-li" value="1"><span><a style="color: #fff;" href="${pageContext.request.contextPath}/togodownloadpage">下载</a></span> </li>
		<li class="mainHeader-li" value="1"><span><a style="color: #fff;" href="${pageContext.request.contextPath}/togoWritePosts">我要发帖</a></span> </li>
		<li class="mainHeader-input"><input type="text" id="searchEnterInput">
			<div class="mainHeader-input-div">
				<img class="mainHeader-input-img" id="mainHeader-input-img" style="background-color: green;" src="img/main/u=4040406470,3157504797&fm=111&gp=0.jpg">.
			</div>
		</li>
<!-- 		<li class="mainHeader-mail" value="1">
			<div>
				<img alt="" src="img/main/u=1457642638,237855583&fm=26&gp=0.jpg">
				
			</div> 
			<span style="color: #fff;">消息</span>
			
		</li> -->
		<li class="mainHeader-picture" id="geren-li" value="1">
			<div class="mainHeader-picture-div">
				<a><img id="header-user-img" src=""></a>
			</div>
			<span style="color: #fff;"><label class="picture-lable">我▼</label></span>
		</li>
	</ul>
</div>
<div  id="jingxuan-div"  class="jingxuan-div">
	<ul id="jingxuan-div-li">
		<li name="3and2"><a style="cursor: pointer;text-decoration: none">人脸识别</a></li>
		<li name="5and5"><a style="cursor: pointer; text-decoration: none">网络攻防</a></li>
		<li name="3and8"><a style="cursor: pointer;text-decoration: none">人机交互</a></li>
	</ul>
</div>
<div  id="geren-div"  class="geren-div">
	<ul>
		<li><a href="${pageContext.request.contextPath}/gotoMyInformation">个人资料</a> </li>
		<li><a href="${pageContext.request.contextPath}/togoMyUpload">我的上传</a> </li>
		<li><a href="${pageContext.request.contextPath}/togoMyfabu?pageid=1">我的发布</a> </li>
		<li><a href="${pageContext.request.contextPath}/revisepassword">修改密码</a> </li>
		<li><a href="${pageContext.request.contextPath}/exitApacheCN">退出论坛</a></li>
	</ul>
</div>

<script type="text/javascript">

	$("#jingxuan-li").click(function () {
		$("#jingxuan-div").css("display","block");
		$("#jingxuan-li-lable").css("transform","rotate(180deg)");
	});
	$("#jingxuan-div").mouseover(function () {
		$("#jingxuan-div").show();
	}).mouseout(function () {
		$("#jingxuan-div").hide();
	}); 
	$("#geren-li").click(function () {
		$("#geren-div").css("display","block");
	});
	$("#geren-div").mouseover(function () {
		$("#geren-div").show();
	}).mouseout(function () {
		$("#geren-div").hide();
	}); 
	$(document).ready(function () {
		$("#header-user-img").attr("src","<%=session.getAttribute("user-img")%>");
	});
	
	$("#jingxuan-div-li").on("click","li",function(){
		var smallboardtext=$(this).attr("name");
		//alert(smallboardtext);
		initTimer(0);
		$.ajax({
			url:"tojingxuanbankuai",
			data:{
				id:smallboardtext
			},
			dataType:"JSON",
			type:"post",
			success:function(){
				
			},
			error:function(){
				
			},
		});	
	});

	function initTimer(sum) {
		$.ajax({
			url:"initTimer",
			data:{
				flagsum:sum
			},
			dataType:"JSON",
			type:"post",
			success:function(){
				
			}
		});
	}
	$("#searchEnterInput").change(function () {
		var content=$(this).val().trim();
		console.log(content);
		if (content != "") {
			$.ajax({
				url:"searchMainList1",
				data:{
					content:content
				},
				dataType:"JSON",
				type:"post",
				success:function(){
					alert("..");
					
				},
				error:function(){
					
				}
			});	
			window.location.href="goSearchList";
			//initTimer(0);
		} 
	});
	$("#ttt-ul").on("click","li",function(){
		if ($(this).val()=="1") {
			initTimer(1);
		} 
	});
</script>
</body>
</html>