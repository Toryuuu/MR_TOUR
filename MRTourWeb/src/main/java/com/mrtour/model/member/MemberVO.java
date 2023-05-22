package com.mrtour.model.member;

import java.sql.Date;

public class MemberVO {

	private int member_seq; // 회원 고유번호
	private String member_id; // 회원 아이디
	private String member_name; // 회원 이름
	private String member_pwd; // 회원 비밀번호
	private String member_birth; // 회원 생년월일
	private Date member_regdate; // 회원 가입일
	private String member_email; // 회원 이메일
	private String member_phone; // 회원 연락처
	private String member_zipcode; // 우편번호
	private String member_faddr; // 주소
	private String member_laddr; // 상세주소
	
	public int getMember_seq() {
		return member_seq;
	}
	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	public Date getMember_regdate() {
		return member_regdate;
	}
	public void setMember_regdate(Date member_regdate) {
		this.member_regdate = member_regdate;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
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
	
	@Override
	public String toString() {
		return "MemberVO [member_id=" + member_id + ", member_name=" + member_name + "]";
	}
}
