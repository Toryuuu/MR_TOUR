<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<style scoped>
@import "resources/css/header.css";
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap"
	rel="stylesheet">
	
	<script src="resources/js/login.js" charset="UTF-8"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src = "http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>		
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
<script>
	// 마이페이지 클릭 이벤트
	function mypBtn() {
    var member_id = $("#member_id").val();
    var myp = $("#myp").val();

    // myp 값이 undefined일 경우 기본값으로 1 설정
    if (typeof myp === "undefined") {
        myp = 1;
    }

    $.ajax({
        type: "GET",
        url: "mypL",
        data: {
            "member_id": member_id,
            "myp": myp
        },
        success: function (data) {
        	  window.location.href = 'productCart?member_id=${member.member_id}#li-for-panel-2';
        }
    });
}


</script>
<header>
<div class="login">
	<div class="logint">
		<p>
			<c:choose>
				<c:when test="${member.member_id eq 'admin'}"><!-- 관리자로 로그인했을 때 -->
					<input type="hidden" id="member_id" value="${member.member_id}" />
					<a href="#" onclick="logout()"><b>로그아웃</a>

					<a href="admin_main"><b>관리페이지</a>
				</c:when>

				<c:when test="${member.member_id == null}"><!-- 로그인하지 않았을 때 -->
					<a href="login"><b>로그인</a>

					<a href="signup"><b>회원가입</a>

					<a href="board"><b>고객센터</a>
				</c:when>

				<c:otherwise>
					<input type="hidden" id="member_id" 
						value="${member.member_id}" /><!-- 회원으로 로그인했을 때 -->
					<a href="#" onclick="logout()"><b>로그아웃</a> 
						| 
						<a href="board"><b>고객센터</a>
				</c:otherwise>
			</c:choose>
		</p>
	</div>
</div>
<br>

<div class="login2">
	<p>
		<c:choose>
			<c:when test="${member.member_id eq 'admin' || member.member_id == null}"><!-- 관리자로 로그인했을 때 -->
				
			</c:when>
			<c:otherwise>
				<a onclick="mypBtn();"><img src="resources/images/menu.JPG" alt=""   border="0"  height="50px" style="float: right; padding-top: 8px; padding-right: 40px; cursor : pointer" ></a>
				<a href="productCart?member_id=${member.member_id}"><img src="resources/images/jjim.JPG" alt="" onclick="clickBtn();" border="0"  height="50px" style="float: right; padding-top: 7px; padding-right: 10px;"></a>
			</c:otherwise>
		</c:choose>
	</p>
</div>



<div class="logo">
	<a href="main"><img src="resources/images/logo.jpg" alt="" onclick="clickBtn();"  border="0" width="350px"></a>
</div>


<!-- category -->

<div class="nav">
	<div class="nav1">
		<ul>
			<li><a href="car_page"><b>렌트카 </a></li>
			<li><a href="hotel_list""><b>호텔 </a></li>
			<li><a href="ticket_main"><b> 투어 | 입장권</a></li>
			<li><a href="golf"><b> 골프 </a></li>
			<li><a href="notice"><b> 미래LIVE </a></li>
			<li><a href="FAQ"><b> FAQ</a></li>
		</ul>
	</div>
</div>
</header>
</div>