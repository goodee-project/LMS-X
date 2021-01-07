<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 상단 Navbar -->
<nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
	<div class="container-fluid">
		<ul class="navbar-nav mr-auto">
			<!-- 쪽지 수신함 -->
			<li class="nav-item">
				<a class="nav-link" href="${pageContext.request.contextPath}/auth/manager/note/noteReceiveList/1">		
					쪽지 수신함
					<span class="badge badge-secondary" style="color: black">${noteNotReadReceiveCount}</span>
				</a>
			</li>
		    
		    <!-- 쪽지 발신함 -->
		    <li class="nav-item">
		    	<a class="nav-link" href="${pageContext.request.contextPath}/auth/manager/note/noteDispatchList/1">쪽지 발신함</a>
		    </li>
		    
		    <!-- 쪽지 보내기 -->
		    <li class="nav-item">
		    	<a class="nav-link" href="${pageContext.request.contextPath}/auth/manager/note/insertNote">쪽지 보내기</a>
		    </li>
		</ul>
		<!-- User -->
		<ul class="navbar-nav align-items-center d-none d-md-flex">
			<li class="nav-item dropdown">
				<a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<div class="media align-items-center">
						<span class="avatar avatar-sm rounded-circle"> 
							<c:if test="${!empty loginImage}">
								<img src="${pageContext.request.contextPath}/resource/mypageImage/${loginImage}">
							</c:if>
							<c:if test="${empty loginImage}">
								<img src="${pageContext.request.contextPath}/resource/mypageImage/default.png">
							</c:if>
						</span>
						<div class="media-body ml-2 d-none d-lg-block">
							<span class="mb-0 text-sm  font-weight-bold">
								${sessionScope.loginName}
							</span>
						</div>
					</div>
				</a>
				<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
					<div class=" dropdown-header noti-title">
						<h6 class="text-overflow m-0">환영합니다!</h6>
					</div>
					<a href="${pageContext.request.contextPath}/auth/manager/mypage/mypageOne" class="dropdown-item"> <i
						class="ni ni-single-02"></i> <span>마이페이지</span>
					</a>
					<div class="dropdown-divider"></div>
					<a href="${pageContext.request.contextPath}/auth/logout" class="dropdown-item"> <i class="ni ni-user-run"></i>
						<span>로그아웃</span>
					</a>
				</div>
			</li>
		</ul>
	</div>
</nav>