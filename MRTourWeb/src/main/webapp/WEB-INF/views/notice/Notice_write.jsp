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
		function createNotice() {
			var notice_sub=$("#notice_sub").val();
			var notice_title=$("#notice_title").val();
			var member_name=$("#member_name").val();
			var notice_content=$("#notice_content").val();		
			var titleLength=notice_title.length;
			
			if(!notice_sub) {
				swal("", "말머리를 선택하세요", "error");
			} else if(!notice_title) {
				swal("", "제목을 입력하세요.", "error");
			} else if(titleLength>50) {
				swal("", "제목이 너무 깁니다.", "error");
			} else if(!notice_content){ 
				 swal("", "글내용을 입력해 주세요!!.", "error");
				 return false; 
				 
			} else {
				$.ajax({
						type : "POST",
						url : "createNotice",
						data : {
							"notice_title" : notice_title,
							"member_name" : member_name,
							"notice_sub" : notice_sub,
							"notice_content" : notice_content
							}, success : function(data) {
								location.href='notice';
						}
					});
				}
			 }
		
		// 키보드로 글자수 입력 받았을 때 글자카운트 스크립트
		$(document).ready(function(){
		
			$('#notice_title').keyup(function(){
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
				 <li class="selected" style="width: 24.9%;"><a href="notice">공지사항</a></li>
				 <li class="disselected" style="width: 24.9%;"><a href="board">1:1문의</a></li>
				 <li class="disselected" style="width: 24.9%;"><a href="FAQ">FAQ(자주하는 질문)</a></li>
			 </ul>
		 </div>
		<br/><br/>
		<form action = "#" method="post"  id="form1">
			<div class="tbl">
				<!-- 수정,삭제에 필요한 글번호를 hidden 태그에 저장 -->
				<table border="1" bordercolor="#E1DCDC"class="type1" cellpadding="0" cellspacing="0" width="100%">
				<input type="hidden" name="member_name" id="member_name" value="관리자"/>
					<tr>
						<td width="70">구분</td>
						<td width="120" align="left">
			                <div class="subject">
								<select id="notice_sub" style = "width : 120px">
									<option value="" selected>::선택::</option>
									<option value="일반">일반</option>
									<option value="안전정보">안전정보</option>
									<option value="시스템">시스템</option>
								</select>
			                </div>
						</td>
		
						<td align="left" colspan = "4"></td> <!-- 공백 -->
					</tr>
						
					<tr>
						<td>제목</td>
						<td colspan = "5" align="left">
							<input type="text" style = "width : 500px" name = "notice_title" id = "notice_title" placeholder="제목 입력">
						</td>
					</tr>
					
					<tr valign="top">
						<td colspan='6' height="500px">
							<textarea name = "notice_content" id = "notice_content" cols = "100%" rows = "30" placeholder="내용 입력"></textarea>
						</td>
					</tr>
				</table>
			</div>
			<div style="margin-top: 10px; margin-bottom:20px;">
				<input type = "button" id="list_btn" value = "등록" onclick = "createNotice()">
				<button type = "button" id="list_btn" onClick = "location.href='Notice_board'">취소/목록</button>
			</div>
		</form>
	</div>
</center>
</body>
</html>