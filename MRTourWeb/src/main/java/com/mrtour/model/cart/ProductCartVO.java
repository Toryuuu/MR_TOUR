package com.mrtour.model.cart;

import java.util.List;

public class ProductCartVO {

	private String prd_name; // 상품명	
	private int prd_price; // 상품 가격
	private int prd_sum; // 가격 합계
	private String prd_img; // 상품 이미지

	private String member_id; // 회원 아이디(FK)
	private String prd_id; // 상품 코드(FK)
	private int buy_quantity; // 주문 수량
	private int cart_id; // 장바구니 고유번호 
	
	private List<String> cartPayList; // 장바구니 리스트
	
	@Override 
	public String toString() {
		return "ProductCartVO [ PRD_NAME = " + prd_name +
						", PRD_PRICE = " + prd_price +
						", PRD_SUM = " + prd_sum +
						", PRD_IMG = " + prd_img +
						", MEMBER_ID = " + member_id +
						", PRD_ID = " + prd_id + 
						", BUY_QUANTITY = " + buy_quantity + 
						", CART_ID = " + cart_id + " ]";
	}

	public String getPrd_name() {
		return prd_name;
	}

	public void setPrd_name(String prd_name) {
		this.prd_name = prd_name;
	}

	public int getPrd_price() {
		return prd_price;
	}

	public void setPrd_price(int prd_price) {
		this.prd_price = prd_price;
	}

	public int getPrd_sum() {
		return prd_sum;
	}

	public void setPrd_sum(int buy_quantity, int prd_price) {
		this.prd_sum = buy_quantity * prd_price; // 합계 = 주문 수량 * 상품 가격
	}

	public String getPrd_img() {
		return prd_img;
	}

	public void setPrd_img(String prd_img) {
		this.prd_img = prd_img;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getPrd_id() {
		return prd_id;
	}

	public void setPrd_id(String prd_id) {
		this.prd_id = prd_id;
	}

	public int getBuy_quantity() {
		return buy_quantity;
	}

	public void setBuy_quantity(int buy_quantity) {
		this.buy_quantity = buy_quantity;
	}

	public int getCart_id() {
		return cart_id;
	}

	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}

	public List<String> getCartPayList() {
		return cartPayList;
	}

	public void setCartPayList(List<String> cartPayList) {
		this.cartPayList = cartPayList;
	}

	
}
