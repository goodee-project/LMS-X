<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>testOne</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>
			$(document).ready(function(){	
				/*
				// 첫 접근시 이미 평가를 완료했는지 체크
				$.ajax({
					url: '${pageContext.request.contextPath}/auth/student/lecture/test/selectCheckTestFinish/' + ${testNo},
					type:'post',
					success: function(data){
						// 완료한 평가인 경우
						if(data){
							alert('이미 완료한 평가입니다.');
							$(location).attr('href', '${pageContext.request.contextPath}/auth/student/lecture/' + ${lectureNo} + '/test/testList/1')
							return;
						}
					}
				});
				*/
				
				// 정답 체크시
				$('input[type=radio]').change(function(){	
					let paramNo = this.id;
					let paramSelect = this.value;				
					// 이미 해당 문제의 답안을 제출 했는지
					$.ajax({
						url: '${pageContext.request.contextPath}/auth/student/lecture/test/selectCheckAnswersheet',
						type:'post',
						data: {multiplechoiceNo:paramNo},
						success: function(data){
							// 이미 제출 했을경우 -> update
							if(data){
								$.ajax({
									url: '${pageContext.request.contextPath}/auth/student/lecture/test/updateAnswersheet',
									type:'post',
									data: {multiplechoiceNo : paramNo, answerSelect : paramSelect},
									success: function(data){
									}
								});
								return;
							// 제출 안했을 경우 -> insert
							} else {
								$.ajax({
									url: '${pageContext.request.contextPath}/auth/student/lecture/test/insertAnswersheet',
									type:'post',
									data: {multiplechoiceNo : paramNo, answerSelect : paramSelect},
									success: function(data){
									}
								});
								return;
							}
						}
					});
				})

				// 평가 종료 버튼 클릭시
				$('#finishTest').click(function(){
					// 문제를 다 풀었는지 확인
					$.ajax({
						url: '${pageContext.request.contextPath}/auth/student/lecture/test/selectCheckTestFinish/' + ${testNo},
						type:'post',
						success: function(data){
							// 문제를 다 풀지 않았을 시
							if(!data){
								alert('풀지 않은 문제가 있습니다.');
								return;
							// 문제를 다 풀었을시
							} else {
								$(location).attr('href', '${pageContext.request.contextPath}/auth/student/lecture/' + ${lectureNo} + '/test/testList/1')
								return;
							}
						}
					});
					
				})
				
			})
		</script>
	</head>
	<body>
		<h1>평가</h1>
		<div>
			<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
	    </div>
		<div>
			<jsp:include page="/WEB-INF/view/auth/student/include/lectureMenu.jsp" />
	    </div>
	    
	    <!-- 평가 내용 -->
	    <div>
	    	<c:forEach items="${multiplechoice}" var="m">
		    	<table border="1">
		    		<tr>
		    			<th>문제${m.multiplechoiceId} - </th>
		    			<th>내용</th>
		    			<td>${m.multiplechoiceQuestion}</td>
		    			<th>배점</th>
		    			<td>${m.multiplechoiceScore}</td>
		    		</tr>
			    	<c:forEach items="${m.multiplechoiceExampleList}" var="me">
				    	<tr>	
				    		<!-- when = 학생이 체크한 정답일 경우 -->
				    		<!-- c:otherwise = 학생이 체크한 정답이 아닐경우 -->
				    		<c:choose>
				    			<c:when test="${m.answersheetList[0].answerSelect == me.multiplechoiceExampleId}">
			    					<td><input checked="checked" type="radio" name="submit${me.multiplechoiceNo}" class="submit${me.multiplechoiceNo}" id="${me.multiplechoiceNo}" value="${me.multiplechoiceExampleId}"></td>			    			
				    			</c:when>
				    			<c:otherwise>
			    					<td><input type="radio" name="submit${me.multiplechoiceNo}" class="submit${me.multiplechoiceNo}" id="${me.multiplechoiceNo}" value="${me.multiplechoiceExampleId}"></td>			    							    		
				    			</c:otherwise>
				    		</c:choose>
				    		<td>${me.multiplechoiceExampleId}번. </td>
			    			<td colspan="3">${me.multiplechoiceExampleContent}</td>
				   		</tr>
			    	</c:forEach>
		    	</table>
	    	</c:forEach>
	    </div>
	    
	    <!-- 페이징 -->
	    <div>
	    	${currentPage}/${lastPage} 페이지
	    	<c:if test="${currentPage > 1}">
	    		<a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/test/testOne/${testNo}/${currentPage - 1}">이전 페이지</a>
	    	</c:if>
	    	<c:if test="${currentPage < lastPage}">
	    		<a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/test/testOne/${testNo}/${currentPage + 1}">다음 페이지</a>
	    	</c:if>
	    </div>
	    
	    <!-- 평가 제출 -->
	    <div>
	    	<c:if test="${currentPage == lastPage}">
	    		<button type="button" id="finishTest">평가 종료</button>
	    	</c:if>
	    </div>
	</body>
</html>