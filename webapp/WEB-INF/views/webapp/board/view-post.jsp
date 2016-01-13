<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("newLine", "\n");
%>

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

<section id="container">
	<div class="table-responsive"></div>
	<div class="col-sm">
		<div class="card">
			<div class="card-header">
				<h2>${postVo.title }
					<small>작성자 : ${postVo.userName }(${postVo.postNo } 번 게시물)</small>
				</h2>
				
				<ul class="actions">
					<li class="dropdown">
						<a href="" data-toggle="dropdown"><i class="zmdi zmdi-more-vert" style="margin-top: 20px;"></i></a>

						<ul class="dropdown-menu dropdown-menu-right">
							<li><a href="/bitin/webapp-user/profile?myNo=${fakeAuthUser.userNo}&otherNo=${postVo.userNo }">작성자 프로필</a></li>
							<c:if test="${fakeAuthUser.userNo==postVo.userNo }">
								<li><a href="/bitin/webapp/board/post/modify-form?userNo=${fakeAuthUser.userNo}&postNo=${postVo.postNo}">글수정@@</a></li>
								<li><a href="/bitin/webapp/board/delete-post?userNo=${fakeAuthUser.userNo }&postNo=${postVo.postNo}"><input type="hidden" name="classNo" value="${postVo.boardNo }">글 삭제</a></li>
							</c:if>
						</ul>
					</li>
				</ul>
			</div>
			
			<div class="card-header">
				<div class="media">
					<div class="pull-left" >
						<img class="lv-img" src="/bitin/assets/img/profile-pics/${postVo.userNo }.jpg" alt="">
					</div>
					<div class="media-body m-t-5">
						<h2>
							<small>Posted on ${postVo.regDate }</small>
						</h2>
					</div>
				</div>

				<br>
				<div class="card-body card-padding">${fn:replace( postVo.content, newLine, '<br>' ) }</div>
				<br>

				<ul class="wall-attrs clearfix list-inline list-unstyled">
					<li class="wa-stats">
						<span><i class="zmdi zmdi-comments"></i>${postVo.viewCnt }</span></li>
				</ul>
			</div>
			<br>
			
			<div class="col-sm">
				<div class="card">
					<div class="btn-group btn-group-justified" role="group" aria-label="...">
						<c:if test="${nextPostNo != null }">
							<div class="btn-group" role="group" onclick="location='/bitin/webapp/board/view-post?userNo=${fakeAuthUser.userNo}&postNo=${nextPostNo}'">
								<button type="button" class="btn btn-default zmdi zmdi-arrow-left zmdi-hc-fw">이전</button>
							</div>
						</c:if>
						
						<div class="btn-group" role="group" onclick="location='/bitin/webapp/board/list?userNo=${fakeAuthUser.userNo}&boardNo=${postVo.boardNo}'">
							<button type="button" class="btn btn-default zmdi zmdi-apps zmdi-hc-fw">목록</button>
						</div>
						
						<c:if test="${prevPostNo != null }">
							<div class="btn-group" role="group" onclick="location='/bitin/webapp/board/view-post?userNo=${fakeAuthUser.userNo}&postNo=${prevPostNo}'">
								<button type="button" class="btn btn-default"> 다음<i class="zmdi zmdi-arrow-right zmdi-hc-fw"></i></button>
							</div>
						</c:if>
					</div>
				</div>
			</div>

			<!-- Comment Listing -->
			<form class="reply-form" method="post" action="/bitin/webapp/board/write-reply">
				<div class="container">
					<c:forEach items='${replyList}' var='vo' varStatus='status'>
						<a href="" class="pull-left"> <img
							src="/bitin/assets/img/profile-pics/${vo.userNo }.jpg" alt=""
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
				${fn:replace(fn:replace(string, cr, ""), lf, "")}
				<div class="card wall-posting">
					<div class="card-body card-padding">
						<input type="hidden" name="postNo" value="${postVo.postNo }">
						<input type="hidden" name="userNo" value="${fakeAuthUser.userNo }">
						<textarea id="reply" class="wp-text" name="reply" placeholder="댓글을 작성하세요" style="background-color: #f2f2f2;"></textarea>
						<button type="summit" class="btn btn-warning btn-block" style="margin-right: 8px; cursor: pointer;">댓글 달기</button>
					</div>
					<br>
				</div>
			</form>
		</div>
	</div>
</section>
<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

<!-- Javascript Libraries -->
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
<!-- Javascript Libraries -->

<script src="/bitin/assets/vendors/bower_components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="/bitin/assets/vendors/bower_components/Waves/dist/waves.min.js"></script>
<script src="/bitin/assets/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<script src="/bitin/assets/vendors/bower_components/bootstrap-sweetalert/lib/sweet-alert.min.js"></script>
<script src="/bitin/assets/vendors/bootgrid/jquery.bootgrid.updated.js"></script>

</body>
</html>