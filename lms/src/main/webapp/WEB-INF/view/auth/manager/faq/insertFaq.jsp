<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>FAQ 추가</h1>
	<form method="post" action="${pageContext.request.contextPath}/auth/manager/faq/insertFaq">
		<table border="1">
			<tr>
				<td>계정 id</td>
				<td><input type="text" name="accountId" value="${sessionScope.loginId}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>FAQ 작성자</td>
				<td> <input type="text" name="faqWriter"></td>
			</tr>
			<tr>
				<td>FAQ 제목</td>
				<td><input type="text" name="faqTitle"></td>
			</tr>
			<tr>
				<td>FAQ 내용</td>
				<td><input type="text" name="faqContent"></td>
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
		<button type="submit">입력</button>
	</form>
</body>
</html>