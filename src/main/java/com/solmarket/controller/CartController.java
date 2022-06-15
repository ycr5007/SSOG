package com.solmarket.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.solmarket.dto.CartDTO;
import com.solmarket.dto.UserDTO;
import com.solmarket.service.CartService;

@Controller
@RequestMapping("/shop/*")
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@PostMapping("/cart/add")
	@ResponseBody
	// session 객체 필요 -> HttpservletRequest 타입의 파라미터 변수 추가 선언
	public String addCartPost(CartDTO cart, HttpServletRequest request) {
		// 로그인 체크
				HttpSession session = request.getSession();
				UserDTO mvo = (UserDTO)session.getAttribute("user");
				if(mvo == null) {	//로그인되지 않았으면 5 반환
					return "5";
				}
				int result = cartService.addCart(cart);
				
				return result + "";	//return이 String 타입이라서 +"" 해줌.
	}
	
}
