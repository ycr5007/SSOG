package com.solmarket.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.solmarket.mapper.MemberMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
	
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		
		String userId = authentication.getName();
		int s = mapper.userStatus(userId);

		log.info(userId);

		if (s == 0) {
			request.getSession().invalidate();
			response.sendRedirect("/member/leave");
			return;

		}

		response.sendRedirect("/");
		return;
	}

}
