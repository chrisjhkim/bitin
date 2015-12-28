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
		<%-- <c:choose>
			<c:when test='${empty authUser }'>

				<li class="pull-right"><a href="/bitin/loginform" id="login"
					title="login" data-toggle="popover" data-placement="bottom"><i
						class="btn btn-success" value="login"> Login </i></a></li>
				<li class="pull-right"><a href="/bitin/registerform" id="join"
					title="join" data-toggle="popover" data-placement="bottom"> <i
						class="btn btn-warning" value="join"> Join </i>
				</a></li>
			</c:when>
			<c:otherwise> --%>
		<li id="menu-trigger" data-trigger="#sidebar" class="logo hidden-sm">
			<img src="/bitin/assets/img/demo/logo.png" alt="">
		</li>
		<li class="pull-right">
			<ul class="top-menu">

				<li id="top-search"><a href=""><i
						class="tm-icon zmdi zmdi-search"></i></a></li>

				<li class="dropdown"><a data-toggle="dropdown" href=""> <i
						class="tm-icon zmdi zmdi-email"></i> <i class="tmn-counts">6</i>
				</a>
					<div class="dropdown-menu dropdown-menu-lg pull-right">
						<div class="listview">
							<div class="lv-header">Messages</div>
							<div class="lv-body">
								
								<c:forEach items="${recentChatList }" var='vo'>
<!-- 									<a class="lv-item" href="/bitin/chatting/list"> -->
									<a class="lv-item" href="/bitin/webapp/chatting">
										<div class="media">
											<div class="pull-left">
												<img class="lv-img-sm" src="/bitin/assets/img/profile-pics/${vo.FROM_USER_NO }.jpg" alt="">
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
				<li class="dropdown"><a data-toggle="dropdown" href=""> <i
						class="tm-icon zmdi zmdi-notifications"></i> <i class="tmn-counts">9</i>
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
							<div class="lv-body">
								<a class="lv-item" href="">
									<div class="media">
										<div class="pull-left">
											<img class="lv-img-sm"
												src="/bitin/assets/img/profile-pics/1.jpg" alt="">
										</div>
										<div class="media-body">
											<div class="lv-title">David Belle</div>
											<small class="lv-small">Cum sociis natoque penatibus
												et magnis dis parturient montes</small>
										</div>
									</div>
								</a> <a class="lv-item" href="">
									<div class="media">
										<div class="pull-left">
											<img class="lv-img-sm"
												src="/bitin/assets/img/profile-pics/2.jpg" alt="">
										</div>
										<div class="media-body">
											<div class="lv-title">Jonathan Morris</div>
											<small class="lv-small">Nunc quis diam diamurabitur
												at dolor elementum, dictum turpis vel</small>
										</div>
									</div>
								</a> <a class="lv-item" href="">
									<div class="media">
										<div class="pull-left">
											<img class="lv-img-sm"
												src="/bitin/assets/img/profile-pics/3.jpg" alt="">
										</div>
										<div class="media-body">
											<div class="lv-title">Fredric Mitchell Jr.</div>
											<small class="lv-small">Phasellus a ante et est
												ornare accumsan at vel magnauis blandit turpis at augue
												ultricies</small>
										</div>
									</div>
								</a> <a class="lv-item" href="">
									<div class="media">
										<div class="pull-left">
											<img class="lv-img-sm"
												src="/bitin/assets/img/profile-pics/4.jpg" alt="">
										</div>
										<div class="media-body">
											<div class="lv-title">Glenn Jecobs</div>
											<small class="lv-small">Ut vitae lacus sem
												ellentesque maximus, nunc sit amet varius dignissim, dui est
												consectetur neque</small>
										</div>
									</div>
								</a> <a class="lv-item" href="">
									<div class="media">
										<div class="pull-left">
											<img class="lv-img-sm"
												src="/bitin/assets/img/profile-pics/4.jpg" alt="">
										</div>
										<div class="media-body">
											<div class="lv-title">Bill Phillips</div>
											<small class="lv-small">Proin laoreet commodo eros id
												faucibus. Donec ligula quam, imperdiet vel ante placerat</small>
										</div>
									</div>
								</a>
							</div>

							<a class="lv-footer" href="">View Previous</a>
						</div>

					</div></li>
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
				<li class="hidden-sm" id="chat-trigger" data-trigger="#chat"><a
					href=""><i class="tm-icon zmdi zmdi-comment-alt-text"></i><i
						class="tmn-counts">9</i></a></li>
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
					<img src="/bitin/assets/img/profile-pics/${authUser.userNo }.jpg" alt="">
				</div>

				<div class="profile-info">
					${authUser.userName } 님이 접속중</i>
				</div>
			</a>

			<ul class="main-menu">
				<li><a href="profile-about.html"><i
						class="zmdi zmdi-account"></i> 내 정보</a></li>
				<li><a href="/bitin/loginform"><i
						class="zmdi zmdi-time-restore"></i> Log-in</a></li>
				<li><a href="/bitin/user/logout"><i
						class="zmdi zmdi-time-restore"></i> Log-out</a></li>
			</ul>
		</div>

		<ul class="main-menu">
			<li class="active"><a href="/bitin/index"><i
					class="zmdi zmdi-home"></i> 메인 페이지</a></li>

			<!--  켈린더 -->
			<li><a href="calendar.html"><i class="zmdi zmdi-calendar"></i>
				수강 등록</a></li>
			<!--  게시판 메뉴 -->


			<li class="sub-menu"><a href="form-examples.html"><i
					class="zmdi zmdi-menu"></i>수업 선택</a>

				<ul>
					<!-- 
					<li>
					<a href="form-elements.html">메인 링크</a>
					</li>
                    -->
                    <c:forEach items='${className}' var='vo' varStatus='status'>
					<li class="sub-menu"><a href="/bitin/board/list/${vo.classNo }">${vo.className }</a>

						<ul>
							<li><a href="/bitin/board/list/${vo.classNo }">${vo.className } 공지사항</a></li>
							<li><a href="/bitin/board/list/${vo.classNo }">${vo.className } 자유 게시판</a></li>
							<li><a href="/bitin/board/list/${vo.classNo }">${vo.className } 정보 게시판</a></li>
						</ul></li>
							</c:forEach>
				</ul></li>



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
			<c:forEach items='${classMate }' var='vo' varStatus='status'>
				<a class="lv-item" href="/bitin/user/miniprofile/${vo.userNo }">
					<div class="media">
						<div class="pull-left p-relative">
							<img class="lv-img-sm" src="/bitin/assets/img/profile-pics/${ vo.userNo}.jpg"
								alt=""> <i class="chat-status-busy"></i>
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

