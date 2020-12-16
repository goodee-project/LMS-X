<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lecture List</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('.classRegistrationBtn').on('click', function(){
			let paramLectureNo = $(this).val();
			$.ajax({
				url: '${pageContext.request.contextPath}/auth/student/lecture/checkClassRegistration',
				type: 'post',
				data: {lectureNo:paramLectureNo},
				success: function(data){
					if(data == false){
						alert('이미 수강신청한 강좌입니다.');
						return;
					}else{
						$('#classRegistrationForm' + paramLectureNo).submit();
						return;
					}
				}
			})
		});
	})
</script>
</head>
<body>
	<h1>수강 신청 - 강좌 목록</h1>
	<div>
		<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
    </div>
	<table border="1">	
		<tr>
			<th>강사</th>
			<th>과목 이름</th>
			<th>강좌 이름</th>
			<th>강좌 총일수</th>
			<th>강좌 시작일</th>
			<th>강좌 종료일</th>
			<th>강좌 총원</th>
			<th>수강 신청</th>
		</tr>
		<c:forEach items="${lectureList}" var="l">
			<tr>
				<td>${l.teacherName}</td>
				<td>${l.subject.subjectName}</td>
				<td>${l.lectureName}</td>
				<td>${l.subject.subjectTotalday}일</td>
				<td>${l.lectureStartdate}</td>
				<td>${l.lectureEnddate}</td>
				<td>${l.lectureTotal}명</td>
				<td>
					<form id="classRegistrationForm${l.lectureNo}" action="${pageContext.request.contextPath}/auth/student/lecture/registrationClass" method="post">
						<input type="hidden" name="lectureNo" value="${l.lectureNo}">
						<button class="classRegistrationBtn" type="button" value="${l.lectureNo}">수강 신청</button>
					</form>
				</td>
			</tr>	
		</c:forEach>
	</table>
	
	<!-- 페이징 -->
	<div>
		<!-- 이전 페이지 네비 -->
		<c:if test="${navFirstPage > navPerPage }">
			<a href="${pageContext.request.contextPath }/auth/student/lecture/lectureList/${navFirstPage - 1}">이전</a>	
		</c:if>
		<!-- 현재 페이지 네비 -->
		<c:forEach var="navPage" begin="${navFirstPage }" end="${navLastPage }">
			<c:if test="${navPage <= endPage }">
				<a href="${pageContext.request.contextPath }/auth/student/lecture/lectureList/${navPage}">${navPage}</a>
			</c:if>
		</c:forEach>
		<!-- 다음 페이지 네비 -->
		<c:if test="${navLastPage < endPage }">
			<a href="${pageContext.request.contextPath }/auth/student/lecture/lectureList/${navLastPage + 1}">다음</a>	
		</c:if>
	</div>

</body>
</html>