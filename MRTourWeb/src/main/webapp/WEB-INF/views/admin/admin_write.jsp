<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="resources/css/admin_css/admin_write.css">
    <title>MRT Admin</title>
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
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
							location.href='admin_notice';
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

<body>
    <div class="container right-panel-active">
        <!-- Sign Up -->
        <div class="container__form container--signup">
            <form action="#" class="form" id="form1">
                <div class="board_wrap">
                    <div class="board_title">
                                <strong>공지사항</strong>
                            </div>
                            <div class="board_write_wrap">
                                <div class="notice_write">
                                	<input type="hidden" name="member_name" id="member_name" value="${member.member_name}"/>
                                	<div class="subject">
				                        <select id="notice_sub" style = "width : 150px">
											<option value="" selected>::선택::</option>
											<option value="일반">일반</option>
											<option value="안전정보">안전정보</option>
											<option value="시스템">시스템</option>
										</select>
                                    </div>
                                    <div class="title">
                                        <dl >
                                            <dd><input type="text" style = "width : 500px" name = "notice_title" id = "notice_title" placeholder="제목 입력"></dd>
                                        </dl>
                                    </div>
                                    <div class="cont">
                                        <textarea name = "notice_content" id = "notice_content" cols = "88" rows = "20" placeholder="내용 입력"></textarea>
                                    </div>
                                </div>
                                <div class="bt_wrap">
                                    <input type = "button" class = "on" value = "등록" onclick = "createNotice()">
                                    <a href="notice">취소/목록으로 가기</a>
                                </div>
                            </div>
                        </div>
            </form>
        </div>


        <!-- Overlay -->
        <div class="container__overlay">
            <div class="overlay">
                <div class="overlay__panel overlay--left">
                    <p style="font-size: 80px; color:#fff; text-shadow:0px 0px 50px #a1e4ff">
                        <a href="admin_main"><b>MIRAE<br>TOUR</b></a></p>
            </div>
        </div>
    </div>

</body>

</html>