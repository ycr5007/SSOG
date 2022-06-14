package com.solmarket.service;

import java.util.List;

import com.solmarket.dto.Criteria;
import com.solmarket.dto.MarketDTO;
import com.solmarket.dto.NoticeDTO;
import com.solmarket.dto.UserDTO;

public interface AdminService {
	// 방문자 처리 Service
	boolean visitInsert(String sessionId);
	String dupSession(String sessionId);
	List<Integer> getVisitorTotal();

	
	// ADMIN 관리 Service
	// Index Page
	List<MarketDTO> getRequestMarketList();
	List<NoticeDTO> getRequestNoticeList();
	String getUserRatio();
	
	// User Page
	List<UserDTO> getUserList(Criteria cri);
	int getUserCount(Criteria cri);
	// User Detail
	UserDTO getUserDetail(int userNo);
	boolean deleteUserData(int userNo);
	
	// Market Request List
	List<MarketDTO> getreqMakretList(Criteria cri);
	int getMarketCount();
	
}
