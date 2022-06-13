package com.solmarket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.solmarket.dto.UserDTO;
import com.solmarket.service.AdminService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/admin/*")
public class AdminRestController {
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping(path = "/user/{userNo}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<UserDTO> getUserDetail(@PathVariable("userNo") int userNo) {
		log.info("[REST-GET] <<<<< USER Detail " + userNo + " >>>>>");
		UserDTO dto = adminService.getUserDetail(userNo);
		log.info("DTO :: " + dto);
		return new ResponseEntity<UserDTO>(dto, HttpStatus.OK);
	}
}
