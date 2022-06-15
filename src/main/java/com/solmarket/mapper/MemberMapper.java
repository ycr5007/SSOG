package com.solmarket.mapper;

import org.apache.ibatis.annotations.Param;

import com.solmarket.dto.AuthDTO;
//import com.solmarket.dto.ChangeDTO;
import com.solmarket.dto.UserDTO;

public interface MemberMapper {
	public int insert(UserDTO register);
	public int insertAuth(AuthDTO auth);
	
	public UserDTO read(String userId);
	
	public int updateUser(UserDTO updater);
	
	public int userStatus(String userId);
	
	public String dupMail(String userMail);
	
	public UserDTO searchId(@Param("userName") String userName,@Param("userMail") String userMail);
	
	public int delete(String userId);

	public String updatePw(String userMail);
	
	public String authMail(String userMail);
	
	public int myPage(UserDTO userDto);
	
	public String checkPw(String userId);
	
	public int reqAuth(AuthDTO auth);
	

}
