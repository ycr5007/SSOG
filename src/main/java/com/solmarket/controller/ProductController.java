package com.solmarket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.solmarket.dto.ProductDTO;
import com.solmarket.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/product/*")
@Slf4j
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	@RequestMapping(value = "/product_index", method = RequestMethod.GET)
	public String seller_home() {
		return "product_index";
	}
	
	// 상품 등록
	@GetMapping("/product_register")
	public void register(int userNo, Model model) {
		log.info("product_register 폼 요청");
		model.addAttribute("userName", service.userName(userNo));
		
	}
	
	@PostMapping("/product_register")
	public String registerPost(ProductDTO productDto) {
		log.info("폼확인");
		log.info("productDto : " + productDto);
		service.insert(productDto);
		return "redirect:/product/product_register";
	}
	
	
	@GetMapping({"/product_modify","/product_read"})
	public void modify(int productNo) {
		log.info("수정 폼 요청");
		
	}
	
	@PostMapping("/product_modify")
	public String modifyPost() {
		log.info("수정 폼 확인");
		return "redirect:/product/product_modify";
	}
	
	
	@GetMapping("/product_list")
	public void list(Model model) {
		log.info("리스트 폼 요청");
		List<ProductDTO> list = service.getList();
		model.addAttribute("list",list);

	}
	
	@PostMapping("/product_list")
	public String listPost() {
		log.info("리스트 폼확인");
		return "redirect:/product/product_list";
	}
	
	

}
