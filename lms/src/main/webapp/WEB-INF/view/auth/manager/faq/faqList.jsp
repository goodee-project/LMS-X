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
	<div><a href="${pageContext.request.contextPath }/auth/manager/index">홈으로</div></div>
	<div><a href="${pageContext.request.contextPath }/auth/manager/faq/insertFaq">FAQ 추가</a></div>
	<table border="1">	
		<tr>
			<th>FAQ 번호</th>
			<th>계정 ID</th>
			<th>FAQ 작성자</th>
			<th>FAQ 제목</th>
			<th>FAQ 내용</th>
			<th>FAQ 생성날짜</th>
			<th>FAQ 수정날짜</th>
			<th>FAQ 조회수</th>
			<th>FAQ 카테고리</th>
		</tr>
		<c:forEach items="${faqList}" var="f">
			<tr>
				<td>${f.faqNo}</td>
				<td>${f.accountId}</td>
				<td>${f.faqWriter}</td>
				<td>${f.faqTitle}</td>
				<td>${f.faqContent}</td>
				<td>${f.faqCreatedate}</td>
				<td>${f.faqUpdatedate}</td>
				<td>${f.faqCount}</td>
				<td>${f.faqCategory}</td>
			</tr>	
		</c:forEach>
	</table>
</body>
</html>