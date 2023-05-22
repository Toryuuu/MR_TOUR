package com.mrtour.model.product.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mrtour.model.product.ProductInfoVO;
import com.mrtour.model.product.ProductService;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductInfoDAO productInfoDAO;

	// 관리자
	public int prdCheckID(ProductInfoVO vo) {
		return productInfoDAO.prdCheckID(vo);
	}

	// 상품(티켓) 검색
	public List<ProductInfoVO> listSearchPrd(String searchOption1, String city_no, int start, int end) {
		return productInfoDAO.listSearchPrd(searchOption1, city_no, start, end);
	}
	
	// 자동차 상품 검색
	public List<ProductInfoVO> listSearchCar(String searchOption1, String city_no, String searchOption2, String prd_opt, int start, int end) {
		return productInfoDAO.listSearchCar(searchOption1, city_no, searchOption2, prd_opt, start, end);
	}
	
	// 호텔 상품 검색
	public List<ProductInfoVO> listSearchHotel(String searchOption1, String city_no, String searchOption2, String prd_opt, int start, int end) {
		return productInfoDAO.listSearchHotel(searchOption1, city_no, searchOption2, prd_opt, start, end);
	}

	// 물품 검색 카운트
	public int countSearchPrd(String searchOption1, String city_no) {
		return productInfoDAO.countSearchPrd(searchOption1, city_no);
	}
	
	// 렌트카 검색 카운트
	public int countSearchCar(String searchOption1, String city_no, String searchOption2, String prd_opt) {
		return productInfoDAO.countSearchCar(searchOption1, city_no, searchOption2, prd_opt);
	}
	
	// 호텔 검색 카운트
	public int countSearchHotel(String searchOption1, String city_no, String searchOption2, String prd_opt) {
		return productInfoDAO.countSearchHotel(searchOption1, city_no, searchOption2, prd_opt);
	}

	// 상품 등록
	public void insertProduct(ProductInfoVO vo) {
		productInfoDAO.insertProduct(vo);
	}

	// 품목 리스트
	public List<ProductInfoVO> getProductList(int start, int end, ProductInfoVO vo) {
		return productInfoDAO.getProductList(start, end, vo);
	}

	// 관리자 품목 리스트
	public List<ProductInfoVO> getAdminProductList(int start, int end, ProductInfoVO vo) {
		return productInfoDAO.getAdminProductList(start, end, vo);
	}

	// 품목 갯수 카운트
	public int getCountProduct(ProductInfoVO vo) {
		return productInfoDAO.getCountProduct(vo);
	}

	// 관리자 품목 갯수 카운트
	public int getAdminCountProduct(ProductInfoVO vo) {
		return productInfoDAO.getAdminCountProduct(vo);
	}

	// 품목 상세보기
	public ProductInfoVO productDetail(ProductInfoVO vo) {
		return productInfoDAO.productDetail(vo);
	}


	
}
