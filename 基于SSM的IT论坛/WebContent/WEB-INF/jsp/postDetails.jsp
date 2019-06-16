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
	href="css/postDetails/postDetails.css">
  <link rel="stylesheet" href="css/bootstrap.min.css">
 <link rel="stylesheet" href="X-admin/css/x-admin.css" media="all"> 
  <style type="text/css">
 .pageUtils{
	width: 100%;
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
	<div id="header-div">	
	</div>
	
	<div id="main-div" class="main-div-post">
		<div id="main-list-div" class="main-list-div">
			<div id="main-header-div" class="main-header-div">
				<a href="${pageContext.request.contextPath}/findmainpage">apache</a>
				<em>></em>
				<a >${postDetailsName1}</a>
				<em>></em>
				<a href="#">${postDetailsName2}</a>
			</div>	
			<div class="post-main-div" id="post-main-div">
			<input type="hidden" value="${bsPosts.postId }" id="findpostId">
				<div class="post-main-details" id="post-main-details">
					<div class="post-details-title" id="post-details-title">
						<span class="post-details-span" id="post-details-span">${bsPosts.postTitle }</span><span>[问题点数：${bsPosts.postScore}分]</span>
					</div>
					<div class="post-details-middle" id="post-details-middle">
						<span class="post-details-collect" id="post-details-collect" value="${collectflag}"></span><span class="post-details-reply" id="post-details-reply">回复</span>
					</div>
					<!-- 回复 -->
					<div id="postDetails-div" class="postDetails-div">
						<!--style给定宽度可以影响编辑器的最终宽度-->
						<!-- <form action="insertPostDetails" method="post"> -->
						
							<form class="layui-form"  method="post" id="myForm" enctype="multipart/form-data">
							 <div class="layui-form-item layui-form-text" >
                    			<div class="layui-input-block"  style="width: 500px;margin-left: 0px;">
                        			<textarea id="replyContent" name="replyContent" 
                      					  placeholder="请输入内容"   class="layui-textarea fly-editor" style="height: 260px;">请输入内容</textarea>	           
                   				 </div>
               				 </div>
							</form>
							
							<div class="post-content-submit">
								<input type="reset" class="reset" id="replypost-reset" value="取消">
								<input type="submit" class="submit" class="layui-btn" id="replypost-submit" value="发表">
								
							</div>
						 
						<!-- </form> -->
					</div>

					<!--开始  -->
					<div class="post-details-body">
						<div class="post-details-left">
							<div>
								<dl class="sort-content-list">
									<dt>
										<a href="" target="_blank"> <img
											alt="2_nayi_224" src="${louzhubsUser.userPhoto }">
										</a>
									</dt>
								<dd>
									<a href="" class="user_nick_name"
										rel="nofollow" target="_blank" title="nayi_224" id="louzhuUserName">${louzhubsUser.userName}</a>
									<p class="genius_p">
										<b>&nbsp;</b> <span > <img title="专家分：5129"
											alt="专家分：5129"
											src="img/tribuneniuren/2.png">
										</span> <b>&nbsp;</b>
									</p>
								</dd>
								</dl>
							</div>
						</div>
						<div class="post-details-right">
							
							<div class="post-details-content" >
							${bsPosts.postContent }	
							</div>
							<div class="details-content-list">
								<span class="good-count"><img src="img/zan.jpg" id="clickpostgoodzan" style="height: 15px;width: 15px;margin-right: 3px;"> <span class="tt0" id="updategoodzan">${bsPosts.postGoodCount }</span></span>
								<span class="bad-count"><img src="img/zan.jpg" id="clickpostbadzan"  style="height: 15px;width: 15px; transform:rotate(180deg); margin-right: 3px;"><span class="tt0" id="updatebadzan">${bsPosts.postBadCount }</span></span>
								<span class="post-update-time" id="post-update-time-span">${bsPosts.postUpdateTime}</span>	
								<span class="louzhu">楼主</span>
								<span class="program-post">楼层</span>
								<span class="reply-count">回复数  ${huifushu}</span>
								
							</div>
						</div>
					</div>
					<!-- 结束 -->
					<img id="kongkongid" alt="" src="img/kongkong.jpg" style="width: 800px;height: 400px;margin-left: 12%;margin-top: 20px;">		
					<div id="replydiv">
						
					</div>												
				</div>
			<!-- 分页 -->
 		<div id="pageUtils" class="pageUtils">
			
		</div> 
		<!-- 分页 -->				
			</div>
			
				
			
		</div>

	</div>
	<div id="main-foot-page" style="width: 100%;height: 100px;margin-top: 10px; float: left;">
	</div>	
		<script src="js/jquery.min.js" charset="utf-8"></script>
	        <script src="X-admin/lib/layui/layui.js" charset="utf-8">
        </script>
        <script src="X-admin/js/x-layui.js" charset="utf-8">
        </script>
	<script type="text/javascript"> 
		$("#header-div").load("mainHeader.jsp");
		$("#main-foot-page").load("mainfoot.jsp");
		$("#post-details-reply").click(function () {

			$("#postDetails-div").css("display","block");
		});
	    //实例化编辑器
   layui.use(['form','layer','layedit'], function(){
        $ = layui.jquery;
      var form = layui.form()
      ,layer = layui.layer
      ,layedit = layui.layedit;


        layedit.set({
          uploadImage: {
            url: '${pageContext.request.contextPath}/postimgupload'//接口url
            ,type: 'post' //默认post
          }
        })

    //创建一个编辑器
    editIndex = layedit.build('replyContent');
    	$("#replypost-submit").click(function () {
			$.ajax({
				url:"insertPostReply",
				type:"post",
				dataType:"JSON",
				data:{
					replyContent:layedit.getContent(editIndex)
				},
				success:function(data){
					if (data == true) {
						$("#postDetails-div").css("display","none");
						window.location.href="${pageContext.request.contextPath}/togoPostDetails?id="+$("#findpostId").val();
					} else {
						alert("回复失败");
					}
															
				},
				error:function(){
					alert("回复这是错误");
				}
			});	
		});

      form.on('select(type_mid)', function(data){
         typeid=data.value;
          form.render();
        }); 
 
    });
    	  
	
		
	
		$("#replypost-reset").click(function () {
			$("#postDetails-div").css("display","none");
		});

		var pageNumber1;
		
 		$(document).ready(function () {
 		
 			
			$.ajax({
				url:"selectReplyList",
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
							
					initList(1);
					if (data.pageCount > 0) {
						$("#kongkongid").css("display","none");
					}
					if (data.pageCount <= 3) {
						$("#pageUtils").css("display","none");
					}
					$("#post-update-time-span").text(timestampToTime($("#post-update-time-span").text()));
					$("#post-details-left").css("height",$("#post-details-right").css("height"));
				},
				error:function(){
					
				}
			});			
 			
			
			$.ajax({
				url:"collectpoststate",
				data:{},
				type:"post",
				dataType:"JSON",
				success:function(data){
					if (data == "1") {
						$("#post-details-collect").text("收藏帖子");
						//alert($("#post-details-collect").val());
					} else {
						$("#post-details-collect").text("取消收藏");
						//alert($("#post-details-collect").val());
					}
				}
			})
			
		}); 
		
		function initPageUtils(initi,sum,clicki) {
			var pageList='<ul>';
			initList(clicki);	
			
			$.ajax({
				url:"selectReplyList",
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
			D = date.getDate() + ' ';
			h = date.getHours() + ':';
			m = (date.getMinutes()<10?'0'+date.getMinutes():date.getMinutes())+ ':';
			s = date.getSeconds()<10?'0'+date.getSeconds():date.getSeconds();
			return Y + M + D + h + m + s;
		}


		function initList(pageindex) {

			var strList='';
			$.ajax({
				url:"selectReplyList",
				data:{},
				type:"post",
				dataType:"JSON",
				success:function(data){
					var str='';
					var initstart=(pageindex-1)*data.pageSize
					var initcount=initstart+data.pageSize;
					var pageCount=data.pageCount;
					if (initcount >= pageCount) {
						initcount=pageCount;
					} else {
						initcount=initcount;
					}
					console.log(initstart+"  "+initcount);
				//	if (data != null) {
 						for (var i = initstart+1; i <= initcount; i++) {
						//for (var i = 1; i <= data[0].length; i++) {
							str=str+'<div class="post-details-body" >'+'<div class="post-details-left">'+
							'<div><dl class="sort-content-list">'+
							'<dt><a href="//my.csdn.net/nayi_224" target="_blank">'+
							'<img alt="2_nayi_224" src="'+(data.list[1])[i-1].userPhoto+'"></a></dt>';
							str=str+'<dd><a href="//my.csdn.net/nayi_224" class="user_nick_name"'+
							'rel="nofollow" target="_blank" title="nayi_224">'+(data.list[1])[i-1].userName+'</a><p class="genius_p">'+
							'<b>&nbsp;</b> <span> <img title="专家分：5129" alt="专家分：5129" src="img/tribuneniuren/2.png">'+
							'</span> <b>&nbsp;</b></p></dd></dl></div></div>';
							//str=str+'<input type="hidden" value="'+(data.list[0])[i-1].replyId+'" >';
							str=str+'<div class="post-details-right"><div class="post-details-content">'+(data.list[0])[i-1].replyContent+
							'</div><div class="details-content-list">'+
							'<span class="good-count"><img src="img/zan.jpg" id="updatereplygoodzan" class="'+(data.list[0])[i-1].replyId+'"  style="height: 15px;width: 15px;  margin-right: 3px;"><span class="tt0" id="clickchangegood'+(data.list[0])[i-1].replyId+'" >'+(data.list[0])[i-1].replyGoodCount+'</span></span>'+
							'<span class="bad-count"><img src="img/zan.jpg"  id="updatereplybadzan" class="'+(data.list[0])[i-1].replyId+'" style="height: 15px;width: 15px; transform:rotate(180deg); margin-right: 3px;"><span class="tt0" >'+(data.list[0])[i-1].replyBadCount+'</span></span>'+
							'<span class="post-update-time">'+timestampToTime((data.list[0])[i-1].replyCreateTime)+'</span>'+
							'<span class="louzhu">得分 '+(data.list[0])[i-1].replyScore+'</span>'+
							'<span class="reply-count">#'+i+'</span>'+
							'<span class="program-post"></span>'+
							'<span class="reply-count">楼层</span>'+
							'</div></div></div>';
									console.log(i);
						} 
						$("#replydiv").html(str);
/* 					} else {
	
					} */
					//alert($("#post-details-right").css("height"));
					
				},
				error:function(){
					
				}
			});			
		}
		$("#post-details-collect").click(function () {
			var flag=0;
			var text=$("#post-details-collect").text();
			if (text == "收藏帖子") {
				$("#post-details-collect").text("取消收藏");
				flag=1;
			} else {
				$("#post-details-collect").text("收藏帖子");
				flag=2;
			}
			$.ajax({
				url:"insertCollectPost",
				data:{
					flag:flag,
					postContent:$("#post-details-span").text(),
					userName:$("#louzhuUserName").text(),
					postId:$("#findpostId").val()
				},
				dataType:"JSON",
				type:"post",
				success:function(data){
					
				},
				error:function(){
					
				}
			});
			
		});
		$("#clickpostgoodzan").click(function () {
			$.ajax({
				url:"clickpostgoodzan",
				data:{
					postId:$("#findpostId").val()
				},
				dataType:"JSON",
				type:"post",
				success:function(){
					
				}
			
			})
			updatezan();
		});
		$("#clickpostbadzan").click(function () {
			
			$.ajax({
				url:"clickpostbadzan",
				data:{
					postId:$("#findpostId").val()
				},
				dataType:"JSON",
				type:"post",
				success:function(){
					
				}
			
			})
			updatezan();
		});
		function updatezan() {
			$.ajax({
				url:"updatezan",
				data:{
					postId:$("#findpostId").val()
				},
				dataType:"JSON",
				type:"post",
				success:function(data){
					$("#updategoodzan").text(data.postGoodCount);
					$("#updatebadzan").text(data.postBadCount);
				}
			
			})			
		}
		$(function () {
			setInterval("updatezan()",100);
		})
		
		$("#replydiv").on("click","#updatereplygoodzan",function aa(){
			
			var replyid=$(this).attr("class");
			
		 	$.ajax({
				url:"clickreplygoodzan",
				data:{
					replyid:$(this).attr("class")
				},
				async:false,
				dataType:"JSON",
				type:"post",
				success:function(){
					
				}
			
			});
		 	var datatt=0;
		 	var datatt1=0;
			$.ajax({
				url:"updatereplyzan",
				data:{
					postId:replyid
				},
				dataType:"JSON",
				type:"post",
				async:false,
				success:function(data){
					datatt=data.replyGoodCount;
					datatt1=data.replyBadCount;
				//	alert("..");
				}
			})	
			$(this).next().text(datatt);
			$(this).parent().next().find("span").text(datatt1);
		})
		
		$("#replydiv").on("click","#updatereplybadzan",function aa(){
			
			var replyid=$(this).attr("class");
			
		 	$.ajax({
				url:"clickreplybadzan",
				data:{
					replyid:$(this).attr("class")
				},
				async:false,
				dataType:"JSON",
				type:"post",
				success:function(){
					
				}
			
			});
		 	var datatt=0;
		 	var datatt1=0;
			$.ajax({
				url:"updatereplyzan",
				data:{
					postId:replyid
				},
				dataType:"JSON",
				type:"post",
				async:false,
				success:function(data){
					datatt=data.replyBadCount;
					datatt1=data.replyGoodCount;
					//alert(datatt1);
				}
			})	
			$(this).next().text(datatt);
			$(this).parent().prev().find("span").text(datatt1);
		})
		
	</script>
</body>
</html>