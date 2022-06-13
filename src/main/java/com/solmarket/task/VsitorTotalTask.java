package com.solmarket.task;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.solmarket.mapper.VisitorMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class VsitorTotalTask {
	
	@Autowired
	private VisitorMapper mapper;
	
	@Scheduled(cron="0 0 1 * * *")
	public void visitorTotal() {
		log.info("[Scheduled] 01 시 ADMIN 페이지 방문자수 통계 데이터 이전 작업");
		int total = mapper.getTodayVisitorCount();
		mapper.visitTotalInsert(total);
		
		if(!(mapper.visitorDeleteAll() > 0)) {
			log.debug("visitor 테이블의 데이터 삭제과정 중 문제 발생");
		}
	}
}
