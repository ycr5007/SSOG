package com.solmarket.handler;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.solmarket.mapper.MemberMapper;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
	
	@Autowired
	private MemberMapper mapper;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
				log.info("접근");
				//부여된 권한 확인하기
				List<String> roleNames = new ArrayList<String>();
				authentication.getAuthorities().forEach(auth -> roleNames.add(auth.getAuthority()));
				
				
				log.info("roleNames "+roleNames);
				
				
				//권한이 ROLE_ADMIN 인 경우 admin-page 이동
				if(roleNames.contains("ROLE_ADMIN")) {
					response.sendRedirect("/");
					return;
				}
				//권한이 ROLE_USER 이거나 ROLE_MANAGER 라면 /board/list 컨트롤러로 이동
				if(roleNames.contains("ROLE_MEMBER") || roleNames.contains("ROLE_MANAGER")) {
					response.sendRedirect("/");
					return;
				}
				//권한이 없는 경우
				response.sendRedirect("/");
	}

}
