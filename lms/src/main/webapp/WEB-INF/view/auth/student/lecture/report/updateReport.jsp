<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>insertReport</title>
		<!-- Favicon -->
		<link href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" rel="icon" type="image/png">
		<!-- Fonts -->
		<link
			href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
		<!-- Icons -->
		<link href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
		<link
			href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"
			rel="stylesheet" />
		<!-- CSS Files -->
		<link href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<!-- NAVER SmartEditor2 스크립트 -->
		<script src="${pageContext.request.contextPath}/smarteditor2/js/HuskyEZCreator.js"></script>
		<script>
			$(document).ready(function(){	
				// 과제가 제출기간이 맞는지 확인
				$.ajax({
					url: '${pageContext.request.contextPath}/auth/student/lecture/report/checkReportSubmitDate/' + ${report.reportNo},
					type:'post',
					success: function(data){
						// 제출 기간이 아닐경우
						if(!data){
							alert('제출 기간이 아닙니다.');
							$(location).attr('href', '${pageContext.request.contextPath}/auth/student/lecture/' + ${lectureNo} + '/report/reportOne/' + ${report.reportNo})
							return;
						}
					}
				});
				
				// 파일 추가 버튼
				$('#addFileBtn').click(function(){
					// 파일 개수 제한
					if($('#fileInput').children().length >= 10){
						alert('최대 10개만 가능합니다.');
						return;
					}
		
					let html =`<div><input type="file" class="form-control reportSubmitFileList" name="reportSubmitFileList" onchange="checkSize(this)"></div>`;
					$('#fileInput').append(html);
		
				})
				
				// 파일 삭제 버튼
				$('#delFileBtn').click(function(){
					// 마지막 파일을 삭제함
					$('#fileInput').children().last().remove();
				})
				
				// 과제 제출 버튼
				$('#reportSubmitBtn').click(function(){
					oEditors.getById["reportSubmitContent"].exec("UPDATE_CONTENTS_FIELD", []); // 스마트 에디터 내용 적용
					var rsc = $("#reportSubmitContent").val();
					// 제목, 내용 유효성 검사
					if($('#reportSubmitTitle').val().length < 1){
						alert('제목을 입력해 주세요.');
						return;
					} else if(rsc == "" || rsc == null || rsc == '&nbsp;' || rsc == '<p>&nbsp;</p>'){
						alert('내용을 입력해 주세요.');
						oEditors.getById["rsc"].exec("FOCUS");
						return;
					}
		
					// 첨부 파일 유효성 검사
					let submitCk = true;
					$('.reportSubmitFileList').each(function(index, item){
						// 파일 비어있을시 && submitCk가 true일때(경고창 한번만 출력하기 위함)
						if($(item).val() == '' && submitCk){
							alert('파일이 비어있습니다!');
							submitCk = false;
							return;
						}
					})
					
					// 정상적일 때 submit
					if(submitCk){
						$('#reportSubmitForm').submit();
					}
				})

				
				// 파일 한개 삭제 -- 비동기 요청
				$('.deleteReportSubmitFileOneBtn').on('click', function(){
					let uuid = $(this).val();
					let fileId = uuid.split('.')[0];
					$.ajax({
						url: '${pageContext.request.contextPath}/auth/student/lecture/report/deleteReportSubmitFileOne/' + uuid,
						type:'get',
						success: function(){
							$('#' + fileId).remove();
						}
					})
				})
				
				// NAVER SmartEditor2 적용 코드
				let oEditors = [];				
				nhn.husky.EZCreator.createInIFrame({
					oAppRef : oEditors,
					elPlaceHolder : 'reportSubmitContent',
					sSkinURI : '${pageContext.request.contextPath}/smarteditor2/SmartEditor2Skin.html',
					fCreator : 'createSEditor2'
				});
			})
			
			function checkSize(input) {
			    if (input.files && input.files[0].size > (10 * 1024 * 1000)) {
			        alert("파일 사이즈가 10MB 를 넘습니다.");
			        input.value = null;
			    }
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
			<!-- 과제 내용 -->
   			<div class="container-fluid mt--7">
				<div class="card shadow">
					<div class="card-header border-0">
						<div class="row align-items-center">
							<div class="col-8">
								<h3 class="mb-0">과제</h3>
							</div>
							<div class="col-4 text-right">
								<button class="btn btn-sm btn-dark" onclick="location.href='${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/report/reportOne/${reportNo}'">목록</button>
							</div>
						</div>
					</div>
					<div class="row align-items-center">
						<div class="col-12">
							<table class="table">
					    		<tr>
					    			<th width="20%">제목</th>
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
					</div>	
				</div>
				<!-- 과제 제출 -->
				<div class="row mt-5">
					<div class="col-xl-12 mb-5 mb-xl-0">
						<div class="card shadow">
							<div class="card-header border-0">
								<div class="row align-items-center">
									<div class="col-8">
										<h3 class="mb-0">과제 수정</h3>
									</div>
									<div class="col-4 text-right">
										<button class="btn btn-sm btn-primary" id="reportSubmitBtn" type="button">수정</button>
									</div>
								</div>
							</div>
							<div class="table-responsive">
								
						    <!-- 과제 제출 수정 폼 -->
						    <div>
						    	<form id="reportSubmitForm" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/auth/student/lecture/${report.lectureNo}/report/updateReport">   	
						    		<input id="lectureNo" type="hidden" name="lectureNo" value="${lectureNo}"> 	
						    		<input id="reportNo" type="hidden" name="reportNo" value="${reportNo}">
						    		<input id="reportSubmitNo" type="hidden" name="reportSubmitNo" value="${reportSubmit.reportSubmitNo}">
						    		<!-- 내용 -->
							    	<table class="table">
							    		<tr>
							    			<th width="20%">제목</th>
							    			<td><input class="form-control" id="reportSubmitTitle" type="text" name="reportSubmitTitle" value="${reportSubmit.reportSubmitTitle}"></td>
							    		</tr>
							    		<tr>
							    			<th>내용</th>
							    			<td style="width:100%;"><textarea rows="22" cols="10" wrap="hard" name="reportSubmitContent" id="reportSubmitContent" style="width:100%;">${reportSubmit.reportSubmitContent}</textarea></td>
							    		</tr>
							    	</table>
							    	<!-- 첨부파일 -->
							    	<table class="table">
						    			<thead class="thead-light">
								    		<tr>
								    			<th>기존 첨부파일</th>
								    		</tr>
								    	</thead>
								    	<tbody>
								    		<c:if test="${!empty reportSubmit.reportSubmitFileList}">
									    		<c:forEach items="${reportSubmit.reportSubmitFileList}" var="rsf">
									    			<!-- 태그 id에 . 이 있으면 안되므로 uuid에서 확장자를 제외한 이름만 id로 지정해줌 -->
						      						<c:set var="uuid">${rsf.reportSubmitFileUuid}</c:set>
									    			<tr id="${fn:split(uuid ,'.')[0]}">
									    				<td>${rsf.reportSubmitFileOriginal}</td>
									    				<!-- 파일 사이즈 -->
									    				<td>
									    					<c:choose>
									    						<c:when test="${rsf.reportSubmitFileSize >= (1024 * 1024)}">
									    							<fmt:formatNumber value="${rsf.reportSubmitFileSize/(1024*1024)}" type="pattern" pattern="0.00" />MB					
									    						</c:when>
									    						<c:when test="${rsf.reportSubmitFileSize >= 1024}">
									    							<fmt:formatNumber value="${rsf.reportSubmitFileSize/1024}" type="pattern" pattern="0.00" />B 
									    						</c:when>
									    						<c:otherwise>
									    							<fmt:formatNumber value="${rsf.reportSubmitFileSize}" type="pattern" pattern="0.00" />KB 	
									    						</c:otherwise>
									    					</c:choose>
									    				</td>
									    				<td id="fileCount">다운 횟수 : ${rsf.reportSubmitFileCount}회</td>
									    				<td><button class="deleteReportSubmitFileOneBtn btn btn-outline-danger" value="${rsf.reportSubmitFileUuid}" type="button">X</button></td>
									    			</tr>
									    		</c:forEach>
								    		</c:if>
								    		<c:if test="${empty reportSubmit.reportSubmitFileList}">
								    			<tr>
								    				<td>(첨부파일이 없습니다)</td>
								    			</tr>
								    		</c:if>
							    		</tbody>
							    	</table>
							    	<!-- 첨부파일 -->
							    	<table class="table">
							    		<thead class="thead-light">
								    		<tr>
								    			<th>신규 첨부파일</th>
								    		</tr>
								    	</thead>
								    	<tbody>					    				
								    		<tr>
								    			<td>
									    			<div>
										   				<button id="addFileBtn" type="button" class="btn btn-sm btn-dark">파일 추가</button>
										   				<button id="delFileBtn" type="button" class="btn btn-sm btn-dark">파일 삭제</button>
									   				</div>
								   				</td>
							   				</tr>						    				
								    		<tr>
						    					<td><div id="fileInput"></div></td>
							   				</tr>
						   				</tbody>
						   			</table>						   			
						    	</form>
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
</html>