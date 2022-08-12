package com.solmarket.service;

import java.util.List;

import com.solmarket.dto.BoardDTO;
import com.solmarket.dto.Criteria;

public interface BoardService {

		// 게시물 등록	
		public boolean boardInsert(BoardDTO boardInsert);
		
		// 리스트 보여주기
		public List<BoardDTO> getList(Criteria cri);
		
		// 게시글 합
		public int boardCount();
		
		// 게시글 읽기 
		public BoardDTO getRow(int boardNo);
		
		// 게시글 수정
		public boolean modify(BoardDTO modify);
		
		// 게시글 삭제
		public boolean remove(int boardNo);
		
		// 조회수
		public boolean updateHit(int boardNo);
}