package com.solmarket.service;

import java.util.List;

import com.solmarket.dto.BoardDTO;
import com.solmarket.dto.Criteria;

public interface BoardService {

		// 게시물 등록	
		public boolean boardInsert(BoardDTO boardInsert);
		public List<BoardDTO> getList(Criteria cri);
		public int boardCount();
		public BoardDTO getRow(int boardNo);
		public boolean modify(BoardDTO modify);
		public boolean remove(int boardNo);
		//public BoardDTO updateHit(int boardHit);
		public boolean updateHit(int boardNo);
}