package com.solmarket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.solmarket.dto.Criteria;
import com.solmarket.dto.MarketDTO;
import com.solmarket.dto.ProductDTO;
import com.solmarket.dto.ProductListDTO;
import com.solmarket.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper mapper;
	
	// 상품 등록
	@Override
	public void insert(ProductListDTO proList) {
		//불린값으로 리턴, 0보다 크면 true, 작으면 false
		proList.getProList().forEach(product -> {
			mapper.insert(product);			
		});			
	}
	
	// 판매자 이름 가지고 오기
	@Override
	public String userName(int userNo) {
		return mapper.userName(userNo);
	}

	// 리스트 보여주기
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

	// 인덱스에서 참여 중인 장터 리스트 보여주기
	@Override
	public List<MarketDTO> mList() {
		return mapper.mList();
	}
	
	// 인덱스에서 오픈 예정인 장터 리스트 보여주기
	@Override
	public List<MarketDTO> oList() {
		return mapper.oList();
	}

	// 인덱스에서 상품 리스트 보여주기
	@Override
	public List<ProductDTO> pList() {
		return mapper.pList();
	}

	// 장터 종료 후 남은 상품 리스트 보여주기
	@Override
	public List<ProductDTO> remainList(Criteria cri, int userNo) {
		return mapper.remainList(cri, userNo);
	}

	// 장터 종료 후 남은 상품 리스트 페이징
	@Override
	public int remainTotal(int userNo) {		
		return mapper.remainTotal(userNo);
	}


	

}
