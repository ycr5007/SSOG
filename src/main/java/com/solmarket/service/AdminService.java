package com.solmarket.service;

import java.util.List;

import com.solmarket.dto.MarketDTO;
import com.solmarket.dto.NoticeDTO;
import com.solmarket.dto.UserDTO;

public interface AdminService {
	List<UserDTO> getUserList();
	List<MarketDTO> getRequestMarketList();
	List<NoticeDTO> getRequestNoticeList();
	String getUserRatio();
}
