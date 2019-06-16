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
				<a href="${pageContext.request.contextPath}/togoMyfabu?pageid=1">我发布的</a>
				
			</div>	
			<div class="post-main-div" id="post-main-div">
			<input type="hidden" value="${bsPosts.postId }" id="findpostId">
				<div class="post-main-details" id="post-main-details">
					<div class="post-details-title" id="post-details-title">
						<span class="post-details-span" id="post-details-span">${bsPosts.postTitle }</span><span>[问题点数：${bsPosts.postScore}分]</span>
					</div>
					<div class="post-details-middle" id="post-details-middle">
						<span class="post-details-collect" id="post-details-collect" value="${collectflag}"></span><span class="post-details-reply" id="post-delete">删除</span> 
					</div>
					<!-- 回复 -->
					<div id="postDetails-div" class="postDetails-div" style="height: 150px;margin-top: 10%;">
						<!--style给定宽度可以影响编辑器的最终宽度-->
						<!-- <form action="insertPostDetails" method="post"> -->
						
							<form class="layui-form"  method="post" id="myForm" enctype="multipart/form-data">
							 	 <div class="layui-input-inline" style="width:500px;">
							 	 	<label style="margin-left:10%;line-height:38px;height:38px; inline-block;float: left;">请输入分数(${bsPosts.postScore}分以内)：</label>
                      				<input style="display: inline-block;float: left;width: 290px;" maxlength="3" type="text" name="username" id="reply-score" placeholder="分数" autocomplete="off" class="layui-input">
                      				<input type="hidden" id="reply-hidden-score" >
                      				<input type="hidden" id="post-hidden-score" value="${bsPosts.postScore}">
                    			 </div>
                    		<div class="post-content-submit">
								<input type="reset" class="reset" id="replypost-reset" value="取消">
								<input type="submit" class="submit" class="layui-btn" id="replypost-submit" value="发表">
								
							</div>
							</form>
							

						 
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
	
		$("#replydiv").on("click",".program-post",function(){
			$("#postDetails-div").css("display","block");
			$("#reply-hidden-score").attr("value",$(this).attr("id"));
		});
		$("#post-delete").click(function () {
			if (confirm("您确定要删除吗？") == true) {
				$.ajax({
					url:"deleteMyFaBuPost",
					async:false,
					data:{
						postid:$("#findpostId").val()
					},
					dataType:"JSON",
					type:"post",
					success:function(data){
						if (data == true) {
							alert("删除成功！");
							window.location.href="${pageContext.request.contextPath}/togoMyfabu?pageid=1";
						} else {
							alert("删除失败！");
						}
					},
					error:function(){
						alert("删除帖子报错！");
					}
				});
			} 
		});
		$("#replypost-submit").click(function() {
			var checkNum=/^[1-9]*[1-9][0-9]*$/;
			var inputtext=$("#reply-score").val()-0;
			var flagshuzu= $("#reply-hidden-score").val().split("-");
			//alert(flagshuzu[0]);
			var postscore=$("#post-hidden-score").val()-0;
			
			if (checkNum.test(inputtext) == true) {
				//alert(postscore >= inputtext);
				if (postscore >= inputtext) {
					//score=postscore-inputtext;
				//	alert(checkNum.test(inputtext));
					$.ajax({
						url:"updateMyReplyScore",
						async:false,
						data:{
							userid:flagshuzu[1],
							score:inputtext,
							replyid:flagshuzu[0],
							postid:$("#findpostId").val()
						},
						dataType:"JSON",
						type:"post",
						success:function(data){
							
						},
						error:function(){
							
						}
					});
				} else {
					
				}
			} else {
				alert("请输入数字");
			}

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
    });
    	  
	
		
	
		$("#replypost-reset").click(function () {
			$("#postDetails-div").css("display","none");
		});

		var pageNumber1;
		
 		$(document).ready(function () {
 		
 			
			$.ajax({
				url:"selectMyFaBuReplyList",
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
					if (data.pageCount == 0) {
						$("#pageUtils").css("display","none");
					}
					$("#post-update-time-span").text(timestampToTime($("#post-update-time-span").text()));
				},
				error:function(){
					
				}
			});			
 			
			
			$.ajax({
				url:"shifoujietiestate",
				data:{},
				type:"post",
				dataType:"JSON",
				success:function(data){
					if (data == "1") {
						$("#post-details-collect").text("已结帖");
						//alert($("#post-details-collect").val());
					} else {
						$("#post-details-collect").text("未结帖");
						//alert($("#post-details-collect").val());
					}
				}
			})
			
		}); 
		
		function initPageUtils(initi,sum,clicki) {
			var pageList='<ul>';
			initList(clicki);	
			
			$.ajax({
				url:"selectMyFaBuReplyList",
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
				url:"selectMyFaBuReplyList",
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
							'<span class="reply-count">楼层</span>'+
							'<span class="program-post" id="'+(data.list[0])[i-1].replyId+'-'+(data.list[1])[i-1].userId+'">评分</span>'+
							''+
							'</div></div></div>';
									console.log(i);
						} 
						$("#replydiv").html(str);
/* 					} else {

					} */
					
				},
				error:function(){
					
				}
			});			
		}
		$("#post-details-collect").click(function () {
			var flag=0;
			var text=$("#post-details-collect").text();
			if (text == "未结帖") {
				$("#post-details-collect").text("已结贴");
				flag=1;
			} else {
				$("#post-details-collect").text("未结帖");
				flag=2;
			}
			$.ajax({
				url:"shifoujietie",
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



		


		
	</script>
</body>
</html>