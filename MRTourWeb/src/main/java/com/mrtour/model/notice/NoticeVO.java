package com.mrtour.model.notice;

import java.sql.Date;

public class NoticeVO {

	private int notice_no;  // 게시글 번호
	private String notice_title;	// 게시글 제목
	private String notice_sub; //게시글 말머리
	private String member_name; //작성자 이름
	private Date notice_date; // 작성일(java.util.Date)
	private String notice_content;// 게시글 내용		
	private String searchCondition;
	private String searchKeyword;
	private int n_viewCnt;				// 조회수
	private String n_show;	// 화면 표시 여부
	
	public int getN_viewCnt() {
		return n_viewCnt;
	}

	public void setN_viewCnt(int n_viewCnt) {
		this.n_viewCnt = n_viewCnt;
	}

	public String getN_show() {
		return n_show;
	}

	public void setN_show(String n_show) {
		this.n_show = n_show;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_sub() {
		return notice_sub;
	}

	public void setNotice_sub(String notice_sub) {
		this.notice_sub = notice_sub;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}	
	
	public String getSearchCondition() {
		return searchCondition;
	}
	
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	
	public String getSearchKeyword() {
		return searchKeyword;
	}
	
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
		
	@Override
	public String toString() {
		return "NoticeDTO [notice_no=" + notice_no + ", notice_title=" + notice_title 
				+ ", notice_sub=" + notice_sub + ", member_name=" + member_name 
				+ ", notice_date="+ notice_date + ", notice_content=" + notice_content
				+ ", n_show=" + n_show+ ", n_viewCnt=" + n_viewCnt + "]";
	}
}
