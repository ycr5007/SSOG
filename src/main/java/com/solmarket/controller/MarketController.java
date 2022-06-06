package com.solmarket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/market/*")
@Controller
public class MarketController {
	
	@GetMapping("/market_accept")
	public void market_accept() {
		log.info("[GetMapping] ========== 참여 승인 리스트 호출 ==========");
	}
	
	@GetMapping("/market_detail")
	public void market_detail() {
		log.info("[GetMapping] ========== 장터 상세 페이지 호출 ==========");
	}
	
	@GetMapping("/market_myseller")
	public void seller_list() {
		log.info("[GetMapping] ========== 장터 참여자 리스트 호출 ==========");
	}
	
	@GetMapping("/market_notice")
	public void market_notice() {
		log.info("[GetMapping] ========== 장터 공지 리스트 호출 ==========");
	}
	
	@GetMapping("/market_receive")
	public void market_receive() {
		log.info("[GetMapping] ========== 장터 참여 신청 리스트 호출 ==========");
	}
	
	@GetMapping("/market_register")
	public void market_register() {
		log.info("[GetMapping] ========== 장터 등록 폼 호출 ==========");
	}
	
	@GetMapping("/market_review")
	public void market_review() {
		log.info("[GetMapping] ========== 장터 리뷰 리스트 호출 ==========");
	}
}
