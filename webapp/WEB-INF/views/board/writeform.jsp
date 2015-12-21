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
<title>writeform test</title>

<!-- Vendor CSS -->
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
<link
	href="/bitin/assets/vendors/bower_components/bootstrap-select/dist/css/bootstrap-select.css"
	rel="stylesheet">
<link
	href="/bitin/assets/vendors/bower_components/nouislider/distribute/jquery.nouislider.min.css"
	rel="stylesheet">
<link
	href="/bitin/assets/vendors/bower_components/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link href="/bitin/assets/vendors/farbtastic/farbtastic.css"
	rel="stylesheet">
<link
	href="/bitin/assets/vendors/bower_components/chosen/chosen.min.css"
	rel="stylesheet">
<link href="/bitin/assets/vendors/summernote/dist/summernote.css"
	rel="stylesheet">


<!-- CSS -->
<link href="/bitin/assets/css/app.min.1.css" rel="stylesheet">
<link href="/bitin/assets/css/app.min.2.css" rel="stylesheet">

<!-- Following CSS are used only for the Demp purposes thus you can remove this anytime. -->
<style type="text/css">
.toggle-switch .ts-label {
	min-width: 130px;
}
</style>
</head>

<c:import url="/WEB-INF/views/include/navi.jsp"></c:import>

<body>

	<section id="main">
		<div class="profile-menu">
			<div class="card">
				<div class="card-header">
					<h2>
						게시물 작성 페이지 (해당 게시판 제목 적을 공간) <small> 해당 게시글 게시판을 알려줍니다.</small>
					</h2>
				</div>

				<div class="card-body card-padding">
					<p class="f-500 c-black m-b-20">글쓰기</p>

					<div class="html-editor"></div>

					<br /> <br />

				</div>
			</div>
		</div>
	</section>

	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

	<!-- Page Loader -->
	<div class="page-loader">
		<div class="preloader pls-blue">
			<svg class="pl-circular" viewBox="25 25 50 50">
                    <circle class="plc-path" cx="50" cy="50" r="20" />
                </svg>

			<p>Please wait...</p>
		</div>
	</div>


	<!-- Javascript Libraries -->
	<script
		src="/bitin/assets/vendors/bower_components/jquery/dist/jquery.min.js"></script>
	<script
		src="/bitin/assets/vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<script
		src="/bitin/assets/vendors/bower_components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
	<script
		src="/bitin/assets/vendors/bower_components/Waves/dist/waves.min.js"></script>
	<script
		src="/bitin/assets/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
	<script
		src="/bitin/assets/vendors/bower_components/bootstrap-sweetalert/lib/sweet-alert.min.js"></script>

	<script
		src="/bitin/assets/vendors/bower_components/moment/min/moment.min.js"></script>
	<script
		src="/bitin/assets/vendors/bower_components/bootstrap-select/dist/js/bootstrap-select.js"></script>
	<script
		src="/bitin/assets/vendors/bower_components/nouislider/distribute/jquery.nouislider.all.min.js"></script>
	<script
		src="/bitin/assets/vendors/bower_components/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
	<script
		src="/bitin/assets/vendors/bower_components/typeahead.js/dist/typeahead.bundle.min.js"></script>
	<script
		src="/bitin/assets/vendors/summernote/dist/summernote-updated.min.js"></script>

	<script
		src="/bitin/assets/vendors/bower_components/chosen/chosen.jquery.min.js"></script>
	<script src="/bitin/assets/vendors/fileinput/fileinput.min.js"></script>
	<script src="/bitin/assets/vendors/input-mask/input-mask.min.js"></script>
	<script src="/bitin/assets/vendors/farbtastic/farbtastic.min.js"></script>


	<script src="/bitin/assets/js/functions.js"></script>
	<script src="/bitin/assets/js/demo.js"></script>


</body>
</html>