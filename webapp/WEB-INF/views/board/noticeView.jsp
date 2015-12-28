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

	<section id="container">
		<div class="table-responsive"></div>
		<div class="col-sm">
			<div class="card">
				<div class="card-header">

					<h2>
						${boardVo.title } <small>작성자 : ${boardVo.userName }(
							${boardVo.postNo } 번 게시물)</small>
					</h2>

					<div class="media">
						<div class="pull-left">
							<img class="lv-img" src="/bitin/assets/img/profile-pics/1.jpg"
								alt="">
						</div>

						<div class="media-body m-t-5">
							<h2>
								<small>Posted on ${boardVo.regDate }</small>
							</h2>
						</div>
					</div>


					<br>
					<div class="card-body card-padding">${boardVo.content }</div>
					<br>

					<ul class="wall-attrs clearfix list-inline list-unstyled">
						<li class="wa-stats"><span><i
								class="zmdi zmdi-comments"></i>${boardVo.viewCount }</span>
					</ul>
				</div>
				<br>
				<div class="col-sm">
					<div class="card">
						<div class="btn-group btn-group-justified" role="group"
							aria-label="...">
							<div class="btn-group" role="group">
								<button type="button"
									class="btn btn-default zmdi zmdi-arrow-left zmdi-hc-fw">
									이전</button>
							</div>
							<div class="btn-group" role="group"
								onclick="location='/bitin/board/list/${boardVo.classNo}'">
								<button type="button"
									class="btn btn-default zmdi zmdi-apps zmdi-hc-fw">목록</button>
							</div>
							<div class="btn-group" role="group">
								<button type="button" class="btn btn-default">
									다음<i class="zmdi zmdi-arrow-right zmdi-hc-fw"></i>
								</button>
							</div>
						</div>
					</div>
				</div>

				<!-- Comment Listing -->
				<form class="reply-form" method="post" action="/bitin/board/reply">
					<div class="container">
						<c:forEach items='${list}' var='vo' varStatus='status'>
							<a href="" class="pull-left"> <img
								src="/bitin/assets/img/profile-pics/5.jpg" alt=""
								class="lv-img-sm">
							</a>

							<div class="media-body">
								<a href="" class="a-title">${vo.userName }</a> <small
									class="c-gray m-l-10">${vo.regDate }</small>
								<p class="m-t-5 m-b-0">${vo.reply }</p>
							</div>
							<br>
						</c:forEach>
					</div>

					<div class="card wall-posting">
						<div class="card-body card-padding">
							<input type="hidden" name="postNo" value="${postNo }"> <input
								type="hidden" name="userNo" value="${userNo }">
							<textarea id="reply" class="wp-text" name="reply"
								placeholder="댓글을 작성하세요" style="background-color: #f2f2f2;"></textarea>
							<button type="summit" class="btn btn-warning btn-block"
								style="margin-right: 8px; cursor: pointer;">댓글 달기</button>
						</div>
						<br>
					</div>
				</form>
			</div>
		</div>
	</section>
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

	<!-- Javascript Libraries -->
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
	<!-- Javascript Libraries -->

	<script
		src="/bitin/assets/vendors/bower_components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
	<script
		src="/bitin/assets/vendors/bower_components/Waves/dist/waves.min.js"></script>
	<script
		src="/bitin/assets/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
	<script
		src="/bitin/assets/vendors/bower_components/bootstrap-sweetalert/lib/sweet-alert.min.js"></script>
	<script src="/bitin/assets/vendors/bootgrid/jquery.bootgrid.updated.js"></script>

	<script>
		
	</script>
</body>
</html>