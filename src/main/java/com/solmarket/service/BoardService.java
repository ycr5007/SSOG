package com.solmarket.service;

import java.util.List;

import com.solmarket.dto.BoardDTO;

public interface BoardService {

		// 게시물 등록	
		public boolean register(BoardDTO register);
		public List<BoardDTO> getList();
		public BoardDTO getRow(int boardNo);
		
		
				
	
		
				
				


}