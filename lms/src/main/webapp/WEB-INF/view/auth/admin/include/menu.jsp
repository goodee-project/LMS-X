<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
	<div class="container-fluid">
		<!-- Toggler -->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#sidenav-collapse-main" aria-controls="sidenav-main"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<!-- Brand -->
		<a class="navbar-brand pt-0" href="${pageContext.request.contextPath}/">
			 <img src="${pageContext.request.contextPath}/assets/img/brand/blue.png" class="navbar-brand-img" alt="...">
		</a>
		<!-- Collapse -->
		<div class="collapse navbar-collapse" id="sidenav-collapse-main">
			<!-- Navigation -->
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link " href="${pageContext.request.contextPath}/auth/admin/index/1">
						<i class="ni ni-tv-2 text-primary"></i> 운영자 목록
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/auth/admin/managerQueue/1">
						<i class="ni ni-circle-08 text-pink"></i> 운영자 승인
					</a>
				</li>
			</ul>
		</div>
	</div>
</nav>