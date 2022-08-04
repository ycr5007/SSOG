package com.solmarket.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class ReplyDTO {

	private int replyNo;
	private int boardNo;
	private int userNo;
	private String replyContent;
	private Date replyDate;
	private String replyWriter;
}
