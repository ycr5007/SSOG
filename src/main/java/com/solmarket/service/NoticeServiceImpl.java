package com.solmarket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.solmarket.dto.Criteria;
import com.solmarket.dto.NoticeDTO;
import com.solmarket.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeMapper noticeMapper;
	
	@Override
	public List<NoticeDTO> getNoticeList(Criteria cri) {
		return noticeMapper.getNoticeList(cri);
	}
	
	@Override
	public int getNoticeCount() {
		return noticeMapper.getNoticeCount();
	}
	
	@Override
	public NoticeDTO getReadDetail(int noticeNo) {
		return noticeMapper.getReadDetail(noticeNo);
	}
}
