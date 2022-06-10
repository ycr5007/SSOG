package com.solmarket.mapper;

import java.util.List;
import com.solmarket.dto.*;

public interface AttachMapper {
	
	/* ====================== 장터 등록 시 장터 이미지 삽입 ====================== */
	public int insertImg(AttachDTO attachDTO);
	
	/* ================= 장터 이미지 불러오기 ================= */
	public List<AttachDTO> selectMarketImg(int marketNo);
	
	/* ================= 상품 이미지 불러오기 ================= */
	public AttachDTO selectProductImg(int productNo);
}