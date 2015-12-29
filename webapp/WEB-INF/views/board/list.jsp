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
	<c:import url="/WEB-INF/views/include/navi2.jsp"></c:import>

	<section id="content">
		<div class="content">
			<div class="card">
				<div class="card-padding card-body">
					<button class="btn btn-warning btn-block" onclick="location.href='/bitin/board/writeform/${list[0].classNo }'"
						style="margin-right: 8px; margin-top: 30px; cursor: pointer;">${vo.className } 게시판  글 작성 바로가기</button>
				</div>
				<div class="table-responsive">
					<table id="data-table-basic" class="table table-striped">
						<thead>
							<tr>
								<th data-column-id="no" data-order="desc" data-type="numeric">No</th>
								<th data-column-id="sender">작성자</th>
								<th data-column-id="title" data-formatter="link">제 목</th>
								<th data-column-id="date">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items='${list }' var='vo' varStatus='status'>
								<tr>
									<td>${vo.postNo}</td>
									<td>${vo.userName }</td>
									<td>${vo.title }</td>
									<td>${vo.regDate }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
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
		//Basic Example
		$("#data-table-basic").bootgrid(
				{
					css : {
						icon : 'zmdi icon',
						iconColumns : 'zmdi-view-module',
						iconDown : 'zmdi-expand-more',
						iconRefresh : 'zmdi-refresh',
						iconUp : 'zmdi-expand-less'
					},
					formatters : {
						"link" : function(column, row) {
							return "<a href=\"/bitin/board/view/"+row.no+"\">"
									+ row.title + "</a>";
						}
					}
				});
	</script>
</body>
</html>