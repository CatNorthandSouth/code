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
        <div class="x-nav">
            <span class="layui-breadcrumb">
              <a><cite>首页</cite></a>
              <a><cite>会员管理</cite></a>
              <a><cite>问题/资讯列表</cite></a>
            </span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
        </div>
        <div class="x-body">
            <form class="layui-form x-center" action="" style="width:800px">
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
                      <input type="text" name="username" id="post-postname" placeholder="标题" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-input-inline" style="width:80px">
                        <input type="button" class="layui-btn" id="post-search-btn"  lay-submit="" lay-filter="sreach" value="search"></input>
                    </div>
                  </div>
                </div> 
            </form>
            <xblock><button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon">&#xe640;</i>批量删除</button><button class="layui-btn" onclick="question_add('添加问题','gonggao-add.jsp','600','500')"><i class="layui-icon">&#xe608;</i>添加</button><span class="x-right" style="line-height:40px">共有数据：88 条</span></xblock>
            <table class="layui-table">
                <thead id="post-thead-list">

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
                            <u style="cursor:pointer" onclick="question_show()">
                                问题标题
                            </u>
                        </td>
                        <td >
                            新闻子类1
                        </td>
                        <td >
                            xuebingsi
                        </td>
                        <td >
                            2017-01-01 11:11:42
                        </td>
                        <td >
                            34
                        </td>
                        <td class="td-manage">
                            <a title="编辑" href="javascript:;" onclick="question_edit('编辑','gonggao-edit.jsp','4','','510')"
                            class="ml-5" style="text-decoration:none">
                                <i class="layui-icon">&#xe642;</i>
                            </a>
                            <a title="删除" href="javascript:;" onclick="question_del(this,'1')" 
                            style="text-decoration:none">
                                <i class="layui-icon">&#xe640;</i>
                            </a>
                        </td>
                    </tr>
                </tbody>
            </table>

            <div id="page"></div>
        </div>
        <script src="./lib/layui/layui.js" charset="utf-8"></script>
        <script src="./js/x-layui.js" charset="utf-8"></script>
        <script>
        	var dataList;
        	$(document).ready(function () {
        		init1("HselectGongGaoList","0");
        		//alert("1");
        		initList(1);
			});
        	function init1(UU,postId) {
                layui.use(['laydate','element','laypage','layer'], function(){
                    $ = layui.jquery;//jquery
                  laydate = layui.laydate;//日期插件
                  lement = layui.element();//面包导航
                  laypage = layui.laypage;//分页
                  layer = layui.layer;//弹出层
               ///   layform = layui.form;//表单,'form'
                  InitPage(UU);
           /*        form.on('checkbox(checkbox_v1)',function(data){
                	  var a=data.elem.checked;
                	  if (a == true) {
						$(".checktt").prop("checked",true);
						form.render("checkbox");
					} else {
						$(".checktt").prop("checked",false);
						form.render("checkbox");
					}
                  }); */
                  
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
                  //以上模块根据需要引入

                
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
            
    		function findlistpost(sum,str) {
    			//InitPage("HfindGongGao");
    			init1("HfindGongGao",str);
    	   	       $.ajax({
       	        	url:"${pageContext.request.contextPath}/HfindGongGao",
       	        	dataType:"JSON",
       	        	data:{
       	        		postId:str
       	        	},
       	        	type:"post",
       	        	success:function(data){
       	        		console.log(data);
       	        		pagecount=(sum-1)*data.pageSize;
       	        		pagecount1=pagecount+data.pageSize;
       	        		if (pagecount1 > data.pageCount) {
       	        			pagecount1=data.pageCount;
    						}
       	        		var str='';
       	        		var str1='';
       	        		str1=str1+'<tr><th><input type="checkbox" lay-filter="checkbox_v1" name="" value="'+pagecount+1+'"></th> <th>ID</th><th> 标题</th><th>分类</th><th>来源</th><th>更新时间</th><th>浏览次数</th><th>操作</th></tr>';
       	        		for (var i = pagecount; i < pagecount1; i++) {
       						str=str+'<tr><td><input type="checkbox" lay-filter="checkbox1"  value="'+((data.list)[0])[i].postId+'" name=""></td><td>'+
       						((data.list)[0])[i].postId+'</td><td><u style="cursor:pointer" onclick="question_show()"><a target="_blank" href="${pageContext.request.contextPath}/togoPostDetails?id='+((data.list)[0])[i].postId+'">'+
    						((data.list)[0])[i].postTitle+'</a></u></td><td >'+
       						'公告'+'</td><td >'+
       						((data.list)[0])[i].postAdmin+'</td><td >'+
       						timestampToTime(((data.list)[0])[i].postUpdateTime)+'</td><td >'+
       						((data.list)[0])[i].postReward+'</td><td class="td-manage">'
       						+'<a title="编辑" href="javascript:;" onclick="question_edit(\'编辑\',\'gonggao-edit.jsp\',\'4\',\'\',\'510\')" class="ml-5" style="text-decoration:none">'
       						+' <i class="layui-icon">&#xe642;</i>'
       						+'</a><a title="删除" href="javascript:;" onclick="question_del(this,'+((data.list)[0])[i].postId+')" style="text-decoration:none"> '
       						+'<i class="layui-icon">&#xe640;</i></a></td></tr>';
       											
       					}  
       	        		$("#post-thead-list").html(str1);
       	        		$("#post-tbody-list").html(str);
       	        	}
       	        });				
    		}            
            
    		var biaozhi=0;
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
    				alert(str);
    				strtt=str;
    				//transportId("HfindGongGao",str);	
    				findlistpost(1,str) 
    			}
    		});            
            
            
            var strlist=Array();
            //批量删除提交
             function delAll () {
               if (strlist.length == 0) {
            	   layer.msg('请选择您要删除的信息', {icon: 1});
			} else {
				 layer.confirm('确认要删除吗？',function(index){
	                    //捉到所有被选中的，发异步进行删除
	                    $.ajax({
	                    	url:"${pageContext.request.contextPath}/HdeleteGongGaoList",
	                    	dataType:"JSON",
	                    	type:"post",
	                    	data:{
	                    		postId:JSON.stringify(strlist)
	                    	},
	                    	success:function(data){
	                    		
	                    	}
	                    });
	                    layer.msg('删除成功', {icon: 1});
	                });
			}
             }

             function question_show (argument) {
                layer.msg('${pageContext.request.contextPath}/togoPostDetails?id=',{icon:1,time:1000});
             }
             /*添加*/
            function question_add(title,url,w,h){
                x_admin_show(title,url,w,h);
            }
            //编辑 
           function question_edit (title,url,id,w,h) {
                x_admin_show(title,url,w,h); 
            }

            /*删除*/
            function question_del(obj,id){
                layer.confirm('确认要删除吗？',function(index){
                    //发异步删除数据
                    $(obj).parents("tr").remove();
                    transportId("HdeleteGongGao",id);
                    layer.msg('已删除!',{icon:1,time:1000});
                });
            }
            var st='-1';
			$("#post-thead-list").on("click","input",function(){
				var t=$(this).val() - 0 ;
				
				if (st == $(this).val()) {
			
	        		for (var i = t; i < t + 7; i++) {
	        			if (strlist.indexOf(i) != -1){
	        				strlist.splice(strlist.indexOf(i),1);
	        			}	
					}	
	        		$("#post-tbody-list").find("input").prop("checked",false);
	        		st='-1';
	        		
				} else {
					st=$(this).val();				
	        		for (var i = t; i < t + 7; i++) {
	        			if (strlist.indexOf(i) == -1){
	        				strlist.push(i);	
	        				//alert(strlist.indexOf($(this).val()-0)+"  "+JSON.stringify(strlist));
	        			}
					}
	        		$("#post-tbody-list").find("input").attr("checked","checked");
				}
				
				console.log(strlist);
        	});       
			
        	$("#post-tbody-list").on("click","input",function(){
        		
        		if (strlist.indexOf($(this).val()) != -1) {       			
        			strlist.splice(strlist.indexOf($(this).val()-0),1);
				} else {
					strlist.push($(this).val()-0);
				
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
            </script>
            <script>
        var _hmt = _hmt || [];
        (function() {
          var hm = document.createElement("script");
          hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
          var s = document.getElementsByTagName("script")[0]; 
          s.parentNode.insertBefore(hm, s);
        })();//post-tbody-list
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
    	function initList(sum) {
    		
    	       $.ajax({
    	        	url:"${pageContext.request.contextPath}/HselectGongGaoList",
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
    	        		var str='';
    	        		var str1='';
    	        		str1=str1+'<tr><th><input type="checkbox" lay-filter="checkbox_v1" name="" value="'+pagecount+1+'"></th> <th>ID</th><th> 标题</th><th>分类</th><th>来源</th><th>更新时间</th><th>浏览次数</th><th>操作</th></tr>';
    	        		for (var i = pagecount; i < pagecount1; i++) {
    						str=str+'<tr><td><input type="checkbox" lay-filter="checkbox1" class="checktt"  value="'+((data.list)[0])[i].postId+'" name=""></td><td>'+
    						((data.list)[0])[i].postId+'</td><td><u style="cursor:pointer" onclick="question_show()"><a target="_blank" href="${pageContext.request.contextPath}/togoPostDetails?id='+((data.list)[0])[i].postId+'">'+
    						((data.list)[0])[i].postTitle+'</a></u></td><td >公告</td><td >'+
    						((data.list)[0])[i].postAdmin+'</td><td >'+
    						timestampToTime(((data.list)[0])[i].postUpdateTime)+'</td><td >'+
    						((data.list)[0])[i].postReward+'</td><td class="td-manage">'
    						+'<a title="编辑" href="javascript:;" onclick="question_edit(\'编辑\',\'gonggao-edit.jsp?id='+((data.list)[0])[i].postId+'\',\'4\',\'\',\'510\')" class="ml-5" style="text-decoration:none">'
    						+' <i class="layui-icon">&#xe642;</i>'
    						+'</a><a title="删除" href="javascript:;" onclick="question_del(this,'+((data.list)[0])[i].postId+')" style="text-decoration:none"> '
    						+'<i class="layui-icon">&#xe640;</i></a></td></tr>';
    											
    					}  
    	        		$("#post-thead-list").html(str1);
    	        		$("#post-tbody-list").html(str);
    	        	}
    	        });			
		}

        </script>
    </body>
</html>