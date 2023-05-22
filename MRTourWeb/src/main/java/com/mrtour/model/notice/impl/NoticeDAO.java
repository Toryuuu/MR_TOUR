package com.mrtour.model.notice.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mrtour.model.notice.NoticeVO;

@Repository
public class NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 공지사항(notice)
	
	// 게시글 쓰기
	public void createNotice(NoticeVO vo) {
		mybatis.insert("NoticeDAO.createNotice", vo);
	}

	// 게시글 수정
	public void updateNotice(NoticeVO vo) {
		mybatis.update("NoticeDAO.updateNotice", vo);
	}

	// 게시글 삭제
	public void deleteNotice(int notice_no) {
		mybatis.update("NoticeDAO.deleteNotice", notice_no);
	}
	
	// 게시글 삭제 체크
	public int checkNotice(int notice_no) throws Exception {
		return mybatis.selectOne("NoticeDAO.checkNotice", notice_no);
	}

	// 게시글 읽기
	public NoticeVO readNotice(int notice_no) {
		return (NoticeVO) mybatis.selectOne("NoticeDAO.readNotice", notice_no);
	}
	
	// 이전글
	public NoticeVO previousN(int notice_no) {
		return (NoticeVO) mybatis.selectOne("NoticeDAO.previousN", notice_no);
	}

	// 다음글0
	public NoticeVO nextN(int notice_no) {
		return (NoticeVO) mybatis.selectOne("NoticeDAO.nextN", notice_no);
	}
	
	// 공지사항 목록 조회
	public List<NoticeVO> listAllNotice(String searchOption, String keyword, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("NoticeDAO.listAllNotice", map);
	}
	
	// 공지사항 조회수
	public void n_viewCnt(int no_no) {
		mybatis.update("NoticeDAO.n_viewCnt", no_no);
	}	
	
	
	// 공지사항 게시글 갯수
	public int getCountNotice(String searchOption, String keyword) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return mybatis.selectOne("NoticeDAO.getCountNotice", map);
	}
	
}
