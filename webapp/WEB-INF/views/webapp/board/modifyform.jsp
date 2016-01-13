<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% pageContext.setAttribute( "newLine", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>writeform test</title>

<!-- Vendor CSS -->
<link href="/bitin/assets/vendors/bower_components/animate.css/animate.min.css" rel="stylesheet">
<link href="/bitin/assets/vendors/bower_components/bootstrap-sweetalert/lib/sweet-alert.css" rel="stylesheet">
<link href="/bitin/assets/vendors/bower_components/material-design-iconic-font/dist/css/material-design-iconic-font.min.css" rel="stylesheet">
<link href="/bitin/assets/vendors/bower_components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.min.css" rel="stylesheet">
<link href="/bitin/assets/vendors/bower_components/bootstrap-select/dist/css/bootstrap-select.css" rel="stylesheet">
<link href="/bitin/assets/vendors/bower_components/nouislider/distribute/jquery.nouislider.min.css" rel="stylesheet">
<link href="/bitin/assets/vendors/bower_components/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link href="/bitin/assets/vendors/farbtastic/farbtastic.css" rel="stylesheet">
<link href="/bitin/assets/vendors/bower_components/chosen/chosen.min.css" rel="stylesheet">
<link href="/bitin/assets/vendors/summernote/dist/summernote.css" rel="stylesheet">

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

<c:import url="/WEB-INF/views/webapp/include/webapp-navi.jsp"></c:import>

<body>
<section id="container">
	<div class="table-responsive"></div>
	<div class="col-sm">
		<div class="card">
			<div class="card-header">
				<h2>${boardName }<small>${postVo.postNo }번 글 수정하기</small></h2>
			</div>
			<form class="board-form" method="post" action="/bitin/webapp/board/post/modify?userNo=${fakeAuthUser.userNo }">
				<input type="hidden" name="postNo" value="${postVo.postNo }"> 
				<div class="input-group">
					<span class="input-group-addon"><i class="zmdi zmdi-collection-item"></i></span>
					<div class="fg-line" style="width: 94.5%;">
						<input type="text" name="title" class="form-control" value="${postVo.title }">
					</div>
				</div>
				<br>
				
				<textarea id="board-content" class="textarea" name="content">${postVo.content }</textarea>
				
				<br>
				
				<div class="col-sm-6" style="margin-left:4.5px; margin-right:3.5px;">
					<div class="btn-group btn-group-justified" role="group" aria-label="...">
						<div class="btn-group" role="group">
							<button type="summit" class="btn btn-warning">수정하기</button>
						</div>
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-danger" onclick="location='/bitin/webapp/board/view-post?userNo=${fakeAuthUser.userNo}&postNo=${postVo.postNo }'">취소</button>
						</div>
					</div>
				</div>
			</form>

			<br>
		</div>
	</div>
</section>
<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

<!-- Page Loader -->



<!-- Javascript Libraries -->
<script src="/bitin/assets/vendors/bower_components/jquery/dist/jquery.min.js"></script>
<script src="/bitin/assets/vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<script src="/bitin/assets/vendors/bower_components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="/bitin/assets/vendors/bower_components/Waves/dist/waves.min.js"></script>
<script src="/bitin/assets/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<script src="/bitin/assets/vendors/bower_components/bootstrap-sweetalert/lib/sweet-alert.min.js"></script>

<script src="/bitin/assets/vendors/bower_components/moment/min/moment.min.js"></script>
<script src="/bitin/assets/vendors/bower_components/bootstrap-select/dist/js/bootstrap-select.js"></script>
<script src="/bitin/assets/vendors/bower_components/nouislider/distribute/jquery.nouislider.all.min.js"></script>
<script src="/bitin/assets/vendors/bower_components/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
<script src="/bitin/assets/vendors/bower_components/typeahead.js/dist/typeahead.bundle.min.js"></script>
<script src="/bitin/assets/vendors/summernote/dist/summernote-updated.min.js"></script>

<script src="/bitin/assets/vendors/bower_components/chosen/chosen.jquery.min.js"></script>
<script src="/bitin/assets/vendors/fileinput/fileinput.min.js"></script>
<script src="/bitin/assets/vendors/input-mask/input-mask.min.js"></script>
<script src="/bitin/assets/vendors/farbtastic/farbtastic.min.js"></script>


<script src="/bitin/assets/js/functions.js"></script>
<script>
	$(function() {
		$("#board form").submit(function() {
			if ($("input[name='title']").val() == "") {
				return false;
			}
			if ($("#board-content").val() == "") {
				return false;
			}

			return true;
		});
	});
</script>
</body>
</html>