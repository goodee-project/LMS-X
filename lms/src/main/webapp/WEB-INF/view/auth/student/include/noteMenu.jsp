<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="row col-11">
	<nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
		<div class="container-fluid">
			<ul class="navbar-nav">		
				<li class="nav-item">
					<a class="nav-link active" href="${pageContext.request.contextPath}/auth/student/note/noteReceiveList/1">		
						쪽지 수신함
						<span class="badge badge-secondary" style="color: black">${noteNotReadReceiveCount}</span>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" href="${pageContext.request.contextPath}/auth/student/note/noteDispatchList/1">쪽지 발신함</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" href="${pageContext.request.contextPath}/auth/student/note/insertNote">쪽지 보내기</a>
				</li>
			</ul>
		</div>
	</nav>
</div>