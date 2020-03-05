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
<title>회원가입</title>
<link
	href="${pageContext.request.contextPath}/resources/dist/css/style.min.css"
	rel="stylesheet">
<script src="/sf/resources/js/jquery-3.4.1.js"></script>
<script>
	$(function() {
		idCheck();
		$('#signupForm')
				.submit(
						function() {
							idCheck();
							var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
							var userIdCheck = RegExp(/^[A-Za-z0-9]{5,20}$/);

							if ($('#userid').val() == "") {
								$('#idConfirmDiv').html("아이디를 입력해주세요.");
								$('#userid').focus();
								return false;
							} else {
								$('#idConfirmDiv').html("");
							}
							if (!userIdCheck.test($.trim($('#userid').val()))) {
								$('#idConfirmDiv').html("아이디 형식이 올바르지 않습니다.");
								$('#userid').focus();
								return false;
							} else {
								$('#idConfirmDiv').html("");
							}
							if ($('#userEmail').val() == "") {
								$('#emailDiv').html("이메일을 입력하세요.");
								$('#userEmail').focus();
								return false;
							} else {
								$('#emailDiv').html("");
							}
							if (!emailCheck.test($('#userEmail').val())) {
								$('#emailDiv').html("이메일 형식이 올바르지 않습니다.");
								$('#userEmail').focus();
								return false;
							} else {
								$('#emailDiv').html("");
							}
							if ($('#userpwd').val() == "") {
								$('#pwdDiv').html("비밀번호를 입력하세요.");
								$('#userpwd').focus();
								return false;
							} else {
								$('#pwdDiv').html("");
							}
							if ($('#pwdConfirm').val() == "") {
								$('#pwdConfirmDiv').html("비밀번호 확인을 입력하세요.");
								$('#pwdConfirm').focus();
								return false;
							} else {
								$('#pwdConfirmDiv').html("");
							}
							if ($('#userpwd').val() != $('#pwdConfirm').val()) {
								$('#pwdConfirmDiv').html("비밀번호가 일치하지 않습니다.");
								$('#pwdConfirm').focus();
								return false;
							} else {
								$('#pwdConfirmDiv').html("");
							}
							if ($('#field_no').val() == "0") {
								$('#fieldDiv').html("분야를 선택하세요.");
								return false;
							} else {
								$('#fieldDiv').html("");
							}
							if ($('#loc_no').val() == "0") {
								$('#locDiv').html("지역을 선택하세요.");
								return false;
							} else {
								$('#locDiv').html("");
							}
						});
	});
	
	function idCheck() {
		$('#userid').on('blur', function() {
			var id = $(this).val();
			$.ajax({
				url : "idCheck",
				type : "post",
				data : {
					userid : id
				},
				success : function(data) {
					console.log(data);
					if (data) {
						$('#idConfirmDiv').html("이미 사용중인 아이디입니다.");
						idCheck();
						return false;
					} else {
						$('#idConfirmDiv').html("사용 가능한 아이디입니다.");
						return true;
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
				<div>
					<div class="text-center p-t-20 p-b-20">
						<span class="db"><img
							src="/sf/resources/assets/images/logo.png" alt="logo" /></span>
					</div>
					<!-- Form -->
					<form class="form-horizontal m-t-20"
						action="<c:url value="/member/signup"/>" method="post"
						id="signupForm">
						<div class="row p-b-30">
							<div class="col-12">
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text bg-success text-white"
											id="basic-addon1"><i class="ti-user"></i></span>
									</div>
									<input type="text" class="form-control form-control-lg"
										placeholder="4~12자리 숫자와 문자만 가능" aria-label="Username"
										aria-describedby="basic-addon1" name="userid" id="userid"
										required="required">
								</div>
								<div class="input-group mb-3">
									<div id="idConfirmDiv"
										style="color: white; text-align: center;"></div>
								</div>
								<!-- email -->
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text bg-danger text-white"
											id="basic-addon1"><i class="ti-email"></i></span>
									</div>
									<input type="email" class="form-control form-control-lg"
										placeholder="ex) userid@studyfinder.com" aria-label="Username"
										aria-describedby="basic-addon1" id="userEmail"
										name="userEmail">
								</div>
								<div class="input-group mb-3">
									<div id="emailDiv" style="color: white;"></div>
								</div>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text bg-warning text-white"
											id="basic-addon2"><i class="ti-pencil"></i></span>
									</div>
									<input type="password" class="form-control form-control-lg"
										placeholder="비밀번호" aria-label="Password"
										aria-describedby="basic-addon1" id="userpwd" name="userpwd">
								</div>
								<div class="input-group mb-3">
									<div id="pwdDiv" style="color: white;"></div>
								</div>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text bg-info text-white"
											id="basic-addon2"><i class="ti-pencil"></i></span>
									</div>
									<input type="password" class="form-control form-control-lg"
										placeholder="비밀번호 재입력" aria-label="Password"
										aria-describedby="basic-addon1" id="pwdConfirm">
								</div>
								<div class="input-group mb-3" id="pwdDiv">
									<div id="pwdConfirmDiv" style="color: white;"></div>
								</div>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text bg-cyan text-white"
											id="basic-addon2"><i class="ti-pencil"></i></span>
									</div>
									<select id="field_no" name="field_no"
										class="form-control form-control-line">
										<option value="0" selected="selected">분야</option>
										<option value="1">자격증</option>
										<option value="2">고시</option>
										<option value="3">출석</option>
										<option value="4">취업</option>
										<option value="5">기타</option>
									</select>
								</div>
								<div class="input-group mb-3">
									<div id="fieldDiv" style="color: white;"></div>
								</div>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text bg-cyan text-white"
											id="basic-addon2"><i class="ti-pencil"></i></span>
									</div>
									<select id="loc_no" name="loc_no"
										class="form-control form-control-line">
										<option value="0" selected="selected">지역</option>
										<option value="1">서울</option>
										<option value="2">경기</option>
										<option value="3">경상</option>
										<option value="4">전라</option>
										<option value="5">제주</option>
									</select>
								</div>
								<div class="input-group mb-3">
									<div id="locDiv" style="color: white;"></div>
								</div>
							</div>
						</div>
						<div class="row border-top border-secondary">
							<div class="col-12">
								<div class="form-group">
									<div class="p-t-20">
										<input type="submit" class="btn btn-block btn-lg btn-info"
											value="회원가입">
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="/sf/resources/assets/libs/jquery/dist/jquery.min.js"></script>
	<script
		src="/sf/resources/assets/libs/popper.js/dist/umd/popper.min.js"></script>
	<script
		src="/sf/resources/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<script>
		$('[data-toggle="tooltip"]').tooltip();
		$(".preloader").fadeOut();
	</script>
</body>
</html>