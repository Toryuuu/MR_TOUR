package com.mrtour.model.payment.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mrtour.model.payment.PaymentVO;

@Repository
public class PaymentDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 상세 페이지에서 상품 바로 구매
	public List<PaymentVO> getPaymentProduct(PaymentVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("payment", vo);
		return mybatis.selectList("PaymentDAO.paymentProduct", map);
	}
	
	// 장바구니에서 상품 구매
	public List<PaymentVO> cartPaymentProduct(PaymentVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("payment", vo);
		return mybatis.selectList("PaymentDAO.cartPaymentProduct", map);
	}
	
	// 결제
	public void insertPayment(PaymentVO vo) {
		mybatis.insert("PaymentDAO.insertPayment", vo);
	}
	
	
	
	// 렌트카결제
	public void CarPayment(PaymentVO vo) {
		mybatis.insert("PaymentDAO.CarPayment", vo);
	}	
	
	// 호텔결제
	public void HotelPayment(PaymentVO vo) {
		mybatis.insert("PaymentDAO.HotelPayment", vo);
	}	
		
	// 결제 후 장바구니 비우기
	public void deleteCartPayment(PaymentVO vo) {
		mybatis.delete("PaymentDAO.deleteCartPayment", vo);
	}
}