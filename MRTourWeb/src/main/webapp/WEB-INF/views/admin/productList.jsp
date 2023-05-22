<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
		<title>MRT Admin</title>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="resources/js/product.js" charset="UTF-8"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  	<link rel="stylesheet" type="text/css" href="resources/css/admin_css/admin_notice.css"> 
		
		<script>
			function list(page) {
				location.href="productList?curPage="+page;
			}
		</script>
	</head>
	<body>
	    <div class="container right-panel-active">
		 <div class="container__form container--signup">
		<section>
			
			<button type="button" class="btn" onclick="location.href='admin_main'">관리자 메인 페이지</button>
			<button type="button" class="btn" onclick="location.href='admin_insertProduct'">상품 등록 페이지</button>
			<button type="button" class="btn" onclick="location.href='./main'">메인 페이지</button>
			
			<form name="f3rm" id="f3rm" enctype="multipart/form-data">
			<div class="board_wrap">
			<br><br><br>
			    <div class="board_title">
                        <strong>등록한 상품 보기</strong>
               </div>
               <br><br><br>
			   <div class="board_list_wrap">
                  <div class="board_list">
                     <div class="top">
				<table>
					<thead>
						<th>카테고리</th>
						<th>상품명</th>
						<th>상품 코드</th>
						<th>가격</th>
						<th>옵션</th>
						<th>지역</th>
						<th>상품설명(썸네일 화면)</th>
					</thead>
					<c:forEach begin="0" end="${(fn:length(map.list))}" var="i">
						<c:set var="product" value="${map.list[i]}" />
						
						
						<c:if test="${not empty product}">
							<tr>
								<td>${product.cate_id}</td>
								<td>${product.prd_name}</td>
								<td>${product.prd_id}</td>
								<td>${product.prd_price}</td>
								<td>${product.prd_opt}</td>
								<td>${product.city_no}</td>
								<td width = "300px" align = "center">${product.prd_exp}</td>
							</tr>
						</c:if>
					</c:forEach>
				<tr>
					<td colspan="7" align="center">
						<c:if test="${map.pager.curBlock > 1}">
							<a href="#" onclick="list('1')">[처음]</a>
						</c:if>
						<c:if test="${map.pager.curBlock > 1}">
							<a href="#" onclick="list('${map.pager.prevPage}')">[이전]</a>
						</c:if>
						<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
							<c:choose>
								<c:when test="${num == map.pager.curPage}">
									<span style="font-weight:bold;">${num}</span>
								</c:when>
								<c:otherwise>
									<a href="#" onclick="list('${num}')">${num}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${map.pager.curBlock < map.pager.totBlock}">
							<a href="#" onclick="list('${map.pager.nextPage}')">[다음]</a>
						</c:if>
						<c:if test="${map.pager.curBlock < map.pager.totPage}">
							<a href="#" onclick="list('${map.pager.totPage}')">[끝]</a>
						</c:if>
					</td>
				</tr>
				</div>
				</div>
				</div>
			</table>
		</form>
		</section>
		</div>
		</div>
	</body>
</html>