<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/resources/assets/images/favicon.png">
<link
	href="${pageContext.request.contextPath}/resources/assets/libs/fullcalendar/dist/fullcalendar.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/assets/extra-libs/calendar/calendar.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/dist/css/style.min.css"
	rel="stylesheet">
<title>글수정</title>
<script src="/sf/resources/js/jquery-3.4.1.js"></script>
<script>
	$(function() {
		var radioVal = "${study.study_level}";
		$()
	});

	function inputTimeColon(time) {

		var replaceTime = time.value.replace(/\:/g, "");

		if (replaceTime.length >= 4 && replaceTime.length < 5) {

			var hours = replaceTime.substring(0, 2);
			var minute = replaceTime.substring(2, 4);

			if (isFinite(hours + minute) == false) {
				alert("문자는 입력하실 수 없습니다.");
				time.value = "00:00";
				return false;
			}

			if (hours + minute > 2400) {
				alert("시간은 24시를 넘길 수 없습니다.");
				time.value = "24:00";
				return false;
			}

			if (minute > 60) {
				alert("분은 60분을 넘길 수 없습니다.");
				time.value = hours + ":00";
				return false;
			}
			time.value = hours + ":" + minute;
		}
	}
</script>
</head>
<body>
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
	<div id="main-wrapper">
		<header class="topbar" data-navbarbg="skin5">
			<nav class="navbar top-navbar navbar-expand-md navbar-dark">
				<div class="navbar-header" data-logobg="skin5">
					<a class="nav-toggler waves-effect waves-light d-block d-md-none"
						href="javascript:void(0)"><i class="ti-menu ti-close"></i></a> <a
						class="navbar-brand" href="<c:url value="/"/>"> <b
						class="logo-icon p-l-10"> <img
							src="/sf/resources/assets/images/logo-icon.png" alt="homepage"
							class="light-logo" />
					</b> <span class="logo-text"> <img
							src="/sf/resources/assets/images/logo-text.png" alt="homepage"
							class="light-logo" />
					</span>
					</a> <a
						class="topbartoggler d-block d-md-none waves-effect waves-light"
						href="javascript:void(0)" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation"><i class="ti-more"></i></a>
				</div>
				<div class="navbar-collapse collapse" id="navbarSupportedContent"
					data-navbarbg="skin5">
					<ul class="navbar-nav float-left mr-auto">
						<li class="nav-item d-none d-md-block"><a
							class="nav-link sidebartoggler waves-effect waves-light"
							href="javascript:void(0)" data-sidebartype="mini-sidebar"><i
								class="mdi mdi-menu font-24"></i></a></li>
					</ul>
					<ul class="navbar-nav float-right">
						<c:choose>
							<c:when test="${sessionScope.userid != null}">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic"
									href="" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"><c:choose>
											<c:when
												test="${sessionScope.member.user_savedFileName != null }">
												<img
													src="/sf/resources/imgUpload/${member.user_savedFileName}"
													alt="user" class="rounded-circle" width="31">
											</c:when>
											<c:when
												test="${sessionScope.member.user_savedFileName == null }">
												<img src="/sf/resources/assets/images/users/1.jpg"
													alt="user" class="rounded-circle" width="31">
											</c:when>
										</c:choose></a>
									<div class="dropdown-menu dropdown-menu-right user-dd animated">
										<a class="dropdown-item" href="javascript:void(0)"><i
											class="ti-user m-r-5 m-l-5"></i> ${sessionScope.userid} 님</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item"
											href="<c:url value="/member/myPage"/>"><i
											class="ti-user m-r-5 m-l-5"></i> 마이페이지</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item"
											href="<c:url value="/member/logout"/>"> <i
											class="fa fa-power-off m-r-5 m-l-5"></i> 로그아웃
										</a>
									</div></li>
							</c:when>
							<c:otherwise>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic"
									href="" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"><img
										src="/sf/resources/assets/images/users/1.jpg" alt="user"
										class="rounded-circle" width="31"></a>
									<div class="dropdown-menu dropdown-menu-right user-dd animated">
										<a class="dropdown-item"
											href="<c:url value="/member/signup"/>"><i
											class="ti-user m-r-5 m-l-5"></i> 회원가입</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="<c:url value="/member/login"/>"><i
											class="fa fa-power-off m-r-5 m-l-5"></i> 로그인</a>
									</div></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</nav>
		</header>
		<aside class="left-sidebar" data-sidebarbg="skin5">
			<!-- Sidebar scroll-->
			<div class="scroll-sidebar">
				<!-- Sidebar navigation-->
				<nav class="sidebar-nav">
					<ul id="sidebarnav" class="p-t-30">
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="<c:url value="/board/boardList"/>" aria-expanded="false">
								<i class="m-r-10 mdi mdi-human-greeting"></i><span
								class="hide-menu"> 스터디 찾기 </span>
						</a>
							<ul aria-expanded="false" class="collapse  first-level">
							</ul></li>
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="charts.html" aria-expanded="false"><i
								class="m-r-10 mdi mdi-clipboard-check"></i><span
								class="hide-menu"> 스터디 현황</span></a></li>
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="<c:url value="/study/createStudy"/>" aria-expanded="false"><i
								class="m-r-10 mdi mdi-border-color"></i><span class="hide-menu">
									스터디 만들기</span></a></li>
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="<c:url value="/member/myPage"/>" aria-expanded="false"><i
								class="m-r-10 mdi mdi-account"></i><span class="hide-menu">
									마이페이지</span></a></li>
					</ul>
				</nav>
			</div>
		</aside>
		<div class="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="card card-body printableArea">
							<h3>
								<b>스터디 수정</b>
							</h3>
							<hr>
							<div class="row">
								<div class="col-md-12">
									<div class="card">
										<div class="card-body">
											<form action="<c:url value="/study/updateStudy"/>"
												method="post" id="studyForm">
												<div class="form-group row">
													<label
														class="col-sm-2 text-center control-label col-form-label">스터디
														이름</label>
													<div class="col-sm-10">
														<input type="text" class="form-control form-control-line"
															name="study_title" placeholder="스터디명 입력"
															value="${study.study_title}"> <input
															type="hidden" name="study_no" value="${study.study_no}">
													</div>
												</div>
												<div class="form-group row">
													<label
														class="col-sm-2 text-center control-label col-form-label">작성자</label>
													<div class="col-sm-10">
														<input type="text" class="form-control form-control-line"
															name="auth_userid" id="userid"
															value="${sessionScope.userid}" readonly="readonly">
													</div>
												</div>
												<div class="form-group row">
													<label
														class="col-sm-2 text-center control-label col-form-label">지역</label>
													<div class="col-sm-10">
														<select name="loc_no"
															class="form-control form-control-line">
															<option value="1">서울</option>
															<option value="2">경기</option>
															<option value="3">경상</option>
															<option value="4">전라</option>
															<option value="5">제주</option>
														</select>
													</div>
												</div>
												<div class="form-group row">
													<label
														class="col-sm-2 text-center control-label col-form-label">분야</label>
													<div class="col-sm-10">
														<select name="field_no"
															class="form-control form-control-line">
															<option value="1">자격증</option>
															<option value="2">고시</option>
															<option value="3">출석</option>
															<option value="4">취업</option>
															<option value="5">기타</option>
														</select>
													</div>
												</div>
												<div class="form-group row">
													<label
														class="col-sm-2 text-center control-label col-form-label">레벨</label>
													<div class="col-sm-10">
														<div class="custom-control custom-radio">
															<input type="radio" class="custom-control-input"
																id="customControlValidation1" name="study_level"
																value="1" checked="checked"> <label
																class="custom-control-label"
																for="customControlValidation1">초급</label>
														</div>
														<div class="custom-control custom-radio">
															<input type="radio" class="custom-control-input"
																id="customControlValidation2" name="study_level"
																value="2"> <label class="custom-control-label"
																for="customControlValidation2">중급</label>
														</div>
														<div class="custom-control custom-radio">
															<input type="radio" class="custom-control-input"
																id="customControlValidation3" name="study_level"
																value="3"> <label class="custom-control-label"
																for="customControlValidation3">고급</label>
														</div>
														<div class="custom-control custom-radio">
															<input type="radio" class="custom-control-input"
																id="customControlValidation4" name="study_level"
																value="0"> <label class="custom-control-label"
																for="customControlValidation4">해당없음</label>
														</div>
													</div>
												</div>
												<div class="form-group row">
													<label
														class="col-sm-2 text-center control-label col-form-label">인원수</label>
													<div class="col-sm-10">
														<input type="number"
															class="form-control form-control-line"
															name="study_headCount" placeholder="최소 2명, 최대 10명"
															min="2" max="10" value="${study.study_headCount}"
															readonly="readonly">
													</div>
												</div>
												<div class="form-group row">
													<label
														class="col-sm-2 text-center control-label col-form-label">스터디
														규칙</label>
													<div class="col-sm-10">
														<textarea rows="3" cols="40" class="form-control"
															name="study_content" style="resize: none;">${study.study_content}</textarea>
													</div>
												</div>
												<div class="form-group row">
													<label
														class="col-sm-2 text-center control-label col-form-label">체크시간</label>
													<div class="col-sm-10">
														<input type="text" class="form-control form-control-line"
															name="due_time" onKeyup="inputTimeColon(this);"
															placeholder="인증 제출시간 입력: HH:MM까지 인증" maxlength="5"
															value="${study.due_time}">
													</div>
												</div>
												<div class="form-group row">
													<label
														class="col-sm-2 text-center control-label col-form-label">벌금기준</label>
													<div class="col-sm-10">
														<input type="number"
															class="form-control form-control-line" name="penalty_min"
															placeholder="벌금 기준 시간 입력: MM분마다" min="0" max="60"
															value="${study.penalty_min}">
													</div>
												</div>
												<div class="form-group row">
													<label
														class="col-sm-2 text-center control-label col-form-label">벌금</label>
													<div class="col-sm-10">
														<input type="number"
															class="form-control form-control-line"
															name="penalty_money" placeholder="벌금입력" min="0"
															value="${study.penalty_money}">
													</div>
												</div>
												<div class="form-group row">
													<label
														class="col-sm-2 text-center control-label col-form-label">결석기준</label>
													<div class="col-sm-10">
														<input type="text" class="form-control form-control-line"
															name="limit_time" onKeyup="inputTimeColon(this);"
															placeholder="결석 기준 시간 입력: HH:MM이후 결석" maxlength="5"
															value="${study.limit_time}">
													</div>
												</div>
												<hr>
												<div class="form-group row">
													<div class="col-md-12 text-right">
														<input type="submit" class="btn btn-info" value="글수정">
														<input type="button" class="btn btn-dark" value="돌아가기">
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<footer class="footer text-center"> CopyRight. </footer>
	</div>
	<script src="/sf/resources/assets/libs/jquery/dist/jquery.min.js"></script>
	<script src="/sf/resources/dist/js/jquery.ui.touch-punch-improved.js"></script>
	<script src="/sf/resources/dist/js/jquery-ui.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script
		src="/sf/resources/assets/libs/popper.js/dist/umd/popper.min.js"></script>
	<script
		src="/sf/resources/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- slimscrollbar scrollbar JavaScript -->
	<script
		src="/sf/resources/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script src="/sf/resources/assets/extra-libs/sparkline/sparkline.js"></script>
	<!--Wave Effects -->
	<script src="/sf/resources/dist/js/waves.js"></script>
	<!--Menu sidebar -->
	<script src="/sf/resources/dist/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script src="/sf/resources/dist/js/custom.min.js"></script>
	<!-- this page js -->
	<script src="/sf/resources/assets/libs/moment/min/moment.min.js"></script>
	<script
		src="/sf/resources/assets/libs/fullcalendar/dist/fullcalendar.min.js"></script>
	<script src="/sf/resources/dist/js/pages/calendar/cal-init.js"></script>
</body>
</html>