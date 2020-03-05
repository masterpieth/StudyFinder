<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
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
<title>Insert title here</title>
<script>
	function goWrite() {
		location.href = '<c:url value="/study/createStudy"/>';
	};
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
						<li class="nav-item search-box"><a
							class="nav-link waves-effect waves-dark"
							href="javascript:void(0)"><i class="ti-search"></i></a>
							<form class="app-search position-absolute">
								<input type="text" class="form-control"
									placeholder="Search &amp; enter"> <a class="srh-btn"><i
									class="ti-close"></i></a>
							</form></li>
					</ul>
					<ul class="navbar-nav float-right">
						<c:choose>
							<c:when test="${sessionScope.userid != null}">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle waves-effect waves-dark"
									href="" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> <i class="mdi mdi-bell font-24"></i>
								</a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown">
										<a class="dropdown-item" href="#">Action</a> <a
											class="dropdown-item" href="#">Another action</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="#">Something else here</a>
									</div></li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic"
									href="" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"><img
										src="/sf/resources/assets/images/users/1.jpg" alt="user"
										class="rounded-circle" width="31"></a>
									<div class="dropdown-menu dropdown-menu-right user-dd animated">
										<a class="dropdown-item" href="javascript:void(0)"><i
											class="ti-user m-r-5 m-l-5"></i> 마이페이지</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="javascript:void(0)"><i
											class="ti-settings m-r-5 m-l-5"></i> 회원정보 수정</a>
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
							class="sidebar-link has-arrow waves-effect waves-dark"
							href="<c:url value="/study/studyList"/>" aria-expanded="false">
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
								<b>게시글 목록</b>
							</h3>
							<hr>
							<div class="row">
								<div class="col-md-12">
									<div class="card">
										<div class="card-body">
											<div class="form-group">
												<div class="row mb-3">
													<div class="col-lg-2">
														<select class="form-control form-control-line">
															<option>선택</option>
															<option>지역</option>
															<option>분야</option>
															<option>제목</option>
															<option>내용</option>
														</select>
													</div>
													<div class="col-lg-5">
														<input type="text" placeholder="검색어 입력"
															class="form-control">
													</div>
													<div class="col-lg-2">
														<button type="button" class="btn btn-info">검색</button>
													</div>
												</div>
											</div>
											<div class="table-responsive">
												<table class="table">
													<thead>
														<tr>
															<th>#</th>
															<th style="width: 8%">지역</th>
															<th style="width: 9%">분야</th>
															<th style="width: 11%">레벨</th>
															<th style="width: 40%">제목</th>
															<th style="width: 10%">조회수</th>
															<th style="width: 20%">작성일</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${studyList}" var="study">
															<tr>
															<td>${study.study_no}</td>
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
																<td><c:choose>
																		<c:when test="${study.study_level == 1}">초급</c:when>
																		<c:when test="${study.study_level == 2}">중급</c:when>
																		<c:when test="${study.study_level == 3}">고급</c:when>
																		<c:when test="${study.study_level == 0}">해당없음</c:when>
																	</c:choose></td>
																<td><a
																	href="<c:url value="/study/studyInfo?study_no=${study.study_no}"/>">${study.study_title}</a></td>
																<td>${study.study_hit}</td>
																<td>${study.study_inputdate}</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
										<div class="card-body">
											<div class="form-group">
												<div class="row mb-3">
													<div class="col-lg-2">
														<input type="button" class="btn btn-info" value="글작성"
															id="write" onclick="goWrite()">
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12"></div>
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