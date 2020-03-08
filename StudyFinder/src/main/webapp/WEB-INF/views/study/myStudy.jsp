<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
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
<title>스터디 조회</title>
<script src="/sf/resources/js/jquery-3.4.1.js"></script>
<script>
	$(function() {
		showClock();
		certi();
	});
	function showClock() {
		var currentDate = new Date();

		var apm = currentDate.getHours();
		if (apm < 12) {
			apm = "오전";
		} else {
			apm = "오후";
		}
		var msg = apm + (currentDate.getHours() - 12) + "시";
		msg += currentDate.getMinutes() + "분";
		msg += currentDate.getSeconds() + "초";

		$('h3#clock').html(msg);

		setTimeout(showClock, 1000);
	}

	function certi() {
		var curDate = new Date();
		var curYMD = curDate.getFullYear() + "/" + (curDate.getMonth() + 1)
				+ "/" + curDate.getDate() + "/";
		var curTime = curDate.getHours() + ":" + curDate.getMinutes();
		curTime = curYMD + curTime;
		//현재시간 날짜변환
		var curFullDate = new Date(curTime);

		var dueTime = $('#due_time').val();
		var limitTime = $('#limit_time').val();
		var penaltyMin = $('#penalty_min').val();
		var penaltyMoney = $('#penalty_money').val();

		//인증시간 날짜변환
		var dueDate = new Date(curYMD + dueTime);
		//마감시간 날짜변환
		var limitDate = new Date(curYMD + limitTime);
		//인증시간 계산 -> 버튼 활성화
		if (Math.floor(((limitDate - curFullDate) % (1000 * 60 * 60))
				/ (1000 * 60)) < 0) {
			$('#certiBtn').attr('disabled', 'disabled');
		} else {
			$('#certiBtn').removeAttr('disabled');
		}
		$('#certiBtn').on(
				'click',
				function() {

					var userid = "${sessionScope.userid}";
					var studyNo = "${study.study_no}";
					var studyInt = parseInt(studyNo, 10);
					var penalty_money;
					//몇분차이인지 계산
					var calcDist = Math
							.floor(((curFullDate - dueDate) % (1000 * 60 * 60))
									/ (1000 * 60));
					if (calcDist < 0) {
						penalty_money = 0;
					} else {
						penalty_money = Math.floor(calcDist / penaltyMin)
								* penaltyMoney;
					}
					$.ajax({
						url : '<c:url value="/study/check"/>',
						type : 'post',
						data : {
							userid : userid,
							study_no : studyInt,
							check_penalty : penalty_money
						},
						success : function(data) {
							if (data) {
								alert("인증에 성공했습니다.");
								$('#certiBtn').attr('disabled', 'disabled');
								$('#myPenalty').val(penalty_money);
								$('#myPenaltyTotal').val(
										parseInt($('#myPenaltyTotal').val())
												+ penalty_money);
							} else {
								alert("인증에 실패했습니다.");
								$('#certiBtn').removeAttr('disabled');
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
							href="<c:url value="/study/studyList"/>" aria-expanded="false">
								<i class="m-r-10 mdi mdi-human-greeting"></i><span
								class="hide-menu"> 스터디 찾기 </span>
						</a>
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="<c:url value="/study/myStudy"/>" aria-expanded="false"><i
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
					<div class="col-md-12 align-self-center">
						<div class="card-body" style="background: white;">
							<h3 class="text-themecolor">스터디 현황</h3>
							<hr>
						</div>
					</div>
				</div>
				<div class="form-group"></div>
				<!-- Row -->
				<div class="row">
					<!-- Column -->
					<div class="col-lg-4 col-xlg-3 col-md-5">
						<div class="card">
							<div class="card-body">
								<c:choose>
									<c:when test="${member.user_savedFileName != null}">
										<img
											src="/sf/resources/imgUpload/${member.user_savedFileName}"
											class="img-fluid rounded-circle">
									</c:when>
									<c:when test="${member.user_savedFileName == null}">
										<img src="/sf/resources/assets/images/users/1.jpg"
											class="img-fluid rounded-circle">
									</c:when>
								</c:choose>
							</div>
							<div class="card-body" style="text-align: center;">
								<h4 class="card-title m-t-10">[ID]: ${sessionScope.userid}</h4>
								<h6 class="card-subtitle"></h6>
								<br>
							</div>
						</div>
					</div>
					<!-- Column -->
					<div class="col-lg-8 col-xlg-9 col-md-7">
						<div class="card">
							<!-- Tab panes -->
							<div class="card-body">
								<div class="card-body">
									<h4 class="card-title m-t-10">스터디 정보 조회</h4>
									<hr>
									<c:if test="${requestScope.study == null}">
										<div class="form-group">
											<div class="col-sm-12"
												style="height: 400px; text-align: center; padding-top: 30%;">
												<h2 class="card-title">참여중인 스터디가 없습니다.</h2>
											</div>
										</div>
									</c:if>
									<c:if test="${requestScope.study != null}">
										<div class="form-group">
											<form class="form-horizontal form-material">
												<div class="form-group row">
													<label
														class="col-sm-2 text-center control-label col-form-label">스터디
														이름</label>
													<div class="col-sm-10">
														<input type="text" class="form-control form-control-line"
															value="${study.study_title}" readonly="readonly">
													</div>
												</div>
												<div class="form-group row">
													<label
														class="col-sm-2 text-center control-label col-form-label">관리자</label>
													<div class="col-sm-10">
														<input type="text" class="form-control form-control-line"
															value="${study.auth_userid}" readonly="readonly">
													</div>
												</div>
												<div class="form-group row">
													<label
														class="col-sm-2 text-center control-label col-form-label">지역
													</label>
													<div class="col-sm-10">
														<c:choose>
															<c:when test="${study.loc_no == 1}">
																<input type="text"
																	class="form-control form-control-line" value="서울"
																	readonly="readonly">
															</c:when>
															<c:when test="${study.loc_no == 2}">
																<input type="text"
																	class="form-control form-control-line" value="경기"
																	readonly="readonly">
															</c:when>
															<c:when test="${study.loc_no == 3}">
																<input type="text"
																	class="form-control form-control-line" value="경상"
																	readonly="readonly">
															</c:when>
															<c:when test="${study.loc_no == 4}">
																<input type="text"
																	class="form-control form-control-line" value="전라"
																	readonly="readonly">
															</c:when>
															<c:when test="${study.loc_no == 5}">
																<input type="text"
																	class="form-control form-control-line" value="제주"
																	readonly="readonly">
															</c:when>
														</c:choose>
													</div>
												</div>
												<div class="form-group row">
													<label
														class="col-sm-2 text-center control-label col-form-label">분야
													</label>
													<div class="col-sm-10">
														<c:choose>
															<c:when test="${study.field_no == 1}">
																<input type="text"
																	class="form-control form-control-line"
																	name="auth_userid" id="userid" value="자격증"
																	readonly="readonly">
															</c:when>
															<c:when test="${study.field_no == 2}">
																<input type="text"
																	class="form-control form-control-line"
																	name="auth_userid" id="userid" value="고시"
																	readonly="readonly">
															</c:when>
															<c:when test="${study.field_no == 3}">
																<input type="text"
																	class="form-control form-control-line"
																	name="auth_userid" id="userid" value="출석"
																	readonly="readonly">
															</c:when>
															<c:when test="${study.field_no == 4}">
																<input type="text"
																	class="form-control form-control-line"
																	name="auth_userid" id="userid" value="취업"
																	readonly="readonly">
															</c:when>
															<c:when test="${study.field_no == 5}">
																<input type="text"
																	class="form-control form-control-line"
																	name="auth_userid" id="userid" value="기타"
																	readonly="readonly">
															</c:when>
														</c:choose>
													</div>
												</div>
												<div class="form-group row">
													<label
														class="col-sm-2 text-center control-label col-form-label">레벨
													</label>
													<div class="col-sm-10">
														<c:choose>
															<c:when test="${study.study_level == 1}">
																<input type="text"
																	class="form-control form-control-line"
																	name="auth_userid" id="userid" value="초급"
																	readonly="readonly">
															</c:when>
															<c:when test="${study.study_level == 2}">
																<input type="text"
																	class="form-control form-control-line"
																	name="auth_userid" id="userid" value="중급"
																	readonly="readonly">
															</c:when>
															<c:when test="${study.study_level == 3}">
																<input type="text"
																	class="form-control form-control-line"
																	name="auth_userid" id="userid" value="고급"
																	readonly="readonly">
															</c:when>
															<c:when test="${study.study_level == 0}">
																<input type="text"
																	class="form-control form-control-line"
																	name="auth_userid" id="userid" value="해당없음"
																	readonly="readonly">
															</c:when>
														</c:choose>
													</div>
												</div>
												<div class="form-group row">
													<label
														class="col-sm-2 text-center control-label col-form-label">스터디
														규칙</label>
													<div class="col-sm-10">
														<textarea rows="3" cols="40" class="form-control"
															id="study_content" name="study_content"
															readonly="readonly" style="resize: none;">${study.study_content}</textarea>
													</div>
												</div>
											</form>
										</div>
										<div class="card-body">
											<h4 class="card-title m-t-10">참여중인 인원</h4>
											<hr>
											<div class="form-group row fluid">
												<c:forEach items="${memberList}" var="studyMember">
													<label
														class="col-sm-3 text-center control-label col-form-label">
														${studyMember.part_userid} </label>
													<div class="col-sm-3">
														<img src="/sf/resources/assets/images/users/1.jpg"
															alt="user" class="rounded-circle" width="50">
													</div>
												</c:forEach>
											</div>
										</div>
										<div class="card-body">
											<h4 class="card-title m-t-10">인증하기</h4>
											<hr>
											<div class="form-group row">
												<label
													class="col-sm-2 text-center control-label col-form-label">내벌금합계
												</label>
												<div class="col-sm-3">
													<input type="text" value="${myPenaltyTotal}"
														id="myPenaltyTotal" class="form-control form-control-line"
														readonly="readonly">
												</div>
												<label
													class="col-sm-1 text-center control-label col-form-label">원</label>
												<label
													class="col-sm-2 text-center control-label col-form-label">
													내 벌금 </label>
												<div class="col-sm-3">
													<input type="text" id="myPenalty"
														class="form-control form-control-line" readonly="readonly">
												</div>
												<label
													class="col-sm-1 text-center control-label col-form-label">원</label>
											</div>
											<hr>
											<div class="form-group row">
												<label
													class="col-sm-2 text-center control-label col-form-label">인증시간</label>
												<div class="col-sm-3">
													<input type="text" value="${study.due_time}" id="due_time"
														class="form-control form-control-line" readonly="readonly">
												</div>
												<label
													class="col-sm-1 text-center control-label col-form-label">까지</label>
												<label
													class="col-sm-2 text-center control-label col-form-label">
													인증마감</label>
												<div class="col-sm-3">
													<input type="text" value="${study.limit_time}"
														id="limit_time" class="form-control form-control-line"
														readonly="readonly">
												</div>
												<label
													class="col-sm-1 text-center control-label col-form-label">까지</label>
											</div>
											<div class="form-group row">
												<label
													class="col-sm-2 text-center control-label col-form-label">기준시간</label>
												<div class="col-sm-3">
													<input type="text" value="${study.penalty_min}"
														id="penalty_min" class="form-control form-control-line"
														readonly="readonly">
												</div>
												<label
													class="col-sm-1 text-center control-label col-form-label">분마다</label>
												<label
													class="col-sm-2 text-center control-label col-form-label">벌금액</label>
												<div class="col-sm-3">
													<input type="text" value="${study.penalty_money}"
														id="penalty_money" class="form-control form-control-line"
														readonly="readonly">
												</div>
												<label
													class="col-sm-1 text-center control-label col-form-label">원</label>
											</div>
											<hr>
											<div class="form-group row">
												<label
													class="col-sm-2 text-center control-label col-form-label">현재시간</label>
												<div class="col-sm-9">
													<div id="divClock" class="clock">
														<h3 class="card-title text-center form-control" id="clock"></h3>
													</div>
												</div>
											</div>
											<hr>
											<div class="col-12">
												<div class="form-group">
													<div class="p-t-20">
														<input type="button" id="certiBtn" class="btn btn-block btn-lg btn-info" value="인증하기"
>													</div>
												</div>
											</div>
										</div>
									</c:if>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-12" style="text-align: right;">
									<a href="<c:url value="/"/>"><input type="button"
										class="btn btn-secondary" value="돌아가기"></a>
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
	<!-- All Jquery -->
	<!-- ============================================================== -->
	<script src="/sf/resources/assets/libs/jquery/dist/jquery.min.js">
		
	</script>
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

</body>
</html>