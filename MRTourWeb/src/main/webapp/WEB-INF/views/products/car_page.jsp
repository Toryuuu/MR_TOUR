<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <link rel="stylesheet" type="text/css" href="resources/css/car_page.css" />
   <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <script src="http://code.jquery.com/jquery-latest.js"></script>
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
         
   <title>미래투어 렌트카</title>
   
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
          window.location.href = "car_page?city_no=" + city_no_search + "&prd_opt=" + prd_opt_search;
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

                     <form method="get" action="car_page" class="carsearch">
                        <div class="search-area-form same-area">
                           <div class="form-column">
                              <p class="title">인수도시</p>
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
                           
                           </div>


                           <div class="form-column">
                              <p class="title">차량옵션</p>
                              <p class="text">
                              <input type = "hidden" name = "searchOption2" value = "PRD_OPT">
                                 <select name="prd_opt" id="prd_opt" onchange="ChangeSearch()">
                                    <option value="전체">전체</option>
                                    <option value="디젤">디젤</option>
                                    <option value="가솔린">가솔린</option>
                                    
                                 </select> <input type="hidden" id="prd_opt_search" name = "prd_opt" value="${prd_opt}">
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
         

					
            <!--검색창 바로 아래-->
            <app-rent-breadcrumbs class="breadcrumbs" _nghost-serverapp-c364="">
               <div class="text-article">
               <c:choose>
                  <c:when test="${row.city_no} != null">
                  <p class="text">
                     <strong>${row.city_no}</strong>에서 이용할 렌터카를 선택해 주세요.
                  </p>
                  </c:when>
                  <c:otherwise> <!-- 디폴트값 -->
                  <p class="text">
                    	 이용할 렌터카를 선택해 주세요.
                  </p>
                  </c:otherwise>
               </c:choose>
               </div>

               <!-- 오른쪽 상품선택, 결제하기 부분 -->
               <ul class="step">
                  <li class="active">
                     <p class="num">1</p>
                     <p class="text">상품선택</p>
                  </li>
                  <li>
                     <p class="num">2</p>
                     <p class="text">결제하기</p>
                  </li>
               </ul>
            </app-rent-breadcrumbs>
               
         <!-- 상품 위 검색 결과 섹션 -->
			<div class="search-result-header">
				<p class="total">
					<span>${map.count}</span> 개의 상품이 검색되었습니다.
				</p>
			</div>
					
            <!-- 상품 리스트 -->
				<div class="products">
					<div class="product-list">
					
					<input type="hidden" name="member_id" id="member_id" value="${member.member_id}" />
					
					<c:forEach begin="0" end="${(fn:length(map.list))}" var="i">
					<c:set var="row" value="${map.list[i]}" />
					<c:choose>
					<%-- 검색결과가 있을 때 --%>
					<c:when test="${not empty row}">
									
						<a  class="product">
						<br><br><br>
							<img src="${row.prd_img}" width="275" height="175px" style = "padding-top : 10px;padding-bottom : 15px">
							<div class="product-name" style="padding:5px; font-size : 25px">
								${row.prd_name}
							</div>
							<input type="hidden" name="prd_id" id="prd_id" value="${row.prd_id}" />
							<br>
							<div class="product-option" style=" padding:5px;">
								${row.prd_opt}
							</div>
							<br>
							<div class="product-price" style="padding:5px;">
								가격(2시간) : ${row.prd_price}
							</div>
							<br>
							<div class="product-button" style="padding:5px;">
								<input type = "hidden" id="city_no" value = "${row.city_no}">
								<button type = "button" id="product" onclick="location.href='car_checkout?prd_id=${row.prd_id}'" style="cursor: pointer">선택</button>
							</div>
						</a>
						</c:when>
						<%-- 검색결과가 없을 떄 --%>
						<c:when test="${map.count == 0}">
							검색결과가 없습니다.
						</c:when>
						</c:choose>
						</c:forEach>

						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>

		<!-- 하단 페이지 표시 부분 -->
<div class="pagination c-pagination">
	<ul class="pagination">
	
	<c:if test="${map.pager.curBlock > 1}">
		<li class="pagination-first page-item disabled">
			<a href="car_page?curPage=1&searchOption1=CITY_NO&city_no=${city_no}&searchOption2=PRD_OPT&prd_opt=${prd_opt}">처음</a>
		</li>
	</c:if>
	
	<c:if test="${map.pager.curBlock > 1}">
		<li class="pagination-prev page-item disabled">
			<a href="car_page?curPage=${map.pager.prevPage}&searchOption1=CITY_NO&city_no=${city_no}&searchOption2=PRD_OPT&prd_opt=${prd_opt}">이전</a>
		</li>
	</c:if>
	<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
		<c:choose>
			<c:when test="${num == map.pager.curPage}">
				<li class="pagination-page page-item active">
					<span class="page-link">${num}</span>
				</li>
			</c:when>
			<c:otherwise>
				<li class="pagination-page page-item">
					<a href="car_page?curPage=${num}&searchOption1=CITY_NO&city_no=${city_no}&searchOption2=PRD_OPT&prd_opt=${prd_opt}" class="page-link">${num}</a>
				</li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${map.pager.curBlock < map.pager.totBlock}">
		<li class="pagination-next page-item">
			<a href="car_page?curPage=${map.pager.nextPage}&searchOption1=CITY_NO&city_no=${city_no}&searchOption2=PRD_OPT&prd_opt=${prd_opt}" class="page-link">다음</a>
		</li>
	</c:if>
	<c:if test="${(map.pager.totPage > 5) && (map.pager.totPage != map.pager.curPage)}">
		<li class="pagination-last page-item">
			<a href="car_page?curPage=${map.pager.totPage}&searchOption1=CITY_NO&city_no=${city_no}&searchOption2=PRD_OPT&prd_opt=${prd_opt}">맨끝</a>
		</li>
	</c:if>
	</ul>
	
	</div>
	</div>
	</app-rent-tab-body>
	</div>





<section id="footer">
      <div class="ft">
         <div class="foo_div">
            <ul>
               <li><a href = "Intro" style = "text-decoration : none; color: #808080;">회사소개</a></li>
               <li>이용약관</li>
               <li>개인정보처리방침</li>
               <li>여행약관</li>
               <li>해외여행자보험</li>
               <li>마케팅제휴</li>
               <li>공식인증예약센터 검색</li>
            </ul>

            <ul>
               <li><p style="color: #333;">(주)미래투어</p></li>
               <li>대표 : 김XX</li>
               <li>주소 : 서울시 성동구 왕십리로 315</li>
            </ul>

            <ul>
               <li>사업자등록번호 : 000-00-00000</li>
               <li>사업자정보확인</li>
               <li>통신판매업신고번호 : 서울00-0000호</li>
               <li>관광사업자 등록번호 : 제0000-000000호</li>
            </ul>

            <ul>
               <li>개인정보 보호책임자 : 김XX</li>
               <li>영업보증보험: 22억 2천만원 가입</li>
               <li>팩스:00-000-0000</li>
               <li>이메일 : 00000@MRTOUR.com</li>
            </ul>
         </div>
         <div class="fott">
            <ul>   
               <li>고객센터</li>
               <li>0000-0000</li>
               <li>국내항공권문의</li>
               <li>0000-0000</li>
            </ul>
         </div>

         <div class="foot">
            <ul>
               <li>※ 부득이한 사정에 의해 여행일정이 변경되는 경우 사전 동의를 받습니다.</li>
               <li>※ 미래투어는 개별 항공권, 단품 및 일부 여행상품에 대하여 통신판매중개자로서 통신판매의 당사자가 아니며
                  해당상품의 거래정보 밑 거래등에 대해 책임을 지지 않습니다.</li>
            </ul>
         </div>

         <div class="fooot">
            <ul>
               <li>COPYRIGHTⓒ MIRAETOUR SERVICE INC.ALL RIGHTS RESERVED</li>
            </ul>
         </div>
      </div>
   </section>

</body>

</html>