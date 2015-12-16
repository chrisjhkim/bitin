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
<link href="/bitin/assets/vendors/bower_components/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet">
<link href="/bitin/assets/vendors/bower_components/animate.css/animate.min.css" rel="stylesheet">
<link href="/bitin/assets/vendors/bower_components/bootstrap-sweetalert/lib/sweet-alert.css" rel="stylesheet">
<link href="/bitin/assets/vendors/bower_components/material-design-iconic-font/dist/css/material-design-iconic-font.min.css" rel="stylesheet">
<link href="/bitin/assets/vendors/bower_components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.min.css" rel="stylesheet">

<!-- CSS -->
<link href="/bitin/assets/css/app.min.1.css" rel="stylesheet">
<link href="/bitin/assets/css/app.min.2.css" rel="stylesheet">
</head>
    
<body>
<!-------------------- header 시작--------------------------------  -->
	
<!---------------------- header 끝 ---------------------------------------         -->
        <section id="main">
        
            <section id="content">
                <div class="container">
                    <div class="block-header">
                        <h2>Flot Charts <small>Flot is a pure JavaScript plotting library for jQuery, with a focus on simple usage, attractive looks and interactive features.</small></h2>
                    
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
                                    <li>
                                        <a href="">Refresh</a>
                                    </li>
                                    <li>
                                        <a href="">Manage Widgets</a>
                                    </li>
                                    <li>
                                        <a href="">Widgets Settings</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h2>Line Chart with curved edges <small>Curved edges made possible using curvedLines Flot plugin.</small></h2>
                            
                                    <ul class="actions">
                                        <li class="dropdown action-show">
                                            <a href="" data-toggle="dropdown">
                                                <i class="zmdi zmdi-more-vert"></i>
                                            </a>
                            
                                            <div class="dropdown-menu pull-right">
                                                <p class="p-20">
                                                    You can put anything here
                                                </p>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            
                                <div class="card-body">
                                    <div class="chart-edge">
                                        <div id="curved-line-chart" class="flot-chart"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h2>Lines Chart <small>Same above example without curved edges.</small></h2>
                                    
                                    <ul class="actions">
                                        <li class="dropdown action-show">
                                            <a href="" data-toggle="dropdown">
                                                <i class="zmdi zmdi-more-vert"></i>
                                            </a>
                            
                                            <div class="dropdown-menu pull-right">
                                                <p class="p-20">
                                                    You can put anything here
                                                </p>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                
                                <div class="card-body">
                                    <div class="chart-edge">
                                        <div id="line-chart" class="flot-chart"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- bar chart -->
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h2>Bar Chart11</h2>
                                    
                                    <ul class="actions">
                                        <li class="dropdown action-show">
                                            <a href="" data-toggle="dropdown">
                                                <i class="zmdi zmdi-more-vert"></i>
                                            </a>
                            
                                            <div class="dropdown-menu pull-right">
                                                <p class="p-20">
                                                    You can put anything here
                                                </p>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                
                                <div class="card-body card-padding-sm">
                                    <div id="bar-chart" class="flot-chart"></div>
                                    <div class="flc-bar"></div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- dynamic chart -->
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h2>Dynamic Chart</h2>
                                    
                                    <ul class="actions">
                                        <li class="dropdown action-show">
                                            <a href="" data-toggle="dropdown">
                                                <i class="zmdi zmdi-more-vert"></i>
                                            </a>
                            
                                            <div class="dropdown-menu pull-right">
                                                <p class="p-20">
                                                    You can put anything here
                                                </p>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                
                                <div class="card-body card-padding-sm">
                                    <div id="dynamic-chart" class="flot-chart"></div>
                                    <div class="flc-dynamic"></div>
                                </div>
                            </div>
                        </div>
                        <!-- bar chart -->
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h2>Bar Chart 22</h2>
                                    
                                    <ul class="actions">
                                        <li class="dropdown action-show">
                                            <a href="" data-toggle="dropdown">
                                                <i class="zmdi zmdi-more-vert"></i>
                                            </a>
                            
                                            <div class="dropdown-menu pull-right">
                                                <p class="p-20">
                                                    You can put anything here
                                                </p>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                
                                <div class="card-body card-padding-sm">
                                    <div id="bar-chart2" class="flot-chart"></div>
                                    <div class="flc-bar"></div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- dynamic chart -->
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h2>Dynamic Chart</h2>
                                    
                                    <ul class="actions">
                                        <li class="dropdown action-show">
                                            <a href="" data-toggle="dropdown">
                                                <i class="zmdi zmdi-more-vert"></i>
                                            </a>
                            
                                            <div class="dropdown-menu pull-right">
                                                <p class="p-20">
                                                    You can put anything here
                                                </p>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                
                                <div class="card-body card-padding-sm">
                                    <div id="dynamic-chart" class="flot-chart"></div>
                                    <div class="flc-dynamic"></div>
                                </div>
                            </div>
                        </div>
                                                
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h2>Pie Chart</h2>
                                    
                                    <ul class="actions">
                                        <li class="dropdown action-show">
                                            <a href="" data-toggle="dropdown">
                                                <i class="zmdi zmdi-more-vert"></i>
                                            </a>
                            
                                            <div class="dropdown-menu pull-right">
                                                <p class="p-20">
                                                    You can put anything here
                                                </p>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                
                                <div class="card-body card-padding">
<!-- --------------------------- -------------- -------------------------- ---------- --------- -->
                                    <div id="pie-chart2" class="flot-chart-pie"></div>
                                    <div class="flc-pie hidden-xs"></div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h2>Donut Chart</h2>
                                    
                                    <ul class="actions">
                                        <li class="dropdown action-show">
                                            <a href="" data-toggle="dropdown">
                                                <i class="zmdi zmdi-more-vert"></i>
                                            </a>
                            
                                            <div class="dropdown-menu pull-right">
                                                <p class="p-20">
                                                    You can put anything here
                                                </p>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                
                                <div class="card-body card-padding">
                                    <div id="donut-chart" class="flot-chart-pie"></div>
                                    <div class="flc-donut hidden-xs"></div>
                                </div>
                            </div>
                        </div>
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


<!-- Charts - Please read the read-me.txt inside the js folder-->
        <script src="/bitin/assets/js/flot-charts/bar-chart.js"></script>
        <script src="/bitin/assets/js/flot-charts/dynamic-chart.js"></script>
        <script src="/bitin/assets/js/flot-charts/pie-chart.js"></script><!--여기 안에 값들 있음 -->
        


<script src="/bitin/assets/vendors/bower_components/moment/min/moment.min.js"></script>
<script src="/bitin/assets/vendors/bower_components/fullcalendar/dist/fullcalendar.min.js "></script>
<script src="/bitin/assets/vendors/bower_components/simpleWeather/jquery.simpleWeather.min.js"></script>
<script src="/bitin/assets/vendors/bower_components/Waves/dist/waves.min.js"></script>
<script src="/bitin/assets/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<script src="/bitin/assets/vendors/bower_components/bootstrap-sweetalert/lib/sweet-alert.min.js"></script>
<script src="/bitin/assets/vendors/bower_components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>

<script src="/bitin/assets/js/flot-charts/curved-line-chart.js"></script>
<script src="/bitin/assets/js/flot-charts/line-chart.js"></script>
<script src="/bitin/assets/js/charts.js"></script>

<script src="/bitin/assets/js/charts.js"></script>
<script src="/bitin/assets/js/functions.js"></script>
<script src="/bitin/assets/js/demo.js"></script>

</body>
</html>