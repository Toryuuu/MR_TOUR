package com.mrtour.model.product;

import java.util.List;

public interface ProductService {

	// 관리자
	int prdCheckID(ProductInfoVO vo);

	// 물품 검색
	List<ProductInfoVO> listSearchPrd(String searchOption1, String city_no, int start, int end);
	List<ProductInfoVO> listSearchCar(String searchOption1, String city_no, String searchOption2, String prd_opt, int start, int end);
	List<ProductInfoVO> listSearchHotel(String searchOption1, String city_no, String searchOption2, String prd_opt, int start, int end);

	int countSearchCar(String searchOption1, String city_no, String searchOption2, String prd_opt);
	int countSearchHotel(String searchOption1, String city_no, String searchOption2, String prd_opt);
	int countSearchPrd(String searchOption1, String city_no);
	
	// 물품 등록
	void insertProduct(ProductInfoVO vo);

	// 물품 리스트
	List<ProductInfoVO> getProductList(int start, int end, ProductInfoVO vo);

	List<ProductInfoVO> getAdminProductList(int start, int end, ProductInfoVO vo);

	int getCountProduct(ProductInfoVO vo);

	int getAdminCountProduct(ProductInfoVO vo);

	ProductInfoVO productDetail(ProductInfoVO vo);
}