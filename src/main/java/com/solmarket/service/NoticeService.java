package com.solmarket.service;

import java.util.List;

import com.solmarket.dto.Criteria;
import com.solmarket.dto.NoticeDTO;

public interface NoticeService {
	List<NoticeDTO> getNoticeList(Criteria cri);
	int getNoticeCount();
	
	NoticeDTO getReadDetail(int noticeNo);
}
