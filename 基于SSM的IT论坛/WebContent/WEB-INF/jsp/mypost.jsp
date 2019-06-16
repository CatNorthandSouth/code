<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <title>layui</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <script src="js/jquery.min.js" charset="utf-8"></script>
  <link rel="stylesheet" type="text/css"
	href="css/bankuaiListPage/bankuaiListPage.css">
</head>
<body>	
	<div id="main-div" class="main-div">
		<div id="header-div">	
		</div>
		<div id="main-list-div" class="main-list-div" style="width: 75%;margin-left: 20%">
		
			<div id="main-header-div" class="main-header-div">
				<a href="${pageContext.request.contextPath}/findmainpage">apache</a>
				<em>></em>
				<a >我发布的</a>
			</div >
		
 			<div id="main-body-div" class="main-body-div">
				<div id="body-header" class="body-header">
					<span class="posts-score">赏分</span>
					<span class="posts-title">主题</span>
				<span class="posts-admin">更新时间</span>
				<!-- 	<span class="posts-huicha">更新时间</span> -->
				</div>
				<div id="body-list" class="body-list">
					<ul>
						<li class="list-li">
							<span class="li-zhuangtai">结帖</span>
							<span class="li-score">100</span>
							<span class="li-title"><a>你的技术开发那就贷款首付</a></span>
							<span class="li-time">2019-10-15 20:24:22</span>
						</li>
					</ul>
				</div>
			</div> 
			<!-- 分页 -->
			<div id="pageUtils" class="pageUtils">
			
			</div>
			<!-- 分页 -->			
		</div>

	</div>
		<div id="main-foot-page" style="width: 100%;height: 100px;margin-top: 10px; float: left;">
	</div>	
	<script type="text/javascript">
	$("#header-div").load("mainHeader.jsp");
	$("#main-foot-page").load("mainfoot.jsp");
	var pageNumber1;
	
		$(document).ready(function () {
		$.ajax({
			url:"selectMyPostList",
			data:{
				smallboard:$("#main-bsSmallboardtext").val()
			},
			type:"post",
			dataType:"JSON",
			success:function(data){
				//console.log(data.pageSize);
				if (data.pageNumber < 8) {
					initPageUtils(data.pageIndex,data.pageNumber,1);
				} else {
					initPageUtils(data.pageIndex,8,1);
				}
						
				initList(1);
				if (data.pageCount == 0) {
					$("#pageUtils").css("display","none");
				}
				
			},
			error:function(){
				
			}
		});			
			
		
	}); 
	
	function initPageUtils(initi,sum,clicki) {
		var pageList='<ul style="padding:0 0 0 0;">';
		initList(clicki);	
		$.ajax({
			url:"selectMyPostList",
			data:{
				smallboard:$("#main-bsSmallboardtext").val()
			},
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
		D = date.getDate() + ' ';
		h = date.getHours() + ':';
		m = (date.getMinutes()<10?'0'+date.getMinutes():date.getMinutes())+ ':';
		s = date.getSeconds()<10?'0'+date.getSeconds():date.getSeconds();
		return Y + M + D + h + m + s;
	}


	function initList(pageindex) {
		
		var strList='';
		$.ajax({
			url:"selectMyPostList",
			data:{
				smallboard:$("#main-bsSmallboardtext").val()
			},
			type:"post",
			dataType:"JSON",
			success:function(data){
				console.log(data.list+"...");
				var initstart=(pageindex-1)*data.pageSize
			 	if (data.pageCount-initstart < data.pageSize) {
			 		var initcount=data.pageCount;
				} else {
					var initcount=initstart+data.pageSize;
				} 
				//alert(initstart+"-"+initcount);
				var strpay="";
				var strList="";
				if (data.pageCount == 0) {
					strList=strList+'<img id="kongkongid" alt="" src="img/kongkong.jpg" style="width: 600px;height: 400px;margin-left: 20%;margin-top: 20px;">';
				}
				for (var i = initstart; i < initcount; i++) {
					if (data.list[i].postIspay == 0) {
						strpay="未结";
					} else {
						strpay="已结";
					}
					//<span class="li-admin">'+data.list[i].postAdmin+'</span>
					strList=strList+'<ul style="padding:0 0 0 0;"><li class="list-li"><span class="li-ispay" >'+strpay+'</span><span class="li-score">'+data.list[i].postScore+'</span><span class="li-title"><a href="${pageContext.request.contextPath}/togoMyFaBuPost?id='+data.list[i].postId+'">'+data.list[i].postTitle+'</a></span><span class="li-time">'+
					timestampToTime(data.list[i].postUpdateTime)+'</span></li></ul>'
										
				}
				$("#body-list").html(strList);
				
			},
			error:function(){
				
			}
		});			
	}

	</script>
</body>
</html>