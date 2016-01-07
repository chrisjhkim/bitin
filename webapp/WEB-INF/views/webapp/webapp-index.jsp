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
						
						<div class="lv-body">
							<div class="lv-item">
								<div class="lv-title m-b-5">반도체 공학!</div>
								<div class="progress">
									<div class="progress-bar" role="progressbar" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100" style="width: 95%">
										<span class="sr-only">95% Complete (success)</span>
									</div>
								</div>
							</div>
							<div class="lv-item">
								<div class="lv-title m-b-5">전기 회로</div>
								<div class="progress">
									<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
										<span class="sr-only">80% Complete (success)</span>
									</div>
								</div>
							</div>
							<div class="lv-item">
								<div class="lv-title m-b-5">일반 화학</div>
								<div class="progress">
									<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
										<span class="sr-only">20% Complete</span>
									</div>
								</div>
							</div>
							<div class="lv-item">
								<div class="lv-title m-b-5">화 학 1</div>
								<div class="progress">
									<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
										<span class="sr-only">60% Complete (warning)</span>
									</div>
								</div>
							</div>
							<div class="lv-item">
								<div class="lv-title m-b-5">화 학 2</div>
								<div class="progress">
									<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
										<span class="sr-only">80% Complete (danger)</span>
									</div>
								</div>
							</div>
						</div>
						
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
	var authUser = "${authUser.userName}";
</script>

<script src="/bitin/assets/vendors/bower_components/jquery/dist/jquery.min.js"></script>
<script src="/bitin/assets/vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

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



</body>
</html>