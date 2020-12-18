<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FaqOne</title>
</head>
<body>
	<h1>FAQ 상세보기</h1>
	<table border="1">
		<tr>
			<td>FAQ 번호</td>
			<td>${faq.faqNo}</td>
		</tr>
		<tr>
			<td>계정 ID</td>
			<td>${faq.accountId}</td>
		</tr>
		<tr>
			<td>FAQ 작성자</td>
			<td>${faq.faqWriter}</td>
		<tr>
			<td>FAQ 제목</td>
			<td>${faq.faqTitle}</td>
		</tr>
		<tr>
			<td>FAQ 내용</td>
			<td>${faq.faqContent}</td>
		</tr>
		<tr>
			<td>FAQ 생성날짜</td>
			<td>${faq.faqCreatedate}</td>
		</tr>
		<tr>
			<td>FAQ 수정날짜</td>
			<td>${faq.faqUpdatedate}</td>
		</tr>
		<tr>
			<td>FAQ 조회수</td>
			<td>${faq.faqCount}</td>
		</tr>
		<tr>
			<td>FAQ 카테고리</td>
			<td>${faq.faqCategory}</td>
		</tr>
		<tr>
			<td>수정</td>
			<td><a href="${pageContext.request.contextPath}/auth/manager/faq/updateFaq/${faq.faqNo}">수정</a></td>
		</tr>
		<tr>
			<td>삭제</td>
			<td><a href="${pageContext.request.contextPath}/auth/manager/faq/deleteFaq/${faq.faqNo}">삭제</a></td>
		</tr>
	</table>
</body>
</html>