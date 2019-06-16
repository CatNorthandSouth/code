<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">PE html>
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
        <link rel="stylesheet" href="X-admin/css/x-admin.css" media="all">
        <script src="js/jquery.min.js" charset="utf-8"></script>
    </head>
    <body>
        <div class="x-nav">
            <span class="layui-breadcrumb">
              <a><cite>首页</cite></a>
              <a><cite>轮播管理</cite></a>
              <a><cite>轮播列表</cite></a>
            </span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
        </div>
        <div class="x-body">
            <xblock><button class="layui-btn" onclick="banner_add('添加用户','X-admin/banner-add.jsp','500','300')"><i class="layui-icon">&#xe608;</i>添加</button><span class="x-right" id="lunbo-sum" style="line-height:40px">共有数据：88 条</span></xblock>
            <table class="layui-table">
                <thead>
                    <tr>
                        
                        <th>
                            ID
                        </th>
                        <th>
                            缩略图
                        </th>
                        <th>
                            链接
                        </th>
                       
                        <th>
                            显示状态
                        </th>
                        <th>
                            操作
                        </th>
                    </tr>
                </thead>
                <tbody id="x-img">
                 
                </tbody>
            </table>

            <div id="page"></div>
        </div>
        <script src="X-admin/lib/layui/layui.js" charset="utf-8"></script>
        <script src="X-admin/js/x-layui.js" charset="utf-8"></script>
        <script>
            layui.use(['laydate','element','laypage','layer'], function(){
                $ = layui.jquery;//jquery
              laydate = layui.laydate;//日期插件
              lement = layui.element();//面包导航
              laypage = layui.laypage;//分页
              layer = layui.layer;//弹出层

              //以上模块根据需要引入

                layer.ready(function(){ //为了layer.ext.js加载完毕再执行
                  layer.photos({
                    photos: '#x-img'
                    //,shift: 5 //0-6的选择，指定弹出图片动画类型，默认随机
                  });
                }); 
              
            });

        
             /*添加*/
            function banner_add(title,url,w,h){
                x_admin_show(title,url,w,h);
            }
             /*停用*/
            function banner_stop(obj,id){
                layer.confirm('确认不显示吗？',function(index){
                    //发异步把用户状态进行更改
                    $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="banner_start(this,'+id+')" href="javascript:;" title="显示"><i class="layui-icon">&#xe62f;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="layui-btn layui-btn-disabled layui-btn-mini">不显示</span>');
                    $(obj).remove();
                    //transportId("unshowlunbo",id);
                    $.ajax({
    				url:"${pageContext.request.contextPath}/unshowlunbo",
    				data:{
    					postId:id
    				},
    				dataType:"JSON",
    				type:"post",
    				success:function(data){
    					if (data == true) {
    						layer.msg('不显示!',{icon: 5,time:1000});
						} else {
							layer.msg('不显示失败!',{icon: 5,time:1000});
						}
    				}
    				});
                    
                });
            }

            /*启用*/
            function banner_start(obj,id){
                layer.confirm('确认要显示吗？',function(index){
                    //发异步把用户状态进行更改
                    $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="banner_stop(this,'+id+')" href="javascript:;" title="不显示"><i class="layui-icon">&#xe601;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="layui-btn layui-btn-normal layui-btn-mini">已显示</span>');
                    $(obj).remove();
                    //transportId("showlunbo",id);
                    $.ajax({
        				url:"${pageContext.request.contextPath}/showlunbo",
        				data:{
        					postId:id
        				},
        				dataType:"JSON",
        				type:"post",
        				success:function(data){
        					if (data == true) {
        						layer.msg('已显示!',{icon: 6,time:1000});
    						} else {
    							layer.msg('显示失败!',{icon: 6,time:1000});
    						}
        				}
        				});
                    
                });
            }
            function transportId(URL,postId) {
    			$.ajax({
    				url:"${pageContext.request.contextPath}/"+URL,
    				data:{
    					postId:postId
    				},
    				dataType:"JSON",
    				type:"post",
    				success:function(){
    					
    				}
    			});
    		}  
            // 编辑
            function banner_edit (title,url,id,w,h) {
                x_admin_show(title,url,w,h); 
            }
            /*删除*/
            function banner_del(obj,id){
                layer.confirm('确认要删除吗？',function(index){
                    //发异步删除数据
                  //   transportId("deletelunbo",id);
                      $(obj).parents("tr").remove();
                     $.ajax({
         				url:"${pageContext.request.contextPath}/deletelunbo",
         				data:{
         					postId:id
         				},
         				dataType:"JSON",
         				type:"post",
         				success:function(data){
         					if (data == true) {
         						layer.msg('已删除!',{icon:1,time:1000});
							} else {
								layer.msg('删除失败!',{icon:1,time:1000});
							}
         				}
         			});
                  
                    
                });
            }
            $.ajax({
            	url:"HselectlunboList",
            	dataType:"JSON",
            	type:"post",
            	data:{},
            	success:function(data){
            		var str="";
            		$("#lunbo-sum").text("共有数据："+data.pageCount+"条");
            		for (var i = 0; i < (data.list)[0].length; i++) {
            			str=str+"<tr><td>"+(data.list[0])[i].lunboId;
            			str=str+'</td><td><img  src="'+(data.list[0])[i].lunboPath+'" width="200" alt="">点击图片试试</td><td >';
            			str=str+(data.list[0])[i].lunboPath+' </td><td class="td-status"><span class="layui-btn layui-btn-normal layui-btn-mini">';
            			if ((data.list[0])[i].lunboState == "1") {
            				str=str+'已显示';
						} else {
							str=str+'不显示';
						}
            			str=str+'</span></td><td class="td-manage">';
            			if ((data.list[0])[i].lunboState == "1") {
            				str=str+'<a style="text-decoration:none" onClick="banner_stop(this,'+(data.list[0])[i].lunboId+')" href="javascript:;" title="不显示"><i class="layui-icon">&#xe601;</i></a>';
						} else {
							str=str+'<a style="text-decoration:none" onClick="banner_start(this,'+(data.list[0])[i].lunboId+')" href="javascript:;" title="显示"><i class="layui-icon">&#xe62f;</i></a>';
						}
            			str=str+'<a title="删除" href="javascript:;" onclick="banner_del(this,\''+(data.list[0])[i].lunboId+'\')"  style="text-decoration:none">';
            			str=str+'<i class="layui-icon">&#xe640;</i></a></td></tr>';
					}          
                     $("#x-img").html(str);         
            	}
            })
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