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

   <script src="/bitin/assets/js/functions.js"></script>
   <script src="/bitin/assets/js/demo.js"></script>


</head>
 <body>
        <c:import url="/WEB-INF/views/include/navi.jsp"></c:import><br />
        <section id="main">
            <section id="container">
                <div class="container">
                    <div class="card m-b-0" id="messages-main">
<!--                         <div class="ms-body"> -->
                            <div class="listview lv-message">
                                <div class="lv-header-alt clearfix">
                                    <div class="lvh-label hidden-xs">
                                        <div class="lv-avatar pull-left">
                                            <img src="/bitin/assets/img/profile-pics/1.jpg" alt="">
                                        </div>
                                        <span class="c-black">David Parbell</span>
                                    </div>
                                    
                                    <ul class="lv-actions actions">
                                        <li>
                                            <a href="">
                                                <i class="zmdi zmdi-delete"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                <i class="zmdi zmdi-check"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                <i class="zmdi zmdi-time"></i>
                                            </a>
                                        </li>
                                        <li class="dropdown">
                                            <a href="" data-toggle="dropdown" aria-expanded="true">
                                                <i class="zmdi zmdi-sort"></i>
                                            </a>
                                
                                            <ul class="dropdown-menu dropdown-menu-right">
                                                <li>
                                                    <a href="">Latest</a>
                                                </li>
                                                <li>
                                                    <a href="">Oldest</a>
                                                </li>
                                            </ul>
                                        </li>                             
                                        <li class="dropdown">
                                            <a href="" data-toggle="dropdown" aria-expanded="true">
                                                <i class="zmdi zmdi-more-vert"></i>
                                            </a>
                                
                                            <ul class="dropdown-menu dropdown-menu-right">
                                                <li>
                                                    <a href="">Refresh</a>
                                                </li>
                                                <li>
                                                    <a href="">Message Settings</a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                    
                                    
                             
                             
                             
                             
<script>
var authUser = "${authUser.userNo }";
var toUserNo = "${toUserNo}";
var iCounter = 1;
var lastChat = "${lastTime}";
$(function() {
	$(document).ready(function(){
			 timer = setInterval( function () {
				 $.ajax ({
					 url : "/bitin/chatting/list2/"+toUserNo,
					 cache : false,
					 type : "post",
					 success : function (response) {
						 if( response.result == "fail" ) {				
								console.error( response.message );
								return;
							}
							//rendering
						
							
// 							console.log("timer : "+lastChat+ "ajaxtimer : "+response.data2);
							
							console.log( response.data );
							if( iCounter == 1 ){
								var $listDiv2 = $( "#chatlist" );
								 	$listDiv2.empty();
									$.each( response.data, function(index, data){
										//console.log( data );
										insertMessage( data, false );
									});
								iCounter ++;
							}
							if( lastChat != response.data2) {
								var $listDiv2 = $( "#chatlist" );
								 	$listDiv2.empty();
									$.each( response.data, function(index, data){
										//console.log( data );
										insertMessage( data, false );
										function scrollToBottom() {
											$('html, body').animate({scrollTop:$(document).height()}, 'slow');
										}
										scrollToBottom();
									});
								lastChat = response.data2;
							}
						}
// 						error: function( jqXHR, status, e ){
// 							console.error( status + " : " + e );
// 						}
				 });
			 }, 500);
	});
});


function scrollToBottom() {
	$('html, body').animate({scrollTop:$(document).height()}, 'slow');
}




var insertMessage = function( data, isHead ) {
	var temp2;
	
	console.log(authUser);
	console.log(data.fromUserNo);
	if(authUser == data.fromUserNo  ){
		temp2 = 
			"<div id='chatlist'  class='lv-body'>"	
			+"<div class='lv-item media right'>"
		+"<div class='lv-avatar pull-right'>"
			+"<img src='/bitin/assets/img/profile-pics/8.jpg' alt=''></div>"
		+"<div class='media-body'><div class='ms-item'>"+data.message+"</div>"
			+"<small class='ms-date'><i class='zmdi zmdi-time'></i>"
				+data.createdDate+"</small></div></div>";
	}else {
		 temp2 = 
		"<div id='chatlist'  class='lv-body'>"
		+"<div class='lv-item media'>" 
		+ "<div class='lv-avatar pull-left'>"
		+ "<img src='/bitin/assets/img/profile-pics/1.jpg' alt=''>"
		+"</div>"
		+"<div class='media-body'>"
		+"<div class='ms-item'>"+data.message+"</div>"
		+"<small class='ms-date'><i class='zmdi zmdi-time'></i>"
		+data.createdDate+"</small></div></div>";
	}
// 	var scrollBottom = $('html, body').stop().animate( { scrollTop : '+=300' } );
	var $listDiv = $( "#chatlist" );
	console.log( temp2 );
// 	$listDiv.empty();
	$listDiv.append( temp2 );
}
</script>
                             
                             
                             
                             
                             
                             
                             
                             
                             
                                    
                                    
                                    
                        <div   class="lv-body">	
                   <div style="overflow:scroll; height:650px; padding:1px;" >
<!--                    $('html, body').stop().animate( { scrollTop : '-=300' } ); -->
<!--      <div style="overflow:scroll; width:300px; height:150px; padding:10px; background-color:gold;"> -->
                
                   <div id="chatlist">
							<c:forEach items='${chatlist }' var='vo' varStatus='status'>
							<div >
								<c:choose>
									<c:when test='${authUser.userNo == vo.fromUserNo }'>						
										<div class="lv-item media right">
											<div class="lv-avatar pull-right">
												<img src="/bitin/assets/img/profile-pics/8.jpg" alt="">
											</div>
											<div class="media-body">
												<div class="ms-item">${vo.message }</div>
												<small class="ms-date"><i class="zmdi zmdi-time"></i>${vo.createdDate }</small>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="lv-item media">
											<div class="lv-avatar pull-left">
												<img src="/bitin/assets/img/profile-pics/1.jpg" alt="">
											</div>
											<div class="media-body">
												<div class="ms-item" >${vo.message }</div>
												<small class="ms-date" ><i class="zmdi zmdi-time"></i>
													${vo.createdDate }</small>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
								</div>
							</c:forEach>
							</div>
                       </div>
						</div>
                                
                                
                                
                                
                                
                        <div class="lv-footer ms-reply">
							<textarea name="message" id="chatting-message" placeholder="What's on your mind..."></textarea>
							<button id="btn-add">  <i class="zmdi zmdi-mail-send"></i>  </button>
						</div>	
                            </div>
                        </div>
                    </div>
<!--              </div> -->
            </section>
        </section>




   <!-- Page Loader -->
   <div class="page-loader">
      <div class="preloader pls-blue">
         <svg class="pl-circular" viewBox="25 25 50 50">
                    <circle class="plc-path" cx="50" cy="50" r="20" />
                </svg>

         <p>Please wait...</p>
      </div>
   </div>
<br /><br />
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

<script>
var authUser = "${authUser.userNo }";
var toUserNo = "${toUserNo}";
var $listDiv2 = $( "#chatting-message" );
$(function() {
	$("#btn-add").click( function() {
		//이름, 비밀번호, content 가져오기
		var message = $( "#chatting-message" ).val();
			
		//ajax
		$.ajax( {
			url : "/bitin/chatting/send",
			type: "post",
			data: "message=" + message + "&fromUserNo=" + authUser + "&toUserNo=" + toUserNo,
// 			toUserNo 추가해야됨
			dataType: "json",
			success: function( response ){
				if( response.result == "fail" ) {
					console.error( response.message );
					return;
				}
				console.log( response );		
			 	$listDiv2.val('');
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