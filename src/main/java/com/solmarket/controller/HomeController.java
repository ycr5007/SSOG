package com.solmarket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.solmarket.dto.MarketDTO;
import com.solmarket.service.IndexService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class HomeController {	
	

	@Autowired
	private IndexService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		//서비스 호출
		List<MarketDTO> list = service.getList();
		
		log.info(""+list);
		
		
		//list 담기
		model.addAttribute("list",list);
		
		return "index";
	}
	
	@RequestMapping(value = "/manager_index", method = RequestMethod.GET)
	public String manager_home() {
		return "manager_index";
	}
	
}