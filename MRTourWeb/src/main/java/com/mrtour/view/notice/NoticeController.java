package com.mrtour.view.notice;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mrtour.home.Pager;
import com.mrtour.model.notice.NoticeService;
import com.mrtour.model.notice.NoticeVO;
import com.mrtour.model.notice.impl.NoticeDAO;

@Controller
@SessionAttributes("notice")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;

	// 공지사항 등록
		@RequestMapping(value = "/createNotice", method = RequestMethod.POST)
		public String createNotice(NoticeVO vo) throws Exception {
			noticeService.createNotice(vo);
			return "notice/Notice_board";
		}
		
		// 게시글 등록 뷰
		@RequestMapping("/Notice_write")
		public String Notice_write(NoticeVO vo) throws Exception {
			return "notice/Notice_write";
		}
		
		// 게시글 수정 뷰
		@RequestMapping("/updateNotice_view")
		public String updateNotice_view(NoticeVO vo) throws Exception {
			return "notice/updateNotice_view";
		}

		// 게시글 수정
		@RequestMapping(value = "/updateNotice", method = RequestMethod.POST)
		public String updateNotice(NoticeVO vo) throws Exception {
			if (vo.getNotice_title() != null) {
				noticeService.updateNotice(vo);
				return "notice/view";
			} else {
				return "notice/write";
			}
		}

		// 게시글 삭제
		@RequestMapping("/deleteNotice")
		public String deleteNotice(int notice_no) throws Exception {
			noticeService.deleteNotice(notice_no); // 삭제 처리
			return "redirect:/notice"; // 목록으로 이동
		}
		
		
		
		
		//공지사항 목록
		@RequestMapping("/notice")
		public String listAllNotice(Model model, HttpSession session,
				@RequestParam(defaultValue = "NOTICE_TITLE") String searchOption, 
				@RequestParam(defaultValue = "") String keyword,
				@RequestParam(defaultValue = "") String search, 
				@RequestParam(defaultValue = "1") int curPage)
				throws Exception {

			// 게시글 갯수 계산
			int count = noticeService.getCountNotice(searchOption, keyword);

			session.setAttribute("searchOption", searchOption);
			session.setAttribute("keyword", keyword);
			session.setAttribute("search", search);
			session.setAttribute("curPage", curPage);

			// 페이지 관련 설정
			Pager pager = new Pager(count, curPage);
			int start = pager.getPageBegin();
			int end = pager.getPageEnd();

			List<NoticeVO> list = noticeService.listAllNotice(searchOption, keyword, start, end); // 게시글 목록

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("list", list); // map에 자료 저장
			map.put("count", count);
			map.put("pager", pager); // 페이지 네버게이션을 위한 변수
			map.put("searchOption", searchOption);
			map.put("keyword", keyword);
			map.put("search", search);
			model.addAttribute("map", map);

			return "notice/Notice_board";
		}
		
		// 공지사항 상세보기
		@RequestMapping("/n_view")
		public String readNotice(@RequestParam("notice_no") int notice_no, 
								@RequestParam("n_show") String n_show, Model model, HttpSession session, 
								@RequestParam(defaultValue = "NOTICE_TITLE") String searchOption,
								@RequestParam(defaultValue = "") String keyword, 
								@RequestParam(defaultValue = "") String search,
								@RequestParam(defaultValue = "1") int curPage) throws Exception {

			/* 게시글 예외처리 */
			// 삭제된 게시글을 읽으려고 하는 경우
			int checkNotice = noticeService.checkNotice(notice_no);

			if (checkNotice == 0 && n_show.equals("N")) {
				return "notice/checkDel";
			}

			// 존재하지 않는 게시글에 접근하려는 경우
			else if (checkNotice == 0 && n_show.equals("Y")) {
				return "notice/checkNone";

			} else if (checkNotice == 1 && n_show.equals("N")) {
				return "notice/checkNone";
			}

			noticeService.n_viewCnt(notice_no, session); // 조회수
			model.addAttribute("notice", noticeService.readNotice(notice_no)); // 게시글 읽기

			// 세션 저장
			searchOption = (String) session.getAttribute("searchOption");
			session.setAttribute("searchOption", searchOption);

			keyword = (String) session.getAttribute("keyword");
			session.setAttribute("keyword", keyword);

			search = (String) session.getAttribute("search");
			session.setAttribute("search", search);

			curPage = (Integer) session.getAttribute("curPage");
			session.setAttribute("curPage", curPage);

			NoticeVO plist = noticeService.previousN(notice_no);
			NoticeVO nlist = noticeService.nextN(notice_no);

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("previousN", plist);
			map.put("nextN", nlist);
			model.addAttribute("map", map);

			return "notice/Notice_board_view";
		}
}