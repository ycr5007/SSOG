package com.solmarket.dto;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CustomUser extends User  {
	
	private static final long serialVersionUID = 1L;
	
	private UserDTO userDto;
	
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		
		super(username, password, authorities);
	} // username, password, authorities -> User 라는놈으로 넘김)

	public CustomUser(UserDTO userDto) {
		super(userDto.getUserId(), userDto.getUserPw(), userDto.getAuthorities().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuthority()))
			.collect(Collectors.toList()));
			
			this.userDto = userDto;
	}

}

