package com.mrtour.model.cart;

import java.util.List;

import com.mrtour.model.cart.ProductCartVO;

public interface ProductCartService {
	void insertProductCart(ProductCartVO vo);	// 장바구니 담기
	void deleteProductCart(ProductCartVO vo);	// 장바구니 전체 비우기
	void deleteCart(ProductCartVO vo);			// 장바구니 물품 삭제
	List<ProductCartVO> getProductCartList(ProductCartVO vo);	// 장바구니 리스트 출력
}
