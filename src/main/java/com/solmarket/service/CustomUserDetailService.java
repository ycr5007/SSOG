package com.solmarket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.solmarket.dto.CustomUser;
import com.solmarket.dto.UserDTO;
import com.solmarket.mapper.MemberMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class CustomUserDetailService implements UserDetailsService {
	
	@Autowired
	private MemberMapper mapper;
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.info("[UserDetailsService] <<<<< CustomUserDetailService >>>>> ");
		log.info("[UserDetailsService] User Id 정보 : " + username);
		// username = userid
		
		UserDTO userDto = mapper.read(username);
		log.info("[UserDetailsService] 인증 정보 : " + userDto);
		
		return new CustomUser(userDto);
	}

}
