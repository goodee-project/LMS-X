<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Navigation -->
<nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
	<div class="container-fluid">
		<!-- Toggler -->
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<!-- Brand -->
		<a class="navbar-brand pt-0" href="${pageContext.request.contextPath}/auth/teacher/index/1">
			<img src="${pageContext.request.contextPath}/assets/img/brand/blue.png" class="navbar-brand-img">
		</a>
		
		<!-- User -->
		<ul class="nav align-items-center d-md-none">
			<li class="nav-item dropdown">
				<a class="nav-link nav-link-icon" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="ni ni-bell-55"></i>
				</a>
				<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right" aria-labelledby="navbar-default_dropdown_1">
					<a class="dropdown-item" href="#">Action</a>
					<a class="dropdown-item" href="#">Another action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<div class="media align-items-center">
						<span class="avatar avatar-sm rounded-circle">
							<img alt="Image placeholder" src="${pageContext.request.contextPath}/assets/img/theme/team-1-800x800.jpg">
						</span>
					</div>
				</a>
			</li>
		</ul>
		
		<!-- Collapse -->
		<div class="collapse navbar-collapse" id="sidenav-collapse-main">
			<!-- Collapse header -->
			<div class="navbar-collapse-header d-md-none">
				<div class="row">
					<div class="col-6 collapse-brand">
						<a href="#">
							<img src="${pageContext.request.contextPath}/assets/img/brand/blue.png">
						</a>
					</div>
					<div class="col-6 collapse-close">
						<button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle sidenav">
							<span></span>
							<span></span>
						</button>
					</div>
				</div>
			</div>
			
			<!-- Form -->
			<form class="mt-4 mb-3 d-md-none">
				<div class="input-group input-group-rounded input-group-merge">
					<input type="search"
						class="form-control form-control-rounded form-control-prepended"
						placeholder="Search" aria-label="Search">
					<div class="input-group-prepend">
						<div class="input-group-text">
							<span class="fa fa-search"></span>
						</div>
					</div>
				</div>
			</form>
			
			<ul class="navbar-nav mr-auto">
				<!-- 강사 Index -->
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/auth/teacher/index/1">
						<i class="ni ni-tv-2 text-primary"></i>
						Index
					</a>
				</li>
		
				<!-- LMS 공지사항 -->
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/auth/teacher/lmsNotice/lmsNoticeList/1">
						<i class="ni ni-bullet-list-67 text-red"></i>
						LMS 공지사항
					</a>
				</li>
		
				<!-- 쪽지 -->
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/auth/teacher/note/noteReceiveList/1">
						<i class="far fa-envelope"></i>
						쪽지
					</a>
				</li>
		
				<!-- 개인정보 관리 -->
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/auth/teacher/mypage/mypageOne">
						<i class="ni ni-circle-08 text-pink"></i>
						개인정보 관리
					</a>
				</li>
		
				<!-- LMS 시스템 FAQ -->
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/auth/teacher/faq/faqList/1">
						<i class="far fa-question-circle"></i>
						LMS 시스템 FAQ
					</a>
				</li>
			</ul>
		</div>
	</div>
</nav>