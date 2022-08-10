package com.solmarket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.solmarket.dto.BoardDTO;
import com.solmarket.dto.Criteria;
import com.solmarket.mapper.AttachMapper;
import com.solmarket.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper mapper;
	
	@Autowired
	private AttachMapper amapper;
	//등록 
	
	@Transactional
	@Override
	public boolean boardInsert(BoardDTO boardInsert) {
		boolean result = false;
		result = mapper.insert(boardInsert) > 0;
		
		if(!(boardInsert.getAttach().getFileName().equals("null"))) {
			amapper.insertImg(boardInsert.getAttach(), "board");
		}
		return result;
	}
	
	@Override
	public List<BoardDTO> getList(Criteria cri) {
		return mapper.select(cri);
	}
	
	@Override
	public int boardCount() {
		return mapper.boardCount();
	}
	
	@Override
	public BoardDTO getRow(int boardNo) {
		return mapper.read(boardNo);
	}
	
	@Transactional
	@Override
	public boolean modify(BoardDTO modify) {
		boolean result = false;
		result = mapper.modify(modify) > 0 ;

		return result;
	}

	@Override
	public boolean remove(int boardNo) {
		return mapper.remove(boardNo) > 0 ? true : false;
	}

	@Override
	public boolean updateHit(int boardNo) {
		return mapper.updateHit(boardNo) > 0 ? true : false;
	}




}
