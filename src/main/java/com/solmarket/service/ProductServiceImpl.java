package com.solmarket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public List<ProductDTO> getList() {
		
		return mapper.select();
	}


	@Override
	public List<ProductDTO> getSearchList(String productName) {
		return mapper.search(productName);
	}

}
