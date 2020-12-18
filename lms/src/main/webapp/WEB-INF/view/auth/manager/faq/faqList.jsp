<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>FAQ index</h1>
	<div><a href="${pageContext.request.contextPath }/auth/manager/index">홈으로</a></div>
	<div><a href="${pageContext.request.contextPath }/auth/manager/faq/insertFaq">FAQ 추가</a></div>
	<table border="1">	
		<tr>
			<th>FAQ 번호</th>
			<th>FAQ 작성자</th>
			<th>FAQ 제목</th>
			<th>FAQ 조회수</th>
			<th>FAQ 카테고리</th>
		</tr>
		<c:forEach items="${faqList}" var="f">
			<tr>
				<td><a href="${pageContext.request.contextPath}/auth/manager/faq/faqOne/${f.faqNo}">${f.faqNo}</a></td>	
				<td>${f.faqWriter}</td>
				<td>${f.faqTitle}</td>
				<td>${f.faqCount}</td>
				<td>${f.faqCategory}</td>
			</tr>	
		</c:forEach>
	</table>
</body>
</html>