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
        <link rel="stylesheet" href="X-admin/css/x-admin.css" media="all">
        <script src="js/jquery.min.js" charset="utf-8"></script>
    </head>
    <body>
        <div class="x-nav">
            <span class="layui-breadcrumb">
              <a><cite>首页</cite></a>
              <a><cite>会员管理</cite></a>
              <a><cite>管理员列表</cite></a>
            </span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
        </div>
        <div class="x-body">
        	<input type="hidden" id="hiddenvalue" value="${flag }">
<!--             <form class="layui-form x-center" action="" style="width:80%">
                <div class="layui-form-pane" style="margin-top: 15px;">
                  <div class="layui-form-item">
                    <label class="layui-form-label">日期范围</label>
                    <div class="layui-input-inline">
                      <input class="layui-input" placeholder="开始日" id="LAY_demorange_s">
                    </div>
                    <div class="layui-input-inline">
                      <input class="layui-input" placeholder="截止日" id="LAY_demorange_e">
                    </div>
                    <div class="layui-input-inline">
                      <input type="text" name="username" id="post-postname"  placeholder="请输入登录名" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-input-inline" style="width:80px">
                        <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                        <input class="layui-btn" id="post-search-btn" type="button"  lay-submit="" lay-filter="sreach" value="search">
                    </div>
                  </div>
                </div> 
            </form> -->
            <xblock><button id="admin-delAll" class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon">&#xe640;</i>批量删除</button><button class="layui-btn" id="admin-addUser" onclick="admin_add('添加用户','X-admin/role-add.jsp','900','500')"><i class="layui-icon">&#xe608;</i>添加</button><span class="x-right" id="adminrole-sum" style="line-height:40px">共有数据：88 条</span></xblock>
            <table class="layui-table">
                <thead id="post-thead-list">
                    <tr>
                        <th>
                            <input type="checkbox" name="" value="">
                        </th>
                        <th>
                            ID
                        </th>
                        <th>
                            登录名
                        </th>
                        <th>
                            手机
                        </th>
                        <th>
                            邮箱
                        </th>
                        <th>
                            角色
                        </th>
                        <th>
                            加入时间
                        </th>
                        <th>
                            状态
                        </th>
                        <th>
                            操作
                        </th>
                    </tr>
                </thead>
                <tbody id="post-tbody-list">
                    <tr>
                        <td>
                            <input type="checkbox" value="1" name="">
                        </td>
                        <td>
                            1
                        </td>
                        <td>
                            admin
                        </td>
                        <td >
                            18925139194
                        </td>
                        <td >
                            113664000@qq.com
                        </td>
                        <td >
                            超级管理员
                        </td>
                        <td>
                            2017-01-01 11:11:42
                        </td>
                        <td class="td-status">
                            <span class="layui-btn layui-btn-normal layui-btn-mini">
                                已启用
                            </span>
                        </td>
                        <td class="td-manage" >
                            <a style="text-decoration:none" onclick="admin_stop(this,'10001')" href="javascript:;" title="停用">
                                <i class="layui-icon">&#xe601;</i>
                            </a>
                            <a title="编辑" href="javascript:;" onclick="admin_edit('编辑','admin-edit.jsp','4','','510')"
                            class="ml-5" style="text-decoration:none">
                                <i class="layui-icon">&#xe642;</i></a>
                            <a title="删除" href="javascript:;" onclick="admin_del(this,'1')" 
                            style="text-decoration:none">
                                <i class="layui-icon">&#xe640;</i>
                            </a>
                        </td>
                    </tr>
                </tbody>
            </table>

            <div id="page"></div>
        </div>
        <script src="X-admin/lib/layui/layui.js" charset="utf-8"></script>
        <script src="X-admin/js/x-layui.js" charset="utf-8"></script>
        <script>
        	var biaozhi=0;
        	var dataList;
        	 var checkboxlist=[];
        	function init1(UU,postId) {
            layui.use(['laydate','element','laypage','layer','form'], function(){
                $ = layui.jquery;//jquery
              laydate = layui.laydate;//日期插件
              lement = layui.element();//面包导航
              laypage = layui.laypage;//分页
              layer = layui.layer;//弹出层
              var form = layui.form();
           
              InitPage(UU);
              //以上模块根据需要引入
    			  function InitPage(url) {
    				 // alert(url);
    	              $.ajax({
    	                	url:"${pageContext.request.contextPath}/"+url,
    	                	dataType:"JSON",
    	                	data:{
    	                		postId:postId
    	                	},
    	                	type:"post",
    	                	success:function(data){
    	                		dataList=data;
    	                		
    	                      laypage({
    	                          cont: 'page'
    	                          ,pages: dataList.pageNumber
    	                          ,first: 1
    	                          ,last: dataList.pageNumber
    	                          ,prev: '<em><</em>'
    	                          ,next: '<em>></em>'
    	                        }); 
    	                	}
    	                });				
    			}

            
             $("#post-thead-list").on("click","input[type='checkbox']",function(){
            	 //alert($(this).prop("checked"));
            	 var child=$(this).parents('table').find('tbody input[type="checkbox"]');
            	// checkboxlist.length=child.length;
            	 
            	 if ($(this).prop("checked") == true) {
            		 console.log("1");
            		 for(k in child){
            			 console.log(k);
            			 if (child[k].value != null && child[k].value != "on") {
            				 if (checkboxlist.indexOf(child[k].value) == -1) {
            					 checkboxlist.push(child[k].value);
							}
            				 
						} 
            			
            		 }
            		 $(this).parents('table').find('tbody input[type="checkbox"]').prop("checked",true);
            		 checkboxlist.splice(0,checkboxlist.length - child.length);
				} else {
					console.log("2  "+child.length);
					checkboxlist.splice(0,checkboxlist.length);
					$(this).parents('table').find('tbody input[type="checkbox"]').prop("checked",false);
				}
           		console.log(JSON.stringify(checkboxlist));
             	 form.render('checkbox');
             });
             $("#post-tbody-list").on("click","input[type='checkbox']",function(){
            	 //alert($(this).prop("checked"));
            	 var t=checkboxlist.indexOf($(this).val());
            	 if ($(this).prop("checked") == true) {
            		 console.log("1");
            		 $(this).prop("checked",true);
            		 if (checkboxlist.indexOf($(this).val()) == -1) {
            			 checkboxlist.push($(this).val());
					}
				} else {
					console.log("2");
					$(this).prop("checked",false);
					$(this).parents('table').find('thead input[type="checkbox"]').prop("checked",false);
					checkboxlist.splice(t,1);
				}
            	 console.log(JSON.stringify(checkboxlist));
             	 form.render('checkbox');
             });            
              var start = {
                min: '2010-06-16 23:59:59'
                ,max: '2099-06-16 23:59:59'
                ,istoday: false
                ,choose: function(datas){
                  end.min = datas; //开始日选好后，重置结束日的最小日期
                  end.start = datas //将结束日的初始值设定为开始日
                }
              };
              
              var end = {
                min: laydate.now()
                ,max: '2099-06-16 23:59:59'
                ,istoday: false
                ,choose: function(datas){
                  start.max = datas; //结束日选好后，重置开始日的最大日期
                }
              };
              
              document.getElementById('LAY_demorange_s').onclick = function(){
                start.elem = this;
                laydate(start);
              }
              document.getElementById('LAY_demorange_e').onclick = function(){
                end.elem = this
                laydate(end);
              }
              
            });
        	}
            //批量删除提交
             function delAll() {
            	  if (checkboxlist.length == 0) {
               	   layer.msg('请选择您要删除的信息', {icon: 1});
   				} else {
   				 layer.confirm('确认要删除吗？',function(index){
   	                    //捉到所有被选中的，发异步进行删除
   	                    $.ajax({
   	                    	url:"${pageContext.request.contextPath}/HdeleteadminRoleList",
   	                    	dataType:"JSON",
   	                    	type:"post",
   	                    	data:{
   	                    		postId:JSON.stringify(checkboxlist)
   	                    	},
   	                    	success:function(data){
   	                    		if (data == true) {
   	                    		  layer.msg('删除成功', {icon: 1});
								} else {
									  layer.msg('删除失败', {icon: 1});
								}
   	                    	}
   	                    });
   	                  
   	                });
   				}
             }
             /*添加*/
            function admin_add(title,url,w,h){
                x_admin_show(title,url,w,h);
            }
             
            $(document).ready(function () {
            	init1("selectAdminRoleList","0");
        		//alert("1");
        		initList(1);
            	if ($("#hiddenvalue").val() == "true") {
              		
				} else {
					$(".td-manage").find("a").attr("onclick","warnFunction()");
					$("#admin-delAll").attr("onclick","warnFunction()");
					$("#admin-addUser").attr("onclick","warnFunction()"); 
				}
			});
			function warnFunction() {
				 layer.msg('暂无此权限,请您联系管理员', {icon: 4});
			}
             /*停用*/
            function admin_stop(obj,id){
                layer.confirm('确认要停用吗？',function(index){
                    //发异步把用户状态进行更改
                    $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="admin_start(this,'+id+')" href="javascript:;" title="启用"><i class="layui-icon">&#xe62f;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="layui-btn layui-btn-disabled layui-btn-mini">已停用</span>');
                    $(obj).remove();
                    transportId("Hadminend",id);
                    layer.msg('已停用!',{icon: 5,time:1000});
                });
            }

            /*启用*/
            function admin_start(obj,id){
                layer.confirm('确认要启用吗？',function(index){
                    //发异步把用户状态进行更改
                    $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="admin_stop(this,'+id+')" href="javascript:;" title="停用"><i class="layui-icon">&#xe601;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="layui-btn layui-btn-normal layui-btn-mini">已启用</span>');
                    $(obj).remove();
                    transportId("Hadminstart",id);
                    layer.msg('已启用!',{icon: 6,time:1000});
                });
            }
            //编辑
            function admin_edit (title,url,id,w,h) {
                x_admin_show(title,url,w,h); 
            }
            /*删除*/
            function admin_del(obj,id){
                layer.confirm('确认要删除吗？',function(index){
                    //发异步删除数据
                    $(obj).parents("tr").remove();
                    //transportId('Hdeleteadminrole',id);
        			$.ajax({
        				url:"${pageContext.request.contextPath}/Hdeleteadminrole",
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
        	function transZT(data) {
				if (data == 1) {
					return "已启用";
				} else {
					return "已停用";
				}
			}            
        	function initList(sum) {
        		 $.ajax({
     	        	url:"${pageContext.request.contextPath}/selectAdminRoleList",
     	        	dataType:"JSON",
     	        	data:{},
     	        	type:"post",
     	        	success:function(data){
     	        		console.log(data);
     	        		pagecount=(sum-1)*data.pageSize;
     	        		pagecount1=pagecount+data.pageSize;
     	        		if (pagecount1 > data.pageCount) {
     	        			pagecount1=data.pageCount;
     					}
     	        		var ttsum=pagecount+1;
     	        		var str='';
     	        		var str1='';
     	        		$("#adminrole-sum").text("共有数据："+data.pageCount+" 条");
     	        		str1=str1+'<tr><th><input type="checkbox" lay-filter="checkbox_v1" name="'+pagecount1+'" ></th><th>ID</th><th> 角色名</th><th>拥有权限规则</th><th>描述</th><th>操作</th></tr> ';
     	        		for (var i = pagecount; i < pagecount1; i++) {
     	        			str=str+'<tr><td><input type="checkbox" value="'+((data.list))[i].roleId+'" name="">';
     	        			str=str+'</td><td>'+((data.list))[i].roleId+'</td><td>';
     	        			str=str+'<u style="cursor:pointer" onclick="member_show(\'张三\',\'member-show.jsp\',\'10001\',\'360\',\'400\')">';
     	        			str=str+((data.list))[i].roleName+'</u></td><td >';  
     	        			str=str+((data.list))[i].roleGuize+'</td><td >';
     	        			str=str+((data.list))[i].roleDescript+'</td>';
     	        			
     	        			str=str+'<td class="td-manage">'; 
     	                	if ($("#hiddenvalue").val() != "true") {
     	    					$(".td-manage").find("a").attr("onclick","warnFunction()");
         	        		  
         	        			str=str+'<a title="删除" href="javascript:;" onclick="warnFunction()" ';
         	        			str=str+'style="text-decoration:none"><i class="layui-icon">&#xe640;</i></a>';         		
     	    				} else {
         	        		 
    
         	        			str=str+'<a title="删除" href="javascript:;" onclick="admin_del(this,\''+((data.list))[i].roleId+'\')" ';
         	        			str=str+'style="text-decoration:none"><i class="layui-icon">&#xe640;</i></a>';
     	    				}

     	        			str=str+'</td></tr>';        
             						
     					}  
     	        		$("#post-thead-list").html(str1);
     	        		$("#post-tbody-list").html(str);
     	        	}
     	        });	
        	}
    		var strtt;
    		$("#post-search-btn").click(function () {
    			biaozhi=1;
    			var s1=$("#LAY_demorange_s").val();
    			var s2=$("#LAY_demorange_e").val();
    			var s3=$("#post-postname").val();
    			if ((s1 != '' && s2 != '') || s3 != '' ) {
    				var str;
    					if (s1 != '' && s2 != '' && s3 != '') {
    						str=s1+"and"+s2+"and"+s3;
						} else if(s1 != '' && s2 != ''){
							str=s1+"and"+s2;
						}else{
							str=s3+"and";
						}
    				//alert(str);
    				strtt=str;
    				//transportId("HfindPost",str);	
    				findlistpost(1,str) 
    			}
    		});            
                        
            $("#page").on("click","",function(){
            	var data=$(".layui-laypage-em").next().html();
            	if (biaozhi == 0) {
            		initList(data);
				} else {
					findlistpost(data,strtt);
				}
            	
            });
    		function findlistpost(sum,str) {
    			//InitPage("HfindPost");
    						
    		} 
    		
           
  
     
 			
 
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