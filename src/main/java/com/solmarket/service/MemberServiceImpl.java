package com.solmarket.service;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.solmarket.dto.AuthDTO;
//import com.solmarket.dto.ChangeDTO;
import com.solmarket.dto.UserDTO;
import com.solmarket.mapper.MemberMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;

	@Autowired
	private BCryptPasswordEncoder encoder;

	@Inject
	JavaMailSenderImpl MailSender;

	@Transactional // 성공시 commit, 에러시 rollback
	@Override
	public boolean register(UserDTO register) {

		register.setUserPw(encoder.encode(register.getUserPw()));

		boolean result = mapper.insert(register) > 0;
		mapper.insertAuth(new AuthDTO(register.getUserId(), "ROLE_USER"));

		return result;
	}

	/*
	 * @Override public boolean changePwd(ChangeDTO changeDto) { return
	 * mapper.update(changeDto)==1?true:false; }
	 */

	@Transactional
	@Override
	public boolean updateUser(UserDTO updateUser,@RequestParam("authority") String authority) {

		//log.info(authority);

		updateUser.setUserPw(encoder.encode(updateUser.getUserPw()));
		boolean result = mapper.updateUser(updateUser) > 0;
		mapper.updateUser(updateUser);
	
		return result;
			
		}
		
	

	@Override
	public int delete(String userId) {
		return mapper.delete(userId);
	}

	@Override
	public String dupMail(String userMail) {
		return mapper.dupMail(userMail);
	}

	@Override
	public UserDTO findId(String userName, String userMail) {
		return mapper.searchId(userName, userMail);
	}

	@Override
	public String authMail(String userMail) {
		Random rnd = new Random();
		int Num = rnd.nextInt(888888) + 111111;
		// log.info("인증번호" + Num);

		String sub = "안녕하세요. sol market 인증메일입니다.";
		String con = "인증 번호 = " + Num + " 입니다.";

		String from = "ekor11@naver.com";

		String to = userMail;

		try {
			// 메일 내용 넣을 객체와, 이를 도와주는 Helper 객체 생성
			MimeMessage message = MailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(message, true, "UTF-8");

			// 메일 내용 채우기
			mailHelper.setFrom(from); // 보내는 사람 셋팅
			mailHelper.setTo(to); // 받는 사람 셋팅
			mailHelper.setSubject(sub); // 제목 셋팅
			mailHelper.setText(con); // 내용 셋팅

			// 메일 전송
			MailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		String num = Integer.toString(Num);

		return num;
	}

	@Override
	public String checkPw(String userId) {
		return mapper.checkPw(userId);
	}

	@Override
	public String pwMail(String userMail) {
		// 인증번호 생성기
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 10; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}

		String sub = "안녕하세요. sol market 인증메일입니다.";
		String con = "임시비밀번호 = " + temp + " 입니다.";

		String from = "ekor11@naver.com";

		String to = userMail;

		try {
			// 메일 내용 넣을 객체와, 이를 도와주는 Helper 객체 생성
			MimeMessage message = MailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(message, true, "UTF-8");

			// 메일 내용 채우기
			mailHelper.setFrom(from); // 보내는 사람 셋팅
			mailHelper.setTo(to); // 받는 사람 셋팅
			mailHelper.setSubject(sub); // 제목 셋팅
			mailHelper.setText(con); // 내용 셋팅

			// 메일 전송
			MailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return temp.toString();
		}

	@Override
	public String updatePw(String userMail) {
		return mapper.updatePw(userMail);
	}

	@Override
	public int reqAuth(AuthDTO authDto) {
		return mapper.reqAuth(authDto);
	}

}
