package com.mrtour.view.member;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mrtour.home.Pager;
import com.mrtour.model.member.MemberService;
import com.mrtour.model.member.MemberVO;
import com.mrtour.model.notice.NoticeVO;
import com.mrtour.model.payment.PaymentVO;
import com.mrtour.model.product.ProductInfoVO;

@Controller
@SessionAttributes("member")
public class MemberController {
	@Autowired
	private MemberService memberService;

	@RequestMapping("/main")
	public String main() { return "main"; }

	/*@RequestMapping("/term")
	public String term(MemberVO vo) { return "member/term"; }*/

	// 회원가입
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signUpView(MemberVO vo) { return "member/signup"; }

	@RequestMapping("/forgotPW")
	public String forgotPWView(MemberVO vo) { return "member/forgotPW"; }

	// 마이페이지
		@RequestMapping(value = "/MyPage", method = RequestMethod.GET)
		public String mypage(MemberVO vo) {
			return "member/mypage";
		}
		
	// 회원 주문내역(마이페이지)
	@ResponseBody
	@RequestMapping("/mypL")
	public String mypage1(MemberVO vo, HttpSession session, Model model, @RequestParam(defaultValue = "1") int myp) {
		// 주문 테이블 갯수 계산
		int count = memberService.getCountOrder(vo);

		session.setAttribute("myp", myp); // 주문내역 페이지 번호(디폴트 1)
		session.setAttribute("member_id", vo.getMember_id());

		// 페이지 관련 설정
		Pager pager = new Pager(count, myp);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		List<PaymentVO> list = memberService.getOrderList(vo, start, end);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mypL", list); // map에 자료 저장
		map.put("count", count);
		map.put("pager", pager); // 페이지 내비게이션을 위한 변수
		session.setAttribute("map", map);
		
		
		return "member/mypage";
	}

	// 회원 주문내역 뷰 (페이징 처리)
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypageView(MemberVO vo, HttpSession session, Model model, @RequestParam(defaultValue = "1") int myp) {
		int count = memberService.getCountOrder(vo);
		Pager pager = new Pager(count, myp);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		List<PaymentVO> list = memberService.getOrderList(vo, start, end);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mypL", list); // map에 자료 저장
		map.put("count", count);
		map.put("pager", pager); // 페이지 내비게이션을 위한 변수
		session.setAttribute("map", map);
		return "member/mypage";
	}

	
	/*// 마이페이지-비밀번호 view
	@RequestMapping(value = "/mypage2", method = RequestMethod.GET)
	public String mypageView2(MemberVO vo) {
		return "member/mypage2";
	}

	// 마이페이지-비밀번호 확인 처리
	@RequestMapping(value = "/mypage2", method = RequestMethod.POST)
	public String mypage2(MemberVO vo) {
		memberService.login(vo);
		return "member/mypage3";
	}*/
	
	// 마이페이지-회원정보수정 처리
	@RequestMapping(value = "/mypage3", method = RequestMethod.POST)
	public String mypage3(MemberVO vo) {
		memberService.updateMember(vo);
		return "member/mypage";
	}

	/*// 마이페이지-완료 view
	@RequestMapping("/mypage4")
	public String mypage4(MemberVO vo) {
		return "member/mypage4";
	}
*/
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		
		Object member = session.getAttribute("member");
	    if (member == null) {
	        System.out.println("member 속성에 저장된 값이 null입니다.");
	    } else {
	        System.out.println(member.toString());
	    }
			System.out.println("로그아웃 성공....");
			
			return "main";	
	}

	// 아이디 중복검사
	@ResponseBody
	@RequestMapping(value = "/checkID")
	public int checkID(MemberVO vo) {
		int checkID = memberService.checkID(vo);
		return checkID;
	}

	@ResponseBody
	@RequestMapping(value = "/checkMember")
	public int checkMember(MemberVO vo) {
		int checkMember = memberService.checkMember(vo);
		return checkMember;
	}

	// 회원가입
	@RequestMapping("/insertMember")
	public String signUp(MemberVO vo) {
		System.out.println("가입 성공....");
		memberService.insertMember(vo);
		return "main";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginView(MemberVO vo) {
		return "member/login";
	}

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpSession session) {
		MemberVO member = memberService.login(vo);
		if (member != null) {
			session.setAttribute("member", member);
			System.out.println(member + "로그인 성공....");
			return "main";
		} else {
			return "member/login";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/forgotPWChkm")
	public int forgotPWChkm(MemberVO vo) {
		int forgotPWChkm = memberService.forgotPWChkMember(vo);
		return forgotPWChkm;
	}
	
	@RequestMapping(value="/forgotPW", method = RequestMethod.POST)
	public String forgotPW(MemberVO vo) {
		return "";
	}
	
	//관리자 화면

	// 관리자 메인화면으로 가기
		@RequestMapping("/admin_main")
		public String Admin_main() {
			return "admin/admin_main";
		}
		
		
	//회원관리 목록화면 + 구현
		@RequestMapping(value = "/admin_mem", method = RequestMethod.GET)
		public String listAllMember(@RequestParam(defaultValue = "1") int curPage, MemberVO vo, Model model) {
			int count = memberService.getCountMember(vo);
			Pager pager = new Pager(count, curPage);
			int start = pager.getPageBegin();
			int end = pager.getPageEnd();
			
			List<MemberVO> list = memberService.getMemberList(start, end, vo);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("count", count);
			map.put("pager", pager);
			model.addAttribute("map", map);

			return "admin/admin_mem";
		}
		
		// 게시글 삭제
		@RequestMapping("/delete_mem")
		public String deleteMember(Integer member_id) throws Exception {
			memberService.deleteMember(member_id); // 삭제 처리
			return "redirect:/admin_mem"; // 목록으로 이동
		}	
		

		@RequestMapping("/Intro")
		public String intro() {
			return "company/Intro"; 
		}
}
