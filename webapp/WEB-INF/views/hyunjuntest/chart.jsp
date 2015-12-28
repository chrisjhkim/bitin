<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>StuBit : Type-B</title>

<!-- Vendor CSS -->
<link href="/bitin/assets/vendors/bower_components/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet">
<link href="/bitin/assets/vendors/bower_components/animate.css/animate.min.css" rel="stylesheet">
<link href="/bitin/assets/vendors/bower_components/bootstrap-sweetalert/lib/sweet-alert.css" rel="stylesheet">
<link href="/bitin/assets/vendors/bower_components/material-design-iconic-font/dist/css/material-design-iconic-font.min.css" rel="stylesheet">
<link href="/bitin/assets/vendors/bower_components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.min.css" rel="stylesheet">

<!-- CSS -->
<link href="/bitin/assets/css/app.min.1.css" rel="stylesheet">
<link href="/bitin/assets/css/app.min.2.css" rel="stylesheet">

</head>

<body>
<c:import url="/WEB-INF/views/include/navi.jsp"></c:import>

<section id="content">
	<div class="content">
		<div class="card">
			<div class="card-padding card-body">
				<button class="btn btn-warning btn-block" onclick="location.href='/bitin/board/writeform/${list[0].classNo }'"	style="margin-right: 8px; margin-top: 30px; cursor: pointer;">${vo.className } 게시판  글 작성 바로가기</button>
			</div>
			<div class="card-header">
				<h2>Pie Chart</h2>
				<ul class="actions">
					<li class="dropdown action-show">
						<a href="" data-toggle="dropdown"><i class="zmdi zmdi-more-vert"></i></a>
						<div class="dropdown-menu pull-right">
							<p class="p-20">You can put anything here</p>
						</div>
					</li>
				</ul>
			</div>
			<div class="card-body card-padding">
				<div id="pie-chart" class="flot-chart-pie"></div>
				<div class="flc-pie hidden-xs"></div>
			</div>
		</div>
	</div>
</section>
<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

<!-- Javascript Libraries -->
<script	src="/bitin/assets/vendors/bower_components/jquery/dist/jquery.min.js"></script>
<script	src="/bitin/assets/vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<script	src="/bitin/assets/vendors/bower_components/flot/jquery.flot.js"></script>
<script	src="/bitin/assets/vendors/bower_components/flot/jquery.flot.resize.js"></script>
<script	src="/bitin/assets/vendors/bower_components/flot.curvedlines/curvedLines.js"></script>
<script src="/bitin/assets/vendors/sparklines/jquery.sparkline.min.js"></script>
<script	src="/bitin/assets/vendors/bower_components/jquery.easy-pie-chart/dist/jquery.easypiechart.min.js"></script>

<script	src="/bitin/assets/vendors/bower_components/moment/min/moment.min.js"></script>
<script	src="/bitin/assets/vendors/bower_components/fullcalendar/dist/fullcalendar.min.js "></script>
<script	src="/bitin/assets/vendors/bower_components/simpleWeather/jquery.simpleWeather.min.js"></script>
<script	src="/bitin/assets/vendors/bower_components/Waves/dist/waves.min.js"></script>
<script	src="/bitin/assets/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<script	src="/bitin/assets/vendors/bower_components/bootstrap-sweetalert/lib/sweet-alert.min.js"></script>
<script	src="/bitin/assets/vendors/bower_components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>

<script src="/bitin/assets/js/flot-charts/curved-line-chart.js"></script>
<script src="/bitin/assets/js/flot-charts/line-chart.js"></script>
<script src="/bitin/assets/js/charts.js"></script>

<script src="/bitin/assets/js/charts.js"></script>
<script src="/bitin/assets/js/functions.js"></script>
<!-- Javascript Libraries -->

<script	src="/bitin/assets/vendors/bower_components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
<script	src="/bitin/assets/vendors/bower_components/Waves/dist/waves.min.js"></script>
<script	src="/bitin/assets/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<script	src="/bitin/assets/vendors/bower_components/bootstrap-sweetalert/lib/sweet-alert.min.js"></script>
<script src="/bitin/assets/vendors/bootgrid/jquery.bootgrid.updated.js"></script>


<!-- 추가함 (준현)  -->
<script src="/bitin/assets/vendors/bower_components/flot/jquery.flot.pie.js"></script>
<script src="/bitin/assets/vendors/bower_components/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
<script src="/bitin/assets/vendors/bower_components/flot-orderBars/js/jquery.flot.orderBars.js"></script>
<script src="/bitin/assets/vendors/bootgrid/jquery.bootgrid.updated.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	var size = "${data3}"
	console.log(size);	
	
	if(size ==1 ){
		var contentName = "${data2[0]}"
		var selectedCount = "${data[0]}"
		 var pieData = [
		                   {data: selectedCount, color: '#F44336', label: contentName},
      
		               ];
	}
	
	if(size ==2){
		var contentName = "${data2[0]}"
		var selectedCount = "${data[0]}"
		var contentName2 = "${data2[1]}"
		var selectedCount2 = "${data[1]}"
		 var pieData = [
		                   {data: selectedCount, color: '#F44336', label: contentName},
		                   {data: selectedCount2, color: '#03A9F4', label: contentName2},
		               ];
	}
	
	if(size ==3){
		var contentName = "${data2[0]}"
		var selectedCount = "${data[0]}"
		var contentName2 = "${data2[1]}"
		var selectedCount2 = "${data[1]}"
		var contentName3 = "${data2[2]}"
		var selectedCount3 = "${data[2]}"
		 var pieData = [
		                   {data: selectedCount, color: '#F44336', label: contentName},
		                   {data: selectedCount2, color: '#03A9F4', label: contentName2},
		                   {data: selectedCount3, color: '#8BC34A', label: contentName3},
		               ];
	}
	
	if(size ==4){
		var contentName = "${data2[0]}"
		var selectedCount = "${data[0]}"
		var contentName2 = "${data2[1]}"
		var selectedCount2 = "${data[1]}"
		var contentName3 = "${data2[2]}"
		var selectedCount3 = "${data[2]}"
		var contentName4 = "${data2[3]}"
		var selectedCount4 = "${data[3]}"
		 var pieData = [
		                   {data: selectedCount, color: '#F44336', label: contentName},
		                   {data: selectedCount2, color: '#03A9F4', label: contentName2},
		                   {data: selectedCount3, color: '#8BC34A', label: contentName3},
		                   {data: selectedCount4, color: '#FFEB3B', label: contentName4}, 
		               ];
	}

	
	
	if(size ==5){
		var contentName = "${data2[0]}"
		var selectedCount = "${data[0]}"
		var contentName2 = "${data2[1]}"
		var selectedCount2 = "${data[1]}"
		var contentName3 = "${data2[2]}"
		var selectedCount3 = "${data[2]}"
		var contentName4 = "${data2[3]}"
		var selectedCount4 = "${data[3]}"
		var contentName5 = "${data2[4]}"
		var selectedCount5 = "${data[5]}"
		 var pieData = [
		                   {data: selectedCount, color: '#F44336', label: contentName},
		                   {data: selectedCount2, color: '#03A9F4', label: contentName2},
		                   {data: selectedCount3, color: '#8BC34A', label: contentName3},
		                   {data: selectedCount4, color: '#FFEB3B', label: contentName4},
		                   {data: selectedCount5, color: '#009688', label: contentName5},
		                    
		               ];
	}

	
   


    /* Pie Chart */
    
    if($('#pie-chart')[0]){
        $.plot('#pie-chart', pieData, {
            series: {
                pie: {
                    show: true,
                    stroke: { 
                        width: 2,
                    },
                },
            },
            legend: {
                container: '.flc-pie',
                backgroundOpacity: 0.5,
                noColumns: 0,
                backgroundColor: "white",
                lineWidth: 0
            },
            grid: {
                hoverable: true,
                clickable: true
            },
            tooltip: true,
            tooltipOpts: {
                content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
                shifts: {
                    x: 20,
                    y: 0
                },
                defaultTheme: false,
                cssClass: 'flot-tooltip'
            }
            
        });
    }
    
    /* Donut Chart */

    if($('#donut-chart')[0]){
        $.plot('#donut-chart', pieData, {
            series: {
                pie: {
                    innerRadius: 0.5,
                    show: true,
                    stroke: { 
                        width: 2,
                    },
                },
            },
            legend: {
                container: '.flc-donut',
                backgroundOpacity: 0.5,
                noColumns: 0,
                backgroundColor: "white",
                lineWidth: 0
            },
            grid: {
                hoverable: true,
                clickable: true
            },
            tooltip: true,
            tooltipOpts: {
                content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
                shifts: {
                    x: 20,
                    y: 0
                },
                defaultTheme: false,
                cssClass: 'flot-tooltip'
            }
            
        });
    }
});

</script>


</body>

</html>