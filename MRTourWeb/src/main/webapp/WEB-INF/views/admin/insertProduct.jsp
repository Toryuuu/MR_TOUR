<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
		<title>미래투어 - 관리자 상품 등록 페이지</title>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
 		<script src="resources/js/product.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/admin_css/admin_notice.css"> 
		
	</head>
	<body>
		 <div class="container right-panel-active">
		 <div class="container__form container--signup">
		<button type="button" class="btn" onclick="location.href='productList'">상품관리</button>
		<section>
			<h2 align="center">상품 등록</h2>
			<form id="fileForm" action="insertProduct" method="POST" enctype="multipart/form-data">
			<div class="board_wrap" width = "300px">
				<table align="center" >
					<tr>
						<th>상품 유형</th>
						<td>
							<select name="cate_id" id="cate_id" style="width: 150px; height: 24px;">
								<option value="">::선택::</option>
								<option value="C001">렌트카</option>
								<option value="H002">호텔</option>
								<option value="T003">티켓</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>상품명</th>
						<td>
							<input type="text" name="prd_name" id="prd_name" />
						</td>
					</tr>
					<tr>
						<th>도시</th>
						<td>
							<select name="city_no" id="city_no" style="width: 150px; height: 24px;">
								<option value="">::선택::</option>
								<option value="서울">서울</option>
								<option value="강릉">강릉</option>
								<option value="여수">여수</option>
								<option value="경주">경주</option>
								<option value="부산">부산</option>
								<option value="제주">제주</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>상품 번호</th>
						<td>
							<input type="text" name="prd_id" id="prd_id" />
							<input type="button" value="중복 확인" onclick="prdCheckID()"><br/>
						</td>
					</tr>
					<tr>
						<th>상품 가격</th>
						<td>
							<input type="number" name="prd_price" id="prd_price" />
						</td>
					</tr>
					<tr>
						<th>상품 옵션</th>
						<td>							
						<select name="prd_opt" id="prd_opt" style="width: 150px; height: 24px;">
								<option value="" selected>::선택::</option>
								<option value="싱글룸">싱글룸</option>
								<option value="더블룸">더블룸</option>
								<option value="스위트룸">스위트룸</option>
								<option value="가솔린">가솔린</option>
								<option value="디젤">디젤</option>
							</select>	
						</td>
					</tr>
					<tr>
						<th>이미지</th>
						<td>
							<input type="file" name="uploadFile" id="uploadFile" />
						</td>
					</tr>
				     <tr>
				       <th>상품설명(썸네일용)</th>
				         <td>
				          <input type="text" name="prd_exp" id="prd_exp" />
				         </td>
				      </tr>
                     <tr>
                  <td colspan="2">
                  <input type = "button" id="button" value = "등록" onclick = "doInsertProduct()">         
                  </td>
               </tr>
				</table>
				</div>
			</form>
		</section>
		</div>
		</div>
	</body>
</html>