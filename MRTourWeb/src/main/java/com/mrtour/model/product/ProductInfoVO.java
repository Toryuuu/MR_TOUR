package com.mrtour.model.product;

import org.springframework.web.multipart.MultipartFile;

public class ProductInfoVO {
	private String prd_id; // 상품 코드
	private String prd_name; // 상품명
	private String city_no; // 지역 번호
	private String prd_opt; // 상품 옵션
	private String cate_id; // 상품 종류 코드
	private int prd_price; // 상품 가격
	private String prd_img; // 상품 이미지
	private MultipartFile uploadFile; // 파일 업로드
	private String prd_exp; //상품 설명
	
	private int buy_quantity;
	
	public int getBuy_quantity() {
		return buy_quantity;
	}

	public void setBuy_quantity(int buy_quantity) {
		this.buy_quantity = buy_quantity;
	}

	private String keyword ="";

	@Override 
	public String toString() {
		return "ProductVO [ PRD_ID = " + prd_id +
						", PRD_NAME = " + prd_name +
						", CITY_NO = " + city_no + 
						", PRD_OPT = " + prd_opt + 
						", CATE_ID = " + cate_id +
						", PRD_PRICE = " + prd_price + 
						", PRD_IMG = " + prd_img + 
						", BUY_QUANTITY = " + buy_quantity + " ]";
	}

	public String getPrd_id() {
		return prd_id;
	}

	public void setPrd_id(String prd_id) {
		this.prd_id = prd_id;
	}

	public String getPrd_name() {
		return prd_name;
	}

	public void setPrd_name(String prd_name) {
		this.prd_name = prd_name;
	}

	public String getCity_no() {
		return city_no;
	}

	public void setCity_no(String city_no) {
		this.city_no = city_no;
	}

	public String getPrd_opt() {
		return prd_opt;
	}

	public void setPrd_opt(String prd_opt) {
		this.prd_opt = prd_opt;
	}

	public String getCate_id() {
		return cate_id;
	}

	public void setCate_id(String cate_id) {
		this.cate_id = cate_id;
	}

	public int getPrd_price() {
		return prd_price;
	}

	public void setPrd_price(int prd_price) {
		this.prd_price = prd_price;
	}

	public String getPrd_img() {
		return prd_img;
	}

	public void setPrd_img(String prd_img) {
		this.prd_img = prd_img;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getPrd_exp() {
		return prd_exp;
	}

	public void setPrd_exp(String prd_exp) {
		this.prd_exp = prd_exp;
	}
}
	
