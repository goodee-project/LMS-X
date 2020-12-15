<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>classOne</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		let paramPoint = ${lcstc.classRegistration.classRegistrationPoint};
		// 별점을 변경해주는 함수 
		// - 파라미터 값이 없으면 컨트롤러에서 받아온 값을 별점으로 지정
		// - 파라미터 값이 있으면 기존 값에서 파라미터 값을 합연산함
		function changePoint(param){
			if(param != null){
				paramPoint = paramPoint + param;
			}
			let html = '';
			for(let i = 0; i < paramPoint; i++){
				html += '★';
			}
			for(let i = paramPoint; i < 5; i++){
				html += '☆';
			}
				
			$('#classPoint').html(html);
			$('#classRegistrationPoint').val(paramPoint);
			
		}
		
		// 후기 저장 버튼 
		$('#classReviewBtn').click(function(){
			$('#classReviewForm').submit();
		})

		$('#minusPoint').click(function(){
			if(paramPoint > 0){
				changePoint(-1);
			}
		})
		$('#plusPoint').click(function(){
			if(paramPoint < 5){
				changePoint(1);
			}
		})
		changePoint();

	})
</script>
</head>
<body>
	<h1>수강 상세보기</h1>
	
	<table border="1">
		<tr>
			<th>강좌 번호</th>
			<td>${lcstc.lecture.lectureNo}</td>
			<th>강사 이름</th>
			<td>${lcstc.lecture.teacherName}</td>
		</tr>
		<tr>
			<th>강좌 기간</th>
			<td colspan="3">${lcstc.lecture.lectureStartdate} ~ ${lcstc.lecture.lectureEnddate}</td>
		</tr>
		<tr>
			<th>강좌 정원</th>
			<td>${lcstc.lecture.lectureTotal}명</td>
			<th>강좌 이름</th>
			<td>${lcstc.lecture.lectureName}</td>
		</tr>
		<tr>
			<th>수강 상태</th>
			<td>${lcstc.classRegistration.classRegistrationState}</td>
			<th>과목 이름</th>
			<td>${lcstc.subject.subjectName}</td>
		</tr>
		<tr>
			<th>과목 총일수</th>
			<td>${lcstc.subject.subjectTotalday}일</td>
			<th>과목 정보</th>
			<td>${lcstc.subject.subjectInfo}</td>
		</tr>
		<tr>
			<th>교재</th>
			<td>${lcstc.textbook.textbookTitle}</td>
			<th>강의실</th>
			<td>${lcstc.classroom.classroomNumber}</td>
		</tr>
	</table>
	
	<!-- 수강 후기 -->
	<form id="classReviewForm" method="post" action="${pageContext.request.contextPath}/auth/student/updateClassReview">
		<input type="hidden" name="classRegistrationPoint" id="classRegistrationPoint" value="${lcstc.classRegistration.classRegistrationPoint}">
		<input type="hidden" name="classRegistrationNo" id="classRegistrationNo" value="${lcstc.classRegistration.classRegistrationNo}">
		<table border="1">	
			<tr>
				<th>강좌 별점</th>
				<td >
					<button id="minusPoint" type="button">-</button>
					<p id="classPoint"></p>
					<button id="plusPoint" type="button">+</button>
				</td>
			</tr>
			<tr>
				<th>강좌 리뷰</th>
				<td>
					<textarea cols="50" rows="3" name="classRegistrationReview">${lcstc.classRegistration.classRegistrationReview}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2"><button id="classReviewBtn" type="button">저장</button></td>
			</tr>
		</table>
	</form>
	
	<!-- 수강 목록으로 -->
	<a href="${pageContext.request.contextPath}/auth/student/index/1">목록</a>
</body>
</html>