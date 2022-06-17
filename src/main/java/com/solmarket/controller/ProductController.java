package com.solmarket.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.solmarket.dto.ProductListDTO;
import com.solmarket.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/product/*")
@Slf4j
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	
	//화면 첫 페이지 : 오픈예정 + 참여중인 장터, 상품 목록 보여주기
	@GetMapping("/product_index")
	public void seller_home(Model model) {
		log.info("판매자 관리 페이지 요청");

		List<MarketDTO> mList = service.mList();
		List<MarketDTO> oList = service.oList();		
		List<ProductDTO> pList = service.pList();
				
		// "mList" : jsp에서 사용할 item이름과 동일
		model.addAttribute("mList",mList);
		model.addAttribute("oList",oList);
		model.addAttribute("pList",pList);
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
		model.addAttribute("marketNo", marketNo);
	}
	
	// 상품 등록 : List로 받기
	@PostMapping("/product_register")
	public String registerPost(ProductListDTO proList, RedirectAttributes rttr) {
		log.info("상품 등록 폼 전송 "+ proList);				
		
		service.insert(proList);		
		
		int userNo = proList.getProList().get(0).getUserNo();
		
		
		rttr.addAttribute("userNo", userNo);
		return "redirect:/product/product_list";
		
	}
	
	// 상품 수정 및 목록 보여주기
	@GetMapping({"/product_modify","/product_read"})
	public void modify(int userNo, int productNo, Model model, @ModelAttribute("cri") Criteria cri) {
		log.info("상품 내역 폼 요청");
		ProductDTO dto = service.getRow(productNo);
		model.addAttribute("userNo", userNo);
		model.addAttribute("pageNum", cri.getPageNum());
		model.addAttribute("amount", cri.getAmount());
		model.addAttribute("dto", dto);
	}
	
	// 상품 수정하기
	@PostMapping("/product_modify")
	public String modifyPost(int userNo,ProductDTO updateDto, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("수정 폼 확인");
		if(service.update(updateDto)) {
			// 수정 성공 시
			rttr.addAttribute("userNo", updateDto.getUserNo());
			rttr.addAttribute("productNo", updateDto.getProductNo());
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
			
		}
		return "redirect:/product/product_read";
	}
	
	// 상품 리스트 보여주기
	@GetMapping("/product_list")
	public void list(int userNo, Model model,@ModelAttribute("cri") Criteria cri) {
		log.info("상품 리스트 요청");
		
		List<ProductDTO> list = service.getList(cri, userNo);
		// 페이징
		int total = service.getTotalCnt(userNo);
		log.info("pageDTO : " + new PageDTO(cri, total));
		model.addAttribute("userNo", userNo);
		model.addAttribute("pageDto", new PageDTO(cri, total));
		model.addAttribute("list",list);

	}
	
	// 장터 리스트 보여주기
	@GetMapping("/product_market_list")
	public void marketList(int userNo,Model model,@ModelAttribute("cri") Criteria cri) {
		log.info("오픈 예정 장터 리스트 요청");
		
		List<MarketDTO> marketList = service.marketList(cri, userNo);
		// 페이징
		int total = service.marketTotal(cri);
		log.info("pageDTO : " + new PageDTO(cri, total));
		model.addAttribute("userNo", userNo);
		model.addAttribute("pageDto", new PageDTO(cri, total));
		model.addAttribute("marketList",marketList);
	}
	
	// 장터 종료 후 남은 상품 보여주기 상품 상태 == 4 
	@GetMapping("/product_remain_list")
	public void remainList(int userNo,Model model,@ModelAttribute("cri") Criteria cri) {
		log.info("장터 종료 후 상품 리스트 요청");
		List<ProductDTO> remainList = service.remainList(cri, userNo);
		// 페이징
		int total = service.remainTotal(userNo);
		log.info("pageDTO : " + new PageDTO(cri, total));
		model.addAttribute("userNo", userNo);
		model.addAttribute("pageDto", new PageDTO(cri, total));
		model.addAttribute("remainList",remainList);
	}
	
	// 온라인 상품 보여주기, 상품 상태 == 5
	@GetMapping("/product_online_list")
	public void onlineList(int userNo, Model model,@ModelAttribute("cri") Criteria cri) {
		log.info("온라인 판매 상품 보내주기");
		
		List<ProductDTO> onlineList = service.onlineList(cri, userNo);
		// 페이징
		int total = service.onlineTotal(userNo);
		log.info("pageDTO : " + new PageDTO(cri, total));
		model.addAttribute("userNo", userNo);
		model.addAttribute("pageDto", new PageDTO(cri, total));
		model.addAttribute("onlineList",onlineList);
	}
	
	// 참여중인 장터 보여주기
	@GetMapping("/product_ingmarket_list")
	public void ingMarketList(int userNo, Model model, @ModelAttribute("cri") Criteria cri) {
		log.info("참여 중인 장터 리스트 요청");

		List<MarketDTO> ingMarketList = service.ingMarketList(cri, userNo);
		// 페이징
		int total = service.ingMarketTotal(cri);
		log.info("pageDTO : " + new PageDTO(cri, total));
		model.addAttribute("userNo", userNo);
		model.addAttribute("pageDto", new PageDTO(cri, total));
		model.addAttribute("ingMarketList", ingMarketList);
	}
	
	
	
	

}
