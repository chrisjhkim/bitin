
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

<c:import url="/WEB-INF/views/include/navi2.jsp"></c:import>

<section id="main">
	<div class="card profile-view">
		<div class="pv-header">
			<img src="/bitin/assets/img/profile-pics/${userNo }.jpg" class="pv-main" alt="">
		</div>
		
		<div class="pv-body">
			<h2>${userVo.userName }</h2>
			<small>간단한 자기 소개를 합니다.</small>
			
			<ul class="pv-contact">
				<li><i class="zmdi zmdi-pin"></i> ${userVo.userId }@stubit.com</li>
				<li><i class="zmdi zmdi-phone"></i> 010.9053.2445</li>
			</ul>
			
			<ul class="pv-follow">
				<li>전공</li>
				<li>${userVo.userType }</li>
			</ul>
                                
			<a href="/bitin/webapp/chat-view?myNo=${myNo }&otherNo=${otherNo}" class="pv-follow-btn">1:1 대화하기</a>
		</div>
	</div>
</section>

<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

<!-- Javascript Libraries -->
<script src="/bitin/assets/vendors/bower_components/jquery/dist/jquery.min.js"></script>
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



</body>
</html>

                       