package com.solmarket.mapper;

import java.util.List;
import com.solmarket.dto.*;

public interface AttachMapper {
	
	/* ====================== 회원 프로필 이미지 등록 ====================== */
	public int userInsertImg(AttachDTO attachDto);
	
	/* ====================== 장터 등록 시 장터 이미지 삽입 ====================== */
	public int insertMarketImg(AttachDTO attachDTO);
	
	/* ====================== 장터 승인 후 셀러 모집 이미지 삽입 ====================== */
	public int insertRecruitImg(AttachDTO attachDTO);
	
	/* ================= 장터 이미지 불러오기 ================= */
	public List<AttachDTO> selectMarketImg(int marketNo);
	
	/* ================= 상품 이미지 불러오기 ================= */
	public List<AttachDTO> selectProductImg(int productNo);
}