<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>StuBit : Type-B</title>

<!-- Vendor CSS -->
<link
	href="/bitin/assets/vendors/bower_components/fullcalendar/dist/fullcalendar.min.css"
	rel="stylesheet">
<link
	href="/bitin/assets/vendors/bower_components/animate.css/animate.min.css"
	rel="stylesheet">
<link
	href="/bitin/assets/vendors/bower_components/bootstrap-sweetalert/lib/sweet-alert.css"
	rel="stylesheet">
<link
	href="/bitin/assets/vendors/bower_components/material-design-iconic-font/dist/css/material-design-iconic-font.min.css"
	rel="stylesheet">
<link
	href="/bitin/assets/vendors/bower_components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.min.css"
	rel="stylesheet">

<!-- CSS -->
<link href="/bitin/assets/css/app.min.1.css" rel="stylesheet">
<link href="/bitin/assets/css/app.min.2.css" rel="stylesheet">

</head>
<body>
	<c:import url="/WEB-INF/views/include/navi.jsp"></c:import>

	<section id="main">
		<div class="container">
			<br>

			<div class="card-body card-padding">
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel">


					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="/bitin/assets/media/carousel/c-4.jpg" alt="">
							<div class="carousel-caption">
								<h3>StuBit Application for Android</h3>
								<p>안드로이드 어플을 다운받아주세요</p>
								<p>주요 기능을 읽어보세요</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
		<br>

		<div class="container c-alt">
			<div class="clearfix"></div>
			<div class="row m-t-25">
				<div class="col-sm-4">
					<div class="card">
						<div class="card-header bgm-orange m-b-20">
							<h2>
								게시판  <small>게시판 생성 및 사용</small>
							</h2>
							<ul class="actions actions-alt">
								<li class="dropdown"><a href="" data-toggle="dropdown">
								</a></li>
							</ul>

							<button class="btn bgm-amber btn-float waves-effect">
								<a href="/bitin/board/list"><i class="zmdi zmdi-mail-send"></i></a>
							</button>
						</div>
						<div class="card-body card-padding"></div>
					</div>
				</div>

				<div class="col-sm-4">
					<div class="card">
						<div class="card-header bgm-brown m-b-20">
							<h2>
								SNS <small> 친구 등록 및 친구 추천 </small>
							</h2>
							<ul class="actions actions-alt">
								<li class="dropdown"><a href="" data-toggle="dropdown">
								</a></li>
							</ul>

							<button class="btn bgm-gray btn-float waves-effect">
								<i class="zmdi zmdi-mail-send"></i>
							</button>
						</div>

						<div class="card-body card-padding"></div>
					</div>
				</div>

				<div class="col-sm-4">
					<div class="card">
						<div class="card-header bgm-green m-b-20">
							<h2>
								위치기반 출석 시스템<small>어플리케이션으로 출석</small>
							</h2>
							<ul class="actions actions-alt">
								<li class="dropdown"><a href="" data-toggle="dropdown">
								</a></li>
							</ul>

							<button class="btn bgm-lightgreen btn-float waves-effect">
								<i class="zmdi zmdi-mail-send"></i>
							</button>
						</div>

						<div class="card-body card-padding"></div>
					</div>
				</div>


			</div>
		</div>

		<div class="container c-alt">

			<div class="clearfix"></div>

			<div class="row m-t-25">

				<div class="col-sm-4">
					<div class="card">
						<div class="card-header bgm-lightblue m-b-20">
							<h2>
								질문과 투표<small> 수업 중 질문과 답변 </small>
							</h2>
							<ul class="actions actions-alt">
								<li class="dropdown"><a href="" data-toggle="dropdown">
								</a></li>
							</ul>

							<button class="btn bgm-cyan btn-float waves-effect">
								<i class="zmdi zmdi-mail-send"></i>
							</button>
						</div>

						<div class="card-body card-padding"></div>
					</div>
				</div>


				<div class="col-sm-4">
					<div class="card">
						<div class="card-header bgm-purple m-b-20">
							<h2>
								공란 <small>새로운 기능을 찾아보자</small>
							</h2>
							<ul class="actions actions-alt">
								<li class="dropdown"><a href="" data-toggle="dropdown">
								</a></li>
							</ul>

							<button class="btn bgm-deeppurple btn-float waves-effect">
								<i class="zmdi zmdi-mail-send"></i>
							</button>
						</div>

						<div class="card-body card-padding"></div>
					</div>
				</div>

				<div class="col-sm-4">
					<div class="card">
						<div class="card-header bgm-red m-b-20">
							<h2>
								메세징 서비스 <small>그룹원끼리 대화를 하세요!</small>
							</h2>
							<ul class="actions actions-alt">
								<li class="dropdown"><a href="" data-toggle="dropdown">
								</a></li>
							</ul>

							<button class="btn bgm-pink btn-float waves-effect">
								<i class="zmdi zmdi-mail-send"></i>
							</button>
						</div>

						<div class="card-body card-padding"></div>
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
	<script
		src="/bitin/assets/vendors/bower_components/jquery/dist/jquery.min.js"></script>
	<script
		src="/bitin/assets/vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<script
		src="/bitin/assets/vendors/bower_components/flot/jquery.flot.js"></script>
	<script
		src="/bitin/assets/vendors/bower_components/flot/jquery.flot.resize.js"></script>
	<script
		src="/bitin/assets/vendors/bower_components/flot.curvedlines/curvedLines.js"></script>
	<script src="/bitin/assets/vendors/sparklines/jquery.sparkline.min.js"></script>
	<script
		src="/bitin/assets/vendors/bower_components/jquery.easy-pie-chart/dist/jquery.easypiechart.min.js"></script>

	<script
		src="/bitin/assets/vendors/bower_components/moment/min/moment.min.js"></script>
	<script
		src="/bitin/assets/vendors/bower_components/fullcalendar/dist/fullcalendar.min.js "></script>
	<script
		src="/bitin/assets/vendors/bower_components/simpleWeather/jquery.simpleWeather.min.js"></script>
	<script
		src="/bitin/assets/vendors/bower_components/Waves/dist/waves.min.js"></script>
	<script
		src="/bitin/assets/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
	<script
		src="/bitin/assets/vendors/bower_components/bootstrap-sweetalert/lib/sweet-alert.min.js"></script>
	<script
		src="/bitin/assets/vendors/bower_components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>

	<script src="/bitin/assets/js/flot-charts/curved-line-chart.js"></script>
	<script src="/bitin/assets/js/flot-charts/line-chart.js"></script>
	<script src="/bitin/assets/js/charts.js"></script>

	<script src="/bitin/assets/js/charts.js"></script>
	<script src="/bitin/assets/js/functions.js"></script>
	<script src="/bitin/assets/js/demo.js"></script>



</body>
</html>