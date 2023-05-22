<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="resources/css/ticket_page.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="resources/js/cart.js" charset="UTF-8"></script>
<script type="text/javascript" src="resources/js/product.js" charset="UTF-8"></script>
<title>미래투어 - 티켓 상세페이지</title>
</head>
<body>
<script>
         // 구매수량
         $("#buy_quantity").keyup(function(e){
            var regNumber = /^([0-9]{2})$/;
            var str = $(this).val();
            if(!regNumber.test(str)) {
               var res = str.substring(0, str.length-1);
               $(this).val(res);
            }
         });
      </script>

   <!-- header -->
   <%@ include file="../include/header.jsp"%>

<main class="offer-detail">


<div id="Offer-react-component">
<div class="Offer_container">

<!-- 본문 시작 -->

<!-- 제목 ~ 본문 끝까지 -->
<div class="Grid_container">

<!-- article + 상품번호 섹션 -->
<div class="Grid_row Offer_layout">

<!-- article -->
<article class="Offer_article">
<!-- article (header) -->
<header class="OfferHeader_container">
<img name="prd_img" id="prd_img" src="${product.prd_img}" >
<h1 class="OfferHeaderTitle_container" name="prd_name" id="prd_name">${product.prd_name}</h1>
</header>

<!-- 구분선 -->
<div id="OFFER-NAVBAR-START"></div>
<ul class="OfferHeaderTags_container">
<li>
<img src="https://d2yoing0loi5gh.cloudfront.net/assets/kitty/offer/ic_ignore_wait_confirm-698c42a00aa62c7e744638173f1f5fc20c787daf5765b5e21d8be8ef60b6c0c4.png" width="24" height="24" alt="즉시확정">
<strong>즉시확정</strong> 구매 즉시 예약 확정 (일부 상품 이용일 추가 예약 필요)</li></ul>
<ul class="OfferMeta_container"> <!-- e-ticket, 유효기간, 한국어 부분  -->
<li class="OfferMetaItem_container">
<img src="https://dffoxz5he03rp.cloudfront.net/icons/ic_meta_eticket_md_gray_700.svg" alt="eticket" class="OfferMetaItem_icon">
<span class="OfferMetaItem_label">e-ticket</span></li>
<li class="OfferMetaItem_container">
<img src="https://dffoxz5he03rp.cloudfront.net/icons/ic_meta_calendar_md_gray_700.svg" alt="calendar" class="OfferMetaItem_icon">
<span class="OfferMetaItem_label">유효기간(구매 후 1개월) 내 사용</span></li>
<li class="OfferMetaItem_container">
<img src="https://dffoxz5he03rp.cloudfront.net/icons/ic_meta_language_md_gray_700.svg" alt="language" class="OfferMetaItem_icon">
<span class="OfferMetaItem_label">${product.city_no}</span></li>
</ul>

<!-- 구분선 -->
<div class="OfferIntro_container"></div>

<!-- 티켓 선택 구역 -->
<section class="OfferSectionBox_container OfferSectionBox_noBorder OfferSectionBox_noPadding" id="OFFER-SECTION-TICKET">
<div class="OfferSectionBox_body OfferOptionSection_container">
<h2 class="OfferSectionBox_title">티켓 선택</h2>
<div><div class="OfferOptionSelector_container" id="OFFER-SECTION-TICKET">
<div><div class="">
<!-- 티켓 선택 구역 내부-->
<div class="OfferOption_optionWrapper">
<div class="OfferOption_options">
<div class="OfferOptionItem_container">
<div class="OfferOptionItemHeader_container">
<h3 class="OfferOptionItemHeader_title">${product.prd_exp}</h3>
</div>
<div class="OfferOptionItem_body">

<div class="OfferOptionItemPrice_row OfferOptionItemPrice_margin">
<span class="OfferOptionItemPrice_refund">미사용 전액환불</span></div>
<div class="OfferOptionItemPrice_row">
<span class="OfferOptionItemPrice_unit">1명</span>
<span class="OfferOptionItemPrice_price"><fmt:formatNumber value="${product.prd_price}" pattern="#,###"/></span>
<span class="OfferOptionItemPrice_symbol">원</span><br><br>

<span class="OfferOptionItemPrice_unit">수량선택</span>
<input type="number" id="buy_quantity" min="1" maxlength="2" max="99" value="1" oninput="mxNum(this)" />
<span class="OfferOptionItemPrice_symbol">매</span>
               <script>
                  function mxNum(object) {
                     if (object.value.length > object.maxLength) {
                        object.value = object.value.slice(0, object.maxLength)
                     }
                  }
               </script><br><br>
<input type="hidden" name="prd_img" id="prd_img" value="${product.prd_img}" />
<input type="hidden" name="member_id" id="member_id" value="${member.member_id}" />
<input type="hidden" name="prd_id" id="prd_id" value="${product.prd_id}" />


<div class="btn1">
	<c:choose>
		<c:when test="${member.member_id eq 'admin' || member.member_id == null}"><!-- 관리자로 로그인했을 때 -->	
			<input type="button" button class="w-btn w-btn-blue"  name="buy" id="buy" onclick="buyProduct()" value="구매하기" />&nbsp;&nbsp;&nbsp;
			<input type="button" button class="w-btn w-btn-blue"  name="cart" id="cart" onclick="insertCart()" value="장바구니" />&nbsp;&nbsp;&nbsp;
		</c:when>
		<c:otherwise>
			<input type="button" button class="w-btn w-btn-blue"  name="buy" id="buy" onclick="buyProduct()" value="구매하기" />&nbsp;&nbsp;&nbsp;
			<input type="button" button class="w-btn w-btn-blue"  name="cart" id="cart" onclick="insertCart()" value="장바구니" />&nbsp;&nbsp;&nbsp;
			<input type="button" button class="w-btn w-btn-blue"  name="cart" id="cart" onclick="location.href='productCart?member_id=${member.member_id}'" value="내 장바구니 보기" /></div>
		</c:otherwise>
	</c:choose>
<input type="hidden" name="hiddenbtn" id="hiddenbtn" value="prdpage" />

</div></div></div></div></div></div></div></section>


<!-- 취소 및 환불 규정 -->
<section class="OfferSectionBox_container" id="OFFER-SECTION-REFUND">
<div class="OfferSectionBox_body">
<h2 class="OfferSectionBox_title">취소 및 환불 규정</h2>
<div><div class="OfferContents_container">
<div class="OfferFlexibleBox_container">
<div class="OfferFlexibleBox_body">
<p class="OfferContents_contents">- 유효기간 내 미사용티켓 100% 환불가능
<br class="">- 유효기간 후 수수료 차감/ 일부상품 환불 불가능<br class="">- 사용한 티켓은 환불 불가능합니다.</p></div>
<div class="OfferFlexibleBox_more"></div></div></div></div></div></section>


<!-- 마지막 구분선 -->
<div id="OFFER-NAVBAR-END"></div>
</article>


<!-- 상품번호 섹션 -->
<div class="offer-container_prd_id">
<p class="offer-container_prd_id-content">상품번호: <span>${product.prd_id}</span></p></div></div>


</main>

</body>
</html>