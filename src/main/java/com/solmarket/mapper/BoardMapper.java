package com.solmarket.mapper;

import java.util.List;

import com.solmarket.dto.BoardDTO;

public interface BoardMapper {
	public int insert(BoardDTO insertDto);
	public List<BoardDTO> select();
	public BoardDTO read(int boardNo);
	

}