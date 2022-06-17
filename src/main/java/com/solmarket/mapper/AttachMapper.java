package com.solmarket.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.solmarket.dto.AttachDTO;

public interface AttachMapper {
	public AttachDTO getImg(@Param("section") String section, @Param("no") int no);
	public void insertImg(@Param("attach") AttachDTO attach, @Param("section") String section);
	
	/* ====================== 회원 프로필 이미지 등록 ====================== */
	public int userInsertImg(AttachDTO attachDto);
	
	/* ====================== 장터 등록 시 장터 이미지 삽입 ====================== */
	public int insertMarketImg(AttachDTO attachDTO);
	
	/* ====================== 장터 승인 후 셀러 모집 이미지 삽입 ====================== */
	public int insertRecruitImg(int marketNo, AttachDTO attachDTO);
	
	/* ================= 장터 이미지 불러오기 ================= */
	public List<AttachDTO> selectMarketImg(int marketNo);
	
	/* ================= 상품 이미지 불러오기 ================= */
	public List<AttachDTO> selectProductImg(int productNo);
}