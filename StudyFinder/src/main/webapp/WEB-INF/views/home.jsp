<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/resources/assets/images/favicon.png">

<title>메인페이지</title>
<link
	href="${pageContext.request.contextPath}/resources/assets/libs/fullcalendar/dist/fullcalendar.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/assets/extra-libs/calendar/calendar.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/dist/css/style.min.css"
	rel="stylesheet">
<script>
	function studyList() {
		location.href = '<c:url value="/study/studyList"/>';
	};
	function myPage() {
		location.href = '<c:url value="/member/myPage"/>';
	};
	function myStudy() {
		location.href = '<c:url value="/study/myStudy"/>';
	};
	function createStudy() {
		location.href = '<c:url value="/study/createStudy"/>';
	};
</script>
</head>
<body>

	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<!-- ============================================================== -->
		<header class="topbar" data-navbarbg="skin5">
			<nav class="navbar top-navbar navbar-expand-md navbar-dark">
				<div class="navbar-header" data-logobg="skin5">
					<!-- This is for the sidebar toggle which is visible on mobile only -->
					<a class="nav-toggler waves-effect waves-light d-block d-md-none"
						href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
					<!-- ============================================================== -->
					<!-- Logo -->
					<!-- ============================================================== -->
					<a class="navbar-brand" href="<c:url value="/"/>"> <b
						class="logo-icon p-l-10"> <img
							src="/sf/resources/assets/images/logo-icon.png" alt="homepage"
							class="light-logo" />
					</b> <span class="logo-text"> <img
							src="/sf/resources/assets/images/logo-text.png" alt="homepage"
							class="light-logo" />
					</span>
					</a>
					<!-- ============================================================== -->
					<!-- End Logo -->
					<!-- ============================================================== -->
					<!-- ============================================================== -->
					<!-- Toggle which is visible on mobile only -->
					<!-- ============================================================== -->
					<a class="topbartoggler d-block d-md-none waves-effect waves-light"
						href="javascript:void(0)" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation"><i class="ti-more"></i></a>
				</div>
				<!-- ============================================================== -->
				<!-- End Logo -->
				<!-- ============================================================== -->
				<div class="navbar-collapse collapse" id="navbarSupportedContent"
					data-navbarbg="skin5">
					<!-- ============================================================== -->
					<!-- toggle and nav items -->
					<!-- ============================================================== -->
					<ul class="navbar-nav float-left mr-auto">
						<li class="nav-item d-none d-md-block"><a
							class="nav-link sidebartoggler waves-effect waves-light"
							href="javascript:void(0)" data-sidebartype="mini-sidebar"><i
								class="mdi mdi-menu font-24"></i></a></li>
					</ul>
					<!-- ============================================================== -->
					<!-- Right side toggle and nav items -->
					<!-- ============================================================== -->
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
		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
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
							<ul aria-expanded="false" class="collapse  first-level">
							</ul></li>
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
				<!-- End Sidebar navigation -->
			</div>
			<!-- End Sidebar scroll-->
		</aside>
		<!-- ============================================================== -->
		<!-- End Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<div class="row">
					<!-- Column -->
					<div class="col-md-6 col-lg-3">
						<div class="card card-hover" onclick="studyList()">
							<div class="box bg-cyan text-center">
								<h1 class="font-`light text-white">
									<i class="m-r-10 mdi mdi-human-greeting"></i>
								</h1>
								<h6 class="text-white">스터디 찾기</h6>
							</div>
						</div>
					</div>
					<!-- Column -->
					<div class="col-md-6 col-lg-3">
						<div class="card card-hover" onclick="myStudy()">
							<div class="box bg-success text-center">
								<h1 class="font-light text-white">
									<i class="m-r-10 mdi mdi-clipboard-check"></i>
								</h1>
								<h6 class="text-white">스터디 현황</h6>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-3">
						<div class="card card-hover" onclick="createStudy()">
							<div class="box bg-warning text-center">
								<h1 class="font-light text-white">
									<i class="mdi mdi-border-color"></i>
								</h1>
								<h6 class="text-white">스터디 만들기</h6>
							</div>
						</div>
					</div>
					<!-- Column -->
					<div class="col-md-6 col-lg-3">
						<div class="card card-hover" onclick="myPage()">
							<div class="box bg-danger text-center">
								<h1 class="font-light text-white">
									<i class="m-r-10 mdi mdi-account"></i>
								</h1>
								<h6 class="text-white">마이페이지</h6>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6">
						<div class="card">
							<div class="card-body todo-widget scrollable"
								style="height: 485px;">
								<h4 class="card-title">최신 스터디</h4>
								<div class="card" style="text-align: right;">
									<a href="<c:url value="/study/studyList"/>">더보기</a>
								</div>
								<table class="table">
									<tr>
										<th style="width: 20%">지역</th>
										<th style="width: 20%">분야</th>
										<th style="width: 45%">제목</th>
										<th>인원</th>
									</tr>
									<c:forEach items="${studyList}" var="study">
										<tr>
											<td><c:choose>
													<c:when test="${study.loc_no == 1}">서울</c:when>
													<c:when test="${study.loc_no == 2}">경기</c:when>
													<c:when test="${study.loc_no == 3}">경상</c:when>
													<c:when test="${study.loc_no == 4}">전라</c:when>
													<c:when test="${study.loc_no == 5}">제주</c:when>
												</c:choose></td>
											<td><c:choose>
													<c:when test="${study.field_no == 1}">자격증</c:when>
													<c:when test="${study.field_no == 2}">고시</c:when>
													<c:when test="${study.field_no == 3}">출석</c:when>
													<c:when test="${study.field_no == 4}">취업</c:when>
													<c:when test="${study.field_no == 5}">기타</c:when>
												</c:choose></td>
											<td><a
												href="<c:url value="/study/studyInfo?study_no=${study.study_no}"/>">${study.study_title}</a></td>
											<td>${study.study_headCount}</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="card">
							<div class="card-body todo-widget scrollable"
								style="height: 225px;">
								<h4 class="card-title">개설중인 스터디 목록</h4>
								<div class="card" style="text-align: right;">
									<a href="<c:url value="/study/myStudy"/>">더보기</a>
								</div>
								<table class="table">
									<tr>
										<th style="width: 20%">지역</th>
										<th style="width: 20%">분야</th>
										<th style="width: 45%">제목</th>
										<th>인원</th>
									</tr>
									<c:choose>
										<c:when test="${myStudyList != null}">
											<c:forEach items="${myStudyList}" var="study">
												<tr>
													<td><c:choose>
															<c:when test="${study.loc_no == 1}">서울</c:when>
															<c:when test="${study.loc_no == 2}">경기</c:when>
															<c:when test="${study.loc_no == 3}">경상</c:when>
															<c:when test="${study.loc_no == 4}">전라</c:when>
															<c:when test="${study.loc_no == 5}">제주</c:when>
														</c:choose></td>
													<td><c:choose>
															<c:when test="${study.field_no == 1}">자격증</c:when>
															<c:when test="${study.field_no == 2}">고시</c:when>
															<c:when test="${study.field_no == 3}">출석</c:when>
															<c:when test="${study.field_no == 4}">취업</c:when>
															<c:when test="${study.field_no == 5}">기타</c:when>
														</c:choose></td>
													<td><a
														href="<c:url value="/study/seeMyStudy?study_no=${study.study_no}"/>">${study.study_title}</a></td>
													<td>${study.study_headCount}</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:when test="${myStudyList == null}">
											<div class="card-body">
												<h4 class="card-title">개설중인 스터디가 없습니다.</h4>
											</div>
										</c:when>
									</c:choose>
								</table>
							</div>
							<hr>
							<div class="card-body todo-widget scrollable"
								style="height: 225px;">
								<h4 class="card-title">참여중인 스터디 목록</h4>
								<div class="card" style="text-align: right;">
								</div>
								<table class="table">
									<tr>
										<th style="width: 20%">지역</th>
										<th style="width: 20%">분야</th>
										<th style="width: 45%">제목</th>
										<th>인원</th>
									</tr>
									<c:choose>
										<c:when test="${myPartStudyList != null}">
											<c:forEach items="${myPartStudyList}" var="study">
												<tr>
													<td><c:choose>
															<c:when test="${study.loc_no == 1}">서울</c:when>
															<c:when test="${study.loc_no == 2}">경기</c:when>
															<c:when test="${study.loc_no == 3}">경상</c:when>
															<c:when test="${study.loc_no == 4}">전라</c:when>
															<c:when test="${study.loc_no == 5}">제주</c:when>
														</c:choose></td>
													<td><c:choose>
															<c:when test="${study.field_no == 1}">자격증</c:when>
															<c:when test="${study.field_no == 2}">고시</c:when>
															<c:when test="${study.field_no == 3}">출석</c:when>
															<c:when test="${study.field_no == 4}">취업</c:when>
															<c:when test="${study.field_no == 5}">기타</c:when>
														</c:choose></td>
													<td><a
														href="<c:url value="/study/seeMyStudy?study_no=${study.study_no}"/>">${study.study_title}</a></td>
													<td>${study.study_headCount}</td>
												</tr>
											</c:forEach>
										</c:when>
									</c:choose>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="row">
								<div class="card-body b-l calender-sidebar">
									<div id="calendar"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- End PAge Content -->
				<!-- ============================================================== -->
			</div>
			<!-- ============================================================== -->
			<!-- End Container fluid  -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- footer -->
			<!-- ============================================================== -->
			<footer class="footer text-center"> CopyRight. </footer>
			<!-- ============================================================== -->
			<!-- End footer -->
			<!-- ============================================================== -->
		</div>
	</div>
	<script src="resources/assets/libs/jquery/dist/jquery.min.js"></script>
	<script src="resources/dist/js/jquery.ui.touch-punch-improved.js"></script>
	<script src="resources/dist/js/jquery-ui.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script src="resources/assets/libs/popper.js/dist/umd/popper.min.js"></script>
	<script src="resources/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- slimscrollbar scrollbar JavaScript -->
	<script
		src="resources/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script src="resources/assets/extra-libs/sparkline/sparkline.js"></script>
	<!--Wave Effects -->
	<script src="resources/dist/js/waves.js"></script>
	<!--Menu sidebar -->
	<script src="resources/dist/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script src="resources/dist/js/custom.min.js"></script>
	<!-- this page js -->
	<script src="resources/assets/libs/moment/min/moment.min.js"></script>
	<script
		src="resources/assets/libs/fullcalendar/dist/fullcalendar.min.js"></script>
	<script src="resources/dist/js/pages/calendar/cal-init.js"></script>
</body>
</html>