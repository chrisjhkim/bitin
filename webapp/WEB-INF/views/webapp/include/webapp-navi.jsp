<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
pageContext.setAttribute("cr", "\r"); 
pageContext.setAttribute("lf", "\n"); 
%> 
${fn:replace(fn:replace(string, cr, ""), lf, "")}
	
<header id="header" class="clearfix" data-current-skin="blue">
	<ul class="header-inner">
		<li id="menu-trigger" data-trigger="#sidebar" class="logo hidden-sm">
			<img src="/bitin/assets/img/demo/logo.png" alt="">
		</li>
		<li class="pull-right">
			<ul class="top-menu">

				<li id="top-search"><a href=""><i
						class="tm-icon zmdi zmdi-search"></i></a></li>

				<li class="dropdown">
					<a data-toggle="dropdown" href="" >
						<i class="tm-icon zmdi zmdi-email"></i>
						<c:if test="${naviDataMap.totalUnreadChat > 0 }">
							<i class="tmn-counts" id="message-counter">${naviDataMap.totalUnreadChat }</i>
						</c:if>
					</a>
					
					<div class="dropdown-menu dropdown-menu-lg pull-right">
						<div class="listview">
							<div class="lv-header">Messages</div>
							<div class="lv-body ">
								<c:forEach items="${naviDataMap.recentUnreadChatList }" var='vo'>
									<a class="lv-item bgm-gray" href="/bitin/webapp/chat-view?myNo=${fakeAuthUser.userNo }&otherNo=${vo.FROM_USER_NO}">
										<div class="media ">
											<div class="pull-left">
												<img class="lv-img-sm" src="/bitin/assets/img/profile-pics/${vo.FROM_USER_NO}.jpg" alt="">
											</div>
											<div class="media-body">
												<div class="lv-unread">${vo.COUNTER }</div>
												<div class="lv-title">${vo.FROM_USER_NAME }</div>
												<small class="lv-small">${vo.MESSAGE }</small>
											</div>
										</div>
									</a> 
								</c:forEach>
								<c:forEach items="${naviDataMap.recentReadChatList }" var='vo'>
									<a class="lv-item " href="/bitin/webapp/chat-view?myNo=${fakeAuthUser.userNo }&otherNo=${vo.FROM_USER_NO}">
										<div class="media ">
											<div class="pull-left">
												<img class="lv-img-sm" src="/bitin/assets/img/profile-pics/${vo.FROM_USER_NO}.jpg" alt="">
											</div>
											<div class="media-body">
												<div class="lv-title">${vo.FROM_USER_NAME }</div>
												<small class="lv-small">${vo.MESSAGE }</small>
											</div>
										</div>
									</a> 
								</c:forEach>
								
								
							</div>
							<a class="lv-footer" href="">View All</a>
						</div>
					</div></li>
				<li class="dropdown">
					<a data-toggle="dropdown" href="">
						<i class="tm-icon zmdi zmdi-notifications"></i>
						<c:if test="${naviDataMap.totalUnreadBoard  > 0 }">
							<i class="tmn-counts" id="board-all-read">${naviDataMap.totalUnreadBoard }</i>
						</c:if>
					</a>
					<div class="dropdown-menu dropdown-menu-lg pull-right">
						<div class="listview" id="notifications">
							<div class="lv-header">
								Notification

								<ul class="actions">
									<li class="dropdown"><a href="" data-clear="notification">
											<i class="zmdi zmdi-check-all"></i>
									</a></li>
								</ul>
							</div>
						<!--	board 목록 게시판.  -->
							<div class="lv-body">
								<c:forEach items="${naviDataMap.recentUnreadBoardList }" var='vo'>
									<a href="/bitin/webapp/board/list?userNo=${fakeAuthUser.userNo}&boardNo=${vo.BOARD_NO}">
										<div class="lv-item bgm-lightblue"  >
											<div class="media">
												<div class="pull-left">
													<img class="lv-img-sm" src="/bitin/assets/img/profile-pics/${vo.USER_NO }.jpg" alt="">
												</div>
												<div class="media-body">
													<div class="lv-unread">${vo.UNREAD_COUNT }</div>
													<div class="lv-title">${vo.BOARD_NAME }</div>
													<small class="lv-small">작성자: TODO</small>
													<small class="lv-small">${vo.TITLE }</small>
												</div>
											</div>
										</div>
									</a>
								</c:forEach>
								<c:forEach items="${naviDataMap.recentReadBoardList }" var='vo'>
									<a href="/bitin/webapp/board/list?userNo=${fakeAuthUser.userNo}&boardNo=${vo.BOARD_NO}">
										<div class="lv-item" >
											<div class="media">
												<div class="pull-left">
													<img class="lv-img-sm" src="/bitin/assets/img/profile-pics/${vo.USER_NO }.jpg" alt="">
												</div>
												<div class="media-body">
													<div class="lv-title">${vo.BOARD_NAME }</div>
													<small class="lv-small">작성자: TODO</small>
													<small class="lv-small">${vo.TITLE }</small>
												</div>
											</div>
										</div>
									</a>
								</c:forEach>
							</div>

							<div class="lv-footer" onclick="boardAllRead();"><button class="btn btn-primary">모두 읽음으로 표시</button></div>
						</div>
					</div>
				</li>
				<li class="dropdown hidden-xs"><a data-toggle="dropdown"
					href=""> <i class="tm-icon zmdi zmdi-view-list-alt"></i> <i
						class="tmn-counts">2</i>
				</a>
					<div class="dropdown-menu pull-right dropdown-menu-lg">
						<div class="listview">
							<div class="lv-header">Tasks</div>
							<div class="lv-body">
								<div class="lv-item">
									<div class="lv-title m-b-5">HTML5 Validation Report</div>

									<div class="progress">
										<div class="progress-bar" role="progressbar"
											aria-valuenow="95" aria-valuemin="0" aria-valuemax="100"
											style="width: 95%">
											<span class="sr-only">95% Complete (success)</span>
										</div>
									</div>
								</div>
								<div class="lv-item">
									<div class="lv-title m-b-5">Google Chrome Extension</div>

									<div class="progress">
										<div class="progress-bar progress-bar-success"
											role="progressbar" aria-valuenow="80" aria-valuemin="0"
											aria-valuemax="100" style="width: 80%">
											<span class="sr-only">80% Complete (success)</span>
										</div>
									</div>
								</div>
								<div class="lv-item">
									<div class="lv-title m-b-5">Social Intranet Projects</div>

									<div class="progress">
										<div class="progress-bar progress-bar-info" role="progressbar"
											aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
											style="width: 20%">
											<span class="sr-only">20% Complete</span>
										</div>
									</div>
								</div>
								<div class="lv-item">
									<div class="lv-title m-b-5">Bootstrap Admin Template</div>

									<div class="progress">
										<div class="progress-bar progress-bar-warning"
											role="progressbar" aria-valuenow="60" aria-valuemin="0"
											aria-valuemax="100" style="width: 60%">
											<span class="sr-only">60% Complete (warning)</span>
										</div>
									</div>
								</div>
								<div class="lv-item">
									<div class="lv-title m-b-5">Youtube Client App</div>

									<div class="progress">
										<div class="progress-bar progress-bar-danger"
											role="progressbar" aria-valuenow="80" aria-valuemin="0"
											aria-valuemax="100" style="width: 80%">
											<span class="sr-only">80% Complete (danger)</span>
										</div>
									</div>
								</div>
							</div>

							<a class="lv-footer" href="">View All</a>
						</div>
					</div></li>
				<li class="hidden-sm" id="chat-trigger" data-trigger="#chat">
					<a href="">
						<i class="tm-icon zmdi zmdi-comment-alt-text"></i>
					</a>
				</li>
			</ul>
		</li>
	</ul>


	<!-- Top Search Content -->
	<div id="top-search-wrap">
		<div class="tsw-inner">
			<i id="top-search-close" class="zmdi zmdi-arrow-left"></i> <input
				type="text">
		</div>
	</div>
</header>


<section id="main" data-layout="layout-1">
	<aside id="sidebar" class="sidebar c-overflow">
		<div class="profile-menu">
			<a href="">
				<div class="profile-pic">
					<img src="/bitin/assets/img/profile-pics/${fakeAuthUser.userNo }.jpg" alt="">
				</div>

				<div class="profile-info">
					${fakeAuthUser.userName  } 님이 접속중!</i>
				</div>
			</a>

			<ul class="main-menu">
				<li><a href="profile-about.html"><i
						class="zmdi zmdi-account"></i> 내 정보</a></li>
				<c:if test="${fakeAuthUser == null }"><li><a href="/bitin/loginform"><i class="zmdi zmdi-time-restore"></i> Log-in</a></li></c:if>
				<li><a href="/bitin/user/logout"><i
						class="zmdi zmdi-time-restore"></i> Log-out</a></li>
			</ul>
		</div>

		<ul class="main-menu">
			<!--  게시판 메뉴 -->
			<li class="active"><a href="/bitin/webapp/index?id=${fakeAuthUser.userId}"><i class="zmdi zmdi-home"></i> 메인 페이지</a></li>

<%-- 			<li><a href="/bitin/webapp/chart?userNo=${fakeAuthUser.userNo }"><i class="zmdi zmdi-calendar"></i>수강 등록</a></li> --%>
			
			<li class="sub-menu">
				<a href="form-examples.html"><i class="zmdi zmdi-menu"></i>수업 선택</a>
				<ul>
					<c:forEach items='${naviDataMap.classList}' var='vo' varStatus='status'>
						<li class="sub-menu"><a href="/bitin/board/list?classNo=${vo.CLASSNO }&userNo=${fakeAuthUser.userNo}">${vo.CLASSNAME }</a>
							<ul>
								<c:forEach items="${vo.boardList }" var="boardVo">
									<li><a href="/bitin/webapp/board/list?userNo=${fakeAuthUser.userNo}&boardNo=${boardVo.BOARDNO}">${boardVo.BOARDNAME }!</a></li>
								</c:forEach>
								<li><a href="/bitin/webapp/attd?userId=${fakeAuthUser.userId}&classNo=${vo.CLASSNO}">${vo.CLASSNAME }출결 상황</a></li>
								<%-- <li><a href="/bitin/chris/main?classNo=${vo.CLASSNO }&userNo=${fakeAuthUser.userNo}">${vo.CLASSNAME }출결 상황</a></li> --%>
							</ul>
						</li>
					</c:forEach>
				</ul>
			</li>
		</ul>
	</aside>


	<!-- 우측 사이드 뷰 테스트 -->
	<!-- 우측 사이드 뷰 테스트 -->
	<!-- 우측 사이드 뷰 테스트 -->

	<aside id="chat" class="sidebar c-overflow">

		<div class="chat-search">
			<div class="fg-line">
				<input type="text" class="form-control" placeholder="친구목록">
			</div>
		</div>

		<div class="listview">
			<c:forEach items='${naviDataMap.classMateList }' var='vo' varStatus='status'>
				<a class="lv-item" href="/bitin/webapp-user/profile?myNo=${fakeAuthUser.userNo}&otherNo=${vo.userNo }">
					<div class="media">
						<div class="pull-left p-relative">
							<img class="lv-img-sm" src="/bitin/assets/img/profile-pics/${ vo.userNo}.jpg" alt="">
							<i class="chat-status-busy"></i>
						</div>
						<div class="media-body">
							<div class="lv-title">${vo.userName}</div>
							<small class="lv-small">${vo.userType }</small>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>
	</aside>
</section>
<script>
function boardAllRead() {
	$('#board-all-read').remove();
	console.log("go")
	var unreadBoardCount = "${naviDataMap.totalUnreadBoard }";
	console.log("갯수 : "+unreadBoardCount);
	if( unreadBoardCount < 1) return;
	
	$.ajax({
		url:"/bitin/webapp-api/delete-all-unread-board-count",
		type:"get",
		dataType:"json",
		data:"userNo=${fakeAuthUser.userNo}",
		contetType : 'applicationjson',
		success: function(response) {
			if(response.result == "fail") {
				console.error(response.message);
				console.log("ajax error@ /bitin/webapp-api/delete-all-unread-board-count");
				return;
			}else if( response.result == "success") {
				console.log("전체 읽음 ajax 성공")
				location.href = location.href;
			}else {
				console.error(response.message);
				console.log("ajax error@ /bitin/webapp-api/delete-all-unread-board-count");
				return;
				
			}
			
		}
		
	})

	console.log("done")
};
</script>
