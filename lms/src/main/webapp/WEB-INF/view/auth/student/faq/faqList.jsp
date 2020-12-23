<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>faqList</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>
		</script>
	</head>
	<body>
		<h1>시스템 FAQ</h1>
		<div>
			<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
	    </div>
	    
		<!-- FAQ 카테고리 / 검색 -->
		<div>
			<form method="get" action="${pageContext.request.contextPath}/auth/student/faq/faqList/1">
				<div>
					<div>
						<span>카테고리</span>
					</div>
					<select class="form-control" name="searchCategory">
						<c:if test="${searchCategory == ''}">
							<option value="" selected="selected">== 카테고리 선택 ==</option>
						</c:if>
						<c:if test="${searchCategory != ''}">
							<option value="">== 카테고리 선택 ==</option>
						</c:if>					
						<c:forEach items="${faqCategoryList}" var="fc">
							<c:choose>
								<c:when test="${searchCategory == fc.faqCategory}">
									<option value="${fc.faqCategory}" selected="selected">${fc.faqCategory}</option>
								</c:when>
								<c:otherwise>
									<option value="${fc.faqCategory}" >${fc.faqCategory}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
	
					<div class="input-group-prepend">
						<span class="input-group-text">검색</span>
					</div>
	
					<select class="form-control" name="searchOption">
						<c:if test="${searchOption == 'titleContent'}">
							<option value="titleContent" selected="selected">제목 + 내용</option>
						</c:if>
						<c:if test="${searchOption != 'titleContent'}">
							<option value="titleContent">제목 + 내용</option>
						</c:if>
						<c:if test="${searchOption == 'title'}">
							<option value="title" selected="selected">제목</option>
						</c:if>
						<c:if test="${searchOption != 'title'}">
							<option value="title">제목</option>
						</c:if>
						<c:if test="${searchOption == 'content'}">
							<option value="content" selected="selected">내용</option>
						</c:if>
						<c:if test="${searchOption != 'content'}">
							<option value="content">내용</option>
						</c:if>
					</select> <input type="text" class="form-control" name="searchText" value="${searchText}">
	
					<div class="input-group-append">
						<button type="submit" class="btn btn-secondary">검색</button>
					</div>
				</div>
			</form>
		</div>
	
		<!-- FAQ 목록 -->
	    <div>
			<table border="1">	
				<tr>
					<th>번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				<c:forEach items="${faqList}" var="f">
					<tr>
						<td>${f.faqNo}</td>
						<td>${f.faqCategory}</td>
						<td><a href="${pageContext.request.contextPath}/auth/student/faq/faqOne">${f.faqTitle}</a></td>
						<td>${f.faqWriter}</td>
						<td>${f.faqCreatedate}</td>
						<td>${f.faqCount}</td>
					</tr>	
				</c:forEach>
			</table>
		</div>
		<!-- 페이지 네비게이션 -->
		<ul class="pagination justify-content-center">
			<!-- 처음으로 버튼 -->
			<c:choose>
				<c:when test="${currentPage > 1}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/auth/student/faq/faqList/1/${f.faqNo}?searchCategory=${searchCategory}&searchOption=${searchOption}&searchText=${searchText}">
							<i class='fas fa-angle-double-left'></i>
						</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled">
						<a class="page-link" href="#">
							<i class='fas fa-angle-double-left'></i>
						</a>
					</li>
				</c:otherwise>
			</c:choose>
			
			<!-- 이전 버튼 -->
			<c:choose>
				<c:when test="${currentPage > 1}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/auth/student/faq/faqList/${prePage}/${f.faqNo}?searchCategory=${searchCategory}&searchOption=${searchOption}&searchText=${searchText}">
							<i class='fas fa-angle-left'></i>
						</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled">
						<a class="page-link" href="#">
							<i class='fas fa-angle-left'></i>
						</a>
					</li>
				</c:otherwise>
			</c:choose>
			
			<!-- 현재 페이지 표시 -->
			<c:forEach var="i" begin="${navFirstPage}" end="${navLastPage}">
				<c:if test="${i <= lastPage}">
					<c:choose>
						<%-- 현재 페이지 --%>
						<c:when test="${i == currentPage}">
							<li class="page-item active">
								<a class="page-link" href="#">${i}</a>
							</li>
						</c:when>
						<%-- 현재 페이지가 아닌 선택 가능한 페이지 --%>
						<c:otherwise>
							<li class="page-item">
								<a class="page-link" href="${pageContext.request.contextPath}/auth/student/faq/faqList/${i}/${f.faqNo}?searchCategory=${searchCategory}&searchOption=${searchOption}&searchText=${searchText}">${i}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:if>
			</c:forEach>
			
			<!-- 다음 버튼 -->
			<c:choose>
				<c:when test="${currentPage < lastPage}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/auth/student/faq/faqList/${nextPage}/${f.faqNo}?searchCategory=${searchCategory}&searchOption=${searchOption}&searchText=${searchText}">
							<i class='fas fa-angle-right'></i>
						</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled">
						<a class="page-link" href="#">
							<i class='fas fa-angle-right'></i>
						</a>
					</li>
				</c:otherwise>
			</c:choose>
			
			<!-- 마지막으로 버튼 -->
			<c:choose>
				<c:when test="${currentPage < lastPage}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/auth/student/faq/faqList/${lastPage}/${f.faqNo}?searchCategory=${searchCategory}&searchOption=${searchOption}&searchText=${searchText}">
							<i class='fas fa-angle-double-right'></i>
						</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled">
						<a class="page-link" href="#">
							<i class='fas fa-angle-double-right'></i>
						</a>
					</li>
				</c:otherwise>
			</c:choose>
		</ul>
		
		<!-- 총 페이지 수 출력 -->
		<table style="margin: auto;">
			<tr>
				<td>
					<button type="button" class="btn btn-outline-dark btn-sm">
						${currentPage} / ${lastPage} 페이지
					</button>
				</td>
			</tr>
		</table>
	
	</body>
</html>