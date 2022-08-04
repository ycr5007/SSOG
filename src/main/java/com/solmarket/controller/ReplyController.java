package com.solmarket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.solmarket.dto.Criteria;
import com.solmarket.dto.ReplyDTO;
import com.solmarket.dto.ReplyPageDTO;
import com.solmarket.service.ReplyService;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/replies/*")
@Slf4j
@RestController // 보여주는 페이지 없음
public class ReplyController {
	
	@Autowired
	private ReplyService service;
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(path="/new")
	public ResponseEntity<String> create(@RequestBody ReplyDTO insertDto){
		log.info("댓글 입력 요청");
		log.info("" + insertDto);
		return service.replyInsert(insertDto) ? 
				new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 댓글 리스트 : /replies/pages/bno/page + GET
	@GetMapping(value="/pages/{boardNo}/{page}")
	public ResponseEntity<ReplyPageDTO> list(@PathVariable("boardNo") int boardNo, @PathVariable("page") int page){
		log.info("[GET] 댓글 리스트 요청 >> " + boardNo + "\t" + page);
		Criteria cri = new Criteria(page, 10);
		
		return new ResponseEntity<ReplyPageDTO>(service.getList(cri, boardNo), HttpStatus.OK);
	}
	
	@GetMapping(value="/{replyNo}")
	public ResponseEntity<ReplyDTO> get(@PathVariable("replyNo") int replyNo){
		log.info("" + replyNo);
		
		ReplyDTO dto=service.read(replyNo);
		
		System.out.println("============= > "+dto);
		
		return new ResponseEntity<ReplyDTO>(dto, HttpStatus.OK);
	}
	
	// 댓글 수정
	@PreAuthorize("principal.username == #updateDto.replyWriter")
	@PutMapping(path = "/{replyNo}")
	public ResponseEntity<String> update(@PathVariable("replyNo") int replyNo, @RequestBody ReplyDTO updateDto){
		log.info("[PUT] Update Reply" + replyNo + "\t" + updateDto);
		updateDto.setReplyNo(replyNo);
		return service.replyUpdate(updateDto) ? 
				new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
	}
	
	// 댓글 삭제
	@PreAuthorize("principal.username == #deleteDto.replyWriter")
	@DeleteMapping(path = "/{replyNo}")
	public ResponseEntity<String> delete(@PathVariable("replyNo") int replyNo, @RequestBody ReplyDTO deleteDto){
		log.info("[DELETE] Delete Reply >> " + replyNo);
		return service.replyDelete(replyNo) ? 
				new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
	}
	
}
