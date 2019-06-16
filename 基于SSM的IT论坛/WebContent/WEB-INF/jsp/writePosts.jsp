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
<link rel="stylesheet" href="css/mainpageright.css">
<!-- <link href="css/umeditor/umeditor.css" type="text/css" rel="stylesheet"> -->
<link rel="stylesheet" href="X-admin/css/x-admin.css" media="all">

<style type="text/css">
h1 {
	font-family: "微软雅黑";
	font-weight: normal;
}

.btn {
	display: inline-block;
	*display: inline;
	padding: 4px 12px;
	margin-bottom: 0;
	*margin-left: .3em;
	font-size: 14px;
	line-height: 20px;
	color: #333333;
	text-align: center;
	text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
	vertical-align: middle;
	cursor: pointer;
	background-color: #f5f5f5;
	*background-color: #e6e6e6;
	background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6);
	background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff),
		to(#e6e6e6));
	background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6);
	background-image: -o-linear-gradient(top, #ffffff, #e6e6e6);
	background-image: linear-gradient(to bottom, #ffffff, #e6e6e6);
	background-repeat: repeat-x;
	border: 1px solid #cccccc;
	*border: 0;
	border-color: #e6e6e6 #e6e6e6 #bfbfbf;
	border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
	border-bottom-color: #b3b3b3;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff',
		endColorstr='#ffe6e6e6', GradientType=0);
	filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
	*zoom: 1;
	-webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
		rgba(0, 0, 0, 0.05);
	-moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
		rgba(0, 0, 0, 0.05);
	box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
		rgba(0, 0, 0, 0.05);
}

.btn:hover, .btn:focus, .btn:active, .btn.active, .btn.disabled, .btn[disabled]
	{
	color: #333333;
	background-color: #e6e6e6;
	*background-color: #d9d9d9;
}

.btn:active, .btn.active {
	background-color: #cccccc \9;
}

.btn:first-child {
	*margin-left: 0;
}

.btn:hover, .btn:focus {
	color: #333333;
	text-decoration: none;
	background-position: 0 -15px;
	-webkit-transition: background-position 0.1s linear;
	-moz-transition: background-position 0.1s linear;
	-o-transition: background-position 0.1s linear;
	transition: background-position 0.1s linear;
}

.btn:focus {
	outline: thin dotted #333;
	outline: 5px auto -webkit-focus-ring-color;
	outline-offset: -2px;
}

.btn.active, .btn:active {
	background-image: none;
	outline: 0;
	-webkit-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px
		rgba(0, 0, 0, 0.05);
	-moz-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px
		rgba(0, 0, 0, 0.05);
	box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px
		rgba(0, 0, 0, 0.05);
}

.btn.disabled, .btn[disabled] {
	cursor: default;
	background-image: none;
	opacity: 0.65;
	filter: alpha(opacity = 65);
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
}
</style>
</head>
<body>
	<div class="main-heade" id="main-heade">


		<div class="header-zhanwei"></div>
	</div>
	

	<!-- 主体内容 -->
	<div class="main-body">
		<div class="main-left-body" style="background-color: #f0f0f5;"></div>
		<!-- 排行榜 -->
		 <div class="main-center-body">
		<form class="layui-form-pane"  action="insertPost" method="post" >  
			<!-- <div class="post-content">  -->
			
        <div class="x-body">
            <!-- <form class="layui-form layui-form-pane" action="insertPost" method="post" > -->
                <div class="layui-form-item">
                    <label for="L_title" class="layui-form-label">
                        标题
                    </label>
                    <div class="layui-input-block">
                        <input type="text" name="postTitle" id="L_title" style="width: 70%;" name="title" required lay-verify="title" value="请输入标题" 
                        autocomplete="off" class="layui-input">
                        <div style="width: 25%;float: right; margin-top: -38px;">
                        	<input type="hidden" name="postScore" id="select-scoreid" >
							<select style="height: 38px;line-height: 38px;border-color: #D2D2D2!important;" class="select-score" name="postReward1" id="select-score"></select>
							<label class="isuse-score" >
								<span >可用分：</span>
								<i id="isuse-userAllmarks">${bsUser.userAllmarks}</i>
							</label>
						</div>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <div class="layui-input-block">
                        <textarea id="L_content" name="postContent" 
                        placeholder="请输入内容"  onkeyup="checknum()" class="layui-textarea fly-editor" style="height: 260px;">请输入内容</textarea>
				<!-- 	<div class="body-count">
						<span id="body-count-tips">您还可以输入5000个字</span>
					</div> -->
						<ul class="theme-plate">
							<li>
								<label class="theme-plate-tips">主题板块</label>
								<div class="plate-list" style="width: 80%; ">
									<div  style="width: 100%;float: left;height: 38px;line-height: 38px">
										<select id="select-parent-list" style="border-color: #e6e6e6;height: 38px;line-height: 38px" name="postBiboId">
											<option value="">-选择大版块-</option>	
										</select>
									</div>
									<div  style="width: 100%;float: left;margin-left: 200px;margin-top: -38px;">
										<select id="select-child-list" readonly="false" style="border-color: #e6e6e6; height: 38px;line-height: 38px;" name="postSmboId" >
											<option value="">-选择小版块-</option>
										</select>
									</div>
								</div>
							</li>
						</ul>                   
                    </div>
                  	
                </div>

                <div class="layui-form-item">
           
                    <input class="layui-btn" type="submit" value="保存">
                </div>
            <!-- </form> -->
        </div>
		
			<!-- </div> -->
	</form>
		</div> 
		<!--  
			主体右边内容
		-->
		<div class="main-right-body" style="background-color: #f0f0f5;"></div>
	</div>
	<div id="main-foot-page" style="width: 100%;height: 100px;margin-top: 20px; float: left;">
	</div>
	
	<script src="js/jquery.min.js" charset="utf-8"></script>
	        <script src="X-admin/lib/layui/layui.js" charset="utf-8">
        </script>
        <script src="X-admin/js/x-layui.js" charset="utf-8">
        </script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
	$("#main-heade").load("mainHeader.jsp");
	$("#main-foot-page").load("mainfoot.jsp");
    layui.use(['form','layer','layedit'], function(){
        $ = layui.jquery;
      var form = layui.form()
      ,layer = layui.layer
      ,layedit = layui.layedit;


        layedit.set({
          uploadImage: {
            url: "${pageContext.request.contextPath}/postimgupload" //接口url
            ,type: 'post' //默认post
          }
        })

    //创建一个编辑器
    editIndex = layedit.build('L_content');
/* 	 function checknum() {
		alert("55");
	} */
    	
      //监听提交
      form.on('submit(add)', function(data){
       
                   
        //发异步，把数据提交给php
        layer.alert("保存成功", {icon: 6},function () {
            // 获得frame索引
            var index = parent.layer.getFrameIndex(window.name);
            //关闭当前frame
            parent.layer.close(index);

        });
        return false;
      });
      form.on('select(type_mid)', function(data){
         typeid=data.value;
          form.render();
        }); 
 
    });
    

	

//	$("#select-parent-list").on("click",function(){
		var str='<option value="">-选择大版块-</option>';
		var str1='<option value="0">0</option>';
		var arr=[10,20,40,60,80,100];
		$.ajax({
			url:"selectBigboard",
			type:"post",
			dataType:"JSON",
			data:{},
			success:function(data){
				console.log(JSON.stringify(data));
				for (var i = 0; i < data.length; i++) {
					str=str+'<option value='+data[i].biboId+'>'+data[i].biboTitle+'</option>';
				}
				 
				for (var j = 0; j < arr.length; j++) {
					if (arr[i] < $("#isuse-userAllmarks").text()|| arr[i] == $("#isuse-userAllmarks").text()) {
						str1=str1+'<option value="'+arr[j]+'">'+arr[j]+'</option>';
					}else{
						break;
					}
					
				}
				$("#select-parent-list").html(str);
				$("#select-score").html(str1);
				
			},
			error:function(){
				
			}
		});		
		
//	});

		$("#select-parent-list").on("click",function(){
			
			$("#select-scoreid").attr("value",$("#select-score").val());
			var str='<option value="">-选择小版块-</option>';
			
			$.ajax({
				url:"selectBsSmallboard",
				type:"post",
				dataType:"JSON",
				data:{
					 parentVal:$("#select-parent-list").val()
				},
				success:function(data){
					console.log("..."+JSON.stringify(data));
					for (var i = 0; i < data.length; i++) {
						str=str+'<option value='+data[i].smboId+'>'+data[i].smboTitle+'</option>';
					}
					//alert(str);
					$("#select-child-list").html(str);					
				},
				error:function(){
					
				}
			});	
		});

</script>
</body>
</html>