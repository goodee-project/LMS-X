<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>reportOne</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
	</head>
	<body>
		<h1>과제 상세보기</h1>
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
	    			<td>${report.reportTitle}</td>
	    		</tr>
	    		<tr>
	    			<th>제출 기간</th>
	    			<td>${report.reportStartdate} ~ ${report.reportEnddate}</td>
	    		</tr>
	    		<tr>
	    			<th>내용</th>
	    			<td>${report.reportContent}</td>
	    		</tr>
	    	</table>
	    </div>
	    
	    <!-- 과제 점수, 피드백 -->
	    <div>
	    	<table border="1">
	    		<tr>
	    			<th>점수</th>
	    			<td>${reportSubmit.reportSubmitPoint}</td>
	    		</tr>
	    		<tr>
	    			<th>피드백</th>
	    			<td>${reportSubmit.reportSubmitFeedback}</td>
	    		</tr>
	    	</table>
	    </div>
	    
	    <!-- 제출된 과제 내용  -->
	    <div>
	    	<!-- 내용 -->
	    	<table border="1">
	    		<tr>
	    			<th>제목</th>
	    			<td>${reportSubmit.reportSubmitTitle}</td>
	    		</tr>
	    		<tr>
	    			<th>내용</th>
	    			<td>${reportSubmit.reportSubmitContent}</td>
	    		</tr>
	    	</table>
	    	<!-- 첨부파일 -->
	    	<table border="1">
	    		<tr>
	    			<th colspan="2">첨부파일</th>
	    		</tr>
	    		<c:forEach items="${reportSubmit.reportSubmitFileList}" var="rsf">
	    			<tr>
	    				<td><a href="">${rsf.reportSubmitFileOriginal}</a></td>
	    				<td>다운횟수 : ${rsf.reportSubmitFileCount}회</td>
	    			</tr>
	    		</c:forEach>
	    	</table>
	    </div>    
	</body>
</html>