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
    </head>
    
    <body>
        <div class="x-body">
            <form action="" method="post" class="layui-form layui-form-pane">
                <div class="layui-form-item">
                    <label for="name" class="layui-form-label">
                        <span class="x-red">*</span>角色名
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="name" name="name" required="" lay-verify="required"
                        autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">
                        拥有权限
                    </label>
                    <table  class="layui-table layui-input-block">
                        <tbody>
                            <tr>
                                <td>
                                    用户管理
                                </td>
                                <td>
                                    <div class="layui-input-block">
                                        <input name="id[7]" type="checkbox" value="7"> 会员管理
                                        <input name="id[8]" type="checkbox" value="8"> 管理员删除
                                        
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    文章管理
                                </td>
                                <td>
                                    <div class="layui-input-block">
                                        <input name="id[1]" type="checkbox" value="1"> 帖子管理
                                        <input name="id[2]" type="checkbox" value="2"> 文件管理
                                        <input name="id[3]" type="checkbox" value="3"> 轮播管理
                                        <input name="id[4]" type="checkbox" value="4"> 公告管理
                                        <input name="id[5]" type="checkbox" value="5"> 评论管理
                                        <input name="id[6]" type="checkbox" value="6"> 版主推荐
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label for="desc" class="layui-form-label">
                        描述
                    </label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入内容" id="desc" name="desc" class="layui-textarea"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                <button class="layui-btn" lay-submit="" lay-filter="add">增加</button>
              </div>
            </form>
        </div>
        <script src="./lib/layui/layui.js" charset="utf-8">
        </script>
        <script src="./js/x-layui.js" charset="utf-8">
        </script>
        <script>
            layui.use(['form','layer'], function(){
                $ = layui.jquery;
              var form = layui.form()
              ,layer = layui.layer;

              //监听提交
              form.on('submit(add)', function(data){
                alert(JSON.stringify(data.field));
                //发异步，把数据提交给php
                var name=data.field.name;
                var desc=data.field.desc;
                var idAss;
                var lenght=0;
                alert()
                for ( var i in data.field) {
					length++;
				}
                $.ajax({
                	url:"${pageContext.request.contextPath}/insertRole",
                	data:{
                		name:name,
                		desc:desc,
                		idAss:JSON.stringify(data.field)
                	},
                	async:false,
                	type:"post",
                	dataType:"json",
                	success:function(data){
                		if (data == true) {
                			 layer.alert("增加成功", {icon: 6},function () {
                                 // 获得frame索引
                                 var index = parent.layer.getFrameIndex(window.name);
                                 //关闭当前frame
                                 parent.layer.close(index);
                             });
						} else {
							 layer.alert("增加失败", {icon: 6},function () {
                                 // 获得frame索引
                                 var index = parent.layer.getFrameIndex(window.name);
                                 //关闭当前frame
                                 parent.layer.close(index);
                             });					
						}
                	}
                });
            
               
                return false;
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