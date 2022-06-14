package com.solmarket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@GetMapping("/market")
	public void reqMarketManager(Criteria cri, Model model) {
		log.info("[GET] <<<<< ADMIN Market 승인 페이지 요청 >>>>>");
		List<MarketDTO> marketList = adminService.getreqMakretList(cri);
		int total = adminService.getMarketCount();
		
		model.addAttribute("pageDto", new PageDTO(cri, total));
		model.addAttribute("list", marketList);
	}
	
}
