package com.solmarket.mapper;

import java.util.List;

import com.solmarket.dto.Criteria;
import com.solmarket.dto.MarketDTO;
import com.solmarket.dto.NoticeDTO;
import com.solmarket.dto.UserDTO;

public interface AdminMapper {
	// adminIndex Page 호출 데이터
	public List<MarketDTO> getRequestMarketList();
	public List<NoticeDTO> getRequestNoticeList();
	public String getUserRatio();

	// User List 
	public List<UserDTO> getUserList(Criteria cri);
	public int getUserCount(Criteria cri);
	// User Detail
	public UserDTO getUserDetail(int userNo);
	// delete UserData
	public int deleteUserData(int userNo);
	
	
	// Market Request List
	public List<MarketDTO> getreqMakretList(Criteria cri);
	public int getMarketCount();
}
