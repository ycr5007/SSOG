package com.solmarket.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.solmarket.dto.CustomUser;
import com.solmarket.dto.MarketDTO;
import com.solmarket.dto.UserDTO;
import com.solmarket.mapper.MemberMapper;
import com.solmarket.service.AdminService;
import com.solmarket.service.IndexService;
import com.solmarket.service.MarketService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class HomeController {	
	

	@Autowired
	private IndexService service;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private MarketService marketService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest req) {

		String sessionId = req.getSession().getId();
		try {
			System.out.println(req.getSession().getId());
			adminService.visitInsert(sessionId);
		} catch (Exception e) {
			log.info("이미 존재하는 세션입니다...");
		}
		
		//서비스 호출
		List<MarketDTO> list = service.getList();
		//list 담기
		model.addAttribute("list",list);
		
		return "index";
	}
	
//	@RequestMapping(value = "/manager_index", method = RequestMethod.GET)
//	public String manager_home(Model model, Principal principal) {
//		
//		
//		
//		// userNo 가져오기
////		String userId = principal.getName();
////		UserDTO userDTO = memberMapper.read(userId);
//////		int userNo = userDTO.getUserNo();
//////		
////		// marketDTO 가져오기
//		MarketDTO marketDTO = new MarketDTO();
//		marketDTO.setUserNo(userNo);
//		model.addAttribute("userId", userId);
//		model.addAttribute("userNo", userNo);
//		model.addAttribute("marketNo", marketDTO.getMarketNo());
////		
//		return "manager_index";
//	}
	
	@RequestMapping(value = "/manager_index", method = RequestMethod.GET)
	public String index(Model model) {

		// userNo 가져오기 위한 작업
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUser customUser = (CustomUser)principal;		
		UserDTO userDTO = customUser.getUserDto();
		
		// 마켓 no 가져오기
		Integer marketNo = marketService.getMarketNo(userDTO.getUserNo());
		if(marketNo == null) {
			marketNo = 0;
		}
		System.out.println("marketNo : " + marketNo);
		
		// 장터 상태 가져오기
		Integer marketStatus = marketService.getMarketStatus(marketNo);
		if(marketNo == 0) {
			marketStatus = -1;
		}
		System.out.println("marketStatus : " + marketStatus);
	
//		model.addAttribute("userDTO", userDTO);
		model.addAttribute("marketNo", marketNo);
		model.addAttribute("marketStatus", marketStatus);
        
        return "manager_index";
    }
	
	@ResponseBody
	@GetMapping("/auth")
	public Authentication auth() {
		return SecurityContextHolder.getContext().getAuthentication();
	}
	
}