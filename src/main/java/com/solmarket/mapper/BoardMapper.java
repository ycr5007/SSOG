package com.solmarket.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.solmarket.dto.BoardDTO;
import com.solmarket.dto.Criteria;

public interface BoardMapper {
	public int insert(BoardDTO insertDto);
	
	public List<BoardDTO> select(Criteria cri);
	
	int boardCount();
	
	public BoardDTO read(int boardNo);
	
	public int modify(BoardDTO modify);
	
	public int remove(int boardNo);
	
	public int updateHit(int boardNo);
	
	
	// 트랜잭션 처리 (reply & board 두개의 테이블 작업이 한번에 이루어짐 -> 작업을 묶어주자)
	public int updateReplyCnt(@Param("boardNo") int boardNo, @Param("amount") int amount);
	
}