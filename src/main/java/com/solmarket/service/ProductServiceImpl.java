package com.solmarket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.solmarket.dto.Criteria;
import com.solmarket.dto.MarketDTO;
import com.solmarket.dto.ProductDTO;
import com.solmarket.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper mapper;
	
	
	@Override
	public boolean insert(ProductDTO productDto) {
		//불린값으로 리턴, 0보다 크면 true, 작으면 false
		return mapper.insert(productDto) > 0;		
	}


	@Override
	public String userName(int userNo) {
		
		return mapper.userName(userNo);
	}

	//리스트 보여주기
	@Override
	public List<ProductDTO> getList(Criteria cri, int userNo) {	
		return mapper.select(cri, userNo);
	}

	// 리스트에서 상품명 클릭시
	@Override
	public ProductDTO getRow(int productNo) {
		return mapper.read(productNo);
	}

	// 리스트 페이징 처리
	@Override
	public int getTotalCnt(int userNo) {
		return mapper.totalCnt(userNo);
	}

	// 상품 수정 
	@Override
	public boolean update(ProductDTO updateDto) {
		
		return mapper.update(updateDto)==1?true:false;
	}

	// 장터 이름 가져오기
	@Override
	public String marketName(int marketNo) {
		return mapper.marketName(marketNo);
	}

	// 장터 리스트 보여주기
	@Override
	public List<MarketDTO> marketList(Criteria cri, int userNo) {
		
		return mapper.marketList(cri, userNo);
	}

	// 장터 리스트 페이징
	@Override
	public int marketTotal(Criteria cri) {
		
		return mapper.marketTotal(cri);
	}


	@Override
	public List<ProductDTO> getSearchList(String productName) {
		return mapper.search(productName);
	}

}
