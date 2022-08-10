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

	// 기타정보수정
	@Transactional
	@Override
	public boolean updateUser(UserDTO updateUser) {

		//log.info(authority);

		boolean result = mapper.updateUser(updateUser) > 0;
		mapper.updateUser(updateUser);
	
		return result;
			
	}

	// 중복아이디 검사
	@Override
	public String dupId(String userId) {
		return mapper.dupId(userId);
	}
	
	// 중복메일 검사
	@Override
	public String dupMail(String userMail) {
		return mapper.dupMail(userMail);
	}

	// 아이디 찾기
	@Override
	public UserDTO findId(String userName, String userMail) {
		return mapper.searchId(userName, userMail);
	}
	
	// 가입시 인증메일 전송
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

	// 비밀번호 확인
	@Override
	public String checkPw(String userId) {
		return mapper.checkPw(userId);
	}

	// 비밀번호 변경
	@Override
	public boolean updatePw2(String userId, String userPw) {
		log.info(userPw);
		userPw = encoder.encode(userPw);
		log.info(userPw);
		return mapper.updatePw2(userId, userPw) > 0? true : false;
	}
	
	// 임시비밀번호 발급(비밀번호 찾기)
	@Override
	public boolean updatePw(String userId, String userMail, String tempPw) {
		
		String encPw = encoder.encode(tempPw);
		boolean result = mapper.updatePw(userId, encPw)==1?true:false;
		
		//임시 비밀번호 메일 전송
		String sub = "안녕하세요. sol market 인증메일입니다.";
		String con = "임시비밀번호 = " + tempPw + " 입니다. \n"
					+ " *** 마이페이지에서 비밀번호 변경을 해주세요 *** ";

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
		
		return result;
	}

	// 권한 요청(SELLER, MANAGER)
	@Override
	public int reqAuth(AuthDTO authDto) {
		return mapper.reqAuth(authDto);
	}

	// 계정 비활성화
	@Override
	public int delete(String userId) {
		return mapper.delete(userId);
	}

	

	

}
