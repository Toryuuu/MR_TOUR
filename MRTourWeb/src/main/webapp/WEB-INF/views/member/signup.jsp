<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원가입</title>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src = "http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src = "resources/js/signup.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<style type="text/css">
		@import url("resources/css/signup.css");
	</style>
</head>
<body>
			
	<main class="SignUpEmail-Container">
	
	<!-- 상단 로고 배치 -->		
	<div class = "logo">
		<span class = "mr_logo"><img src = "resources/img/mr_logo.png"></span>
	</div>
	<!-- 입력 칸 -->
		<form action="signup" method="POST" class="SignUpEmail-Form">
		
			<!-- 아이디 섹션 -->
			<div class="SignUpEmail-Section">
				<div class="FormTextInput-Container">
					<!-- 중복확인 버튼 -->
					<label for="member_id" required="" class="FormTextInput-Label">아이디</label>
					<input type="button" onClick="idChk()" class = "idchk" cursor = "pointer" value="중복확인" /><br>
						<label id="idchk"></label>
					<!-- 입력칸 -->
					<input id="member_id" type="text" placeholder="ID를 입력해주세요" class="FormTextInput-Input" value="">
				</div>
			</div>
			
			<!-- 비밀번호 섹션 -->
			<div class="SignUpEmail-Section">
				<div class="FormTextInput-Container">
					<label for="userPasswordCurrent" required="" class="FormTextInput-Label">비밀번호</label>
					<input id="member_pwd" name="user[password]" type="password" placeholder="영문, 숫자, 특수문자 2가지 조합 8~15자" 
						   class="FormTextInput-Input" value="">
				</div>
			</div>
			
			<!-- 비밀번호 확인 섹션 -->
			<div class="SignUpEmail-Section">
				<div class="FormTextInput-Container">
					<label for="member_pwd_chk" required="" class="FormTextInput-Label">비밀번호 확인</label>
					<input id="member_pwd_chk" name="user[confirm]" type="password" placeholder="비밀번호를 한번 더 입력해주세요." 
					       class="FormTextInput-Input" value="">
				</div>
			</div>
					
			<!-- 이름 섹션 -->
			<div class="SignUpEmail-Section">
				<div class="FormTextInput-Container">
					<label for="member_name" required="" class="FormTextInput-Label">이름</label>
					<input id="member_name" name="user[name]" type="text" placeholder="이름을 입력해주세요." class="FormTextInput-Input" value="">
				</div>
			</div>	
								
			<!-- 생년월일 섹션 -->
			<div class="SignUpEmail-Section">
				<div class="FormTextInput-Container">
					<label for="member_birth" required="" class="FormTextInput-Label">생년월일</label><br>
					<select id="birth_year" class="FormTextInput-third"  style = "margin-right : 11px">
						<option value="">년</option>
							<c:forEach var="i" begin="0" end="${2019-1900}">
								<c:set var="yearOption" value="${2019-i}" />
								<option value="${yearOption}">${yearOption}</option>
							</c:forEach>
						</select>
						<select id="birth_month" class="FormTextInput-third" style = "margin-right : 11px">
							<option value="">월</option>
							<c:forEach var="j" begin="0" end="${12-1}">
								<c:set var="monthOption" value="${12-j}" />
								<option value="${monthOption}">${monthOption}</option>
							</c:forEach>
						</select> 
					<input type="text" id="birth_day" size="3" class="FormTextInput-third"  
						   maxlength="2" placeholder="일"/><br>
				</div>
			</div>

			<!-- 전화번호 섹션 -->
			<div class="SignUpEmail-Section">
				<div class="FormTextInput-Container">
					<label for="userPhone" required="" class="FormTextInput-Label">전화번호</label><br>
						<select id="Numst" class="FormTextInput-third" >
							<option value="" selected>::선택::</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
						</select> - 
						<input type="text" id="Numnd" class="FormTextInput-third"  maxlength="4" size="4" /> - 
						<input type="text" id="Numrd" class="FormTextInput-third"  maxlength="4" size="4" />
				</div>
			</div>	
											
			<!-- 이메일 섹션 -->
			<div class="SignUpEmail-Section">
				<div class="FormTextInput-Container">
					<label for="member_email" required="" class="FormTextInput-Label">이메일</label><br>
					<input type = "text" size = "15" id="email_id" class="input">
						<span class = "sp_mail">@</span>
					<input type="text" size="15" id="email_addr" class="input" disabled>
						<select id="email_select">
							<option value="" selected>::선택하세요::</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="nate.com">nate.com</option>
							<option value="1">직접입력</option>
						</select>
				</div>
			</div>
						
			
			<!-- 주소 섹션 -->		
			<div class="SignUpEmail-Section">
				<div class="FormTextInput-Container">
					<label for="1stAddr" required="" class="FormTextInput-Label">주소</label><br>
						<input type="text" name="member_zipcode" id="member_zipcode"  placeholder="우편번호" class="FormTextInput-post"
							   readonly size="10" >
						<input type="button" onclick="searchPost()" value="주소 찾기" class = "postchk"><br>
						<input type="text" name="member_faddr" id="member_faddr" class="FormTextInput-Input" 
							   size="60" readonly>
					<label for="2ndAddr" required="" style = "font-size: 14px; font-weight: 500;">상세주소</label>
							<input type="text" name="member_laddr" id="member_laddr" class="FormTextInput-Input" size="60">
				</div>
			</div>	
			
			
			<!-- 약관 섹션 -->
			<div class="AgreementList-Container">
			
				<div class="AgreementList-TitleSection">
				    <input id="checkAll" type="checkbox" onclick = "check_all()" value="">
				  <label class="check-label AgreeLabel" for="mrt-agreement-all">
				    <strong>전체 약관 동의</strong>
				  </label>
				</div>
			
				<ul class="AgreementList-List">
					<!-- 만 14세 이상입니다. (필수) -->
					<li class="AgreementItem-Row">
						<div class="AgreementItem-Item">
							<div class="Item-Checkbox">
								<input type="checkbox" name="chk" value="" id = "chk01">
								<label class="check-label AgreeLabel"></label>
							</div>
								<button type="button" class="AgreementItem-LabelBtn">만 14세 이상입니다. (필수)</button>
						</div>
					</li>
					
					<!-- 회원 가입 및 운영약관 동의 (필수) -->
					<li class="AgreementItem-Row">
						<div class="AgreementItem-Item">
							<div class="Item-Checkbox">
								<input type="checkbox" name="chk" value="" id = "chk02">
								<label class="check-label AgreeLabel"></label>
							</div>
							<button type="button" class="AgreementItem-LabelBtn">회원 가입 및 운영약관 동의 (필수)
								<div class="AgreementItem-ArrowBox">
									<img class="ArrowBox" src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrow_right_xs_gray_300.svg" alt="icon">
								</div>
							</button>
						</div>
					</li>
					
					<!-- 개인정보 수집 및 이용 (필수) -->
					<li class="AgreementItem-Row">
						<div class="AgreementItem-Item">
							<div class="Item-Checkbox">
								<input type="checkbox" name="chk" value="" id = "chk03">
								<label class="check-label AgreeLabel"></label>
							</div>
							<button type="button" class="AgreementItem-LabelBtn">개인정보 수집 및 이용 (필수)
								<div class="AgreementItem-ArrowBox">
									<img class="ArrowBox" src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrow_right_xs_gray_300.svg" alt="icon">
								</div>
							</button>
						</div>
					</li>
					
					<!-- 위치정보 이용약관 (필수) -->
					<li class="AgreementItem-Row" style = "margin-bottom : 5px;">
						<div class="AgreementItem-Item">
						<div class="Item-Checkbox">
							<input type="checkbox" name="chk" value="" id = "chk04">
							<label class="check-label AgreeLabel"></label>
						</div>
						<button type="button" class="AgreementItem-LabelBtn">위치정보 이용약관 (필수)
							<div class="AgreementItem-ArrowBox">
								<img class="ArrowBox" src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrow_right_xs_gray_300.svg" alt="icon">
							</div>
						</button>
						</div>
					</li>
				</ul>	
				
				<ul class="AgreementList-Notices">
					<li class="AgreementList-Notices-Content">*필수 항목을 동의하지 않으면 서비스를 이용하실 수 없습니다.</li>
				</ul>
			
			</div>
			
			<!-- 회원가입 버튼 -->
			<span role="button" class="ButtonArea">
				<button type="button" class="mrt-button Button" onclick="Signup()">
					<span class="Join">회원가입</span>
				</button>
			</span>
		</form>
	</main>
</body>
</html>