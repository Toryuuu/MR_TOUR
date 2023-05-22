package com.mrtour.model.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mrtour.model.product.ProductInfoVO;

@Repository
public class ProductInfoDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
		// 관리자 상품 코드 중복검사
		public int prdCheckID(ProductInfoVO vo) {
			return mybatis.selectOne("ProductInfoDAO.prdCheckID", vo);
		}

		// 상품 검색(티켓용 검색)
		public List<ProductInfoVO> listSearchPrd(String searchOption1, String city_no, int start, int end) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("city_no", city_no);
			map.put("start", start);
			map.put("end", end);
			return mybatis.selectList("ProductInfoDAO.listSearchPrd", map);
		}
	
		//렌트카 상품검색(검색 조건 2개)
		public List<ProductInfoVO> listSearchCar(String searchOption1, String city_no, String searchOption2, String prd_opt, int start, int end) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("searchOption1", searchOption1);
			map.put("searchOption2", searchOption2);
			map.put("city_no", city_no);
			map.put("prd_opt", prd_opt);
			map.put("start", start);
			map.put("end", end);
			return mybatis.selectList("ProductInfoDAO.listSearchCar", map);
		}
		
		//호텔 상품검색(검색 조건 2개)
		public List<ProductInfoVO> listSearchHotel(String searchOption1, String city_no, String searchOption2, String prd_opt, int start, int end) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("searchOption1", searchOption1);
			map.put("searchOption2", searchOption2);
			map.put("city_no", city_no);
			map.put("prd_opt", prd_opt);
			map.put("start", start);
			map.put("end", end);
			return mybatis.selectList("ProductInfoDAO.listSearchHotel", map);
		}
		
		// 티켓 검색 품목 카운트
		public int countSearchPrd(String searchOption1, String city_no) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("searchOption1", searchOption1);
			map.put("city_no", city_no);
			return mybatis.selectOne("ProductInfoDAO.countSearchPrd", map);
		}
		
		// 검색 품목 카운트
		public int countSearchCar(String searchOption1, String city_no, String searchOption2, String prd_opt) {
		    Map<String, Object> map = new HashMap<String, Object>();
			map.put("searchOption1", searchOption1);
			map.put("searchOption2", searchOption2);		    
		    map.put("city_no", city_no == null ? "" : city_no);
		    map.put("prd_opt", prd_opt == null ? "" : prd_opt);
		    return mybatis.selectOne("ProductInfoDAO.countSearchCar", map);
		}
		
		// 검색 품목 카운트
		public int countSearchHotel(String searchOption1, String city_no, String searchOption2, String prd_opt) {
		    Map<String, Object> map = new HashMap<String, Object>();
			map.put("searchOption1", searchOption1);
			map.put("searchOption2", searchOption2);
		    map.put("city_no", city_no == null ? "" : city_no);
		    map.put("prd_opt", prd_opt == null ? "" : prd_opt);
		    return mybatis.selectOne("ProductInfoDAO.countSearchHotel", map);
		}

		// 상품 등록
		public void insertProduct(ProductInfoVO vo) {
			mybatis.insert("ProductInfoDAO.insertProduct", vo);
		}

		// 품목 리스트
		public List<ProductInfoVO> getProductList(int start, int end, ProductInfoVO vo) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("product", vo);
			return mybatis.selectList("ProductInfoDAO.getProductList", map);
		}

		// 관리자 품목 리스트
		public List<ProductInfoVO> getAdminProductList(int start, int end, ProductInfoVO vo) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("product", vo);
			return mybatis.selectList("ProductInfoDAO.getAdminProductList", map);
		}
		

		// 품목 갯수 카운트
		public int getCountProduct(ProductInfoVO vo) {
			return mybatis.selectOne("ProductInfoDAO.getCountProduct", vo);
		}

		// 관리자 품목 갯수 카운트
		public int getAdminCountProduct(ProductInfoVO vo) {
			return mybatis.selectOne("ProductInfoDAO.getAdminCountProduct", vo);
		}

		// 품목 상세보기
		public ProductInfoVO productDetail(ProductInfoVO vo) {
			return (ProductInfoVO) mybatis.selectOne("ProductInfoDAO.productDetail", vo);
		}
	
}
