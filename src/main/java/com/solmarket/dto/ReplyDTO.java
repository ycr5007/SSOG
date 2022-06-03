package com.solmarket.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReplyDTO {
	private int replyNo; // 댓글 번호
	private int userNo; // 회원 번호 ( myUser 테이블 참조 )
	private int boardNo; // 게시글 번호 ( board 테이블 참조 )
	private String replyContent; // 댓글 내용
	private Date replyDate; // 댓글 작성일
}
