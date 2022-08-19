package com.solmarket.controller;

import java.security.Principal;
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
import com.solmarket.dto.UserDTO;
import com.solmarket.mapper.MemberMapper;
import com.solmarket.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/product/*")
@Slf4j
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	@Autowired
	private MemberMapper mapper;
	
	
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
//		@GetMapping("/product_register") 
//		public void register(int userNo, int marketNo, Model model) {
//			log.info("product_register 폼 요청");
//			log.info("userNo : " + userNo);
//			log.info("marketNo : " + marketNo);
//			model.addAttribute("marketName", service.marketName(marketNo));
//			model.addAttribute("userName", service.userName(userNo));
//			model.addAttribute("userNo", userNo);
//			model.addAttribute("marketNo", marketNo);
//		}
	 
	
	// 상품 등록
	@GetMapping("/product_register")
	public void register(Principal principal,@ModelAttribute("marketNo") int marketNo, Model model) {
		// 판매자 정보 가지고오기
		String userid = principal.getName();
		log.info("product_register 폼 요청"+ userid);
		UserDTO userDto = mapper.read(userid);

		model.addAttribute("user", userDto);
		model.addAttribute("marketName", service.marketName(marketNo));
	}
	
	// 상품 등록 : List로 받기
	@PostMapping("/product_register")
	public String registerPost(ProductListDTO proList, RedirectAttributes rttr) {
		log.info("상품 등록 폼 전송 "+ proList);
		
		
		boolean rs =  service.insert(proList);			
		int userNo = proList.getProList().get(0).getUserNo();
			log.info("" +userNo);
		rttr.addAttribute("userNo", userNo);
		
		rttr.addFlashAttribute("msg", "상품 등록이 완료되었습니다!");
		
		return "redirect:/product/product_list";
		
	}
	
	// 상품 수정 및 목록 보여주기
	@GetMapping({"/product_modify","/product_read"})
	public void modify(Principal principal,@ModelAttribute("productNo") int productNo, Model model, @ModelAttribute("cri") Criteria cri) {
		log.info("상품 내역 폼 요청");
		// 판매자 정보 가지고오기
		String userid = principal.getName();
		log.info(userid);
		
		UserDTO userDto = mapper.read(userid);
		ProductDTO dto = service.getRow(productNo);
		//페이징
		model.addAttribute("user", userDto);
		model.addAttribute("pageNum", cri.getPageNum());
		model.addAttribute("amount", cri.getAmount()); 
		model.addAttribute("dto", dto);
	}
	
	// 상품 수정하기_ 상품 수정이 완료되고 read.jsp되돌아가기 때문에 user 정보는 필요 없음
	@PostMapping("/product_modify")
	public String modifyPost(Principal principal, ProductDTO updateDto, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("온라인 상품으로 등록");
		
		if(service.update(updateDto)) {
			// 수정 성공 시
			rttr.addAttribute("productNo", updateDto.getProductNo());
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
			
		}
		return "redirect:/product/product_read";
	}
	
	// 상품 리스트 보여주기
	@GetMapping("/product_list")
	public void list(Principal principal, Model model,@ModelAttribute("cri") Criteria cri) {
		log.info("상품 리스트 요청===== "+principal.getName());
		// 판매자 정보 가지고오기
		String userid = principal.getName();
		UserDTO userDto = mapper.read(userid);
		
		System.out.println("user정보"+userDto);
		
		List<ProductDTO> list = service.getList(cri, userDto.getUserNo());
		// 페이징
		int total = service.getTotalCnt(userDto.getUserNo());
		log.info("pageDTO : " + new PageDTO(cri, total));
		model.addAttribute("user", userDto);
		model.addAttribute("pageDto", new PageDTO(cri, total));
		model.addAttribute("list",list);

	}
	
	// 상품 리스트 보여주기
	/*
	 * @GetMapping("/product_list") public void list(int userNo, Model
	 * model,@ModelAttribute("cri") Criteria cri) { log.info("상품 리스트 요청");
	 * 
	 * List<ProductDTO> list = service.getList(cri, userNo); // 페이징 int total =
	 * service.getTotalCnt(userNo); log.info("pageDTO : " + new PageDTO(cri,
	 * total)); model.addAttribute("userNo", userNo); model.addAttribute("pageDto",
	 * new PageDTO(cri, total)); model.addAttribute("list",list);
	 * 
	 * }
	 */
	
	
	// 장터 리스트 보여주기
	@GetMapping("/product_market_list")
	public void marketList(Principal principal, Model model,@ModelAttribute("cri") Criteria cri) {
		log.info("오픈 예정 장터 리스트 요청");
		String userid = principal.getName();
		UserDTO userDto = mapper.read(userid);
		log.info(""+userDto);
		List<MarketDTO> marketList = service.marketList(cri, userDto.getUserNo());
		// 페이징
		int total = service.marketTotal(cri);
		log.info("pageDTO : " + new PageDTO(cri, total));
		model.addAttribute("user", userDto);
		model.addAttribute("pageDto", new PageDTO(cri, total));
		model.addAttribute("marketList",marketList);
	}
	// 장터 종료 후 남은 상품 보여주기 상품 상태 == 3 
	@GetMapping("/product_sell_list")
	public void sellerList(Principal principal,Model model,@ModelAttribute("cri") Criteria cri) {
		log.info("장터 종료 후 상품 리스트 요청");
		// 판매자 정보 가지고오기
		String userid = principal.getName();
		UserDTO userDto = mapper.read(userid);
		List<ProductDTO> sellList = service.sellList(cri, userDto.getUserNo());
		// 페이징
		int total = service.sellTotal(userDto.getUserNo());
		log.info("pageDTO : " + new PageDTO(cri, total));
		model.addAttribute("user", userDto);
		model.addAttribute("pageDto", new PageDTO(cri, total));
		model.addAttribute("sellList",sellList);
	}
	
	// 장터 종료 후 남은 상품 보여주기 상품 상태 == 4 
	@GetMapping("/product_remain_list")
	public void remainList(Principal principal,Model model,@ModelAttribute("cri") Criteria cri) {
		log.info("장터 종료 후 상품 리스트 요청");
		// 판매자 정보 가지고오기
		String userid = principal.getName();
		log.info(userid);
		UserDTO userDto = mapper.read(userid);
		List<ProductDTO> remainList = service.remainList(cri, userDto.getUserNo());
		// 페이징
		int total = service.remainTotal(userDto.getUserNo());
		log.info("pageDTO : " + new PageDTO(cri, total));
		model.addAttribute("user", userDto);
		model.addAttribute("pageDto", new PageDTO(cri, total));
		model.addAttribute("remainList",remainList);
	}
	
	// 온라인 상품 보여주기, 상품 상태 == 5
	@GetMapping("/product_online_list")
	public void onlineList(Principal principal, Model model,@ModelAttribute("cri") Criteria cri) {
		log.info("온라인 판매 상품 보내주기");
		// 판매자 정보 가지고오기
		String userid = principal.getName();
		UserDTO userDto = mapper.read(userid);
		List<ProductDTO> onlineList = service.onlineList(cri, userDto.getUserNo());
		// 페이징
		int total = service.onlineTotal(userDto.getUserNo());
		log.info("pageDTO : " + new PageDTO(cri, total));
		model.addAttribute("user", userDto);
		model.addAttribute("pageDto", new PageDTO(cri, total));
		model.addAttribute("onlineList",onlineList);
	}
	
	// 참여중인 장터 보여주기
	@GetMapping("/product_ingmarket_list")
	public void ingMarketList(Principal principal, Model model, @ModelAttribute("cri") Criteria cri) {
		log.info("참여 중인 장터 리스트 요청");

		// 판매자 정보 가지고오기
		String userid = principal.getName();
		UserDTO userDto = mapper.read(userid);
		List<MarketDTO> ingMarketList = service.ingMarketList(cri, userDto.getUserNo());
		// 페이징
		int total = service.ingMarketTotal(cri);
		log.info("pageDTO : " + new PageDTO(cri, total));
		model.addAttribute("user", userDto);
		model.addAttribute("pageDto", new PageDTO(cri, total));
		model.addAttribute("ingMarketList", ingMarketList);
	}
	
	
	
	

}
