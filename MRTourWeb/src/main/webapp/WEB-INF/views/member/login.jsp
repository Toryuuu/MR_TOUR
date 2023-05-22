<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset = "utf-8">
	<title>로그인</title>
	<style>
		@import "resources/css/login.css";
	</style>
	<script src = "resources/js/login.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src = "http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div id = "contaner">
		<form action = "login" method = "post"> 
			<div class = login_form>
			
			<!-- 상단 로고 배치 -->
			
				<div class = "logo">
					<span class = "mr_logo"><img src = "resources/img/mr_logo.png"></span>
				</div>
				
			<!-- 아아디/비밀번호 입력 폼 -->
				
				<div class = "login_input">
					<div class = "input_duo">
						<span class="input_text" id = "input_id">
							<input id="member_id" type="text" title="아이디" autocomplete="off" value="">
							<label for="input_id">아이디</label>
						</span>
						<span class="input_text" id = "input_pwd">
							<input id="member_pwd" type="password" title="비밀번호" autocomplete="off" placeholder=" " value="">
							<label for="input_pwd">비밀번호</label>
						</span>
					</div>
				</div>
				<div class = "login_btn">
					<button type="button" class="btn" onclick="memberCheck()">로그인</button>
				</div>
				<div class = "signup_btn">
					<button type="button" class="btn" onclick="location.href='signup'">회원가입</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>