package com.solmarket.controller;


import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.solmarket.dto.Criteria;
import com.solmarket.dto.OrderDTO;
import com.solmarket.dto.PageDTO;
import com.solmarket.dto.ProductDTO;
import com.solmarket.dto.UserDTO;
import com.solmarket.service.ShopService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/shop/*")
public class ShopController {

	@Autowired
	private ShopService service;

	@GetMapping("/index")
	public void getIndex(Model model,@ModelAttribute("cri") Criteria cri) {
		log.info("Index 페이지 요청" + cri);
		
		if(cri.getKeyword() == null) {
			cri.setKeyword("0");
		}
		// 전체 상품리스트 개수
		int total = service.getTotalCnt(cri);
		cri.setAmount(9);	// index 페이지에서 amount=9로 고정
		PageDTO pageDto = new PageDTO(cri,total);
		log.info("PageDTO ::: " + pageDto);
		model.addAttribute("pageDto", pageDto);
		model.addAttribute("categoryList", service.getCategory());
		model.addAttribute("product", service.getProduct(cri));
	}
	@GetMapping("/detail") 
	public void getDetail(Model model,@ModelAttribute("cri") Criteria cri, int productNo) {
		log.info("Detail 페이지 요청"+productNo);
		log.info("Detail 페이지 요청"+cri);
		ProductDTO dto = service.getDetail(productNo);
		log.info("dto"+dto);
		model.addAttribute("product", dto);
	}
	
//	@PostMapping("/detail")
//	public String getOrderQN(int productNo, int orderQN, RedirectAttributes rttr) {
//		log.info("상품 수량 요청" + orderQN);
//		
//		rttr.addAttribute("orderQN", orderQN);
//		rttr.addAttribute("productNo", productNo);
//		return "redirect:/shop/order";
//	}
	
	@GetMapping("/cart") 
	public void getCart(Model model, int productNo,int orderQN,int userNo) {
		log.info("Cart 페이지 요청");
		log.info("" + productNo);
		UserDTO userDto = service.getOrderUser(userNo);
		ProductDTO productDto = service.getOrderProduct(productNo);
		log.info("" + productDto);
		model.addAttribute("user", userDto);
		model.addAttribute("product", productDto);
		model.addAttribute("orderQN", orderQN);
	}
	
	
	@GetMapping("/order")
	public void getOrder(Model model, int productNo,int orderQN,int userNo) {
		log.info("Order 페이지 요청");
		log.info("" + productNo);
		log.info("" + orderQN);
		UserDTO userDto = service.getOrderUser(userNo);
		ProductDTO productDto = service.getOrderProduct(productNo);
		log.info("" + productDto);
		log.info("userDto 확인"+ userDto);
		model.addAttribute("user", userDto);
		model.addAttribute("product", productDto);
		model.addAttribute("orderQN", orderQN);
	}
	
	@PostMapping("/iamport")
	public String payinfo(Model model,UserDTO userDto,OrderDTO orderDto,ProductDTO productDto) {
		log.info("payInfo");
		log.info("userDto" + userDto);
		log.info("orderDto" + orderDto);
		log.info("productDto" + productDto);
//		log.info("userName",userDto);
		model.addAttribute("user",userDto);
		model.addAttribute("order",orderDto);
		model.addAttribute("product",productDto);
		return "/shop/iamport";
	}
	
	@GetMapping("/orderDetail")
	public void orderDetail() {
		log.info("orderDetail 페이지 요청");
	}
	
//	@PostMapping("/detail")
//	@ResponseBody	//ajax사용하기위해
//	public ResponseEntity<String> addCart(CartDTO cart) {
//		log.info("카트추가"+cart);
//		return service.addCart(cart)?new ResponseEntity<String>("장바구니에 추가되었습니다.", HttpStatus.OK):new ResponseEntity<String>("오류 발생했습니다.", HttpStatus.BAD_REQUEST);
//	 
//	}
//	
	
// ----------------------------------------------------------------
	
// 주문번호 생성 메소드 -> 연월일+랜덤4자리 -> 보류!
//public static String numberGen(int len, int dupCd ) {
//        
//        Random rand = new Random();
//        String numStr = ""; //난수가 저장될 변수
//        
//        for(int i=0;i<len;i++) {
//            
//            //0~9 까지 난수 생성
//            String ran = Integer.toString(rand.nextInt(10));
//            
//            if(dupCd==1) {
//                //중복 허용시 numStr에 append
//                numStr += ran;
//            }else if(dupCd==2) {
//                //중복을 허용하지 않을시 중복된 값이 있는지 검사한다
//                if(!numStr.contains(ran)) {
//                    //중복된 값이 없으면 numStr에 append
//                    numStr += ran;
//                }else {
//                    //생성된 난수가 중복되면 루틴을 다시 실행한다
//                    i-=1;
//                }
//            }
//        }
//        return numStr;
//    }


}