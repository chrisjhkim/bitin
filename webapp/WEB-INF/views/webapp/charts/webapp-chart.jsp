
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


<!-- FOR CHART  -->
<!-- <link href="/bitin/assets/other-boot/application.css" rel="stylesheet"> -->
<link href="/bitin/assets/my-boot/my-application.css" rel="stylesheet">
<link rel="shortcut icon" href="/bitin/assets/other-boot/favicon.png">



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
<c:import url="/WEB-INF/views/webapp/include/webapp-navi.jsp"></c:import>

<section id="content">
	<div class="content">
		<br>
		<div class="card-body card-padding">
			<div class="card-body card-padding">
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="margin-top: 16px;">

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="/bitin/assets/webapp-media/carousel/c1.png" alt="">
							<div class="carousel-caption">텍스트1 : 이 텍스트는 핸드폰 크롬에서 보이지 않음. + 이 그림은 웹앱 통해서 들어간것인 만큼 앱다운로드 안해놔도 되지 않을까요</div>
						</div>
						<div class="item">
							<img src="/bitin/assets/webapp-media/carousel/c2.png" alt="">
						</div>
						<div class="item">
							<img src="/bitin/assets/webapp-media/carousel/c3.png" alt="">
						</div>
					</div>


					<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev"> 
						<span class="zmdi zmdi-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
						<span class="zmdi zmdi-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
					
				</div>
				
				<div class="card">
					<div class="listview">
						<div class="lv-header">Attendance Chart</div>
<!-- --------------------------------------------------------------->
		                <section class="widget large">
		                    <header>
		                        <h4><i class="fa fa-home"></i> Top sources</h4>
		                    </header>
		                    <div class="body">
		                        <div id="sources-chart-pie" class="chart pie-chart">
		                            <svg></svg>
		                        </div>
		                    </div>
		                    <footer id="data-chart-footer" class="pie-chart-footer">
		                    </footer>
		                </section>
														
						
						
						
						
<!-- --------------------------------------------------------------->
						<div class="card go-social">
							<div class="card-header">
								<h2>
									Social with us <small>StuBit 페이지 바로가기</small>
								</h2>
							</div>
							<div class="card-body clearfix">
								<a class="col-xs-4" href=""> <img src="/bitin/assets/img/social/facebook-128.png" class="img-responsive" alt=""></a>
								<a class="col-xs-4" href=""> <img src="/bitin/assets/img/social/twitter-128.png" class="img-responsive" alt=""></a> 
								<a class="col-xs-4" href=""> <img src="/bitin/assets/img/social/googleplus-128.png" class="img-responsive" alt=""></a>
								<a class="col-xs-4" href=""> <img src="/bitin/assets/img/social/linkedin-128.png" class="img-responsive" alt=""></a>
								<a class="col-xs-4" href=""> <img src="/bitin/assets/img/social/youtube-128.png" class="img-responsive" alt=""></a>
								<a class="col-xs-4" href=""> <img src="/bitin/assets/img/social/blogger-128.png" class="img-responsive" alt=""></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

<!-- Javascript Libraries -->
<script>
	var authUser = "${fakeAuthUser.userName}";
</script>




<script src="/bitin/assets/vendors/bower_components/jquery/dist/jquery.min.js"></script>

<!-- FOR CHART 2 -->
<script src="/bitin/assets/other-boot/jquery.pjax.js"></script>


<script src="/bitin/assets/vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- FOR CHART 3 -->
<script src="/bitin/assets/other-boot/widgster.js"></script>
<script src="/bitin/assets/other-boot/underscore.js"></script>

<!-- FOR CHART 4 -->
<script src="/bitin/assets/other-boot/app.js"></script>
<script src="/bitin/assets/other-boot/settings.js"></script>


<script src="/bitin/assets/vendors/bower_components/flot/jquery.flot.js"></script>
<script src="/bitin/assets/vendors/bower_components/flot/jquery.flot.resize.js"></script>
<script src="/bitin/assets/vendors/bower_components/flot.curvedlines/curvedLines.js"></script>
<script src="/bitin/assets/vendors/sparklines/jquery.sparkline.min.js"></script>
<script src="/bitin/assets/vendors/bower_components/jquery.easy-pie-chart/dist/jquery.easypiechart.min.js"></script>

<script src="/bitin/assets/vendors/bower_components/moment/min/moment.min.js"></script>
<script src="/bitin/assets/vendors/bower_components/fullcalendar/dist/fullcalendar.min.js "></script>
<script src="/bitin/assets/vendors/bower_components/simpleWeather/jquery.simpleWeather.min.js"></script>
<script src="/bitin/assets/vendors/bower_components/Waves/dist/waves.min.js"></script>
<script src="/bitin/assets/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<script src="/bitin/assets/vendors/bower_components/bootstrap-sweetalert/lib/sweet-alert.min.js"></script>
<script src="/bitin/assets/vendors/bower_components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>

<script src="/bitin/assets/js/flot-charts/curved-line-chart.js"></script>
<script src="/bitin/assets/js/flot-charts/line-chart.js"></script>
<script src="/bitin/assets/js/charts.js"></script>

<script src="/bitin/assets/js/charts.js"></script>
<script src="/bitin/assets/js/functions.js"></script>
<script src="/bitin/assets/js/demo.js"></script>

 <!-- FOR CHART -->
<script src="/bitin/assets/other-boot/d3.v2.min.js"></script>
<script src="/bitin/assets/other-boot/nv.d3.custom.js"></script>
 <!-- FOR CHART -->
<script src="/bitin/assets/other-boot/scatter.js"></script>
<script src="/bitin/assets/other-boot/axis.js"></script>
<script src="/bitin/assets/other-boot/legend.js"></script>
<script src="/bitin/assets/other-boot/stackedArea.js"></script>
<script src="/bitin/assets/other-boot/stackedAreaChart.js"></script>

<!-- FOR CHART NOT SURE -->
<script src="/bitin/assets/other-boot/line.js"></script>
<script src="/bitin/assets/other-boot/pie.js"></script>
<script src="/bitin/assets/other-boot/pieChartTotal.js"></script>
<script src="/bitin/assets/other-boot/stream_layers.js"></script>
<script src="/bitin/assets/other-boot/lineChart.js"></script>
<script src="/bitin/assets/other-boot/multiBar.js"></script>
<script src="/bitin/assets/other-boot/multiBarChart.js"></script>

<!-- page application js -->
<script src="/bitin/assets/other-boot/stat-charts.js"></script>


</body>
</html>