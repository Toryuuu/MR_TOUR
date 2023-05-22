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
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
		@import "resources/css/Notice_board.css";
	</style>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		function createB() {
			var b_title=$("#b_title").val();
			var b_content=$("#b_content").val();
			var member_name = $("#member_name").val();
			var member_id = $("#member_id").val();
			var titleLength=b_title.length;
			
			if(!b_title) {
				swal("", "제목을 입력하세요", "error");
			} else if(titleLength>200) {
				swal("", "제목이 너무 깁니다", "error");
			} else if(!b_content){ 
				 swal("", "문의내용을 입력해 주세요", "error");
				 return false; 
			} else {
				$.ajax({
						type : "POST",
						url : "createBoard",
						data : {
							"b_title" : b_title,
							"b_content" : b_content,
							"member_name" : member_name,
							"member_id" : member_id
						}, success : function(data) {
								location.href='board';
						}
				});
			}
		 }
			
		// 키보드로 글자수 입력 받았을 때 글자카운트 스크립트
		$(document).ready(function(){
	
			$('#title').keyup(function(){
				// 남은 글자수를 구한다.
				var titleLength = $(this).val().length; //현재 글자수
				var remain = 50 - titleLength;
				
				// 문서 객체에 남은 글자수 표시
				$('#titleCount').html(remain);
				
				if(remain>=0){
				      $('#titleCount').css('color', 'green');
				}else{
				      $('#titleCount').css('color', 'red');
				}
				
				if(remain<0) {
					swal("", "제목은 한글기준 50자 까지만 쓸 수 있습니다.", "warning");
				}
			})
		})
	</script>

<title>공지사항</title>
</head>
<body>
	<!-- header -->
	<%@ include file="../include/header.jsp"%>
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
		<form action = "#" method="post"  id="form1">
			<div class="tbl">
				<!-- 수정,삭제에 필요한 글번호를 hidden 태그에 저장 -->
				<table border="1" bordercolor="#E1DCDC" class="type1" cellpadding="0" cellspacing="0" width="100%">
					<!-- member테이블의 값을 가져옴 -->
				 	<c:if test="${member.member_id != null && member.member_name != null}">
						<input type="hidden" name="member_id" id="member_id" value="${member.member_id}"/>
						<input type="hidden" name="member_name" id="member_name" value="${member.member_name}" />
					</c:if>
					<tr>
						<td>제목</td>
						<td colspan = "5" align="left">
							<input type="text" style = "width : 500px" name = "b_title" id = "b_title" placeholder="제목 입력">
						</td>
					</tr>
					
					<tr valign="top">
						<td colspan='6' height="500px">
							<textarea name = "b_content" id = "b_content" cols = "100%" rows = "30" placeholder="내용 입력"></textarea>
						</td>
					</tr>
				</table>
			</div>
			<div style="margin-top: 10px; margin-bottom:20px;">
				<input type = "button" id="list_btn" value = "등록" onclick = "createB()">
				<button type="button" id="list_btn" onClick="location.href='board'">취소/목록</button>
			</div>
		</form>
	</div>
</center>
</body>
</html>