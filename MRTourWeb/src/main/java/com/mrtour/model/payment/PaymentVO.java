package com.mrtour.model.payment;

import java.sql.Date;

public class PaymentVO {
	private String cate_id; // 상품 종류 코드(FK)
	private int order_no; // 주문번호(FK)
	private String member_id; // 회원 id(FK)
	private String prd_id; // 상품 코드(FK)
	private int buy_quantity;// 주문 수량
	private String member_zipcode; // 우편번호
	private String member_faddr; // 주소
	private String member_laddr; // 상세 주소
	private String member_phone; // 회원 연락처	
	private String credit_number; // 신용카드 번호
	private Date payment_date; // 구매일자

	private String prd_name; // 상품명
	private int prd_price; // 상품 가격
	private int prd_sum; // 가격 합계
	private String prd_opt; // 상품 옵션
	private String prd_img; // 상품 이미지
	
	
	public String getCate_id() {
		return cate_id;
	}

	public void setCate_id(String cate_id) {
		this.cate_id = cate_id;
	}
	
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
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
	public String getMember_zipcode() {
		return member_zipcode;
	}
	public void setMember_zipcode(String member_zipcode) {
		this.member_zipcode = member_zipcode;
	}
	public String getMember_faddr() {
		return member_faddr;
	}
	public void setMember_faddr(String member_faddr) {
		this.member_faddr = member_faddr;
	}
	public String getMember_laddr() {
		return member_laddr;
	}
	public void setMember_laddr(String member_laddr) {
		this.member_laddr = member_laddr;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getCredit_number() {
		return credit_number;
	}
	public void setCredit_number(String credit_number) {
		this.credit_number = credit_number;
	}
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
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
	public void setPrd_sum(int prd_sum) {
		this.prd_sum = prd_sum;
	}
	public String getPrd_opt() {
		return prd_opt;
	}
	public void setPrd_opt(String prd_opt) {
		this.prd_opt = prd_opt;
	}
	public String getPrd_img() {
		return prd_img;
	}

	public void setPrd_img(String prd_img) {
		this.prd_img = prd_img;
	}

}
