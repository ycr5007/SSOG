package com.solmarket.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.solmarket.dto.AttachDTO;
import com.solmarket.dto.BoardDTO;
import com.solmarket.dto.Criteria;
import com.solmarket.dto.PageDTO;
import com.solmarket.dto.UserDTO;
import com.solmarket.mapper.MemberMapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public void getList(Model model, @ModelAttribute("criteria") Criteria cri) {
		log.info("board_list 페이지 요청");
		List<BoardDTO> list = service.getList(cri);
		int total = service.boardCount();
		log.info("Board 데이터" + list);
		log.info("pageNum: " + cri.getPageNum());
		model.addAttribute("pageDTO", new PageDTO(cri, total));
		model.addAttribute("list", list);
	}

	@PreAuthorize("isAuthenticated()") // Security 정의 메소드 : isAuthenticated() >> 로그인 정보의 유무
	@GetMapping("/board_insert")
	public void boardInsert(Principal principal, Model model) {
		log.info("[GET] boardInsert");
		String userid = principal.getName();
		UserDTO userDto = mapper.read(userid);
		model.addAttribute("user", userDto);
	}

	@PreAuthorize("isAuthenticated()")
	@PostMapping("/board_insert")
	public String boardInsert(BoardDTO boardInsert, Criteria cri, RedirectAttributes rttr) {
		log.info("[POST] boardInsert " + boardInsert);
		log.info("[POST] boardInsert " + cri);
		service.boardInsert(boardInsert);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("result", boardInsert.getBoardNo());
		return "redirect:/board/board_list";
	}
	
	
	@GetMapping("/hitupdate")
	public String setHitUpdated(int boardNo, Criteria cri, RedirectAttributes rttr) {
		log.info("Hitupdate >> " + boardNo + "\t" + cri);			
		service.updateHit(boardNo);
		
		rttr.addAttribute("boardNo", boardNo);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:board_read";
	}

	@GetMapping("/board_read")
	public void getread(int boardNo, Criteria cri, Model model) {
		log.info("[GET] read >> " + boardNo + "\t" + cri);	
		
		BoardDTO readOne = service.getRow(boardNo);		
		model.addAttribute("BoardDTO", readOne);
	}

	@GetMapping("/board_modify")
	public void modifyGet(int boardNo, Criteria cri, Model model) {
		log.info("" + boardNo + "" + cri);
		BoardDTO modify = service.getRow(boardNo);
		model.addAttribute("BoardDTO", modify);
	}

	@PostMapping("/board_modify")
	public String modifyPost(BoardDTO modify, Criteria cri, RedirectAttributes rttr) {
		log.info("[POST] board_modify");

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("boardNo", modify.getBoardNo());
		log.info("" + modify.getUserName());
		log.info("" + modify.getBoardNo());
		if (service.modify(modify))
			return "redirect:/board/board_list";
		return "redirect:/board/board_modify";
	}

	@PostMapping("/board_remove")
	public String removeGet(int boardNo) {
		if (service.remove(boardNo))
			return "redirect:/board/board_list";
		return "redirect:/board/board_read";
	}
}
