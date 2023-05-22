// 로그인, 비밀번호 크기 작아지게
window.onload = function () {
	var text1 = document.getElementById("input_id");
    var text2 = document.getElementById("input_pwd");		    
	
    text1.onclick = function() {
    	var fontSize = "2";
		        
		var labels = text1.getElementsByTagName("label");
		for (var i = 0; i < labels.length; i++) {
			labels[i].style.fontSize = fontSize + "px";
		}
	};
	
	text2.onclick = function() {
		var fontSize = "2";
		        
		var labels = text2.getElementsByTagName("label");
		for (var i = 0; i < labels.length; i++) {
		    labels[i].style.fontSize = fontSize + "px";
		}
	};
	
	text1.addEventListener("mousemove",  function() {
		var fontSize = "2";
		        
		var labels = text1.getElementsByTagName("label");
		for (var i = 0; i < labels.length; i++) {
		    labels[i].style.fontSize = fontSize + "px";
		}
	});
	
	text2.addEventListener("mousemove",  function() {
		var fontSize = "2";
		        
		var labels = text2.getElementsByTagName("label");
		for (var i = 0; i < labels.length; i++) {
		    labels[i].style.fontSize = fontSize + "px";
		}
	});
}

 function memberCheck() {
	if(!$("#member_id").val()) {//아이디를 입력하지 않으면 수행
	   swal("", "아이디를 입력하세요", "warning"); 
	   $("#member_id").focus();
	   return false;
	}
	    
	else if(!$("#member_pwd").val()) {//비밀번호를 입력하지 않으면 수행
	   swal("", "비밀번호를 입력하세요", "warning"); 
	   $("#member_pwd").focus();
	   return false;
	   
	} else {
		var member_id = $("#member_id").val();
		var member_pwd = $("#member_pwd").val();	
		$.ajax({
			type : "POST",
			url : "checkMember",
			data : {
				"member_id" : member_id,
				"member_pwd" : member_pwd
			},
			success : function(data) {
				if (data != 0) {
					$.ajax({
						type : "POST",
						url : "login",
						data : {
							"member_id" : member_id,
							"member_pwd" : member_pwd
						}, success : function() {
							window.location.href = "main";
						}
					});
				} else {
					swal("","아이디 혹은 패스워드를 확인해주세요.","warning")
				}
			}, error : function(data) {
				console.log(data);
			}
		});
	}
}

function logout() {
 	$.ajax({
 		type : "GET",
 		url : "logout",
 		data : {},
 		success : function(data) {
 			location.href="main";
 		}
 	});
 }
 