<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<div class="container">
		<ul class="navbar-nav mr-auto">
			<!-- 강사 Navbar Brand -->
			<li class="nav-item">
				<a class="navbar-brand title" href="${pageContext.request.contextPath}/auth/teacher/index/1">Goodee LMS&nbsp;<font size="2">[강사]</font></a>
			</li>
			
			<!-- 강사 Index -->
			<li class="nav-item">
		    	<a class="nav-link" href="${pageContext.request.contextPath}/auth/teacher/index/1">Index</a>
		    </li>
		    
		    <!-- LMS 공지사항 -->
		    <li class="nav-item">
		    	<a class="nav-link" href="${pageContext.request.contextPath}/auth/teacher/lmsNotice/lmsNoticeList/1">LMS 공지사항</a>
		    </li>
		    
		     <!-- 쪽지 -->
		    <li class="nav-item">
		    	<a class="nav-link" href="${pageContext.request.contextPath}/auth/teacher/note/noteReceiveList/1">쪽지</a>
		    </li>
		    
		    <!-- 개인정보 관리 -->
		    <li class="nav-item">
		    	<a class="nav-link" href="${pageContext.request.contextPath}/auth/teacher/mypage/myPageOne">개인정보 관리</a>
		    </li>
		    
		    <!-- LMS 시스템 FAQ -->
		    <li class="nav-item">
		    	<a class="nav-link" href="${pageContext.request.contextPath}/auth/teacher/faq/faqList/1">LMS 시스템 FAQ</a>
		    </li>
		</ul>
		
		<ul class="navbar-nav mr-right">
			<!-- 아이디 출력 및 로그아웃 버튼 -->
			<li class="nav-item">
		    	<font color="white">${sessionScope.loginId}</font>
				&nbsp;
				<button type="button" class="btn btn-danger btn-sm" onclick="location.href='${pageContext.request.contextPath}/auth/logout'">로그아웃</button>
		    </li>
		</ul>
	</div>
</nav>