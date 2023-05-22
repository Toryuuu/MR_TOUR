<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>  
<%@ page isELIgnored="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="resources/css/hotel_checkout.css" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src = "resources/js/hotel_checkout.js"></script>
<title>호텔 결제 페이지</title>


</head>

<body class="body" data-action="index" data-controller-path="mrt3/payment" data-controller="payment"
data-sign-in data-turbolinks="false" style>

	<!-- header -->
	<%@ include file="../include/header.jsp"%>

<div id="Mrt3Payment-react-component-a92f35c0-6ea8-48dc-8477-7eb3bb3206cc">
	<main class="orderForm--Container">
	
	<form class="orderForm--Form">
	
	<h1 class="orderForm--Title">예약하기</h1>
	
	<!-- 왼쪽 섹션 -->
	<div class="orderForm--Content">
		<div class="orderForm--LeftContainer">
			<div class="sectionContainer--Container">
				<div class="sectionContainerHeader--Wrapper">
					<div class="sectionContainerHeader--Box">
						<h2 class="sectionContainerHeader--Title">상품 정보</h2>
					</div>
				</div>
	<hr class="title--Underbar">
				<div class="sectionContainer--Body">
					<div class="productInfoSummary--TitleWrapper">
						<div class="productInfoSummary--ImageWrapper">
							<img src="${map.prd_img}" 
								 alt="상품 이미지" class="productInfoSummary--Image">
						</div>
						<input type = "hidden" id = "prd_id" value="${map.prd_id}" >
						<div class="productInfoSummary--TextWrapper">
							<h3 class="productInfoSummary--Title">${map.prd_name}</h3>
							<div class="productInfoSummary--Schedule">
								<div class="reservationDate--Container">
									<div class="reservationDate--Wrapper">
										<time class="reservationDate--Time"></time><span>1박</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<ul class="productInfoOptions--OptionWrapper">
						<li class="productInfoOptions--Option">
							<div class="productInfoOptions--OptionText">
								<span class="productInfoOptions--OptionName">${map.prd_name},  ${map.prd_opt}</span></div>
								<input type = "hidden" id = "prd_opt" value="${map.prd_opt}" >	
							<div class="productInfoOptions--OptionPrice">${map.prd_price}원</div>
						</li>
					</ul>
					
					<div class="productInfoPrice--Container">
						<div class="productInfoPrice--TotalPriceWrapper">
							<div class="productInfoPrice--TotalPriceText">총 상품 금액</div>
							<strong class="productInfoPrice--TotalPriceNumber">${map.prd_price}원</strong>
							<input type = "hidden" id = "buy_quantity" value="1" >	
						</div>
					</div>
				</div>
			</div>
			
			<!-- 예약자 정보 섹션 -->
			<div class="sectionContainer--Container">
				<div class="sectionContainerHeader--Wrapper">
					<div class="sectionContainerHeader--Box">
						<h2 class="sectionContainerHeader--Title">예약자 정보</h2>
					</div>
				</div>
	<hr class="title--Underbar">
				<div class="sectionContainer--Body">
					<div class="reservationPersonInfo--Wrapper">
						<div class="reservationPersonInfo--Summary">
							<div class="infoField--Field">
								<div class="infoField--Title">예약자 이름</div>
								<div class="infoField--Content">${member.member_name}</div>
							</div>
						</div>
						<div class="infoField--Field">
							<div class="infoField--Title">이메일 주소</div>
							<div class="infoField--Content">
								<input formcontrolname="member_email" type="text" id = "member_email" value="${member.member_email}" 
									class="c-input ng-untouched ng-pristine ng-invalid">
							</div>
						</div>
						<div class="infoField--Field">
							<div class="infoField--Title">휴대전화 번호</div>
							<div class="infoField--NeededContent">
								<input formcontrolname="member_phone" type="text" id = "member_phone" value="${member.member_phone}" >
							</div>

						</div>
					</div>

				</div>
				<p class="reservationPersonInfo--Highlight">예약 안내 정보는 회원 이메일로 발송됩니다.</p>
			</div>
		</div>
	
	
	<!-- 추가 예약 정보(필수) 섹션 -->
	<div class="sectionContainer--Container">
		<div class="sectionContainerHeader--Wrapper">
			<div class="sectionContainerHeader--Box">
				<h2 class="sectionContainerHeader--Title">추가 예약 정보</h2>
				<span class="sectionContainerHeader--Required">(필수)</span>
			</div>
		</div>
<hr class="title--Underbar">
		<div class="sectionContainer--Body">
		
			<div class="productRequireInfos--FlagWrapper">
				<div class="productRequireInfos--FlagTitle">체크인 고객 정보</div>
				<div class="productRequireInfos--FlagSubTitle">숙소에 실제 체크인하는 분의 정보를 정확하게 입력해주세요.</div>
				<div class="productRequireInfos--TitleWrapper">
					<div class="productRequireInfos--Title">체크인 고객 이름</div>
					<div class="additionalInfoContainer--Container">
						<input type="text" maxlength="50" class="text--TextInput" value="" placeholder="${member.member_name}">
						<div class="additionalInfoContainer--Caption"></div>
					</div>
					<div class="additionalInfoContainer--Container">
						<div class="additionalInfoContainer--Caption"></div>
					</div>
				</div>
			</div>
			
			<div class="productRequireInfos--FlagWrapper">
				<div class="productRequireInfos--FlagTitle">예약자 정보</div>
				<div class="productRequireInfos--FlagSubTitle">예약하시는 분의 정보를 정확하게 입력해주세요.</div>
				<div class="productRequireInfos--TitleWrapper">
					<div class="productRequireInfos--Title">예약자 이름</div>
					<div class="additionalInfoContainer--Container">
						<input type="text" maxlength="50" class="text--TextInput" value="" placeholder="${member.member_name}">
						<div class="additionalInfoContainer--Caption"></div>
					</div>
					<div class="additionalInfoContainer--Container">
					<div class="additionalInfoContainer--Caption"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	<!-- 오른쪽 섹션 -->
	<div class="floatingContainer--Container">
		<div class="floatingContainer--Wrapper">
			<!-- 결제 정보 -->
			<div class="sectionContainer--Container">
			<div class="sectionContainerHeader--Wrapper">
			<div class="sectionContainerHeader--Box">
			<h2 class="sectionContainerHeader--Title">결제 정보</h2></div></div>
			<hr class="title--Underbar">
			<div class="sectionContainer--Body">
			<div class="totalPriceInfo--Container">
			<span class="totalPriceInfo--Text">총 결제 금액</span>
			<span class="totalPriceInfo--Price">${map.prd_price}원</span></div>
			<div class="paymentInfo--Wrapper">
			</div></div></div>
			
			<div class="sectionContainer--Container">
				<div class="sectionContainerHeader--Wrapper">
					<div class="sectionContainerHeader--Box">
						<h2 class="sectionContainerHeader--Title">결제 방법</h2>
					</div>
				</div>
				<ul class="payment">
	
						<li>
							<span class="color-main2"><input type = "radio" name = "payway" id = "cash" value = "cash">무통장입금</span>
							<br>
							<span class="color-main2"><input type = "radio" name = "payway" id = "card" value = "card">카드결제</span>
							<br>
						
							<div id="creditPay" style = "display:none">
								<input type="text" id="credit1" maxlength="4" size="4" onkeypress="onlyNumber()" style = "background : rgb(234, 234, 234)"/> - 
								<input type="password" id="credit2" maxlength="4" size="4" onkeypress="onlyNumber()" style = "background : rgb(234, 234, 234)"/> - 
								<input type="text" id="credit3" maxlength="4" size="4" onkeypress="onlyNumber()" style = "background : rgb(234, 234, 234)"/> - 
								<input type="password" id="credit4" maxlength="4" size="4" onkeypress="onlyNumber()" style = "background : rgb(234, 234, 234)"/>
							</div>
						</li>
				</ul>
			</div>
			
			<!-- 약관 안내 섹션 -->
			<div class="sectionContainer--Container">
				<div class="sectionContainerHeader--Wrapper">
					<div class="sectionContainerHeader--Box">
						<h2 class="sectionContainerHeader--Title">약관 안내</h2>
					</div>
				</div>
				<hr class="title--Underbar">
				<div class="sectionContainer--Body">
					<div class="policyForm--Container">
						<div>
							<div class="mrt-form-item">
								<div class="agree--All">
								<input type="checkbox" class="checkbox-control-input" id="checkAll" type="checkbox" onclick = "check_all()" value="">
									<label class="mrt-checkbox-label term--label" for="mrt-all-term-agree">전체 약관 동의</label>
								</div>
								
								<div class="allTerms--TermContainer">
								
									<div class="mrt-required-term">
										<div class="requiredTerm--box">
										<input type="checkbox" class="checkbox-control-input ng-untouched ng-pristine ng-valid" name="chk" value="" id = "chk01">
											<label class="mrt-checkbox-label term--label" for="mrt-privacy-term-privacyTerm">개인정보 제공 동의 (필수)</label>
										</div>
									<img class="termImage" src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrowright_md_gray_300.svg" alt="detail arrow">
									</div>
								
									<div class="mrt-required-term">
										<div class="requiredTerm--box">
									<input type="checkbox" class="checkbox-control-input ng-untouched ng-pristine ng-valid" name="chk" value="" id = "chk02">
										<label class="mrt-checkbox-label term--label" for="mrt-privacy-term-privacyUsageTerm">개인정보 수집 및 이용 동의 (필수)</label>
										</div>
										<img class="termImage" src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrowright_md_gray_300.svg" alt="detail arrow">
									</div>
									
									<div class="mrt-required-term">
										<div class="requiredTerm--box">
									<input type="checkbox" class="checkbox-control-input ng-untouched ng-pristine ng-valid" name="chk" value="" id = "chk03">
											<label class="mrt-checkbox-label term--label" for="mrt-privacy-term-benefitsTerm">특가 숙소 및 할인 혜택 안내 동의 (선택)</label>
										</div>
										<img class="termImage" src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrowright_md_gray_300.svg" alt="detail arrow">
									</div>
								</div>
							</div>
						</div>
						
						<div class="notice--Container">
							<div class="notice--Text--notice--Title">예약 취소 규정</div>
							<div class="notice--Text">
								<p class="css-0">숙박일 7일 전까지 : 전액 환불</p>
								<p class="css-0">숙박일 1~6일 전까지 : 수수료 차감</p>
								<p class="css-0">숙박 전날 : 환불 불가</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 결제하기 버튼 -->
			<div class="purchaseButton--Wrapper">
				<span role="button" class="purchaseButton--disabled">
					<button type="button" class="mrt-button purchaseBtn" onclick="termChk()">
						<span class="buttonSpan">${map.prd_price}원 결제하기</span>
					</button>
				</span>
			</div>
		</div>
	</div>
	
	</form>
	
	</main>
</div>

</body>
</html>