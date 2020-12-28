<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 상단 Navbar -->
<nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
	<div class="container-fluid">
		<ul class="navbar-nav mr-auto">
			<!-- 강좌 Index -->
			<li class="nav-item">
		    	<a class="nav-link" href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}">강좌 Index</a>
		    </li>
		    
		    <!-- 강좌 공지사항 -->
		    <li class="nav-item">
		    	<a class="nav-link" href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/notice/noticeList/1">강좌 공지사항</a>
		    </li>
		    
		    <!-- 질문 게시판 -->
		    <li class="nav-item">
		    	<a class="nav-link" href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/question/questionList/1">질문 게시판</a>
		    </li>
		    
		    <!-- 자료 게시판 -->
		    <li class="nav-item">
		    	<a class="nav-link" href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/archive/archiveList/1">자료 게시판</a>
		    </li>
		    
		    <!-- 과제 관리 -->
		    <li class="nav-item">
		    	<a class="nav-link" href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/report/reportList/1">과제 관리</a>
		    </li>
		    
		    <!-- 출석 관리 -->
		    <li class="nav-item">
		    	<a class="nav-link" href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/attendance/attendanceCalendarByMonth/-1/-1">출석 관리</a>
		    </li>
		    
		    <!-- 학생 관리 -->
		    <li class="nav-item">
		    	<a class="nav-link" href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/student/studentList/1">학생 관리</a>
		    </li>
		    
		    <!-- 강의계획서 관리 -->
		    <li class="nav-item">
		    	<a class="nav-link" href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/syllabus/syllabusOne">강의계획서 관리</a>
		    </li>
		    
		    <!-- 최종 평가 -->
		    <li class="nav-item">
		    	<a class="nav-link" href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/test/testIndex">최종 평가</a>
		    </li>
		</ul>
		<!-- User -->
		<ul class="navbar-nav align-items-center d-none d-md-flex">
			<li class="nav-item dropdown">
				<a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<div class="media align-items-center">
						<span class="avatar avatar-sm rounded-circle"> 
							<c:if test="${!empty accountImage}">
								<img src="${pageContext.request.contextPath}/resource/mypageImage/${accountImage}">
							</c:if>
							<c:if test="${empty accountImage}">
								<img src="${pageContext.request.contextPath}/resource/mypageImage/default.png">
							</c:if>
						</span>
						<div class="media-body ml-2 d-none d-lg-block">
							<span class="mb-0 text-sm  font-weight-bold">
								${accountName}
							</span>
						</div>
					</div>
				</a>
				<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
					<div class=" dropdown-header noti-title">
						<h6 class="text-overflow m-0">Welcome!</h6>
					</div>
					<a href="./examples/profile.html" class="dropdown-item"> <i
						class="ni ni-single-02"></i> <span>My profile</span>
					</a> <a href="./examples/profile.html" class="dropdown-item"> <i
						class="ni ni-settings-gear-65"></i> <span>Settings</span>
					</a> <a href="./examples/profile.html" class="dropdown-item"> <i
						class="ni ni-calendar-grid-58"></i> <span>Activity</span>
					</a> <a href="./examples/profile.html" class="dropdown-item"> <i
						class="ni ni-support-16"></i> <span>Support</span>
					</a>
					<div class="dropdown-divider"></div>
					<a href="#!" class="dropdown-item"> <i class="ni ni-user-run"></i>
						<span>Logout</span>
					</a>
				</div>
			</li>
		</ul>
	</div>
</nav>