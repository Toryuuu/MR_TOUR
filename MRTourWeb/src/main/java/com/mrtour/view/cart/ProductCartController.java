package com.mrtour.view.cart;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mrtour.home.Pager;
import com.mrtour.model.cart.ProductCartService;
import com.mrtour.model.cart.ProductCartVO;
import com.mrtour.model.payment.PaymentService;
import com.mrtour.model.payment.PaymentVO;

@Controller
public class ProductCartController {
	@Autowired
	private ProductCartService productCartService;
	@Autowired
	private PaymentService paymentService;

	
	// 장바구니 (리스트) 보기
	@RequestMapping("/productCart")
	public String cartList(ProductCartVO vo, Model model) {
		model.addAttribute("cartPrd", productCartService.getProductCartList(vo));
		return "member/mypage";
	}
	
	// 장바구니 담기
	@RequestMapping("/insertCart")
	public String insertProductCart(@ModelAttribute ProductCartVO vo) {
		productCartService.insertProductCart(vo);
		System.out.println("insertCart 메소드 실행됨" + vo.toString());
		return "member/mypage";
	}
	
	
	// 장바구니 전체 비우기
	@RequestMapping("/clearCart")
	public String deleteProductCart(ProductCartVO vo) {
		productCartService.deleteProductCart(vo);
		return "member/mypage";
	}
	
	// 장바구니 물품 삭제
	@RequestMapping("/delCart")
	public String deleteCart(ProductCartVO vo) {
		productCartService.deleteCart(vo);
		return "member/mypage";
	}


	// 결제
		// 결제 페이지로 가기
		   @RequestMapping("/payment")
		   public String checkoutPage(PaymentVO vo)  {
		      return "member/payment";
		   }
		
		@RequestMapping(value="/payment", method=RequestMethod.GET)
		public String paymentView(ProductCartVO vo) {
			return "member/payment";
		}

		@RequestMapping(value="/payment", method=RequestMethod.POST)
		public String payment(@RequestParam(value="hiddenbtn") String hidden, PaymentVO vo, HttpSession session, Model model) {
			System.out.println(hidden);
			if (hidden.equals("prdpage")) { 
				List<PaymentVO> list = paymentService.getPaymentProduct(vo);
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("list", list);
				map.put("hidden", hidden);
				map.put("buy_quantity", vo.getBuy_quantity());
//				model.addAttribute("map", map);
				session.setAttribute("map", map);
			} else if (hidden.equals("cartpage")) { // 결제하기 버튼 클릭 시
				List<PaymentVO> list = paymentService.cartPaymentProduct(vo);
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("list", list);
				map.put("hidden", hidden);
//				model.addAttribute("map", map);
				session.setAttribute("map", map);
			}
			return "member/payment";
		}
		
		// 호텔 결제페이지
		@RequestMapping("/hotel_payment")
		public String hotelpayment(PaymentVO vo, HttpSession session, Model model) {
		 // 장바구니 버튼 클릭 시
			List<PaymentVO> list = paymentService.getPaymentProduct(vo);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("buy_quantity", vo.getBuy_quantity());
			session.setAttribute("map", map);
			return "products/hotel_checkout";
		}
		
		// 결제목록 갱신
		@RequestMapping(value="/resetPayList")
		public String insertPayment(String[] prd_list, PaymentVO vo) {
			for(int i = 0; i < prd_list.length; i += 2) {
				vo.setPrd_id(prd_list[i]);
				vo.setBuy_quantity(Integer.parseInt(prd_list[i+1]));
				System.out.println(vo.toString());
				paymentService.insertPayment(vo);
				paymentService.deleteCartPayment(vo);
			}
			return "main";
		}
		
		
		// 자동차 결제
		@RequestMapping(value="/CarPayment")
		public String CarPayment(String prd_id, String prd_opt, Integer buy_quantity, PaymentVO vo) {
				vo.setPrd_id(prd_id);
				vo.setPrd_opt(prd_opt);
				vo.setBuy_quantity(buy_quantity);
				paymentService.CarPayment(vo);
			return "main";
		}
		
		// 호텔 결제
		@RequestMapping(value="/HotelPayment")
		public String Payment(String prd_id, String prd_opt, Integer buy_quantity, PaymentVO vo) {
				vo.setPrd_id(prd_id);
				vo.setPrd_opt(prd_opt);
				vo.setBuy_quantity(buy_quantity);
				paymentService.CarPayment(vo);
			return "main";
		}
		
}

