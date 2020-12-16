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
		// 별점 감소
		$('#minusPoint').click(function(){
			if(paramPoint > 0){
				changePoint(-1);
			}
		})
		// 별점 증가
		$('#plusPoint').click(function(){
			if(paramPoint < 5){
				changePoint(1);
			}
		})
		changePoint();

		// 수강 신청 취소 버튼
		$('#cancelClassBtn').click(function(){
			console.log($('#cancelClassBtn').text());
			// 처음 수강 신청 버튼 클릭시
			// 수강 신청 사유를 적을 수 있는 칸이 출력되고 버튼 값이 바뀜
			if($('#cancelClassBtn').text() == '수강 신청 취소'){
				let cancelHtml = `
					취소 사유 : <textarea cols="50" rows="3" name="cancelContent" id="cancelContent"></textarea>
				`
				$('#cancelClassBtn').text('수강 취소하기');
				$('#cancelClass').html(cancelHtml);
				
			// 사유 작성후 다시 버튼 클릭시
			// 취소 폼을 submit함
			}else if($('#cancelClassBtn').text() == '수강 취소하기'){
				$('#cancelClassForm').submit();
			}
		})

	})
</script>
</head>
<body>
	<h1>수강 상세보기</h1>
	
	<div>
		<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
    </div>
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
	<form id="classReviewForm" method="post" action="${pageContext.request.contextPath}/auth/student/lecture/updateClassReview">
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
	
	<!-- 수강 대기상태 일시 수강 취소 가능 -->
	<c:if test="${lcstc.classRegistration.classRegistrationState == '대기'}">	
		<form id="cancelClassForm" method="post" action="${pageContext.request.contextPath}/auth/student/lecture/cancelClass">
			<input type="hidden" name="classRegistrationNo" id="classRegistrationNo" value="${lcstc.classRegistration.classRegistrationNo}">
			<div id="cancelClass">
			</div>
			<button id="cancelClassBtn" type="button" value="수강 신청 취소">수강 신청 취소</button>
		</form>
	</c:if>
	
	<!-- 수강 목록으로 -->
	<a href="${pageContext.request.contextPath}/auth/student/index/1">목록</a>
</body>
</html>