<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<a href="${pageContext.request.contextPath}/auth/student/lecture/classOne/${lectureNo}">강좌 홈</a>
	
	<a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/notice/noticeList/1">강의 공지사항</a>
	
	<a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaList/1">강의 질문게시판</a>
	
	<a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/report/reportList/1">과제</a>
	
	<a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/archive/archiveList/1">자료실</a>
	
	<a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/test/testList">평가</a>
	
	<a href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/attendance/attendanceByMonth/now/-1/-1">출석 현황</a>
</div>
