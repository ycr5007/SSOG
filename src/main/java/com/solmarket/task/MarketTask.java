package com.solmarket.task;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import com.solmarket.mapper.MarketMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class MarketTask {

	@Autowired
	private MarketMapper mapper;
	
	/* ========================= 장터 오픈 ========================= */
	/* ====================== 장터 상태 1 → 2 ====================== */
	/* ====================== 상품 상태 1 → 3 ====================== */
	@Scheduled(cron="0 0 1 * * *")
	public void OpenMarket() {
		log.info("[Scheduled] ========== 장터 오픈 - 장터 & 상품 상태 변경 ==========");
		mapper.updateMarketOn();
		mapper.updateProductOn();
	}
	
	/* ========================= 장터 오픈 ========================= */
	/* ====================== 장터 상태 2 → 3 ====================== */
	/* ====================== 상품 상태 3 → 4 ====================== */
	@Scheduled(cron="0 0 1 * * *")
	public void CloseMarket() {
		log.info("[Scheduled] ========== 장터 종료 - 장터 & 상품 상태 변경 ==========");
		mapper.updateMarketOff();
		mapper.updateProductOff();
	}
}
