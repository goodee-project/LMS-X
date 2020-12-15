<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<h1>학생회원가입</h1>
	<form id="studentForm" method="post" action="${pageContext.request.contextPath}/student/signup">
		<input type="text" hidden="hidden" value="1" name="accountLevel">
		<input type="text" hidden="hidden" value="대기" name="accountState">
		<div>아이디</div>
		<div><input id="accountId" type="text" placeholder="아이디를 입력하세요" name="accountId"></div>
		<div id="accountIdCheck"></div>	
		
		<div>비밀번호</div>
		<div class="input password">
			<input id="studentPw1" type="password" placeholder="7자리 이상 입력해주세요" name=accountPw >
		</div>	
		<div class="input password">
			<input id="studentPw2" type="password" placeholder="다시 비밀번호를 입력하세요">
		</div>	
		<div id="studentPwCheck"></div>	
		
		<div>이메일</div>
		<div><input id="studentEmail" type="text" placeholder="이메일을 입력하세요" name="studentEmail"></div>
		<div id="studentEmailCheck"></div>
		
		<div>이름</div>
		<div><input id="studentName" type="text" placeholder="이름을 입력하세요" name="studentName"></div>
			
		<div>핸드폰번호</div>
		<div><input id="studentPhone" type="text" placeholder="번호를 입력하세요" name="studentPhone"></div>
			
		<div>성별</div>
		<div><input class="studentGender" type="radio" name="studentGender" value="남">남</div>
		<div><input class="studentGender" type="radio" name="studentGender" value="여">여</div>
			
		<div>생년월일</div>
		<div><input id="studentBirth" type="date" name="studentBirth"></div>
		
		<div>주소</div>
		<div><input id="studentAddressMain" type="text" name="studentAddressMain" placeholder="임시 주소입니다."></div>
		
		<div>상세주소</div>
		<div><input id="studentAddressSub" type="text" placeholder="상세주소를 입력하세요" name="studentAddressSub"></div>
		
		<div><button id="btn" type="button">회원가입</button></div>
	</form>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$('#btn').click(function(){
		//id검사
		if($('#accountId').val()==""){
			$('#accountId').focus();
			$('#accountIdCheck').html('아이디를 입력해주세요');
			return;
		}else {
			$('#accountIdCheck').html('');
		}
		//비밀번호검사
		 
		if($('#studentPw1').val().length < 7){
			$('#studentPw1').focus();
			$('#studentPwCheck').html('비밀번호를 입력해주세요');
			return;
		}else if($('#studentPw2').val()==""){
			$('#studentPw2').focus();
			$('#studentPwCheck').html('비밀번호를 한번더 입력해주세요');
			return;
		}else if($('#studentPw1').val()!=$('#studentPw2').val()){
			$('#studentPw1').focus();
			$('#studentPwCheck').html('비밀번호가 일치하지않습니다.');
			return;
		}else {
			$('#studentPwCheck').html('');
		}
		
		//이메일 형식 검사
		function CheckEmail(str)
		{                                                 
		     var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		     if(!reg_email.test(str)) {                            
		          return false;         
		     }                            
		     else {                       
		          return true;         
		     }                            
		} 

		if($('#studentEmail').val()==""){
			$('#studentEmail').focus();
			$('#studentEmailCheck').html('이메일을 입력해주세요');
			return;
		}else if(!CheckEmail($('#stdentEmail').val())){
			$('#studentEmail').focus();
			$('#studentEmailCheck').html('이메일 형식이 잘못 되었습니다.');
			return;
		}else{
			$('#studentEmailCheck').html('');
		}
			
		
	});
	
</script>
</html>