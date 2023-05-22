 function admin_login() {
		var member_id = $("#member_id").val();
		var member_pwd = $("#member_pwd").val();	
		
		if(!$("#member_id").val()) {//아이디를 입력하지 않으면 수행
			swal("", "아이디를 입력하세요", "warning"); 
			 $("#member_id").focus();
			 return false;
		}
				    
		else if(!$("#member_pwd").val()) {//비밀번호를 입력하지 않으면 수행
			swal("", "비밀번호를 입력하세요", "warning"); 
			$("#member_pwd").focus();
			return false;
			
		} else { //아이디 비밀번호 전부 입력
			$.ajax({
				type : "POST",
				url : "checkMember",
				data : {
					"member_id" : member_id,
					"member_pwd" : member_pwd
				},
				success: function(data) {
				    if (data != 0) {
				        $.ajax({
				            type : "POST",
				            url : "admin_login",
				            data : {
				                "member_id" : member_id,
				                "member_pwd" : member_pwd,
				            },
				            success: function(data) {
				                if (data != 0) 
				                        window.location.href = "./admin_main"; // 로그인 성공
				                else {
				                        swal("","권한이 없습니다.","error"); // 권한 없음 에러 메시지 출력
				                }
				            },
				            error : function(data) {
				                swal("","시스템에 문제가 발생했습니다","error");
				                console.log(data);
				            }
				        });
				    } else {
				        swal("","아이디 혹은 패스워드를 확인해주세요.","warning")
				    }
				}

			});
		}
 }