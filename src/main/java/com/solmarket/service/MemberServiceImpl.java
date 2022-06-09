package com.solmarket.service;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.solmarket.dto.AuthDTO;
//import com.solmarket.dto.ChangeDTO;
import com.solmarket.dto.UserDTO;
import com.solmarket.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Inject
	JavaMailSenderImpl MailSender;
	
	@Override
	public boolean register(UserDTO register) {
		return mapper.insert(register)==1?true:false;
	}

	@Override
	public AuthDTO login(String userId, String userPw) {
		return mapper.login(userId, userPw);
	}

	/*
	 * @Override public boolean changePwd(ChangeDTO changeDto) { return
	 * mapper.update(changeDto)==1?true:false; }
	 */

	@Override
	public boolean leave(String userId, String userPw) {
		return mapper.delete(userId, userPw)==1?true:false;
	}

	@Override
	public String dupId(String userId) {
		return mapper.dupId(userId);
	}

	@Override
	public AuthDTO findId(String userName, String userMail) {
		return mapper.searchId(userName, userMail);
	}
	
	@Override
	public AuthDTO findPw(String userId, String userMail) {
		return mapper.searchPw(userId, userMail);
	}


	@Override
	public String authMail(String userMail) {
		Random rnd = new Random();
		int Num = rnd.nextInt(888888) + 111111;
		//log.info("인증번호" + Num);
		
		String sub = "안녕하세요. sol market 인증메일입니다.";
		String con = "인증 번호 = "+Num+" 입니다.";
		
		String from = "ekor11@naver.com";
		
		String to = userMail;
		
		try {
		// 메일 내용 넣을 객체와, 이를 도와주는 Helper 객체 생성
			MimeMessage message = MailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			// 메일 내용 채우기
			mailHelper.setFrom(from);		// 보내는 사람 셋팅
			mailHelper.setTo(to);			// 받는 사람 셋팅
			mailHelper.setSubject(sub);	// 제목 셋팅
			mailHelper.setText(con);	// 내용 셋팅
			
			// 메일 전송
			MailSender.send(message);
			
		} catch(Exception e) {
			e.printStackTrace();
		}			
		
		String num = Integer.toString(Num);
		
		return num;
	}

	@Override
	public String myPagePwCheck(String userPw) {
		return mapper.myPagePwCheck(userPw);
	}

	

	
}


