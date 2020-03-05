<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html dir="ltr">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" type="image/png" sizes="16x16"
	href="/sf/resources/assets/images/favicon.png">
<title>로그인</title>
<link
	href="${pageContext.request.contextPath}/resources/dist/css/style.min.css"
	rel="stylesheet">
<script src="/sf/resources/js/jquery-3.4.1.js"></script>
<script>
	$(function() {
		login();
	});

	function goMain() {
		location.href = '<c:url value="/"/>';
	};

	function login() {

		$('#loginBtn').on('click', function() {
			
			var id = $('input#userid').val();
			var pwd = $('input#userpwd').val();
			
			$.ajax({
				url : "login",
				type : "post",
				data : {
					userid : id,
					userpwd : pwd
				},
				success : function(data) {
					console.log(data);
					if (data) {
						goMain();
					} else {
						$('#loginResult').html("로그인에 실패하였습니다");
						login();
					}
				},
				error : function() {
				}
			});
		});
	}
</script>
</head>
<body>
	<div class="main-wrapper">
		<div class="preloader">
			<div class="lds-ripple">
				<div class="lds-pos"></div>
				<div class="lds-pos"></div>
			</div>
		</div>
		<div
			class="auth-wrapper d-flex no-block justify-content-center align-items-center bg-dark">
			<div class="auth-box bg-dark border-top border-secondary">
				<div id="loginform">
					<div class="text-center p-t-20 p-b-20">
						<span class="db"><img
							src="/sf/resources/assets/images/logo.png" alt="logo" /></span>
					</div>
					<!-- Form -->
					<form class="form-horizontal m-t-20" id="loginform">
						<div class="row p-b-30">
							<div class="col-12">
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text bg-success text-white"
											id="basic-addon1"><i class="ti-user"></i></span>
									</div>
									<input type="text" class="form-control form-control-lg"
										placeholder="아이디" aria-label="Username"
										aria-describedby="basic-addon1" id="userid">
								</div>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text bg-warning text-white"
											id="basic-addon2"><i class="ti-pencil"></i></span>
									</div>
									<input type="password" class="form-control form-control-lg"
										placeholder="비밀번호" aria-label="Password"
										aria-describedby="basic-addon1" id="userpwd">
								</div>
							</div>
						</div>
						<div class="row border-top border-secondary">
							<div class="col-12">
								<div class="form-group">
									<div class="p-t-20">
										<button class="btn btn-info" id="to-recover" type="button">
											<i class="fa fa-lock m-r-5"></i> 비밀번호 찾기
										</button>
										<input type="button" class="btn btn-success float-right"
											id="loginBtn" value="로그인">
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div id="loginResult" style="color: white; text-align: center;"></div>
				<div id="recoverform">
					<div class="text-center">
						<span class="text-white">Enter your e-mail address below
							and we will send you instructions how to recover a password.</span>
					</div>
					<div class="row m-t-20">
						<!-- Form -->
						<form class="col-12" action="index.html">
							<!-- email -->
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-danger text-white"
										id="basic-addon1"><i class="ti-email"></i></span>
								</div>
								<input type="text" class="form-control form-control-lg"
									placeholder="Email Address" aria-label="Username"
									aria-describedby="basic-addon1">
							</div>
							<!-- pwd -->
							<div class="row m-t-20 p-t-20 border-top border-secondary">
								<div class="col-12">
									<a class="btn btn-success" href="#" id="to-login" name="action">Back
										To Login</a>
									<button class="btn btn-info float-right" type="button"
										name="action">Recover</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- All Required js -->
	<!-- ============================================================== -->
	<script src="/sf/resources/assets/libs/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script
		src="/sf/resources/assets/libs/popper.js/dist/umd/popper.min.js"></script>
	<script
		src="/sf/resources/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- ============================================================== -->
	<!-- This page plugin js -->
	<!-- ============================================================== -->
	<script>
		$('[data-toggle="tooltip"]').tooltip();
		$(".preloader").fadeOut();
		// ============================================================== 
		// Login and Recover Password 
		// ============================================================== 
		$('#to-recover').on("click", function() {
			$("#loginform").slideUp();
			$("#recoverform").fadeIn();
		});
		$('#to-login').click(function() {

			$("#recoverform").hide();
			$("#loginform").fadeIn();
		});
	</script>
</body>
</html>