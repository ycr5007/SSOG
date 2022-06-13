package com.solmarket.dto;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

@Getter
public class CustomUser extends User  {
	private UserDTO userDto;
	
	public CustomUser(String userName, String userPw, Collection<? extends GrantedAuthority> authorities) {
		
		super(userName, userPw, authorities);
	}

public CustomUser(UserDTO userDto) {
	super(userDto.getUserId(), userDto.getUserPw(), userDto.getAuthorities().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuth()))
			.collect(Collectors.toList()));
			
			this.userDto = userDto;
}
	
}

