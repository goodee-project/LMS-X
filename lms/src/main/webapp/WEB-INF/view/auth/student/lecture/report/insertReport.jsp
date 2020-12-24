<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>insertReport</title>
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
						// 제출기간이 아닐경우
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
		
					let html =`<div><input type="file" name="reportSubmitFileList" class="reportSubmitFileList"></div>`;
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
					// 제목, 내용 유효성 검사
					if($('#reportSubmitTitle').val().length < 1){
						alert('제목을 입력해 주세요.');
						return;
					} else if($('#reportSubmitContent').val().length < 1){
						alert('내용을 입력해 주세요.');
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
				
				// NAVER SmartEditor2 적용 코드
				let oEditors = [];				
				nhn.husky.EZCreator.createInIFrame({
					oAppRef : oEditors,
					elPlaceHolder : 'reportSubmitContent',
					sSkinURI : '${pageContext.request.contextPath}/smarteditor2/SmartEditor2Skin.html',
					fCreator : 'createSEditor2'
				});
			})
		</script>
	</head>
	<body>
		<h1>과제 상세보기 - 작성</h1>
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
	    
	    <!-- 과제 제출 폼 -->
	    <div>
	    	<form id="reportSubmitForm" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/auth/student/lecture/${report.lectureNo}/report/insertReport">   	
	    		<input id="lectureNo" type="hidden" name="lectureNo" value="${lectureNo}"> 	
	    		<input id="reportNo" type="hidden" name="reportNo" value="${reportNo}">
	    		<!-- 내용 -->
		    	<table border="1">
		    		<tr>
		    			<th>제목</th>
		    			<td><input id="reportSubmitTitle" type="text" name="reportSubmitTitle"></td>
		    		</tr>
		    		<tr>
		    			<th>내용</th>
		    			<td style="width:100%;"><textarea name="reportSubmitContent" id="reportSubmitContent" style="width:100%;"></textarea></td>
		    		</tr>
		    	</table>
		    	
		    	<!-- 첨부파일 -->
    			<h3>첨부파일</h3>
   				<button id="addFileBtn" type="button">파일 추가</button>
   				<button id="delFileBtn" type="button">파일 삭제</button>
    			<div id="fileInput"></div>
    			<!-- 과제 제출 -->   
			    <div>
			    	<button id="reportSubmitBtn" type="button">과제 제출</button>
			    </div>
	    	</form>
	    </div> 
	</body>
</html>