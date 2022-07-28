package com.solmarket.mapper;

import java.util.List;

import com.solmarket.dto.AuthDTO;
import com.solmarket.dto.BoardDTO;
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
	public int getUserCount();
	public List<AuthDTO> getAuthRequest();
	// User Detail
	public UserDTO getUserDetail(int userNo);
	// delete UserData
	public int deleteUserData(int userNo);
	public int accessAuth(String userId);
	public int deleteAuth(String userId);
	
	
	// Market Request List
	public List<MarketDTO> getreqMakretList(Criteria cri);
	public int getMarketCount();
	public int accessMarket(int marketNo);
	public int refuseMarket(int marketNo);
	
	// Notice Request Count
	public List<NoticeDTO> getreqNoticeList(Criteria cri);
	public int getNoticeCount();
	public int accessNotice(int noticeNo);
	public int refuseNotice(int noticeNo);
	
	// Manage Board ( Board / Reply / Review )
	public List<BoardDTO> getBoardList(Criteria cri);
	public int getBoardCount();
	public int deleteBoard(int boardNo);
}
