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
<title>글읽기</title>
<script src="/sf/resources/js/jquery-3.4.1.js"></script>
<script>
	$(function() {
		deleteStudy();
		writeReply();
		deleteReply();
		insertStudyMember();
	});

	function deleteStudy() {
		$('#deleteBtn').on('click', function() {
			var s_no = '${study.study_no}';

			$.ajax({
				url : "deleteStudy",
				type : "get",
				data : {
					study_no : s_no
				},
				success : function(data) {
					if (data) {
						location.href = '<c:url value="/study/studyList"/>';
					} else {
						$('#deleteResult').html("삭제에 실패하였습니다.");
						deleteStudy();
					}
				},
				error : function() {
				}
			});
		});
	}
	function writeReply() {
		$('#replyBtn').on('click', function() {
			var replyContent = $('#b_content').val();
			var loginId = "${sessionScope.userid}";
			var studyNum = "${study.study_no}";

			var paramObj = {
				study_no : studyNum,
				userid : loginId,
				reply_text : replyContent
			};

			$.ajax({
				url : "writeReply",
				type : "post",
				data : JSON.stringify(paramObj),
				contentType : "application/json",
				success : function(data) {
					$('#replyUserid').html(loginId);
					$('#b_content').val("");
					replyOutput(data);
					deleteReply();
				},
				error : function() {
				}
			});
		});
	}

	function replyOutput(data) {
		var str = '';
		$
				.each(
						data,
						function(index, item) {
							str += '<tr><td>' + item.reply_no + '</td>';
							str += '<td>' + item.userid + '</td>';
							str += '<td>' + item.reply_text + '</td>';
							str += '<td>' + item.reply_inputdate + '</td>';
							if (item.userid == "${sessionScope.userid}") {
								str += '<td><input type="button" class="btn btn-secondary deleteReplyBtn" value="삭제"></td></tr>';
							} else if ("${study.auth_userid}" == "${sessionScope.userid}"
									&& item.permission == 0) {
								str += '<td><input type="button" class="btn btn-info joinBtn" id="rno'+ item.reply_no +'" value="승인"></td></tr>';
							} else if ("${study.auth_userid}" == "${sessionScope.userid}"
									&& item.permission == 1) {
								str += '<td><input type="button" class="btn btn-info joinBtn" id="rno'+ item.reply_no +'" disabled="disabled" value="승인"></td></tr>'
							}
						});
		$('#replyTbody').html(str);
	}

	function deleteReply() {
		$('.deleteReplyBtn').on('click', function() {
			var replyNo = $(this).closest('tr').find('td').eq(0).text();
			var studyNo = "${study.study_no}";
			var studyNoInt = parseInt(studyNo, 10);
			$.ajax({
				url : "deleteReply",
				type : "get",
				data : {
					reply_no : replyNo,
					study_no : studyNoInt
				},
				success : function(data) {
					replyOutput(data);
					deleteReply();
				},
				error : function(e) {
					console.log(e);
				}
			});
		});
	}
	function insertStudyMember() {
		$('.joinBtn')
				.on(
						'click',
						function() {
							var studyNo = "${study.study_no}";
							var studyNoInt = parseInt(studyNo, 10);

							var replyNo = $(this).closest('tr').find('td')
									.eq(0).text();
							var replyNoInt = parseInt(replyNo, 10);
							var targetBtnId = "rno" + replyNo;

							var part_user = $(this).closest('tr').find('td')
									.eq(1).text();
							var auth_user = "${study.auth_userid}";

							var data = {
								study_no : studyNoInt,
								auth_userid : auth_user,
								part_userid : part_user
							};
							var jsonData = JSON.stringify(data);
							$
									.ajax({
										url : "insertStudyMember",
										type : "post",
										data : jsonData,
										contentType : "application/json; charset=UTF-8",
										success : function(data) {
											if (data) {
												var per = {
													study_no : studyNoInt,
													reply_no : replyNoInt
												};

												alert("승인에 성공하였습니다.");
												$(
														'#'
																+ $
																		.escapeSelector(targetBtnId))
														.attr('disabled',
																'disabled');
												updatePermission(per);
											} else {
												alert("승인에 실패하였습니다.");
											}
										},
										error : function(e) {
											console.log(e);
										}
									});
						});
	}
	function updatePermission(per) {
		var pJsonData = JSON.stringify(per);
		console.log(pJsonData);
		$.ajax({
			url : "updatePermission",
			type : "post",
			data : pJsonData,
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				replyOutput(data);
			},
			error : function() {
			}
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
			</div>
		</aside>
		<div class="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="card card-body printableArea">
							<h3>
								<b>스터디 조회</b>
							</h3>
							<hr>
							<div class="row">
								<div class="col-md-12">
									<div class="card">
										<div class="card-body">
											<form action="<c:url value="/study/createStudy"/>"
												method="post" id="studyForm">
												<div class="form-group row">
													<label
														class="col-sm-2 text-center control-label col-form-label">스터디
														이름</label>
													<div class="col-sm-10">${study.study_title}</div>
												</div>
												<hr>
												<div class="form-group row">
													<label
														class="col-sm-2 text-center control-label col-form-label">작성자</label>
													<div class="col-sm-10">
														<input type="text" class="form-control form-control-line"
															name="auth_userid" id="userid"
															value="${study.auth_userid}" readonly="readonly">
													</div>
												</div>
												<div class="form-group row">
													<label
														class="col-sm-2 text-center control-label col-form-label">조회수</label>
													<div class="col-sm-10">${study.study_hit}</div>
												</div>
												<hr>
												<div class="form-group row">
													<label
														class="col-sm-2 text-center control-label col-form-label">지역</label>
													<div class="col-sm-10">
														<c:choose>
															<c:when test="${study.loc_no == 1}">서울</c:when>
															<c:when test="${study.loc_no == 2}">경기</c:when>
															<c:when test="${study.loc_no == 3}">경상</c:when>
															<c:when test="${study.loc_no == 4}">전라</c:when>
															<c:when test="${study.loc_no == 5}">제주</c:when>
														</c:choose>
													</div>
												</div>
												<div class="form-group row">
													<label
														class="col-sm-2 text-center control-label col-form-label">분야</label>
													<div class="col-sm-10">
														<c:choose>
															<c:when test="${study.field_no == 1}">자격증</c:when>
															<c:when test="${study.field_no == 2}">고시</c:when>
															<c:when test="${study.field_no == 3}">출석</c:when>
															<c:when test="${study.field_no == 4}">취업</c:when>
															<c:when test="${study.field_no == 5}">기타</c:when>
														</c:choose>
													</div>
												</div>
												<div class="form-group row">
													<label
														class="col-sm-2 text-center control-label col-form-label">레벨</label>
													<div class="col-sm-10">
														<c:choose>
															<c:when test="${study.study_level == 1}">초급</c:when>
															<c:when test="${study.study_level == 2}">중급</c:when>
															<c:when test="${study.study_level == 3}">고급</c:when>
															<c:when test="${study.study_level == 0}">해당없음</c:when>
														</c:choose>
													</div>
												</div>
												<div class="form-group row">
													<label
														class="col-sm-2 text-center control-label col-form-label">인원수</label>
													<div class="col-sm-10">${study.study_headCount}명</div>
												</div>
												<hr>
												<div class="form-group row">
													<label
														class="col-sm-2 text-center control-label col-form-label">스터디
														규칙</label>
													<div class="col-sm-10">${study.study_content}</div>
												</div>
												<hr>
												<div class="form-group row">
													<label
														class="col-sm-2 text-center control-label col-form-label">체크시간</label>
													<div class="col-sm-10">${study.due_time}까지</div>
												</div>
												<div class="form-group row">
													<label
														class="col-sm-2 text-center control-label col-form-label">벌금기준</label>
													<div class="col-sm-10">${study.penalty_min}분마다</div>
												</div>
												<div class="form-group row">
													<label
														class="col-sm-2 text-center control-label col-form-label">벌금</label>
													<div class="col-sm-10">${study.penalty_money}원</div>
												</div>
												<div class="form-group row">
													<label
														class="col-sm-2 text-center control-label col-form-label">결석기준</label>
													<div class="col-sm-10">${study.limit_time}이후결석</div>
												</div>
											</form>
											<hr>
											<div class="form-group row">
												<label
													class="col-sm-2 text-center control-label col-form-label">신청목록</label>
												<div class="col-md-10" id="replyDiv">
													<div class="table-responsive">
														<table class="table">
															<thead>
																<tr>
																	<th>번호</th>
																	<th>아이디</th>
																	<th>내용</th>
																	<th>작성일</th>
																	<th>선택</th>
																</tr>
															</thead>
															<tbody id="replyTbody">
																<c:forEach items="${replyList}" var="reply">
																	<tr>
																		<td>${reply.reply_no}</td>
																		<td>${reply.userid}</td>
																		<td>${reply.reply_text}</td>
																		<td>${reply.reply_inputdate}</td>
																		<c:choose>
																			<c:when
																				test="${study.auth_userid == sessionScope.userid && reply.permission == 0}">
																				<td><input type="button"
																					class="btn btn-info joinBtn"
																					id="rno${reply.reply_no}" value="승인"></td>
																			</c:when>
																			<c:when
																				test="${study.auth_userid == sessionScope.userid && reply.permission == 1}">
																				<td><input type="button"
																					class="btn btn-info joinBtn"
																					id="rno${reply.reply_no}" disabled="disabled"
																					value="승인"></td>
																			</c:when>
																			<c:when test="${sessionScope.userid == reply.userid}">
																				<td><input type="button"
																					class="btn btn-secondary deleteReplyBtn" value="삭제"></td>
																			</c:when>
																		</c:choose>
																	<tr>
																</c:forEach>
															</tbody>
														</table>
													</div>
												</div>
											</div>
											<hr>
											<c:if test="${sessionScope.userid != study.auth_userid}">
												<div class="form-group row">
													<label
														class="col-sm-2 text-center control-label col-form-label">신청하기</label>
													<div class="col-md-8">
														<textarea rows="3" cols="40" class="form-control"
															id="b_content" style="resize: none;" placeholder="내용 작성"></textarea>
													</div>
													<div class="col-sm-0" style="vertical-align: middle;">
														<input type="button" class="btn btn-info" value="신청"
															id="replyBtn">
													</div>
												</div>
											</c:if>
											<div class="form-group row">
												<div class="col-md-12 text-right">
													<c:if test="${sessionScope.userid == study.auth_userid}">
														<a
															href="<c:url value="/study/updateStudy?study_no=${study.study_no}"/>">
															<input type="button" id="sSubmit" class="btn btn-info"
															value="글수정">
														</a>
														<input type="button" id="deleteBtn" class="btn btn-dark"
															value="글삭제">
													</c:if>
													<a href="<c:url value="/study/studyList"/>"> <input
														type="button" class="btn btn-secondary" value="돌아가기"></a>
												</div>
											</div>
											<div class="form-group row">
												<div id="deleteResult"></div>
											</div>
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