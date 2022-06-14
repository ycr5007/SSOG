package com.solmarket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.solmarket.dto.Criteria;
import com.solmarket.dto.MarketDTO;
import com.solmarket.dto.NoticeDTO;
import com.solmarket.dto.UserDTO;
import com.solmarket.mapper.AdminMapper;
import com.solmarket.mapper.VisitorMapper;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminMapper adminMapper;
	@Autowired
	private VisitorMapper visitorMapper;
	
	// 방문자 처리
	@Override
	public boolean visitInsert(String sessionId) {
		return visitorMapper.visitInsert(sessionId) > 0;
	}
	
	@Override
	public List<Integer> getVisitorTotal() {
		return visitorMapper.getVisitorTotal();
	}
	
	@Override
	public String dupSession(String sessionId) {
		return visitorMapper.dupSession(sessionId);
	}
	
	// 관리자 페이지 전반 
	// INDEX 페이지
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

	// user 페이지
	@Override
	public List<UserDTO> getUserList(Criteria cri) {
		return adminMapper.getUserList(cri);
	}
	
	@Override
	public int getUserCount(Criteria cri) {
		return adminMapper.getUserCount(cri);
	}
	
	@Override
	public UserDTO getUserDetail(int userNo) {
		return adminMapper.getUserDetail(userNo);
	}
	
	@Override
	public boolean deleteUserData(int userNo) {
		return adminMapper.deleteUserData(userNo) > 0 ? true : false;
	}
	
	// marketRequest 페이지
	@Override
	public List<MarketDTO> getreqMakretList(Criteria cri) {
		return adminMapper.getreqMakretList(cri);
	}
	@Override
	public int getMarketCount() {
		return adminMapper.getMarketCount();
	}
	
}
