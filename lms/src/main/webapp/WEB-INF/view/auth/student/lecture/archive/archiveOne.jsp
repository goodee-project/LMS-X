<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>archiveOne</title>
		<!-- Favicon -->
		<link href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" rel="icon" type="image/png">
		<!-- Fonts -->
		<link
			href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
			rel="stylesheet">
		<!-- Icons -->
		<link href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
		<link
			href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"
			rel="stylesheet" />
		<!-- CSS Files -->
		<link href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>			
			// 다운로드 횟수 증가 시키기
			function fileDownloadCount(paramUuid){
				let fileId = paramUuid.split('.')[0];
				$.ajax({
					url: '${pageContext.request.contextPath}/auth/student/lecture/archive/archiveFileCount/' + paramUuid,
					type:'post',
					success: function(data){
						let html = '다운 횟수 : ' + data + '회';
						$('#fileCount' + fileId).html(html)
					}
				});
			}
		</script>
	</head>
	<body class="">
		<!-- 메인 Navbar -->
		
		<nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
		    </div>	
		</nav>   		
		<div class="main-content">
			<!-- 상단 Navbar -->
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/student/include/topMenu.jsp" />
	    	</div>
			<!-- 강좌 Navbar -->
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/student/include/lectureMenu.jsp" />
	    	</div>
	    	
	    	<!-- 접속자 -->
			<jsp:include page="/WEB-INF/view/auth/student/include/connector.jsp" />
   			<div class="container-fluid mt--7">
				<div class="card shadow">
					<div class="card-header border-0">
						<div class="row align-items-center">
							<div class="col">
								<h3 class="mb-0">자료 조회</h3>
							</div>
							<div class="col-4 text-right">
								<button type="button" class="btn btn-sm btn-dark" onclick="location.href='${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/archive/archiveList/1'">목록</button>
							</div>
						</div>
					</div>
					<div class="row align-items-center">
						<div class="col-12">
							<div>
								<table class="table align-items-center table-flush">
						    		<tr>
						    			<th width="10%">작성자</th>
						    			<td width="40%">${archive.lectureArchiveWriter}</td>
						    			<th width="10%">조회수</th>
						    			<td width="40%">${archive.lectureArchiveCount}</td>
						    		</tr>
						    		<tr>
						    			<th>작성일시</th>
						    			<td>${archive.lectureArchiveCreatedate}</td>
						    			<th>수정일시</th>
						    			<td>${archive.lectureArchiveUpdatedate}</td>
						    		</tr>
						    		<tr>
						    			<th>제목</th>
						    			<td colspan="3">${archive.lectureArchiveTitle}</td>
						    		</tr>
						    		<tr>
						    			<th>내용</th>
						    			<td colspan="3">${archive.lectureArchiveContent}</td>
						    		</tr>
								</table>
							</div>
							
						    <div>
						    	<!-- 첨부파일 -->
						    	<table class="table">
						    		<thead class="thead-light">
							    		<tr>
							    			<th colspan="3">첨부파일</th>
							    		</tr>
						    		</thead>
						    		<c:forEach items="${archive.lectureArchiveFileList}" var="laf">
						    			<!-- 태그 id에 . 이 있으면 안되므로 uuid에서 확장자를 제외한 이름만 id로 지정해줌 -->
						   				<c:set var="uuid">${laf.lectureArchiveFileUuid}</c:set>
						    			<tr>
						    				<td><a onclick="fileDownloadCount('${laf.lectureArchiveFileUuid}','${laf.lectureArchiveFileCount}')" download="${laf.lectureArchiveFileOriginal}" href="${pageContext.request.contextPath}/resource/archiveFile/${laf.lectureArchiveFileUuid}">${laf.lectureArchiveFileOriginal}</a></td>
						    				<td>
						    					<!-- 파일 사이즈 -->
						    					<c:choose>
						    						<c:when test="${laf.lectureArchiveFileSize >= (1024 * 1024)}">
						    							<fmt:formatNumber value="${laf.lectureArchiveFileSize/(1024*1024)}" type="pattern" pattern="0.00" />MB					
						    						</c:when>
						    						<c:when test="${laf.lectureArchiveFileSize >= 1024}">
						    							<fmt:formatNumber value="${laf.lectureArchiveFileSize/1024}" type="pattern" pattern="0.00" />B 
						    						</c:when>
						    						<c:otherwise>
						    							<fmt:formatNumber value="${laf.lectureArchiveFileSize}" type="pattern" pattern="0.00" />KB 	
						    						</c:otherwise>
						    					</c:choose>
						    				</td>
						    				<td id="fileCount${fn:split(uuid ,'.')[0]}">다운 횟수 : ${laf.lectureArchiveFileCount}회</td>
						    			</tr>
						    		</c:forEach>
						    	</table>
						    </div>    
						</div>
					</div>	
				</div>
				<!-- Footer -->
				<jsp:include page="/WEB-INF/view/auth/include/footer.jsp"></jsp:include> 
			</div>		
		</div>
		<!--   Core   -->
		<script src="${pageContext.request.contextPath}/assets/js/plugins/jquery/dist/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
		<!--   Optional JS   -->
		<script src="${pageContext.request.contextPath}/assets/js/plugins/chart.js/dist/Chart.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
		<!--   Argon JS   -->
		<script src="${pageContext.request.contextPath}/assets/js/argon-dashboard.min.js?v=1.1.2"></script>
		<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
		<script>
		    window.TrackJS &&
		      TrackJS.install({
		        token: "ee6fab19c5a04ac1a32a645abde4613a",
		        application: "argon-dashboard-free"
		    });
  		</script>
  	</body>
</html>