<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>
	function check() {
		if ($("input#id").val() == "") {
			alert("id를 입력해주세요");
			$("input#id").focus();
			event.preventDefault();
		} else if ($("input#password").val() == "") {
			alert("비밀번호를 입력해주세요");
			$("input#password").focus();
			event.preventDefault();
		}
	}
</script>
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
	href="/bitin/assets/vendors/bower_components/material-design-iconic-font/dist/css/material-design-iconic-font.min.css"
	rel="stylesheet">

<!-- CSS -->
<link href="/bitin/assets/css/app.min.1.css" rel="stylesheet">
<link href="/bitin/assets/css/app.min.2.css" rel="stylesheet">
</head>


<body class="login-content">
	<!-- Login -->
	<div class="lc-block toggled" id="l-login">
		<form class="no-margin" action="/bitin/user/login" method="post">
			<div class="input-group m-b-20">
				<span class="input-group-addon"><i class="zmdi zmdi-account"></i></span>
				<div class="fg-line">
					<input type="text" id="id" name="userId" class="form-control"
						placeholder="아이디를 입력해주세요">
				</div>
			</div>

			<div class="input-group m-b-20">
				<span class="input-group-addon"><i class="zmdi zmdi-male"></i></span>
				<div class="fg-line">
					<input type="password" id="password" name="userPassword"
						class="form-control" placeholder="비밀번호를 입력해주세요">
				</div>
			</div>
			<c:if test='${"error" == param.result }'>
                  <p style="color: #ff0000" >
                   아이디 또는 비밀번호가 틀렸습니다
                  </p>
               </c:if>
			
			<div class="clearfix"></div>
		

		<div class="checkbox">
			<label> <input type="checkbox" value=""> <i
				class="input-helper"></i> 암호 기억하기
			</label>

		</div>

		<div class="form-actions">
		
			<button type="submit" class="btn btn-login btn-danger btn-float"
				onclick="check();">
				<i class="zmdi zmdi-arrow-forward"></i>
				</button>
		</div>
		
		</form>
		<ul class="login-navigation">
			<li data-block="#l-register" class="bgm-red">회원가입</li>
			<li data-block="#l-forget-password" class="bgm-orange">아이디 /
				비밀번호 찾기</li>
		</ul>
	</div>

	<!-- Register -->
	<div class="lc-block" id="l-register">
		<div class="input-group m-b-20">
			<span class="input-group-addon"><i class="zmdi zmdi-account"></i></span>
			<div class="fg-line">
				<input type="text" class="form-control" placeholder="Username">
			</div>
		</div>

		<div class="input-group m-b-20">
			<span class="input-group-addon"><i class="zmdi zmdi-email"></i></span>
			<div class="fg-line">
				<input type="text" class="form-control" placeholder="Email Address">
			</div>
		</div>

		<div class="input-group m-b-20">
			<span class="input-group-addon"><i class="zmdi zmdi-male"></i></span>
			<div class="fg-line">
				<input type="password" class="form-control" placeholder="Password">
			</div>
		</div>

		<div class="clearfix"></div>

		<div class="checkbox">
			<label> <input type="checkbox" value=""> <i
				class="input-helper"></i> Accept the license agreement
			</label>
		</div>

		<a href="" class="btn btn-login btn-danger btn-float"><i
			class="zmdi zmdi-arrow-forward"></i></a>

		<ul class="login-navigation">
			<li data-block="#l-login" class="bgm-green">Login</li>
			<li data-block="#l-forget-password" class="bgm-orange">Forgot
				Password?</li>
		</ul>
	</div>

	<!-- Forgot Password -->
	<div class="lc-block" id="l-forget-password">
		<p class="text-left">Lorem ipsum dolor sit amet, consectetur
			adipiscing elit. Nulla eu risus. Curabitur commodo lorem fringilla
			enim feugiat commodo sed ac lacus.</p>

		<div class="input-group m-b-20">
			<span class="input-group-addon"><i class="zmdi zmdi-email"></i></span>
			<div class="fg-line">
				<input type="text" class="form-control" placeholder="Email Address">
			</div>
		</div>

		<a href="" class="btn btn-login btn-danger btn-float"><i
			class="zmdi zmdi-arrow-forward"></i></a>

		<ul class="login-navigation">
			<li data-block="#l-login" class="bgm-green">Login</li>
			<li data-block="#l-register" class="bgm-red">Register</li>
		</ul>
	</div>

	<!-- Javascript Libraries -->
	<script
		src="/bitin/assets/vendors/bower_components/jquery/dist/jquery.min.js"></script>
	<script
		src="/bitin/assets/vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<script
		src="/bitin/assets/vendors/bower_components/Waves/dist/waves.min.js"></script>

	<!-- Placeholder for IE9 -->
	<!--[if IE 9 ]>
            <script src="vendors/bower_components/jquery-placeholder/jquery.placeholder.min.js"></script>
        <![endif]-->

	<script src="/bitin/assets/js/functions.js"></script>

</body>
</html>
</body>
</html>