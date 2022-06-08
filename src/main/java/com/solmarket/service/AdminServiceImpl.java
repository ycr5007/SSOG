package com.solmarket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.solmarket.dto.MarketDTO;
import com.solmarket.dto.NoticeDTO;
import com.solmarket.dto.UserDTO;
import com.solmarket.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminMapper adminMapper;
	// INDEX 페이지 작업
	@Override
	public List<MarketDTO> getRequestMarketList() {
		return adminMapper.getRequestMarketList();
	}
	
	@Override
	public List<NoticeDTO> getRequestNoticeList() {
		return adminMapper.getRequestNoticeList();
	}
	
	@Override
	public String getUserRatio() {
		return adminMapper.getUserRatio();
	}

	@Override
	public List<UserDTO> getUserList() {
		return adminMapper.getUserList();
	}
	
}
