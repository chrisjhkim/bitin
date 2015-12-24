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
		$("#data-table-basic").bootgrid({
			css : {
				icon : 'zmdi icon',
				iconColumns : 'zmdi-view-module',
				iconDown : 'zmdi-expand-more',
				iconRefresh : 'zmdi-refresh',
				iconUp : 'zmdi-expand-less'
			},
			formatters : {
				"link" : function(column, row) {
					return "<a href=\"view/"+row.no+"\">" + row.title + "</a>";
				}
			}
		});
	</script>
</body>
</html>