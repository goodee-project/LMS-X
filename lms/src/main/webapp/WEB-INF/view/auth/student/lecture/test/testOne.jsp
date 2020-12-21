<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>testOne</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>
			// 정답 체크시
			$(document).ready(function(){	
				$('input[type=radio]').change(function(){
					console.log(this.value);
					console.log(this.id);
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
			    			<td><input type="radio" name="submit${me.multiplechoiceNo}" class="submit${me.multiplechoiceNo}" id="${me.multiplechoiceNo}" value="${me.multiplechoiceExampleId}"></td>
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
	    	<c:if test="${currentPage < lastPage}">
	    		<a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/test/testOne/${testNo}/${currentPage + 1}">다음 페이지</a>
	    	</c:if>
	    </div>
	    
	    <!-- 평가 제출 -->
	    <div>
	    	<c:if test="${currentPage == lastPage}">
	    		<a href="">평가 종료</a>
	    	</c:if>
	    </div>
	</body>
</html>