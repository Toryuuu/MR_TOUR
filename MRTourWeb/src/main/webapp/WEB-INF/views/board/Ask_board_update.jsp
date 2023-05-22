<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
	<style>
		@import "resources/css/Notice_board.css";
	</style>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<script>
		function updateB() {
			var board_no = $("#board_no").val();
			var b_title = $("#b_title").val();
			var b_content = $("#b_content").val();
			var b_comments = $("#b_comments").val();
			var titleLength = b_title.length;
			if(!b_title) {
				swal("error", "제목을 입력하세요.", "error");
			} else if(titleLength>50) {
				swal("", "제목이 너무 깁니다.", "error");
			} 
			else if(b_content == ""){ 
				 swal("error", "글내용을 입력해 주세요!!.", "error");
				 return false; 
			} 
			else {
				$.ajax({
						type : "POST",
						url : "updateBoard",
						data : {
							"board_no" : board_no,
							"b_title" : b_title,
							"b_content" : b_content,
							"b_comments" : b_comments
					}, success : function(data) {
						location.href="board";
					}
				});
		  }
		}
	</script>
	<title>1:1문의</title>
</head>
<body>
	<!-- header -->
	<%@ include file="../include/header.jsp"%>
<center>
	<div id="contents" class="contents">
		<div class="js_tabs type1">
			 <ul class="tabs" style = "width:100%">
				 <li class="disselected" style = "width: 24.9%;"><a href="notice">공지사항</a></li>
				 <li class="selected" style = "width: 24.9%;"><a href="board">1:1문의</a></li>
				 <li class="disselected" style="width: 24.9%;"><a href="FAQ">FAQ(자주하는 질문)</a></li>
			 </ul>
		 </div>
		<br/><br/>
		<form id="form1">
			<div class="tbl">
				<!-- 수정,삭제에 필요한 글번호를 hidden 태그에 저장 -->
				<input type="hidden" name="board_no" id="board_no" value="${board.board_no}"/>
				
				<!-- 작성자 수정화면 -->
				<c:if test="${member.member_id == board.member_id}">
				<table border="1" bordercolor="#E1DCDC" class="type1" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>제목</td>
						<td colspan = "5" align="left">
							<input type="text" style = "width : 500px" name = "b_title" id = "b_title" value="${board.b_title}">
						</td>
					</tr>
					
					<tr valign="top">
						<td colspan='6' height="500px">
							<textarea name = "b_content" id = "b_content" cols = "100%" rows = "30">${board.b_content}</textarea>
						</td>
					</tr>
				</table>
				</c:if>
				
				<!-- 관리자 수정화면 - 답변작성칸만 활성화 -->
				<c:if test="${member.member_id eq 'admin'}">
				<table border="1" bordercolor="#E1DCDC" class="type1" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>제목</td>
						<td colspan = "5" align="left">
							<input type="text" style = "width : 500px" name = "b_title" id = "b_title" value="${board.b_title}" readonly>
						</td>
					</tr>
					
					<tr valign="top">
						<td colspan='6' height="500px">
							<textarea name = "b_content" id = "b_content" cols = "100%" rows = "30" readonly>${board.b_content}</textarea>
						</td>
					</tr>
				</table>
				<br>
					<table border="1" bordercolor="#E1DCDC" class="view" cellpadding="0" cellspacing="0" width="100%" height = "100px">
						<tr>
							<td align="left">관리자 답변</td>
							<td colspan = "5" align="left">
								<input type="text" width = "100%" name = "b_comments" id = "b_comments" value="${board.b_comments}">
							</td>
						</tr>
					</table>
				</c:if>
				<!-- 여기까지 관리자 보는 화면 -->
			</div>
				<input type = "button" id="list_btn" value="수정" onclick = "updateB()" />
				<button type="button" id="list_btn" onclick="location.href='board'">취소/목록</button>
		</form>
	</div>
</center>
</body>
</html>