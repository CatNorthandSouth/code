<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    
    <head>
        <meta charset="utf-8">
        <title>
            X-admin v1.0
        </title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="format-detection" content="telephone=no">
        <link rel="stylesheet" href="./css/x-admin.css" media="all">
        <script src="js/jquery.min.js" charset="utf-8"></script>
    </head>
    
    <body>
        <div class="x-body">
            <form class="layui-form layui-form-pane">
                <div class="layui-form-item">
                    <label for="L_title" class="layui-form-label">
                        标题
                    </label>
                    <div class="layui-input-block">
                        <input type="text" id="L_title" name="title" required lay-verify="title" value="请输入标题" 
                        autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <div class="layui-input-block">
                        <textarea id="L_content" name="content" 
                        placeholder="请输入内容" class="layui-textarea fly-editor" style="height: 260px;">请输入内容</textarea>
                    </div>
                    <label for="L_content" class="layui-form-label" style="top: -2px;">
                        描述
                    </label>
                </div>

                <div class="layui-form-item">
                    <button class="layui-btn" lay-filter="add" lay-submit id="Hpost-btn-save">
                        保存
                    </button>
                </div>
            </form>
        </div>
        <script src="./lib/layui/layui.js" charset="utf-8">
        </script>
        <script src="./js/x-layui.js" charset="utf-8">
        </script>
        <script>
            layui.use(['form','layer','layedit'], function(){
                $ = layui.jquery;
              var form = layui.form()
              ,layer = layui.layer
              ,layedit = layui.layedit;


                layedit.set({
                  uploadImage: {
                    url: "./upimg.json" //接口url
                    ,type: 'post' //默认post
                  }
                })
  
            //创建一个编辑器
            editIndex = layedit.build('L_content');
                
              
				var typeid;
              //监听提交
              form.on('submit(add)', function(data){
                console.log(data);
                $.ajax({
                	url:"${pageContext.request.contextPath}/HupdateGongGao",
                	type:"post",
                	data:{
                		title:$("#L_title").val(),
                		content:layedit.getContent(editIndex),
                		typeid:typeid,
                  		id:window.location.search.substring(window.location.search.lastIndexOf('=')+1,(window.location.search).length)
                	},
                	dataType:"JSON",
                	success:function(data){
                		if (data == true) {
                            layer.alert("保存成功", {icon: 6},function () {
                                // 获得frame索引
                                var index = parent.layer.getFrameIndex(window.name);
                                //关闭当前frame
                                parent.layer.close(index);
                            });
						} else {
			                layer.alert("保存失败", {icon: 6},function () {
			                    // 获得frame索引
			                    var index = parent.layer.getFrameIndex(window.name);
			                    //关闭当前frame
			                    parent.layer.close(index);
			                });
						}
                	}
                });              
                //发异步，把数据提交给php

                return false;
              });
              form.on('select(type_mid)', function(data){
                 typeid=data.value;
                  form.render();
                }); 
              $.ajax({
              	url:"${pageContext.request.contextPath}/Hfindboard",
              	dataType:"JSON",
              	type:"post",
              	success:function(data){

              		var str='<option></option> ';
              		for (var i = 0; i < data[0].length; i++) {
              			str=str+'<optgroup value="'+(data[0])[i].biboId+'" label="'+(data[0])[i].biboTitle+'">';
              			for (var j = 0; j < (data[1])[i].length; j++) {
              				str=str+'<option value="'+((data[1])[i])[j].smboId+'">'+((data[1])[i])[j].smboTitle+'</option>';
  							
  						}
              			str=str+'</optgroup>';
  					}
              		console.log(str);
              		$("#cid").html(str);
              		form.render();
              	}
              });
             
              
            });
            


        </script>
        <script>
        var _hmt = _hmt || [];
        (function() {
          var hm = document.createElement("script");
          hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
          var s = document.getElementsByTagName("script")[0]; 
          s.parentNode.insertBefore(hm, s);
        })();
        </script>
    </body>

</html>