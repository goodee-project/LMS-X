<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateFaq</title>
</head>
<body>
	<h1>updateFaq</h1>
	<form method="post" action="${pageContext.request.contextPath}/auth/manager/faq/updateFaq">
		<table border="1">
			<tr>
				<td>FAQ 번호</td>
				<td><input type="text" name="faqNo" value="${faq.faqNo}" readonly="readonly"></td>
			<tr>
			<tr>
				<td>FAQ 제목</td>
				<td><input type="text" name="faqTitle" value="${faq.faqTitle}"></td>
			</tr>
			<tr>
				<td>FAQ 내용</td>
				<td><input type="text" name="faqContent" value="${faq.faqContent}"></td>
			</tr>
			<tr>
				<td>FAQ 카테고리</td>
				<td>
					<select name="faqCategory">
						<c:forEach var="f" items="${faqCategoryList}">
							<option value="${f.faqCategory}">${f.faqCategory}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
		</table>
		<button type="submit">FAQ 수정</button>
	</form>
</body>
</html>