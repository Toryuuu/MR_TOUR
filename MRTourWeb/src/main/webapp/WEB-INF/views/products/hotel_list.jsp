<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<script src = "resources/js/hotel_checkout.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/css/hotel_list.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<meta charset="UTF-8">
<title>미래투어 호텔</title>

<!-- 검색값을 DB로 넘기기 위한 함수 -->
<script>
	function ChangeSearch() {
		var city_no = document.getElementById("city_no");
		var prd_opt = document.getElementById("prd_opt");

		document.getElementById("city_no_search").value = city_no.options[city_no.selectedIndex].text;
		document.getElementById("prd_opt_search").value = prd_opt.options[prd_opt.selectedIndex].text;
	}

	function SubmitSearch() {
		var city_no_search = document.getElementById("city_no_search").value; // 옵션의 value 값으로 변경
		var prd_opt_search = document.getElementById("prd_opt_search").value; // 옵션의 value 값으로 변경
		window.location.href = "hotel_list?city_no=" + city_no_search
				+ "&prd_opt=" + prd_opt_search;
	}
	
	//수량체크
	function Qminus(idx) {
		var quantity = parseInt(document.getElementsByName("buy_quantity_" + idx)[0].value);
		if (quantity > 1) {
			quantity -= 1;
			document.getElementsByName("buy_quantity_" + idx)[0].value = quantity;
		}
	}

	function Qplus(idx) {
		var quantity = parseInt(document.getElementsByName("buy_quantity_" + idx)[0].value);
		if (quantity < 10) {
			quantity += 1;
			document.getElementsByName("buy_quantity_" + idx)[0].value = quantity;
		}
	}
</script>
</head>


<body>
	<div class="wrapper">
		<!-- header -->
		<%@ include file="../include/header.jsp"%>

		<!-- 본문 시작 -->
		<div id="container">
			<div id="contents">

				<!-- 상단 검색창 -->
				<div class="app-car-search-form">
					<div class="search-form-top rentalcar">
						<div class=" sc5">
							<img src="resources/images/tl2.jpg">
						</div>
						<div class="inner">

							<form method="get" action="hotel_list" class="hotelsearch">
								<div class="search-area-form same-area">
									<div class="form-column">
										<p class="title">여행지</p>
										<input type = "hidden" name = "searchOption1" value = "CITY_NO">
										<select name="city_no" id="city_no" onchange="ChangeSearch()">
											<option value="전체">전체</option>
											<option value="서울">서울</option>
											<option value="강릉">강릉</option>
											<option value="여수">여수</option>
											<option value="경주">경주</option>
											<option value="부산">부산</option>
											<option value="제주">제주</option>
										</select> <input type="hidden" id="city_no_search" name = "city_no" value="">
										</p>
									</div>


									<div class="form-column">
										<p class="title">룸타입</p>
										<p class="text">
										<input type = "hidden" name = "searchOption2" value = "PRD_OPT">
											<select name="prd_opt" id="prd_opt" onchange="ChangeSearch()">
												<option value="전체">전체</option>
												<option value="싱글룸">싱글룸</option>
												<option value="더블룸">더블룸</option>
												<option value="스위트룸">스위트룸</option>
											</select> <input type="hidden" id="prd_opt_search" name = "prd_opt"  value="">
										</p>
									</div>



									<input type="button" class="btn-form-search" value="검색"
										onclick="SubmitSearch()" /> <input type="hidden"
										name="search" id="search" value="s" />

								</div>
							</form>
						</div>
					</div>

				</div>


				<!--검색창 아래 본문-->
				<div class="contents-area">
				
					<!-- 상품 위 검색 결과 섹션 -->
					<div class="search-result-header">
						<p class="total">
							<span>${map.count}</span> 개의 상품이 검색되었습니다.
						</p>
					</div>
				
					<!-- 상품 리스트 -->
					<div class="products">
						<div class="product-list">

							<c:forEach begin="0" end="${(fn:length(map.list))}" var="i">
								<c:set var="row" value="${map.list[i]}" />
									
								<c:choose>
									<%-- 검색결과가 있을 때 --%>
									<c:when test="${not empty row}">
										
										<div class="each_room">
										    <div class="room_content">
											    <div class="room_content_left">
												    <div class="left_entire">
													    <div class="room_pic">
														    <img src="${row.prd_img}" alt=" ${row.prd_opt}" class="room_img">
														</div>
												    </div>
											    </div>
											    
											    <div class="room_content_right">
												    <div class="reserve_box">
													    <div class="reserve_area">
														    <div class="free_cancel_box">
															    <div class="free_cancel">
															    	<div class="room_title">
																    	<span class="hotelBold" style = "font-size: 22px;">${row.prd_name}</span>
																    </div>
																</div>
														    	<br><br>
														    	
														    	<div class="room_condition">
																	<span class="room_condition_span">
																	    ${row.prd_opt}
																	</span>
																</div>
														
																<br>
														
															    <div>
																    <ul class="perksList">
																	    <li class="perk">
																	    	<div class="perk_content">무료 생수</div>
																	    </li>
																	    <li class="perk">
																	    	<div class="perk_content">무료 피트니스 센터</div>
																	    </li>
																    </ul>
															    </div>
														    </div>
														    
														    <div class="reserve_right">
															    <div class="price_box">
															    	<span class="free_cancel_entire_span" style="background-color:#E7F4FD">
																    <span style="font-weight:600;font-size:13px;color:#1583DB" class="free_cancel_span">무료취소</span>
																	    <span style="font-weight:500;font-size:13px;color:#0792E9" class="free_cancel_span">
																	    <%
																		    // 현재 날짜 구하기
																		    java.util.Date today = new java.util.Date();
																		    
																		    // 날짜 계산을 위한 Calendar 객체 생성
																		    java.util.Calendar cal = java.util.Calendar.getInstance();
																		    cal.setTime(today);
																		    
																		    // 일정 기간(7일) 후의 날짜 구하기
																		    cal.add(java.util.Calendar.DATE, 7);
																		    java.util.Date futureDate = cal.getTime();
																		    
																		    // SimpleDateFormat을 사용하여 futureDate를 문자열로 변환
																		    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
																		    String futureDateStr = sdf.format(futureDate);
																		%>
																	    	<fmt:parseDate var="futureDate" value="<%= futureDateStr %>" pattern="yyyy-MM-dd" />
																			<fmt:formatDate value="${futureDate}" pattern="yyyy-MM-dd" />
																		</span>
																	</span>
																	<br>
																	<div display = "inline-block">
															  	    <input type = "button" id = "minus" onclick = "Qminus('${i}')" value = "-" class = "Qcal">
																    <input type = "text" id = "buy_quantity" value = "1"  size = 1 maxlength = 2 name="buy_quantity_${i}">
																    <input type = "button" id = "plus" onclick = "Qplus('${i}')" value = "+" class = "Qcal">
															    	</div>
															    	<br><br><br>
																    <div class="room_reserve_btn_area">	    
																    <span class="price_span">${row.prd_price}/박</span>&nbsp;&nbsp;&nbsp;
																	   	<button class="room_reserve_btn">
																		    <div class="btnTitle" onclick="location.href='hotel_checkout?prd_id=${row.prd_id}'" style="cursor: pointer">
																		    	<span class="BtnSpan">예약하기</span>
																		    </div>
																	    </button>
																    </div>
															    </div>
														    </div>
													    </div>
												    </div>
											    </div>
										    </div>
										</div>
										<input type = "hidden" id = "prd_id" value = "${row.prd_id}">
										<input type = "hidden" id = "prd_img" value = "${row.prd_img}">
										<input type = "hidden" id = "prd_price" value = "${row.prd_price}">
										<input type = "hidden" id = "prd_opt" value = "${row.prd_opt}">
										<input type = "hidden" id = "member_id" value = "${member.member_id}">
									</c:when>

					<%-- 검색결과가 없을 떄 --%>
					<c:when test="${map.count == 0}">
                       		 검색결과가 없습니다.
                     </c:when>
				</c:choose>
				</c:forEach>
			</div>

		</div>
	</div>
	</div>


	<!-- 하단 페이지 표시 부분 -->
	<div class="pagination c-pagination">
		<ul class="pagination">

			<c:if test="${map.pager.curBlock > 1}">
				<li class="pagination-first page-item disabled">
				<a href="hotel_list?curPage=1&&searchOption1=CITY_NO&city_no=${city_no}&searchOption2=PRD_OPT&prd_opt=${prd_opt}">처음</a></li>
			</c:if>

			<c:if test="${map.pager.curBlock > 1}">
				<li class="pagination-prev page-item disabled"><a
					href="hotel_list?curPage=${map.pager.prevPage}&searchOption1=CITY_NO&city_no=${city_no}&searchOption2=PRD_OPT&prd_opt=${prd_opt}">이전</a></li>
			</c:if>
			<c:forEach var="num" begin="${map.pager.blockBegin}"
				end="${map.pager.blockEnd}">
				<c:choose>
					<c:when test="${num == map.pager.curPage}">
						<li class="pagination-page page-item active">
						<span class="page-link">${num}</span>
					</c:when>
					<c:otherwise>
						<li class="pagination-page page-item">
						<a href="hotel_list?curPage=${num}&searchOption1=CITY_NO&city_no=${city_no}&searchOption2=PRD_OPT&prd_opt=${prd_opt}"class="page-link">${num}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${map.pager.curBlock < map.pager.totBlock}">
				<li class="pagination-next page-item">
				<a href="hotel_list?curPage=${map.pager.nextPage}&searchOption1=CITY_NO&city_no=${city_no}&searchOption2=PRD_OPT&prd_opt=${prd_opt}"class="page-link">다음</a></li>
			</c:if>
			<c:if
				test="${(map.pager.totPage > 5) && (map.pager.totPage != map.pager.curPage)}">
				<li class="pagination-last page-item">
				<a href="hotel_list?curPage=${map.pager.totPage}&searchOption1=CITY_NO&city_no=${city_no}&searchOption2=PRD_OPT&prd_opt=${prd_opt}">맨끝</a></li>
			</c:if>
		</ul>
	</div>
	</div>
	</div>
	<!--footer-->
	<%@ include file="../include/footer.jsp"%>
</body>

</html>