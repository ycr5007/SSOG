package com.solmarket.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class BoardDTO {
	private int boardNo; // 게시글번호
	private int userNo; // 글작성 회원번호 ( myUser 테이블 참조 )
	private String boardTitle; // 제목
	private String boardContent; // 내용
	private Date boardDate; // 작성일
	private int boardHit; // 조회수
	private int boardRepl; // 댓글 수
}
