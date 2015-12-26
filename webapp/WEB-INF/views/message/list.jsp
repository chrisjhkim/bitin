<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie9"><![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Material Admin</title>

<!-- Vendor CSS -->
<link href="/bitin/assets/vendors/bower_components/animate.css/animate.min.css"
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

<!-- Javascript Libraries -->
	<script src="/bitin/assets/vendors/bower_components/jquery/dist/jquery.min.js"></script>
	<script
		src="/bitin/assets/vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<script
		src="/bitin/assets/vendors/bower_components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="/bitin/assets/vendors/bower_components/Waves/dist/waves.min.js"></script>
	<script src="/bitin/assets/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
	<script
		src="/bitin/assets/vendors/bower_components/bootstrap-sweetalert/lib/sweet-alert.min.js"></script>

	<script src="/bitin/assets/js/functions.js"></script>
	<script src="/bitin/assets/js/demo.js"></script>

<body>
	<c:import url="/WEB-INF/views/include/navi.jsp"></c:import>


	<section id="content">
		<div class="container">
			<div class="block-header">
				<h2>Messages</h2>
			</div>

			<div class="card m-b-0" id="messages-main">

				<div class="ms-menu">
					<div class="ms-block">
						<div class="ms-user">
							<img src="img/profile-pics/1.jpg" alt="">
							<div>
								Signed in as <br /> m-hollaway@gmail.com
							</div>
						</div>
					</div>

					<div class="ms-block">
						<div class="dropdown">
							<a class="btn btn-primary btn-block" href=""
								data-toggle="dropdown">Messages <i class="caret m-l-5"></i></a>

							<ul class="dropdown-menu dm-icon w-100">
								<li><a href=""><i class="zmdi zmdi-email"></i> Messages</a></li>
								<li><a href=""><i class="zmdi zmdi-account"></i>
										Contacts</a></li>
								<li><a href=""><i
										class="zmdi zmdi-format-list-bulleted"> </i>Todo Lists</a></li>
							</ul>
						</div>
					</div>

					<div class="listview lv-user m-t-20">
						<div class="lv-item media active">
							<div class="lv-avatar pull-left">
								<img src="img/profile-pics/1.jpg" alt="">
							</div>
							<div class="media-body">
								<div class="lv-title">Davil Parnell</div>
								<div class="lv-small">Fierent fastidii recteque ad pro</div>
							</div>
						</div>

						<div class="lv-item media">
							<div class="lv-avatar bgm-red pull-left">a</div>
							<div class="media-body">
								<div class="lv-title">Ann Watkinson</div>
								<div class="lv-small">Cum sociis natoque penatibus</div>
							</div>
						</div>

						<div class="lv-item media">
							<div class="lv-avatar bgm-orange pull-left">m</div>
							<div class="media-body">
								<div class="lv-title">Marse Walter</div>
								<div class="lv-small">Suspendisse sapien ligula</div>
							</div>
						</div>

						<div class="lv-item media">
							<div class="lv-avatar pull-left">
								<img src="img/profile-pics/2.jpg" alt="">
							</div>
							<div class="media-body">
								<div class="lv-title">Jeremy Robbins</div>
								<div class="lv-small">Phasellus porttitor tellus nec</div>
							</div>
						</div>

						<div class="lv-item media">
							<div class="lv-avatar pull-left">
								<img src="img/profile-pics/3.jpg" alt="">
							</div>
							<div class="media-body">
								<div class="lv-title">Reginald Horace</div>
								<div class="lv-small">Quisque consequat arcu eget</div>
							</div>
						</div>

						<div class="lv-item media">
							<div class="lv-avatar bgm-cyan pull-left">s</div>
							<div class="media-body">
								<div class="lv-title">Shark Henry</div>
								<div class="lv-small">Nam lobortis odio et leo maximu</div>
							</div>
						</div>

						<div class="lv-item media">
							<div class="lv-avatar bgm-purple pull-left">p</div>
							<div class="media-body">
								<div class="lv-title">Paul Van Dack</div>
								<div class="lv-small">Nam posuere purus sed velit auctor
									sodales</div>
							</div>
						</div>

						<div class="lv-item media">
							<div class="lv-avatar pull-left">
								<img src="img/profile-pics/4.jpg" alt="">
							</div>
							<div class="media-body">
								<div class="lv-title">James Anderson</div>
								<div class="lv-small">Vivamus imperdiet sagittis quam</div>
							</div>
						</div>

						<div class="lv-item media">
							<div class="lv-avatar pull-left">
								<img src="img/profile-pics/6.jpg" alt="">
							</div>
							<div class="media-body">
								<div class="lv-title">Kane Williams</div>
								<div class="lv-small">Suspendisse justo nulla luctus nec</div>
							</div>
						</div>
					</div>


				</div>

				<div class="ms-body">
					<div class="listview lv-message">
						<div class="lv-header-alt clearfix">
							<div id="ms-menu-trigger">
								<div class="line-wrap">
									<div class="line top"></div>
									<div class="line center"></div>
									<div class="line bottom"></div>
								</div>
							</div>

							<div class="lvh-label hidden-xs">
								<div class="lv-avatar pull-left">
									<img src="img/profile-pics/1.jpg" alt="">
								</div>
								<span class="c-black">David Parbell</span>
							</div>

							<ul class="lv-actions actions">
								<li><a href=""> <i class="zmdi zmdi-delete"></i>
								</a></li>
								<li><a href=""> <i class="zmdi zmdi-check"></i>
								</a></li>
								<li><a href=""> <i class="zmdi zmdi-time"></i>
								</a></li>
								<li class="dropdown"><a href="" data-toggle="dropdown"
									aria-expanded="true"> <i class="zmdi zmdi-sort"></i>
								</a>

									<ul class="dropdown-menu dropdown-menu-right">
										<li><a href="">Latest</a></li>
										<li><a href="">Oldest</a></li>
									</ul></li>
								<li class="dropdown"><a href="" data-toggle="dropdown"
									aria-expanded="true"> <i class="zmdi zmdi-more-vert"></i>
								</a>

									<ul class="dropdown-menu dropdown-menu-right">
										<li><a href="">Refresh</a></li>
										<li><a href="">Message Settings</a></li>
									</ul></li>
							</ul>
						</div>



<script>
$(function() {
	$(document).ready(function(){
			 timer = setInterval( function () {
				 $.ajax ({
					 url : "/bitin/chatting/list2",
					 cache : false,
					 type : "post",
					 success : function (response) {
						 if( response.result == "fail" ) {				
								console.error( response.message );
								return;
							}
							//rendering
							console.log( response.data );
							$.each( response.data, function(index, data){
								//console.log( data );
								insertMessage( data, false );
							});
						}
// 						error: function( jqXHR, status, e ){
// 							console.error( status + " : " + e );
// 						}
				 });
			 }, 2000);
	});
});




var insertMessage = function( data, isHead ) {
	var temp2;
	
	
	if(authUser.userNo == data.fromUserNo  ){
		temp2 = 
			"<div id='chatlist'  class='lv-body'>"	
			+"<div class='lv-item media right'>"
		+"<div class='lv-avatar pull-right'>"
			+"<img src='img/profile-pics/8.jpg' alt=''></div>"
		+"<div class='media-body'><div class='ms-item'>"+data.message+"</div>"
			+"<small class='ms-date'><i class='zmdi zmdi-time'></i>"
				+data.createdDate+"</small></div></div>";
	}else {
		 temp2 = 
		"<div id='chatlist'  class='lv-body'>"	
		+"<div class='lv-item media'>" 
		+ "<div class='lv-avatar pull-left'>"
		+ "<img src='img/profile-pics/1.jpg' alt=''>"
		+"</div>"
		+"<div class='media-body'>"
		+"<div class='ms-item'>"+data.message+"</div>"
		+"<small class='ms-date'><i class='zmdi zmdi-time'></i>"
		+data.createdDate+"</small></div></div>";
	}
	
	var $listDiv = $( "#chatlist" );
	console.log( temp2 );
	$listDiv.html( temp2 );
	$listDiv.append( temp2 );
}
</script>
			<div  id="chatlist" class="lv-body">	
<%-- 						<c:forEach items='${chatlist }' var='vo' varStatus='status'> --%>
<!-- 						<div > -->
							<c:choose>
								<c:when test='${authUser.userNo == vo.fromUserNo }'>						
									<div class="lv-item media right">
										<div class="lv-avatar pull-right">
											<img src="img/profile-pics/8.jpg" alt="">
										</div>
										<div class="media-body">
											<div class="ms-item">${vo.message }</div>
											<small class="ms-date"><i class="zmdi zmdi-time"></i>
												${vo.createdDate }</small>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="lv-item media">
										<div class="lv-avatar pull-left">
											<img src="img/profile-pics/1.jpg" alt="">
										</div>
										<div class="media-body">
											<div class="ms-item">${vo.message }</div>
											<small class="ms-date"><i class="zmdi zmdi-time"></i>
												${vo.createdDate }</small>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
<!-- 							</div> -->
<%-- 						</c:forEach> --%>
						</div>
						<div class="lv-footer ms-reply">
							<textarea name="message" id="chatting-message" placeholder="What's on your mind..."></textarea>
							<button id="btn-add">  <i class="zmdi zmdi-mail-send"></i>  </button>
						</div>					
					
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

	
<script>
var authUser = "${authUser.userNo }";
$(function() {
	$("#btn-add").click( function() {
		//이름, 비밀번호, content 가져오기
		var message = $( "#chatting-message" ).val();
		console.log( "1231444" );	
		
		
		//ajax
		$.ajax( {
			url : "/bitin/chatting/send",
			type: "post",
			
			data: "message=" + message + "&fromUserNo=" + authUser,
// 			toUserNo 추가해야됨
			dataType: "json",
			success: function( response ){
				if( response.result == "fail" ) {				
					console.error( response.message );
					return;
				}
				console.log( response );			
				//insertMessage( response.data, true );
			},
			error: function( jqXHR, status, e ){
				console.error( status + " : " + e );
			}
		});
	});
});
</script>
</body>
</html>