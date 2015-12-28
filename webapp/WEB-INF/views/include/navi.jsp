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
						class="tm-icon zmdi zmdi-email"></i> <i class="tmn-counts">5+</i>
				</a>
					<div class="dropdown-menu dropdown-menu-lg pull-right">
						<div class="listview">
							<div class="lv-header">Messages</div>
							<div class="lv-body">
								<a class="lv-item" href="/bitin/chatting/list">
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
							<a class="lv-footer" href="">View All</a>
						</div>
					</div></li>
				<li class="dropdown"><a data-toggle="dropdown" href=""> <i
						class="tm-icon zmdi zmdi-notifications"></i> <i class="tmn-counts">5+</i>
				</a>
					<div class="dropdown-menu dropdown-menu-lg pull-right">
						<div class="listview" id="notifications">
							<div class="lv-header">
								투표 현황

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
												src="/bitin/assets/img/profile-pics/2.jpg" alt="">
										</div>
										<div class="media-body">
											<div class="lv-title">김준현</div>
											<small class="lv-small">다 같이 마포대교로 가고 싶습니다..</small>
										</div>
									</div>
								</a> <a class="lv-item" href="">
									<div class="media">
										<div class="pull-left">
											<img class="lv-img-sm"
												src="/bitin/assets/img/profile-pics/2.jpg" alt="">
										</div>
										<div class="media-body">
											<div class="lv-title">김준현</div>
											<small class="lv-small">갑시다..마포대교</small>
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
						class="tmn-counts">${classMateSize }</i></a></li>
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
					<img src="/bitin/assets/img/profile-pics/1.jpg" alt="">
				</div>

				<div class="profile-info">
					${authUser.userName  } 님이 접속중</i>
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

<script src="/bitin/assets/vendors/bower_components/fullcalendar/dist/fullcalendar.min.js"></script>

 <script type="text/javascript">
            $(document).ready(function() {
                var date = new Date();
                var d = date.getDate();
                var m = date.getMonth();
                var y = date.getFullYear();

                var cId = $('#calendar'); //Change the name if you want. I'm also using thsi add button for more actions

                //Generate the Calendar
                cId.fullCalendar({
                    header: {
                        right: '',
                        center: 'prev, title, next',
                        left: ''
                    },

                    theme: true, //Do not remove this as it ruin the design
                    selectable: true,
                    selectHelper: true,
                    editable: true,

                    //Add Events
                    events: [
                        {
                            title: 'Hangout with friends',
                            start: new Date(y, m, 1),
                            allDay: true,
                            className: 'bgm-cyan'
                        },
                        {
                            title: 'Meeting with client',
                            start: new Date(y, m, 10),
                            allDay: true,
                            className: 'bgm-orange'
                        },
                        {
                            title: 'Repeat Event',
                            start: new Date(y, m, 18),
                            allDay: true,
                            className: 'bgm-amber'
                        },
                        {
                            title: 'Semester Exam',
                            start: new Date(y, m, 20),
                            allDay: true,
                            className: 'bgm-green'
                        },
                        {
                            title: 'Soccor match',
                            start: new Date(y, m, 5),
                            allDay: true,
                            className: 'bgm-lightblue'
                        },
                        {
                            title: 'Coffee time',
                            start: new Date(y, m, 21),
                            allDay: true,
                            className: 'bgm-orange'
                        },
                        {
                            title: 'Job Interview',
                            start: new Date(y, m, 5),
                            allDay: true,
                            className: 'bgm-amber'
                        },
                        {
                            title: 'IT Meeting',
                            start: new Date(y, m, 5),
                            allDay: true,
                            className: 'bgm-green'
                        },
                        {
                            title: 'Brunch at Beach',
                            start: new Date(y, m, 1),
                            allDay: true,
                            className: 'bgm-lightblue'
                        },
                        {
                            title: 'Live TV Show',
                            start: new Date(y, m, 15),
                            allDay: true,
                            className: 'bgm-cyan'
                        },
                        {
                            title: 'Software Conference',
                            start: new Date(y, m, 25),
                            allDay: true,
                            className: 'bgm-lightblue'
                        },
                        {
                            title: 'Coffee time',
                            start: new Date(y, m, 30),
                            allDay: true,
                            className: 'bgm-orange'
                        },
                        {
                            title: 'Job Interview',
                            start: new Date(y, m, 30),
                            allDay: true,
                            className: 'bgm-green'
                        },
                    ],
                     
                    //On Day Select
                    select: function(start, end, allDay) {
                        $('#addNew-event').modal('show');   
                        $('#addNew-event input:text').val('');
                        $('#getStart').val(start);
                        $('#getEnd').val(end);
                    }
                });

                //Create and ddd Action button with dropdown in Calendar header. 
                var actionMenu = '<ul class="actions actions-alt" id="fc-actions">' +
                                    '<li class="dropdown">' +
                                        '<a href="" data-toggle="dropdown"><i class="zmdi zmdi-more-vert"></i></a>' +
                                        '<ul class="dropdown-menu dropdown-menu-right">' +
                                            '<li class="active">' +
                                                '<a data-view="month" href="">Month View</a>' +
                                            '</li>' +
                                            '<li>' +
                                                '<a data-view="basicWeek" href="">Week View</a>' +
                                            '</li>' +
                                            '<li>' +
                                                '<a data-view="agendaWeek" href="">Agenda Week View</a>' +
                                            '</li>' +
                                            '<li>' +
                                                '<a data-view="basicDay" href="">Day View</a>' +
                                            '</li>' +
                                            '<li>' +
                                                '<a data-view="agendaDay" href="">Agenda Day View</a>' +
                                            '</li>' +
                                        '</ul>' +
                                    '</div>' +
                                '</li>';


                cId.find('.fc-toolbar').append(actionMenu);
                
                //Event Tag Selector
                (function(){
                    $('body').on('click', '.event-tag > span', function(){
                        $('.event-tag > span').removeClass('selected');
                        $(this).addClass('selected');
                    });
                })();
            
                //Add new Event
                $('body').on('click', '#addEvent', function(){
                    var eventName = $('#eventName').val();
                    var tagColor = $('.event-tag > span.selected').attr('data-tag');
                        
                    if (eventName != '') {
                        //Render Event
                        $('#calendar').fullCalendar('renderEvent',{
                            title: eventName,
                            start: $('#getStart').val(),
                            end:  $('#getEnd').val(),
                            allDay: true,
                            className: tagColor
                            
                        },true ); //Stick the event
                        
                        $('#addNew-event form')[0].reset()
                        $('#addNew-event').modal('hide');
                    }
                    
                    else {
                        $('#eventName').closest('.form-group').addClass('has-error');
                    }
                });   

                //Calendar views
                $('body').on('click', '#fc-actions [data-view]', function(e){
                    e.preventDefault();
                    var dataView = $(this).attr('data-view');
                    
                    $('#fc-actions li').removeClass('active');
                    $(this).parent().addClass('active');
                    cId.fullCalendar('changeView', dataView);  
                });
            });                        
        </script>



