<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="resources/css/view.css?">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
function updateB() {
	var board_no=$("#board_no").val();
	var b_title=$("#b_title").val();
	var b_content=$("#b_content").val();
	var titleLength=title.length;
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
		swal({
			 icon: "warning",
			 text: "정말 수정 하시겠습니까?",
			 closeOnClickOutside : false,
			 closeOnEsc : false, 
			 buttons: ["돌아가기", "수정 완료!"],
			}).then(function(isConfirm) {
			  if (isConfirm) {
			    swal('수정 완료!','게시글 수정했습니다','success').then(function(isConfirm)
			    	{
			    		$.ajax({
							type : "POST",
							url : "updateBoard",
							data : {
								"board_no" : board_no,
								"b_title" : b_title,
								"b_content" : b_content
						}, success : function(data) {
							location.href="view?board_no="+board_no+"&show=Y";
						}
					});
			    	});
			  }
			})
	}
}

//키보드로 글자수 입력 받았을 때 글자카운트 스크립트
$(document).ready(function(){
	/* 키보드 이벤트 활용 */
	$('#b_title').keyup(function(){
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
<script src="resources/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>${board.title}</title>
</head>
<body>
	<!-- header -->
	<%@ include file="../include/header.jsp"%>
	
<center>
	<div style="width:800px;">
		<div style="float:right;">
		</div>
		<br/><br/>
<form>
	<div class="tbl">
		<!-- 수정,삭제에 필요한 글번호를 hidden 태그에 저장 -->
		<input type="hidden" name="board_no" id="board_no" value="${board.board_no}"/>
		<table border="1" bordercolor="#E1DCDC" class="view" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td width="70">제목</td>
				<td colspan='3' align="left">
					<input type="text" name="title" id="title" size="70%" maxlength="100" value="${board.b_title}" />
				</td>
			</tr>
				
			<tr>
			<td>작성자</td>
			<td colspan='3' align="left">${board.b_name}</td>
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
			<td colspan='4' height="500px">
				<textarea name="content" id="content" cols="88" rows="80">${board.b_content}</textarea>
			</td>
			</tr>
		</table>
	</div>
	</form>
		<br/><br/>
		<input id="list_btn" type="button" value="저장" onclick="updateB()" />
	</form>
		<button id="list_btn" style="float:right;" onclick="location.href='board'">취소/목록</button>
	</div>
</center>
</body>
</html>