package com.mrtour.view.board;

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
import com.mrtour.model.board.BoardService;
import com.mrtour.model.board.BoardVO;
import com.mrtour.model.board.impl.BoardDAO;

@Controller
@SessionAttributes("board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;

	// 게시글 등록 뷰
	@RequestMapping("/write")
	public String write(BoardVO vo) throws Exception {
		return "board/Ask_board_write";
	}

	// 게시글 등록
	@RequestMapping(value = "/createBoard", method = RequestMethod.POST)
	public String createBoard(BoardVO vo) throws Exception {
		boardService.createBoard(vo);
		return "board/Ask_board";
	}

	// 게시글 수정하러 가기
	@RequestMapping("/updateWrite")
	public String updateWrite(BoardVO vo) throws Exception {
		return "board/Ask_board_update";
	}

	// 게시글 수정 후
	@RequestMapping(value = "/updateBoard", method = RequestMethod.POST)
	public String updateBoard(BoardVO vo) throws Exception {
		boardService.updateBoard(vo);
		return "board/Ask_board_view";
	}
	
	// 게시글 삭제
	@RequestMapping("/delete")
	public String deleteBoard(Integer board_no) throws Exception {
		boardService.deleteBoard(board_no); // 삭제 처리
		return "redirect:/board"; // 목록으로 이동
	}
	
	// 게시글 목록 + 검색 + 페이징
	@RequestMapping("/board")
	public String listAllBoard(Model model, HttpSession session,
			@RequestParam(defaultValue = "B_TITLE") String searchOption, 
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String search, 
			@RequestParam(defaultValue = "1") int curPage)
			throws Exception {

		// 게시글 갯수 계산
		int count = boardService.getCountBoard(searchOption, keyword);

		session.setAttribute("searchOption", searchOption);
		session.setAttribute("keyword", keyword);
		session.setAttribute("search", search);
		session.setAttribute("curPage", curPage);

		// 페이지 관련 설정
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		List<BoardVO> list = boardService.listAllBoard(searchOption, keyword, start, end); // 게시글 목록

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // map에 자료 저장
		map.put("count", count);
		map.put("pager", pager); // 페이지 네버게이션을 위한 변수
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("search", search);
		model.addAttribute("map", map);

		return "board/Ask_board";
	}

	// 게시글 상세보기
	@RequestMapping("/view")
	public String readBoard(@RequestParam("board_no") int board_no, 
							@RequestParam("b_show") String b_show, Model model, HttpSession session, 
							@RequestParam(defaultValue = "B_TITLE") String searchOption,
							@RequestParam(defaultValue = "") String keyword, 
							@RequestParam(defaultValue = "") String search,
							@RequestParam(defaultValue = "1") int curPage) throws Exception {

		/* 게시글 예외처리 */
		// 삭제된 게시글을 읽으려고 하는 경우
		int checkBoard = boardService.checkBoard(board_no);

		if (checkBoard == 0 && b_show.equals("N")) {
			return "board/checkDel";
		}

		// 존재하지 않는 게시글에 접근하려는 경우
		else if (checkBoard == 0 && b_show.equals("Y")) {
			return "board/checkNone";

		} else if (checkBoard == 1 && b_show.equals("N")) {
			return "board/checkNone";
		}

		boardService.b_viewCnt(board_no, session); // 조회수
		model.addAttribute("board", boardService.readBoard(board_no)); // 게시글 읽기

		// 세션 저장
		searchOption = (String) session.getAttribute("searchOption");
		session.setAttribute("searchOption", searchOption);

		keyword = (String) session.getAttribute("keyword");
		session.setAttribute("keyword", keyword);

		search = (String) session.getAttribute("search");
		session.setAttribute("search", search);

		curPage = (Integer) session.getAttribute("curPage");
		session.setAttribute("curPage", curPage);

		BoardVO plist = boardService.previousB(board_no);
		BoardVO nlist = boardService.nextB(board_no);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("previousB", plist);
		map.put("nextB", nlist);
		model.addAttribute("map", map);

		return "board/Ask_board_view";
	}
	
	// FAQ화면으로 가기
	@RequestMapping("/FAQ")
	public String Faq() {
		return "board/FAQ";
	}	
}