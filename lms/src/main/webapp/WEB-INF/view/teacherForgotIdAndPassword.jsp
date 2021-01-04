<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>teacherForgotIdAndPassword</title>
	<!-- Favicon -->
	<link href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" rel="icon" type="image/png">
	<!-- Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
	<!-- Icons -->
	<link href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"	rel="stylesheet" />
	<!-- CSS Files -->
	<link href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
	<!-- jQuery / Ajax Google CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- 비동기 -->
	<script>
	$(document).ready(function(){
	
		// 이메일 형식 검사
		function CheckEmail(str) {
		   var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

		   if (regExp.test(str)) {
		       return true;
		   } else {
		       return false;
		   }
		}

		// 전화번호 - 자동 추가
		var autoHypenPhone = function(str){
		      str = str.replace(/[^0-9]/g, '');
		      var tmp = '';
		      if( str.length < 4){
		          return str;
		      }else if(str.length < 7){
		          tmp += str.substr(0, 3);
		          tmp += '-';
		          tmp += str.substr(3);
		          return tmp;
		      }else if(str.length < 11){
		          tmp += str.substr(0, 3);
		          tmp += '-';
		          tmp += str.substr(3, 3);
		          tmp += '-';
		          tmp += str.substr(6);
		          return tmp;
		      }else{              
		          tmp += str.substr(0, 3);
		          tmp += '-';
		          tmp += str.substr(3, 4);
		          tmp += '-';
		          tmp += str.substr(7);
		          return tmp;
		      }
		  
		      return str;
		}
		var phoneNum = document.getElementById('phone');

		phoneNum.onkeyup = function(){
			this.value = autoHypenPhone( this.value ) ;  
		} 

		// 아이디 및 비밀번호 찾기버튼을 눌렀을 경우
		$('#btn').click(function() {
			
			// 이메일 검사
			if ($('#email').val() == "") {
				$('#check').html('');
				$('#email').focus();
				return;
			} else if (CheckEmail($('#email').val()) == false) {
				$('#check').html('');
				$('#email').focus();
				$('#emailCheck').html('<span class="text-danger">이메일 형식이 잘못 되었습니다.</span>');
				return;
			} else {
				$('#check').html('');
				$('#emailCheck').html('');
			}

			// 이름 검사
			if ($('#name').val() == "") {
				$('#check').html('');
				$('#name').focus();
				return;
			}
			// 핸드폰 형식 검사
			function telValidator(args) {
	   			let phoneCk = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/;
	   			if (phoneCk.test(args)) {
	       			 return true;
	   		 	}
	    		return false;
			}
			// 핸드폰 검사
			if ($('#phone').val() == "") {
				$('#check').html('');
				$('#phone').focus();
				return;
			} else if (telValidator($('#phone').val()) == false) {
				$('#phone').focus();
				$('#check').html('');
				$('#phoneCheck').html('<span class="text-danger">전화번호 형식이 잘못 되었습니다.<span>');
				return;
			} else {
				$('#phoneCheck').html('');
			}
			$.ajax({
				url : '${pageContext.request.contextPath}/teacher/forgotCheck/'+$('#email').val()+'/'+$('#name').val()+'/'+$('#phone').val(), 
				type : 'get',
				success : function(data) {
					if (data == "false" ){
						$('#check').html('<span class="text-danger">입력한 정보가 없습니다. <br> 다시 확인해주세요.<span>');
						return;
					} else {
						$('#check').html('');
						$('#teacherForm').submit();
					}
				}
			});
				
		});
	});	
	</script>
</head>
<body class="bg-default">
	<div class="main-content">
		<!-- Navbar -->
		<nav class="navbar navbar-top navbar-horizontal navbar-expand-md navbar-dark">
			<div class="container px-4">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/">
					<img src="${pageContext.request.contextPath}/assets/img/brand/white.png" />
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbar-collapse-main"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<!-- Navbar items -->
		        <ul class="navbar-nav ml-auto">
		            <li class="nav-item">
		              <a class="nav-link nav-link-icon" href="${pageContext.request.contextPath}/">
		                <i class="ni ni-key-25"></i>
		                <span class="nav-link-inner--text">Login</span>
		              </a>
		            </li>
		        </ul>
			</div>
		</nav>
		<!-- Header -->
		<div class="header bg-gradient-primary py-7 py-lg-8">
			<div class="container">
				<div class="header-body text-center mb-7">
					<div class="row justify-content-center">
						<div class="col-lg-5 col-md-6">
							<h1 class="text-white">Goodee LMS</h1>
							<p class="text-lead text-light">아이디 및 비밀번호 찾기</p>
						</div>
					</div>
				</div>
			</div>
			<div class="separator separator-bottom separator-skew zindex-100">
				<svg x="0" y="0" viewBox="0 0 2560 100" preserveAspectRatio="none"
					version="1.1" xmlns="http://www.w3.org/2000/svg">
		          <polygon class="fill-default" points="2560 0 2560 100 0 100"></polygon>
		        </svg>
			</div>
		</div>
		<!-- Page content -->
		<div class="container mt--8 pb-5">
			<div class="row justify-content-center">
				<div class="col-lg-7 col-md-7">
					<div class="card bg-secondary shadow border-0">
						<div class="card-header bg-transparent pb-5">
							<form id="teacherForm" method="post" action="${pageContext.request.contextPath}/forgotIdAndPassword">
								<input type="text" hidden="hidden" name="level" value="2">
								<!-- 이메일 -->
								<div class="btn-wrapper text-center mt-3">
									<div class="input-group input-group-alternative">
										<span class="text-primary" style="margin: auto; width: 80px;">이메일</span>
										<input type="email" class="form-control" name="email" id="email" placeholder="  abc@abc.abc">
									</div>
									<div id="emailCheck"></div>
								</div>
								
								<!-- 이름 -->
								<div class="btn-wrapper text-center mt-3 ">
									<div class="input-group input-group-alternative">
										<span class="text-primary" style="margin: auto; width: 80px;">이름</span>
										<input type="text" class="form-control" name="name" id="name" placeholder="  이름을 입력하세요">
									</div>
								</div>
								
								<!-- 핸드폰 번호 -->
								<div class="btn-wrapper text-center mt-3">
									<div class="input-group input-group-alternative">
										<span class="text-primary" style="margin: auto; width: 80px;">핸드폰 <br>번호</span>
										<input type="text" class="form-control" name="phone" id="phone" placeholder="  000-0000-000">
									</div>
									<div id="phoneCheck"></div>
								</div>
								<div style="margin-top: 20px;"class = "text-center">
									<div id="check"></div>
									<button type="button" class="btn btn-primary" id="btn">찾기</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
	</div>
	<!--   Core   -->
	<script src="${pageContext.request.contextPath}/assets/js/plugins/jquery/dist/jquery.min.js"></script>
	<script	src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!--   Optional JS   -->
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