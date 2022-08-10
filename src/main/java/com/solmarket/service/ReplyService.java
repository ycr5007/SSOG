package com.solmarket.service;

import com.solmarket.dto.Criteria;
import com.solmarket.dto.ReplyDTO;
import com.solmarket.dto.ReplyPageDTO;

public interface ReplyService {
	public boolean replyInsert(ReplyDTO insertDto);
	public ReplyDTO read(int replyNo);
	public ReplyPageDTO getList(Criteria cri, int boardNo);
	public boolean replyUpdate(ReplyDTO updateDto);
	public boolean replyDelete(int replyNo);

}
