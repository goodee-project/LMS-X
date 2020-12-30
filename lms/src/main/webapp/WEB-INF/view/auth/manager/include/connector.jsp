<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header -->
<div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
	<div class="container-fluid">
		<div class="header-body">
			<!-- Card stats -->
			<div class="row">
				<div class="col-xl-3 col-lg-6">
					<div class="card card-stats mb-4 mb-xl-0">
						<div class="card-body">
							<div class="row">
								<div class="col">
									<h5 class="card-title text-uppercase text-muted mb-0">접속자 현황</h5>
									<span class="h2 font-weight-bold mb-0">
									</span>
								</div>
								<div class="col-auto">
									<div style="width:30px; height:30px"
										class="icon icon-shape bg-danger text-white rounded-circle shadow">
										<i style="font-size:18px" class="fas fa-chart-bar"></i>
									</div>
								</div>	
							</div>	
							<div style="height:120px; overflow: auto; width: 100%; max-height: 120px;">
								<c:forEach var="con" items="${connector}">
									<div>
								        <ul class="navbar-nav d-none d-md-flex">
											<li class="nav-item dropdown">
												<a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
													<div class="media align-items-center">
														<span class="avatar avatar-sm rounded-circle" style="width:18px; height:18px"> 
															<c:if test="${!empty con.value.accountImage}">
																<img src="${pageContext.request.contextPath}/resource/mypageImage/${con.value.accountImage}">
															</c:if>
															<c:if test="${empty con.value.accountImage}">
																<img src="${pageContext.request.contextPath}/resource/mypageImage/default.png">
															</c:if>
														</span>
														<span style="font-size:13px">${con.value.accountName}</span>
														<span style="font-size:13px">(${con.value.accountId})</span>
														<span>&nbsp;&nbsp;<i class="far fa-envelope"></i></span>
													</div>
												</a>
												<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
													<a href="${pageContext.request.contextPath}/auth/manager/note/insertNote/${con.value.accountId}/${con.value.accountName}" class="dropdown-item">
													 	<i	class="ni ni-single-02"></i> <span>쪽지 보내기</span>
													</a>
												</div>
											</li>
										</ul>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>