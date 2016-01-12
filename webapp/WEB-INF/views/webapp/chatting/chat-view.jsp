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
<title>Material Admin</title>

<!-- Vendor CSS -->
<link href="/bitin/assets/vendors/bower_components/animate.css/animate.min.css" rel="stylesheet">
<link href="/bitin/assets/vendors/bower_components/bootstrap-sweetalert/lib/sweet-alert.css" rel="stylesheet">
<link href="/bitin/assets/vendors/bower_components/material-design-iconic-font/dist/css/material-design-iconic-font.min.css" rel="stylesheet">
<link href="/bitin/assets/vendors/bower_components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.min.css" rel="stylesheet">

<!-- CSS -->
<link href="/bitin/assets/css/app.min.1.css" rel="stylesheet">
<link href="/bitin/assets/css/app.min.2.css" rel="stylesheet">



<!-- Javascript Libraries -->
<script src="/bitin/assets/vendors/bower_components/jquery/dist/jquery.min.js"></script>
<script src="/bitin/assets/vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<script src="/bitin/assets/vendors/bower_components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="/bitin/assets/vendors/bower_components/Waves/dist/waves.min.js"></script>
<script src="/bitin/assets/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<script src="/bitin/assets/vendors/bower_components/bootstrap-sweetalert/lib/sweet-alert.min.js"></script>

<script src="/bitin/assets/js/functions.js"></script>
</head>

<body>
<c:import url="/WEB-INF/views/webapp/include/webapp-navi.jsp"></c:import>
<br />
<section id="main">
	<section id="container" style="margin-top: -25px; margin-bottom:-5px;">
		<div class="card m-b-0" id="messages-main">
			<div class="listview lv-message">
				<div class="lv-header-alt clearfix">
					<div class="lvh-label hidden-sm">
						<div class="lv-avatar pull-left">
							<img src="/bitin/assets/img/profile-pics/${otherUser.userNo }.jpg" alt="">
						</div>
						<span class="c-black">${otherUser.userName }님과 대화</span>
					</div>

					<ul class="lv-actions actions">
						<li class="dropdown">
							<a href="" data-toggle="dropdown" aria-expanded="true"> <i class="zmdi zmdi-more-vert"></i></a>
							<ul class="dropdown-menu dropdown-menu-right">
								<li><a href="#">새로고침</a></li>
								<li><a href="#">채팅 나가기</a></li>
							</ul>
						</li>
					</ul>
				</div>

<!-- 				채팅내용 -->
				<div  class="lv-body">
					<div id="scrollBox" style="overflow: scroll; height: 330px; padding: 1px;">
						
						
						<div id="chatlist">
							<c:forEach items='${chatlist }' var='vo' varStatus='status'>
								<div>
									<c:choose>
										<c:when test='${fakeAuthUser.userNo == vo.fromUserNo }'>
											<div class="lv-item media right">
												<div class="lv-avatar pull-right">
													<img src="/bitin/assets/img/profile-pics/${fakeAuthUser.userNo }.jpg" alt="">
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
													<img src="/bitin/assets/img/profile-pics/${otherUser.userNo }.jpg" alt="">
												</div>
												<div class="media-body">
													<div class="ms-item">${vo.message }</div>
													<small class="ms-date"><i class="zmdi zmdi-time"></i>${vo.createdDate }</small>
												</div>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				


				<div class="lv-footer ms-reply" >
					<textarea name="message" id="chatting-message" placeholder="내용을 입력하세요..chat" ></textarea>
					<button id="btn-add" onclick="send();">
						<i class="zmdi zmdi-mail-send"></i>
					</button>
				</div>
				
			</div>
		</div>
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
<br />
<br />
<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>



</body>
<script >
	var objDiv = document.getElementById("scrollBox");
	objDiv.scrollTop = objDiv.scrollHeight;
	//이거대신 현준이거 써서 뿌려주기 var textarea = document.getElementById("messageWindow");
	var newInputMessage = document.getElementById('chatting-message');
	var webSocket = new WebSocket('ws://192.168.1.20:8088/bitin/broadcasting');
	// 	이거 192.168. 으로 안하고 localhost 하면 webapp 에서 안될듯 ( mobile chrome 에서는 안먹힘 )
	var now = new Date();
	var nowAll = now.getFullYear() + "-" + (now.getMonth() + 1) + "-" + now.getDate() + " " + now.getHours() + ":" + now.getMinutes() + ":" + now.getSeconds() + " ";
	
	
	webSocket.onerror = function(event) {
		onError(event)
	};
	function onError(event) {
		alert('콘솔창 확인');
		console.log(event.data);
		console.log(event);
		alert(event.data);
		alert(event);
	}
	
	// 	접속
	webSocket.onopen = function(event) {
		onOpen(event)
	};
	function onOpen(event) {
		//굳이 접속 알람 띄워야 하나?
		//textarea.value += "연결 성공\n";
	}
	
	// 	메시지받기
	webSocket.onmessage = function(event) {
		onMessage(event)
	};
	function onMessage(event) {
		// 받은 메시지 뿌려주기 - 현준이꺼
		//textarea.value += "상대 : " + event.data + "\n";
		
		var newHtml; 
		newHtml ="<div id='chatlist'  class='lv-body'>"
					+"<div class='lv-item media'>"   //TODO : media left 라고 되있어야 되는거 아닌가? 보낼때 right를 지워야되는건가??
						+"<div class='lv-avatar pull-left'>"
							+"<img src='/bitin/assets/img/profile-pics/${otherUser.userNo}.jpg' alt=''>"
						+"</div>"
						+"<div class='media-body'>"
							+"<div class='ms-item'>" + event.data + "</div>"
							+"<small class='ms-date'><i class='zmdi zmdi-time'></i>" + nowAll + "</small>"
						+"</div>"
					+"</div>"
				+"</div>";
		//TODO: ajax 로 unread table 지우기
		$.ajax({
			url : "/bitin/webapp-api/delete-unread-count",
			type : "post",
			data : "myUserNo=${fakeAuthUser.userNo}"
				 + "&otherUserNo=${otherUser.userNo}",
			dataType : "json",
			success : function(response) {
				if (response.result == "fail") {
					console.error(response.message);
					return;
				}
 				console.log("delete-unread-count ajax success!")
// 				console.log(response);
			},
			error : function(jqXHR, status, e) {
				console.error(status + " : " + e);
			}
		});
		// 이 jsp로 오는 컨트롤러에서도 지우기
		var $listDiv = $("#chatlist");
		$listDiv.append(newHtml);
		
		var objDiv = document.getElementById("scrollBox");
        objDiv.scrollTop = objDiv.scrollHeight;
	}
	
	// 	메시지 보내기	
	function send() {
		// 보낸 메시지 뿌려주기 - 현준이꺼
		//textarea.value += "나 : " + inputMessage.value + "\n";
		if(newInputMessage.value == ""){
			return;
		}
		webSocket.send(newInputMessage.value);
		console.log('send!! : '+newInputMessage.value);
		
		$.ajax({
			url : "/bitin/webapp-api/send",
			type : "post",
			data : "message=" + newInputMessage.value
				 + "&fromUserNo=${fakeAuthUser.userNo}"
				 + "&toUserNo=${otherUser.userNo}",
			dataType : "json",
			success : function(response) {
				if (response.result == "fail") {
					console.error(response.message);
					return;
				}
 				console.log("send ajax success!")
// 				console.log(response);
			},
			error : function(jqXHR, status, e) {
				console.error(status + " : " + e);
			}
		});
		
		
		var newHtml; 
		newHtml ="<div id='chatlist'  class='lv-body'>"
					+"<div class='lv-item media right'>"
						+"<div class='lv-avatar pull-right'>"
							+"<img src='/bitin/assets/img/profile-pics/${fakeAuthUser.userNo}.jpg' alt=''>"
						+"</div>"
						+"<div class='media-body'>"
							+"<div class='ms-item'>" + newInputMessage.value + "</div>"
							+"<small class='ms-date'><i class='zmdi zmdi-time'></i>" + nowAll + "</small>"
						+"</div>"
					+"</div>"
				+"</div>";
		newInputMessage.value = "";
		var $listDiv = $("#chatlist");
		$listDiv.append(newHtml);
		
		var objDiv = document.getElementById("scrollBox");
        objDiv.scrollTop = objDiv.scrollHeight;
	}
</script>
</html>