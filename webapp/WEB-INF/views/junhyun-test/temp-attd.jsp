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


<!-- Include Required Prerequisites -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap/latest/css/bootstrap.css" />
 
<!-- Include Date Range Picker -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
</head>

<body>
<!-- modal 내용 처리  시작 -->
<div class="modal fade" id="date-edit-form" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
			<div class="modal-content">
			<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" >&times;</button>
					<h2 class="modal-title text-center ">출석부 수정</h2>
					<div id="hoho" class="text-center"></div>
			</div>
		
			<div class="modal-body">
				<form action="#">
					<div class="btn-group-demo" data-toggle="buttons">
						<div class="btn-group btn-group-justified" id="modal-radio" >
							<!-- <label class="btn btn-default"> -->
							<label id="modal-label1" class="btn btn-default" onclick="modalClick_1();">
								<input type="radio" name="options" id="modal-option1">출석
							</label>
							<label id="modal-label2" class="btn btn-default" onclick="modalClick_2();">
								<input type="radio" name="options" id="modal-option2">지각
							</label>
							<label id="modal-label3" class="btn btn-default" onclick="modalClick_3();">
								<input type="radio" name="options" id="modal-option3" checked="checked" >결석
							</label>
							<label id="modal-label4" class="btn btn-default" onclick="modalClick_4();">
								<input type="radio" name="options" id="modal-option4">병결
							</label>
						</div>
					</div>
					<div class="form-group">
						<label for="input-pwd">메모</label>
						<input class="form-control" type="text" id="input-pwd" name="userPassword" placeholder="한줄 메모 입력" />
					</div>
					
				</form>
			</div>

			<div class="modal-footer">
				<button class="btn btn-primary" data-dismiss="modal" onclick="modalModify();">수정</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- modal 끝-->	
<c:import url="/WEB-INF/views/include/navi2.jsp"></c:import>

<section id="content">
	<div class="content">
		<div class="card">
<!-- 			<div class="card-padding card-body"> -->
<%-- 				<button class="btn btn-warning btn-block" onclick="location.href='/bitin/board/writeform/${list[0].classNo }'" --%>
<%-- 					style="margin-right: 8px; margin-top: 30px; cursor: pointer;">${vo.className } 게시판  글 작성 바로가기</button> --%>
<!-- 			</div> -->
			<div class="col-sm-5 actionBar">
					<div class="input-group form-group">
						<span class="input-group-addon"><i class="zmdi zmdi-calendar"></i></span>
						<div class="dtp-container fg-line">
<!-- 							<input type='text' class="form-control " id="start-date"> -->
							<button class="btn btn-default form-control btn-icon-text" type="button"  >StartDate</button>
   						</div>
   					</div>
   				</div>	
				<div class="col-sm-5 actionBar">
					<div class="input-group form-group">
						<span class="input-group-addon"><i class="zmdi zmdi-calendar"></i></span>
						<div class="dtp-container fg-line">
<!-- 							<input type='text' class="form-control " id="start-date"> -->
							<button class="btn btn-default form-control btn-icon-text" type="button" id="start-date" >StartDate</button>
   						</div>
   					</div>
   				</div>	
   				<div class="col-sm-5 actionBar">
   					<div class="input-group form-group">
    					<span class="input-group-addon"><i class="zmdi zmdi-calendar"></i></span>
   						<div class="dtp-container fg-line">
<!--    							<button class="btn btn-default form-control" type="button" id="end-date" ></button> -->
   							<button class="btn btn-default form-control btn-icon-text" type="button" id="end-date" >EndDate</button>
   							
						</div>
   					</div>
   				</div>
   				<div class="col-sm-2 actionBar">
  						<button class="btn btn-success btn-block" type="button" onclick="modifyDateRange();">Apply</button>
  					</div>
			<div class="table-responsive">
				<table id="data-table-basic" class="table table-striped" data-link="row">
					<thead>
						<tr id="table-abc">
							<th data-column-id="name" data-type="text" data-identifier="true">이름</th>
							<th data-column-id="userNo" data-visible="false">userNo</th>
							<th data-column-id="goodRate" data-visible="true">출석률</th>
							<!-- <th data-column-id="attdYesRate" data-visible="true">출석률()</th>
							<th data-column-id="attdYesOrInfoRate" data-visible="true">출석률(병결인정)</th>
							<th data-column-id="attdYesOrInfoOrLateRate" data-visible="true">출석률(지각포함)</th> -->
							<c:if test="${attdCounter>0}"><th data-column-id="fixed1" data-formatter="newtest1">${dataList[0].attdList[0].classDate }</th></c:if>
							<c:if test="${attdCounter>1}"><th data-column-id="fixed2" data-formatter="newtest2">${dataList[0].attdList[1].classDate }</th></c:if>
							<c:if test="${attdCounter>2}"><th data-column-id="fixed3" data-formatter="newtest3">${dataList[0].attdList[2].classDate }</th></c:if>
							<c:if test="${attdCounter>3}"><th data-column-id="fixed4" data-formatter="newtest4">${dataList[0].attdList[3].classDate }</th></c:if>
							<c:if test="${attdCounter>4}"><th data-column-id="fixed5" data-formatter="newtest5">${dataList[0].attdList[4].classDate }</th></c:if>
							<c:if test="${attdCounter>5}"><th data-column-id="fixed6" data-formatter="newtest6">${dataList[0].attdList[5].classDate }</th></c:if>
							<c:if test="${attdCounter>6}"><th data-column-id="fixed7" data-formatter="newtest7">${dataList[0].attdList[6].classDate }</th></c:if>
							<c:if test="${attdCounter>7}"><th data-column-id="fixed8" data-formatter="newtest8">${dataList[0].attdList[7].classDate }</th></c:if>
							<c:if test="${attdCounter>8}"><th data-column-id="fixed9" data-formatter="newtest9">${dataList[0].attdList[8].classDate }</th></c:if>
							<c:if test="${attdCounter>9}"><th data-column-id="fixed10" data-formatter="newtest10">${dataList[0].attdList[9].classDate }</th></c:if>
							<c:if test="${attdCounter>10}"><th data-column-id="fixed11" data-formatter="newtest11">${dataList[0].attdList[10].classDate }</th></c:if>
							<c:if test="${attdCounter>11}"><th data-column-id="fixed12" data-formatter="newtest12">${dataList[0].attdList[11].classDate }</th></c:if>
							<c:if test="${attdCounter>12}"><th data-column-id="fixed13" data-formatter="newtest13">${dataList[0].attdList[12].classDate }</th></c:if>
							<c:if test="${attdCounter>13}"><th data-column-id="fixed14" data-formatter="newtest14">${dataList[0].attdList[13].classDate }</th></c:if>
							<c:if test="${attdCounter>14}"><th data-column-id="fixed15" data-formatter="newtest15">${dataList[0].attdList[14].classDate }</th></c:if>
							<c:if test="${attdCounter>15}"><th data-column-id="fixed16" data-formatter="newtest16">${dataList[0].attdList[15].classDate }</th></c:if>
							<c:if test="${attdCounter>16}"><th data-column-id="fixed17" data-formatter="newtest17">${dataList[0].attdList[16].classDate }</th></c:if>
							<c:if test="${attdCounter>17}"><th data-column-id="fixed18" data-formatter="newtest18">${dataList[0].attdList[17].classDate }</th></c:if>
							<c:if test="${attdCounter>18}"><th data-column-id="fixed19" data-formatter="newtest19">${dataList[0].attdList[18].classDate }</th></c:if>
						</tr>
					</thead>
					<tbody>
						<c:forEach items='${dataList }' var='vo' varStatus='status'>
							<tr>
									<td>${vo.userName}</td>
 									<td>${vo.userNo}</td>
									<td>${vo.attdRate }</td>
<%-- 									<td>${vo.attdYesOrInfoRate}</td> --%>
<%-- 									<td>${vo.attdYesOrInfoOrLateRate}</td> --%>
<%-- 									<td>${vo.attdList[0].attdStatus }</td> --%>
									<c:if test="${attdCounter>0 }"><td>${vo.attdList[0].attdStatus }</td></c:if>
									<c:if test="${attdCounter>1 }"><td>${vo.attdList[1].attdStatus }</td></c:if>
									<c:if test="${attdCounter>2 }"><td>${vo.attdList[2].attdStatus }</td></c:if>
									<c:if test="${attdCounter>3 }"><td>${vo.attdList[3].attdStatus }</td></c:if>
									<c:if test="${attdCounter>4 }"><td>${vo.attdList[4].attdStatus }</td></c:if>
									<c:if test="${attdCounter>5 }"><td>${vo.attdList[5].attdStatus }</td></c:if>
									<c:if test="${attdCounter>6 }"><td>${vo.attdList[6].attdStatus }</td></c:if>
									<c:if test="${attdCounter>7 }"><td>${vo.attdList[7].attdStatus }</td></c:if>
									<c:if test="${attdCounter>8 }"><td>${vo.attdList[8].attdStatus }</td></c:if>
									<c:if test="${attdCounter>9 }"><td>${vo.attdList[9].attdStatus }</td></c:if>
									<c:if test="${attdCounter>10 }"><td>${vo.attdList[10].attdStatus }</td></c:if>
									<c:if test="${attdCounter>11 }"><td>${vo.attdList[11].attdStatus }</td></c:if>
									<c:if test="${attdCounter>12 }"><td>${vo.attdList[12].attdStatus }</td></c:if>
									<c:if test="${attdCounter>13 }"><td>${vo.attdList[13].attdStatus }</td></c:if>
									<c:if test="${attdCounter>14 }"><td>${vo.attdList[14].attdStatus }</td></c:if>
									<c:if test="${attdCounter>15 }"><td>${vo.attdList[15].attdStatus }</td></c:if>
									<c:if test="${attdCounter>16 }"><td>${vo.attdList[16].attdStatus }</td></c:if>
									<c:if test="${attdCounter>17 }"><td>${vo.attdList[17].attdStatus }</td></c:if>
									<c:if test="${attdCounter>18 }"><td>${vo.attdList[18].attdStatus }</td></c:if>
									
<%-- 								<c:forEach items="${vo.attdList }" var="vovo"> --%>
<%-- 									<td>${vovo.attdStatus }</td> --%>
<%-- 								</c:forEach> --%>
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
<script	src="/bitin/assets/vendors/bower_components/jquery/dist/jquery.min.js"></script>
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
<!-- Javascript Libraries -->

<script	src="/bitin/assets/vendors/bower_components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
<script	src="/bitin/assets/vendors/bower_components/Waves/dist/waves.min.js"></script>
<script	src="/bitin/assets/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<script	src="/bitin/assets/vendors/bower_components/bootstrap-sweetalert/lib/sweet-alert.min.js"></script>
<script src="/bitin/assets/vendors/bootgrid/jquery.bootgrid.updated.js"></script>


<!-- 추가함 (준현)  -->
<script src="/bitin/assets/vendors/bower_components/flot/jquery.flot.pie.js"></script>
<script src="/bitin/assets/vendors/bower_components/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
<script src="/bitin/assets/vendors/bower_components/flot-orderBars/js/jquery.flot.orderBars.js"></script>
<script src="/bitin/assets/vendors/bootgrid/jquery.bootgrid.updated.js"></script>

<!-- modal 선 처리  -->
<script type="text/javascript">
$(function(){
	$('#date-edit-form').on('show.bs.modal', function (event) {
		console.log("modal 선 처리 1 !")
		var button = $(event.relatedTarget);
		
		
		var tempDate  = $('label[data-date='+gDate+'][data-userno='+gUserNo+']').data('date');
		var tempUserNo= $('label[data-date='+gDate+'][data-userno='+gUserNo+']').data('userno');
		var tempUserName = $('label[data-date='+gDate+'][data-userno='+gUserNo+']').data('name');
	    var modal = $(this);
	    tempDate= tempDate+"";	//string 으로 바꿈
	    console.log('2:35 '+gDate)
	    var gDateMonth = gDate.substring(0,2);
	    var gDateDay = gDate.substring(3,5);
		
	    console.log('gDate'+gDate +'// gUserNo :'+gUserNo);
 	    console.log('tempDate '+tempDate + '// tempUserNo : '+tempUserNo +'tempUserName' +tempUserName)
	    console.log("length : "+tempDate.length)
	    
	    var newTag;
	    if ( tempDate.length >6) {
	    	newTag = "<h4>"+tempUserName+"님의 "+gDateMonth+"월 "+gDateDay+"일 "+ gDate.substring(7)+"번째 출석을 수정합니다</h4>";
	    }
	    else {
		    newTag = "<h4>"+gDateMonth+"월 "+gDateDay+"일 "+tempUserName+"의 출석을 수정합니다</h4>";
	    }
	    modal.find('#hoho').empty();
	    modal.find('#hoho').prepend(newTag);
	
//되는데 data-status 로 하려고 	    var tempStatus = button.data('status');
// 	    console.log("------------@1: "+$('label[data-date='+gDate+'][data-userno='+gUserNo+']').attr('data-status'));
	    
	    var tempStatus = $('label[data-date='+gDate+'][data-userno='+gUserNo+']').attr('data-status');
	    if( tempStatus == "no" ){
		    modal.find('#modal-label3').addClass('btn-danger');
		    
		    modal.find('#modal-label1').removeClass('btn-success');
		    modal.find('#modal-label2').removeClass('btn-warning');
			modal.find('#modal-label4').removeClass('btn-info')
		    
	    }else if( tempStatus == "yes" ){
		    modal.find('#modal-label1').addClass('btn-success');
		    
		    modal.find('#modal-label2').removeClass('btn-warning');
			modal.find('#modal-label3').removeClass('btn-danger');
			modal.find('#modal-label4').removeClass('btn-info')
	    }else if(tempStatus == "late" ){
		    modal.find('#modal-label2').addClass('btn-warning');
		    
			modal.find('#modal-label4').removeClass('btn-info')
		    modal.find('#modal-label1').removeClass('btn-success');
			modal.find('#modal-label3').removeClass('btn-danger');
	    }else if(tempStatus == "info" ){
			modal.find('#modal-label4').addClass('btn-info')
		    
		    modal.find('#modal-label1').removeClass('btn-success');
		    modal.find('#modal-label2').removeClass('btn-warning');
			modal.find('#modal-label3').removeClass('btn-danger');
	    }
	});
});
</script>
<!-- Data Table -->
<script>
<!-- 값들 O X 처리 function -->
function greenO(column, row, status){
	var userNo = row.userNo;
 	var date = column.text;
 	var userName = row.name;
 	var attdStatus = status; 
	return "<div class=\"form-group  has-feedback has-success\">"
				+"<label class=\"attd-status control-label \" for=\"inputError2\" "
					+"data-toggle=\"modal\" data-target=\"#date-edit-form\"" //modal 설정
					+"data-temp-column-id=\""+column.id+"\"  "	//세로 어느 줄인지
					+"data-date=\""+date+"\" data-userno=\""+userNo+"\" "
					+"data-name=\""+userName+"\""
					+"data-status=\""+"yes"+"\" "
					+"onclick=\"valueGetter("+userNo+",'"+date+"');\">" 
	  			+"<i class=\"zmdi zmdi-circle-o zmdi-hc-fw f-20  \"></i></label>"
	  	+"</div>"; 
} 
function redX(column, row, status){
	var userNo = row.userNo;
 	var date = column.text;
 	var userName = row.name;
 	var attdStatus = status; 
	return "<div class=\"form-group   has-error \">"
				+"<label class=\"attd-status control-label \" for=\"inputError2\" "
					+"data-toggle=\"modal\" data-target=\"#date-edit-form\"" //modal 설정
					+"data-temp-column-id=\""+column.id+"\"  "	//세로 어느 줄인지
					+"data-date=\""+date+"\" data-userno=\""+userNo+"\" "
					+"data-name=\""+userName+"\""
					+"data-status=\""+"no"+"\" "
					+"data-trigger=\"#sidebar\""
					+"onclick=\"valueGetter("+userNo+",'"+date+"');\">" 
	  			+"<i class=\"zmdi zmdi-close zmdi-hc-fw f-20  \"></i></label>"
	  	+"</div>"; 
} 
function orangeTriangle(column, row, status){
	var userNo = row.userNo;
 	var date = column.text;
 	var userName = row.name;
 	var attdStatus = status; 
	return "<div class=\"form-group  has-feedback has-warning \">"
				+"<label class=\"attd-status control-label \" for=\"inputError2\" "
					+"data-toggle=\"modal\" data-target=\"#date-edit-form\"" //modal 설정
					+"data-temp-column-id=\""+column.id+"\"  "	//세로 어느 줄인지
					+"data-date=\""+date+"\" data-userno=\""+userNo+"\" "
					+"data-name=\""+userName+"\""
					+"data-status=\""+"late"+"\" "
					+"data-trigger=\"#sidebar\""
					+"onclick=\"valueGetter("+userNo+",'"+date+"');\">" 
	  			+"<i class=\"zmdi zmdi-triangle-up zmdi-hc-fw f-20  \"></i></label>"
	  	+"</div>"; 
} 
function blueInfo(column, row, status){
	var userNo = row.userNo;
 	var date = column.text;
 	var userName = row.name;
 	var attdStatus = status; 
	return "<div class=\"form-group  has-feedback \">"
				+"<label class=\"attd-status control-label \" for=\"inputError2\" "
					+"data-toggle=\"modal\" data-target=\"#date-edit-form\"" //modal 설정
					+"data-temp-column-id=\""+column.id+"\"  "	//세로 어느 줄인지
					+"data-date=\""+date+"\" data-userno=\""+userNo+"\" "
					+"data-name=\""+userName+"\""
					+"data-status=\""+"late"+"\" "
					+"data-trigger=\"#sidebar\""
					+"onclick=\"valueGetter("+userNo+",'"+date+"');\">" 
	  			+"<i class=\"zmdi zmdi-alert-circle-o zmdi-hc-fw f-20 text-info \"></i></label>"
	  	+"</div>"; 
} 
</script>
<!-- 전역변수 선언-->
<script type="text/javascript">
var gDate = "abc";
var gUserNo = 0;
var gStatus = "";
</script>



<!-- O X 처리  -->
<script type="text/javascript">
/////////////////////////////////// /////////////////////////////////// /////////////////////////////////// 
$(document).ready(
	function() {
		var startDateHTML = document.getElementById("start-date");
		startDateHTML.innerHTML = "${startDate}";		
		var endDateHTML= document.getElementById("end-date");
		endDateHTML.innerHTML = "${endDate}";		
		//Basic Example
		$("#data-table-basic").bootgrid({
			/*
			navigation : 0: 검색, 페이징 둘다 없음  /1: 검색 /2: 페이징 /3: 둘다 /	default : 3
			http://www.jquery-bootgrid.com/documentation
			제대로된 param : 이상한값   하면 전부다 안먹음
			navigation : 0: 검색, 페이징 둘다 없음  /1: 검색 /2: 페이징 /3: 둘다 /	default : 3
			padding : (default : 2)
			columnSelection :  column 선택자
			multiSelection : selection
			rowCount :  페이징. 페이지당 갯수. -1은 all
			selection : true,		가로 선택
			TODO : checkBox
			*/
			labels: {		        noResults: "출석 데이터가 없습니다"		    },
			css : {
				icon : 'zmdi icon',
				iconColumns : 'zmdi-view-module',
				iconDown : 'zmdi-expand-more',
				iconRefresh : 'zmdi-refresh',
				iconUp : 'zmdi-expand-less'
			},
			navigation : 0,
			
			formatters : {
				"newtest1" : function(column, row) {
					if( 	row.fixed1 == "yes"){		return greenO(		   column, row, row.fixed1   );		}
					else if(row.fixed1 == "no"){		return redX( 		   column, row, row.fixed1   );		}
					else if(row.fixed1 == "late"){		return orangeTriangle( column, row, row.fixed1   );		}
					else if(row.fixed1 == "info"){		return blueInfo(	   column, row, row.fixed1   );		}
					else return "?";
				},
				"newtest2" : function(column, row) {
					if( 	row.fixed2 == "yes"){		return greenO(		   column, row, row.fixed2   );		}
					else if(row.fixed2 == "no"){		return redX( 		   column, row, row.fixed2   );		}
					else if(row.fixed2 == "late"){		return orangeTriangle( column, row, row.fixed2   );		}
					else if(row.fixed2 == "info"){		return blueInfo(	   column, row, row.fixed2   );		}
					else return "?";
				},
				"newtest3" : function(column, row) {
					if( 	row.fixed3 == "yes"){		return greenO(		   column, row, row.fixed3   );		}
					else if(row.fixed3 == "no"){		return redX( 		   column, row, row.fixed3   );		}
					else if(row.fixed3 == "late"){		return orangeTriangle( column, row, row.fixed3   );		}
					else if(row.fixed3 == "info"){		return blueInfo(	   column, row, row.fixed3   );		}
					else return "?";
				},
				"newtest4" : function(column, row) {
					if( 	row.fixed4 == "yes"){		return greenO(		   column, row, row.fixed4   );		}
					else if(row.fixed4 == "no"){		return redX( 		   column, row, row.fixed4   );		}
					else if(row.fixed4 == "late"){		return orangeTriangle( column, row, row.fixed4   );		}
					else if(row.fixed4 == "info"){		return blueInfo(	   column, row, row.fixed4   );		}
					else return "?";
				},
				"newtest5" : function(column, row) {
					if( 	row.fixed5 == "yes"){		return greenO(		   column, row, row.fixed5   );		}
					else if(row.fixed5 == "no"){		return redX( 		   column, row, row.fixed5   );		}
					else if(row.fixed5 == "late"){		return orangeTriangle( column, row, row.fixed5   );		}
					else if(row.fixed5 == "info"){		return blueInfo(	   column, row, row.fixed5   );		}
					else return "?";
				},
				"newtest6" : function(column, row) {
					if( 	row.fixed6 == "yes"){		return greenO(		   column, row, row.fixed6   );		}
					else if(row.fixed6 == "no"){		return redX( 		   column, row, row.fixed6   );		}
					else if(row.fixed6 == "late"){		return orangeTriangle( column, row, row.fixed6   );		}
					else if(row.fixed6 == "info"){		return blueInfo(	   column, row, row.fixed6   );		}
					else return "?";
				},
				"newtest7" : function(column, row) {
					if( 	row.fixed7 == "yes"){		return greenO(		   column, row, row.fixed7   );		}
					else if(row.fixed7 == "no"){		return redX( 		   column, row, row.fixed7   );		}
					else if(row.fixed7 == "late"){		return orangeTriangle( column, row, row.fixed7   );		}
					else if(row.fixed7 == "info"){		return blueInfo(	   column, row, row.fixed7   );		}
					else return "?";
				},
				"newtest8" : function(column, row) {
					if( 	row.fixed8 == "yes"){		return greenO(		   column, row, row.fixed8   );		}
					else if(row.fixed8 == "no"){		return redX( 		   column, row, row.fixed8   );		}
					else if(row.fixed8 == "late"){		return orangeTriangle( column, row, row.fixed8   );		}
					else if(row.fixed8 == "info"){		return blueInfo(	   column, row, row.fixed8   );		}
					else return "?";
				},
				"newtest9" : function(column, row) {
					if( 	row.fixed9 == "yes"){		return greenO(		   column, row, row.fixed9   );		}
					else if(row.fixed9 == "no"){		return redX( 		   column, row, row.fixed9   );		}
					else if(row.fixed9 == "late"){		return orangeTriangle( column, row, row.fixed9   );		}
					else if(row.fixed9 == "info"){		return blueInfo(	   column, row, row.fixed9   );		}
					else return "?";
				},
				"newtest10" : function(column, row) {
					if( 	row.fixed10== "yes"){		return greenO(		   column, row, row.fixed10  );		}
					else if(row.fixed10== "no"){		return redX( 		   column, row, row.fixed10  );		}
					else if(row.fixed10== "late"){		return orangeTriangle( column, row, row.fixed10  );		}
					else if(row.fixed10== "info"){		return blueInfo(	   column, row, row.fixed10  );		}
					else return "?";
				},
				"newtest11" : function(column, row) {
					if( 	row.fixed11== "yes"){		return greenO(		   column, row, row.fixed11  );		}
					else if(row.fixed11== "no"){		return redX( 		   column, row, row.fixed11  );		}
					else if(row.fixed11== "late"){		return orangeTriangle( column, row, row.fixed11  );		}
					else if(row.fixed11== "info"){		return blueInfo(	   column, row, row.fixed11  );		}
					else return "?";
				},
				"newtest12" : function(column, row) {
					if( 	row.fixed12== "yes"){		return greenO(		   column, row, row.fixed12  );		}
					else if(row.fixed12== "no"){		return redX( 		   column, row, row.fixed12  );		}
					else if(row.fixed12== "late"){		return orangeTriangle( column, row, row.fixed12  );		}
					else if(row.fixed12== "info"){		return blueInfo(	   column, row, row.fixed12  );		}
					else return "?";
				},
				"newtest13" : function(column, row) {
					if( 	row.fixed13== "yes"){		return greenO(		   column, row, row.fixed13  );		}
					else if(row.fixed13== "no"){		return redX( 		   column, row, row.fixed13  );		}
					else if(row.fixed13== "late"){		return orangeTriangle( column, row, row.fixed13  );		}
					else if(row.fixed13== "info"){		return blueInfo(	   column, row, row.fixed13  );		}
					else return "?";
				},
				"newtest14" : function(column, row) {
					if( 	row.fixed14== "yes"){		return greenO(		   column, row, row.fixed14  );		}
					else if(row.fixed14== "no"){		return redX( 		   column, row, row.fixed14  );		}
					else if(row.fixed14== "late"){		return orangeTriangle( column, row, row.fixed14  );		}
					else if(row.fixed14== "info"){		return blueInfo(	   column, row, row.fixed14  );		}
					else return "?";
				},
				"newtest15" : function(column, row) {
					if( 	row.fixed15== "yes"){		return greenO(		   column, row, row.fixed15  );		}
					else if(row.fixed15== "no"){		return redX( 		   column, row, row.fixed15  );		}
					else if(row.fixed15== "late"){		return orangeTriangle( column, row, row.fixed15  );		}
					else if(row.fixed15== "info"){		return blueInfo(	   column, row, row.fixed15  );		}
					else return "?";
				},
				"newtest16" : function(column, row) {
					if( 	row.fixed16== "yes"){		return greenO(		   column, row, row.fixed16  );		}
					else if(row.fixed16== "no"){		return redX( 		   column, row, row.fixed16  );		}
					else if(row.fixed16== "late"){		return orangeTriangle( column, row, row.fixed16  );		}
					else if(row.fixed16== "info"){		return blueInfo(	   column, row, row.fixed16  );		}
					else return "?";
				},
				"newtest17" : function(column, row) {
					if( 	row.fixed17== "yes"){		return greenO(		   column, row, row.fixed17  );		}
					else if(row.fixed17== "no"){		return redX( 		   column, row, row.fixed17  );		}
					else if(row.fixed17== "late"){		return orangeTriangle( column, row, row.fixed17  );		}
					else if(row.fixed17== "info"){		return blueInfo(	   column, row, row.fixed17  );		}
					else return "?";
				},
				"newtest18" : function(column, row) {
					if( 	row.fixed18== "yes"){		return greenO(		   column, row, row.fixed18  );		}
					else if(row.fixed18== "no"){		return redX( 		   column, row, row.fixed18  );		}
					else if(row.fixed18== "late"){		return orangeTriangle( column, row, row.fixed18  );		}
					else if(row.fixed18== "info"){		return blueInfo(	   column, row, row.fixed18  );		}
					else return "?";
				},
				"newtest19" : function(column, row) {
					if( 	row.fixed19== "yes"){		return greenO(		   column, row, row.fixed19  );		}
					else if(row.fixed19== "no"){		return redX( 		   column, row, row.fixed19  );		}
					else if(row.fixed19== "late"){		return orangeTriangle( column, row, row.fixed19  );		}
					else if(row.fixed19== "info"){		return blueInfo(	   column, row, row.fixed19  );		}
					else return "?";
				},
				
			}
			
		});
	}
);
</script>
<!--  날짜 범위 apply버튼 변경 -->
<script type="text/javascript">
var dateRangeStart = "";
var dateRangeEnd = "";
function modifyDateRange() {
	console.log("modify 해라!")
	console.log("start:"+dateRangeStart+" -> end:"+dateRangeEnd);
	if( dateRangeStart > dateRangeEnd) {
		 alert('잘못된 범위!')
	}else{
		targetUrl = "/bitin/chris/main?from="+dateRangeStart+"&to="+dateRangeEnd;
		location.replace(targetUrl);
		
	}
}
</script>


<!-- modal 확인 버튼 처리 -->
<script type="text/javascript">
function modalModify() {
	console.log('modify 처리하자')
	var modal = $('#date-edit-form');
	if (modal.find('#modal-label1').hasClass('btn-success') ) {
		//모양 변경
		$('label[data-date='+gDate+'][data-userno='+gUserNo+'] i').addClass('zmdi-circle-o')
		$('label[data-date='+gDate+'][data-userno='+gUserNo+'] i').removeClass('zmdi-close')
		$('label[data-date='+gDate+'][data-userno='+gUserNo+'] i').removeClass('zmdi-triangle-up')
		$('label[data-date='+gDate+'][data-userno='+gUserNo+'] i').removeClass('zmdi-alert-circle-o')
		//색 변경
 		$('label[data-date='+gDate+'][data-userno='+gUserNo+']').parent().addClass('has-success');
		$('label[data-date='+gDate+'][data-userno='+gUserNo+']').parent().removeClass('has-error');
		$('label[data-date='+gDate+'][data-userno='+gUserNo+']').parent().removeClass('has-warning');
		$('label[data-date='+gDate+'][data-userno='+gUserNo+'] i').parent().removeClass('text-info');
		//값 변경 ( data-status 속성 만)
		$('label[data-date='+gDate+'][data-userno='+gUserNo+']').attr("data-status","yes");
		
		gStatus = "yes"
	}else if (modal.find('#modal-label2').hasClass('btn-warning') ) {
		$('label[data-date='+gDate+'][data-userno='+gUserNo+'] i').removeClass('zmdi-circle-o')
		$('label[data-date='+gDate+'][data-userno='+gUserNo+'] i').removeClass('zmdi-close')
		$('label[data-date='+gDate+'][data-userno='+gUserNo+'] i').addClass('zmdi-triangle-up')
		$('label[data-date='+gDate+'][data-userno='+gUserNo+'] i').removeClass('zmdi-alert-circle-o')
		//색 변경
 		$('label[data-date='+gDate+'][data-userno='+gUserNo+']').parent().removeClass('has-success');
		$('label[data-date='+gDate+'][data-userno='+gUserNo+']').parent().removeClass('has-error');
		$('label[data-date='+gDate+'][data-userno='+gUserNo+']').parent().addClass('has-warning');
		$('label[data-date='+gDate+'][data-userno='+gUserNo+'] i').parent().removeClass('text-info');
		
		$('label[data-date='+gDate+'][data-userno='+gUserNo+']').attr("data-status","late");
		gStatus = "late"
	}else if  (modal.find('#modal-label3').hasClass('btn-danger') ) {
		$('label[data-date='+gDate+'][data-userno='+gUserNo+'] i').removeClass('zmdi-circle-o')
		$('label[data-date='+gDate+'][data-userno='+gUserNo+'] i').addClass('zmdi-close')
		$('label[data-date='+gDate+'][data-userno='+gUserNo+'] i').removeClass('zmdi-triangle-up')
		$('label[data-date='+gDate+'][data-userno='+gUserNo+'] i').removeClass('zmdi-alert-circle-o')
		//색 변경
 		$('label[data-date='+gDate+'][data-userno='+gUserNo+']').parent().removeClass('has-success');
		$('label[data-date='+gDate+'][data-userno='+gUserNo+']').parent().addClass('has-error');
		$('label[data-date='+gDate+'][data-userno='+gUserNo+']').parent().removeClass('has-warning');
		$('label[data-date='+gDate+'][data-userno='+gUserNo+'] i').parent().removeClass('text-info');
		
		$('label[data-date='+gDate+'][data-userno='+gUserNo+']').attr("data-status","no");
		gStatus = "no"
	}else if (modal.find('#modal-label4').hasClass('btn-info') ) {
		$('label[data-date='+gDate+'][data-userno='+gUserNo+'] i').removeClass('zmdi-circle-o')
		$('label[data-date='+gDate+'][data-userno='+gUserNo+'] i').removeClass('zmdi-close')
		$('label[data-date='+gDate+'][data-userno='+gUserNo+'] i').removeClass('zmdi-triangle-up')
		$('label[data-date='+gDate+'][data-userno='+gUserNo+'] i').addClass('zmdi-alert-circle-o')
		//색 변경
 		$('label[data-date='+gDate+'][data-userno='+gUserNo+']').parent().removeClass('has-success');
		$('label[data-date='+gDate+'][data-userno='+gUserNo+']').parent().remove('has-error');
		$('label[data-date='+gDate+'][data-userno='+gUserNo+']').parent().removeClass('has-warning');
		$('label[data-date='+gDate+'][data-userno='+gUserNo+'] i').parent().addClass('text-info');
		
		$('label[data-date='+gDate+'][data-userno='+gUserNo+']').attr("data-status","info");
		gStatus = "info"
	}else {
		return;
	}
	console.log(gDate+'일  '+ gUserNo+'번 유저의 수업상태를 '+ gStatus +"로 바꾼다.")
	
	var parsedDate = gDate.substring(0,2)+"M"+gDate.substring(3,5)+"D";
	if( gDate.length>6) parsedDate += gDate.substring(7);
	console.log('1 '+parsedDate)
	console.log('2 '+gUserNo)
	console.log('3 '+gStatus)
	var firstAttdNo = "${dataList[0].attdList[0].attdNo}"
	$.ajax({
		url:"/bitin/webapi/attd/edit-status",
		type:"get",
		dataType:"json",
		data:"classDate="+parsedDate+"&userNo="+gUserNo+"&attdStatus="+gStatus+"&firstAttdNo="+firstAttdNo,
		contentType: 'applicationjson',
		success: function(response) {
			if(response.result=="fail") {
				console.error(response.message);
				console.log("ajax error@ /attd/edit-status");
				return;
			}
			
			
		}
		
	})
}
</script>
<!-- modal radio 선택자 색변화 -->
<script>
function modalClick_1() {
	var modal = $('#date-edit-form');
    modal.find('#modal-label1').addClass('btn-success');
	modal.find('#modal-label2').removeClass('btn-warning');
	modal.find('#modal-label3').removeClass('btn-danger');
	modal.find('#modal-label4').removeClass('btn-info')
}
function modalClick_2() {
	var modal = $('#date-edit-form');
    modal.find('#modal-label2').addClass('btn-warning');		
    modal.find('#modal-label1').removeClass('btn-success');
	modal.find('#modal-label3').removeClass('btn-danger');
	modal.find('#modal-label4').removeClass('btn-info');
}	 
function modalClick_3() {
	var modal = $('#date-edit-form');
    modal.find('#modal-label3').addClass('btn-danger');		
	modal.find('#modal-label1').removeClass('btn-success');
	modal.find('#modal-label2').removeClass('btn-warning');
	modal.find('#modal-label4').removeClass('btn-info');
}	 
function modalClick_4() {
	var modal = $('#date-edit-form');
    modal.find('#modal-label4').addClass('btn-info');
	modal.find('#modal-label1').removeClass('btn-success');
	modal.find('#modal-label2').removeClass('btn-warning');
	modal.find('#modal-label3').removeClass('btn-danger');
}
</script>
<script type="text/javascript">
function valueGetter(userNo,date) {
	var button = $(event.relatedTarget);
	var tempDate  = button.data('date');
	var tempUserNo= button.data('userno');
	var tempUserName = button.data('name');
    console.log('tempDate '+tempDate + '// tempUserNo : '+tempUserNo +' // tempUserName' +tempUserName)
	gDate=date;
	gUserNo = userNo;
	$('div.modal').modal();
} 
</script>
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<script type="text/javascript">
$(function() {
	$('#end-date').daterangepicker({
	    "singleDatePicker": true,
	    "startDate": "12/16/2015",
	}, function(start, end, label) {
	  dateRangeEnd = start.format('YYYYMMDD');
		var endDateHTML= document.getElementById("end-date");
		endDateHTML.innerHTML = dateRangeEnd;		
	});
	
	$('#start-date').daterangepicker({
	    "singleDatePicker": true,
	    "startDate": "12/01/2015",
	}, function(start, end, label) {
	  dateRangeStart = start.format('YYYYMMDD');
		var startDateHTML = document.getElementById("start-date");
		startDateHTML.innerHTML = dateRangeStart;		
	});
});
</script>
</body>

</html>