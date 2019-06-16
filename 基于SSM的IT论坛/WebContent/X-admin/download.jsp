<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="js/jquery.min.js" charset="utf-8"></script>
<link rel="stylesheet" href="css/download/down.css">
</head>
<body>
<div id="main-nav1">
</div>
<div class="down-main-div">
	<div class="down-left">1</div>
	<div class="down-center">
		<div class="down-type">
			<span class="down-title">技术领域：</span>
			<div class="down-title-list">
				<ul id="downtypelist">
<!-- 					<li><span class="redcolor">全部</span></li>
					<li><span>哈哈</span></li>
					<li><span>呵呵呵</span></li>
					<li><span>嘿嘿嘿嘿</span></li>
					<li><span>嘿嘿嘿嘿</span></li>
					<li><span>嘿嘿嘿嘿</span></li>
					<li><span>1嘿嘿嘿嘿</span></li>
					<li><span>嘿嘿嘿嘿3</span></li>
					<li><span>嘿嘿嘿嘿</span></li>
					<li><span>嘿嘿嘿嘿</span></li>
					<li><span>1嘿嘿嘿嘿</span></li>
					<li><span>嘿嘿嘿嘿3</span></li> -->
				</ul>
			</div>
		</div>
		<div class="down-search">
			<span class="down-title">技术领域：</span>
			<span class="down-input">
				<input type="text" class="down-search-input" id="down-search-input" >
			</span>
			<span class="down-btn"><button class="down-search-btn" id="down-search-btn">搜索</button></span>
			<span class="down-btn2"><button class="down-search-btn" id="down-upload-btn">上传</button></span>
		</div>
		
		<div class="down-file-div" id="down-file-div">
			<form action="${pageContext.request.contextPath}/FileUpload" method="post" accept-charset="UTF-8" enctype="multipart/form-data">
				<div class="file-name-div">
					<label class="file-name-label" >文件名：</label>
					<input class="file-name-text" id="fileName" name="fileName" type="text" maxlength="30" placeholder="限30个字符">
				</div>
				<div class="file-uploadfile-div">
					<label class="file-uploadfile-label" >上传文件：</label>
					<input type="file" id="fileupload" name="fileupload">
				</div>
				<div class="file-type-div">
					<label class="file-type-label">文件类型：</label>
					<select class="file-type-select" id="fileType" name="fileType">
						<option>1</option>
			
					</select>
				</div>
				<div class="file-des-div">
					<label class="file-des-label">简        介：</label>
					<textarea class="file-des-text" rows="3" cols="40" id="fileDes" name="fileDes"></textarea>
				</div>

				<div class="file-btn-div">
					<input type="submit" value="提交" class="down-submit" id="down-submit">
					<input type="reset" id="down-reset" class="down-reset" value="取消">
				</div>
			</form>
		</div>
		
		<div class="down-content">
			<div class="down-content-title" id="down-content-title">
				<span class="new-upload" id="new-upload" name="0">最新上传</span>
				<span class="more-load" id="more-load" name="1">最多下载</span>
			</div>
			<div class="down-content-list" id="down-content-list">
<!-- 				<dl class="down-content-list-dl">
					<dt class="down-content-list-dt">
						<a>
							<img class="down-content-img" alt="" src="img/main/u=1457642638,237855583&fm=26&gp=0.jpg">
						</a>
					</dt>
					<dd class="down-content-list-dd">
						<a class="down-content-list-a">python实现房贷计算器</a>
						<p class="search-p">当年撒看见撒旦那就按三年
						见撒旦那就按三年
						见撒旦那就按三年
						见撒旦那就按三年
						见撒旦那就按三年
						见撒旦那就按三年
						见你看见撒旦那就按三年级</p>
						<div class="down-content-list-div">
							<label>
								<span>资源大小：</span>
								<em>69KB</em>
							</label>
							<label>
								<span>上传者：</span>
								<em>hello world</em>
							</label>
							<label>
								<span>上传时间：</span>
								<em>2019-03-06</em>
							</label>
						</div>
					</dd>
					<label class="down-click">
							立即下载
					</label>
				</dl> -->
			</div>
			<div class="footdiv" id="footdiv">
				我是也是个有底线的人(* ￣︿￣)
			</div>
		</div>
	</div>
	<div class="down-right">1</div>
</div>
<script type="text/javascript">
	$("#main-nav1").load("mainHeader.jsp");
	$("#down-upload-btn").click(function () {
		$("#down-file-div").css("display","block");
	});
	$("#down-reset").click(function () {
		$("#down-file-div").css("display","none");
	});
	$.ajax({
		url:"selectdownsmallboard",
		data:{},
		dataType:"JSON",
		type:"post",
		success:function(data){
			str='';
			for (var i = 0; i < data.length; i++) {
				str=str+'<option value="'+data[i].smboId+'">'+data[i].smboTitle+'</option>';
			}
			$("#fileType").html(str);
		},
		error:function(){
			
		}
	});
	$.ajax({
		url:"selecttypelistAll",
		data:{},
		dataType:"JSON",
		type:"post",
		success:function(data){
			str='<li value="0" class="redcolor"><span>全部</span></li>';
			
			for (var i = 0; i < data.length; i++) {
				str=str+'<li value="'+data[i].smboId+'"><span>'+data[i].smboTitle+'</span></li>';
			}
			$("#downtypelist").html(str);
		},
		error:function(){
			
		}		
	});
	var typeId=0;
	var typeSort=0;
	var sum=10;
	$("#downtypelist").on("click","li",function(){
		typeId=$(this).val();
		$(this).attr("class","redcolor");
		$(this).siblings().attr("class","");
	});
	$("#down-content-title").on("click","span",function(){
		typeSort=$(this).attr("name");
		$(this).css("color","red");
		$(this).siblings().css("color","black");
		
	});
	function timestampToTime(timestamp) {
		var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
		Y = date.getFullYear() + '-';
		M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date
				.getMonth() + 1)
				+ '-';
		D = date.getDate() + ' ';
		h = date.getHours() + ':';
		m = (date.getMinutes()<10?'0'+date.getMinutes():date.getMinutes())+ ':';
		s = date.getSeconds()<10?'0'+date.getSeconds():date.getSeconds();
		return Y + M + D;
	}
	function bytechange(size) {
		if (size < 1024) {
			return size+"B";
		} else {
			size=size/1024;
		}
		if (size < 1024) {
			return Math.round(size*100)/100+"KB";
		} else {
			size=size/1024;
		}
		if (size < 1024) {
			
			return Math.round(size*100)/100+"MB";
		} else {
			
			return Math.round(size*100*1024)/100+"GB";
		}
	
	}
	function initFileList(sum){
		$.ajax({
			url:"selectfilelist",
			data:{
				typeId:typeId,
				typeSort:typeSort
			},
			dataType:"JSON",
			type:"post",
			success:function(data){
				console.log(JSON.stringify(data));
				str='';
				if (sum >= data.length) {
					sum=data.length;
				} 
			
				
				for (var i = 0; i < sum; i++) {
					str=str+'<dl class="down-content-list-dl"><dt class="down-content-list-dt"><a>'+
					'<img class="down-content-img" alt="" src="'+data[i].filePicture+'"></a></dt><dd class="down-content-list-dd">'+
					'<a class="down-content-list-a">'+data[i].fileName+'</a><p class="search-p">'+
					data[i].fileDes+'</p><div class="down-content-list-div"><label><span>资源大小：</span>'+
					'<em>'+bytechange(data[i].fileSize)+'</em></label><label><span>上传者：</span><em>'+
					data[i].fileUpAdmin+'</em></label><label><span>上传时间：</span><em>'+timestampToTime(data[i].fileCreateTime)
					+'</em></label></div></dd><label class="down-click" id="'+data[i].fileId+'">立即下载</label></dl>';
					
				}
			$("#down-content-list").html(str);
						
						
			},
			error:function(){
				
			}				
		});
	}
	$("#down-content-list").on("click",".down-click",function(){
		location.href="fileDownload?id="+$(this).attr("id");
	});
	$(document).ready(function () {
		initFileList(sum);
		$(window).scroll(function () {
			
			var winH=$(window).height();//浏览器的高度
			var top=$(window).scrollTop();//滚动条到顶部垂直高度		
			var textH=$(document).height();//页面文档的高度
			console.log(winH+"   "+top+"  "+textH);
		/* 	var htmlHeight=document.body.scrollHeight||document.documentElement.scrollHeight;
			var clientHeight=document.body.clientHeight||document.documentElement.clientHeight;
			var scrollHeight=document.body.scrollHeight||document.documentElement.scrollHeight; */
			//console.log(htmlHeight+"   "+clientHeight+"  "+scrollHeight);
			if (winH + top > textH - 30) {
				sum=sum+6;
				setTimeout(function () {
					
				},1000);
				initFileList(sum);
				if ($("#down-search-input").val().trim() == "") {
					initSearchFileList(sum);
				}
			}
			
		});
	});
	function initSearchFileList(sum){
		$.ajax({
			url:"searchFile",
			data:{
				typeId:typeId,
				typeSort:typeSort,
				content:$("#down-search-input").val().trim()
			},
			dataType:"JSON",
			type:"post",
			success:function(data){
				console.log(JSON.stringify(data));
				str='';
				if (sum >= data.length) {
					sum=data.length;
				} 
			
				
				for (var i = 0; i < sum; i++) {
					str=str+'<dl class="down-content-list-dl"><dt class="down-content-list-dt"><a>'+
					'<img class="down-content-img" alt="" src="'+data[i].filePicture+'"></a></dt><dd class="down-content-list-dd">'+
					'<a class="down-content-list-a">'+data[i].fileName+'</a><p class="search-p">'+
					data[i].fileDes+'</p><div class="down-content-list-div"><label><span>资源大小：</span>'+
					'<em>'+bytechange(data[i].fileSize)+'</em></label><label><span>上传者：</span><em>'+
					data[i].fileUpAdmin+'</em></label><label><span>上传时间：</span><em>'+timestampToTime(data[i].fileCreateTime)
					+'</em></label></div></dd><label class="down-click" id="'+data[i].fileId+'">立即下载</label></dl>';
					
				}
			$("#down-content-list").html(str);
						
						
			},
			error:function(){
				
			}				
		});
	}
	$("#down-search-btn").click(function () {
		var inputContent= $("#down-search-input").val().trim();
		if (inputContent == "") {
			alert("请输入您要搜索的内容");
		} else {
			initSearchFileList(6);
		}
	});

</script>
</body>
</html>