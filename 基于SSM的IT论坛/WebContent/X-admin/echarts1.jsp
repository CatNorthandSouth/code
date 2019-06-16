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
            <blockquote class="layui-elem-quote">
                特别声明：本图只显示登陆人数
            </blockquote>
            <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
            <div id="main" style="width: 100%;height:400px;"></div>
            <blockquote class="layui-elem-quote">
                注意：本案例的Echarts图表库由cdn引入，需要在线才能正常使用，如想离想，请至Echarts官网下载。
            </blockquote>
        </div>
        <script src="//cdn.bootcss.com/echarts/3.3.2/echarts.min.js" charset="utf-8"></script>
        <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
		var datasum=[];
		var datatime=[];
        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '折线图堆叠'
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                /* data:['邮件营销','联盟广告','视频广告','直接访问','搜索引擎'] */
                data:['访问次数']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: datatime/* ['周一','周二','周三','周四','周五','周六','周日'] */
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    name:'访问次数',
                    type:'line',
                    stack: '总量',
                    data: datasum/* [120, 132, 101, 134, 90, 230, 210] */
                }
      /*           {
                    name:'联盟广告',
                    type:'line',
                    stack: '总量',
                    data:[220, 182, 191, 234, 290, 330, 310]
                },
                {
                    name:'视频广告',
                    type:'line',
                    stack: '总量',
                    data:[150, 232, 201, 154, 190, 330, 410]
                },
                {
                    name:'直接访问',
                    type:'line',
                    stack: '总量',
                    data:[320, 332, 301, 334, 390, 330, 320]
                },
                {
                    name:'搜索引擎',
                    type:'line',
                    stack: '总量',
                    data:[820, 932, 901, 934, 1290, 1330, 1320]
                } */
            ]
        };
        
		$(document).ready(function () {
		//	alert("1");
			 $.ajax({
		        	url:"${pageContext.request.contextPath}/selectBsLine",
		        	data:{},
		        	type:"post",
		        	dataType:"JSON",
		        	success:function(data){
		        		for (var i = 0; i < data[0].length; i++) {
		        			if ((data[0][i]) == null) {
								
							} else {
								datatime.push((data[0][i]));
								datasum.push((data[1][i]));
							}
						
						}
		        		myChart.setOption(option);
		        	}
		        });
		});
       

        // 使用刚指定的配置项和数据显示图表。
        
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