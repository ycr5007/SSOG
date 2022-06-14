package com.solmarket.mapper;

import org.apache.ibatis.annotations.Param;

import com.solmarket.dto.AuthDTO;
//import com.solmarket.dto.ChangeDTO;
import com.solmarket.dto.UserDTO;

public interface MemberMapper {
	public int insert(UserDTO register);
	public int insertAuth(AuthDTO auth);
	public UserDTO read(String userId);
	
	
	public String dupId(String userId);
	
	public UserDTO searchId(@Param("userName") String userName,@Param("userMail") String userMail);
	
	public UserDTO searchPw(@Param("userId") String userId, @Param("userMail") String userMail);
	
	//public int update(ChangeDTO changeDto);
	
	public int delete(@Param("userId") String userId,@Param("userPw") String userPw);

	public String updatePw(AuthDTO authPw);
	
	public String authMail(String userMail);
	
	public int myPage(UserDTO userDto);
	
	public String myPagePwCheck(String userPw);
	

}
