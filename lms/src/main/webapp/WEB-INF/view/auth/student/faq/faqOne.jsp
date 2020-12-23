<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>faqOne</title>
	</head>
	<body>
		<h1>자료실 상세보기</h1>
		<div>
			<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
	    </div>
		<div>
			<jsp:include page="/WEB-INF/view/auth/student/include/lectureMenu.jsp" />
	    </div>
	    
	    <!-- 과제 내용 -->
	    <div>
	    	<table border="1">
	    		<tr>
	    			<th>제목</th>
	    			<td>${faq.faqTitle}</td>
	    			<th>조회수</th>
	    			<td>${faq.faqCount}</td>
	    		</tr>
	    		<tr>
	    			<th>작성자</th>
	    			<td>${faq.faqWriter}</td>
	    			<th>작성일</th>
	    			<td>${faq.faqCreatedate}</td>
	    		</tr>
	    		<tr>
	    			<th>내용</th>
	    			<td colspan="3">${faq.faqContent}</td>
	    		</tr>
	    	</table>
	    </div>
	    
	    <a href="${pageContext.request.contextPath}/auth/student/faq/faqList/1">목록</a>
	</body>
</html>