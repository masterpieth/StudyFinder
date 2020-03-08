<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html dir="ltr">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" type="image/png" sizes="16x16"
	href="/sf/resources/assets/images/favicon.png">
<title>500에러페이지</title>
<link href="/sf/resources/dist/css/style.min.css" rel="stylesheet">
</head>

<body>
	<div class="main-wrapper">
		<div class="preloader">
			<div class="lds-ripple">
				<div class="lds-pos"></div>
				<div class="lds-pos"></div>
			</div>
		</div>
		<div class="error-box">
			<div class="error-body text-center">
				<h1 class="error-title text-danger">500</h1>
				<h3 class="text-uppercase error-subtitle">페이지를 찾을 수 없습니다!</h3>
				<p class="text-muted m-t-30 m-b-30">잘못된 요청입니다.</p>
				<a href="<c:url value="/"/>"
					class="btn btn-danger btn-rounded waves-effect waves-light m-b-40">메인페이지로 돌아가기</a>
			</div>
		</div>
	</div>
	<script src="/sf/resources/assets/libs/jquery/dist/jquery.min.js"></script>
	<script src="/sf/resources/assets/libs/popper.js/dist/umd/popper.min.js"></script>
	<script src="/sf/resources/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<script>
		$('[data-toggle="tooltip"]').tooltip();
		$(".preloader").fadeOut();
	</script>
</body>

</html>