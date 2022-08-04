package com.solmarket.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.solmarket.dto.Criteria;
import com.solmarket.dto.ReplyDTO;

public interface ReplyMapper {
	public int insert(ReplyDTO insertDto);
	
	public ReplyDTO read(int replyNo);
	
	public List<ReplyDTO> list(@Param("cri") Criteria cri, @Param("boardNo") int boardNo);
	
	public int getCountBoardNo(int boardNo);
	
	public int update(ReplyDTO updateDto);
	
	public int delete(int replyNo);
}
