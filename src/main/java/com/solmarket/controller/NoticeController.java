package com.solmarket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.solmarket.dto.Criteria;
import com.solmarket.dto.NoticeDTO;
import com.solmarket.dto.PageDTO;
import com.solmarket.service.NoticeService;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/notice/*")
@Slf4j
@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/notice_list")
	public void noticeList(Criteria cri, Model model) {
		log.info("[GET] <<<<< Notice List 페이지 >>>>>");
		List<NoticeDTO> noticeList = noticeService.getNoticeList(cri);
		int total = noticeService.getNoticeCount();
		model.addAttribute("pageDto", new PageDTO(cri, total));
		model.addAttribute("list", noticeList);
	}
	
	@GetMapping("/notice_read")
	public void noticeRead(@ModelAttribute("cri") Criteria cri, int noticeNo, Model model) {
		log.info("[GET] <<<<< Notice Read 페이지 >>>>>");
		NoticeDTO dto = noticeService.getReadDetail(noticeNo);
		log.info("[GET] READ DATA ::::: " + dto);
		model.addAttribute("dto", dto);
	}
}
