package com.solmarket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.solmarket.dto.AuthDTO;
import com.solmarket.dto.BoardDTO;
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
	public int getUserCount() {
		return adminMapper.getUserCount();
	}
	
	@Override
	public List<AuthDTO> getAuthRequest() {
		return adminMapper.getAuthRequest();
	}
	
	@Override
	public UserDTO getUserDetail(int userNo) {
		return adminMapper.getUserDetail(userNo);
	}
	
	@Override
	public boolean deleteUserData(int userNo) {
		return adminMapper.deleteUserData(userNo) > 0 ? true : false;
	}
	
	@Transactional
	@Override
	public boolean accessAuth(String userId) {
		boolean result = adminMapper.accessAuth(userId) > 0;
		result = adminMapper.deleteAuth(userId) > 0;
		return result;
	}
	
	@Override
	public boolean deleteAuth(String userId) {
		return adminMapper.deleteAuth(userId) > 0;
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
	@Override
	public boolean accessMarket(int marketNo) {
		return adminMapper.accessMarket(marketNo) > 0;
	}
	@Override
	public boolean refuseMarket(int marketNo) {
		return adminMapper.refuseMarket(marketNo) > 0;
	}
	
	// noticeRequest 페이지
	@Override
	public List<NoticeDTO> getreqNoticeList(Criteria cri) {
		return adminMapper.getreqNoticeList(cri);
	}
	@Override
	public int getNoticeCount() {
		return adminMapper.getNoticeCount();
	}
	
	@Override
	public boolean accessNotice(int noticeNo) {
		return adminMapper.accessNotice(noticeNo) > 0;
	}
	
	@Override
	public boolean refuseNotice(int noticeNo) {
		return adminMapper.refuseNotice(noticeNo) > 0;
	}
	
	// 게시판 관리, Board List
	@Override
	public List<BoardDTO> getBoardList(Criteria cri) {
		return adminMapper.getBoardList(cri);
	}
	
	@Override
	public int getBoardCount() {
		return adminMapper.getBoardCount();
	}
	@Override
	public boolean deleteBoard(int boardNo) {
		return adminMapper.deleteBoard(boardNo) > 0;
	}
}
