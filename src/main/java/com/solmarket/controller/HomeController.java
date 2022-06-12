package com.solmarket.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.solmarket.dto.MarketDTO;
import com.solmarket.service.AdminService;
import com.solmarket.service.IndexService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class HomeController {	
	

	@Autowired
	private IndexService service;
	
	@Autowired
	private AdminService adminService;
	
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
	
	@RequestMapping(value = "/manager_index", method = RequestMethod.GET)
	public String manager_home() {
		return "manager_index";
	}
	
}