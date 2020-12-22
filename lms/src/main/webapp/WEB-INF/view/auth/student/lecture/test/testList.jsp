<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>testList</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>
			$(document).ready(function(){
				// 첫 접근시 이미 평가를 완료했는지 체크
				$.ajax({
					url: '${pageContext.request.contextPath}/auth/student/lecture/test/selectCheckTestFinish/' + ${lectureNo},
					type:'post',
					success: function(data){
						// 미완료 평가인 경우
						if(!data){
							$('#totalScore').html('미평가');
							return;
						}
					}
				});			

				// 시험이 제출기간인지 체크
				$.ajax({
					url: '${pageContext.request.contextPath}/auth/student/lecture/test/selectCheckTestDate/' + ${lectureNo},
					type:'post',
					success: function(data){
						// 제출기간이 아닐경우
						if(!data){
							$('#testContent').html('${test.testContent}');
							return;
						}
					}
				});			
				
			})
		</script>
	</head>
	<body>
		<h1>강좌 - 평가</h1>
		<!-- 메뉴 -->
		<div>
			<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
	    </div>
		<div>
			<jsp:include page="/WEB-INF/view/auth/student/include/lectureMenu.jsp" />
	    </div>
	    <!-- 평가 내용 -->
		<table border="1">	
			<tr>
				<th>번호</th>
				<th>내용</th>
				<th>출제일</th>
				<th>평가 시작일</th>
				<th>평가 종료일</th>
				<th>점수</th>
			</tr>
			<tr>
				<td>${test.lectureNo}</td>
				<td id="testContent"><a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/test/testOne/1">${test.testContent}</a></td>
				<td>${test.testCreatedate}</td>
				<td>${test.testStartdate}</td>
				<td>${test.testEnddate}</td>
				<td id="totalScore">				
					${test.totalScore}
				</td>
			</tr>	
		</table>
	
	</body>
</html>