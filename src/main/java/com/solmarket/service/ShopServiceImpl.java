package com.solmarket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.solmarket.dto.Criteria;
import com.solmarket.dto.ProductDTO;
import com.solmarket.dto.UserDTO;
import com.solmarket.mapper.ProductMapper;

@Service
public class ShopServiceImpl implements ShopService{
	
	@Autowired
	private ProductMapper mapper;
	
	@Override
	public List<String> getCategory() {
		return mapper.getCategory();
	}

	@Override
	public List<ProductDTO> getProduct(Criteria cri) {
		return mapper.getProduct(cri);
	}

	@Override
	public int getTotalCnt() {
		return mapper.totalCnt();
	}

	@Override
	public ProductDTO getDetail(int productNo) {
		return mapper.getDetail(productNo);
	}

	@Override
	public UserDTO getOrderUser(int userNo) {
		return mapper.getOrderUser(userNo);
	}

	@Override
	public ProductDTO getOrderProduct(int productNo) {
		return mapper.getOrderProduct(productNo);
	}
}
