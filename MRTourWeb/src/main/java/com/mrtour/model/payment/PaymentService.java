package com.mrtour.model.payment;

import java.util.List;

public interface PaymentService {
	// 상세 페이지에서 바로 구매
	List<PaymentVO> getPaymentProduct(PaymentVO vo);
	
	// 장바구니에서 구매
	List<PaymentVO> cartPaymentProduct(PaymentVO vo);
	
	// 결제
	void insertPayment(PaymentVO vo);
	
	// 렌트카결제
	void CarPayment(PaymentVO vo) ;
	
	// 호텔결제
	void HotelPayment(PaymentVO vo) ;

	// 결제 후 장바구니 비우기
	void deleteCartPayment(PaymentVO vo);
}

