package com.solmarket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.solmarket.dto.Criteria;
import com.solmarket.dto.MarketDTO;
import com.solmarket.dto.PageDTO;
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
	public void seller_home() {
		log.info("판매자 관리 페이지 요청");
	}
	
	// 상품 등록
	@GetMapping("/product_register")
	public void register(int userNo, int marketNo, Model model) {
		log.info("product_register 폼 요청");
		log.info("userNo : " + userNo);
		log.info("marketNo : " + marketNo);
		model.addAttribute("marketName", service.marketName(marketNo));
		model.addAttribute("userName", service.userName(userNo));
		model.addAttribute("userNo", userNo);
	}
	
	@PostMapping("/product_register")
	public String registerPost(ProductDTO productDto, RedirectAttributes rttr) {
		log.info("상품 등록 폼 전송");
		if(service.insert(productDto)) {
			log.info("productDto : " + productDto);
			rttr.addAttribute("userNo", productDto.getUserNo());
		}
		return "redirect:/product/product_list";
	}
	
	@GetMapping({"/product_modify","/product_read"})
	public void modify(int userNo, int productNo, Model model, @ModelAttribute("cri") Criteria cri) {
		log.info("상품 내역 폼 요청");
		ProductDTO dto = service.getRow(productNo);
		model.addAttribute("userNo", userNo);
		model.addAttribute("pageNum", cri.getPageNum());
		model.addAttribute("amount", cri.getAmount());
		model.addAttribute("dto", dto);
	}
	
	@PostMapping("/product_modify")
	public String modifyPost(ProductDTO updateDto, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("수정 폼 확인");
		if(service.update(updateDto)) {
			// 수정 성공 시
			rttr.addAttribute("userNo", updateDto.getUserNo());
			rttr.addAttribute("productNo", updateDto.getProductNo());
			rttr.addAttribute("pageDto", new PageDTO(cri, service.getTotalCnt(updateDto.getUserNo())));
		}
		return "redirect:/product/product_read";
	}
	
	
	@GetMapping("/product_list")
	public void list(int userNo, Model model,@ModelAttribute("cri") Criteria cri) {
		log.info("리스트 요청");
		
		List<ProductDTO> list = service.getList(cri, userNo);
		int total = service.getTotalCnt(userNo);
		log.info("pageDTO : " + new PageDTO(cri, total));
		model.addAttribute("userNo", userNo);
		model.addAttribute("pageDto", new PageDTO(cri, total));
		model.addAttribute("list",list);

	}
	
	@GetMapping("/product_market_list")
	public void marketList(int userNo,Model model,@ModelAttribute("cri") Criteria cri) {
		log.info("마켓 리스트 요청");
		
		List<MarketDTO> marketList = service.marketList(cri, userNo);
	
		int total = service.marketTotal(cri);
		log.info("pageDTO : " + new PageDTO(cri, total));
		model.addAttribute("userNo", userNo);
		model.addAttribute("pageDto", new PageDTO(cri, total));
		model.addAttribute("marketList",marketList);
	}
	
	//검색 폼 보여주기
	@GetMapping("/product_search")
	public String search(String productName, Model model) {
		log.info("상품 정보 검색" + productName);
		
//		List<ProductDTO> list = service.getSearchList(productName);
//		model.addAttribute("list",list);
		
		return "/search_list"; 
	}
}
