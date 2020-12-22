<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm bg-light navbar-light">
	<div class="container">
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
		    	<a class="nav-link" href="${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/test/testOne">최종 평가</a>
		    </li>
		</ul>
	</div>
</nav>