<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
		@import "resources/css/Notice_board.css";
	</style>
	<script>
		// 게시물 삭제 확인
		function deleteB() {
			swal({
				 icon: "warning",
				 text: "정말 게시글을 삭제하시겠습니까?",
				 closeOnClickOutside : false,
				 closeOnEsc : false, 
				 buttons: ["돌아가기", "삭제하기"],
				}).then(function(isConfirm) {
				  if (isConfirm) {
				    swal('삭제 완료!','게시글을 삭제했습니다.','success').then(function(isConfirm)
				   		{
							location.href='delete?board_no='+${board.board_no};
				    	});
				  }
				})
		}
		
		$("#list_btn").click(function(){
			self.location="board?"
					+ "searchOption=${searchOption}&keyword=${keyword}"
					+ "&search=${search}&curPage=${curPage}";
		});
	</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<title>${board.b_title}</title>
</head>
<body>
	<!-- header -->
	<%@ include file="../include/header.jsp"%>
	<!-- 관리자 또는 작성자만 내용 확인 -->
	<c:choose>
	<c:when test="${member.member_id  == board.member_id || member.member_id  eq 'admin'}">
<center>
	<div id="contents" class="contents">
		<div class="js_tabs type1">
			 <ul class="tabs" style = "width:100%">
				 <li class="disselected" style="width: 24.9%;"><a href="notice">공지사항</a></li>
				 <li class="selected" style="width: 24.9%;"><a href="board">1:1문의</a></li>
				 <li class="disselected" style="width: 24.9%;"><a href="FAQ">FAQ(자주하는 질문)</a></li>
			 </ul>
		 </div>
		<br/><br/>
		
		<!-- 본인만 수정 가능 -->
			<div style="float: right;">
				<c:if test="${member.member_id == board.member_id && board.b_comments eq '기본'}">
					<button type="button" id="list_btn" class="text"><a href="updateWrite">수정</a></button>
				</c:if>
				<c:if test="${member.member_id == board.member_id && board.b_comments != '기본'}">
					<span>관리자의 답변이 등록된 문의는 수정할 수 없습니다.</span>
				</c:if>
				<c:if test="${member.member_id eq 'admin'}">
					<button type="button" width = "50px" id="list_btn" class="text"><a href="updateWrite">답변 등록</a></button>
				</c:if>
			</div>
			
	<form>
	<div class="tbl">
		<!-- 수정,삭제에 필요한 글번호를 hidden 태그에 저장 -->
		<input type="hidden" name="board_no" value="${board.board_no}">
		<table border="1" bordercolor="#E1DCDC" class="view" cellpadding="0" cellspacing="0" width="100%">
			<tr>
			<td width="70">제목</td>
			<td colspan='3' align="left">${board.b_title}</td>
			</tr>
				
			<tr>
			<td>작성자</td>
			<td colspan='3' align="left">${board.member_name}</td>
			</tr>
				
			<tr>
			<td>작성일</td>
			<td colspan='3' align="left">
			<div style="width:150px;float:left;">
			${board.b_writedate}  
			</div>
			<div>
			|&nbsp;&nbsp;&nbsp;조회수 : ${board.b_viewcnt}
			</div>
			</td>
			</tr>
				
			<tr valign="top">
			<td colspan='4' height="500px">${board.b_content}</td>
			</tr>
		</table>	
		<br>
		<table border="1" bordercolor="#E1DCDC" class="view" cellpadding="0" cellspacing="0" width="100%" height = "100px">
			<tr>
				<td align="left">관리자 답변</td>
				<c:choose>
				<c:when test = "${board.b_comments eq '기본'}">
					<td colspan = "3" align="left" style = "color:darkgray">[답변예정]1~2일이 소요될 수 있으니 양해 부탁드립니다.</td>
				</c:when>
				<c:otherwise>
					<td colspan = "3" align="left">${board.b_comments}</td>
				</c:otherwise>
				</c:choose>
			</tr>
		</table>
	</div>
	</form>
	<div style="margin-top: 10px; margin-bottom:20px;">
		<div align="center" style="float:left; ">
				<c:if test="${map.previousB != null}">
				<button class="previous" onClick="location.href='view?bno=${map.previousB.board_no}&show=Y'">이전글</button>
				</c:if>
				<c:if test="${map.nextB != null}">
				<button class="next" onClick="location.href='view?bno=${map.nextB.board_no}&show=Y'">다음글</button>
				</c:if>
				&nbsp;&nbsp;&nbsp;게시글 번호 : ${board.board_no}
			</div>
	
			<div style="float:right;">
			
				<!-- 본인, 관리자만 삭제 버튼 표시 -->
				<c:if test="${member.member_id != board.member_id}">
					<a href="#" id="list_btn"onClick="deleteB()">삭제</a>&nbsp;&nbsp;&nbsp;
				</c:if>
			
				<button type="button" id="list_btn" onClick="location.href='board'">목록</button>
			</div>
		</div>
	</div>
	</center>
	</c:when>
	<c:otherwise>
		<table border="1" bordercolor="#E1DCDC" class="view" cellpadding="0" cellspacing="0" width="100%" height = "600px">
			<tr>
			<td align="center">"작성자만 조회할 수 있는 화면입니다"</td>
			</tr>
		</table>	
	</c:otherwise>
</c:choose>
</body>
</html>