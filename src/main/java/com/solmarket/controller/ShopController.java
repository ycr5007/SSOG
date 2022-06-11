package com.solmarket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.solmarket.dto.Criteria;
import com.solmarket.dto.PageDTO;
import com.solmarket.dto.ProductDTO;
import com.solmarket.dto.UserDTO;
import com.solmarket.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/shop/*")
public class ShopController {

	@Autowired
	private ProductService service;

	@GetMapping("/index")
	public void getIndex(Model model,@ModelAttribute("cri") Criteria cri) {
		log.info("Index 페이지 요청");
		
		// 전체 상품리스트 개수
		int total = service.getTotalCnt();
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
		model.addAttribute("product", dto);
	}
	@GetMapping("/")
	public void getFilter() {
		log.info("카테고리 선택시 상품리스트 요청");
		
	}
	
	@GetMapping("/cart") 
	public void getCart() {
		log.info("Cart 페이지 요청");
	}
	
	@GetMapping("/order")
	public void getOrder(Model model,int userNo, int productNo) {
		log.info("Order 페이지 요청");
		UserDTO userDto = service.getOrderUser(userNo);
		ProductDTO productDto = service.getOrderProduct(productNo);
		model.addAttribute("user", userDto);
		model.addAttribute("product", productDto);
	}
	

}
