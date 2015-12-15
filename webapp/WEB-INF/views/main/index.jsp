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
	<header id="header" class="clearfix" data-current-skin="blue">
		<ul class="header-inner">
		<c:choose>
				<c:when test='${empty authUser }'>
				
				<li class="hidden-xs"><a href="/bitin/index" class="m-l-10"><img
					src="/bitin/assets/img/demo/logo.png" alt=""></a></li>
					
						<li class="nav navbar-nav navbar-right pull-right"><a
							href="/bitin/loginform" id="login" title="login"
							data-toggle="popover" data-placement="bottom"><i
								class="btn btn-inverse" value="login">Login</i></a></li>
							<li class="nav navbar-nav navbar-right pull-right"><a
								href="/bitin/registerform" id="join" title="join"
								data-toggle="popover" data-placement="bottom"> <i
									class="btn btn-default" value="join">Join</i>
							</a></li>
				</c:when>
					<c:otherwise>
			<li id="menu-trigger" data-trigger="#sidebar">
				<div class="line-wrap">
					<div class="line top"></div>
					<div class="line center"></div>
					<div class="line bottom"></div>
				</div>
			</li>
					<li class="hidden-xs"><a href="/bitin/index" class="m-l-10"><img
					src="/bitin/assets/img/demo/logo.png" alt=""></a></li>
				

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
									<a class="lv-item" href="">
										<div class="media">
											<div class="pull-left">
												<img class="lv-img-sm" src="img/profile-pics/1.jpg" alt="">
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
												<img class="lv-img-sm" src="img/profile-pics/2.jpg" alt="">
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
												<img class="lv-img-sm" src="img/profile-pics/3.jpg" alt="">
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
												<img class="lv-img-sm" src="img/profile-pics/4.jpg" alt="">
											</div>
											<div class="media-body">
												<div class="lv-title">Glenn Jecobs</div>
												<small class="lv-small">Ut vitae lacus sem
													ellentesque maximus, nunc sit amet varius dignissim, dui
													est consectetur neque</small>
											</div>
										</div>
									</a> <a class="lv-item" href="">
										<div class="media">
											<div class="pull-left">
												<img class="lv-img-sm" src="img/profile-pics/4.jpg" alt="">
											</div>
											<div class="media-body">
												<div class="lv-title">Bill Phillips</div>
												<small class="lv-small">Proin laoreet commodo eros
													id faucibus. Donec ligula quam, imperdiet vel ante placerat</small>
											</div>
										</div>
									</a>
								</div>
								<a class="lv-footer" href="">View All</a>
							</div>
						</div></li>
					<li class="dropdown"><a data-toggle="dropdown" href=""> <i
							class="tm-icon zmdi zmdi-notifications"></i> <i
							class="tmn-counts">9</i>
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
												<img class="lv-img-sm" src="img/profile-pics/1.jpg" alt="">
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
												<img class="lv-img-sm" src="img/profile-pics/2.jpg" alt="">
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
												<img class="lv-img-sm" src="img/profile-pics/3.jpg" alt="">
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
												<img class="lv-img-sm" src="img/profile-pics/4.jpg" alt="">
											</div>
											<div class="media-body">
												<div class="lv-title">Glenn Jecobs</div>
												<small class="lv-small">Ut vitae lacus sem
													ellentesque maximus, nunc sit amet varius dignissim, dui
													est consectetur neque</small>
											</div>
										</div>
									</a> <a class="lv-item" href="">
										<div class="media">
											<div class="pull-left">
												<img class="lv-img-sm" src="img/profile-pics/4.jpg" alt="">
											</div>
											<div class="media-body">
												<div class="lv-title">Bill Phillips</div>
												<small class="lv-small">Proin laoreet commodo eros
													id faucibus. Donec ligula quam, imperdiet vel ante placerat</small>
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
											<div class="progress-bar progress-bar-info"
												role="progressbar" aria-valuenow="20" aria-valuemin="0"
												aria-valuemax="100" style="width: 20%">
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
					<!-- 
                        <li class="dropdown">
                            <a data-toggle="dropdown" href=""><i class="tm-icon zmdi zmdi-more-vert"></i></a>
                            <ul class="dropdown-menu dm-icon pull-right">
                                <li class="skin-switch hidden-xs">
                                    <span class="ss-skin bgm-lightblue" data-skin="lightblue"></span>
                                    <span class="ss-skin bgm-bluegray" data-skin="bluegray"></span>
                                    <span class="ss-skin bgm-cyan" data-skin="cyan"></span>
                                    <span class="ss-skin bgm-teal" data-skin="teal"></span>
                                    <span class="ss-skin bgm-orange" data-skin="orange"></span>
                                    <span class="ss-skin bgm-blue" data-skin="blue"></span>
                                </li>
                                <li class="divider hidden-xs"></li>
                                <li class="hidden-xs">
                                    <a data-action="fullscreen" href=""><i class="zmdi zmdi-fullscreen"></i> Toggle Fullscreen</a>
                                </li>
                                <li>
                                    <a data-action="clear-localstorage" href=""><i class="zmdi zmdi-delete"></i> Clear Local Storage</a>
                                </li>
                                <li>
                                    <a href=""><i class="zmdi zmdi-face"></i> Privacy Settings</a>
                                </li>
                                <li>
                                    <a href=""><i class="zmdi zmdi-settings"></i> Other Settings</a>
                                </li>
                            </ul>
                        </li>
                         -->
					<li class="hidden-xs" id="chat-trigger" data-trigger="#chat">
						<a href=""><i class="tm-icon zmdi zmdi-comment-alt-text"></i></a>
					</li>
				</ul>
			</li>
			</c:otherwise>
			</c:choose>
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
						${authUser.userName  } <i class="zmdi zmdi-caret-down"></i>
					</div>
				</a>

				<ul class="main-menu">
					<li><a href="profile-about.html"><i
							class="zmdi zmdi-account"></i> View Profile</a></li>
					<li><a href=""><i class="zmdi zmdi-input-antenna"></i>
							Privacy Settings</a></li>
					<li><a href=""><i class="zmdi zmdi-settings"></i> Settings</a>
					</li>
					<li><a href="/bitin/user/logout"><i class="zmdi zmdi-time-restore"></i>
							Logout</a></li>
				</ul>
			</div>

			<ul class="main-menu">
				<li class="active"><a href="index.html"><i
						class="zmdi zmdi-home"></i> Home</a></li>
				<li class="sub-menu"><a href=""><i
						class="zmdi zmdi-view-compact"></i> Headers</a>

					<ul>
						<li><a href="textual-menu.html">Textual menu</a></li>
						<li><a href="image-logo.html">Image logo</a></li>
						<li><a href="top-mainmenu.html">Mainmenu on top</a></li>
					</ul></li>
				<li><a href="typography.html"><i
						class="zmdi zmdi-format-underlined"></i> Typography</a></li>
				<li class="sub-menu"><a href=""><i
						class="zmdi zmdi-widgets"></i> Widgets</a>

					<ul>
						<li><a href="widget-templates.html">Templates</a></li>
						<li><a href="widgets.html">Widgets</a></li>
					</ul></li>
				<li class="sub-menu"><a href=""><i
						class="zmdi zmdi-view-list"></i> Tables</a>

					<ul>
						<li><a href="tables.html">Normal Tables</a></li>
						<li><a href="data-tables.html">Data Tables</a></li>
					</ul></li>
				<li class="sub-menu"><a href=""><i
						class="zmdi zmdi-collection-text"></i> Forms</a>

					<ul>
						<li><a href="form-elements.html">Basic Form Elements</a></li>
						<li><a href="form-components.html">Form Components</a></li>
						<li><a href="form-examples.html">Form Examples</a></li>
						<li><a href="form-validations.html">Form Validation</a></li>
					</ul></li>
				<li class="sub-menu"><a href=""><i
						class="zmdi zmdi-swap-alt"></i>User Interface</a>
					<ul>
						<li><a href="colors.html">Colors</a></li>
						<li><a href="animations.html">Animations</a></li>
						<li><a href="box-shadow.html">Box Shadow</a></li>
						<li><a href="buttons.html">Buttons</a></li>
						<li><a href="icons.html">Icons</a></li>
						<li><a href="alerts.html">Alerts</a></li>
						<li><a href="preloaders.html">Preloaders</a></li>
						<li><a href="notification-dialog.html">Notifications &
								Dialogs</a></li>
						<li><a href="media.html">Media</a></li>
						<li><a href="components.html">Components</a></li>
						<li><a href="other-components.html">Others</a></li>
					</ul></li>
				<li class="sub-menu"><a href=""><i
						class="zmdi zmdi-trending-up"></i>Charts</a>
					<ul>
						<li><a href="flot-charts.html">Flot Charts</a></li>
						<li><a href="other-charts.html">Other Charts</a></li>
					</ul></li>
				<li><a href="calendar.html"><i class="zmdi zmdi-calendar"></i>
						Calendar</a></li>
				<li class="sub-menu"><a href=""><i class="zmdi zmdi-image"></i>Photo
						Gallery</a>
					<ul>
						<li><a href="photos.html">Default</a></li>
						<li><a href="photo-timeline.html">Timeline</a></li>
					</ul></li>

				<li><a href="generic-classes.html"><i
						class="zmdi zmdi-layers"></i> Generic Classes</a></li>
				<li class="sub-menu"><a href=""><i
						class="zmdi zmdi-collection-item"></i> Sample Pages</a>
					<ul>
						<li><a href="profile-about.html">Profile</a></li>
						<li><a href="list-view.html">List View</a></li>
						<li><a href="messages.html">Messages</a></li>
						<li><a href="pricing-table.html">Pricing Table</a></li>
						<li><a href="contacts.html">Contacts</a></li>
						<li><a href="wall.html">Wall</a></li>
						<li><a href="invoice.html">Invoice</a></li>
						<li><a href="login.html">Login and Sign Up</a></li>
						<li><a href="lockscreen.html">Lockscreen</a></li>
						<li><a href="404.html">Error 404</a></li>
					</ul></li>
				<li class="sub-menu"><a href="form-examples.html"><i
						class="zmdi zmdi-menu"></i> 3 Level Menu</a>

					<ul>
						<li><a href="form-elements.html">Level 2 link</a></li>
						<li><a href="form-components.html">Another level 2 Link</a></li>
						<li class="sub-menu"><a href="form-examples.html">I have
								children too</a>

							<ul>
								<li><a href="">Level 3 link</a></li>
								<li><a href="">Another Level 3 link</a></li>
								<li><a href="">Third one</a></li>
							</ul></li>
						<li><a href="form-validations.html">One more 2</a></li>
					</ul></li>
				<li><a
					href="https://wrapbootstrap.com/theme/material-admin-responsive-angularjs-WB011H985"><i
						class="zmdi zmdi-money"></i> Buy this template</a></li>
			</ul>
		</aside>

		<aside id="chat" class="sidebar c-overflow">

			<div class="chat-search">
				<div class="fg-line">
					<input type="text" class="form-control" placeholder="Search People">
				</div>
			</div>

			<div class="listview">
				<a class="lv-item" href="">
					<div class="media">
						<div class="pull-left p-relative">
							<img class="lv-img-sm" src="img/profile-pics/2.jpg" alt="">
							<i class="chat-status-busy"></i>
						</div>
						<div class="media-body">
							<div class="lv-title">Jonathan Morris</div>
							<small class="lv-small">Available</small>
						</div>
					</div>
				</a> <a class="lv-item" href="">
					<div class="media">
						<div class="pull-left">
							<img class="lv-img-sm" src="img/profile-pics/1.jpg" alt="">
						</div>
						<div class="media-body">
							<div class="lv-title">David Belle</div>
							<small class="lv-small">Last seen 3 hours ago</small>
						</div>
					</div>
				</a> <a class="lv-item" href="">
					<div class="media">
						<div class="pull-left p-relative">
							<img class="lv-img-sm" src="img/profile-pics/3.jpg" alt="">
							<i class="chat-status-online"></i>
						</div>
						<div class="media-body">
							<div class="lv-title">Fredric Mitchell Jr.</div>
							<small class="lv-small">Availble</small>
						</div>
					</div>
				</a> <a class="lv-item" href="">
					<div class="media">
						<div class="pull-left p-relative">
							<img class="lv-img-sm" src="img/profile-pics/4.jpg" alt="">
							<i class="chat-status-online"></i>
						</div>
						<div class="media-body">
							<div class="lv-title">Glenn Jecobs</div>
							<small class="lv-small">Availble</small>
						</div>
					</div>
				</a> <a class="lv-item" href="">
					<div class="media">
						<div class="pull-left">
							<img class="lv-img-sm" src="img/profile-pics/5.jpg" alt="">
						</div>
						<div class="media-body">
							<div class="lv-title">Bill Phillips</div>
							<small class="lv-small">Last seen 3 days ago</small>
						</div>
					</div>
				</a> <a class="lv-item" href="">
					<div class="media">
						<div class="pull-left">
							<img class="lv-img-sm" src="img/profile-pics/6.jpg" alt="">
						</div>
						<div class="media-body">
							<div class="lv-title">Wendy Mitchell</div>
							<small class="lv-small">Last seen 2 minutes ago</small>
						</div>
					</div>
				</a> <a class="lv-item" href="">
					<div class="media">
						<div class="pull-left p-relative">
							<img class="lv-img-sm" src="img/profile-pics/7.jpg" alt="">
							<i class="chat-status-busy"></i>
						</div>
						<div class="media-body">
							<div class="lv-title">Teena Bell Ann</div>
							<small class="lv-small">Busy</small>
						</div>
					</div>
				</a>
			</div>
		</aside>

		<section id="container">
			<div class="container">
				<div class="container">
				</div>
				<br>

				<div class="card-body card-padding">
					<div id="carousel-example-generic" class="carousel slide"
						data-ride="carousel">


						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<img src="/bitin/assets/media/carousel/c-4.jpg" alt="">
								<div class="carousel-caption">
									<h3>StuBit Application for Android</h3>
									<p>안드로이드 어플을 다운받아주세요</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<br>
		<div class="container c-alt">

			<div class="text-center">
				<h2 class="f-400">StuBit</h2>
				<p class="c-gray m-t-20 m-b-20">Study 와 Bit의 합성어(가제). 수업관리
					어플리케이션과 반응형 웹으로 수업의 편의성을 위해 제작중입니다.</p>
			</div>

		</div>

		<div class="container c-alt">

			<div class="clearfix"></div>

			<div class="row m-t-25">
				
				 <div class="col-sm-4">
                            <div class="card">
                                <div class="card-header bgm-orange m-b-20">
                                    <h2>메세징 서비스 <small>그룹원끼리 대화를 하세요!</small></h2>
                                    <ul class="actions actions-alt">
                                        <li class="dropdown">
                                            <a href="" data-toggle="dropdown">
                                            </a>
                                        </li>
                                    </ul>
                                    
                                    <button class="btn bgm-amber btn-float waves-effect"><i class="zmdi zmdi-mail-send"></i></button>
                                </div>

                                <div class="card-body card-padding">
                                
                                </div>
                            </div>
                        </div>
				

				  <div class="col-sm-4">
                            <div class="card">
                                <div class="card-header bgm-brown m-b-20">
                                    <h2>메세징 서비스 <small>그룹원끼리 대화를 하세요!</small></h2>
                                    <ul class="actions actions-alt">
                                        <li class="dropdown">
                                            <a href="" data-toggle="dropdown">
                                            </a>
                                        </li>
                                    </ul>
                                    
                                    <button class="btn bgm-gray btn-float waves-effect"><i class="zmdi zmdi-mail-send"></i></button>
                                </div>

                                <div class="card-body card-padding">
                                </div>
                            </div>
                        </div>
                        
                         <div class="col-sm-4">
                            <div class="card">
                                <div class="card-header bgm-green m-b-20">
                                    <h2>메세징 서비스 <small>그룹원끼리 대화를 하세요!</small></h2>
                                    <ul class="actions actions-alt">
                                        <li class="dropdown">
                                            <a href="" data-toggle="dropdown">
                                            </a>
                                        </li>
                                    </ul>
                                    
                                    <button class="btn bgm-lightgreen btn-float waves-effect"><i class="zmdi zmdi-mail-send"></i></button>
                                </div>

                                <div class="card-body card-padding">

                                </div>
                            </div>
                        </div>


			</div>
		</div>
		
		<div class="container c-alt">

			<div class="clearfix"></div>

			<div class="row m-t-25">
				
				 <div class="col-sm-4">
                            <div class="card">
                                <div class="card-header bgm-lightblue m-b-20">
                                    <h2>메세징 서비스 <small>그룹원끼리 대화를 하세요!</small></h2>
                                    <ul class="actions actions-alt">
                                        <li class="dropdown">
                                            <a href="" data-toggle="dropdown">
                                            </a>
                                        </li>
                                    </ul>
                                    
                                    <button class="btn bgm-cyan btn-float waves-effect"><i class="zmdi zmdi-mail-send"></i></button>
                                </div>

                                <div class="card-body card-padding">

                                </div>
                            </div>
                        </div>
				

				  <div class="col-sm-4">
                            <div class="card">
                                <div class="card-header bgm-purple m-b-20">
                                    <h2>메세징 서비스 <small>그룹원끼리 대화를 하세요!</small></h2>
                                    <ul class="actions actions-alt">
                                        <li class="dropdown">
                                            <a href="" data-toggle="dropdown">
                                            </a>
                                        </li>
                                    </ul>
                                    
                                    <button class="btn bgm-deeppurple btn-float waves-effect"><i class="zmdi zmdi-mail-send"></i></button>
                                </div>

                                <div class="card-body card-padding">

                                </div>
                            </div>
                        </div>
                        
                         <div class="col-sm-4">
                            <div class="card">
                                <div class="card-header bgm-red m-b-20">
                                    <h2>메세징 서비스 <small>그룹원끼리 대화를 하세요!</small></h2>
                                    <ul class="actions actions-alt">
                                        <li class="dropdown">
                                            <a href="" data-toggle="dropdown">
                                            </a>
                                        </li>
                                    </ul>
                                    
                                    <button class="btn bgm-pink btn-float waves-effect"><i class="zmdi zmdi-mail-send"></i></button>
                                </div>

                                <div class="card-body card-padding">

                                </div>
                            </div>
                        </div>


			</div>
		</div>

	</section>

	<footer id="footer">
		Copyright &copy; 2015 Type-B StuBit

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
	<script src="/bitin/assets/js/demo.js"></script>


</body>
</html>