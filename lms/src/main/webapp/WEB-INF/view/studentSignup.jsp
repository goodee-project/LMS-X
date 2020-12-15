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
	<form id="studentForm" method="post"
		action="${pageContext.request.contextPath}/student/signup">
		<input type="text" hidden="hidden" value="1" name="accountLevel">
		<input type="text" hidden="hidden" value="대기" name="accountState">
		<div>아이디</div>
		<div>
			<input id="accountId" type="text" placeholder="아이디를 입력하세요"
				name="accountId">
		</div>

		<div>비밀번호</div>
		<div class="input password">
			<input id="studentPw1" type="password" placeholder="7자리 이상 입력해주세요"
				name=accountPw>
		</div>
		<div class="input password">
			<input id="studentPw2" type="password" placeholder="다시 비밀번호를 입력하세요">
		</div>
		<div id="studentPwCheck"></div>

		<div>이메일</div>
		<div>
			<input id="studentEmail" type="email" placeholder="abc@abc.abc"
				name="studentEmail">
		</div>
		<div id="studentEmailCheck"></div>

		<div>이름</div>
		<div>
			<input id="studentName" type="text" placeholder="이름을 입력하세요"
				name="studentName">
		</div>

		<div>핸드폰번호</div>
		<div>
			<input id="studentPhone" type="text" placeholder="000-0000-000"
				name="studentPhone">
		</div>
		<div id="studentPhoneCheck"></div>
		
		<div>성별</div>
		<div>
			<input class="studentGender" type="radio" name="studentGender" value="남">남
			<input class="studentGender" type="radio" name="studentGender" value="여">여
			<span id="studentGenderCheck"></span>
		</div>
		
		<div>생년월일</div>
		<div>
			<input id="studentBirth" type="date" name="studentBirth">
		</div>
		<div id="studentBirthCheck"></div>
		<div>주소</div>
		<div>
			<input id="studentAddressMain" type="text" name="studentAddressMain"
				placeholder="임시 주소입니다.">
		</div>

		<div>상세주소</div>
		<div>
			<input id="studentAddressSub" type="text" placeholder="상세주소를 입력하세요"	name="studentAddressSub">
		</div>

		<div>
			<button id="btn" type="button">회원가입</button>
		</div>
	</form>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$('#btn').click(
		function() {
		//아이디검사
		if ($('#accountId').val() == "") {
			$('#accountId').focus();
			return;
		}

		//비밀번호검사
		if ($('#studentPw1').val().length < 7) {
			$('#studentPw1').focus();
			return;
		} else if ($('#studentPw2').val() == "") {
			$('#studentPw2').focus();
			return;
		} else if ($('#studentPw1').val() != $('#studentPw2')
				.val()) {
			$('#studentPw1').focus();
			$('#studentPwCheck').html('비밀번호가 일치하지않습니다.');
			return;
		} else {
			$('#studentPwCheck').html('');
		}

		//이메일 형식 검사
		function CheckEmail(str) {
		   var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		   if (regExp.test(str)){
		       return true;
		   }else{
		       return false;
		   }
		}
		
		//이메일 검사
		if ($('#studentEmail').val() == "") {
			$('#studentEmail').focus();
			return;
		} else if(CheckEmail($('#studentEmail').val())==false) {
			$('#studentEmail').focus();
			$('#studentEmailCheck').html('이메일 형식이 잘못 되었습니다.');
			return;
		} else {
			$('#studentEmailCheck').html('');
		}

		//이름 검사
		if ($('#studentName').val() == "") {
			$('#studentName').focus();
			return;
		}
		//핸드폰 형식 검사
		function telValidator(args) {
   			
   			if (/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/.test(args)) {
       			 return true;
   		 	}
    		return false;
		}
		//핸드폰 검사
		if ($('#studentPhone').val() == "") {
			$('#studentPhone').focus();
			return;
		}else if(telValidator($('#studentPhone').val())==false) {
			$('#studentPhone').focus();
			$('#studentPhoneCheck').html('전화번호 형식이 잘못 되었습니다.');
			return;
		} else {
			$('#studentPhoneCheck').html('');
		}
		
		//성별 검사
		if ($('.studentGender:checked').val()==undefined) {
			$('#studentGender').focus();
			$('#studentGenderCheck').html('성별을 체크해주세요');
			return;
		}else{
			$('#studentGenderCheck').html('');
		}
		
		//생년월일 검사
		if($('#studentBirth').val()==""){
			$('#studentBirth').focus();
			$('#studentBirthCheck').html('생년월일을 입력해주세요')
			return;
		}else{
			$('#studentBirthCheck').html('')
		}
		
		//주소 검사
		if($('#studentAddressMain').val()==""){
			$('#studentAddressMain').focus();
			return;
		}
		
		//상세주소 검사
		if($('#studentAddressSub').val()==""){
			$('#studentAddressSub').focus();
			return;
		}
		
		$('#studentForm').submit();
	});
</script>
</html>