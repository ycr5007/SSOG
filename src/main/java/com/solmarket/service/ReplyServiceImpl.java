package com.solmarket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.solmarket.dto.Criteria;
import com.solmarket.dto.ReplyDTO;
import com.solmarket.dto.ReplyPageDTO;
import com.solmarket.mapper.BoardMapper;
import com.solmarket.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper mapper;
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public boolean replyInsert(ReplyDTO insertDto) {
		
		// 원본글의 replyCnt 추가
		boardMapper.updateReplyCnt(insertDto.getBoardNo(), 1);
		return mapper.insert(insertDto) > 0 ? true : false;
	}

	@Override
	public ReplyDTO read(int replyNo) {
		return mapper.read(replyNo);
	}

	@Override
	public boolean replyUpdate(ReplyDTO updateDto) {
		return mapper.update(updateDto) > 0 ? true : false;
	}

	@Override
	public boolean replyDelete(int replyNo) {
		
		ReplyDTO deleteDto = mapper.read(replyNo);
		
		boardMapper.updateReplyCnt(deleteDto.getBoardNo(), -1);
		
		return mapper.delete(replyNo) > 0 ? true : false;
	}

	@Override
	public ReplyPageDTO getList(Criteria cri, int boardNo) {
		return new ReplyPageDTO(mapper.getCountBoardNo(boardNo), mapper.list(cri, boardNo));
	}

}
