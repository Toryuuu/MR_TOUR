//ES6 Modules or TypeScript

//[중복확인]버튼을 클릭하면 자동실행
	//입력한 아이디 값을 갖고 confirmId.jsp페이지 실행
	
	function idChk(){
		var member_id = $("#member_id").val();
		if (!member_id) {
			 swal("", "아이디를 먼저 입력하세요", "warning"); 
			 $("#member_id").focus();
		} else if($("#member_id").val().includes('Admin') || $("#member_id").val().includes('admin')){//ID생성 시 Admin사용 불가(보안)
	    	swal("", "이 ID는 사용할 수 없습니다.", "error");
	    	 return false;
	    } else {
			$.ajax({
				type : "POST",
				url : "checkID",
				data : {
					"member_id" : member_id
				},
				success : function(data) {
					if (data == 0) {
						 swal("", "사용할 수 있는 아이디", "success");
					} else if (data != 0) {
						swal("이미 사용되는 아이디", "다른 아이디를 입력해주세요", "warning"); 
		    	    	$("#member_id").val("");
					} else { console.log('ERROR'); }
				}, error : function(error) { swal("", member_id, "error"); }
			});
		}
	}
	
//주소입력
    function searchPost() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('member_zipcode').value = data.zonecode;
                document.getElementById("member_faddr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("member_laddr").focus();
            }
        }).open();
    }
    
    
	//전체 선택 및 해제
		function check_all() {
		  // 전체 체크박스
		  const checkAll = document.getElementById("checkAll");

		  // 각 체크박스
		  const checkboxes = document.getElementsByName("chk");

		  // 전체 체크박스 체크되면
		  if (checkAll.checked) {
		    
			 // 각 체크박스 선택
		    for (let i = 0; i < checkboxes.length; i++) {
		      checkboxes[i].checked = true;
		    }
			 
		  } else {
		    // 모든 체크박스 선택 해제
		    for (let i = 0; i < checkboxes.length; i++) {
		      checkboxes[i].checked = false;
		    }
		  }
		}
		
		// 개별 체크박스 해제 시 전체박스 해제
		$(document).ready(function() {
		  var checkAll = document.getElementById("checkAll");
		  var checkboxes = document.getElementsByName("chk");

		  function onoffCheckItem() {
		    var allChecked = true;
		    for (var i = 0; i < checkboxes.length; i++) {
		      if (!checkboxes[i].checked) {
		        allChecked = false;
		        break;
		      }
		    }
		    checkAll.checked = allChecked;
		  }

		  for (var i = 0; i < checkboxes.length; i++) {
			  checkboxes[i].addEventListener('click', onoffCheckItem);
		  };
		});
		
		//메일입력칸 활성/비활성화
	$(document).ready(function() {		
		$("#email_select").change(function() {
			if ($("#email_select").val() == "1") {
				$("#email_addr").val("");
				$("#email_addr").prop("disabled", false);
			} else if ($("#email_select").val() == "") {
				$("#email_addr").val("");
				$("#email_addr").prop("disabled", true);
			} else {
				$("#email_addr").val($("#email_select").val());
				$("#email_addr").prop("disabled", true);
			}
		});
	})	
	
//회원가입 버튼 클릭 시 누락여부 체크
function Signup() {
    
    if(!$("#member_id").val()) {//아이디를 입력하지 않으면 수행
        swal("입력 누락", "아이디를 입력하세요", "warning"); 
        $("#member_id").focus();
        return false;
    }
    
    else if($("#member_id").val().includes('Admin') || $("#member_id").val().includes('admin')){//ID생성 시 Admin사용 불가(보안)
    	swal("", "이 ID는 사용할 수 없습니다.", "error");
    	 return false;
    }
    
    else if(!$("#member_pwd").val()) {//비밀번호를 입력하지 않으면 수행
    	swal("입력 누락", "비밀번호를 입력하세요", "warning"); 
        $("#member_pwd").focus();
        return false;
    }
    
    //비밀번호와 재입력비밀번호가 같지않으면 수행
    else if($("#member_pwd").val() != $("#member_pwd_chk").val()){
    	swal("비밀번호 오류", "비밀번호가 다릅니다. 다시 입력하세요", "error");
        $("#member_pwd_chk").focus();
        return false;
    }
    
    else if(!$("#member_name").val()) {//이름을 입력하지 않으면 수행
    	swal("입력 누락", "이름을 입력하세요", "warning");
    	 return false;
    }
    
    else if(!$("#birth_year").val()) {//년도 입력하지 않으면 수행
    	swal("선택 누락", "생일(년)도를 선택하세요", "warning");
        $("#birth_year").focus();
        return false;
    } else if(!$("#birth_month").val()) {//년도 입력하지 않으면 수행
    	swal("선택 누락", "생일(월)을 선택하세요", "warning");
        $("#birth_month").focus();
        return false;
    } else if(!$("#birth_day").val()) {//년도 입력하지 않으면 수행
    	swal("입력 누락", "생일(일)을 선택하세요", "warning");
        $("#birth_day").focus();
        return false;
    }
    
    else if(!$("#Numst").val()) {//전화번호를 입력하지 않으면 수행
    	swal("입력 누락", "전화번호를 입력하세요", "warning");
        $("#Numst").focus();
        return false;
    }   else if(!$("#Numnd").val()) {//전화번호를 입력하지 않으면 수행
    	swal("입력 누락", "전화번호를 전부 입력하세요", "warning");
        $("#Numnd").focus();
        return false;
    }     else if(!$("#Numrd").val()) {//전화번호를 입력하지 않으면 수행
    	swal("입력 누락", "전화번호를 전부 입력하세요", "warning");
        $("#Numrd").focus();
        return false;
    }
    
    else if(!$("#email_id").val()) {//이메일을 입력하지 않으면 수행
    	swal("입력 누락", "이메일을 입력하세요", "warning");
        $("#email_id").focus();
        return false;
    }   else if(!$("#email_select").val()) {//메일주소를 입력하지 않으면 수행
    	swal("선택 누락", "메일 주소를 선택하세요", "warning");
        $("#email_select").focus();
        return false;
    }
    
    else if(!$("#member_faddr").val()) {//주소를 입력하지 않으면 수행
    	swal("입력 누락", "주소를 입력하세요", "warning");
        $("#member_faddr").focus();
        return false;
    } else if(!$("#member_laddr").val()) {//주소를 입력하지 않으면 수행
    	swal("입력 누락", "상세주소를 입력하세요", "warning");
        $("#member_laddr").focus();
        return false;
        
    } else if (!checkAll.checked) { //모든 약관에 동의해야 함
    	swal("약관 동의 누락", "필수 약관 동의여부를 확인하세요", "warning");
        return false;
	}  else {
		var member_id = $("#member_id").val();
		var member_pwd = $("#member_pwd").val();
		var member_name = $("#member_name").val();
		var member_birth = $("#birth_year").val() + "-" + $("#birth_month").val() + "-" + $("#birth_day").val();
		var member_email = $("#email_id").val() + "@" + $("#email_addr").val(); 
		var member_phone = $("#Numst").val() + "-" + $("#Numnd").val() + "-" + $("#Numrd").val();
		var member_zipcode = $("#member_zipcode").val();
		var member_faddr = $("#member_faddr").val();
		var member_laddr = $("#member_laddr").val();
		
		$.ajax({
			type : "POST",
			url : "insertMember",
			data : {
				"member_id" : member_id,
				"member_pwd" : member_pwd,
				"member_name" : member_name,
				"member_birth" : member_birth,
				"member_email" : member_email,
				"member_phone" : member_phone,
				"member_zipcode" : member_zipcode,
				"member_faddr" : member_faddr,
				"member_laddr" : member_laddr
			},
			success : function(data) {
				window.location.href="main";
			}
		});
	}
}