package com.mrtour.model.product;

public class ProductVO {
	
	private String cate_id; // 상품 종류 코드(FK)
	private String cate_name; // 상품 종류명

	public String getCate_id() {
		return cate_id;
	}

	public void setCate_id(String cate_id) {
		this.cate_id = cate_id;
	}

	public String getCate_name() {
		return cate_name;
	}

	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}

}
