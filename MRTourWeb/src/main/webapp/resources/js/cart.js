/**
 * 장바구니
 */

// 장바구니 담기
function insertCart() {
	var member_id = $("#member_id").val();
	var prd_id = $("#prd_id").val();
	var buy_quantity = $("#buy_quantity").val();
	if (member_id == "Administrator") {
		swal("", "관리자 권한으로는 이용하실 수 없습니다.", "warning");
	} else if (!member_id) {
		swal("", "비회원은 장바구니를 이용하실 수 없습니다.", "error");
	} else if (buy_quantity == 0) {
		swal("", "수량을 선택해주세요", "error");
	} else {
		$.ajax({
			type : "GET",
			url : "insertCart",
			data : {
				"member_id" : member_id,
				"prd_id" : prd_id,
				"buy_quantity" : buy_quantity
			},
			success : function(data) {
				swal("", "장바구니에 추가되었습니다.", "success");
			}
		});
	}
}

// 장바구니에 담긴 품목 결제
function buyCart(prd_id, member_id) {
	if (!member_id) {
		console.log('a');
	} else {
		console.log(prd_id + " + " + member_id);
		window.location.href="payment";
		$.ajax({
			type : "POST",
			url : "payment",
			data : {
				"member_id" : member_id,
				"prd_id" : prd_id
			},
			success : function() {
				window.location.href = "payment";
			}
		});
	}
}

// 장바구니 품목 삭제
function delCart(prd_id, member_id) {
	if (!member_id) {
		swal("", "로그인 해주세요.", "error")
	} else {
		$.ajax({
			type : "POST",
			url : "delCart",
			data : {
				"member_id" : member_id,
				"prd_id" : prd_id
			},
			success : function(data) {
				window.location.reload();
			}
		});
	}
}

// 장바구니 비우기
function cartClear() {
	var member_id = $("#member_id").val();
	if (!member_id) {
		swal("", "로그인 해주세요.", "error")
	} else {
		$.ajax({
			type : "POST",
			url : "clearCart",
			data : {
				"member_id" : member_id
			},
			success : function() {
				window.location.reload();
			}
		});
	}
}

// 장바구니 계산(체크박스 선택 할 때)
function calCart() {
	var prd_sum = 0;
	for (i = 0; i < $("input[name=chk]").length; i++) {
		if ($("input[name=chk]")[i].checked == true) {
			prd_sum += parseInt($("input[name=prd_sum]")[i].value);
		}
	}
	document.getElementById("prd_sum").innerHTML = numberWithCommas(prd_sum);
}

function numberWithCommas(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}