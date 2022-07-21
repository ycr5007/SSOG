package com.solmarket.controller;

import java.security.Principal;
import java.util.List;
import com.solmarket.dto.BoardDTO;
import com.solmarket.dto.Criteria;
import com.solmarket.dto.UserDTO;
import com.solmarket.mapper.MemberMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.solmarket.dto.BoardDTO;
import com.solmarket.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private BoardService service;
	
	@Autowired
	private MemberMapper mapper;
	
	
	@GetMapping("/board_list")
	public void getList(Model model) {
		log.info("board_list 페이지 요청");
		List<BoardDTO> list = service.getList();
		log.info("Board 데이터" + list);
		model.addAttribute("list", list);
	}

	@GetMapping("/board_insert")
	public void getInsert() {
		log.info("board_insert 페이지 요청");
	}
	@GetMapping("/board_read")
	public void getRead(int boardNo, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("board_read 페이지 요청"+boardNo);
		log.info("board_read 페이지 요청"+cri);
		
		BoardDTO dto = service.getRow(boardNo);
		model.addAttribute("dto" ,dto);
		
		
	}
	
	@PostMapping("/board_insert")
	public String Insert(Principal principal, BoardDTO dto, Model model) {
		log.info("board_insert 페이지 요청");
		log.info(dto + "");
		String userid = principal.getName();
		UserDTO userDto = mapper.read(userid);
		log.info("userDto :" + userDto);
		dto.setUserNo(userDto.getUserNo());
		log.info(dto + "");
		service.register(dto);
		
		return "redirect:/board/board_list";
	}
	



}
