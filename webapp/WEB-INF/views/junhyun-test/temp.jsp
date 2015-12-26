<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<!--[if IE 9 ]><html class="ie9"><![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Material Admin !</title>

<!-- Vendor CSS -->
<link href="/bitin/assets/vendors/bower_components/animate.css/animate.min.css" rel="stylesheet">
<link href="/bitin/assets/vendors/bower_components/bootstrap-sweetalert/lib/sweet-alert.css" rel="stylesheet">
<link href="/bitin/assets/vendors/bower_components/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet">
<link href="/bitin/assets/vendors/bower_components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.min.css" rel="stylesheet">
<link href="/bitin/assets/vendors/bower_components/material-design-iconic-font/dist/css/material-design-iconic-font.min.css" rel="stylesheet">
<link href="/bitin/assets/vendors/bootgrid/jquery.bootgrid.min.css" rel="stylesheet">

<!-- CSS -->
<link href="/bitin/assets/css/app.min.1.css" rel="stylesheet">
<link href="/bitin/assets/css/app.min.2.css" rel="stylesheet">
</head>
<body>

<!-------------------- header 시작--------------------------------  -->
<!---------------------- header 끝 ---------------------------------------         -->
<c:import url="/WEB-INF/views/include/navi.jsp"></c:import>
<section id="main">
	<section id="content">
		<div class="container">
			<div class="block-header">
				<!--이거 건드리면 하얀태두리가 옆으로 커지고 정렬도 안된다-->
				<h2>Data Table</h2>

				<ul class="actions">
					<li>
						<a href="">
							<i class="zmdi zmdi-trending-up"></i>
						</a>
					</li>
					<li>
						<a href="">
							<i class="zmdi zmdi-check-all"></i>
						</a>
					</li>
					<li class="dropdown">
						<a href="" data-toggle="dropdown"> 
							<i class="zmdi zmdi-more-vert"></i>
						</a>
						<ul class="dropdown-menu dropdown-menu-right">
							<li><a href="">Refresh</a></li>
							<li><a href="">Manage Widgets</a></li>
							<li><a href="">Widgets Settings</a></li>
						</ul>
					</li>
				</ul>
			</div>

			<div class="card">
				<div class="card-header">
					<h2>
						Basic Example 
						<small>It's just that simple. Turn your
							simple table into a sophisticated data table and offer your
							users a nice experience and great features without any effort.</small>
					</h2>
				</div>

				<!-- table 처리 -->
				<div class="table-responsive">
					<table id="data-table-basic" class="table table-striped" data-link="row">
						<thead>
							<tr id="table-header">
								<th data-column-id="name" id="a" data-type="text" data-identifier="true">이름</th>
								<th data-column-id="userNo" id="b" data-visible="false">userNo</th>
								<th data-column-id="fixed1" data-formatter="newtest1" >12월08일</th>
								<th data-column-id="fixed2" data-formatter="newtest2">12월10일</th>
								<th data-column-id="fixed3" data-formatter="newtest3">12월11일</th>
								<th data-column-id="fixed4" data-formatter="newtest4">12월12일</th>
								<th data-column-id="fixed5" data-formatter="newtest5">12월13일</th>
								<th data-column-id="fixed6" data-formatter="newtest6">12월14일</th>
								<th data-column-id="fixed7" data-formatter="newtest7">12월15일</th>
								<th data-column-id="fixed8" data-formatter="newtest8">12월16일</th>
								<th data-column-id="fixed9" data-formatter="newtest9">12월16일_2</th>
								<th data-column-id="fixed10" data-formatter="newtest10">12월16일_3</th>
							</tr>
						</thead>
						
							<tr id="7" data-row-id="7">
								<td data-identifier="true">Chris</td>
								<td>7</td>
								
									
										
											<td>yes</td> <!--data-row-id필요한건가?   -->
										
										
									
								
									
										
											<td>yes</td> <!--data-row-id필요한건가?   -->
										
										
									
								
									
										
										
											<td>no</td>
										
									
								
									
										
										
											<td>no</td>
										
									
								
									
										
										
											<td>no</td>
										
									
								
									
										
										
											<td>no</td>
										
									
								
									
										
										
											<td>no</td>
										
									
								
									
										
										
											<td>no</td>
										
									
								
									
										
										
											<td>no</td>
										
									
								
									
										
										
											<td>no</td>
										
									
								
							</tr>
						
							<tr id="8" data-row-id="8">
								<td data-identifier="true">박영준</td>
								<td>8</td>
								
									
										
										
											<td>no</td>
										
									
								
									
										
										
											<td>no</td>
										
									
								
									
										
										
											<td>no</td>
										
									
								
									
										
										
											<td>no</td>
										
									
								
									
										
										
											<td>no</td>
										
									
								
									
										
										
											<td>no</td>
										
									
								
									
										
										
											<td>no</td>
										
									
								
									
										
										
											<td>no</td>
										
									
								
									
										
										
											<td>no</td>
										
									
								
									
										
										
											<td>no</td>
										
									
								
							</tr>
						
							<tr id="19" data-row-id="19">
								<td data-identifier="true">wow</td>
								<td>19</td>
								
									
										
										
											<td>no</td>
										
									
								
									
										
										
											<td>no</td>
										
									
								
									
										
										
											<td>no</td>
										
									
								
									
										
										
											<td>no</td>
										
									
								
									
										
										
											<td>no</td>
										
									
								
									
										
										
											<td>no</td>
										
									
								
									
										
										
											<td>no</td>
										
									
								
									
										
										
											<td>no</td>
										
									
								
									
										
										
											<td>no</td>
										
									
								
									
										
										
											<td>no</td>
										
									
								
							</tr>
						
					</table>
				</div>
				<!-- table 끝 -->
				
			</div>
		</div>
	</section>
</section>

<footer id="footer">
	Copyright &copy; 2015 Material Admin
	<ul class="f-menu">
		<li><a href="">Home</a></li>
		<li><a href="">Dashboard</a></li>
		<li><a href="">Reports</a></li>
		<li><a href="">Support</a></li>
		<li><a href="">Contact</a></li>
	</ul>
</footer>

<!-- Page Loader -->
<div class="page-loader">
	<div class="preloader pls-blue">
		<svg class="pl-circular" viewBox="25 25 50 50">
                   <circle class="plc-path" cx="50" cy="50" r="20" />
               </svg>

		<p>Please wait...</p>
	</div>
</div>

<!-- modal 내용 처리  시작 -->
<div class="modal fade" id="login-form" role="dialog">
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
						<input class="form-control" type="password" id="input-pwd" name="userPassword" placeholder="한줄 메모 입력" />
					</div>
					<button class="btn btn-primary" data-dismiss="modal" onclick="modalModify();">수정</button>
					<button type="reset" class="btn btn-warning">취소!!!</button>
				</form>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- modal 끝-->


<!-- Older IE warning message -->
<!--[if lt IE 9]>
    <div class="ie-warning">
        <h1 class="c-white">Warning!!</h1>
        <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
        <div class="iew-container">
            <ul class="iew-download">
                <li>
                    <a href="http://www.google.com/chrome/">
                        <img src="img/browsers/chrome.png" alt="">
                        <div>Chrome</div>
                    </a>
                </li>
                <li>
                    <a href="https://www.mozilla.org/en-US/firefox/new/">
                        <img src="img/browsers/firefox.png" alt="">
                        <div>Firefox</div>
                    </a>
                </li>
                <li>
                    <a href="http://www.opera.com">
                        <img src="img/browsers/opera.png" alt="">
                        <div>Opera</div>
                    </a>
                </li>
                <li>
                    <a href="https://www.apple.com/safari/">
                        <img src="img/browsers/safari.png" alt="">
                        <div>Safari</div>
                    </a>
                </li>
                <li>
                    <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                        <img src="img/browsers/ie.png" alt="">
                        <div>IE (New)</div>
                    </a>
                </li>
            </ul>
        </div>
        <p>Sorry for the inconvenience!</p>
    </div>   
<![endif]-->
    
<!-- Javascript Libraries -->
<script src="/bitin/assets/vendors/bower_components/jquery/dist/jquery.min.js"></script>
<script src="/bitin/assets/vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<script src="/bitin/assets/vendors/bower_components/flot/jquery.flot.js"></script>
<script	src="/bitin/assets/vendors/bower_components/flot/jquery.flot.resize.js"></script>
<script src="/bitin/assets/vendors/bower_components/flot.curvedlines/curvedLines.js"></script>
<script src="/bitin/assets/vendors/sparklines/jquery.sparkline.min.js"></script>
<script src="/bitin/assets/vendors/bower_components/jquery.easy-pie-chart/dist/jquery.easypiechart.min.js"></script>

<script src="/bitin/assets/vendors/bower_components/flot/jquery.flot.pie.js"></script>
<script src="/bitin/assets/vendors/bower_components/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
<script src="/bitin/assets/vendors/bower_components/flot-orderBars/js/jquery.flot.orderBars.js"></script>

<script src="/bitin/assets/vendors/bootgrid/jquery.bootgrid.updated.js"></script>
        
<!-- Placeholder for IE9 -->
<!--[if IE 9 ]>
<script src="/bitin/vendors/bower_components/jquery-placeholder/jquery.placeholder.min.js"></script>
<![endif]-->
        
<script src="/bitin/assets/vendors/bower_components/moment/min/moment.min.js"></script>
<script src="/bitin/assets/vendors/bower_components/fullcalendar/dist/fullcalendar.min.js "></script>
<script src="/bitin/assets/vendors/bower_components/simpleWeather/jquery.simpleWeather.min.js"></script>
<script src="/bitin/assets/vendors/bower_components/Waves/dist/waves.min.js"></script>
<script src="/bitin/assets/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<script src="/bitin/assets/vendors/bower_components/bootstrap-sweetalert/lib/sweet-alert.js"></script>
<script src="/bitin/assets/vendors/bower_components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>

<script src="/bitin/assets/js/flot-charts/curved-line-chart.js"></script>
<script src="/bitin/assets/js/flot-charts/line-chart.js"></script>
<script src="/bitin/assets/js/charts.js"></script>

<script src="/bitin/assets/js/charts.js"></script>
<script src="/bitin/assets/js/functions.js"></script>


 <!-- Data Table -->
<!-- 값들 O X 처리 function -->
<script>
function greenO(column, row, status){
	var userNo = row.userNo;
 	var date = column.text;
 	var userName = row.name;
 	var attdStatus = status; 
	return "<div class=\"form-group  has-feedback has-success\">"
				+"<label class=\"attd-status control-label \" for=\"inputError2\" "
					+"data-toggle=\"modal\" data-target=\"#login-form\"" //modal 설정
					+"data-temp-column-id=\""+column.id+"\"  "	//세로 어느 줄인지
					+"data-date=\""+date+"\" data-userno=\""+userNo+"\" "
					+"data-name=\""+userName+"\""
					+"data-status=\""+"yes"+"\" "
					+"onclick=\"valueGetter("+userNo+",'"+date+"');\">" 
	  			+"<i class=\"zmdi zmdi-circle-o zmdi-hc-fw f-20  \">okook</i></label>"
	  	+"</div>"; 
} 
function redX ( column, row, status) {
	var userNo = row.userNo;
 	var date = column.text;
 	var userName = row.name;
 	var attdStatus = status; 
	return "<div class=\"form-group has-error has-feedback\">"
	  +"<label class=\"attd-status control-label\" for=\"inputError2\" data-toggle=\"modal\" data-temp-column-id=\""+column.id+"\" data-target=\"#login-form\" data-date=\""+date+"\" data-userno=\""+userNo+"\" data-name=\""+userName+"\" data-status=\""+"no"+"\" onclick=\"valueGetter("+userNo+",'"+date+"');\">"
	  +"<i class=\"zmdi zmdi-close zmdi-hc-fw f-20  \"></i>nono</label>"
	  +"</div>"; 
}

</script>

<!-- 전역변수 선언-->
<script type="text/javascript">
var gDate = "abc";
var gUserNo = 0;
var gButton;
var gStatus = "";
</script>


<script type="text/javascript">
function valueGetter(userNo,date) {
	gDate=date;
	gUserNo = userNo;
} 
</script>

<!-- modal 선 처리  -->
<script type="text/javascript">
$(function(){
	$('#login-form').on('show.bs.modal', function (event) {
		var button = $(event.relatedTarget);
		gButton = button;
		
		
		var tempDate  = button.data('date');
		var tempUserNo= button.data('userno');
		var tempUserName = button.data('name');
	    var modal = $(this);
	    
	    tempDate= tempDate+"";	//string 으로 바꿈
	    console.log('2:35 '+gDate)
	    var gDateMonth = gDate.substring(0,2);
	    var gDateDay = gDate.substring(3,5);

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
	    }
	});
});
</script>

<!-- O X 처리  -->
<script type="text/javascript">
/////////////////////////////////// /////////////////////////////////// /////////////////////////////////// 
$(document).ready(
	function() {
		//Basic Example
		$("#data-table-basic").bootgrid({
			/*
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
			navigation : 1,
			
			formatters : {
				"newtest1" : function(column, row) {
					if( row.fixed1 == "yes"){	return greenO(column,row, row.fixed1);		}
					else {						return redX(column, row, row.fixed1 );		}
				},
				"newtest2" : function(column, row) {
					if( row.fixed2 == "yes"){	return greenO(column,row, row.fixed2);		}
					else {						return redX(column, row, row.fixed2 );		}
				},
				"newtest3" : function(column, row) {
					if( row.fixed3 == "yes"){	return greenO(column,row, row.fixed3);		}
					else {						return redX(column, row, row.fixed3 );		}
				},
				"newtest4" : function(column, row) {
					if( row.fixed4 == "yes"){	return greenO(column,row, row.fixed4);		}
					else {						return redX(column, row, row.fixed4 );		}
				},
				"newtest5" : function(column, row) {
					if( row.fixed5 == "yes"){	return greenO(column,row, row.fixed5);		}
					else {						return redX(column, row, row.fixed5 );		}
				},
				"newtest6" : function(column, row) {
					if( row.fixed6 == "yes"){	return greenO(column,row, row.fixed6);		}
					else {						return redX(column, row, row.fixed6 );		}
				},
				"newtest7" : function(column, row) {
					if( row.fixed7 == "yes"){	return greenO(column,row, row.fixed7);		}
					else {						return redX(column, row, row.fixed7 );		}
				},
				"newtest8" : function(column, row) {
					if( row.fixed8 == "yes"){	return greenO(column,row, row.fixed8);		}
					else {						return redX(column, row, row.fixed8 );		}
				},
				"newtest9" : function(column, row) {
					if( row.fixed9 == "yes"){	return greenO(column,row, row.fixed9);		}
					else {						return redX(column, row, row.fixed9 );		}
				},
				"newtest10" : function(column, row) {
					if( row.fixed10 == "yes"){	return greenO(column,row, row.fixed10);		}
					else {						return redX(column, row, row.fixed10 );		}
				},
				
			}
			
		});
	}
);
</script>
<!-- modal 확인 버튼 처리 -->
<script type="text/javascript">
function modalModify() {
	var modal = $('#login-form');
	if (modal.find('#modal-label1').hasClass('btn-success') ) {
		//모양 변경
		$('label[data-date='+gDate+'][data-userno='+gUserNo+'] i').addClass('zmdi-circle-o')
		$('label[data-date='+gDate+'][data-userno='+gUserNo+'] i').removeClass('zmdi-close')
		//색 변경
 		$('label[data-date='+gDate+'][data-userno='+gUserNo+']').parent().addClass('has-success');
		$('label[data-date='+gDate+'][data-userno='+gUserNo+']').parent().removeClass('has-error');
		//값 변경 ( data-status 속성 만)
		$('label[data-date='+gDate+'][data-userno='+gUserNo+']').attr("data-status","yes");
		
		gStatus = "yes"
	}else if (modal.find('#modal-label2').hasClass('btn-warning') ) {
	}else if  (modal.find('#modal-label3').hasClass('btn-danger') ) {
		$('label[data-date='+gDate+'][data-userno='+gUserNo+'] i').addClass('zmdi-close')
		$('label[data-date='+gDate+'][data-userno='+gUserNo+'] i').removeClass('zmdi-circle-o')
		$('label[data-date='+gDate+'][data-userno='+gUserNo+']').parent().addClass('has-error');
		$('label[data-date='+gDate+'][data-userno='+gUserNo+']').parent().removeClass('has-success');
		$('label[data-date='+gDate+'][data-userno='+gUserNo+']').attr("data-status","no");
		gStatus = "no"
	}else if (modal.find('#modal-label4').hasClass('btn-info') ) {
	}else {
		return;
	}
	var columnId = gButton.data('temp-column-id');
	console.log(gDate+'일  '+ gUserNo+'번 유저의 수업상태를 '+ gStatus +"로 바꾼다.")
	
	var parsedDate = gDate.substring(0,2)+"M"+gDate.substring(3,5)+"D";
	if( gDate.length>6) parsedDate += gDate.substring(7);
	
	$.ajax({
		url:"/bitin/webapi/attd/edit-status",
		type:"get",
		dataType:"json",
		data:"classDate="+parsedDate+"&userNo="+gUserNo+"&attdStatus="+gStatus,
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
	var modal = $('#login-form');
    modal.find('#modal-label1').addClass('btn-success');
	modal.find('#modal-label2').removeClass('btn-warning');
	modal.find('#modal-label3').removeClass('btn-danger');
	modal.find('#modal-label4').removeClass('btn-info')
}
function modalClick_2() {
	var modal = $('#login-form');
    modal.find('#modal-label2').addClass('btn-warning');		
    modal.find('#modal-label1').removeClass('btn-success');
	modal.find('#modal-label3').removeClass('btn-danger');
	modal.find('#modal-label4').removeClass('btn-info');
}	 
function modalClick_3() {
	var modal = $('#login-form');
    modal.find('#modal-label3').addClass('btn-danger');		
	modal.find('#modal-label1').removeClass('btn-success');
	modal.find('#modal-label2').removeClass('btn-warning');
	modal.find('#modal-label4').removeClass('btn-info');
}	 
function modalClick_4() {
	var modal = $('#login-form');
    modal.find('#modal-label4').addClass('btn-info');
	modal.find('#modal-label1').removeClass('btn-success');
	modal.find('#modal-label2').removeClass('btn-warning');
	modal.find('#modal-label3').removeClass('btn-danger');
}

</script>
</body>
</html>