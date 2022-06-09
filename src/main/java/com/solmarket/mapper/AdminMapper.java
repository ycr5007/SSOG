package com.solmarket.mapper;

import java.util.List;

import com.solmarket.dto.MarketDTO;
import com.solmarket.dto.NoticeDTO;
import com.solmarket.dto.UserDTO;

public interface AdminMapper {
	public List<UserDTO> getUserList();
	public List<MarketDTO> getRequestMarketList();
	public List<NoticeDTO> getRequestNoticeList();
	public String getUserRatio();
}
