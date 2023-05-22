package com.mrtour.model.notice.impl;

import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mrtour.model.notice.NoticeService;
import com.mrtour.model.notice.NoticeVO;

@Service("NoticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO noticeDAO;
	
//공지사항 : Notice	
	
	// 공지사항 쓰기
	public void createNotice(NoticeVO vo) throws Exception {
		noticeDAO.createNotice(vo);
	}
	
	// 게시글 수정
	public void updateNotice(NoticeVO vo) throws Exception {
		noticeDAO.updateNotice(vo);
	}

	// 게시글 삭제
	public void deleteNotice(int notice_no) throws Exception {
		noticeDAO.deleteNotice(notice_no);
	}
	
	// 게시글 삭제 체크
	public int checkNotice(int notice_no) throws Exception {
		return noticeDAO.checkNotice(notice_no);
	}

	// 게시글 읽기
	public NoticeVO readNotice(int notice_no) throws Exception {
		return noticeDAO.readNotice(notice_no);
	}
	
	// 이전글
	public NoticeVO previousN(int notice_no) throws Exception {
		return noticeDAO.previousN(notice_no);
	}
	
	// 다음글
	public NoticeVO nextN(int notice_no) throws Exception {
		return noticeDAO.nextN(notice_no);
	}
	
	// 게시글 목록
	public List<NoticeVO> listAllNotice(String searchOption, String keyword, int start, int end)
			throws Exception {
		return noticeDAO.listAllNotice(searchOption, keyword, start, end);
	}
	
	// 조회수
	public void n_viewCnt(int notice_no, HttpSession session) throws Exception {
		// 타이머 설정
		long update_time = 0;

		if (session.getAttribute("update_time_" + notice_no) != null) {
			// 최근에 조회수를 올린 시간
			update_time = (Long) session.getAttribute("update_time_" + notice_no);
		}
		long current_time = System.currentTimeMillis();
		// 일정 시간이 경과한 후 조회수 증가 처리
		if (current_time - update_time > 5 * 10000) {
			// 조회수 증가 처리
			noticeDAO.n_viewCnt(notice_no);
			// 조회수를 올린 시간 저장
			session.setAttribute("update_time_" + notice_no, current_time);
		}
	}
	
	// 게시글 갯수
	public int getCountNotice(String searchOption, String keyword) throws Exception {
		return noticeDAO.getCountNotice(searchOption, keyword);
	}

}
