package com.solmarket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.solmarket.dto.BoardDTO;
import com.solmarket.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper mapper;
	
	//등록 
	@Override
	public boolean register(BoardDTO register) {
		return mapper.insert(register) > 0;
	}
	
	@Override
	public List<BoardDTO> getList() {
		return mapper.select();
	}
	
	@Override
	public BoardDTO getRow(int boardNo) {
		return mapper.read(boardNo);
	}
	


}
