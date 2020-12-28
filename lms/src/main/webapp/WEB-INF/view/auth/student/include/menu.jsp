<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Navigation -->
<!-- Toggler -->
<button class="navbar-toggler" type="button" data-toggle="collapse"
	data-target="#sidenav-collapse-main" aria-controls="sidenav-main"
	aria-expanded="false" aria-label="Toggle navigation">
	<span class="navbar-toggler-icon"></span>
</button>
<!-- Brand -->
<a class="navbar-brand pt-0" href="#"> <img
	src="./assets/img/brand/blue.png" class="navbar-brand-img">
</a>
<!-- Collapse -->
<div class="collapse navbar-collapse" id="sidenav-collapse-main">
	<!-- Collapse header -->
	<div class="navbar-collapse-header d-md-none">
		<div class="row">
			<div class="col-6 collapse-brand">
				<a href="#"> <img src="./assets/img/brand/blue.png">
				</a>
			</div>
			<div class="col-6 collapse-close">
				<button type="button" class="navbar-toggler" data-toggle="collapse"
					data-target="#sidenav-collapse-main" aria-controls="sidenav-main"
					aria-expanded="false" aria-label="Toggle sidenav">
					<span></span> <span></span>
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
	<ul class="navbar-nav">
		<li class="nav-item  active "><a class="nav-link  active"
			href="${pageContext.request.contextPath}/auth/student/index/1"> <i
				class="ni ni-tv-2 text-primary"></i> INDEX
		</a></li>
		<li class="nav-item"><a class="nav-link "
			href="${pageContext.request.contextPath}/auth/student/lecture/lectureList/1">
				<i class="ni ni-planet text-blue"></i> 수강 신청
		</a></li>
		<li class="nav-item"><a class="nav-link "
			href="${pageContext.request.contextPath}/auth/student/lmsNotice/lmsNoticeList/1">
				<i class="ni ni-single-02 text-yellow"></i> LMS 공지사항
		</a></li>
		<li class="nav-item"><a class="nav-link "
			href="${pageContext.request.contextPath}/auth/student/faq/faqList/1">
				<i class="ni ni-single-02 text-yellow"></i> 시스템 FAQ
		</a></li>
		<li class="nav-item"><a class="nav-link "
			href="${pageContext.request.contextPath}/auth/student/note/noteReceiveList/1">
				<i class="ni ni-single-02 text-yellow"></i> 쪽지
		</a></li>
	</ul>
	<hr class="my-3">
</div>