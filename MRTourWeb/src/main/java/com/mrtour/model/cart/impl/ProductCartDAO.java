package com.mrtour.model.cart.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mrtour.model.cart.ProductCartVO;

@Repository
public class ProductCartDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 장바구니에 담기
	public void insertProductCart(ProductCartVO vo) {
		mybatis.insert("ProductCartDAO.insertProductCart", vo);
	}
	
	// 장바구니 리스트 전체 삭제(상품 비우기 버튼)
	public void deleteProductCart(ProductCartVO vo) {
		mybatis.delete("ProductCartDAO.deleteProductCart", vo);
	}
	
	// 장바구니 리스트 품목 하나씩 비우기(삭제  버튼)
	public void deleteCart(ProductCartVO vo) {
		mybatis.delete("ProductCartDAO.deleteCart", vo);
	}
	
	// 장바구니 리스트 출력
	public List<ProductCartVO> getProductCartList(ProductCartVO vo) {
		return mybatis.selectList("ProductCartDAO.productCart", vo);
	}
}