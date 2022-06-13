package com.solmarket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.solmarket.service.MarketService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class MarketRestController {
	
	@Autowired
	private MarketService service;
	
	/* ============================= 상품 승인 (상품 상태 0 → 1) ============================= */
	@PutMapping("/receiveAccept/{marketNo}/{productNo}")
	public ResponseEntity<String> receiveAccept(@PathVariable("marketNo")int marketNo, @PathVariable("productNo")int productNo) {
		log.info("[PutMapping] =============== 상품 승인 ===============");
		return service.ProductAccept(productNo) ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
	}
	
	/* ============================= 상품 거부 (상품 상태 0 → 2) ============================= */
	@PutMapping("/receiveDeny/{marketNo}/{productNo}")
	public ResponseEntity<String> receiveDeny(@PathVariable("marketNo")int marketNo, @PathVariable("productNo")int productNo) {
		log.info("[PutMapping] =============== 상품 거부 ===============");
		return service.ProductDeny(productNo) ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
	}
	
}