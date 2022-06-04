package com.solmarket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/market/*")
@Controller
public class MarketController {
	
//	@Autowired
//	private MarketService service;
	
	@GetMapping("/market_detail")
	public void market_detail() {
		log.info("[GetMapping] ========== 장터 상세 페이지 호출 ==========");
	}
}
