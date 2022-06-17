package com.solmarket.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.solmarket.dto.AuthDTO;
import com.solmarket.dto.Criteria;
import com.solmarket.dto.MarketDTO;
import com.solmarket.dto.NoticeDTO;
import com.solmarket.dto.PageDTO;
import com.solmarket.dto.UserDTO;
import com.solmarket.service.AdminService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@GetMapping("/index")
	public void reqIndex(Model model) {
		log.info("[GET] <<<<< ADMIN INDEX 페이지 요청 >>>>>");
		String userRatio = adminService.getUserRatio();
		List<MarketDTO> marketList = adminService.getRequestMarketList();
		List<NoticeDTO> noticeList = adminService.getRequestNoticeList();
		List<Integer> visitTotal = adminService.getVisitorTotal();

		model.addAttribute("visitTotal", visitTotal);
		model.addAttribute("marketList", marketList);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("userRatio", userRatio);
	}

	@GetMapping("/user")
	public void UserManager(Criteria cri, Model model) {
		log.info("[GET] <<<<< ADMIN User 관리 페이지 요청 >>>>>");
		List<UserDTO> userList = adminService.getUserList(cri);
		int total = adminService.getUserCount();
		
		model.addAttribute("pageDto", new PageDTO(cri, total));
		model.addAttribute("list", userList);
	}
	
	@GetMapping("/request_auth")
	public void userRequestAuth(Model model) {
		log.info("[GET] <<<<< ADMIN User Auth Request 관리 페이지 요청 >>>>>");
		List<AuthDTO> authList = adminService.getAuthRequest();
		List<AuthDTO> sellerList = new ArrayList<AuthDTO>();
		List<AuthDTO> managerList = new ArrayList<AuthDTO>();
		for(AuthDTO auth : authList) {
			if(auth.getAuthority().equals("ROLE_SELLER")) {
				sellerList.add(auth);
			}else {
				managerList.add(auth);
			}
		}
		model.addAttribute("sellerList", sellerList);
		model.addAttribute("managerList", managerList);
		
	}
	
	@PostMapping("/authAccess")
	public String accessAuth(String userId) {
		adminService.accessAuth(userId);
		return "redirect:/admin/request_auth";
	}

	@PostMapping("/authRefuse")
	public String refuseAuth(String userId) {
		adminService.deleteAuth(userId);
		return "redirect:/admin/request_auth";
	}
	
	@GetMapping("/market")
	public void reqMarketManager(Criteria cri, Model model) {
		log.info("[GET] <<<<< ADMIN Market 승인 페이지 요청 >>>>>");
		List<MarketDTO> marketList = adminService.getreqMakretList(cri);
		int total = adminService.getMarketCount();
		
		model.addAttribute("pageDto", new PageDTO(cri, total));
		model.addAttribute("list", marketList);
	}
	
	@PostMapping("/marketAccess")
	public String reqMarketAccess(int marketNo) {
		log.info("[POST] <<<<< Market Access >>>>> " + marketNo);
		adminService.accessMarket(marketNo);
		return "redirect:/admin/market";
	}
	
	@PostMapping("/marketRefuse")
	public String reqMarketRefuse(int marketNo) {
		log.info("[POST] <<<<< Market Access >>>>> " + marketNo);
		adminService.refuseMarket(marketNo);
		return "redirect:/admin/market";
	}

	@GetMapping("/notice")
	public void reqNoticeManager(Criteria cri, Model model) {
		log.info("[GET] <<<<< Notice 승인 페이지 요청 >>>>>");
		int total = adminService.getNoticeCount();
		List<NoticeDTO> noticeList = adminService.getreqNoticeList(cri);
		model.addAttribute("pageDto", new PageDTO(cri, total));
		model.addAttribute("list", noticeList);
	}
	
	@PostMapping("/noticeAccess")
	public String reqNoticeAccess(int noticeNo) {
		log.info("[POST] <<<<< Notice Access >>>>> " + noticeNo);
		adminService.accessNotice(noticeNo);
		return "redirect:/admin/notice";
	}
	
	@PostMapping("/noticeRefuse")
	public String reqNoticeRefuse(int noticeNo) {
		log.info("[POST] <<<<< Notice Access >>>>> " + noticeNo);
		adminService.refuseNotice(noticeNo);
		return "redirect:/admin/notice";
	}
}
